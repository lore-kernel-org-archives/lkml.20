Received: from mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9AE3B3887
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507275; cv=none; b=FI8JrAU3lD4T3r3IT648oiHsRcYuVXFied8pirguEqG3Y0MOofStc3nspOrtNn+nBWHTLr8TdMFT+ZfDSrqZWoKwMbiWd5njcocKoiJ6sHXVUl8lhptH5AHYztmkSwtZA2rhLPFlDibYOwIHpZKJW6Z2NWFiSIfnx7XEqUMYACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507275; c=relaxed/simple;
	bh=LY8f5W+7LtN+ULoAR4gplhH8mdUjEyFtTXcvRCeW2vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uhpFxZTRvry7S1p8TxgAuAbXa3q1L+63UydGMXzmZ32gXtA2YxeRZm6vOz1EBjAB6ejcxH+/90frJ0EQOqKe+xHftYne4xpxiJUgmzJ+Et56oLnpg6AqFeLyt0j1y5BzTq2TGijOLK8urFzIiZvOLjxaKyUuf3fE/HK7YLzopdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hQ8zj9Dq; arc=none smtp.client-ip=91.218.175.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hQ8zj9Dq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LY8f5W+7LtN+ULoAR4gplhH8mdUjEyFtTXcvRCeW2vQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788507268; v=1; x=1789112068;
 b=hQ8zj9DqFIF1gQmMHDN3m1U5zGjJxnSpPsbYEToXy0m6ZilADEDZVdBNYFi/Vxo771ZWQhQx
 ou8M6itLa33BrS8R3cduUrDLye+v86vQTr2va9z2hTB5wIadRB33RLneVJOBhTd/5spl569cD2a
 sgFMbLc8YVy+oMwzKJS6LIyA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2187e54158d3cfa3;
	Fri, 04 Sep 2026 07:34:28 +0000
X-Mizu-Trace-ID: 2187e54158d3cfa3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] of/irq: Fix device node refcount leak in of_check_msi_parent()
Date: Fri,  4 Sep 2026 08:34:24 +0100
Message-Id: <20260904073424.3855365-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_msi_xlate() documents @msi_np as a filter when it points at a node on
entry, handing back a reference only when it points at NULL. The msi-map
branch does that. of_check_msi_parent() keeps the reference from the 1:1
msi-parent match either way.

pci_msi_domain_get_msi_rid() is the only caller that passes a node in,
from irq_domain_get_of_node(), and it puts nothing, so a 1:1 match there
leaks the MSI controller node.

Fixes: 119aaeed0b67 ("of/irq: Add msi-parent check to of_msi_xlate()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260826113604.010C01F000E9@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index ec035367c9500..109c54f346479 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -785,7 +785,7 @@ static int of_check_msi_parent(struct device_node *dev_node, struct device_node
 	if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
 		ret = -EINVAL;
 
-	if (!ret) {
+	if (!ret && !*msi_node) {
 		/* Return with a node reference held */
 		*msi_node = msi_spec.np;
 		return 0;
-- 
2.39.5


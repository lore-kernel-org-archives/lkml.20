Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F882478E28
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780591; cv=none; b=FtigI+t1vddspuTpzC1l0lu12Ri0/C1WoZHGasQ/i16HHuDWGRMJig9OfOgLaTRktZOMkAKiQacvozZknG95mF6dKknarpINB+pY+9UxOvVBYqnDj4ODU1CL3Qj+2V+UWM6N/IJeuXPHIfesrRTuqngoNEURtHtvNm7qq5ibPI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780591; c=relaxed/simple;
	bh=LY8f5W+7LtN+ULoAR4gplhH8mdUjEyFtTXcvRCeW2vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iJFcqVfES03/cLF+4gDXRq0oUy1CJJuayRUPErwqhDY2hJzHR7tHrJRIukmjCh+gq8JmJlbrH3cOFuFSkju6xO4oMPtcPVcjo5wnVu4UeRZs5OQR6EGsGkfUHSL06wdB1lbLEIgDX/T+bU+DG/MaKyZpCf24mb3/Zjxs5IVbdBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fw2xYGur; arc=none smtp.client-ip=91.218.175.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fw2xYGur"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LY8f5W+7LtN+ULoAR4gplhH8mdUjEyFtTXcvRCeW2vQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780585; v=1; x=1789385385;
 b=fw2xYGur5kCu6Ky133rHjgXorvmoALFi4SlFbmh0xCNKQ/+rmuBH1SbTWBD4IyXplRjcfVtW
 9nhY8pbkdajxxwOTq5fxJ1HNzryhhHDpKRRYK2NOIZPM/10UXZ/zsUvqvBV0DJhv8j92qc7DSvR
 F92BHs/wWsMR1LfxISeR5IqI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 53aaa3b61bc4a5bb;
	Mon, 07 Sep 2026 11:29:45 +0000
X-Mizu-Trace-ID: 53aaa3b61bc4a5bb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 1/2] of/irq: Fix device node refcount leak in of_check_msi_parent()
Date: Mon,  7 Sep 2026 12:29:43 +0100
Message-Id: <20260907112944.313618-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907112944.313618-1-fuad.tabba@linux.dev>
References: <20260907112944.313618-1-fuad.tabba@linux.dev>
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


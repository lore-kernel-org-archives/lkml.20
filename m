Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E126481647
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780594; cv=none; b=iTKjyPEh3asBJ9zqbOlTqimYuXSnztMrLj54/49xPr2cQJh8e4HlWq67dAsQ4gc/MfM7DRlaO5tGRtg+bGm6kWV5JAcqbHNGi7r+BaoDw7n8jf56nPvdpIoupx9D5zSF0vSh7Lmd/8klBAziBJuIsvhwx9QTlJwlsDlMLhsCMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780594; c=relaxed/simple;
	bh=DH0dhnvrGGp1OhcToP/g9auuMMGs5pz0YsJKFky3mUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yhv6CthyNvyET9pVGDteq+kJu9zDDrshxJmntVa8l4fgBQDoFXEYooozxKn2EDPXnzlYMXBFIVsLbcPiaMFYTLFG8PR0xENfIYuSXOoyLCT1cQVmgqHZ3K9wpikPhdit/dbh0drnQ7eTzj00KB+moS/c/lgPezEkvvZ2cYgbxQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Db7bqLLM; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Db7bqLLM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DH0dhnvrGGp1OhcToP/g9auuMMGs5pz0YsJKFky3mUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780590; v=1; x=1789385390;
 b=Db7bqLLM78j7w3bq7aTgXgWcWm7FPtGjCEByUAnyZHUijUS6fEulDGM6XW8jRH0f/L29M8lb
 PMeK+IIkuhh3oOFxpN0hUGjaj1Dm43ZzZ0Q3P/Xs/bmOqxaYx7ixb6VOuF+hZgTqgrmnbTgp0Ky
 c1Cg2XX/nDwKTjyQPIjzFlNw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a5be2b23aafc5b9;
	Mon, 07 Sep 2026 11:29:50 +0000
X-Mizu-Trace-ID: 7a5be2b23aafc5b9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 2/2] of/irq: Stop the MSI walk at the first msi-parent
Date: Mon,  7 Sep 2026 12:29:44 +0100
Message-Id: <20260907112944.313618-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907112944.313618-1-fuad.tabba@linux.dev>
References: <20260907112944.313618-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

of_check_msi_parent() returns -EINVAL both when the msi-parent names a
controller other than the one the caller filters on and when #msi-cells
isn't 0, so of_msi_xlate() can't tell the two apart and carries on up
the hierarchy. An ancestor's msi-map then maps the device onto a
controller its own node didn't name.

Hand the parsed specifier back to of_msi_xlate(), which owns the
reference as it already does on the msi-map path, and end the walk at
any node that declares an msi-parent.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260904074800.875391F00A3F@smtp.kernel.org/
Suggested-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Link: https://lore.kernel.org/all/apqnaNmeuUjfC8Ng@red-moon/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/of/irq.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 109c54f346479..4fbbd13f4d0a8 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -765,34 +765,27 @@ void __init of_irq_init(const struct of_device_id *matches)
 	}
 }
 
-static int of_check_msi_parent(struct device_node *dev_node, struct device_node **msi_node)
+static int of_check_msi_parent(struct device_node *dev_node, struct device_node **msi_node,
+			       struct of_phandle_args *msi_spec)
 {
-	struct of_phandle_args msi_spec;
 	int ret;
 
 	/*
 	 * An msi-parent phandle with a missing or == 0 #msi-cells
 	 * property identifies a 1:1 ID translation mapping.
 	 *
-	 * Set the msi controller node if the firmware matches this
-	 * condition.
+	 * @msi_spec keeps a reference to the target node whenever the
+	 * phandle parses, -EINVAL included, and the caller releases it.
 	 */
 	ret = of_parse_phandle_with_optional_args(dev_node, "msi-parent", "#msi-cells",
-						  0, &msi_spec);
+						  0, msi_spec);
 	if (ret)
 		return ret;
 
-	if ((*msi_node && *msi_node != msi_spec.np) || msi_spec.args_count != 0)
-		ret = -EINVAL;
+	if ((*msi_node && *msi_node != msi_spec->np) || msi_spec->args_count != 0)
+		return -EINVAL;
 
-	if (!ret && !*msi_node) {
-		/* Return with a node reference held */
-		*msi_node = msi_spec.np;
-		return 0;
-	}
-	of_node_put(msi_spec.np);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -806,7 +799,9 @@ static int of_check_msi_parent(struct device_node *dev_node, struct device_node
  * @id_in: Device ID.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
- * or "msi-parent" property. If found, apply the mapping to @id_in.
+ * or "msi-parent" property. If found, apply the mapping to @id_in. With
+ * @msi_np non-NULL, a device declaring an msi-parent ends the walk, usable
+ * or not.
  *
  * Returns: The mapped MSI id.
  */
@@ -821,6 +816,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
 		struct of_phandle_args msi_spec = {};
+		int ret;
 
 		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
 			if (msi_spec.np) {
@@ -835,8 +831,17 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 			break;
 		}
 		/* -ENODEV: msi-map absent → check for msi-parent */
-		if (msi_np && !of_check_msi_parent(parent_dev->of_node, msi_np))
+		if (!msi_np)
+			continue;
+
+		ret = of_check_msi_parent(parent_dev->of_node, msi_np, &msi_spec);
+		if (msi_spec.np) {
+			/* A declared msi-parent names the controller, usable or not */
+			if (!ret && !*msi_np)
+				*msi_np = of_node_get(msi_spec.np);
+			of_node_put(msi_spec.np);
 			break;
+		}
 	}
 	return id_out;
 }
-- 
2.39.5


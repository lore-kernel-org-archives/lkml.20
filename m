Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DE18DB2A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226171; cv=none; b=t5PasmYkI1SZti8LrQPEUAnxSMh0Kj5CwMEaijUNQfw+AKRSNPPSk7I4OHjLaXKqdfwLodHdxKpvtt4AvAVO3FlvQeW5Rz+OnD16F89Z9DpCAB2oiCbVPwKpttAss4VNsiOLLuel2QXJpMf61u9XBjol+xUJu8jqASuD5oX6FWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226171; c=relaxed/simple;
	bh=i+iwVi9KMRy/SRzPz0dFMHY5QfWjU3ehExfRWdvyWCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awBzQNQC1SkvCGjPM/Y99eKJsrjbKL4atBZpcas8O0kqfIfywutTCOFqttLjVk/daKvLxQTEBlAxroWy29A9yF4KzCATvquuCzZtAV119RwaApOqzIeHDXeygHcYGub3AMBU+lkBvqYIbZloum99lS+P74Zh1Z6xAYWIf6knFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DeSEGmrj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DeSEGmrj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5cad1a6baso39738485ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226169; x=1788830969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUT2qIYHjpXWpwH1J8XuYKZa+9kxUUZTpxZC6ZkH8Ds=;
        b=DeSEGmrjmeIpGGwqrXABSvCWGqPSZrHn2OMSgiCHFoRBmkAkB+1D4N/h4OdfkHmvl6
         IU87FTkiz8x0IDp7Cp6M3RIS24XTT1FSO7x/TSShR0BcSei4kgoeAXytJx7V/GRmBnzj
         so4MvINNskAYOfMxWM2wX14crBOhwfG1GlUAapMVR/9Iyo2AC4eA3ZAjIWsIEtBw8YgO
         YmEwbX6zJT3xUTVIiF+6kXZOihJa1SYLH06wWdSM1HlusVH1HvxhEoTzs6AiDwgpSbKn
         1pN/UQHlE25xa8v4U0NkOv/h30XHtfT20G1PLL2uHsApyzJ883oMm2wdBEW8FcECvFG9
         WlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226169; x=1788830969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUT2qIYHjpXWpwH1J8XuYKZa+9kxUUZTpxZC6ZkH8Ds=;
        b=RDC7rEzvnM0Dly5VqpLASVmeqn7BLK75l9sIMZID/T9fpjInA/yu81FgmpWIXS2VPc
         s8J5RdPHxG5GjSKTONDhyIpbwB4fVI5iSZGRK24GpIiIW+YgX50KASwazM/0kHrm74Ow
         MhXzuu7bVbn+q1SUNdE+OGENqASZ0MAn2X9AAWFApXdWFQkoFIDfZ2gTSjjROSmhD+A8
         Inam8P+eV6v12JiLbAC8z8dPKFnISc6FzFOOfbQ/36+xj7wb7S2VSnI49vmvF2oZuhYR
         ixjOq3O8rBmsuzvNbot3/HSHzM9jBsMXwcksE9FfGHFt/fWvzGo6fQKRKzq5sj0ImoVN
         fRXw==
X-Forwarded-Encrypted: i=1; AKwUvBwpFiM9FAMxjaNfQob+8xA4Y/pdf3HVk4m9s9ZXOtcwd2utmTG2h7mY5EGTj/JjzO1QLy5s4B4JSlGwaXo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIOGuIM3QNWyCnKX9sLncXSE7AsUYyMkGarKWS3xQDt8g1ESnA
	PG22oZQogOnTZiw/Tvo3S+NihlZCu56CdN3luQtzYGx8EjoevR1Hfe43KKKVT4HSWxk=
X-Gm-Gg: AYBFou29gaJEn9TEtRnck6NAa1SAXRBUBhTReL+uZfPoIjWhHDmqf/92FocH4o30Sj4
	dPl3Dvv4jMODORIcKSpIOLbFUCEnq72l5xoerQDfG/k2AMFhqr0jSIrKhu0bbecvlLsKBH1vYU0
	I21vSRRoPrI1c0/5D+Xu3+AP7Cm+1WcxWdnFzYNwg1Oz7d051YqO3Pm8WnKkU0K389KiiTzUMgS
	M3IArZSFI03/9TaB2JTNFt7H8/6RZwc/HMbQFK3iDJlvMYBw7izY2lushuHSP8ZwDhme8/2efuh
	v0aA4386Hfzdb4XJxdmFnDWRkNeMWeWHtNXqu+sYL6o9OoAIJW40hTXAaRcUNqQMtyQ2dGBdjEX
	WL/Kk1QVY5vQbOEE0fZCemCtgcCfTjOhMOl9OuErRqDnIdiAUtGUwn0GNZeeoi2CWzpmD3ejE0y
	bQ7x8W2ILNwUFJffO+4ooNevaO5aCc2X2ny0T6jgo3C18QNhHYhdkeS6qmdFROuNk=
X-Received: by 2002:a17:90b:39a3:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39907d659e6mr5963354a91.12.1788226168597;
        Mon, 31 Aug 2026 18:29:28 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:27 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:21 -0700
Subject: [PATCH v7 03/10] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-3-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=3883;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=i+iwVi9KMRy/SRzPz0dFMHY5QfWjU3ehExfRWdvyWCg=;
 b=fGoY5kqjFOHUBx3oflOqjwJk2wJqqeVBud53A45eDFKq+qsDbtsEs8qzUe+ydOswCaZGFRM0o
 jPuzn1QvxLiDfm12tMXBFTi1mIQVqVTsUkuxxvpkBKCyV1s8+CtHlyv
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

find_target() with a non-NULL target base concatenates the base path
and the fragment's target-path via "%pOF%s": target-path="/foo"
resolves to "<base>/foo" and can never reach the DT root. An overlay
applied with a base cannot both extend the base subtree and add
/aliases entries, which is what a PCI device declaring its
peripherals under dev_of_node() needs for alias-based bus numbering.

Treat any non-empty target-path as absolute. An empty target-path
still means the base itself, the only form used by the one in-tree
caller passing a base (drivers/misc/lan966x_pci.c).

Spell the contract out in the kernel-doc for @base/@target_base and
in find_target()'s strategy comment.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d5351746be..74aea704835a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -688,12 +688,15 @@ static int build_changeset(struct overlay_changeset *ovcs)
  *
  * 1) "target" property containing the phandle of the target
  * 2) "target-path" property containing the path of the target
+ *
+ * With a non-NULL @target_base, an empty "target-path" means
+ * @target_base itself; any non-empty "target-path" is resolved
+ * absolutely from the live-tree root.
  */
 static struct device_node *find_target(const struct device_node *info_node,
 				       const struct device_node *target_base)
 {
 	struct device_node *node;
-	char *target_path;
 	const char *path;
 	u32 val;
 	int ret;
@@ -709,23 +712,14 @@ static struct device_node *find_target(const struct device_node *info_node,
 
 	ret = of_property_read_string(info_node, "target-path", &path);
 	if (!ret) {
-		if (target_base) {
-			target_path = kasprintf(GFP_KERNEL, "%pOF%s", target_base, path);
-			if (!target_path)
-				return NULL;
-			node = of_find_node_by_path(target_path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, target_path);
-			}
-			kfree(target_path);
-		} else {
-			node =  of_find_node_by_path(path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, path);
-			}
-		}
+		/* an empty target-path means the target base itself */
+		if (target_base && path[0] == '\0')
+			return of_node_get((struct device_node *)target_base);
+
+		node = of_find_node_by_path(path);
+		if (!node)
+			pr_err("find target, node: %pOF, path '%s' not found\n",
+			       info_node, path);
 		return node;
 	}
 
@@ -737,7 +731,9 @@ static struct device_node *find_target(const struct device_node *info_node,
 /**
  * init_overlay_changeset() - initialize overlay changeset from overlay tree
  * @ovcs:		Overlay changeset to build
- * @target_base:	Point to the target node to apply overlay
+ * @target_base:	Target for fragments with an empty "target-path";
+ *			fragments with a non-empty "target-path" resolve
+ *			absolutely and ignore @target_base
  *
  * Initialize @ovcs.  Populate @ovcs->fragments with node information from
  * the top level of @overlay_root.  The relevant top level nodes are the
@@ -982,7 +978,9 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
  * @overlay_fdt:	pointer to overlay FDT
  * @overlay_fdt_size:	number of bytes in @overlay_fdt
  * @ret_ovcs_id:	pointer for returning created changeset id
- * @base:		pointer for the target node to apply overlay
+ * @base:		target for fragments with an empty "target-path";
+ *			fragments with a non-empty "target-path" resolve
+ *			absolutely and ignore @base
  *
  * Creates and applies an overlay changeset.
  *

-- 
2.54.0


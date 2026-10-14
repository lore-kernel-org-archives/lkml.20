Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8356B488764
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019855; cv=none; b=Y/GiaD51nvtUkpspFjNmocEri1XBfxte7JLnQ5aCkYYVX8zwNCh81fQpIosCMRr9pQulf8YxyWfG4EwINVKx18sf8b0lvXkY2X7Jyc6zXI9ZGlgCXUfM/KdBK0OK6FeDCnBwc4hLEJ8It+rP3jFcWj4vPTx6WdBjZUP1d9gG20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019855; c=relaxed/simple;
	bh=pSywOm7v3zoleFzCKZBplqk3+/ieubis9tF1rbSP1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEDYcd7g0T9zGn5RaNNEnsn3PerooFLA3hZKRg1pI/hxQFUIBo7vapsQ+Tlkr8yHeFpQ+DXRE9BeCsVN5vPTIW+QoKQH0gbhnAkKrQV2F51JinHCGr1wR82qkLWn4vwiDqo/pgvn3Qidlv+ZPrUN4rVpmmyxIz3GFcCFbvaZmtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HFjwhNje; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HFjwhNje"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so10844228eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019854; x=1792624654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOxn0gBTT4uJ6iLSDEUnXIMtUCHd3G7FvprFqsgowjg=;
        b=HFjwhNjeVcYS1JkfvxS5Jrk39TWHd8Rls6cZZKg6n3sr2X/n3bqVYqSaIMUdbzH81T
         jcf68niOjHGYjyI032lPUJIo/66F+SdcDgGT9PI+dI8W8F+MelBb3kcLXWVRn3m+7iCI
         obrq+HjGDijQxMoCWx7x4RqloMBWy92CWZB2kpSJqjoH7eFo5B87t53ECS1cEzC3GhlI
         N8PPJqQPXP4UYqHRxbMcSUHSVslEOazy2IFQIV1keSm1o7+EqiQTWi75vybkdVUyQKrt
         R5HCr/5GIzZZbPXfDEZttBGXEodiM57KNdtV7yIYM+k7lnsJ9ZrFkkdZOlrS7VAMmDKY
         YHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019854; x=1792624654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOxn0gBTT4uJ6iLSDEUnXIMtUCHd3G7FvprFqsgowjg=;
        b=01A2fj0+sONlC1Y/Omb3MkC7qIg2TH0t7NiAvkrDb9Xtxlhxxr8UBIJLcpHR0d+ljz
         akxAAUdCYsxBS1lMPF0Y6Wf6uNwbEfbjsw9tuLHoODot84Mfy1n7jfWhY5E9ABgtflRk
         D7WEdqgFzh7aq+IlIsK5VfB1ZoZQ+9KNBrCTbfYqcw4Gs4jY422+/9qiJVp9LJoB2Z5k
         3pYybSGcdpVlSo5Zv/4S9rwWRbWrE4rQXFMHXVPbGf+Y7BVeVDwZmPeaHLZ0I0ZtcDzh
         ZdUN6g9gyU9eQCWXidtysW5MUbYJM+j84o4a9F8Gt161n9T98qEnKwaES4W2piMOAN2a
         cq6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1+/ImIbXpMehtZWT9RqOLAbpVAOUPJbv5Sx5Z3DLfVK5wTB5tbWi7LtDEognQBvzavQhEyuiimGPUnS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcX84vNbfNCb0vgLmSLEk3/xjEPhV93aciBS4Rnnz1/HPmVY8J
	snftWjJqd5DetsL4Hcfd8pCBE21Mkw3zCt2UHH++xqOpiU3T9Lo4nsYvXUodTl47S3s=
X-Gm-Gg: AYBFou3ZfU73ngA+WUMv7hbZX9bH1PhQGWXS1SojArAv4BOODUHZH6h/mTytIJTTUQV
	tE4gPNEnq9yXUUE1rw9mHU+j+puMFdL1l6LovilAsM7wTaNtudgrNI29w9X6KngmT4H+tqgX0EI
	CzLGxyJXPPImwv6bZ7ol7umKm8WxQFXxH0rSeTa6xdg+oJDFnfe8P04UDLbRt+pJYPQVe99qKlq
	yKffhH2YEM2f2aaOtF0tLfVEUSypDwv2wW42WIPfGxafkwQHRFtFnANmIpqCdO38tVpxkg0Ffg7
	wcs6FrH7+YFcCHzkYfLAJ57w1Yvbq6ABaTDAMS/DKfQFAAkHt+Sk+YugpSjAqtrHCJh4CzstysJ
	+7ihxQ5WBus/7vSthF7GwChgCD0Gj3LjYz1cHl9nKc2WpZr4DDze/VKAsDSDsVacH+YAw+iBk86
	uf6rsewACbcvY/kuCCEkgOQHPsoyvTPfWUHYMdK8uldXeraU7xcBCzQzzqdG5qduXTJNFhE9szi
	0O3opFTGlED
X-Received: by 2002:a05:693c:4146:10b0:35d:ddf2:e986 with SMTP id 5a478bee46e88-35dddf2eaf5mr4917867eec.11.1792019853529;
        Wed, 14 Oct 2026 16:17:33 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:32 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:26 -0700
Subject: [PATCH v8 1/6] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-1-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=3833;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=pSywOm7v3zoleFzCKZBplqk3+/ieubis9tF1rbSP1sU=;
 b=rd3Nxh0Xh3zOJxOO8gXkrKSfHsa3XpeknzkE+bBLzqeeqEgrEkfV7CRO4ZyMzJHnevKO5A1Z7
 xR6zbQynkE2C7RZ1u3sllySerWUG38scGA05tC2AS3eXUjjkaRhP8vo
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 83c56dd9b5d8..6f2d7872028a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -692,12 +692,15 @@ static int build_changeset(struct overlay_changeset *ovcs)
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
@@ -713,23 +716,14 @@ static struct device_node *find_target(const struct device_node *info_node,
 
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
 
@@ -741,7 +735,9 @@ static struct device_node *find_target(const struct device_node *info_node,
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
@@ -991,7 +987,9 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
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


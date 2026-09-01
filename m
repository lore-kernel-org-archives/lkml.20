Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29C3AF65A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226178; cv=none; b=GLsPJiBPqWqdKN+J+aPvig2F+JPxitfITESD7QtCD8Xgj0QRckqArP+ZNxpthozy+ncjD772/menFHzKuirSWFro3rMNNAJDc5iikE86tELe4M0agkC6XWRkvODOgI7HF8HDOJAmbf7HAhBULsIV38XcOn+iuWJDmQ+F8SMRb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226178; c=relaxed/simple;
	bh=acOJS8se6Bn7H5ej5P3wKdM0zO0DOnFCnriESzJEpQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skjqi91FwdkK5iZ+jFnw4WkJrXim6TOyJDEbvz32mnbPCoY+IXSCB90MeA/lpyFR8D9zb46+GLOIM6Bxz9b+YqmExYU+Z6m1VlFvv4I2TKfYKOAABFMRQUE24MrrL8uNRsovJpA8ISpEB1ZVFErmBP0zfiCNzjeamALUSGK/XZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OPJo5cs4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OPJo5cs4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso4079445a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226174; x=1788830974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ma3PelxrCs1dceTiy4AcSJOVkhz7U1Hwxq7XQ/KQJhE=;
        b=OPJo5cs4yuomqyProIj4iKk8jtZmrApYS57xkjMSVzbg86dvleLFR7rk5/lnBGNpB7
         ec0H0VA3+F8kWPAIGXwWfCFp7Dc7i7o5S71hpiR9zOEWx25Mwqn2H3xTgexQ8BaUJ/4i
         7lALu/MPb34kwxJl6MHcrDlcDfwLRblJ6W/+m7reZLi3nAr9ssCHWC2uHe0clgfXAI06
         VZP5ZlnXdAZ5NK0pJUc8eGg9mHOsmaIZQ9sXHwahbKWg6RrFmDxLGvz6JUTSIrdLar8u
         hpXKvXhYHAptZf0HuymL5eM+1dQJpoJ04bqW3Rky3x2jkD+N3odbs5PTh4bDb+faSLX5
         BrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226174; x=1788830974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ma3PelxrCs1dceTiy4AcSJOVkhz7U1Hwxq7XQ/KQJhE=;
        b=AyE2Q3w6xyO5TOims3hDfcLsehuYzxS9fl9Vo7qfLP07iozcr93gn4MVSEK+aJQTQT
         P2nT+tFMLOCeDHAhw4ZMmIyFEEuhaDvkza7VI7FDFHP9kdxlJ/YgROn9AxNi+3bSjomR
         2m++TNA99BJBalsOoOg5EAx3BeKWWU7UwMRZGFpeTxwWJsN/mTw1Yct7Ov4mYsnpDe3R
         Nhl+Wv2GfKjJqtKWcIpucXCJYHC90rkrwt3d/e899PL5cjSmN3+qYzaepyP3az5jFM/5
         fJiclcGtCqnmThRHQhRhBI1flojczYG1LNdy3aERjZHqpPbSblSstxsj6GUvdcI/dtKQ
         ZUwA==
X-Forwarded-Encrypted: i=1; AHgh+RqZHKSv9T1Pv0F+8B/mtdks/59QaStFlVJo4VqMdlJFTFc1d8iU2EqdfR5mEOOGFcn6KG5PDk21NJJxmHY=@vger.kernel.org
X-Gm-Message-State: AFuF++lWhE5tP8G4o2mlAHIKIDy90/qGWQZFAGDVz2e1Q4H0CJQGSTbQ
	bxe3B3Lz8Hc7Cd9tmq5LJBCT2k5Tk2Phbhwh8bl30kZdMcqDudZ4jbQV14xP+jdiFXs=
X-Gm-Gg: AR+sD11+UvY+emmuCdhqKv6XVsggqRIGanlCqmkrkw3pzKYmd4qCyIQVsHK6jFijXMU
	ilD0EMOQry+WVlqCLL/F0TZb8GCgolxmES8uIFEVu0lSIO9wQj01YoOPCJEPOIZx+aenlmU+/ls
	oOLM+THQMbuSdmKrL2o5CFObkNCFWSIj4Uf4+bDrQf/B41ViijRV/58TE7VV1AVKhARj4EFXUvK
	6Eh5bm+Ue7n84ByEA+CUsZFgtdrxRxsrRvW7el0+H4bpJrhvX21g0NW9B1z4n/jnK2B31kFV7Zh
	DVn1rja8zvtISwZsTURFcZfQrfL4tGY6mUOvDFNV0Y8hCsmKla16PX8Yaz4vNe320Nj1x8RydQj
	w+X9TOhworzIXxyGZTSvMG+Q/CEUYoboWaMtxQ/G7qqRByCJpfd2n5KhaLLE532C9EVqrewESE8
	Se2BbcpVpV3+P8uTOMFHERP7B6fRE+ykWKQTT6GA/jcAlLLN0LPDHCIEZaATqI2GE=
X-Received: by 2002:a05:6a21:3947:b0:3d3:ae40:51e0 with SMTP id adf61e73a8af0-3d3ae40563cmr34941450637.20.1788226173716;
        Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:26 -0700
Subject: [PATCH v7 08/10] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-8-02754604805a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=4363;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=acOJS8se6Bn7H5ej5P3wKdM0zO0DOnFCnriESzJEpQE=;
 b=F4s/DIjXalAldRlKbPPw41masS2dqAOkIG255BI9qGHyGIcfKYPHYIjxmyTmx7RR1hYqm4r8W
 74ejSJE3Y3QCY0FiP1WX4W3VBpl8JWqdwHZVHBEaWzFo2prFnXh0RUz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() returns NULL for malformed values, for
values that are not paths into one of the overlay's fragments, and
for allocation failures. The caller reports all of them as -ENOMEM,
so a structural problem in /__symbols__ is diagnosed as memory
exhaustion.

A later patch reuses the helper for /aliases values and must handle
the three cases differently: copy verbatim, warn, or fail the apply.
Return ERR_PTR(-EINVAL), ERR_PTR(-ENODEV) and ERR_PTR(-ENOMEM)
respectively and propagate the errno in the /__symbols__ caller.

Also verify that the value descends through the matched fragment's
__overlay__ node before cutting the prefix. Only the first path
component was resolved, so an absolute live-tree value sharing its
first component with a fragment name was sliced at the prefix length
and rewritten to garbage. A prefix mismatch returns -ENODEV.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 6f2d7872028a..bc0c879dd807 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -206,6 +206,10 @@ static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
  * The duplicated property value will be modified by replacing the
  * "/fragment_name/__overlay/" portion of the value  with the target
  * path from the fragment node.
+ *
+ * Return: the fixed-up property, or ERR_PTR: -EINVAL if @prop's value
+ * is not a valid non-empty C string, -ENODEV if it is not a path into
+ * one of @ovcs's fragments, -ENOMEM on allocation failure.
  */
 static struct property *dup_and_fixup_symbol_prop(
 		struct overlay_changeset *ovcs, const struct property *prop)
@@ -217,6 +221,8 @@ static struct property *dup_and_fixup_symbol_prop(
 	const char *path;
 	const char *path_tail;
 	const char *target_path;
+	char *overlay_name;
+	bool mismatch;
 	int k;
 	int overlay_name_len;
 	int path_len;
@@ -224,14 +230,14 @@ static struct property *dup_and_fixup_symbol_prop(
 	int target_path_len;
 
 	if (!prop->value)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	if (strnlen(prop->value, prop->length) >= prop->length)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	path = prop->value;
 	path_len = strlen(path);
 
 	if (path_len < 1)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	fragment_node = __of_find_node_by_path(ovcs->overlay_root, path + 1);
 	overlay_node = __of_find_node_by_path(fragment_node, "__overlay__/");
 	of_node_put(fragment_node);
@@ -243,18 +249,27 @@ static struct property *dup_and_fixup_symbol_prop(
 			break;
 	}
 	if (k >= ovcs->count)
-		return NULL;
+		return ERR_PTR(-ENODEV);
+
+	overlay_name = kasprintf(GFP_KERNEL, "%pOF", fragment->overlay);
+	if (!overlay_name)
+		return ERR_PTR(-ENOMEM);
+	overlay_name_len = strlen(overlay_name);
 
-	overlay_name_len = snprintf(NULL, 0, "%pOF", fragment->overlay);
+	/* @path must descend through this fragment's __overlay__ node */
+	mismatch = overlay_name_len > path_len ||
+		   strncmp(path, overlay_name, overlay_name_len) != 0 ||
+		   (path[overlay_name_len] != '/' && path[overlay_name_len]);
+	kfree(overlay_name);
+	if (mismatch)
+		return ERR_PTR(-ENODEV);
 
-	if (overlay_name_len > path_len)
-		return NULL;
 	path_tail = path + overlay_name_len;
 	path_tail_len = strlen(path_tail);
 
 	target_path = kasprintf(GFP_KERNEL, "%pOF", fragment->target);
 	if (!target_path)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	target_path_len = strlen(target_path);
 	/* a root target renders as "/"; drop it to avoid "//" results */
 	if (target_path_len == 1 && target_path[0] == '/' && path_tail_len)
@@ -284,7 +299,7 @@ static struct property *dup_and_fixup_symbol_prop(
 err_free_target_path:
 	kfree(target_path);
 
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 
 /**
@@ -353,6 +368,8 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (IS_ERR(new_prop))
+			return PTR_ERR(new_prop);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337742;
	b=bUtvaWmZYY0iKicIZaVZ+P6+ilvWxTgpmlsR9f4lHStReZzWqQHSEGWLZ3caefoqRlzs
	 EvBFcW7L+pK1Dc4Sheo6LZlUE94Ro2V5ynlNewpHr1spGFFCdv0mcYqHb8yrdVG8hUKaJ
	 Dlo0/tT+N3/lDngVXJVmxx7nxIK+Ir1SwH4oP8NeJti6IseEcqFoes7mk6CtvLagG3qam
	 PNKYP3yJRlhQcmg66etJJz+LhoTH7CvtWKoNf1Kki1ieO7sARpbZUf+EHLHzo9mcAkPaY
	 14W4ECnHqJZ1PfgojX6cHpMA2bl/0WDQG/Reh71RDjVqQwrLOVpjOuitaANwSK8sWSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vVFGcST5O4Yn0VeUkZsnGTRXpr47LzjWvSN+HYJn4V8=;
	b=InOHVVmbg645eIUiEDldZHIhZWnr51GdfKS1qwIYARHXmN9agGPfnyEs32l5FYG+vDBp
	 odEyMCFjq/nTawqAm+jBkikEy/SE0U7U4b/wnU+QS9rUwadagYN6Jt6lK5YpNl2VroW3L
	 Q9WtRjUUc4PnvMxRVUPWvrEqZ5226+lus7KoU6mhe3ndran2Lg/UwLQ3wEIiz3mAdVa6B
	 GXMoC2lAv5rhHbtjdXsZF01H5cFxOn+ss65TW6HS544kCA3pToe+8aKFwpOz5SFV8q0vN
	 doAA4AR6cQizcccds3O10ND0b2hGWu48EFMU+jOwqZHzo9lABByaIF/c6S+r1/3Fu/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=torQcWg4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3CF606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3CF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=torQcWg4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20182735e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337740; x=1794942540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVFGcST5O4Yn0VeUkZsnGTRXpr47LzjWvSN+HYJn4V8=;
        b=torQcWg4TDtUJWAPEzM4DVtWKApaT6M8guOCgSDkzjxdr1ZCALYaWWXyvjbNI7u1Hk
         Aci6WO/EXRMsUd6Nns1smj9yGH//8sTvXpwEaQMl70seSf8XvzSCDEZ10OAmfpucmpNs
         ZYeWzVlyhvKPhbdeD58j4q7NSL9HCsfQNHoH1oHjswoI78zCw59DnSybAR8e4WtxNq4t
         aiEvrbMGH3lnN/TOZKcMhZCz67v9YAroL0FHIqafrJP+K0xGfSezstExzrhnL6EWSMVE
         AWm74TjtDBATHkGQ1CDzW6SRxjsAvXPsqzGlMbyMX0hrANku6+TWU9pKnpSvnvIbvRtV
         lpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337740; x=1794942540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVFGcST5O4Yn0VeUkZsnGTRXpr47LzjWvSN+HYJn4V8=;
        b=2WsXIXFCt8Q2ShBw7jaClmvsJOyUkSOqp1g87+EiOwh4oOurrNpS9VpW1qQhpG9oDq
         8hhzAc5cHz+7dIqKGCX6vk2q6C2TWdGztCXLuzQDLNVtZX+OYJukMzMu4oj312Nuu4JR
         nIunOkN8RCA3UiHyCVNt2WF7oABPAmVMFOxPQ6n09jxN7C5ptGU4oLfxGgDDLpP94MlB
         9gzdKqcfvlqGp0CbFD56a/sGQ2rAuiHx05+z/P315AC+iRTueu78adcuYIxa+k/yBrmg
         7JW3iEi4QGgRP1H80BXYafTkt7thHlkk40KtDlit9f1Zc+Wa+kxEhjPmqzdLIiSGEJx4
         75gw==
X-Forwarded-Encrypted: i=1; AL+hErHHdCXwbhlWq6wtzswhmMPNwJ/siMlqugL4RMVW0fR+gXL0EZnzOC9o0Lbcj8MdRvNOs98jUzP/Ka9VtI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vuZPWFHnJoh6Stcdk2OBoE1aNR+8wf8yRFR397obCNYSZebZ8
	4PQ39Ol8TzJZ87YYYg8hRL2k8inuZh2pknntiUqtCFXNZTZBNV4jguk5
X-Gm-Gg: AYBFou06nZdbFDQm42+Ya7/FBJnaow6LlOhhcs6vqzmS9SJt4G20zTEvQNbLmHS4T7Y
	Y94GoXM20IfnG1REnTVAX/9CK8hT+aV8TgZJ1ieFrJ/56n8WQfCGN+j2606GBRDWEPw/MKA42ys
	wbnGQbSJSVwHNFrFLuK0bZEKRCvbZalwQxXBD7FzsFBbrXgLLXBZe2nueHH0th6KVSMgX1UlbP7
	3J6B9JRhgL/P/lQ2CyzZvT1WABIugFvwQ9xYhPrqsykA4zPKpNGRtUqBGNUzCctTgWNdKwB2Hc/
	yStB1PdaPBPtLHUCKL3e1+Dymnotf2+356AmWF/gvF7Om5Ys84rD04LiaZrWxlaC4hV5GmGiu8K
	0EReTUX5Ll4npqa2BEI/vUw4V09nM7hP3snDFGlM8lTKQHTsvRhVruJSq1fU9e6CBdftwnxkn6c
	krzTaI2KZd7bk1nQeEssQTNzQthnH1GGNL1REp81nSasUPVoLfAYQD1CD0XcK3BBcwqiV6Fr8zw
	Tf9vtNmg9I0fjJsFI9zI2GQ3nMHVVglxrOmzViOlfJuuG16/vzfNXy67InHypNLlt5ocJ7X2yVy
	Ltfu+a8GF1heIScJFc2TS8MwaNeElIqSzJue51dsF4EEIgpQFOWBz7PPOYFNTgoEbJfJwMSYZ4W
	J5Im8kEthyL//rIxjOnqNC7jwYcPRceugSOKuWwpbOj7Pn9VS21dHmu2OhApBmf37+bvmjVrybk
	rqGmeiN/gVkws/1D59ejJNhMxY6ESm8GDMUcwiDoPRT4sftVd2pDFDsqh8rQxRDOhLJ6spOfxU6
	kkR9f+/SLfQkqYTKg==
X-Received: by 2002:a05:600c:190c:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4ba0936f046mr1268115e9.21.1794337740016;
        Tue, 10 Nov 2026 11:09:00 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm4309775e9.1.2026.11.10.11.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:08:59 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] tools/bootconfig: Close only opened braces in compact output
Date: Tue, 10 Nov 2026 20:08:45 +0100
Message-ID: <6ad67e4cda05238cd173c99e820a85de2c13f5fc.1794337724.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794337724.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com> <cover.1794337724.git.edumucelli@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A key may have both a value and subkeys. When it has only one subkey,
xbc_show_compact_tree() can print that subkey using dotted notation
without opening a brace. During backtracking, however, it treats the
value node followed by a subkey as evidence that a brace was opened.

For example, a.b=v, a.b.c=w and a.z=q are printed with the brace for a
closed before z. Reading that output back changes a.z into the root key
z, silently changing the configuration.

Check the key children when deciding whether to close a brace. Skip the
value child, and account for a sole subkey that itself has both a value
and subkeys, since that combination is not compacted. This follows the
conditions used to open braces without keeping a depth-indexed array.
Extend the mixed-value/subkey sample to cover the lost sibling.

Fixes: e5efaeb8a8f5 ("bootconfig: Support mixing a value and subkeys under a key")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Changes in v2:
- Determine whether braces were opened from the key children instead of
  keeping the depth-indexed parent array used in v1.
- This handles the deeper value-bearing trees currently accepted by the
  parser without writing beyond a fixed-size array.

Sashiko review:
https://lore.kernel.org/all/sashiko-outbox-207566@kernel.org/

With this valid configuration:

  a.b = v
  a.b.c = w
  a.z = q

the original compact output closes the brace for a before printing z.
Reparsing it turns a.z into the root key z. Values and subkeys under
the same key are allowed by the documented syntax:
https://docs.kernel.org/admin-guide/bootconfig.html#same-key-values

All 94 focused round-trip checks pass with the revision, independently
and in the combined series. The full bootconfig suite also passes.
AddressSanitizer and UBSan checks for 16-, 17-, 20-, 32-, 64- and
95-component value-bearing chains pass for both the first patch alone
and the complete series.

 tools/bootconfig/main.c                       | 29 ++++++++++++++-----
 .../samples/exp-good-mixed-kv1.bconf          |  5 ++++
 tools/bootconfig/samples/good-mixed-kv1.bconf |  5 ++++
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 56d76bdeaa09..75516e9e4ac3 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -68,6 +68,23 @@ static int xbc_show_value(struct xbc_node *node, bool semicolon)
 	return i;
 }
 
+/* Match the conditions under which the compact formatter opens braces. */
+static bool xbc_node_needs_braces(struct xbc_node *node)
+{
+	struct xbc_node *child = xbc_node_get_child(node);
+
+	if (child && xbc_node_is_value(child))
+		child = xbc_node_get_next(child);
+	if (!child)
+		return false;
+	if (child->next)
+		return true;
+
+	/* A single subkey with both a value and subkeys is not compacted. */
+	child = xbc_node_get_child(child);
+	return child && xbc_node_is_value(child) && child->next;
+}
+
 static void xbc_show_compact_tree(void)
 {
 	struct xbc_node *node, *cnode = NULL, *vnode;
@@ -128,14 +145,12 @@ static void xbc_show_compact_tree(void)
 			node = xbc_node_get_parent(node);
 			if (!node)
 				return;
-			if (!xbc_node_get_child(node)->next)
+			if (!depth || !xbc_node_needs_braces(node))
 				continue;
-			if (depth) {
-				depth--;
-				for (i = 0; i < depth; i++)
-					printf("\t");
-				printf("}\n");
-			}
+			depth--;
+			for (i = 0; i < depth; i++)
+				printf("\t");
+			printf("}\n");
 		}
 		node = xbc_node_get_next(node);
 	}
diff --git a/tools/bootconfig/samples/exp-good-mixed-kv1.bconf b/tools/bootconfig/samples/exp-good-mixed-kv1.bconf
index 8346287d9251..0b8b2f59da31 100644
--- a/tools/bootconfig/samples/exp-good-mixed-kv1.bconf
+++ b/tools/bootconfig/samples/exp-good-mixed-kv1.bconf
@@ -1,2 +1,7 @@
 key = "value";
 key.subkey = "another-value";
+a {
+	b = "v";
+	b.c = "w";
+	z = "q";
+}
diff --git a/tools/bootconfig/samples/good-mixed-kv1.bconf b/tools/bootconfig/samples/good-mixed-kv1.bconf
index 1761547dd05c..35442ee62b75 100644
--- a/tools/bootconfig/samples/good-mixed-kv1.bconf
+++ b/tools/bootconfig/samples/good-mixed-kv1.bconf
@@ -1,3 +1,8 @@
 # value -> subkey pattern
 key = value
 key.subkey = another-value
+
+# A valued parent with one subkey must not close its enclosing brace.
+a.b = v
+a.b.c = w
+a.z = q
-- 
2.53.0


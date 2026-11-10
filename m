Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333976;
	b=baOP3n3FYFx40D09d8jPorKsS3Do/QWEfbeDV2s4Znwb0+UyQlXrjInlyLy5XEP1O6xu
	 owgKTAhN5m1cVrJlUtldrgElSd1YTcVYonTi/Eszr9C/kIUJ3ryWPRMP19vteztdFMVc5
	 nUIjYS9XU1RbRrjLMKdW9LzkRjnkUKoo60XDDViZpGwAULcZTWMvn/RkX0eRMQY5JlfdH
	 L8W7SeiDev/v+Z0SighzXhAARg8gfaCmNSEZOn1RJ3S+xG/9CGV/5udiMz8EdROICUTGe
	 l9N3wum5OaSMkRAnQGYQBb2OEnddUOVwUx0cgkHrZGr/62j55/y1+Q7diqyy2yDgEHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kh/vtHBDVyy6lDmv/ABEp8V4+nHln7H1JafS5dcRL2k=;
	b=yq2XRDb2upc5/wozAU+rhaNgv3IWOw/HsZ4/Qp+l54caoF0JR3PKdm++eYhnCRup/e+w
	 U2hZ6LuGoreXLAQDBhhu2vb1yvsUIJQ0ffoaWD3F7RIa3Rwd3z7tMtfkJILdSKmoskm1n
	 Nhc+aiSJkJJfmb8rr/xOce2F/WXISJDB7qN84K6bjDnYtb6XXxiTN8aKIwk5yk3ozfJnj
	 12QtmGkjlFCEd5OyR09Kc4c6KqVFPoaMw4ectrBerCNg6O+K1htpRaZV+v8kKTb7BunNo
	 KmMtZHxIW7IuGH2jolaD3ce/JYrXoeH6SxVxZ5Qd+Q2yTQ7YmGQSaRePmnZwxxzm5Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qn7PoTYa;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E75606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E75606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qn7PoTYa
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13747585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333974; x=1794938774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kh/vtHBDVyy6lDmv/ABEp8V4+nHln7H1JafS5dcRL2k=;
        b=Qn7PoTYaQaGcb6bzyVHmgPuaMfD6+Nc6gXjR/4fcXdcc4SBBjva73z9UJkxkt2u49+
         sWigh7L+1aJQudacLTniAUiNp6VooLmlAfEfikul11tqcHm29f2aDH+rTKtZwK26AOw2
         NRZCxLSS6ltvuTEdWW0IVsTR0xh0CIL31oPFtt988t9SZnTtwUdwEykcXw58VDYII75j
         gdAvP8cPNdKyRnM7t/+XeRAyZiDSPzGqPN1+WMvsvUcK7b9Gk3/R7Tc25xlcBtBJmBFO
         DO2SSahp/JyqYjXZw5Q02XiXJZP6aao/w2321UdbC1AHBmhY53gyAeJXbxn0GefSaWm8
         8I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333974; x=1794938774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kh/vtHBDVyy6lDmv/ABEp8V4+nHln7H1JafS5dcRL2k=;
        b=lV4cU6fF3k5kPOtvihgrbu32/ktNWnRNzT1eKegVmm8epvGzROZ/kC7ZdbCiwKW+lC
         CHtdGqwLsVKH0JCeMfntxwn5nVjKuq+f8eVsTTe0K2KfTqWUXKN7it22m2eCcPAiJN81
         9wDV7IBtAYXSrNFbLJiC0I9afgZI8ALBDrfg2ne8EKg55yUqINFEW7hauWk9r8KQlveP
         jUCEsuJAA0+TYQJ7DP0oJrFXnnHDSr3RFBhURScwc2xvEf+NSAMID9/a7r9fRkUaPUkp
         1QE16zUODdXypUlql/7Jr+0pEti3Yj5yHLeSk8mdtXeD1W+3oRvrjb36idN2KVu19QjB
         ZM1A==
X-Forwarded-Encrypted: i=1; AL+hErFqyC5doHf6L3MWVUI7u8ZC/eGdh5oPtEEfX10iIKTmU/7eEJPrSzFyZjQhqi+F+vtWGrSXWtMF7T6RxXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8HjbsCrZitZwb9c9oB9cOxNmYB6gJ3U6M7TWiGWYMNFrHT/hS
	3xXTx09lkVPzyxIm/cL/PiEigOKje4HgUlOvFb11q2S1BqBAgN6utiCwY2uc0i6cUuDLYg==
X-Gm-Gg: AYBFou0NoxBrmMMBJeRaQxgqLQ2cxEQaj66gVovEbUQpwpyY7pkF6peiX79gjDR2v0k
	l0xwnRGpnNlbSZT1wFZSPvr7szDQ/WZlQOLAcs1T22jEraAtbJnsxbRuIuD/EBynm5mvZ7a10OW
	KQEbYtugylUZCYWaCJO3rI3Cu/xGhNrdMK5es5pO/00wTdrzuFsmTAQOviN1RN9eFmPF2MjkMMo
	d0TXQV2ZoLPUoiyBS8x7Go/kXJ2nLBJAougMeFNSUx57t5T7Sf7gvmLkgtfe7Dlc3u/LqfulSKF
	7Dpf57NSbYvM2N/CgM+BcPhePePri8sIpsw62nm+xsZC3A2dS9RXBKXzYX09YN6kkB4WbO2Zf/9
	jOcTr+m0Codlo2G7U2cUk8np1hrmbzZ43Doy+w9YlwMf0pHr9rgq/8toCfumK54vvfbQD70btRZ
	LeMCnG2lRMYSqH9VVPdyhiQtJ+uEe58R8Tit8FuUGyOdpsJjBu9lTRmJDuetdoLJx0uBteSS4zu
	DDfzxPivoO5dsslcTAYzNxTqd8U0sjj0swpZZSFc1xxdZetT75OiyTP3bsIk2OlgnQh4822y3F5
	eHYES1kFodd+RYyP6VM/YNGnEwn/cpfXRu8bPkxKVL3khHwXV5W67M1fiSCnuy4UcNVZIYjJCnD
	lkGjy0/avSk1rp/MFEp1v/CcMHI991ef4gspAvpTgg/HJ83hk/uu6cJSS8rfklWHXBRTdIoGesA
	0uS8XGuMHx9g+d6Iy2ZWwWPeE0QqGf3cOoF8CoX+I7KxcESnCOnGa6YV0wSeWVZXk4AydL1CtLt
	PPB26N5RAUHBWw4Ng==
X-Received: by 2002:a05:600c:190f:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ba0233c53fmr57779775e9.12.1794333973819;
        Tue, 10 Nov 2026 10:06:13 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm6270450f8f.48.2026.11.10.10.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:06:12 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] tools/bootconfig: Close only opened braces in compact output
Date: Tue, 10 Nov 2026 19:05:59 +0100
Message-ID: <f2bad80ef771708417b75bf7f1286f9f2521ee97.1794333957.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794333957.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com>
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

Remember the nodes for which opening braces were actually printed and
close a brace only when backtracking through the matching node. Extend
the existing mixed-value/subkey sample to cover a sibling after a valued
parent with one subkey.

Fixes: e5efaeb8a8f5 ("bootconfig: Support mixing a value and subkeys under a key")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
With this valid configuration:

  a.b = v
  a.b.c = w
  a.z = q

the original compact output closes the brace for a before printing z.
Reparsing it turns a.z into the root key z. Values and subkeys under
the same key are allowed by the documented syntax:
https://docs.kernel.org/admin-guide/bootconfig.html#same-key-values

I checked parser round trips for valued parents, bare subkeys, arrays,
deeper trees and a test initrd image. All 94 focused checks pass with
the fix, independently and in the combined series. The full bootconfig
test suite also passes.

 tools/bootconfig/main.c                           | 15 +++++++--------
 tools/bootconfig/samples/exp-good-mixed-kv1.bconf |  5 +++++
 tools/bootconfig/samples/good-mixed-kv1.bconf     |  5 +++++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 56d76bdeaa09..1bab0e685e2d 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -71,6 +71,7 @@ static int xbc_show_value(struct xbc_node *node, bool semicolon)
 static void xbc_show_compact_tree(void)
 {
 	struct xbc_node *node, *cnode = NULL, *vnode;
+	struct xbc_node *parent[XBC_DEPTH_MAX];
 	int depth = 0, i;
 
 	node = xbc_root_node();
@@ -100,7 +101,7 @@ static void xbc_show_compact_tree(void)
 		}
 		if (cnode && xbc_node_is_key(cnode)) {
 			printf("%s {\n", xbc_node_get_data(node));
-			depth++;
+			parent[depth++] = node;
 			node = cnode;
 			cnode = NULL;
 			continue;
@@ -128,14 +129,12 @@ static void xbc_show_compact_tree(void)
 			node = xbc_node_get_parent(node);
 			if (!node)
 				return;
-			if (!xbc_node_get_child(node)->next)
+			if (!depth || parent[depth - 1] != node)
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


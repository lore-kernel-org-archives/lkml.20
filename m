Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A25367B7B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911122; cv=none; b=dBWd91Zl7HGwzXj+vjFmgInIQrf9ZuFSfGkfL6zdzHinUZcJd0/nYMvQIOWds9tkLO3TwQJu81Lug/wOS2IU6+ORqyIGNnxF58YTAub39G5pr4sw4ELHYwGFj65qXGyeM3v7UB2DfdwkQeJgUer9ka7Ubil8kGRU+4otXnXr38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911122; c=relaxed/simple;
	bh=NAqErJbYzbVMfkAK0K42VgnPFlRX5e95U/2VfdKXRNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0XAnxn5d7zNPVoRlokuMFE8b+mOSEZ+RBVETAp5UVSb4QZU67BGsPC8Y47CI7ZyqjI11ioorqHylnyHFxA9uyPPsaF4Ef+mEJ9vqjEmmdOazNOjgMjl0HDzgbUWKz02hC5AbDd0IrmfAE85uju76FRA+656TZelThXaTXNeyoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLVQX34F; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLVQX34F"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939a6fb86cdso67557885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911120; x=1789515920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6L6L3ARb9Cg3F9zGE6ufoGiq2DWwbPsHri/Jf9J8RbY=;
        b=hLVQX34F5carL36Ld+o1NkbUhtZ62fUgJIpfUV8T5q+Ve940ZfXUxxXfNUePvTMvWe
         x7Q6MT2IiJuNKTtpqOprQjmkKjRJVVq1SWGGLciOejNVVZGHuO9xjbkqSiPFifoWNann
         K/5X5hVgtxDEs8Gyhv3Wac71GplDkT7P1bOxyDawF0D8p42cTgFJc1pKQ9hvc165GyJL
         YOVx/gpYEKK95T8zvG0OZkZgBcXAyPBfWShc0fr9Q01cwu236WlrTRI4dLkeDJuvMZ2Z
         ghNitJpLuEtwswr4dDCb38Ir7onk07bt8MKoHVOKaY74CLHKAhWYHGfyveH+ty2zrNc4
         W46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911120; x=1789515920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6L6L3ARb9Cg3F9zGE6ufoGiq2DWwbPsHri/Jf9J8RbY=;
        b=hX7C9U2ILLqwWbhoS32bNQQF95tNmCQ2Cxl7sCS4IfAOVNqNrbpwzBKL6/3oWrHPtL
         M5K1j81Ooj529hm/8O4NGJhaa7Yjm7FKUcEgIMtcpMrZ3Qbeanmv7HdQFwjLRVDYPAZM
         Ss/F0At/7z4Wf4IpXs8cVOn5kNUJQOv00bZ3c5k7WYP+STPfd343ic8dnXIzZKU0Rx+p
         vPAfdYIrAddS+WTY7NXTNEJo1pNuggf3D2s0uVu+iT72IcTB8xQN3bL2y3ZjncIREzPz
         ww+yQGJPg25Ygq/Wgr4lnxSUiONGdOPjAlYrPXuZZh7q56GTwPvqInRaEXjKrgNpzNSa
         f78w==
X-Forwarded-Encrypted: i=1; AKwUvBxbg8f0fCb1G1BWpr84QPsN4+fvsxia2S4oC6qLbqqwnZPuoeo2o5Nrdzo77TDsp/BrCBtmLxoAM0GgqE0=@vger.kernel.org
X-Gm-Message-State: AFuF++m6ABacpWr7eew3OdDnHboC25i9ln6BNWiRkU3uA2QpciX22xie
	VftiprUnxQe9eQIJIFEmviDCJZBJ+Hh4Zo466gUIgAlF7J89Lwn9XOUL
X-Gm-Gg: AYBFou1/5V4ZmLb2EG8tgR7B1FxTWJUTHXU2yljRld+1B4ysXnoKe3e0XjsYh4xCfmm
	+Yq3AMuO93Xx3MlZf+ROMmuJzL1SdnajzWIZzSa6ivh6u3KQNmTQtvulozOqaxYmQL5RIYiBwk6
	s2L7diZUJSSHv8mvBAX2Ezw0VjZliOT1EzkVSv0xyJ0JzVaEfJ+vbZ2B7xHKgcjI0KC7y2THwok
	7HJVk21ISS8IH/R8PScc5KCTKCKRaucGbNz/McupPKGf6jrK8hXswlG+15G1HNpsfAjvWxKjfoF
	qGzFpu+D9fJKhLR0JU4eiEDBvxlKYmDU5Sos/7kTQzVzYUHBmAK6ITmQpe0c91t0em2bQnhpzmz
	yRpAW92/z7g7Szd5ykKMwqr6Tuw0LLujydBpBs65B3v7pR7F22QNbATG/bdSejl49yggIbH7+ZK
	SQbxFUgvz7FBCybrqvlkpy2Tj3pz2DokgAkeFcHGfT6gHttK+VqJCzLK80rCsepSep59GpLRgCg
	0ATRuLg6g==
X-Received: by 2002:a05:620a:90d1:20b0:939:bb9c:e43a with SMTP id af79cd13be357-939bb9ce46cmr549260885a.3.1788911119531;
        Tue, 08 Sep 2026 16:45:19 -0700 (PDT)
Received: from elster.cvl.swallow.glass ([2606:8e80:692f:3320:980c:c29f:b4b9:c06a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939aff54ae0sm551872585a.8.2026.09.08.16.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:45:19 -0700 (PDT)
From: Taylor Bates <tmbates12@gmail.com>
Date: Tue, 08 Sep 2026 19:45:07 -0400
Subject: [PATCH net-next 1/4] netlink: specs: fix duplicate if/then keys in
 netlink-raw schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ynl-robustness-v1-1-f255214c0f30@gmail.com>
References: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
In-Reply-To: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Taylor Bates <tmbates12@gmail.com>
X-Mailer: b4 0.15.2

Currently netlink-raw.yaml contains two if keys and two then keys in a
single mapping that enforces a "len" for "pad" members and a "len" or
"struct" for binary members.

During validation PyYAML resolves duplicate keys last-wins, so only the
binary rule survives. Pad has not been validated since January 2024.

None of the current specs violate this rule, but this validation should
not be parser dependent and unspecified. Strict YAML validators such as
Red Hat's VS Code YAML extension and Adrien Verge's yamllint will
reject the netlink-raw.yaml schema:

Command:
  $ yamllint Documentation/netlink/netlink-raw.yaml

Output:
  185:13    error    duplication of key "if" in mapping  (key-duplicates)
  189:13    error    duplication of key "then" in mapping  (key-duplicates)

The following invalid netlink family spec will pass validation in the
current ynl tooling:

  # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
  ---
  name: minimal-raw
  doc: Minimal netlink-raw family for schema validation testing.
  protocol: netlink-raw
  protonum: 0

  definitions:
    -
      name: test-struct
      type: struct
      members:
        -
          name: reserved
          type: pad
          # len intentionally omitted

  attribute-sets: []

  operations:
    list: []

Fixes: bf08f32c8ced ("tools/net/ynl: Add support for nested structs")
Signed-off-by: Taylor Bates <tmbates12@gmail.com>
---
 Documentation/netlink/netlink-raw.yaml | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/Documentation/netlink/netlink-raw.yaml b/Documentation/netlink/netlink-raw.yaml
index 4c436b59a34b..18ccfe05048a 100644
--- a/Documentation/netlink/netlink-raw.yaml
+++ b/Documentation/netlink/netlink-raw.yaml
@@ -176,20 +176,23 @@ properties:
               struct:
                 description: Name of the nested struct type.
                 type: string
-            if:
-              properties:
-                type:
-                  const: pad
-            then:
-              required: [ len ]
-            if:
-              properties:
-                type:
-                  const: binary
-            then:
-              oneOf:
-                - required: [ len ]
-                - required: [ struct ]
+            allOf:
+              -
+                if:
+                  properties:
+                    type:
+                      const: pad
+                then:
+                  required: [ len ]
+              -
+                if:
+                  properties:
+                    type:
+                      const: binary
+                then:
+                  oneOf:
+                    - required: [ len ]
+                    - required: [ struct ]
         # End genetlink-legacy
 
   attribute-sets:

-- 
2.55.0


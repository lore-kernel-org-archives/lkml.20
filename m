Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203E394792
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437210; cv=none; b=kKIJc8kVjeuIRj1kLl1ARtcoaYaf4x1qywJDmiEZfTY25qutHJiWnhWX7RShnYYrSPwyX9E3PUTaAkx9tVhCfF37ihe4n/ODFQc8woZv/rMw/bNJBvyuMy2MbNzAb5DpC4rw4ElfANz+v3UeTewz5fL9AKOnehO2BAFIO2LBq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437210; c=relaxed/simple;
	bh=2e7MOHD4a8S5CcE+5hyDZDvM+DdT1QKiIHH5BK2wpRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sNBVhL9nSp3rc4BfIaeX7Wr+RqwSVoy7yO7DEjNlF0ctUmolTTHtfDQvCc1Iui9Md5RUX2f9LiivX4dv3NJadiPevUKUy9tZWxjv2xff43uLIv2a40lE9qNQ8Mv8Rg4tXQD3wUHffjFuyk1P2g5ss6h9nTwtKGdMc0eTArVRnmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+y11f6j; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+y11f6j"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca17so30803071cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437206; x=1790042006; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XJLrs/hiAMm+2brUX3v7e3wEUFVKwEZeRW/5NiqTe5s=;
        b=s+y11f6jtwpx4gsNsYcK8uusNSoCQOESWRSLzcVEDOfQXQcQcEqKI+VXO9C3j77SM+
         6nP3q7V+dizFPClpx8PBDhyL1AaipGRVM8Ln/sbYBjsFxcXwsQco3vGKOVVLA6TN4tDt
         w+MTlRVlsMe+8B3gaZ4DUImpcwaAOvkINBfhoGQHxLUQguMz2/GIi+Fu5b9MPlLkmpHE
         nrg/obBF4utvNF628q6YFRQQmpskRGN1ts8quD7T22Q63A8rjrOvw1fK5KqUcvrZ7Ch+
         y6qvITAjQvEvPkULO726peUqOunJS+s8bdAAfwarzkWSGS097QB62LCa8fbJGBCHu3HQ
         v3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437206; x=1790042006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XJLrs/hiAMm+2brUX3v7e3wEUFVKwEZeRW/5NiqTe5s=;
        b=0UB4EUcFE+Vr3E4B3qM3A9VR7wCdvmfpYOAMA1MRSavzdOKsquaJB7ljxb0yzny6wd
         9eCP1gqRe1iDqAOXshh5EI5iRUZk566yep3P96XgnEcoazQfdG78Bf921jsj0b4vTEs2
         lyB2S+S5ChTH6QTqqAhW3gAM9Px4ESyrwR4bP9/kcC4u1cbGAaaHQUEZzBIbzKGt1BST
         0nkLJu+bcUgQLrnH+4Ci0Yvha1VO/psWkGOI+nWqMDMYwguRqxEGV5U1geeZovGtV7wm
         ebTzucKFv7sa8mTcK0cex6913DaifPF04IcQ7aUFFGI6FgjNeUt+BOOnvKuvUGufiNFe
         HK7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWOt84PD5+ucQtbYMd3FlQAZ78JhURodwENz5Ov6WruqnyKiBaw3rB0193/S2+nVdpiaK2IfVncVih+2I=@vger.kernel.org
X-Gm-Message-State: AFuF++mqwzTLDw8vj+PDsMPy3mUmUD0csjK0SaU/LxQnqORO+SCG4afI
	0czdeCbd3OMkSHI0T5BPAeda7Boy1P2eBcfvnKnIUH+0aho1MagX/eBq
X-Gm-Gg: AYBFou3/3dKGv1Ao0cvHEftWQNMMi8fJUVZ/3TAuFxdJ6Fcc1ezcHIjpVlYxkh3o1lZ
	HDmrmASkTD2Y4nuL5+GlzNLoZ0/9LFTEMMORegBEpDAWTqnyYLpyzKNfcNnsNeGZXy6+1OrDpR1
	q5aVq5T0KsdLLRUxNNR86trQb7c4Egvl0kHxXphmg5ReFW0ySDheL9A4qyKIddnZ2+kCic/nJ/n
	ujTmBp5xHDHlH72cwwaXHl3+yqqiwL+g/3TY61sh5j0UVqyoe5hlPspd4WbGGbppjfBDhCkH0id
	AbXpnsxwHKyfMN5er9SRHXp2BfsB8dnwwO0u+Z5xOxGx1jTE1KeeAxo1nLRxAAZO7JVIvG2yg3h
	nMZcvCDNSAV3bG/ok2fL8fdhy7cstsQifv2JUI0UlWqCBceWytsh7rabJ84quZkQmOfsHDBzlhl
	4sBgUQbLtMIZBSEKN43CGohUm09h1BOz03SLogXFPDqGJNvYgUc5KhAITl+ostNhilVK0RHu/dI
	JrZ0FIK1vW1wW3t4XBS94Gb8w2NrnOLmyceVx9nTKUd9D2R4GE5Bq8=
X-Received: by 2002:a05:622a:1807:b0:530:f73a:90b4 with SMTP id d75a77b69052e-5310d0e5522mr85556501cf.62.1789437206348;
        Mon, 14 Sep 2026 18:53:26 -0700 (PDT)
Received: from elster-wsl2.localdomain (c-va-d03e6ca0f2-23521-1.tingfiber.com. [64.99.237.244])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5310cbf288dsm34149971cf.1.2026.09.14.18.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:53:26 -0700 (PDT)
From: Taylor Bates <tmbates12@gmail.com>
Date: Mon, 14 Sep 2026 21:53:15 -0400
Subject: [PATCH net-next v2] netlink: specs: fix duplicate if/then keys in
 netlink-raw schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ynl-robustness-v2-1-c6125003b21e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAqlqGoC/12NwQ6CMBBEf4Xs2Zp2ERRP/ofhAGWBGmhNtxAI4
 d8F9ORxMvPmLcDkDTHcowU8jYaNs1vAUwS6LWxDwlRbBpSYykxexWw74V05cLDELKoUqyzNYq0
 Vwga9PdVmOg6fYCkIS1OA/NvwUL5Ih/1v37aGg/Pz4R7VQfw0t3/NqIQUNSYJqouWdSwfTV+Y7
 qxdD/m6rh9rnxv6yAAAAA==
X-Change-ID: 20260907-ynl-robustness-d62d9693cc12
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
binary rule survives. Pad has not been validated since commit
bf08f32c8ced ("tools/net/ynl: Add support for nested structs") added
the second if/then pair in January 2024.

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

Signed-off-by: Taylor Bates <tmbates12@gmail.com>
---
This is a repost of patch 1 from the "netlink: fix ynl spec tooling
robustness bugs" series, reduced to this single fix as requested.

The netlink-raw spec for the Bridge VLAN family that motivated the
original series will be sent separately once this has landed.
---
Changes in v2:
- Drop patches 2/4, 3/4 and 4/4 from the series; this schema fix stands
  on its own.
- Drop the Fixes tag. This is developer tooling only and is not a bug
  that needs to reach stable. The offending commit is now cited in the
  commit message instead.
- Link to v1: https://patch.msgid.link/20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com

To: Donald Hunter <donald.hunter@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
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

---
base-commit: 043777e948807b5f335f58a0b9f5ed04bba681cf
change-id: 20260907-ynl-robustness-d62d9693cc12

Best regards,
--  
Taylor Bates <tmbates12@gmail.com>


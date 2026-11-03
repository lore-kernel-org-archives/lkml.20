Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718701;
	b=GU67qJaZW7sPH1lLNK3bWApXDO7ilj46YEcZWiPut7t4ixDLxye+pZHKLePRK3rYF4sh
	 hJcVz6B6zRafbe7rf67CFpaukIguq9lWreURJhZ3XPcO+tASB4uI/wMngKOwLYgB8n7Qr
	 t/FWyA6dPEl41gKDmuUWQx/sXZ8UaWEo1eBQGK5oz6VH9vWbnj9ctIgrbFAGv9n4WhR34
	 xNzyBm52r2ogN8Y8s8g7B+LQAVHj8thtRaSsOJfmOPaNKxfrWFtOHfmWpQJdzDinMQw2W
	 r/gziyWFZdFxcQTtpG3AEJk0RPPBK6ronSZO4JOC3Sk9WWPl3Bu1FuEXYgCBf3lD95g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718701;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xbNaWXgIxtjFAfRnL9sJC5jpoQZJskcfQzZpxj/gf9M=;
	b=q7dI+tK+PhUc3R2rGcZsR464hTmbneAhC73q+fdEbEqRJNMrtULh/8h0B5WmXYFctHpX
	 sgZ8mPelBAMy1+Fo7qlOjeR8/Mhf6jyCnPt6v0/+LtgLengL5+hV7dm3chxSEEZwKA3Il
	 mlvni7DZu6pMCeO0wWJ1T0I5QcwfhmZn0eFBQoIQQ5NAIOe87FwjN6k2m61WL7QmW4yKQ
	 FZwnQCyL7SLBSj5Yfsxbv6ZmRoACLsYzrH5n0RaUDJ0DfWVN7P4bhqSMSwEtd0cdHyfWj
	 XsymtjmtiOACCotRoNxlQhj/DK/Rikc/3zZ/GyjJ1d+LjTbCeVsXMJgv3jL5xARY/fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbWR2xhY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF365606D838;
	Tue,  3 Nov 2026 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbWR2xhY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718700;
	b=e/6rXCSb1H3k1LpnI7N72ZS0k8IrVRXjDxM9Gx0FYjsjIcn5eU/+phQHIWoDnF0ps7pT
	 NzceGp7bFBtTQZgZjEJOmmwG6ZlIYzYknFU5Mqa6tmCk0P2XTfr1MjtP9T1aT0z5Ou4Er
	 RnyCTyPKoV3ETG3D9AZo6pZhlKbtA3lWix47BuyK3VnpB5QdurmUhD1QBtBYec/36qAVt
	 5QzaMiDIrDHIQgRYSyrR1oZMtbf+4hUoYUY8PhfPGc90T9Fys70QV50S+a3pGolWqMioy
	 hWbx8X0Az5lvpVnS9DTVrN6RWtrR3FpsyABHJGZWIJag55DuYdqM0s5VobAdUTPg7ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718700;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xbNaWXgIxtjFAfRnL9sJC5jpoQZJskcfQzZpxj/gf9M=;
	b=sIcElXtCeaTCgkIkzHzRL1PeAv8DsCuzXef8aI1KrElKFTnK+qheFibPIXp8iPJphC2G
	 xNFboYlnw5GyyEm21TTVt47QvpImzmCY5EHi4mVgIii6S8v7bpibaZafpMwSQdZ0A+wor
	 fykQ8K22aHDYGqcgOFWZcRGtUxQ8QhVMFU7TkF0ke2bzWfzROP8HTv6Q7ZPpqT+QH0dlc
	 1kL6awIoMDVMEzuvdeRflYKyrUNbXezqzWNkwlKK5Re2Gqs6HmEIv36cZvx32j0x6nnit
	 D51vGgCDVgV3yj45emcGaMAXj8VSnVyxoFCbzyDwiyF76Yc/bnfvIpxqmfVkubGJ/kg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD8E41F00A1B;
	Tue,  3 Nov 2026 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718700;
	bh=xbNaWXgIxtjFAfRnL9sJC5jpoQZJskcfQzZpxj/gf9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VbWR2xhYIAqTEbfCy1sV4s/p1kDvi2bT5kRmh8Ki/I53fNvCh+yRSnnJxyKVnUUd6
	 Db4Uk/zmoTlbQD+DMrjjDg+Hple7Itv9GW57xYL2Ybu5efX1b0F0iQQ7Mp4Xmj5k1j
	 CJmKhPr8L6IhnGOuXup9h8Pv5g6GlLoVGTPmH4rji9ohwokLWzz+TSQgsN+15IaaPP
	 GmIHDv9xTm91zmuakP6QVIe9WIOQfZC0wil3Kp+//XmRF2Jzw27cOvj2xaHDrb8j0p
	 YNC92wJmpKTivnsx/wAYDRX8ebkLFuTlNyam1+ziC4cVl2xfEfqx4o8fQHGoHfSsCM
	 4Q9YAITNBzvTw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1940C469D6;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:29 +0100
Subject: [PATCH v2 5/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-p8700-dts-v2-5-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=1383;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=8H7mZGQgDyjY2/87nVSqZXQAWw1ccS1opV09eqf+z34=;
 b=HV7m05I2TRG03b06Pm9h/xoZC4mqF/M0duyfhgEZ4fB7/RsX5xw0rH8MuZ1rYz1RnuwA6Uh5Q
 TzYG/CcAzk/Ak5wzDNXIQQ3rQBbuEIiUWEVnsf7X8R0Yxn2ZN+TPzsd
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aclint mswi compatible for the MIPS P8700.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..ca91b650caab8927b3a4ed91f1f7f142e3790a97 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - const: gf,mips-p8700-aclint-mswi
 
   reg:
     maxItems: 1
@@ -46,4 +47,14 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+        compatible = "gf,mips-p8700-aclint-mswi";
+        reg = <0x16150000 0x4000>;
+        interrupts-extended = <&cpu1intc 3>,
+                              <&cpu2intc 3>,
+                              <&cpu3intc 3>,
+                              <&cpu4intc 3>;
+    };
 ...

-- 
2.43.0



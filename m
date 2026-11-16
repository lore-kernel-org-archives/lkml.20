Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830133;
	b=fCpxBFVKpaH02J62/6L+wQZLkv2xMJ5HytErYqtJ234f7b9TJUuGIG1VExUgCCbTkns8
	 +IpudFDvcX9jinkXYJaMhjRYPbZDckpdu29ysw76Q6ka8WZ5YyqKppzOvA6EoMmeZL1YR
	 nciV+FaZAXDBoUz7rgt/nY3QkwrnOFEyBGWTYdAxlseqwfCuKKIbCsLenW0SyLdYADb1e
	 Fg90gyT9XU1Fu0AiItPDcQH6xxcGJNAswM15S0y5eCVTDn86mA+Fv9lINhDRxUsC+QqHh
	 nApinSUJkEyWdG5hGaTEbznZJypuBMVzByItn1c3KzxWP7/dyWddAvBK5UGzuoYqjKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830133;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3ELK7UCbUvGWQM4M18vVS2rXctTaHyXhFbh0W654D0c=;
	b=ulw9Bd2qSqH+taxMhrxRDwD/UrqXvcl5kSWO1EjyJiYft7BonKr4mZdvRH8TQfP+WJGT
	 j8fmOukjec9OKGvLeYNzMRpSW27+P/zmxIQ/dq9zE0o2oM5DKEtGr8k6v9Tn7dtMZhLyF
	 ZAS0YNcwRuNlhpINSbvvnOGw4T6Xvb/dlji212ee3fmgWTw8cs8VcR9tloFGZP+ri6/bb
	 OLRfvCWAPB/92ZLvCyb2DGSw+cXIJMAk6x/zwYj0cA8IA7Di7a/1T0SFnfyLYx2ynG4au
	 h4FxR7mX6V331KoBZMYspT2uZ8Rz51rPqyv0n0q2CKjgiQnI+FDH9clKT2n3gYn6sEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=int4A698;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC792606A897;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=int4A698
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=iJZz/mQ4lmbDsEQo71368XD2PbX5MNjNZ/yTFQMzC7lwAKqHtt4+ftGjXVMc6TJhL/Aj
	 HHlfVPDL+ZMURkgYeo6xzU7Me3rynj0oAnapZxw8XwLa3Tk9qFhF/hVt54faHXJYKo4SX
	 nKiXrPZtSwo/VH/IzVEHzRzJqLEtxZWHWYZjp/vkmWDDWw3HQumacZJOV+AkOGsTJgELi
	 QSsSLQ48SqjNFYZHThxO52v6o8lm614PtmOlvSDfxbaRzCAlmQMrwyHKxv9Eynusb8ESU
	 T3GL3jTAWwZMgTKQSwzhYqP/3nEPGhERqYS6WDOuEkXphNhEz0RwUdULywKYHHwNiAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3ELK7UCbUvGWQM4M18vVS2rXctTaHyXhFbh0W654D0c=;
	b=LsQI2EEODgcmMb0UopWRXgfCqEftxTOfR5xVh7Te4R12Fxru1XE/YIL59BWayGGNLqwj
	 piJXP2UwcJOkNbUosTcIVyAD4NtRDCvtbo3yGxHFS8A7ECWJnluFuEkIN47pe5e8ikpsg
	 pYN9jdKstsg9nHC5vwzVhwCHYBjf0ECvO+xQzV6t0+SfFHythqcpkkprSfp/2qRxOkQkP
	 3a3bDn0jUvrO//L7ossKaYn8tvGOaeHMi15RTnHzoVR9kURFoJz4hwRCAuwaIR8X4KVdk
	 jO78f9TmecHrl4/K8WoLwXfb7q3/vnA4t8wX2FeTuuT0/5FGFlw2ElxMkNvF5iUtgpQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69C641F000D0;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=3ELK7UCbUvGWQM4M18vVS2rXctTaHyXhFbh0W654D0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=int4A698GcM0JpXWU0bVXDfNt9JbnlHJcV0j83MkJZWCWxqRnXqq74QkH/WxqMeX9
	 9XN7clvrX4LTJTvSwd8fHEXM+nNcwamH4pLGLVMGR7zIcrT2c6Jx1VUQaKrIvTCq8l
	 L615ifgF3N9XfPn/h2/Y29axyjbIZdSCK4NUp4pZG7+fQv/xBDxaig+9Rirz4Nbz6o
	 mIdxwY39F3COkbZufINytfga0W9E69eoxXxbhA5pq8MLW+NpYVRYSa6+dEtThCmF1+
	 m0xVu1HFjOSU68eq0mzu7L6sHGDivcObqo0PawLWBpHVCXrakQKAxBzPCaEpcQRqOq
	 rsjVj107ET5rA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F06A4A45E;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:12 +0100
Subject: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
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
Message-Id: <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=2281;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=NJe+9FUIucxCmNXZnGjS07SXJ64Ib/0GQbLsdG2nvOM=;
 b=YxdDK4koG2rM6wnlapd4vaY+E2+hhCtPnx271NUbwJPio1A3ajKWu3wHmKxS1rDXbn6EAC/sQ
 CYTOKULvqitCHqXVF4KGAl5GOIaKEKu0HJ27gV/ZiWACf6AWCFNzjXq
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 ACLINT MTIMER.
Extend support for both mtimecmp and mtime registers
within the ACLINT MTIMER, identified via reg-names.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f674afcf59fc726742dc4f49c1a820..a5ebe04ade9ed61c8beac5017aab94ab12afa9ea 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -21,13 +21,19 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
+      - const: mips,p8700-aclint-mtimer
 
   reg:
+    minItems: 1
     items:
+      - description: MTIME Registers, or MTIMECMP Registers if only one
+          region is present
       - description: MTIMECMP Registers
 
   reg-names:
+    minItems: 1
     items:
+      - enum: [ mtime, mtimecmp ]
       - const: mtimecmp
 
   interrupts-extended:
@@ -42,6 +48,26 @@ required:
   - reg-names
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mips,p8700-aclint-mtimer
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: mtimecmp
+
 examples:
   - |
     timer@ac000000 {
@@ -53,4 +79,15 @@ examples:
       reg = <0xac000000 0x00010000>;
       reg-names = "mtimecmp";
     };
+
+  - |
+    timer@16108050 {
+        compatible = "mips,p8700-aclint-mtimer";
+        reg = <0x16108050 0x8>, <0x16154000 0x7ff8>;
+        reg-names = "mtime", "mtimecmp";
+        interrupts-extended = <&cpu1intc 7>,
+                              <&cpu2intc 7>,
+                              <&cpu3intc 7>,
+                              <&cpu4intc 7>;
+    };
 ...

-- 
2.43.0



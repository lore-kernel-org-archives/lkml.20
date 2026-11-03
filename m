Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718704;
	b=VvN7M4eEDjFbKyqza1rPMf2La/YNN0AktdDxnI3EkZILrm1gzVCWyvI9X9DMrRb8YkaO
	 n+BdWliI1goPrUu5phpnqM3wj547wLAEx5s+Ylpl8KBh3u/JRTADzSgiPInOgHADhroeb
	 tQZUVlU8ftI7YXA5QP9FS9EXTIV3Ac+pAj4l7Uf30zlF54Oky/NC55kWqsPLQl5tlTcGl
	 kbcn4N44VN6xkv+n7gohLerR02d5HohOfU1JgMedp7HHtdg/7rAAL0uNjZ2HKUVzozXH/
	 T7SAzUF8MkwjIthk5E+kxXfuSx1W3Gy3UKcu+OFAhllgKwCxTsHdF4J6QrmBLv/oUjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718704;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lVINPUnVFyp80WzNRasEKVXCIPOnOL2uC+s7FpulN3Q=;
	b=CDttOcHbG3U6YwImCWJvoioUD0VUHbnkhZGPHdHXC8OcD13JAekR9Rb9TZlqwMRm8E3x
	 7SqCgR23CniA23E4ge4/hXPJizeLOPxfTt6ifPlL3cRAAK6ltFLA6cbuOqq2eax7oBVQC
	 oyBPGrlnsvtas+2dEQdvQk5ukVh9ERDEl6RqOxAwBUyy4KamYBRGvBxOaiEZcvZgypYLm
	 eS0y1EhCnjPKHgkCFIR6GKXpIj6rRn8Hlr+3MVKLnihIwqZd4IIKcYgLrkxOcSQpfMdwq
	 FvgVh3lMVSwOFbytCdhk0ooKpJZMdXtnUPkeIWPiOkoNo9BYVhT/Tsh4Nui3VX2XPmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqU5XUxD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF9606D2DA;
	Tue,  3 Nov 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqU5XUxD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718698;
	b=xCNgjWP0U5m4sK6WpNSmbB+J7mAeIWnIdQx7QnPkHeg+ls7u+OLImZApr3dlkHqbc/1K
	 WDqI2zFbKTnmqzitDNZP+PUyUiSNTEBe4qYI12qW9386qPvDZWoKOpFgiwdcI+nV7Hno1
	 41T2hmOicmo5BtJOYGPdRhsCCgL1PJ3bdTxhmbHQrjS9xyBM2TsdABiRhe25qCz7SqkO2
	 kkgr3N5L70Te1iNZrloJvZcnmHOXlpkljIxBKxgMdADp7ripnIgzSbkYXq9cY+Bo8cUw5
	 ++ufYImFTXuCdDGNCVihEwDaTxjSLoqmv+w1Nj5OG1Bx85u9lUZfu+ouBgS0FWVHzIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718698;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lVINPUnVFyp80WzNRasEKVXCIPOnOL2uC+s7FpulN3Q=;
	b=0aeszv0qTvTHkeU8HQk2U3tblPZAAfzFcl5ttiFXVMDdSaEh5YSTBHfZeZiHvvbjJv72
	 GYM61B6UUOjh8BZKe7U/6QHu+Tb4wJlQezM+HR9awMmD2dFkLjetRfgOOWt9gf6k0i6AW
	 UZKjqorouDYIT8tY1G01mwBDZiylG8jyie4Xns/3Quue46aVepZYY/+qfb0JiN0q270mr
	 udIuc81POZdHIRF53vSEOCUxd0Q+KsvKvk4ecwr9UVLcfMDTT7RJ7EWam8j7ADJz4VMth
	 X94BHtXdAAfojEPKtLwWrTQYZxvAJJfUQrCWCzfa1uthvKGfgE5DfJD2joFJQsi8H2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8660F1F00A16;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718698;
	bh=lVINPUnVFyp80WzNRasEKVXCIPOnOL2uC+s7FpulN3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RqU5XUxDOYFEjEEjUEKEtk+QP56ifvsAD0Jua6pWenq7w6Gs0F/3UwjTqFwNaGM+J
	 1KHN1V5RmYvomK7/RZP5F70wzQNryRIsf4RBbMtDiPFHHvZrQIfxkEKLPF9pgFUjB4
	 CUHDJSVrkRk/RKGr2WZvdjhAYcEHmunqcGJHw9aUFV2R3EDc2OZDxXUsFkJ8jEaxwR
	 aWU1MCua0unwLoCg5PRs1jb5DQsZacPamlfMwnLq+Qw6QA8oucrOZrfs4nmUPUddN+
	 pwebv6rOTW0GWuJHpOiM9McYH8LsO+AZEYH5lUwmYxqbyDV1OBpnBFAw9tDQApU4A7
	 mhtkekmMMLKuQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0D559469D2;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:28 +0100
Subject: [PATCH v2 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
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
Message-Id: <20261103-p8700-dts-v2-4-3ac5d49f2c37@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=863;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=2lms0SOqaM4I4/vPB5czylxQz+VKnxBbKrzIdfMCocU=;
 b=kKWd8oBLvuphCeyGao17aOm0k1IHXVSc98UPtxe8GOpg5lvESDYnzC9TDjZCer1pYVuBzLQ7Y
 15A+fqIXnCgAyNjFLYN5oRyDBhjjp900w241SoPz6asxkXeAocqYKwC
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aplic compatible for the MIPS P8700.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe535075111601b80e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - gf,mips-p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792931049;
	b=yyM521lybJFmFxL5PVN9nKLxdwwEfFWxWvoKpYv1+drRdmM2PkzS5+aAogtz4E7VhqLt
	 oZ/9rxJYDYNubey5uqDBrfie/1e/6AGQncV2MCQawSXuybv/eTCtWw4sIzouGbhN82JpC
	 l1QbMsR413h4ZBrEUXE4YYwvjlBFwRGXFi0ad1/BDAr/oLrDIS8wFj6AF2JO7vVQ991p4
	 /GtPpHnGcHMdsMuothb55RdigpuHsPCByAQEPVodEuEdnYQoqUwMnVBcx8odhVnFxNf6w
	 YsIbFcRRdQKl9nXCOmxqNwTqnbBNdwxGCTSacTnyA/Twm80ztc3N49Ohwu8Y0hxpDGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931049;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	b=I+W+VDep8ISuX+dlcSJrj5OC4NeO77QdzUl4Ju15nG3A7CiJTDupsV1vaLK6WuW6zddK
	 5LeW3x0C7SsoARzghZAKx3Swf/v9JmA45Izt+g/g3+cZibMEYwFim9qXan2vmjKLK1oCO
	 Is12zCM1sllPISQHcuC+PQexYCWkRxoJmelB+8i0BARr562FXwZJL+zsklZMW+WDiV+XL
	 lF0vuge3GFw7e5hfg6V9gA3QUq2MjLlnpNkJp7c4WAboE7yUjJZzQkHUnXBoBjKzlBXKf
	 5f9vUK3+iVj4dIIufMjKcZSRKL1pIGdtk4oeU+S+PVWNegaYHaB/t0HGLt1QjDxisOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bIVYBXef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E4D606A31A;
	Sun, 25 Oct 2026 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bIVYBXef
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931048;
	b=H+2zsLvJPaLX+4eE+VuvZxztsoniSbHYsK9NaHKvuLEwOXsc5vIKZ19r09x3ppW0H2ZV
	 uH03tK8emGFxvZfww5r8MDVZHsJqZIoG/wK1/MAMyeQZJc33bgdjdGhQcCX95EqNaj6T8
	 ZZ0kUPtofDM7Mpwsn/UTE5yry8/hGC2E4sCZsNrZFiCZcS52iiies/Pm5Ffb9lXY2NM18
	 9L4oVbxQaA226lq8kIhj/NXwl/Mhy7+z76uhqrxnhegKnjB1MrlEjvtHOyN+9+MDcxp8s
	 2AKXUDyITkmdC6h56Zgl67v3QINFPJEygzJFtATBEkjSrg47kALko7a6+1A9ZGv3kiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931048;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	b=YQlWfWEAZQONpBTwxn894if0SKpzgQeIxYPFP3lXc3TgrIKzW2j2s8ICv/fOxEh2kAtu
	 IFyZRtho0KtmtMS8K1GiwXOnujKlulmqTuN/p+w6iaFQuJ5C/CjsSvG4NEMgYLSJs/Mit
	 TtkhgJ0MpLSjqrOWZdXNSMCmA5iYWEYgbzhp4EWIRBYMRNjosCj+HpeVAmeREepZlwOB5
	 xxIN9FRzQbN5URJ2SdnLd1gYQOHR2mKu8zOy8x/se25+6o/EGO1B91JbtI65DQ86i1f3k
	 4R6bbmDYZaXrVFGS5vUPed6pBF70wrh7XcShxvEZKh73AU6xyi0OZhPVtGF/yONO3YQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3FC01F031E1;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931048;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bIVYBXefXB4Bo9GXPf3fLx4FtFFEq8Gv6Bu7El0f2AVkz/EMDpQcRyr/5M/UGsCSO
	 /krByL1nXHEMUkYhEni2ghEWRcd+ulMb8CPBmja5G8j3XQwvCq4NejAkcWSUQ4816S
	 kACEtx583NSDdmJRWDlaI0uDC9b2xiQo6tTQVYlVDsdr92ru87GrrKi666zx5TRkrN
	 GlabCHg4cmAmm293Tafni0Hp139FDtmmT/hBn6RzWowzbPK7VLtR0wo7Ibvwqnv4Nm
	 zoBihbwhUjv7bo9lnTDSt6R8Omth7dKW0RKjKpkpTf+atz9dtw9F3rUwYEs9xCEStT
	 0ajQRJ1o7G47A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 234A644A08;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sun, 25 Oct 2026 20:24:02 +0800
Subject: [PATCH v7 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-ultrarisc-dts-v7-2-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931045; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=lh0QieY16hYzdE4o3bLdgoukKnbuMZbzb8Lqi3so082dAbKol1tJjEp8ctu0hCGapMBO2vVnH
 IZCQ2IVyN+zC80j6bWIhxMEpz+pvrZmxw/9qg/xtcg5/R8Oq+n1ATlW
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Document the UltraRISC CP100 CPU compatible.

The CP100 CPU is used in the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..85adf72899c9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1



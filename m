Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571533;
	b=twCbN4zakWNODCWVYoxMOe6NXSWE1U3bEp7FuKhsxe6oAWHL82h1+7ShGSeaxCxOFnZ2
	 H7ryRaZ/X6FCME2uNsX7h1lO0xW2sppN1Bhnb1prP3AJgJLDDNjgmxfdhXbDriDlEYVWS
	 OkyEAxnfNlX4ij66kU6ELtdssuc/DsZi7uDkX9d3sRZI8jf3dzqH3ENdrFt5IpQivEhqF
	 pxNTwVislvKFq2yLHaJr81KRjEIEAeffnf2J/AgWICm49SWwNz1Lz6/1PYcJhQnGAdV+D
	 O9CM2oKxX8Mp+4GG6WDV/VPlhLTR4GhgksZG+nj+Cnn6NURUF/T9aWlQNGVEw+Bd1Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
	b=YZaBimmX5kBpl1o8V1jynwBo511IZ6l9V99fDkjIcSZ0noOv7ZX4cxQgDvYgWUY0VYoS
	 PG/6WjjNFhpP4fbiKKy4g4xD7TTEkutZ1qSfuG74v71m7+I4u7b2jXRZGKD7si+/6s1kH
	 vRXMXNw9YGUG9lGZb8H3BL2jejs4gOOsLkyuyHq+uEsm4iL1FzrrUOSZRChD6D/OJDU8s
	 QsCPh9+7ZiTw5mgi/tm5/If3j3lVwz/TPKFnt/xUePfVcASHz8YJAvb+UAP1lKOulRQeE
	 LHmizCIic8spsy5Wck0L9OMKtanY7O+GXV9c8i9FS6h83fkouIetcloK1LKyiU1yDcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WGFF3bMt;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548B606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9548B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WGFF3bMt
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so1237425e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571531; x=1793176331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
        b=WGFF3bMtm3L2MCSgwqcPw1tNav2ZALn+Bngjm7GzzU4hX4q4RFGq5Gh3EsljyRJhJa
         gtEWV6CgGhtpoiTgz9qTowDGguEKIa+2tayYDkpS90FzRRrZSJvCOFEudeBClvsy5lt7
         2JB/aFBbGlRaPK8x9nVwMz2H238wFAY7uPHdHELygn2b/dTFpTIKWA3fLZowaUi++RKg
         XCulAINhyz2YcU+IGGuldgjZ7HjlEqrRuiLpptIGFApm4NrWr7E4iB9wgmoAEvEMnN7w
         L59y/D3AOS+o54FnC0I8vh1c8PN4ebggO1cczYXpMOM94PAS/h6vBk1gXPImOb/2+5Tq
         d0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571531; x=1793176331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
        b=oUfcvnNyUqqCqgVu/YEqJ2sgwWQy3BDW8CfJYCysbO8SP+9JE/PbdjFCMUSu9rBLg+
         hhBTx6ZmpPHgNGMxHn0Bamd5zhQCHovXnPn+bPDHbE97qR10Xs7S9lT7YCy5W8sq+PRQ
         YD2HjOh1PhDPYmnQmw/H0gvefSDJ513skiKW2hcJibCCnr7lgsEwfsH+Nm2hNZVIJHc7
         a4bl7/U8F1GeP6mcvhMRXO3HdNIG24qC4/JkwVVU9bmlExRZ91IeGOYFHMKW0I0VE9CR
         QZM6m39LWDL8nVG6t3EYy0vLbro2+M0qqg8IxrebSw7OJu6LN/lQ5HD+1UFyFhObhn+9
         xisA==
X-Forwarded-Encrypted: i=1; AKwUvBy0wvVGsb40MHIMFCwpNTmIG712k8bk1HiLDAiTob9eO9h/axY9cq0Ax+giRjwBqRMbITe9jTh+bsFzpKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTvRM+fMVm3+QX/8MgvLV93MJpJ3jrbw7QrTv5fG0r6VlUfrMV
	SXOEkhcHkkGy9UOQhr4OsFUlYU//4Bfn7ZfjxO+RS+XXExw1eFdb6+QN
X-Gm-Gg: AYBFou3MddMrxoG/9yb0Piz81KZb7+MtMSHzig3NyCUW1c3zHhZofIpZYTB+3g2ZOZr
	m7YVyssb9qPu3/KF26M8C+5xaqpfPt5VkHWxO9NwK8mgaZ40Gi550JxnJbHTKrDPfhen5ih0rqE
	UJgkGtf11qWrhia4NUMp663gij/givm9kX//FEmIzBHBTe6qlzi+TKzwStCULoe7Nbtz71xaSc0
	LjRMLuqMpX5C2otHzvIw6xpw0mx2og3HirwMBBFTOI1L75XWbNrcnzmJsx0QGmeIRLFZVXr5gxA
	+zakiNtGQZbDxy1bNU4wGEInRQalG4UyTi2f1d75eI7p40pLiOrEt36bw2fxLX5u06dOMF0Yhf8
	Sqpu721tpVonmRWvaNvTsagR8HnI2HSDPc7izWN7z6+6q2B7kOrU88rlO9CDr9WaOI9HGiBrWnK
	mg6oaBPKtT3YotofoZwobdEbMM/MYbR4t+jR1C3KNmSQTMbsAE/K1e/z+2t+BtYZFMtaeulvvSn
	Sri3SALa75k5Z9/PuRhbr+jIUVuZy8XgIhO4vN6AMs7XS1D7+xf0OBBp1JORVJb9HY6RvSVy8ST
	B9QC6L/yQHeYAgcG+m4caHlsI4X+N+sbD9w8+PZL7Jmk
X-Received: by 2002:a05:600c:a08:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a201cc6bf3mr744085e9.35.1792571530863;
        Wed, 21 Oct 2026 01:32:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm36250145e9.4.2026.10.21.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:10 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
X-Google-Original-From: Biju Das <biju.das.jz@bp.renesas.com>
Date: Wed, 21 Oct 2026 09:32:01 +0100
Subject: [PATCH v6 1/4] dt-bindings: can: renesas,rcar-canfd: Simplify
 renesas,no-can-fd description
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
Message-Id: <20261021-canfd_rzg3l-v6-1-b4abfdba8e70@bp.renesas.com>
References: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
In-Reply-To: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792571528; l=1656;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=bfMkHO6jG7ziyusENgghR+SzKGm1uT2oifSo7PJ+O9Y=;
 b=DR8TBLyVCK+H8wHymBT4C1B4+LTr7fsl5n2fceAH5tJAmlGsaw+sKf91GRt2XbvtV/5/OMa3H
 W80PWXcyrgPDfy2c1Dpe52/N9O1lj5l+Dm3X1ujbTjxfStsZMFqRQyp
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

The description of renesas,no-can-fd lists the operating modes
(CAN-FD, FD-Only and Classical CAN) and which SoCs support each one.
This is not accurate for every supported SoC, for example RZ/G3S, whose
CAN-FD controller has no Classical CAN mode.

Drop the mode list and keep only the statement of what the property
does, so the description no longer implies that all SoCs can operate in
Classical CAN mode.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated commit header and description
 * Simplified renesas,no-can-fd description by removing the mode list and
   keep only the statement of what the property does.
v5:
 * New patch.
---
 Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 1a7a9ce45e97..81674ea4bef4 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -145,9 +145,7 @@ properties:
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      The controller can operate in either CAN-FD mode (default) or FD-Only
-      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
-      property to put the controller in Classical CAN mode.
+      Specify this property to put the controller in Classical CAN mode.
 
   renesas,fd-only:
     $ref: /schemas/types.yaml#/definitions/flag

-- 
2.43.0


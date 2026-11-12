Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509663;
	b=Uh8ZhdPyhP//7jgVDpO6bQs1fHUizuUJAzQbgJ9Gg0AMchdgo8q+Cdfy9yDfC0CZY3z8
	 UUUD6chKXzNTI2Kpyi0yEuxx+O1RKvkoZq9ID7yYYntk1C9Ri9deqzzsBrMeVPxXWqNQO
	 LI1SnyshRq1yIB23t3/B+JBTyqs7JUeCzXGxKLBItutItYFucMtLnvv89wYfTXPRGPXI+
	 bv4INN5+wJ9emLxxM9pll7JB2T0uNy9qU2Lhznw04+nGLD1IxlpX6NqM9GRFezp7x/xYw
	 fFYM5NG+idnRZJjxmbL6PGG6wWBNhq6hV4GPdqncOJYGxCxlpD+Ea+3YZx947Q5Ytuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3ksQPpb5I3Ui8OqbNiTyCubhOS+YyEiX+ICtyoaWFTo=;
	b=gIFZbA+oJA0OG3d3965JygRb27lUkZR8LO/H9AQ/e3m3GZXqNwO+02ekICFxnT6cAtyI
	 YBuAtSjvxXPG8GtLHH0zeybOPic0MwSv5+KagH8Nt3+TkYLuodDOWFppUxChyo0tjTZww
	 CSlQD+pEbSrxPAfzTKyl4kQ/rNrkD1bWt419/E3AmNSSpm3jMbAVkSIYJ6UQfrxSBLOgF
	 yWxMbGRIKCcPE2S+Ec9ibO2aRLwGf2qMI1eA3KWYyjKguAjPuZ9ajCamUDAaKK2UyFSWv
	 Y9NKKG3nNJ+ApeOjkrI9lHcCOkJnldWMCoRPlwBI2cHSe27iVFNKT3nBC/dup04Fw+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0Lu2t8P;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116D5606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116D5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0Lu2t8P
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36ca32a0faeso20997eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509662; x=1795114462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ksQPpb5I3Ui8OqbNiTyCubhOS+YyEiX+ICtyoaWFTo=;
        b=o0Lu2t8PRdrGEu43HFCEuBvfdTjYnsfi5chCB0t1N/sUGAWEaIlNA7xz48zRiTnoiN
         0oBQuo5ZdLSDOSxWLKVgl1uMGtQEvr9ZamCwC9zakZaei8DzeOJVaBYFYJAJUcyUGh5m
         9bw2weQ9STf9HJ4PtcPSAvOK7Se8HAqMAWtnR2A9xokrNcH6YCR0SDS882Kn1KBKeIq8
         oAOeMs+WG2NdjHXEREWAwmDOgM7otYhD1UhqrE+w/g09kXpAIDE4SFuWslS1ZQhbQETo
         vdtwHzFzac71dIBYG2UxcsSF9UL0MkANW7P7hqGC5COyZLj+gf6B9lkZHpvaeKhkD1X7
         LDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509662; x=1795114462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ksQPpb5I3Ui8OqbNiTyCubhOS+YyEiX+ICtyoaWFTo=;
        b=gKkZqvICxLb/bzX80t5UwwmXD+A37c0DGDO7VpKgJ+C0fjL4DcvDKiksd6lmGEEoCm
         t1WbrxQRUM14SWz5TdrlWfzmySSP7zODPWeQU1lCwxlIv+9aKxCkyAmARwWlBm74UiWL
         GaNAL9OxFGGMym4IaXFVQw+PhBmP2wncR0yDyxqLnSMJEC0NWzBP6pVkLk9za14/zkUO
         brQI5RZr+t+JW8tSA+ocBCS8eZhg5kX7O58SZRC5r/EDxJ71ZrW/GAPzqDKRB0UkQCat
         JOLMaYqX85X0X3YZVjaFIZTxhByJRCob5XkDoNueRhJDYaxaRTZGr/0FyrQ8odXbC+Mk
         ozRg==
X-Forwarded-Encrypted: i=1; AL+hErFU+ST/ZcFj/7XhTPoXCUfkpG0aii9lmhHe0E8g5AemhOewUX1/dOCZebJ/83I1OJPsMmphAOXVNYl7cfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jhHb6hIpdGIxP6P2t/+cWNM46kIdmQ3wN8GHq4aI/vlN3+akc
	VyiFCPbnEPy7yNOE9Bg1OcFIl9Kua59FXSVvKZ9IyCZE8hnAuFYDKNhb
X-Gm-Gg: AYBFou3Wblb78MCvCN7TjYkqsYc9jprKmJiHhA5/eoga3DDz4Jwfilkqn37Omy4ZjIK
	n9nvCA0ocPH+FQdHTVCnNvS+T3F1NrAVSgT80Sp7jhN392mrNzWx8h8bE57nMV7HqXvGgukGCOK
	X+5fsGMUuXgeLRDK0zDslOZ1DtLR3NbnmL7D735NeqkIBDfasSsxtowi8Q8cle5o8XYhp3exi6O
	Kocl3VJmrEotuekOUTQfJHr7YjJyp5KzXUT4byL01I1qrPoWd4i74CnPVBd+vw6dDp06Ombppi2
	C80vRUkheltyfX+BYEvjtvSAGlK8WNlIjXzzSN2joTSreePUt/eRT8XxvUTssJ0JZph/iBqPhyY
	a8bxts+UsnGKdFLfd7j/+zmej1DB+hC1WQm5vHFv+FlcL21JeTfFN0qFHOW1mnrYTAVLJBp98eC
	kP9o4UJzE3MZP9IwF7zoeCrM03mV7yGAINpUv2PornR6+3RXvF3Q+RgAVPaFRuQXArz4CE3X/Ke
	UDYqtWw9SotCR4VDuUC5kAVJQoNNpY+hNTkbYfTh2BQ6NaTFVHsg37J5qQSP0daWqsXWBE0KJer
	xgCnSHAZWBPovkdd4GqJuNCQPHHLUWatdvy3KMM=
X-Received: by 2002:a05:693c:20cd:10b0:36a:13fd:b5c with SMTP id 5a478bee46e88-379652f16f8mr90294eec.2.1794509661967;
        Thu, 12 Nov 2026 10:54:21 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:21 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/3] dt-bindings: bus: omap-l3: Convert to DT schema
Date: Fri, 13 Nov 2026 00:24:01 +0530
Message-Id: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12PzQ7CIBAGX6Xh7BoWWgVPvofxQCm0mP4YqETT9
 N1ta4zE45fMzGYnEox3JpBTNhFvogtu6JeR7zKiG9XXBly1bMIoOyClDEYHLYd+0MBEZbUSaCt
 dkIW/e2Pdc2tdrp8dHuXN6HENrETjwjj413Ys4sp9uzzpRgQEWVYotNKcG3muO+XavR46snYj+
 5lIZWoyoFBQaUQuCoWW/5s8MTH9JfLFPDKBJSorKKepOc/zG1en+sgoAQAA
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=1819;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Rfz3AU58vxTc0tRAB6XfZV8jzqodhH8HcHaxAQ5sFNw=;
 b=SZUDB7MSIZuV3kYi7Cnk2UvzPGPe5ChAyhkhZW8DnM8CYOcsnIWfQ1ftwQmPZtUWQzz33N/kW
 hL0zfmU5jC+A+y9VQdCnbhTiimYvZ9IwkTC+jofHc3Jip0jJHEfo/pQ
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI OMAP L3 binding from text to DT schema.

The text binding grouped OMAP3 (SMX IP) and OMAP4+ (Arteris NoC IP)
together. split into two schemas because OMAP3 (SMX) and OMAP4+ (Arteris
NoC) are different hardware IPs.

- patch 1 adds a missing unit address to the ABB regulator node in the
  OMAP36xx devicetree to fix a validation warning. 
- patch 2 converts OMAP3 L3 SMX interconnect.
- patch 3 converts the OMAP4+ L3 NoC interconnect.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Fix SMX example node.
- Link to v3: https://lore.kernel.org/r/20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com

Changes in v3:
- Split bidning into two SMX and NOC variants.
- Fix reg maxItems to 2 for ti,dra7-l3-noc L3_MAIN_2 is a submodule of
  L3_MAIN_1.
- Link to v2: https://lore.kernel.org/r/20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com

Changes in v2:
- Move binding to bindings/bus/
- Rebase to latest mainline rc
- Add unit address to regulator-abb-mpu node
- Link to v1: https://lore.kernel.org/r/20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com

---
Bhargav Joshi (3):
      ARM: dts: omap36xx: Add unit address to ABB regulator node
      dt-bindings: bus: ti,omap3-l3-smx: Convert to DT schema
      dt-bindings: bus: ti,omap-l3-noc: Convert to DT schema

 .../devicetree/bindings/arm/omap/l3-noc.txt        | 23 -------
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 71 ++++++++++++++++++++++
 .../devicetree/bindings/bus/ti,omap3-l3-smx.yaml   | 68 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |  2 +-
 4 files changed, 140 insertions(+), 24 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
--  
Bhargav


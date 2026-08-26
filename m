Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762F247125F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766578; cv=none; b=mXLoKGsAr4K4BQXYOColMkQwQiuWg7VzIl6aPUNcbieZADxU4Xs8dg9PJaxotOXjsPWqIBuVz/4dHeuEB76oegfSccv0sY4uP1qCZmVa5z4XhP6G9eBJd5MrGI+nb1CSlByJl/iedoQIIgHe3+ynHa2//IIhXqAEr1jWDO8lkis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766578; c=relaxed/simple;
	bh=lO/H9vG52tHh4g/YvK/DqO7kXiMl0LxMerQhc0b8EGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMkQ6gG9nXTzarvcxFP+GoHkr0v+7uELal+3DC6Z9rw5zHQ2PyyBhwjlxxgmWLjduk6Eg/uZkhzNDeqoc1G7L0YDgf9G+96H/SBn6rZYWRJsR+NCtXX+PW+K+KFSGOgdu3p/ru+ArWwClyKZLdeazjN9vPNQIECxgjMzq0OOYEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAqR/An/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAqR/An/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e592da74so181616866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766547; x=1788371347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAyR7Cy/EycHtCJ5inXhtOKXSOAgSgTPYmNAjAm8Uio=;
        b=BAqR/An/YXb8c/92pr4qotVmL5qCBIOhHGvRiVUIItBOBDghFbbJmtvBHwc5T33XGL
         FOCqVqt0uTTZmdwQ/fl8Mb0O2kq6FhJPXZQ5zvaw9R7CfcmVFlp/l8o11oGe5nyoaJwX
         r9NyYTBO/j/zvSy/B2dt7cESTA88OP5LU0DsHsrZDl8nKEM0GG6UjVZ1GxUMgl0mBUXE
         YYRjtXyKCNIBpvFTw5JJdcvW20ttj30wpB/iDgxIsV4xlecapuuTw+49/yh7lbiz/iof
         LcmP40el8QFjFervwd0e9hTtG/hJpGcLc0Tl9d8NaflZ/qZuRhP984WyGoXsTSQoQm72
         0qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766547; x=1788371347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAyR7Cy/EycHtCJ5inXhtOKXSOAgSgTPYmNAjAm8Uio=;
        b=mzwKaTc4LbyylppA++/r58lzDIim4IEBAcmYnzOjHyT77ZVlbRidxybSDZzqRJD/lE
         kRQhipljbuoTj8130hQYflbR9WGe4qB+ako3nk/dxdBhwaq3pJC3lsvI5d+MgWO5UR0o
         yQykj0JG3RgAOZnGx3/0mKj5ikGN2/R1QurCI5kFbKsV7wIJ1m/imfcvYNxOyciFuREh
         nsq2qeb2QqwmDBT6L5uDfe/m+m4DW3NSzpi6DwsMKDALM3ypDEPUjBCgYr88G+WRcR7i
         K1Tnkr4sJ4nmDo6ljePDwesII/I+HnIBd/Im01NV0sOc539BqsUMipQC0D/2JXt8jOHF
         ToRw==
X-Forwarded-Encrypted: i=1; AHgh+RrVXewDM7CE2agD2Xbfd5NtDuGTX8l3JioAeTTwvE2oAQy7OimYhCwaRxxO28qJa6red0q5/Ii91HzfKyM=@vger.kernel.org
X-Gm-Message-State: AFuF++kWkKEV1cOAUTu7HNx8k9HfmyUqNb4i+FeNh9ZKkAvW1Ard+cus
	lEKUyEOGaFNHaqBvsX0nYE0LyWhMeiHp391AEewmT19gatiX3egBDVKz
X-Gm-Gg: AR+sD13CbYGquHakpp+fZ6SfTHcyZmHHBrfsf9MruDR1FELb1t+Gf4MEnRa0bssU0mp
	h5J2FpTNKktCb0xNWN9vg7Z0n5GiDH7Mm8OMjykHGlNRlTMJFzDu7jiflBX4T1UWcqHMM89OKqP
	Qk+5PVwqdhNiUjafjvudVW+aiBoup+5vvlwZktQOvFqzWc5kpCPbBXy5a49By3tSyjrSxqtcxfm
	j754ddAmUFtVkgB5TvyAyESLn3QUO/GfIA11nfwqlr5NPmOja+yfjAHcn8t/KxxCVcJP3PwnaOt
	kC0HPgsewDla72y6HibEX5IhGub41F84U/vWkfA9+7qNBh0rq2TB36JimLj41WSiBrjOA8kScjs
	BEIipxj0luAwFTD9WdYfE/K+vWgf7AoAlmsLcgbkUvjZKxV6tlB++aMu45qrfP+KNCKt9c+8cQR
	VkpRzBYHl3zP5IQeTNrMzDgdlX+/07s0mv+x7lL6C36vy4MnrDp+472gmqB/eKJmcukyWEuuayQ
	/MnrvA+qTPtnQqJzhTFRVC3
X-Received: by 2002:a17:907:c8c6:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c250bbcdcb2mr1121271166b.7.1787766546793;
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
Date: Wed, 26 Aug 2026 18:48:43 +0100
Message-ID: <20260826174854.199139-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add vspd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index ad38aee2efb3..6ff145dc81fa 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a08g046-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
 			reg = <0 0x10880000 0 0x10000>;
-- 
2.43.0


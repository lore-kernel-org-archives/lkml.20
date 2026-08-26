Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F6466B09
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766561; cv=none; b=l+WgS1e4+QJD4ph3LVMrPsEwkWW4wFHyKpekc55rtxf8AP2IJq8t05v8vE4PnmrBxzExTbZwoTlW+A8C9MxQ3CwZJFh0mRpX5ovlzR4YMH0kqly7iJR/s+GAciehFa03SxTJEseYflZDxehII3FP+49CPtlB79A6ZfnCpcMaVCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766561; c=relaxed/simple;
	bh=ywTK2DeK7x/fgkvo5FtlN8KM8nTduWZcKwVxsajGRbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvhrQA7n8papqDA8dzWIFViyYjOvUofvZylh7CnDDw4pOG3vBMWQNn4Gp9DbT6X7hHVKTE0F5JrqnIfMySdvwpfTsqxKD3p+sjlPmSAhL9Mla72j0fih+XISs+G/HPPPeGF08gGtRi7Vd9KX0chA9A820vHLYr5DyqcKL+BmHOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg+1r55x; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg+1r55x"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c160420289bso165809966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766546; x=1788371346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+p8g90ua/VmPeeYb2h2bDZ1FPwrIxPT5htOXu5iw3A=;
        b=Yg+1r55x5+gexqA2HILICtrF/8Z6OJ6lgunOVRzIByPj3xm7NKYnmzCAHD4eUx1z/H
         ZKB0zBdny++JvR0zo4Gcj/oARNGBiFFBrN8wwFjYP46gcIlGVO7GOwDJF4mcAryLLPiZ
         Bd4HDa3WGNS+A4VYCf0Zv3jReNzbTLj3K837uBe5goirw4uxxeOavFsEg9FDMIBBu39I
         P4UhKiTXjmX4Ez+lWD8YWGU9SI0YDBk6infGBNCU9pHq17ZjaPTVJQ/49miT4YdWP3D3
         JOgs+4Wyi++UJWeHrb703x2x/2BHXsOrx9Idl03bpDM3hIoYhgBouduJ+IBmm965CBQE
         V96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766546; x=1788371346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+p8g90ua/VmPeeYb2h2bDZ1FPwrIxPT5htOXu5iw3A=;
        b=ANobIYF2BCpDcC1vUr9PCpUOtOPB+EmHR7SmUAAqKQcdRoakHJTU2CQGr12N5qgAXE
         nIxFepr7+0wYv4N9g1/Vr85AEByHIHNJTrikOlxAg2frPYSwHr6NRDB6vqnlhSjuFVCw
         N3e/kR7HESiGY1UBJzI94VlZw1bt3adCS2XiUpSDjtR2FvRZ31B7/wN73JU/WMVdA/q6
         JLB7Fk2iLHT2vgLmG/Z4WkVpIo/xcD9/aWOQDYlYK+jFeqkzDSS+Qirnx+AUy2w0megX
         npOhvaRyEnACfQuB2o9vqDFy52IqaanXMJoNta/ylLL8ROh9jtS6JCXxvYnDe/bXONaN
         +KMg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1mqbw73JCay734EA+BzFSgZI0I2SsVUuz/VJpwoEeN25cYK+d1LTtirvv/G5rVlzBFLulVy7gwA8sdMk=@vger.kernel.org
X-Gm-Message-State: AFuF++lvE5bBjQDXWqbwSyszaAWaQf63FhAF3biz48UnZNIM+wNx7KLk
	5297tRhAKqHL2cPKfg9neivE4pTuYVptVytFXCucN0wvTCQ/RIAVwqa1
X-Gm-Gg: AR+sD108QVsjkuNKXt4hXRGhm+5BaORWnAih9PT0z1pvRWD0GWcNTk0xAk01ONzZZiL
	1o2RRt1hnKpgMwbxGaPPgCgZ1BauRM0Mg8azrIF5ry6Z83HLNdGmnk5jpGZ+eF98mqHV+UBlBTY
	orQ93lCf8gu3DtB11T7WaosV4kxMssOZ+Xn3RUWEpgdG/XxahZgeH6VSEkFaDgw2uWRW+4/WvK5
	dytQ7JLdxvA9iQ77rxVuI24flJSW42Lb65rDrYzA6oR25UVcyGYJ/vHoRz1KfDiOcAytGrDXD7z
	N9gn+IUdkNrqsY8VhvIlYoUSIanUwV9FXfxpT+TlfQ7OBD0HaBsqumW2swbHPkKjfZY5ozvx9r1
	iH5694I+bKyEQ/Hq5JZrrHQH4kjMpzzXLZyp1z/ah7bp+TSMuAY0FxuU9qaZbj/bljr7ATFYGkd
	m8svMSXCBRyvBSY88SGnI8A2iG1wXQ2nzgbkU6t356YoUZ4DG0gtOD8pHCfPVe1A9gG9xrtqgU9
	+I5CeicQIR86J6RVmx2mjBF
X-Received: by 2002:a17:907:948a:b0:c20:f95c:907a with SMTP id a640c23a62f3a-c250c318b25mr986184366b.17.1787766546005;
        Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:05 -0700 (PDT)
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
Subject: [PATCH v3 08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Wed, 26 Aug 2026 18:48:42 +0100
Message-ID: <20260826174854.199139-9-biju.das.jz@bp.renesas.com>
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

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 9f5ea62efc2c..ad38aee2efb3 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0


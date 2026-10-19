Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11564F4045
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413235; cv=none; b=QoxfEtiUilKqh+Ir8E0jYDWBECwyzeWe49ng+DWIEbQ5uYi4KKayqSm5XyS6yvXRqtNpqFSHsO2ws4pfDdPU5Hl0dCSlhfa/qI8mpQWbwXlVB5pxE6L76saq23fjeBuhkYT4tBRTiY9q0MsdW7wwliC7+VTyv+xdfyZFcfRTsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413235; c=relaxed/simple;
	bh=36Ydwg03/Py75ETTK71nGG80SBMvB5wH6/U6tz95hME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdZlUoxOTGsXSmmmwJ7+y786oQpxUNgD4Zi6ozlnWCjJmD19xTVJJRuZwMB/F+dTGRhLp7wVzu+TAsW9g1545+s5zxrFv7CtjpdnBz5g8NIOs8A+0XhAPtR7tNiOk+g7YEx1q8FhsiFRPGbe8S6+S5PbmjlD3WTaHBlSOwsvVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BAWq2G2Q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BAWq2G2Q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so1500141f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413219; x=1793018019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=;
        b=BAWq2G2QuD6WG26Z/trNDzN9Sm2IqEPyUVDzSIsYOgWrbyhh0E28hYvtKaoWE9ZY+x
         S9k6JcU8L+0SzF7QqGZ3TsSYqiOo0ofMpelYZKIf8kqy5YzuVq1ikxOhjjSUVVpM44Pi
         cgcuut2K0Oq2Mkl9u/IxItwmhtW9BvRKKonc4HoXkQqqExbCkX9+H2amkTNA8sWf5ZAM
         ax+AKszNeONytsziBu5EOROasS9q5edYGIHwxojZnzg+9VhbNyNstjek4Qv1X4tfX0be
         Q9GIsMnC3S3xFZYepYHENr+cs+VAmD0JX+PtSkt06cC4VDTmGTlpmTcURHVYc472PQpg
         JziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413219; x=1793018019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=;
        b=kWPu9N3ZFBHC2jW+ssu6rdDMeIocK06PDbKqyn47rUiS3P2+8ji0KPPBMlDCd443ri
         1e9ffKrJ/kEHzFU4WsmN7aV1LIfCMgftuL+AU5mqZIinHKwAJ8CuUw6th+zE3wG613Mx
         n5YDXrK4DB5jRC7J4tMel9ylm8UHQITJIstZ+U8sipre6obUeqEF7mBPqyrNgMCi7Vr0
         I47VuhvBDP3GkP1M2az5ZdcQcmYGCPfUW2+e0rQTBSIYxnVvuUpz0jRl7n9emMu3nZ0S
         WvrDYwbzWJYK1c0K00ZQFrpNyb77+XwfFttYsyO9C85fuFDM7e2BceS5ERlPpSsmeeOz
         1JZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5O6vv2ELw9sslV0dMv5KYP0AOtuiFbaH+DoWiCfpEe7yhXCNtd9ZOhGq4m+kW0Pzz82e70/hB+Ju81zQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXs3LwliQsA+cogV1bJBOO1wSwmccgceecwMKIoHSnr/ufmqTn
	BS7vgOoleTy9qy9CSbCLQEhuv6HXU90oxK3fbe46QeUcivYCppbzbJ+BjMLGKLcnmrU=
X-Gm-Gg: AYBFou2wgGjf0+ZkZEtYdzeUW5tAhjHB6x3MH/aKiVK/HyTrAxJTcjYHXkF07T5D1+L
	7/b5BNVgPJ2r+trZxeBp/k9Y1klW1EPkCS9YeAnGOEjmD4yu3KmsKohMfcqVIQtsh0cAPNL3ZiD
	mWP3cQY+GLnkeX38UxlEN9GQXA+la9X8+0E3AJny4HTgOjLLLHPNclqkls6P0PU5aUSIlGm2S9+
	1x83nqx/GcvxWo0ECBfgM53C40r/xc0opaPyC2mh0BNtetDLXq0hfCZMbaFN83sGQTeumdUoQ8u
	IOSsuxd5EN88tMaORpv1Owypd0lgU5srhsaPkPAI3sJgHwIMj7LLPzJub6c5ymU3gJoqYORzldE
	Jx+J6l5yB5TKih/TrJx5k5QQrGx00XT2eAVBJX1KF2IUaGq5Y7iW6i4gDb7zY+Y7s7UTzjxqbhG
	dCda612T4cLdZW9VLUSvkEJY9RI4TJ1cVHETRz9CW8MRMVEd0Wy8Zo6TxTXHMyJD0p1dBcWPptJ
	l/iSKXihCIzzddGLCliTXTqYCTVCahsSjH6xv6975+o8sBjNCwSJiufKwX5cqxWW72pUQg8E1H7
	ROoJMXSVSVh4YZiDqYnqgckchlbn0/Ou9nT+2RndJb9ONtE28YkBU54=
X-Received: by 2002:a5d:5e03:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48e07fbc4camr16385796f8f.54.1792413218623;
        Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 19 Oct 2026 14:33:56 +0200
Subject: [PATCH 2/2] pmdomain: mediatek: mt8365: add missing define
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-2-dfd445dc3763@baylibre.com>
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0

Add missing define for BIT(25) inside MT8365_POWER_DOMAIN_MFG
declaration.

No functional changes expected.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 3 ++-
 include/linux/soc/mediatek/infracfg.h         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
index 3775e4dc2c91..e360fe142027 100644
--- a/drivers/pmdomain/mediatek/mt8365-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -126,7 +126,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_bits = GENMASK(9, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_cfg = {
-			MT8365_BUS_PROT_INFRA_WR_TOPAXI(BIT(25)),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1),
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index d2cfa09f81ba..ddc53675529e 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -14,6 +14,7 @@
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB			BIT(14)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0				BIT(21)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1				BIT(22)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG				BIT(25)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1				0x258
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_SET				0x2a8
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR				0x2ac

-- 
2.56.0


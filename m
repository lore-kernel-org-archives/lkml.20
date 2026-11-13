Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602116;
	b=CnvQQeCEHluyORFA38U/Sr4Dyix2X4stLLH3Pe897HdAUv8/dCUPIhUhHYM7A4M1kqZb
	 /J/0MiJN+yRWRtIZy42Zpqgg/tZ/zU9Pz+NsYGu9FaYfWlLfiZz7/xHerQdDAo3MAcYUg
	 jlaboY2p1s+6G0cYYmY5He34/2zQ9xVUQXZNnexsSss/dUAA5aqKxGfTfo7jgaIQPgz8O
	 mHshyrEPgTGd9BVLwCLGU0OMzGJkAz/wjdLqDye7EKtfBjw6SeSqTBxYfJW5eCspy/5Yd
	 pAE9o9fLzC2zPJOPNkV1VQPnnynnCeWakLtkgjPRH66vWOoZi8UNnvWBO/206Akct0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
	b=kC0K4aPqim1Ajy0VaquBZmh9/ACdtSggABupGrBe+GGOoaSl+uyZAtpoU4EorNRBefWG
	 e26lGD0Io64agMBZVmzncRUcIeHQR4lsm3JDj2yTn/KUQyK6uVbE+zKdehYz+o/rXEzre
	 m/ntQOnHK3ihbZRP2Bfx78RSa+eo/L/Cf7iOnKseq3pLAlFenXm69YcV3iDxxeCzeXwro
	 uL2J68VcUdml+KCoNTyWK0f5bjtPYIoz/Pylxzk1Tjjey9HnuVFYGCFnpYfUKcCj4fS0a
	 wXDXccwtiNl3FPPIi3Qi6pOTkWommyUd1yl7JHg2uEyPhQ1OmO1pL/ep1m57TyRU8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySgiZkB7;
	arc=none smtp.remote-ip=209.85.167.196
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C40F606A889
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C40F606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySgiZkB7
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-4b28d9537bcso1744546b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602115; x=1795206915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
        b=ySgiZkB7BCqGrgohYd+sTkPA5ZgC0kFB6wcMtolG1eyoxdzwb3khT2CbDiQcwPJvOt
         Sa9KE9w8C+vV5dfU8AKU54E9RgA+h98OvU65JPR4I3CcmGKRG63xoqiy8YmCWCRCtVzZ
         58zZWWwA91hka3O9HZmDRZFHZ0DIyC+5EQCTJTWVadY/JclKCA1XQjap5UL8FfM50XFL
         e5UKOoKs4szQKmIFAoWQMI1BQjY1FaSKY4bQbTzuk8NdGWrVDvrL/UropW6A9P6qXQxI
         MnYTWBKH9sNN6d6lkiZ1lbzNb+w0Q78C4MxYJW0/zvJSgOTrc0/arPb7p8AsGO1ihauS
         DWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602115; x=1795206915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
        b=U78FQM+AVdkqk2OnRdGzvOaDI+lqtmZcrMan/2cLLFKAh5fl3teUDWjgRB0s+6tepK
         3T0i9rSj3YCLDiUZGk5bn3q6u2/dU2jhK70lkgvljX8/KB1k2h0HSt0oT0VBCD2pXugL
         Clt3Ou46pThCadd0S7EP0+JFb5HXklC95nabWs78S3O+aOuAQZuksenilfXbI1kw4aNt
         1KSS1IQPc1Oq3ciW7U3zmk2v7Zfja3FNb7+KEMT7BXHoMdFeXSEeVIrEOxIqchSkmnWF
         GgpRAkqrv+hMuPq5vN+JdnwHhj//FwZ+9KmaVCoMxajfGSgh9LdJ5CRPJb6AdVONA41b
         TBsg==
X-Forwarded-Encrypted: i=1; AL+hErHkjjKUgmZckPkuZO5eqnCTzTSUN23zw6ipFWt/CywBc+yma6yKhDZLyrThW6j7kuaxyISlKF9vRbFL4EA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qL69WAB9iYzvuSIBdUUd1899z8Bjy2xYRFRtETuVqN6zh51sz
	j4W+gIVHdeIpmT4BL6OgLB6v//LECIQ8LN36HadhjLS/od2kKNtFaHg/
X-Gm-Gg: AYBFou1wQbwY1zZfLwVZsndvgltIjD3pCiCvQ29Aw2OHZAkl6asPaAZhxECwqhO8ZUV
	PSzUrlwHrm9AROWv69Ksoj6erWqRfgMtCHfhSRwSzHdyVkscsP8eenfwdZRXIZgcQ3OghpAYb50
	EhQPjyyH1AebRGcekNGGO8zWuX2dryCHhNBVJ1L1XfcSI/lw0iV4rHGSNf1qdRMidtq1DiTklEL
	mPAqjBpv+uEpCTITJN2wN3fkIvnbEXt6AdBfdJTBqDp8drsHA9hmMXHPlNKUS5wXv585CEVyDBF
	KGkyhW7Ry38si6/00OrbSd/Ww7dtlpQiy4OvZpYo+0WhiJahQhh8e1+rQSweW0Nb0tEsm812p4+
	2Zov7JdxQ28qcOw/mcOL3PsI6LIphk3wZ5xFFRiK7c+aqdHWRW1QFdbpNgcay5UFZXgBu+hlJEc
	+ACB8DMiRHx4JfrWNh93P5W4pUXlg7p7CwlKwNUnaEgHkJiZQE+cnnLQ4J0CS+NtgGxkKJ4mdYj
	Qlajk6VUNq50uo4CsI/zIdNQmKXbCUYA1/ZDv9BGVL/K3qqzGrcOOlvrc87cjruUlf5LOk0WSRT
	h6H+OwCN5mFGORs4jz1Ugb7spxpAYZN3SzmKRwRSYStiIiracCrh3zQRM7j+oS8mrXmF60P5upk
	f06wn4/75nc2ScDm4LRQ=
X-Received: by 2002:a05:6808:1691:b0:4d6:9133:cfea with SMTP id 5614622812f47-56cd8ed24a4mr4376780b6e.47.1794602115430;
        Fri, 13 Nov 2026 12:35:15 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:14 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:56 -0600
Subject: [PATCH RESEND 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask
 width
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
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-2-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1505;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6k5SPDasHR10JbeQ/goG0GjfXjoojCF7pZ/1g9TWB+w=;
 b=GGeJS8jm21rjpv1QyTbpsKBtZCTmbEes2ARBh8p1OfaWD0t2XZ4J3BHySxW23bkyOdUv48ruh
 PRoIkzSIg1UAt0oRD1ii2tTNNj083KeKa67msj2r1YTGbGXjFo0ryOP
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().

Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
FHCTL on for mainpll, mpll and msdcpll, with SSC.

Found by inspection while fixing MT8173. I have no MT6795 hardware, so
this one is untested.

Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..ff01cfefc31f 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -79,7 +79,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = _slope,				\
 			.slope1_value = _slope,				\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0


Received: from mail-oo2-f1.google.com (mail-oo2-f1.google.com [74.125.231.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44644370AFD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789195261; cv=none; b=k6mnxUNwCIcTmyKk3BncXqA4LciuFjZjpugev4NkcgJNe0oZem8peIz1rrgYeEB14C4XAjEejEsmvcUJT1bz1cBNqD0r/A9zwpdzJdM+8kzd/suPOfVbIxu89i6yEzt473+XP58ttAmJg3UmKoevhhatnyS9xru9MvpPcjFuWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789195261; c=relaxed/simple;
	bh=rK3LI6EEJl+1gc/J0Nqb7f1MnKq7lREyQo2mSnW3Hpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lStXdRbmz+DDUXYO4IgUPhHMWTG9Fev83kCBJ12mVQ2Zot+6ok0VsErJjm848ltZhnuDKSLSRedoCFsQVGf2w0BE3MGlcSo3pZuib5YXPESnWc9WT1G6+vnzy1dtEMeOwIsmmlCalSdI//qCyJHCYh/lPB2vzgUY4KINVoXAy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ87XUg+; arc=none smtp.client-ip=74.125.231.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ87XUg+"
Received: by mail-oo2-f1.google.com with SMTP id 46e09a7af769-7ff1e112113so259038a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195258; x=1789800058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=HQ87XUg+C+/FcxQn0aTEfApjtD4uPso5oIWgiFI5xlDiy4I2BrztSeb/7OBTlX43WW
         FzrYf6qlz7UwIaaTyTonKNqCCpFRn/zp8PAfveRjub9lFyYE2d5YaCUw779hIKlQ36u9
         YIKkMSCFUGzLc5c/umWzl9VjI5xNyxOAn748lkHTUFrbzApzmMrUXLuniVSnUeaWoD2/
         65R22BPe/NlaOcXlPCIRnnMu7LpsTQRnO1l8U/ONAGagN5EBYguFDw/FNrOohjfwBMtw
         UPGseuLxmFoCEPMnESwKH/0UgtvZNNZi8UCeCJQ0LmbI8oCDO6VG5V/doMhGfl62iX0T
         YVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195258; x=1789800058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=qdBMSgpDvNGaWWSnpxtGlBuUuVBepwDLfKUmfGX/0KC1LavZtbWPvZZ06JgUI1tw+e
         Dh9MLOr7G1YVCKT9Pb1MNaHjBclG12B94wMVumbdsUnK4v5XCSdh3hmbPHRttYdUClxf
         YAx+6DVzcV48xE16oQAZiYe+nIvNGhkv5HcMQWbFMAXh1BcuNib8IABqX9nz/upIzhRI
         t5XwsRe+/CVRnqt8L1pLvLci6Mc6MHJI3COQylUqvnw8l7YF7MgA13wuCfINatw5JViK
         S6kFS0wkTKI7yNnOdFpOwHl9YFECdXtT0IFCXj+yFa4vVux6/VdrGUAocV7SjNlBmhtD
         0W9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBeYFmKNgrNUdr+qPRuihQxNo4oBa5oMk0rNFoaGYjgiMrlGKopWsJ6gbxgA5CXeY+oX85LFErgOVe/Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++lmrCVN/2vJnc3myH2LsCHmq2/7jgHofdY3DPF32ztA9db6xtzV
	wSH1pe60UdCFrhkUB8X4HMd6eCEK/ehpbj+FFGEI8kjafIgAyO1c+E5K
X-Gm-Gg: AYBFou32k9lsIiB2yPvO6h4sumYtuLMR6PgNncTCZ1X0z4SVOvkNVW5vp2x0gV9Nmvn
	WnGwlhzlD3jk2FaPQfqqZkdrGvmXIUwMBCjO4zQud0g6VBRa/KcSGdNzePp/4PLSojB4ImxiFhG
	ZsZkxhGZlIENaliJAhXm3EepT1KZXKvswvqCaSRnP1iM/kq19d2iYbVwRKGq4ETdGjH7kM0Q8Al
	1pBLVBvHtse6FJjimzQtAoitaGt3M4k7KieV9hKrmwLIJ/CYd+96b/BllhSbd1UixAI8D9RxpCh
	ID9gxNaWgLt5tDP/6HNcaJt1EZzIuTQWaAdhzY0aVKEEpggieUDBhVIQfQhcOojJuVEPJiz+c3+
	m0pKXaSKoj+ZtIEK/WgBrmqqlRRujPnux8BlM2If5YHtnOJuhyMyGlg33WQgez0rq8fQB6WOKS4
	JVn/eLKEtHL1eX/UbRDwNcs6SRHTakjEXQKc4hPwNle/FodLiHASRe6kb8QcO7hRg5m4s=
X-Received: by 2002:a05:6830:dc6:b0:7fb:547f:98bc with SMTP id 46e09a7af769-8059e14b758mr1096817a34.5.1789195257717;
        Fri, 11 Sep 2026 23:40:57 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:56 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:37 -0500
Subject: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1697;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=rK3LI6EEJl+1gc/J0Nqb7f1MnKq7lREyQo2mSnW3Hpw=;
 b=aEEsL7VWo3CfcnRgQNR4pSp2BW0HTS7IMmCb+Oc21O48+SIoUTLwp4mzW8r7juB7bII0JxlDE
 J6mym376UJXBuM4QPyxPLfo+9VhIWv/sGKsTw5ZFgYRdJ6Q1/Kq1x2Y
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.55.0


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB2F496D45
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633372; cv=none; b=K63v0CzAfgYW5oYgswAs8Rtb5CT1xwsm5jNUroF1BAah2FswQCoR24I6NVnh6j0cXPCQ3CwQjje6uEfkbk89b7NA+XhdcQXyY7po8TgPxn8KwkKARhhTL7PUoQ/dHUZpvVE8hf1VlRg1CaKYuSTtpdh4gh6l9F8/Jh+GAmNV3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633372; c=relaxed/simple;
	bh=IVqzU4OEifD0uEUZ2igkwS3l+zxokgSiBujrja3hoAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFOddPd1iiP/+psFD+nIIISY1r4MUPjzdvjyxUl0Qp6l7qaj3sudLQt+kbIHkBdsVgxlhz1CiXNyc63XOahp4fuphSmgZgYN950UCgsHtyKMKPo6ex3KrEh4LpJf6XsJQaEykB1ctOjKLqvCbt1wayMqy0A9jKeXipuB/z0tESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwuHhiWI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwuHhiWI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so1960185e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633369; x=1792238169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=AwuHhiWIkc4L6UaWtUpwJcW3bLEUBy6f1BcuXWzgGVRSFBIDVpv92IxBUdRQuf2Bon
         d9DYRaTS5haYzcG/UyiIfiYdKNyskk0d+ID2hxneuxaHjYc+bUoBezs/3OAERYpVULpi
         lczhhogKVvc6dUBL68pbIULiaEL6Ju38Bg3rBoYp7gb7InXPGw1atqvsKFDeOKtqPTQi
         BKuqL0x2lvhnNvR2t6lW03/9djCh1owbgIRCQAUm0+5g7SUiiGFJfp/U2OlQqJ/OXr+q
         ncJjD5napTr53xhvsaCUY2CvO/e409PjF5kfGTrw2ZlKyctgf4+6jR04iuZwqh2JbyDS
         szqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633369; x=1792238169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=pLifwpoW1cgxTMzsYKfuOw2ZsC7a9ef9BonSloB0a4AIew95YXHmQZ0kJpmmvOiHbY
         JrCd+AcNDNZtEo1REfDGoDOgUweK1zT9llQzDpTZbhECBxtHB+GN+nJPraJyHWhypuuO
         CdI4Zj7v+hUz9GirZ2fZYXBg8Ymjis/AmLpIV0FA7DGSaV4GMzqS8heCqNoa60ttLrOm
         eINnYJcETI7Am8Udz2uUH51qUzFJBc8RX6zIgh07Y4ytWLbZg1coFOHyc/5IuKr6yLOQ
         WocLZ1sIBCWjfPg5/iJFhnXkIwljIbLHpS5sxwaCSZvCQpfNb1TJh0ZtkCMSnSuKron/
         NpFw==
X-Forwarded-Encrypted: i=1; AKwUvByMN0Se3YfYGC5N8R/ZF7hQZeqn9WYOmjesgJTTuvf4lqaf48k1RJXvWX53IakxpFc//4n4uE4VEeaeXPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6m+jjw/AgXav8vTzJxpS62bKA96rwY3gHKsCzZum6qIJ0ayK2
	UywhCskWnhn54qk6EmS5rS3oPxBMd6Yzb90pBPVU0iKoqWtcD0GuYspY
X-Gm-Gg: AYBFou3w7tMTWUlVzM4pjrwLNkL3OXNzWNQS/3fLQ2LjdByQ6nFh388Wse9EAOzOsU5
	TtSPW4p5AFJdomLy4B4C37arvF+uHulC8mUlKODmZDkbww81yEDEI7alDJlKDlZRTxsD7XfzbQE
	aCgSFmK7MkZ53LeEda2Ht4dLOCNxyhEeg3yFkUzdGpXDrqk8+L45rowF0IM1ExSPhswQGuAwESo
	pnGnbptyBWE2a9CqNQcH8So0nG6zXFL52Xy+X3ANAW2xSUvp0r8tnp5Q8pQ26nuWaedVewkm9Yr
	jXbPlA4eX5Zt3olwlgQ2Qz96hhkkzrLdZBHI5Yg/FzHsvLjBRLIWaQydIf3oTnot1EcFBrUX0Jf
	YM0DP7cNjopRERSPWwaKedZ71lKwhLN2WMLnfdDdKLKsoCeP3X57IMzOd6gwif9D7SrrcnKnDUW
	D1fispI/+YnNu/7Y8w0Ivp4QZz7swTHqUVabLbEiTSloRuXThvLJPP74y5bzDAjNWeig==
X-Received: by 2002:a5d:5d09:0:b0:48c:6a6b:69b2 with SMTP id ffacd0b85a97d-48dbaae7028mr6208118f8f.27.1791633369101;
        Sat, 10 Oct 2026 04:56:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
Date: Sat, 10 Oct 2026 13:54:05 +0200
Message-ID: <20261010115539.9237-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like mt2701, MediaTek mt8167 does not require an ARM supervisor mode
call to toggle HDMI output.

Fixes: 511cf7d12331 ("drm/mediatek: hdmi: Add MT8167 configuration")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 738090a47176..9896eaf81e7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1214,6 +1214,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.tz_disabled = true,
 	.cea_modes_only = true,
 	.max_mode_clock = 148500,
 	.ver_conf = &mtk_hdmi_v1_ver_conf
-- 
2.43.0


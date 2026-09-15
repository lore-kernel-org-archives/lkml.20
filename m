Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A40386C0D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469014; cv=none; b=gl4alL8EHrG6tHSwrSL5NMTukbs4NMYubtI69bKicq8KAs6lQoOh6cZOb6HPsKXQqcVx8/7BzAaHs5EIWvPpyODgaj0ZO5Uo53FZxjdSns6Le+DzVGEtCzcVfXc8JmSGsD2v8AYoXfNMC703WjZ41H/WfOzP6slSTw5uK80U9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469014; c=relaxed/simple;
	bh=T7svtQCEZR4NbRSxQOr575LmZrX+L5qTFSBrf8JfOqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GK7THUxq9rNMX4WLMv04l54+73qYWTpK0cI746itCFF8/oil7/3EtdLszNa6Mj6G4vVQnoxkArq+IpbdPxkd6ToY6uvfCz4egaeHuMZm5O/PzwMAI9bLt2idW+S3CxGWgHjQivVCkYJfHQtnsVSGdh640rFQht6SWSMs++xmLW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEqcvPH6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEqcvPH6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so868865e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469011; x=1790073811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=;
        b=hEqcvPH657nPit5JpSf6aeSK1VzhHI6/z4DvU7Jx68BhE8mFNi1BaBxHTmTg7umw7g
         e6UG4jykuI8171FDngJ+5BVXcEHxOamop7TQ2lR9SsK1S3imgkvL86a/F6fBmoOklYxz
         enW5LvJe+yaOV1n8njhYkPazT/3K40HZuP+q6/C/mru+rR2hnmUo2M76UJ+Z2yES3DWP
         Q4SzYijZo1XV3ve/MC3ViOglGC92NwnRP6wfU+gCqHT/8+QIWvwSKU8itQ+ixebyd4kT
         kE6T0wJyzC6VHuJxskHi/mNoq+820cMKdR2W+D9FvU9TQvDrKnr2+RdAAWdfNn54GRW0
         Hyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469011; x=1790073811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=;
        b=zWNnW1cm4z1u/vaqu1nK+sclrtck/1MhfozUQv0hDcuLHe4I/AaNPgkQ7uD59kZ0iZ
         VR6hjqfqEgX1tp26TbrvVPuJKiYDJN71m3ovePr+B/zZHC8Rm/VqxBwdKnv6/8GOcGpo
         Y2z5p8x5MRSvlNocBCuimX7jWc8j3SDLBSgSHvJukPo5OI29cTkdHRVkJAn1ud1oRJgc
         UIPffnzs2mIBUMQQU4T88/DeJQnGxZMMATJ7y9U25lAXE/hhrspqab1Ru5BFsQZTigpk
         MbUufKaPFNM8W/+MIcLczuDlii8Jo24W6EbkLZuD4tXQkN2UCm1GnYtEEHYmnb5naXw2
         F0Mw==
X-Forwarded-Encrypted: i=1; AKwUvByLXKnSAyUo9ziv1mUXTw1nr4hl89cVUOZaed24yiZpmNPf6X/HA0WIahGh8xae53Bn3p64DvfZUIgrARM=@vger.kernel.org
X-Gm-Message-State: AFuF++kg3AZi4OTH7DTowh4nTK7b6cLlKEsmlsz//F6YR1bIt2glL+9+
	c+iu3m2pYf6U1+FKltm6nyFHexRCrekuE0C2e7zyjH1WLVi4P3FIlVZ+
X-Gm-Gg: AYBFou1wgZ8B+joYEnXXKRwQ5V0tauZTZ44I/WQpflFlf7ozbabrnmPOi1SXO1V81Bj
	eofwV24WyN/OiA/dhfUopSUsvUCJbp/1on0mKcMaT7Dddr6VhKp8cGuoErjNrh3vulmgDgmbuAj
	FPbmGtCRdWsfr0pDgao36ZWRE+vkzRy5yAKj5KRTe3hgwkAs6Re5HWRQiRvzR1OihHsEbSXOLQv
	l4lNJful9iRQN+P9oU2La5sqL9PwdSVsKkHnF9XSmrMvITnrP0ftt0vvOYXR3VjSqu8yPbCnV0l
	TjhJItTmdqmFoAYz8Cyd8+i1hDkn3K4bXEAuArBcKTPXm54f3tR2ebJ/p35YR/bW3zu/1Q1mrXp
	fePrpkn5UOoQb5OwNOgxGKQsjE/fGjttUitseK9rlmi/79G4NpCOMWohLHmlci25bI1nvaFfyAi
	R45wPaTdKMb2RfjQLFCMCN/AAjgIk6sC7568YFNFsMNVKaT4uZiYVrmN45DNK7P+M4ViNMYQD64
	3FXilcwK36z3i/EuJ8fOKsgCZeXpr7/oBSyMHAluW+xyU5wFD4mdMWWwnpC/F0fqxRE5PjVjF0z
	XA==
X-Received: by 2002:a05:600c:3516:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e82210b64mr9351345e9.8.1789469010714;
        Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:48 +0200
Subject: [PATCH v2 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3576 variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1842;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=T7svtQCEZR4NbRSxQOr575LmZrX+L5qTFSBrf8JfOqc=;
 b=eQvDxheF72tsvAJS32ZkaFvXX6NNWm28Bsw7F/w1Zy5QmGsgwEi4egtVnZZRjBKNhf4WjFbAW
 h0O3gsraYFIAa6PT+HoD2V4W8Tz+gYMZVjRPi9SOtZsJl8Lzfm0kax8
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
phy-rockchip-inno-csidphy driver, but they need their own driver data:
as on RK3588 the GRF control bits live in a dedicated CSI-DPHY GRF at
offset 0x0, while each PHY instance only has an APB reset line, as on
RK3568.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..177beb685f70 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -403,6 +403,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
+};
+
 static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
 	.pwrctl_offset = -1,
 	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
@@ -435,6 +446,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-csi-dphy",
+		.data = &rk3576_mipidphy_drv_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-csi-dphy",
 		.data = &rk3588_mipidphy_drv_data,

-- 
2.43.0


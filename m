Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818628;
	b=BLS6rtYkvvR0dklxLyG/LBVBY1+xGPYHxOKFCL9Rl4TgM656URIU3+gBN7IaRlq6qWVV
	 95cYpg7uzr2iQ4oXUabLrDsEtJQPKcFF/SFk+/LGv7EDvUfK2a6wJHCqAJ1q6Sxw/zMHW
	 mPL3+f0LuHHJbIIAPxkI5s6xivZ0CFLtOFe19ySg1t86G/e2pqDNyk0QgzCH0d/LPQ0st
	 WqYzJarbYAo5kslfYbnFrvRSoOyssY7O5SiPTphC89w2mCt2urJkiCouefDDhZoDLJQ/I
	 VqI3lXuBLm3vFgMAdgQhvzUzAXbwhtzBkg/UGftjew8sKWJENcT6OHXMwaMW1YFyTVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
	b=LI88ji0bC8LLelLuQJEOuWkEuklCAp8rtVTh2Uz2fHKyRbv43ls+btixomHGnMUVRk42
	 AE36vIrYPsdSvndOCRkMYsn5ZLDIRtBdV4saLBp1pcUER4VyxwXzGsH29rsYCZIxrDdtF
	 kNg8ZMRSQ2MNx60jCrwE85fMDfDw32PloNbON+TjNEgOGS6nO6cEvrvYg59lu8bbtEsxa
	 MlZ7w3d82JD6sEEkHjPTqJ52/7zxU+6KJF7myrHnaHSfAD0UefiICIPgyGrynmCP6iO/w
	 w4Od8zTVzeWOkO3HN9agt7hXs5SZq1bZZcKK1WFIGRc9R3IGS+e+FHaT7ZsdN0pm5UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ED7xfZRz;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48D608363D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C48D608363D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ED7xfZRz
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso934936f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818627; x=1794423427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
        b=ED7xfZRz2lRptejsNyKYEKbA3m1cOzAS3vT0nJOXZPpfcuT4umorUW1Fmb04j4+s6N
         SuyIA1bw/z8m3lhRNHnfGILlJWkQJ8e07NaHwMU+RbPNF80omtboqeYD6EwSdPk+pqEg
         KdpDuO0Qgg93CMsfrib+2b+ZN0cNQHNbZa/Q+GC5jyc5AzcJ1DEch2cDoNlWWTMziZr8
         2fun2oXcFvOVwDaA5LwSX829IEklgimtT4+l/ABoYKr2HBE9+CAxwir7VA4e+pYtM6NK
         hWBnWB894Dq41P3/Aq/UBaZ112bbq5Ph9E3lbtk1q5qPps8DCRO8ovWgR9ztrKtvseZU
         VTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818627; x=1794423427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6QSFeWBFed5RRDCZFUyOzGQ53jm2iRwGaePUB0IWS8=;
        b=KyWB1C6tUdfF/2qFCHT4VvdJSrFBMGB+YDHHsXgtMbwPyxbPA4RSZ+paJsqmzsvwTA
         wNOqvKKDIlEsCi/HOuBCT9x+9s3XuGq6q/sA+vLbo/J7h0ltS78Yk3f800JhrCu1iV4u
         VQQzr2xG3xHeuJ7jS9OLxcIwJdvXk0R6Ff2qm788imeU3DxEcjZdNhiwKjM6LKYumC9V
         zv9QLWPZLIN6bBQY4+9HOP4Q64/Y0egUdUXd+w9YTkMUfHSS6ddVajdWYVpjOIuAkN6I
         PJqtU2uV6Xj1z++lp1QsEwoP7hreJLzJm8o2vefS5oH8izh0WI7zQv9w6J/3AVMoX/xh
         4psw==
X-Forwarded-Encrypted: i=1; AKwUvBxtVsdQtrVrPIND7cPBizvmNQXQdZF6TJ8YYRH296tL/sOfutb8vIAS7BrwC9KE/WtEh/iev7XqC6SXDWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YaxHZBwNXHnRWTt9CYvogmf7DBvnu3ryEMgR1yR2fiPlm2WjI
	kJkAd12UAuXdD10k3zYzla6TJrSYuddOmDhs8RLHeoG8WBZ1BH6H/Qbd
X-Gm-Gg: AYBFou08V8ct/T6TSNWD8ExZMY6c1Chsyhln5YmwGUrjypaRcSeDn7mnthkz/rJ1OLC
	N38US1iKvyw7uzSlNPuqsebyf9BP/doe9MyELZRnHlnErNHOUBnP2Swku2FbMI4c1zRNhX2rkqV
	fZ9cr87oFDOXTMJ8SelJevt70pDWksCa0/52oPs/bLlTepcGU2TLv8/Z/LlWrAbETKgl94nk5p7
	HSyO6+jWf3aEoFbHperiHF/C7hPyGCKWrJEgudTxM/wg0zy481YThUqQD1i0SOfqMkPnOlkWb7M
	Yjshp4thSAWnF+bBUSU/q6U7GvhhTOxHcYf+CphWGEIUwT37IdPRM7CqvbIds88MT4MAdt3jBau
	hlEMDvIktUvZ1l+GXp44jBC6T8e+XgsdFeAH972i57qS9jD8KNv7BaqFJGGGQAny5DcCzHOz5wS
	0CdWPvc+zlzA+rqpXlXHcQp3Uzh65CCIzEGz1i9objduVk33PWn96G9GVKDRsn0Gi4GNzFPBe2G
	l8XQJII03DUNE+U4VjF48h1yF9HqYF2Fwi8e50eO1NWVAnFS8MkmPtat1KR3mxdtxkXurk6X9EZ
	mgDRHtBgqbh+kIU+5COTMocJqCGc5seJ9OYhrxECCgwKZ62LPJdgbT1BqVsTvijpWkGEBrqw53b
	itIG6FsTlQd9j+oX26lbMk9l1J0CvwUcrC0su8gQ6YhMEogQb9ihwWlsnT4YRqLjDbxGomlvaAg
	OaiZHvg1bWvgT/Jt5iRdqXLoCTImzii7fCIPcZV9Q+/5DfOfuAg2GDqji3ZrSb+LkNvfd5UsgQL
	CcJ4GQW/l/RMJhZV4R4dA9MoPxVTNNBdsxa8T06smSCV1nrkzVniawhdypfceFY/Tc=
X-Received: by 2002:a05:6000:160b:b0:48e:7476:9205 with SMTP id ffacd0b85a97d-48e74769219mr22849870f8f.31.1793818626772;
        Wed, 04 Nov 2026 10:57:06 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08343dsm5463560f8f.30.2026.11.04.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:57:06 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
Date: Wed,  4 Nov 2026 19:56:59 +0100
Message-ID: <20261104185659.884455-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
undo that, so the clocks stay enabled and every further bind attempt
enables them once more.

Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.

Fixes: c64c8e04a12e ("drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index bd3923ef5a41..983826001f12 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -209,6 +209,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 cleanup_encoder:
 	drm_encoder_cleanup(encoder);
+	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
 err_assert_ctrl_reset:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


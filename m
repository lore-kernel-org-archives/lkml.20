Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841840;
	b=QFHVVM9iP3W9yojdl7pQDdSaNQFgrA82TfN5b4zGJtKUUtAiZfDRbq8O4AO6olqqToh7
	 lhicf6iDNZoznox9dfwtl04+cED9LwZunyDhGeMztjQf08tL2ZkL9rg+DbUyu+F5r9fAB
	 uLPBjHD3ExVmix4K7Qc4IPylk0CQ4OmUTfOaNgUg7Nb6C8drZezSlVNq15MR4gjxNkYkH
	 spvqT3X5eT1QDo+1aBqGm+II/Uu0UFpJi596uLrwPYrdS/PI0N+oLG3ODFWfLXgkGgEAH
	 wxyTBkBf6ps+DYgc4tshwi5IfWi4g7FrSR6NL9RqLtXdd/Zw3nrOiVvmMyvyls599AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
	b=1yoX0w7bzoywNOovooKf009ZYR9uBO03ld7ygiMiT+W0ZUDwbH6GDONhUTN9lJA7901r
	 jQJqCsg7hr5mhQ5f36lQ8NGRBVG94XKpfE0xz/6k+HZR41tuRDO5jKF1wlEZv1IhVa063
	 0pwHp/gExE2PlG/q5NF9UDBOxNOQNd9D1VJC8veiNMC7zEXDC2jiMGjx33+8MKj+kKDq9
	 hHbtwhlafZGm3iwP5DFsDt9DT6lY+JhnGSxTwvZqj14vKU2OkFXTq15Uiu0AuvLeoxVNP
	 Qh+j6AXr/E6QxMGqI8yHNeTf/iCTNZCykrwZYCVev7V+rnTygG/Nb95UqzIIVJx3leA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqDnQ4ZJ;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030BF606A8A4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030BF606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqDnQ4ZJ
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so705269466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841838; x=1795446638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
        b=mqDnQ4ZJ7zwYwP3nxgwnhXAcWGsxhZ565e08TvDBYxWTwGtag4ShjHfVvPPb+MTgvv
         QrFw2XAUHp/Tpp7lkczRLqwEtRmfMB85y3//HcE7VQNBXNNifzO9CO/ok7f88Sp4y7JM
         ueUN0lATdB7mG4PCnHvr6gZAI4Y++2n8kitfyIEdJft+4qpO3rag2JQugk+daMTtPAGj
         d74TMw1XH3j/k7btnmVLAL2TgWZL5kCme3KCX3YbYGj1h8E4Cb3UY66BpmtZLeebbWDn
         OGUBwKIp8pXHASL4AAcGhwXHmSSREqYk/P2Ql57B6FpNKowNylEKCE1adQKBmiXgpVrZ
         CcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841838; x=1795446638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
        b=018/zYss72/IC5jXsnh5YFKliaXVq32dD9pVox9lHB4CcgXw+yt0tnfSv+E8MuGjqO
         nmyxusf8mf8SHku3IROYCGgxHrt/TbaoD2THK766CLotSHy/BpZ3Z38wwMyHNIQC8qwD
         LzXt1ozTtkIwUvrjOoNqcSUNQlK7jHqSrdEaAVThOR1VXPPt96v6NrqSs29K2IPUD6wa
         3HP8ZUR9Y6M7M0wv/AulTVOYr5oiZ1NrJ9TyqlJQjS3q10Hek7rr2vYm4G/KMy/AGjFw
         FnurM5EqKGyTOD3LuL2/nth+TEt+DzgKXb8m9zdhllj5Y/g42buSL5whhbBu/gfFd93Q
         4jFQ==
X-Forwarded-Encrypted: i=1; AL+hErHT3eWF5qRbVoKoN8b+SW/Opo6NPSPI56lj0ba++0kQwktrhvqd76PzNmp/5xy7AlDCbseM531K0ffm1XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b8+S4uqqKHczyow5iKGEXmJPtw8zWwRKwtfDRQRxPx2Hl6H7o
	R5NshtJyJZzLAaAU7G2iP0qy1mnmH36YGBKc1W8VevPS1J04oZ1G0zYx
X-Gm-Gg: AYBFou2Bj9LO/e93hOE5rT49YRYPMfRnAgwIQPjci2ylwWr43CuGeu/xyB/G04rI/9m
	q0t8n8qLAKkQPVLhxq18+Qqgf32YjoFdvb+jGmBSVxqU44g5TeGhyCrbm7CACAtsh33RphDh2if
	eZf9isSvRyHL8QxJKMcd1cUga/Kbiyotu8l/BaRBmhCOpD4/1U97xvXqZhVPE3v++EFP1PVd+d+
	PCJqkz2T8V3LlNNxOQaG0bTZkJZkbT+laNYe6ObCPXkMk4qsX8fYn7hGfSjLcZC6PIIgTZW4OEL
	CYxdw9+I3fhwXJy0UwpP4NHwKn6+pIskR+4eZL113cL1K1hNUMlNbwtOaatpXlNiqJuDXtVDF4v
	h1Bfl2XoAINTGBxYBFSMkVjVqsow1Ygu0Av68EaNMJKESMJZ8uOxcEVCl9N5SWuGjM9eq7vwcT1
	JqT8KvpTMcbBNtIYchFhG6oTqYdLHpYFeaOwr7nCW29bKg1U+dBimhlD1hJ/RCVjdXlcBqrP3o5
	iostKVGEIwZQLe1Z2dGeyaKiH1195HE7jdYg3WL+8GX18IySgUXqPybEok6GUXajUlqlfBI1oFm
	apFBcoju2YNB5MH5bVUSKdlRVbQWGoReczqjNcwybdItT6O1ua+JWKXqwvP2LbUazqP/yU9Mzol
	XRP4PBqRx8A==
X-Received: by 2002:a17:907:3e10:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c50963fae20mr823362866b.45.1794841838314;
        Mon, 16 Nov 2026 07:10:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/12] drm/panel: panel-hitachi-tx10d07vm0baa: Drop redundant disable() operation
Date: Mon, 16 Nov 2026 17:10:08 +0200
Message-ID: <20261116151017.274764-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

Squash the disable() and unprepare() functions, since there is no need for
host adjustments between them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 318ece68b7806..153717ca6c90e 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -177,7 +177,7 @@ static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
+static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
 
@@ -187,13 +187,6 @@ static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
 	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(50);
 
-	return 0;
-}
-
-static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
-{
-	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
 
@@ -236,7 +229,6 @@ static int hitachi_tx10d07vm0baa_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.prepare = hitachi_tx10d07vm0baa_prepare,
 	.enable = hitachi_tx10d07vm0baa_enable,
-	.disable = hitachi_tx10d07vm0baa_disable,
 	.unprepare = hitachi_tx10d07vm0baa_unprepare,
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
-- 
2.53.0


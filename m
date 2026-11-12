Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500492;
	b=imMDjujjmEAzJvCHc+Chmkzx+uYy8Oz7p6kUdBCDfJ1HLbwP14+NqhV6gZDRB467rGSl
	 JAyQq83IZYNVC9vHC/+roH9bwHnZSRbcSwx2nk6CqttQShmRjbBqq/IKi9jdcloCH9sk7
	 zUwlhanlowsCunXpH9AnDuOHZ9dFsBCofJdG5ruuj5XMN4tCXrvU9EoLz3m+KfUq9xqCE
	 519JnWxpPaOg6ycSlGbrpZoXesN9f6j7+UvlaFljkx7WSROD6ZS2uu5gyjKCGO2VVrs/8
	 o2tM05koRm6xalkm0Bc1ibJ7IjO7Bg1pju+HrU2qXwOY4+R8Vz3ubHasEgAZyODLOyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+tpnmaCejDTdKprdiXgHKHQFYAbbd0rQZxDc9JTWdcM=;
	b=kiZopULYl0FpqDXmiPAbWXRfnO/bflkyrjBM4y12MhMT7hR1wp0kD+u3JgVEjz65qSij
	 ZjzAXTHHw3FlusB5ZpMaOLKokrKdo//7y+rgFF8AxltgeZf2ttvdPq7uq9h1stL0PndCG
	 D/kPXRnDiksvqGgoeKwGfNMxPZR3WPL/WQOj+d4IaUgIHvSUqHMDKrtt9Nt0VRfdzVPfg
	 iczsKa07h/A8MjeQ8TZ+gFesSTEucUTqjCIv5GR0pAZa3CzESX7FxfIKANIAQC4NgBPZO
	 AyZ7XbGAaprlzqKOl1REuuJttPYglFOsNTb3qjOu3I8P+kB+EfBHFxPCEd8MXws6/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUaEIJii;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B61606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fUaEIJii
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so31278525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500490; x=1795105290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tpnmaCejDTdKprdiXgHKHQFYAbbd0rQZxDc9JTWdcM=;
        b=fUaEIJiiAGmcdBn9M/kKtwCuasEsy0nWg6aZVSLNqsB7WuQGhzpIJdAdS45l7ftUzD
         WbK5mgH5y0uoZxWjthqUTVOvAGej498I8EHUdncorOahv8YR36loJHbTenULqmB9GEXc
         MlYVkzDWvQhbvPDymGsn1bRSOj9oE17NUuRYZLioxDU6VNKblOXu3hVXAAbgLRsoeAYH
         gO9xGf6h2iF+Xww5RO++JhUPpVGHcnUsdOLacut4A8knHXMNkO8UKhVG0c8JuZsf4ctd
         9bTjI4jiwkLpBbcCQX0IPYTkdWuWmOBU8v67D3nbVklhOLCRa2fPQ6QD9Oe9P6rfdPdI
         eh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500490; x=1795105290;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+tpnmaCejDTdKprdiXgHKHQFYAbbd0rQZxDc9JTWdcM=;
        b=tf0t2jxt5bYss0Gsfl44HOJ7EgVLq96P1RohVDzMcFabY31kSYZw1TcjZIC9jr8Vsq
         OTOpdDWDWQtcqs/4Vv3DUVbJrn3rMxEGKGwP488UXo8utnd1dGSR9U9sjJ2u12Lq4jSz
         FygbJop99ZpL/aSnMQh33E26Qd3PAphmyijKskjGCzjYN4+72GhlJTxSVyFDi1HYjVOy
         byOxp7G+5gSpGISE5rBoJygIhqtB+SscolsdUWGP8Y/dLVdzAcfI4SGtAhHIeLZxob0T
         H4hyowzJT4H3Fo7dn8utjMKghVyT0mwvoCcbsCpWCSkZow3Y+WVWYEEpU7XBhkx4cuNS
         cazA==
X-Forwarded-Encrypted: i=1; AL+hErHuUFQm4hRaEt5Vt9kyRty+LauDJMDsrKRYOKqTexru1wgmD6VH5V56wJGVtbphM/z/lEFK4O1OHalJZAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XoYnyTroAGg3KM5AsWAWwmIQ6ZUENLd+cxpRfsETBfLs71r9S
	U+8XkLJPEClP2ebuUPwuHSSHt0PKSWgIuBiami99OpXX7G3upAKuiVlO
X-Gm-Gg: AYBFou09k1rLQ5BJPjGDSJVDnLR822/WvE7Xe1/KLd6diDaovZbz/8IPw0kP0hGZcdG
	MzZckSJPPZwjjIKwa3uT1AxWXnVG4cjTxXwCFmMIJpc5z3D6DgTMeVsM9cYe29ww4kExbWxCTcH
	Guc8o5OIGUsNHnsghlUZ4Vvbhx6UVdnnSE5vlJIqIBDWmnrppFgi/shYMGVs6HFKgwTPyNV7VEb
	2yvB4vhy9ZEWvQLAW4BDowzOAIHXslZssA7foJHWXYmIIVfdXJntATd+YcIQuLQ59HU8LzBwJdv
	puaNwRiEO3eRGYAnV4Z5XRP8w4HiYUGjddWN9qIgL7UxJkJ+8VhgRnAPSqpeleDuwUaJ6EhUXYs
	iCNI33gdgjZbzXQd94FbeK/kbRhUatHWV9zn81IUiNl804SLp4LJ866NOUnn0k6zb3E0zuCSKAW
	RUovI6D3B5f7YzfZhS50oytewi/QYGB66svdKBU6ycY1NhMTQM6VbYzwHVwVpG/UCTO4WXprpVR
	omc8W9wdT1VznPuslkuFVuyMAYpjFKVOPx9+c/e/soYX7M6iuAcuBfwmkf5EZJCo3JhESt6cnXa
	ch9stvqpZ6PuHxoAdQzC41ce1sI=
X-Received: by 2002:a05:600c:8b21:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba093b9e0emr115495835e9.22.1794500490185;
        Thu, 12 Nov 2026 08:21:30 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951f237sm97155965e9.4.2026.11.12.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:21:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/bridge: tc358767:  make read-only array ext_div static const
Date: Thu, 12 Nov 2026 16:21:27 +0000
Message-ID: <20261112162127.1592210-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Content-Transfer-Encoding: 8bit

Don't populate the read-only array ext_div on the stack
at run time, instead make it static const

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f61c619fb305..3735e8db9e82 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -593,12 +593,12 @@ static int tc_pllupdate(struct tc_data *tc, unsigned int pllctrl)
 static int tc_pxl_pll_calc(struct tc_data *tc, u32 refclk, u32 pixelclock,
 			   int *out_best_pixelclock, u32 *out_pxl_pllparam)
 {
+	static const int ext_div[] = { 1, 2, 3, 5, 7 };
 	int i_pre, best_pre = 1;
 	int i_post, best_post = 1;
 	int div, best_div = 1;
 	int mul, best_mul = 1;
 	int delta, best_delta;
-	int ext_div[] = {1, 2, 3, 5, 7};
 	int clk_min, clk_max;
 	int best_pixelclock = 0;
 	int vco_hi = 0;
-- 
2.55.0


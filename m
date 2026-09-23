Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B959C413780
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194994; cv=none; b=LQ2CyXk//74MY/qx/5qR2JvYAGkbyV6Ux7O3jSLBCZbQdPZ6Z2lZi7geNAPdAJp73unFrv6lk0EGp/N6JlacejihKeivegTKzCBjYHlqIkE8Ncd3Pk+ag49Xfj3HJIgVjkUdSLJf9GEnNmV1QTGGIzkBKn9dVxoHEvtU3lKiJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194994; c=relaxed/simple;
	bh=iGxLkAPjn7iwM0RTaaX+V0ufn+VTyGjgMAZb+r2eUQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZyio34DPRFioz2WJ24Q0AUxLTc9RLKG4t0piFPKSo/jcMI5rDcHI5aHU4z821OLedXpVSIWg90FGLM+pN+LIh1wns1Lnr+iedYpM+Nc6unuBUKovtsmaLu4w5ezVKuMtTwsEexJdGTCdufvbd+5h44FYRiBkFjU/07oFuoJqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1DxGSpP; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1DxGSpP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso237996366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194985; x=1790799785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=H1DxGSpPYLSxUygKsUtXVv+jry3Exlxvjn22Laowv9KBgC7XunJtSHs33WQlhhGoeN
         iONrXuOyAJxAx/XATErvzylRZXdHT/Gl5dyjEjBWhyLB7V+ZhaioUKjuhbi4qKEIHy7U
         9bfL32VJiO07YStYWzvHo4s0OpjCZ8MtHuvX/6YlFIyhnPKL3JJ41ODHp1S1yD9QkaqT
         lFp9PVXselqxjdABp6qZ1PtbbtkERjo7+4ULXUxB+dm40IaqCs2FmjRJPeFkRQX1JznQ
         5BFL9sXyKCBACWK9YI+g9LBHIkRMstgp+XLwjHvcJ5cVRwV3TXWFOFHeB3AsXew4IWOU
         tJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194985; x=1790799785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=Be2aiSV/7N4Nf35RV4/YtUz0mvJfBpmc2y9hxYmGeNCfN6IamxLfFmd0jfM2CTf3ux
         IOCo3ohqArMXrEY37F1VOVurezBjVD+fz+PKLXf6WDS8db7p2ZUFbjEAiorOXwaOUvll
         3IT1jG0pxfL9nVruG9HRtsrX2iHo76zCA7M7YW7IlF1o3segktCxZfXYQsxa+fnGu+nE
         cbkEqTrihkXrxr7YGRYZjZwEdjKJJEaEUNsPArEV3SYu49mmUNx1JkzBm5dE7onfv+9L
         IzORNuLdDymjus7eKE+TxJkFOgKb79sWjgrdZY+uqGiWZNkUTaGk2yphylWeq+wwpVl6
         8PLQ==
X-Forwarded-Encrypted: i=1; AKwUvByizJct64x95i6R01+dPP6fYWFKDAJ2pRoM1eVR4sIRR35prTsSi3Xjh6ehI4+pOnlJ9r3mjDJtcyKEznc=@vger.kernel.org
X-Gm-Message-State: AFuF++n4G9ikv2a4lmX/F7RtiSQnXc8xbAVb3wr8128/2yZPx4mE0suL
	e6zzDdnNAJYi9tEvrs1V0O4D+SbAM6XPJGgtldEx4W569zo2banzmtOy
X-Gm-Gg: AYBFou0Ej+0jeRgdbhzAsX4woqbN4ICppJGd/pRWArDHRPC6VmeZ48HU2Bj+cS6WlDh
	15L5yl/0tuCgukXBB8n2eW9+a7iWT6KagHW5fWt8Hru1f5U+S4zrE+GNDTPfhPXeSAecHO0bBjl
	SUMyBQKsJrFWRBG6K6rmnKT+mU3nFyZwV8mw5FhcTTRf6tbcgOUDz19sUi/nmQPfo63YpD2nZ0k
	wCRvZYO39eWUgxyG+s+/hJqpL/T1hHBqb2L2885gvxcoCggJZqh5Bl7anlXR8orL58+XuBwUZlu
	0mzDwKQPUIYVAXw7y5oAPJ9UkM9MJ4C2jacE/dY1QsFxYtHTxt3OiaMoO1g8mkCt42Rqc/cqaby
	GgeGOTeBoulio2hI3agoXkRLbrfM5vL/F+F8q0eFqCO4apW6BUHT1el2rWq1wCR20oy0/9KRwnZ
	k38wR+oIxzJyCP33iUnI/V2mF5GwT4XqGOAYrsBXB1B+Mp2YIJehl7Otgy2I3DHodiTrSCesEur
	eB+znbrc3ewu7yPjx8nc8ynljhZbPC7KbhUrVRPlpY=
X-Received: by 2002:a17:907:3c8f:b0:c29:f5d5:5a92 with SMTP id a640c23a62f3a-c2ac23ec44fmr24127066b.28.1790194984695;
        Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Wed, 23 Sep 2026 21:16:56 +0100
Message-ID: <20260923201701.43391-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.53.0


Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74AD4BE436
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004698; cv=none; b=evpCFfap8LGXIaMEsrfiXWNRXh3wOFQ1MGA1en5aBXpc+NmL8rBH9J/TOgVPdJCKmJnmQWuSysuLkF+LTM/JZiYYnZXiRMCgYYRSX2cxiQmDGe8yByh1OjsnmB36j08BP0XX4nwdjkYAqUsxJaycJ7phLpVaxOj1N1T+ZkGr3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004698; c=relaxed/simple;
	bh=RarTNDU+cdrtiJCRKIjHK9/KtTW/V+grsr3mpwyd0ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVgnP+0mmuc55LMAOEvT0Y3QE/Jnr7iueY5v2aIBvbaUG1vkoxgn8fBix31UwhMQKyF+7a9j0PiOoqM45UEO4oTmG32Kqmqdjish1XJ2zTCyHDgGXOiO4wUh1/pRgoJXaZwIbkXZ18K5TaCzD9c5AaKqGnU/QCTnqeMSCKt1YOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5bZe2+D; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5bZe2+D"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so2407383f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004695; x=1790609495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=;
        b=F5bZe2+DGIsLh1lWMW+1JoFZoTnTAcAH27fSI1vf6mCua1Ic2x6LPioj8UN6pwF5HF
         zMD18kN6TUMwltjSHvJGfeyTTqIWaU0CPczTBHKjMsWFB6HtdKE4ISSxsgOp3/c5LGji
         K8qFvikXhSbpv0jEjILW6u3JT91y7k8JcHUt9UsEs4px+i32AIAVAS+2/7YyeIc1Ugkl
         IpSvWP9GoWAMoDqEWgWwd4UkIGDN49vId7gkuDl9PF3hvJR4T2LPqG3qN7Gw1DOe1Vnu
         Jp+gSw3b4ozZL8r80b4LHR1kD1bIbmzPA3fcfW5VJpkKm0CBsyYsTZQIcBhFYy1dYoF4
         Uo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004695; x=1790609495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=;
        b=SEUiyKkrsgnmFOzNNVDFKXfKlOPC+804FuxudFBqhFQHRvBDeumeZq5mbJmS2GWiNE
         XOiXeRMu/q8OKuvIcJV6yG6615aVbo+YrZKu6carTZblLu/PosBZeliNvyyTCL9KWPJ7
         nTU95JzNKTWtJf2szdKli2cYgLrnnFP1BsNTn8GK9fnmX4ExamCz53MREz/sFqbw0oLo
         bS3gkbzb5iBaZYzIqpIGHohVdDqjJyjLVky19pL/6eqZ6BkuczmzPYFjd0wOydKKUAx/
         ahnBteipYx2tX/sGuL8Y8V12sLM7TOnlnpGsVYOVgzKSEZcw4LHzjfSrm207gtyNXs6v
         3CBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw31f/d62rE/X6OqsYc2aQSeIsBEmqu3nIPvMn33Qmevo51d1L2dl2UK5gQiv1udr+OlbwfzUgKFJyP82Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l/0y58NbuRYr8O0dSpCCPBG+9+DvKOVJE+bajJ6gN4I4BnBmoy
	x0JiWcSYU+jt4fjOdLaZ2clfEbH+Krc/4eOcdvAvL6MrFFah0AToI28/
X-Gm-Gg: AYBFou2gVsBWPvH66Xc8VhtRY30j1j4JH4v4vXGIafeoweQQ4hdqGBM3D4aq2UgqBRH
	wM5nylZ3K7lH9BW4UCwlzoloreyB9IVDVziaQnL7DxbQk0jiM42RBvs9KOtsfSLMCNfeTvQ5G2k
	ZG3ZLB9sQjnJnoBIEmYKosj19pxUFD50hLKo5KbYMmB1beAezg7gBecvRmoiIa+yHg8kwEWFxtK
	ap3Z+V651xra1Gv5X6vwf+2IDeVF6sugy3Tj55wia5hyPBV5u9FKkeRDH8aCq1IQB8x5tibpENq
	rYkBuXPHPIQ02x0CDQ/alud0OFXnRbBEZqJHkaCDun+kfjc27+mJd9Y1O1tnr/v5LymWy351qbE
	XparFeA0e9RHQwoDqCpC/OJrr1tgDZAeqgeKwopMdO8sCQuEqbqpW3AH9T081+PPQxkUgopFHRC
	zEDTs2TohozmAsl6APjHbFvBb578uWmB6FeXQolJSFmzcfW99MuOP1RQJ8CR0EGUooVhPDxvbia
	mLZX2CWG3gZixc6vrOAVNrLuazzoaO7FgtBdq0YYReMxHg7gjNXREicBw==
X-Received: by 2002:a05:6000:260d:b0:488:5d3e:becb with SMTP id ffacd0b85a97d-4885d3ec377mr3423054f8f.39.1790004694794;
        Mon, 21 Sep 2026 08:31:34 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:34 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:59 +0200
Subject: [PATCH v2 3/5] media: rockchip: rkcif: add a callback for the MIPI
 ID_CTRL1 register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=2149;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=RarTNDU+cdrtiJCRKIjHK9/KtTW/V+grsr3mpwyd0ak=;
 b=AfnwiBUYc0Iwvv07IbNj4GLcQp3c8H7KT2SE4wJXU/4N3vJJhNOprP36ijMkFaowrAHFyv3c6
 vPvJjApEssmBBjgqwoobVr5BffVD1PUuu8Qebca+Cabc2NfcYXvyCnb
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The contents of the MIPI ID_CTRL1 register differ between variants. The
RK3568 and RK3588 hold the capture size there, while the RK3576 uses it
for the virtual channel and data type filter.

Let each variant provide a callback that builds the register value, in
preparation for the RK3576 support. Variants that do not provide one
keep writing the capture size, so their behavior is unchanged.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 5 ++++-
 drivers/media/platform/rockchip/rkcif/rkcif-common.h       | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index e0acb9049ca1..432f47a1fc23 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -749,7 +749,10 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	if (match_data->mipi_ctrl0)
 		ctrl0 = match_data->mipi_ctrl0(stream, active_out_fmt);
 
-	ctrl1 = RKCIF_XY_COORD(width, height);
+	if (match_data->mipi_ctrl1)
+		ctrl1 = match_data->mipi_ctrl1(stream, active_out_fmt);
+	else
+		ctrl1 = RKCIF_XY_COORD(width, height);
 
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda..f83c8099b78e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -207,6 +207,8 @@ struct rkcif_mipi_match_data {
 	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
 	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
 			  const struct rkcif_output_fmt *active_out_fmt);
+	u32 (*mipi_ctrl1)(struct rkcif_stream *stream,
+			  const struct rkcif_output_fmt *active_out_fmt);
 	struct {
 		unsigned int offset;
 	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];

-- 
2.43.0


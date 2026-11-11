Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363509;
	b=bTqdq7A15y3RV7NfMW4QDTuviFlcmaXoQ1sxZ9l1Fucujq5NJWVfH5UHVkBMtvE7FR/v
	 YQnlcc3pFoI5MS8wBeqmfpOTGuWrLZ1WPwceqhgpNF3ZmB9mODfz8VcNgT0fAXsk7B6La
	 VDXwDUiBYd9jVmwp1nkxsPK5N3peugOcQFJZy9Ro1+ogBk/EEXWMQCULPf26rpB8t009v
	 4ddqWb8aZrgGkQBPrdJea5KgTJkCRAhh4EbjqXr2jAIbIha/4PKFN9+31haz8Flhz8/SY
	 zLFC3JkaKcZ59XBbr/Z9lA2lbNqcYzeyF7enZwqMwVRvJ7GjKLQqi2xoYJFh/1zmTLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrJY2Fwepo7894Ql+NtyrHeNRWa8RX4cvLszfyzbChY=;
	b=ur54Hqn+ds6UcahUQCk7JDkO1t6gkTHU7jTXQy2a/H1px2/IHyWSxveW/eoUUxJZ1QY1
	 bNVxXplPpEOygs9nw1ncQIbp39D37DSz8yv7YFm6ubNxSC7+eAyXPSQ/MQ2WplPF+2UJw
	 it1BpZSCiSXPkTVHSWhexIdwWrWAJULd5OZNh1LSTREwGwVlPQUfnr6qKBwnkoGV6q+0K
	 ofi8tjevxrrijT5kIWQbUXBRfKeg2DUwzpcoksDSDkYoLLVHfWjaHZ4nsjD6f2OLUO9xv
	 Wz//zAiKNivU84EyhUgFF0UoNzF8D+912DDtVPpLZ4C4MStw+QEQlrMQFtBMRfJU5Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTFXJwxw;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20561606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20561606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTFXJwxw
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1390409a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363508; x=1794968308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrJY2Fwepo7894Ql+NtyrHeNRWa8RX4cvLszfyzbChY=;
        b=QTFXJwxwMGi3KYiPUC3uGm1ejP9JeD0ap+Sc+8ZKk7AA+OBcdrTjSUDDEQ80ejyupY
         tnMsX6HSAMgzQmFT6Iu5Ulyf4l14ZD1Zr7JmfVheB3rz6DhdPbG7Lari0K6dMpx3GFu4
         yrVSfdBjNtgTdM/fAaEkKnGzFyI2MFr1WprZz1tS7CiNRq5h66zNeQ/HsbmblmiTV/AR
         3MFT4TAx5h6bEzcjG3Gdx8QGBDJuOlE/yUFfCxAmlWRI8rSJ5MYrQCI0iVpLUAyDh+xH
         N4CwaLOKv1KwXRF7RsPnxQdQT1vHhtPJCeV/aF19kPrrPj4gRCFZaXYHzCkWKfIrD+Mp
         sp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363508; x=1794968308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrJY2Fwepo7894Ql+NtyrHeNRWa8RX4cvLszfyzbChY=;
        b=k24XRY+/0jOdyGm2MBPRaqnepSLPz/LBU6VJlY0x48Qyz5mGLOsK4MO3J7+BL0Jorf
         pc6hQ0x8vPHVfeRvuSHC0Er91+2/e1lPGGSSZ2mRUPkuRHZMbflSHaNrHF3wRIq2Md7c
         /g4yOtPn+LIe7Y5NEd0kb567yaVW/j/BjZ0Fi5tJF4Fuo17FsNTrTuoYwVxgebVTqyQH
         lMO/8cmXusD9MLj69MOayniWH80O80bfOtujOCl25e6AEr6b1tSgia8zSj3Nx8hb7p2P
         GJPNQHY3kporTnTKvmpstuQY10N/VpFEYs+CvSRfbvU0vRFYr5XmCRSmDjk4hEohUGWr
         Yg2w==
X-Forwarded-Encrypted: i=1; AL+hErFsl2ToaFDkOq7oiqsWK8x3ilRGOXn5Z9lJv3ymB5UGIXH7Dj9ZpTCAHN6Ixm+NV4wCeY7UN+QHmy//V1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z91pPupd9TShEqjynw5EvynBWlzMTHk8jRQ+BWL9/xDGBcjivUZ
	o0c4H8ntaIk5JBeP8h7RomAkrkhlWq9lSJR08O37F0Nq/v/ST/DUXbEX
X-Gm-Gg: AYBFou0zlTXVSflLCg9cYKyTa/QwiZp9JjHRLvJMgwpqOl0scjdXA5WpHDruIc81HfZ
	wbjJB7w4TqLNC678MOmoTBzNxE7aNqSgGtqnN8hFzRLWTv+NkLb57ElTLL42W2kJ318e2nfxNHS
	hJILeez6qqE2cGkt2mgy4OdYV6eesMfNITGpbA7FNB6XiKJe2kHBnpIVJJkUt2s5cZwwjbUpr3v
	4j+SePTqnYFyDs8+BPpYEg2TdKIQoUD8vgbHdVy3h0fLUKeddGzsP6M2g0YyVvADuatFFOs0x6z
	PXKbEw46i7CnxXb6joEQ4oGUREoVDCZZItJenFgyW7BZgy1rB3ybxMdwfhkef0O1b3/KcKMfvdN
	p9MR/NMemn2fZlWqV0JmoGmtbEKaUc1M8yAjBDl3gKZdc67d9o7crpzrfDg5uqM3sLz5/9YeZ3X
	A+Rb//g5L7qwUva3bNNg4Gnhyf3Gdz7GQkFYpwCFkP74X9pCp1e4uDZpBDlQfpvS5gOac7HRt7Z
	vkn7drR8zVjg9LD1P/QRqGd50HjW/m4aSGtWO4PPqiSiPKxXB4pZ03qCE1EmaI7YsQNavooKbmZ
	6h7uunX91FFze9J4vojDECAaf4lkURg6aeeL1H+Zaws7ML/TBLjoAziV7ba4m0syk5LyGozotCe
	LGoC83Siu8s/PPm5VjJM6B7VjxyXEH4AOhqevN9gVKj/8Gsk3YdZGwubJvA6560KI++P5/L88fH
	ycKvZx4sx69bxTY07bPRbDiLm5
X-Received: by 2002:a17:90b:4c50:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b182ec2051mr1060564a91.11.1794363508275;
        Tue, 10 Nov 2026 18:18:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm2034540a91.15.2026.11.10.18.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:18:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] EDAC/ecs: simplify allocation for context
Date: Tue, 10 Nov 2026 18:18:08 -0800
Message-ID: <20261111021808.60779-1-rosenp@gmail.com>
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

Use a flexible array member to combine allocations

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex
 drivers/edac/ecs.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/edac/ecs.c b/drivers/edac/ecs.c
index 332872d4214c..e7f7e189cc76 100644
--- a/drivers/edac/ecs.c
+++ b/drivers/edac/ecs.c
@@ -33,7 +33,7 @@ struct edac_ecs_fru_context {
 
 struct edac_ecs_context {
 	u16 num_media_frus;
-	struct edac_ecs_fru_context *fru_ctxs;
+	struct edac_ecs_fru_context fru_ctxs[] __counted_by(num_media_frus);
 };
 
 #define TO_ECS_DEV_ATTR(_dev_attr)	\
@@ -149,16 +149,11 @@ static int ecs_create_desc(struct device *ecs_dev, const struct attribute_group
 	struct edac_ecs_context *ecs_ctx;
 	u32 fru;
 
-	ecs_ctx = devm_kzalloc_obj(ecs_dev, *ecs_ctx);
+	ecs_ctx = devm_kzalloc_flex(ecs_dev, *ecs_ctx, fru_ctxs, num_media_frus);
 	if (!ecs_ctx)
 		return -ENOMEM;
 
 	ecs_ctx->num_media_frus = num_media_frus;
-	ecs_ctx->fru_ctxs = devm_kzalloc_objs(ecs_dev, *ecs_ctx->fru_ctxs,
-					      num_media_frus);
-	if (!ecs_ctx->fru_ctxs)
-		return -ENOMEM;
-
 	for (fru = 0; fru < num_media_frus; fru++) {
 		struct edac_ecs_fru_context *fru_ctx = &ecs_ctx->fru_ctxs[fru];
 		struct attribute_group *group = &fru_ctx->group;
-- 
2.56.0


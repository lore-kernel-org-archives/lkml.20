Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C9421F0F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556354; cv=none; b=IaN8yxk7fJovJfjZNbxhaVWd6Gc91HuM0B9Rj5/vbPMx37rLQR22McOcMorHOdO0QeCNgoiAhyIrZO0hf0KqMmXduRiBwb5LvyuUT5DJ3Wu2adQKN+y7gHZJrohYjgZUjqX6QdWxD9gClU6HFxzD8HtgopH2GSrEF7OcTx6LAao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556354; c=relaxed/simple;
	bh=dnpaGTQQCUnJd8SVCrQ8hx7tay7KER/6iMa2evn8Ob0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hEUiyCjqCezCKovnkUONmBaC02/aSh2KW2zibo6fh3vlBKmnd/RDP7dV3CEyn8F9OgVp1zC3k0aAdvurhsj14uJJI5F4brwrW2uJsdZRVOsYjba7n/wua34OR72TkirC3d0PFPTLG5PL25bRH+555Q6UhgWE7JPbPLTTQFjhwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEjoj1LR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEjoj1LR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1588550a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788556353; x=1789161153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCsjELXMOcoA9VCek0qtUTdxrcqWJGzf9e5WVEMS6fg=;
        b=UEjoj1LR0XX1PJJLRsajXZBDIpC2G8UoGhZEWSB+ud/NVah5r1t0O8QyPmoiMgWbiF
         5dOffmzUEUfqmqVsTertvFXaRpEse23u7V9OPhtOSqVMwu6Kuzu8gx6bYCv7yRIUzc6w
         G7llzKTeixKG0rPxg0iITKOgOZGgx7P4P7fiN2RPPcZyxTuhMl3tYAczXGR9UUcjXgWl
         tv3JJ8aeoevi2x+gNaIgGcCiKCDmAT1xYPt4tF/p1gsDFb/mqT++kHxemHRJluwRNzqZ
         plbNrop2Ae85J7WBSCV1O3QbZB7uPAsLE1yZXRpQftqMwmM81+XQVTSaeof8uhJYClza
         AbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556353; x=1789161153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCsjELXMOcoA9VCek0qtUTdxrcqWJGzf9e5WVEMS6fg=;
        b=s/M2kaZdz/js/OTNZgrUjBmPO4iQDXxS3CFR/yMVqGCW2JB9swT3fnPKoy0xd4LDj4
         OIiu+ooOox/KB+BNTzewcfIEEDhLUZDqHalgnyXSlqh7reFZF/R0wEf6RTidSeH4QneR
         041laMoN1t20uV/Y+lA4Mm9JZxaoVrbhFdCyfCSbNgvC4UobPBBbaS9zFhu4FEPS6txQ
         hOhC9ipw7Z6+w5pMZSzQbrv9NB59V4m6DhBdg8sMiLhjWi8+1SmPFvp6TY1ORugTKhrW
         m8mtnVYFh996Qy4MgMY03/Znghrgs4hnfzJA5lgbKRVi7un4ip/KB6IxWabZcFovopaa
         tt+w==
X-Forwarded-Encrypted: i=1; AKwUvBzea0dIyewYqi1S8xXeQdQbrAWXZmk2e6XZ2OnOYxbHFPb7Jwqqn9+PVvfjPJeXaMWdhtlV95Qz83irKGA=@vger.kernel.org
X-Gm-Message-State: AFuF++lAeAFAp9EgH4knWjBqwUOujLQlcaxiaNGEpzvdOBr/QCSpgmzw
	B0HYlWX1h+mtYZvbrp55m1HtkwvrouEWH674LStjrnO2LFfG4LftBjvc9s3hIw==
X-Gm-Gg: AYBFou2lY7XJdhj2Ii+adhPZADKvocBtIMNaY29NAtB+iqEyMJbpumi6jm5PPBvhhXq
	yieZHYIyDI/5UNmuPGU09lHZisDMS6qDSxfFEpBk5ItwsR5nsjC/DrikRqDyuoKgvntab8fCRvp
	BmwWaZYVthEa6PrawLs7LC5p9bMkPOQ7B1pqdOB6bHzv5E8L2oH4hpR4gWZ8XlCqDiZh1jR1oAp
	mbl88Fc8aFM0Q1Sv2u4yzhifgp7DDqGHH9HYxL+BnHT1ncuhSHtYDHgA7bWbT2bCpn8ShspM/7b
	aKIotDsmD9Y6m49Tg+yk29eIZs8b19k7+v5CAmq1InS7lwZUuo/ybTx1TGCh7Rqi2imdViPA9VL
	Yxj/xRVPHOdxuXVRiYx0T23AxFX7D119TbHTkTOXb0/pBqCkAKE32qQBtPRDyUk1edO1IqcVKoH
	u3w7EfUNqWNBiZR588TONF7BaMGyolkxLvbM1gAJY3hYoy2KGLqZhIKLjkRRMgvNjN/0HcpSnlj
	ZK0/sOuBXAPtP6Ek7U5jsnLLMDd45UiEpmkjYsd4EOS4bi9fWjcmg65kVT6xzdFFu+pJAnYL/iJ
	hx/YHPcXcUWaA1tljIeC2A9MQvUu5bWjg7j54g==
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr12902336a91.9.1788556352713;
        Fri, 04 Sep 2026 14:12:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc081sm12288540a91.6.2026.09.04.14.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:12:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: talitos: request irq after tasklet_init()
Date: Fri,  4 Sep 2026 14:12:30 -0700
Message-ID: <20260904211230.81963-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The talitos interrupt handlers schedule priv->done_task[] via
tasklet_schedule().  In probe(), talitos_probe_irq() ran before
tasklet_init(), so an interrupt arriving during that window (a shared
IRQ, or a completion pending from an earlier transmission) would
schedule an uninitialized tasklet.

Move talitos_probe_irq() after the tasklet_init() calls so the
tasklets are fully set up before interrupts are enabled.  This matches
remove(), which frees the IRQs before killing the tasklets.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/talitos.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 41a87d7c30a0..da08cf9615c9 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -3481,10 +3481,6 @@ static int talitos_probe(struct platform_device *ofdev)
 		stride = TALITOS2_CH_STRIDE;
 	}
 
-	err = talitos_probe_irq(ofdev);
-	if (err)
-		goto err_out;
-
 	if (has_ftr_sec1(priv)) {
 		if (priv->num_channels == 1)
 			tasklet_init(&priv->done_task[0], talitos1_done_ch0,
@@ -3507,6 +3503,10 @@ static int talitos_probe(struct platform_device *ofdev)
 		}
 	}
 
+	err = talitos_probe_irq(ofdev);
+	if (err)
+		goto err_out;
+
 	priv->fifo_len = roundup_pow_of_two(priv->chfifo_len);
 
 	for (i = 0; i < priv->num_channels; i++) {
-- 
2.55.0


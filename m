Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679266;
	b=yhtMzpwC4rA7rXFc75b4LxXUKT81Of32xYNB+Wlx6pA4QKFl6jnBg0aq6VsoMxY6a10q
	 ZxZWyMyJJntG/3En32Ukku8/HIGZYyteoRtMuiJENmuP4jtLC6/CW3lIKgsFrXpTNnVR4
	 4FTqjJdKXLhpYo1izwWYAbbqxbe6fYCRtKDFnXpO3TywbBJvtRrCKAmTiX1F+HshV07WI
	 qtLdKhMw7zaA/mPZKDalyizzwVPyaUdw7xzRQbuBnbpIpdzgUttkjm8Kfprq0JruD5xhb
	 l0EZcwQIE1eZ21DADV2BNtBjS5c8qpeV7qRf+SrvSWtSb8S0MTBp8Cum7MzgJREIG/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XkEdAXzyx12LNNWQMDZglUPguh6hyM0B9bJcQNENUqY=;
	b=SWGegm1oi+wCnTA2RnpdQBefOojTSoqI5AjPjMj4dX7wacArcm4HMw91a7k3B8IXYlII
	 Tlo8N1dDyMP5gvXhkKpAV1ID7iXlAqu/fzGwRd61fkgN2by6sXX2eSXRxtlo9/18EyLEe
	 IjeS2KVdKGdSOQJKT/TfIafPUjM2dmD5kwxEofp9992or9R49kuanAG+Q68yv8VgBtws+
	 7RU5rpdVW5o5r4LbMJQXHra826OBpVooOj90/Xje5p6+HWB9QkrIEcFPS92Srkol6PHos
	 Tmfm+ylLeln3P3qZMRKw2md1OpCgcQslltIfb4ZRZ3OBAf+UquiOZTi8q2CBkAOAN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0or+RlF;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891F606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5891F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0or+RlF
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2893531bso997619a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793679265; x=1794284065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkEdAXzyx12LNNWQMDZglUPguh6hyM0B9bJcQNENUqY=;
        b=R0or+RlFKoAi7y3+vK6eKca2TnSUfgYME9vyDjzP+Yh7pIS64m1gRWQKk1NvsAA1dt
         3I3qcNIEmgt+H+Cri9DdYHZus2RyaHOsaRPN8Z/IP7yWIhlPjtDZ7iHVJFF2ZUt/3uOi
         zEksJpXBhzAzAGHEyEY/qBdV7mJo1iyJa0qpfyyQP91T7gCfI7ob7Du3YEpeEgwi00su
         GhSaxWo8+i3FuXNQ7anOKZ+E361ht4NBHclC5faMe9+SHsimcHr8uQtMXxdNNmYVuBYT
         zFDRSVGgrIBW5bUmK9rI+lk9orZ80otkAfsf0sVfVNRVHV/B9VMlN83QB04ahnXdceVP
         gxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679265; x=1794284065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkEdAXzyx12LNNWQMDZglUPguh6hyM0B9bJcQNENUqY=;
        b=fbtHxsifQUBYKFT7SuKetK39oPkcuXsM8rEsIpeDUsGDV61jSQp1WOrmmrhrp4/v3y
         LMWUiWHFUL1SyY/fH39vnOqnTU/oSbRSG3nZor/cAxJcXSZm1t88GV1dhh9bzt7vQhST
         2UxtkfNcADBkECMKD2FLSXKQ5WOQwT5gtgIuH+j7ujwLg9/Li9HU+ntMTw8Fg0GAm1sD
         6KS27ZYg5lM57buaXf4QfjG2zBwsYffXVFStgX8HxF9FFsXCvhBXArh4GKlYRc8T4d1f
         qw11YzMEobG2NkNgLU2Mzl600Yu0aFrO/tKqC5cPaOueW3lcTXUKkoX2MmiN8FTNazgq
         0lMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEUMy3E7XKpZ/Up2ZBSAFyAP/tI0dDlNru3Paqw3qm8HTu44B1Zf8QlCRXy/nEtZmEsewXYuAqB4hjua8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++jkNKNRbBZNoelKZ8LHTBw6VI9vydxrInbnwqUMyVpj5NUgOR
	I6f7cw0ljJ3FXBDpw58loG+3Hxoki/8RuFB4PnTh/012wcXfmVS/S+6E
X-Gm-Gg: AYBFou35P+eOXh38kB76f7RizosU9jln1MTGrfGKH/HSAa0LKZw1IOWuHyV/310QpKz
	mityXf26fLn0zJ4w1skq9q63DkDLZ/fbqX55pHrnvwR4deUDJSi6QjMTPFb57iKp0OmTw4sP0Vy
	BQwX89yQiJxy0UwfrZ32TqzqFB4db5b9s1mnLnM2eAgEZOGaG4/Gejld4vHQKABq6teMVtFD98F
	NqpAV3yCDOhWm2Ox7GZk6jwmSE0+aSKlkFflV4UVWxiZ3kdJ+OXUr/OO084R83Ws7X9LkMOxYYl
	3tD4teE+Afy2GMqg96JRuS9pAy1Zp2aUODSsN4phOCakM4SR2KXRvlJfwDSCwOKraryaj/Hoko6
	7KUtMuY4Yy3AKcZ9+F5KFaryy43fb3VVTDmJhIjP3SDFlPmIr0k3qfLDsMwChM8fV5+M2DhNbMs
	aR4craxt0jFx1EMo7ivUZRIqAF8UTBFtszVjy3SUjWnh+pTm02MTjIBPQFDj6qGbMjQjguFwZAC
	JGtNG68v8UcLB/EfGJrZU8K4wREjbxAOHCBhtePBN9LBFdJfjZkUganMeSmAOgEjyvrbUUL0la9
	rgvEtZ9IT8ReY8XwUz+2UyOYvV99KMDVYTk7N1E/PrCFadd7HfHOJZCqJCPheXdenCHsQD4egrI
	=
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae89850a1amr9802337a91.51.1793679265200;
        Mon, 02 Nov 2026 20:14:25 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm1989659a91.10.2026.11.02.20.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:14:24 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwrng: histb: wait for a batch of words
Date: Tue,  3 Nov 2026 12:13:59 +0800
Message-ID: <20261103041403.4071708-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103041403.4071708-1-mmyangfl@gmail.com>
References: <20261103041403.4071708-1-mmyangfl@gmail.com>
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

The old figures were per-word, taken from a streaming average: ~16ms at
depth 255 is one word out of a batch every ~64ms, and ~1ms at depth 1 is
the 1ms poll granularity of the read path. The device fills the FIFO
with 4 words in one go, every ~200us per unit of post-process depth, so
at the depth of 144 this driver programs a batch lands every ~30ms and
an empty queue waits that long for a single word. The 30ms per-word
timeout falls inside that, so wait 500ms instead, which also covers the
restart after rewriting the control word.

Fixes: a2216e187471 ("crypto: hisilicon/trng - add support for HiSTB TRNG")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/char/hw_random/histb-rng.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/histb-rng.c b/drivers/char/hw_random/histb-rng.c
index 445b80beed62..d435d4ab9aa7 100644
--- a/drivers/char/hw_random/histb-rng.c
+++ b/drivers/char/hw_random/histb-rng.c
@@ -26,16 +26,21 @@ struct histb_rng_priv {
 };
 
 /*
- * Observed:
- * depth = 1 -> ~1ms
- * depth = 255 -> ~16ms
+ * Observed: the FIFO fills with 4 words at a time, roughly every 200us per
+ * unit of post-process depth, i.e. one batch per:
+ * depth = 144 -> ~30ms
+ * depth = 255 -> ~52ms
+ * Rewriting the control word delays the first batch by up to 300ms.
  */
+#define BATCH_TIMEOUT_US	(500 * USEC_PER_MSEC)
+
 static int histb_rng_wait(void __iomem *base)
 {
 	u32 val;
 
 	return readl_relaxed_poll_timeout(base + RNG_STAT, val,
-					  val & DATA_COUNT, 1000, 30 * 1000);
+					  val & DATA_COUNT, 1000,
+					  BATCH_TIMEOUT_US);
 }
 
 static void histb_rng_init(void __iomem *base, unsigned int depth)
-- 
2.53.0


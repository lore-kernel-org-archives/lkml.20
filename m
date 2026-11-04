Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792487;
	b=yNfTDQonW1K2p99N6GHCJrG2XLG1VrrcQ/fa4Dmb43j90c0Fgn0Lc6wLVb4XVTsFCYlp
	 5c95o5LA12dqT5V+DmrF52pExnFDQKzejXDth3kzr+SJBbwMeTnDyxsAIaghZoQkXCIxB
	 DpqOqEwn7DMiIUvNz9eiOM7TdUKXnPMMF1cBkNhuS5LpyL3XgJdJYNZZafiGmJuyvhH+p
	 C7q/T9JTtugM+VFVBe4TeSRQQTf0nNdBgoxtMIjiJ1+KtEZnVKOAwTR5Rin1oF0wwhqj5
	 kJ/IOq1b+FHU02JGpy2eTv4FfJ4eZgtb/+jYi2Hy50RM3Ji3Tdn52O3gl5FNzFEO3/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8kizTq969MMG4ZmGsWzf/eUqjfpKRrKiIja6oeumpC0=;
	b=ieAEG8KRdvfkSFJm8/tAsSYNSaC43q2/sNT1LfbNJy5OjigTg9MAfAnpPbIZ2lrUPxtq
	 llZBay1lpoj34gi1NlwbYGoLZdNPixJl6NHhduFlUBb6rIEbJuNBT3gBINvE/BoAHDmZW
	 QmBCTBOnrr7AzQ8iHD5KgN439lqUWNQIpZHFnc9Oam1LGrwAGHIq9mDM+NAQknYEBwRGt
	 ozTiQg+HrEAG9p4nnnRTs0pu0cEG7FwOoHoHfjMMr5U4FF+0ljF1mso2F7NBZoQQbPauJ
	 jcYwZxHMmvV/DH4/aeTK6qBQFnzjuEwmUy8p4PYLrZnZFSIUwCG1OKhgeJQoLHsFI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p11Jkqj4;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB7606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p11Jkqj4
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso267255a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792486; x=1794397286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kizTq969MMG4ZmGsWzf/eUqjfpKRrKiIja6oeumpC0=;
        b=p11Jkqj4WY8LyHttPdwO37K2LXKgvg6/RHTsJHDKF7/dp4c2eDnOYhQCb0cnfV/L3T
         z1ytXlQopIrHnAW5tc7tCduqoW3Ul5NS9xQAl4+xfDb/DVsj9rTTzPVRQlX/mOFMFWcT
         /p3KxWmz+b0BwdIXW3Z36OKlkail1/p+RXXsqQryQQ1a6pFG5743ZD8YL12xQZ1p+OEj
         IgjS9H82I3ijNVQF7nLRzTRqxh5DJpwllM+emkL3rr1BC4hZdA3DToKsjv/4rJA1iyIp
         B6UsxhgF6S7xEsjW7fnEwLUihFAN2mtouySLsavF3hn9rCMbtRDqMo4vU0K6wtLXIpB0
         Ba5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792486; x=1794397286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kizTq969MMG4ZmGsWzf/eUqjfpKRrKiIja6oeumpC0=;
        b=t7gNXDh1ZWMuDNxUEhkQbg6ZDXT67TxCH2Uc1i/XLhMbxFPwao9F+XeK5knSxO7Ig3
         b3GWiuqUy5GV0aAp9vRqWCCODwcfQgxLjlFAHGUivWNGH0IZfpOPOhTHUZlhmELYg5Yg
         k9LtefvEVLILxIFwBHYba61gH1wEqcyPFXVCJXoiy8dOHCVeK8O3jmx3BPWDLpTvTZdc
         kmTg3wN3X4OzK/MdYis4Q5VemTZCoYWGwnoycBicXFNWnBx4wGqTJb1avStfZZe5DJLM
         Atv0SDEcUy983zqmrw5oTeZ6cQunDaiBV8mGjsMBMLQmvHjiBq504Y1I266I9GAi6F3c
         xeVA==
X-Forwarded-Encrypted: i=1; AKwUvBycIblw/Rrzc9h/tjzFDDUfU2SHOwwqFqji8XH0gRXeSK+9cl48mgdpiZ55oWmL6SHWRK/viD4efq/8Mgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WFeJybGizCKzUZ2UdFSUdxLzypLjD5fGLJe6tet75c+9xQ/tj
	6K0RuW2SP/BqWvNtODEgyYCZWiChiyT4nRu/YqIuw+DHA8s7QrTRGTfk
X-Gm-Gg: AYBFou3KZGo2/OomY/N6f8mvppy69k0vbkk4DfnWjjn92uJ9UlX42jr8uicbNcUaux+
	f0Mmbz8A1LSpBS9rq+AG5XrR5qEhKEzzaFk9XvaYKvNe58pq3hg1jvY60CO1CuZ1ud9Sqhf0e29
	cO2eoOnXb9LpMsQwmzx1w2PVgYad4Bij87opVE+4+37pPmXmCiBCXLjN/4ufDL87HlBVfRGXKN4
	zy9cDrS65grLWvFvgjhqEA/lTrhXJwF13lXvXsj29fUvx/A3bE1cxKV9zmmi0ieLtVubSfjdrZN
	KIo2wgJITloI+NLAKU4SmZPq0GnDu3vFb7ZqSEC4p4LFseukPqnAbKTiLpIuCBbo7EQcSM3fUsh
	eA/faayUFu8/AbFBbDSLGJTdoyNZ2vlzKtF683FMiqVqWCbsTdcLVo3Wo902O7aVD9wIzfjZ6aF
	WKjxt0aixzjbfwro2h2jxE6jZ/c1bU9qAN+PfEXhR9iEa6kQ2iTf/XqVFLzhl134sEyKtJNGQXq
	oCI9+LkNdB0FICqA5JHTYxoa3aUEWNdk3WADlkoxzs4H0HkCAdfDwGCdjqwfzusMyHMofRdMdwF
	1+7t+ZGwxuiEz52odNKqYy0MkxAmVIlr7vQ/SINsXOTQmuZkVQo6
X-Received: by 2002:a17:90a:d610:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3ae896d7b4fmr8102111a91.7.1793792485919;
        Wed, 04 Nov 2026 03:41:25 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3770036a91.1.2026.11.04.03.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:41:25 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] hwrng: histb - use device messages
Date: Wed,  4 Nov 2026 19:41:05 +0800
Message-ID: <20261104114108.2378751-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104114108.2378751-1-mmyangfl@gmail.com>
References: <20261104114108.2378751-1-mmyangfl@gmail.com>
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

pr_*() prints without saying which device the message came from. Print
with dev_*() instead and adjust error messages.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/char/hw_random/histb-rng.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/histb-rng.c b/drivers/char/hw_random/histb-rng.c
index d435d4ab9aa7..d28cc84e8367 100644
--- a/drivers/char/hw_random/histb-rng.c
+++ b/drivers/char/hw_random/histb-rng.c
@@ -22,6 +22,7 @@
 
 struct histb_rng_priv {
 	struct hwrng rng;
+	struct device *dev;
 	void __iomem *base;
 };
 
@@ -71,8 +72,9 @@ static int histb_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 			if (!wait)
 				return i;
 			if (histb_rng_wait(base)) {
-				pr_err("failed to generate random number, generated %d\n",
-				       i);
+				dev_err(priv->dev,
+					"RNG timeout, generated %d of %zu bytes\n",
+					i, max);
 				return i ? i : -ETIMEDOUT;
 			}
 		}
@@ -142,6 +144,7 @@ static int histb_rng_probe(struct platform_device *pdev)
 	}
 
 	priv->base = base;
+	priv->dev = dev;
 	priv->rng.name = pdev->name;
 	priv->rng.read = histb_rng_read;
 	ret = devm_hwrng_register(dev, &priv->rng);
-- 
2.53.0


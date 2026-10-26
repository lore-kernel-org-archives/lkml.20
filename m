Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032205;
	b=wEOAj966OqTQmivgrmiOUgIM3kAzs4020q5hhD9nUhpyQtw4RTMv/GGQ5HYboRz/w5rP
	 Kr+hRLJMnB8a8BFhGwrVjSH6fv6Y3JMzDd3hs48ymdPyichfx6HnNxdv5KBk+zfUa5rra
	 LfBmgchxBC4CSC0iS2TxoV6u5wTkvBU7M139Yp1vKLFrk2lNHce36+VDV8n8S7ny9PpvH
	 fQgbJAc6wk2FtAON8gj9xphutmB6NvvG4gl6OWyIwdb492KfbR2jPH+xtbn+fPo/Q+hPq
	 3OWwEEsK1r/zgVNrBnEGxHTsm1hKxKdZ8JGDOB6uAK2Yrzkoj27Ctu2W0GVmLcB3uLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
	b=hTYBSgZ+gGyduCPEwX6TtADCU/dABsGhjUslTJnn00HqSw3O5GCBlmVuDreUfF45GGlg
	 sBdjMLtlzxpC3BQlrn+wPFfI6F0JewKqiHwbMZajCabqI/jV44Y1FCM9XBNDxZN+XPPj7
	 jQCxxDCSplRAAJCaHIpyk76x7kNuoE5fjVF/tHnPDqoPL8Or4XIvlx8WyCdrb0MJHpTaE
	 lUWy+PK05EBeuD8SNdLJ5bXrJEvU8RGTDQk1Td6CbVoCe1sY0eWE7cODn9PqcZdeQySc+
	 63/zd8pWyeusDJcchQS6/OxOOqHY3H8KoZ4OvnvM1vItiw2STlH5g6Y2n6El5LDdp0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K7J4xKHf;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44360A6F6F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E44360A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K7J4xKHf
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2051038f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032203; x=1793637003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
        b=K7J4xKHf7GBnR+aSRuIhHvzGh9UvwjQg/EJA2HzxhBJ5okakYdFVF8fmqrmZStSFL9
         +yKhwn1GJZPlNPzzrxEVrXiwqI38EJ4nU7XzPe+RXa/0W6D7YJw7DfLsHeoI9/PnYRKj
         XP3SZP4bF4PGHDP3xxfEqj9vU9aqxLFU4KJDzKYjZAFWvoXCfsscijBP3Sjdwlab+UH3
         Yc7pgSmG8f/L8ULk52f6Z8OdNs88c7RQvpmAQ7hUYtDCs3IQrim46p4bSssaQT9SwPYz
         IRfcxjvGf1BkoszeajuCyqS5H049EBP7UfzrbGHCwQrBZkRZMI3NZcTWFmlKnS14c4Z8
         QliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032203; x=1793637003;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
        b=TORThK6bUMRmh0Hiqgu6kYyDPWZuH8LDWSVWbshfsVXYTtZ225JbexiGrMzEcetth2
         WzW+E70xHGHniKy4rXOtIVWIs5nnWxU0LhEG4B+ROq0ccKrDDbE7YfF3fwoF6STqwbMj
         jDDpRrNYSF0yW1rZHg+xjdpSJAgsEZ5IQRw0jxTqH/+0qR9LqFXQ38Bfxgvpp/zyzZ25
         vlnqJHbKB2MhMQ0egAzVAtyuYOVN6VO/ozlzHDcet1HJ6f5tTwUqs1rvHPTfU7h64HUw
         QFk2TM6N+szX9fzb2iNTnWv5jESRMySnSXvnVsCFKPt/PYPBBU7XZ6ChltCXgR66E6La
         XH1g==
X-Forwarded-Encrypted: i=1; AKwUvBw9JR6xjHJXFwzcqgj/FgLZVTZ9ZdmnlAJGOYTM24CEv+j8mIsKjpWEXippgqoupOgqvkKgLhJxvb47n9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIogeA4rf+GS+83thaq+TGSqG2T6X3NhUBGmdzA4feCv9+nnsO5
	GAGvT+aaf1OQXQleSw3VklOfxIREGNkspQjnR2T9TbdsCRZrN22PYmCvo/EDFgS3+NA=
X-Gm-Gg: AYBFou3MduzAOZeHEiQVorNK6cImhpkHsrnQpTGWr/A2a+HGw3d7WXjjnWQkvvvMtuq
	alYTcrIsaJnZSawm2GUq473TAmOksgpdjSQhg5itkvDadVsSuiBl2uz4SqNy8H/jWaRtCgC7Nd3
	k475jrdGAKEarYbyzzDwomg1Gvpg6l4aKZsw/j26g1moNoN6BAbFGrrTZqBxaAnrPGlQd0SEqZA
	+nbqiqEV4zLVvnC7KPCU2tZW3pwcNmhCu3Mgk07knpFmx+98VWxO7Y1Abg7ebJ8NgdXLWLT9gHY
	H1R3cIOHjMt+XFF45l6yZh5+8l1+b40bOjTyp7e+qw22giFejSjKLql91fYLhgMLIBeJfMdI5Ts
	hwntivgGtgwMs9tTSd8qHu3VZ1AeAvwVEeLcma8c5GfaEHqnxQCUkqio2xzUV5tW8LuGYHaMa/J
	etOKzBUPK+OyXsi3ExOLI1CTQlXiifUgP/NsS/pMR9IweojArLsaG2t1WO+J2lO/UO/PtAEvG19
	VHJdYKA6x4aqGByb/Uc9eVrEJf+6DEosr0wKfyY0tVlgENek5pZ7cxEfFbmsn8qah44nBUWFY2b
	s+MfTJliHP5OWDnGR3JHTDYiUZNWhTloYeEoHyviHJ4=
X-Received: by 2002:a5d:4d07:0:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e3eb912dcmr11404593f8f.31.1793032203266;
        Mon, 26 Oct 2026 09:30:03 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3cfasm17554368f8f.17.2026.10.26.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/22] gpio: Unify style of spi_device_id arrays
Date: Mon, 26 Oct 2026 17:28:31 +0100
Message-ID:  <a31cc13115c84c0ad27c7642920a6f7c34d3bc53.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/4Z9VsdZSag1oZ46enQb7zlX6AH9IP2d+Vb14r2Q/YA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/Usae5RcqPzpwnu/+Y45OLLY24zVhgTd7GL K8QmZ450t2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/1AAKCRCPgPtYfRL+ TkptB/9Hby5e2nSSTyAbkf9hlbf/+OmWjwLwfhbW4OIfL4clCi1oUS6Jkf1Z2dWtqfuQc3aH6DB /EgRQesvfmGBlkSr1mF03F8YoZeRMOj7QTumNpaksYc9u6piwGbdJHrucbyBWlAKF4xAfc0FfUl M9o910z09TwK3RAHay7mWdNa+AHYgnefh8Cd28tCkmm9GKFon9FCjdRZoxnthYicr3jRfM/WqYc nNyrMf89rRg+uW7NCSIMVQ9YHMj9geKSnnLQITGDBTmiSihGJVjAR2xfe5ZTi4SryeBp/t57+h0 UlLdM5k5rEwmPejCR+xnINDi4qWcmWmA4K+LbRADZGh+25sC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various spi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-74x164.c  | 2 +-
 drivers/gpio/gpio-xra1403.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index eeed612e7c80..acda26cc4cc8 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -182,7 +182,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
 	{ .name = "74lvc594" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 03c216d6d03f..5089377b67ff 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -186,7 +186,7 @@ static int xra1403_probe(struct spi_device *spi)
 
 static const struct spi_device_id xra1403_ids[] = {
 	{ .name = "xra1403" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
-- 
2.56.0.rc1


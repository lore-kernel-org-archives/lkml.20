Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792925646;
	b=jmrRQ4LWrCr0qLwOM7KCxgYx8Kl/OJ+ojWbLcbIIBY9cduXMjlhziG9W90zcVHpktIyQ
	 oB0D7YawziEbqFl9rHK4yztuyRLI6I1EeSoPX8YnWchfh2zhTfxxhRctqmJsIXMXosWhw
	 UhDehsy6vBaSFeB8xuu16KwZ9AszUh1cQKYLXHYBzWhZzTov0bssVuafTcxJkxmgbtAvb
	 ECIOK/7giB6s6+2+eWVOCdXmdIXo4W6h3EH5fu+CIW1l07jGbQFNwba1q15mhtO0/8lxQ
	 5eyVXC6Ei22H4L10PRPPFLHxUS1pxl8X0CfykXdJGgwA0Mt7ENClkcAuQ5lW0xHheJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
	b=XFo0+DpguaN2AGzm0PDj/jO56nKwjJPe9Xdjk8BEbInC9MfnyrJoZfKZLojYSW9v1qeI
	 A8TcZgxo9GmjfDF0cWp0wRe25Le0jdCZkhoOgEolLJXJ6LLir8/x0HH65uDfYgqsU2iwf
	 +YvVcas09NpbSOC2m2iTguUdjyDFX8GshB1ztiL5hr5Az17xlsDjm0OvFiFhdXFbTeAUq
	 a/IXVfuYMu+Nk/cIEvjauYlkYm9CSKwGLmZzBpwKoFKwDoqhgftRWOhzGUpWX5E81Epbi
	 TrnDKiKw51JobbANBoYxvl7L4kFzLAnl1RuanYyW/+8poMW0JaaOG5CPHZgtzvNYINw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DV8n/LCl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A1606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97A1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DV8n/LCl
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4395d31228so319059566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792925644; cv=none;
        d=google.com; s=arc-20260327;
        b=MHlpgWQq7lSIwf878nLK6mdAOVmXORJTPC+qkKztCggYZb9noAYAtimelxT6IyiSvY
         3bQnQvCMS9UViM6aaP3iB65kXL9chS6bSkpMXdGvTvQ9sm9DRHoklqfGSEU7S5YxT5c6
         BcFCWzqkBD2NeXtk05FWiHRespGaimvIR1KrnZtEQBJuTV8cdlRMwJAmLBPHok08fVn1
         jiWsFU5fWu8Zvb8fPRkZuZFf8uUQ96wLOvrlkjwUsuz1Zg7zlWoBp8Mc8+oXp0hg+6qm
         yKq4tk69eilSadtHOY8E1EHmG07JXfiMrP1fyG76sQkaIhVCZTc1ZjCKv/Yd1yH8l+98
         S34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
        fh=xWMh9rvq5kLClwifMwb1RldDUkZh9SV1jB94Df7hCK4=;
        b=kzw+JB1VkKPDIYO/Unqn8BZl7JzaMu5Re5OqHwxg17XXBbLU/UQg1/dCGVWGfp02Ju
         kai1tIqwfG1khmT0FSnNR4YfaVvvoKYBXtqdebrX4ZJqyUXQei3pujqmu8UJ/7gj8uDr
         rJqzXBCdYE8uhKNxlugs7bsd7S/SUNqCIIJdnRiX2c/10eFycghEIhY+kvhNqKuSR2qb
         sCyNdQuDYbmR6G2QQJ+prmJupC++MKFflejYEnxOhvM7PCDLC/E4ZlbA9kxN6yZhAjBa
         4s35LaIzWKOEeqcVM7yznYfV6F2p35ye4SnJzxYv1O239R0Oe6Jsnh81rCpu22EmRBRU
         LKEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792925644; x=1793530444; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
        b=DV8n/LClRQkvosXfhQ0fijXpBBiRX21CM1+IZat6DfI75dTcwsLeBQojsVBUfOeP81
         zvqDTzoRSZXb8btAR3wX6x67PyEkaRPcWi1N4xvxKb5mQGny3do1SMBosemHyK8jbQwE
         5GPkMz9voLcdVGw61GQfC+kYyJ/ypICn+XDq1hu1vSeKN9gnfAFro6jN/pedfVPAWA7Y
         WDhuzUfYrbf9qVIPIqPz868rGk52OsRLBViKCdZWqmhnnKy1uv+3HKnBJ1MzOru0WHIT
         //uh0UGCll4z0ouMqkQj2ntts15HaXe4D7v+F2lXy0rVRX219NP0hFqVgybIJxYjerGJ
         h9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792925644; x=1793530444;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
        b=QsU/0YLjj6hY/E+IaMH/cgVndQpYsbPciztRd7jc8MXsVS2I1osZ//52bx5CYKjket
         lgDZi+n+GSTODhtpOxhXjvnKqNf/rA8GpXRI4FGnN9jeztzi46d14Su+1e3HhlbNHCD4
         oCL05otPifmamWBgjx+P/S26ERoIm2ZGO+op4ftrxBNfj8TedDs7jaIetrEI0dWKDcML
         XUrc8xas+xV9HA0cE3HNcPwmWEs105ep2tYS7Dg/XCd9ScSV0EzHE0IPa5Bs4hZ40wK2
         Ch1z5MEOa3m/JOMIHX2oNKaYfWpwC4T/JjhdJAKrPBiV1PY6yeJOj8dIYaRcA2WfgR9U
         R2Sg==
X-Forwarded-Encrypted: i=1; AKwUvByJheUSCDDZWbR/vsf42YZFoc7Wz7I8IXP8syT2x6KQlatiCCETpHYQVeeAOpLT7QhnuncLnScBXje0OT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIig+Y6L282nOYje5BWtw5SmS06peYEOZwJN6EWx/TYEzBadHRX
	bcfFd0VYyNshdCFLYRwRE2f+XTZfQn/ToR5ue2G7NZVmLCkO6DHaafJBeplfzJVhyb+9GSYB9V9
	7M34zmZT5AvIlYhZrxQDTf/6MSuvs81BtDStNq9F+75kR
X-Gm-Gg: AYBFou3N96EsWhJv/QsRlRd6/6iQobY3bXnHEtR2PQJT8MFpNK4Dln+Cg4fG48wylXa
	NXMry5Jg6bRNPXj2YOmI4B4Yje8Y9xbNW8z1D+dtzl29jUeCfIFU/lxzCk24BMDxpqbRIxquEzg
	qDODSLGrbCEBOMvKWqXI3hwWEc88u+vVew4NZ7z+MvVA8bft1Bddhj89Ml5uo7GJvA+GS779nEY
	1YGeg+Q//hbFhEgBWk/xUafSEu0Ayp1RsYVdsL8AUnBydqDP8gKifPG6zR0AKfrzd7BdJXjz1x3
	HScTpbNEokRuTDdH4bwudDPDzZScas7r6ZNIrtoDLAH+5PMDxLWo4IPRumX0LpC2/aPLc5Jfx+A
	7enc/LhSN8PKqhkptrFml/8xzTN+kCNlGbRpJcyn6QCY9RC9t9xYiZ3Lfw/5gMTGrjWBq
X-Received: by 2002:a17:906:dc8b:b0:c29:659e:2fd6 with SMTP id
 a640c23a62f3a-c46bddb549fmr450364866b.10.1792925643928; Sun, 25 Oct 2026
 03:54:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 11:53:49 +0100
X-Gm-Features: AclHuK9TY3j97je9JyLB2E5dU6k-0NiwAm7rcWLnTy2tP6DroPMgj8seRuA_E5c
Message-ID: <CAHxSwT8zGKHDLjAbkR=EZL7QVwzS_47TPB283YTHKEQsE0mvFA@mail.gmail.com>
Subject: [PATCH] staging: fbtft: fb_ra8875: Replace mdelay() and udelay() with
 sleep alternatives
To: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"

From 474546adc013fab098dfda25e6503413fddb9929 Mon Sep 17 00:00:00 2001
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 11:38:17 +0100
Subject: [PATCH] staging: fbtft: fb_ra8875: Replace mdelay() and udelay() with
 sleep alternatives

Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c
b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..ded953636 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -47,12 +47,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency */
                write_reg(par, 0x88, 0x0A);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period  */
                write_reg(par, 0x04, 0x03);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x27);
                write_reg(par, 0x15, 0x00);
@@ -72,12 +72,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency  */
                write_reg(par, 0x88, 0x0A);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period  */
                write_reg(par, 0x04, 0x82);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x3B);
                write_reg(par, 0x15, 0x00);
@@ -97,12 +97,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency */
                write_reg(par, 0x88, 0x0B);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period */
                write_reg(par, 0x04, 0x01);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x4F);
                write_reg(par, 0x15, 0x05);
@@ -122,12 +122,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency */
                write_reg(par, 0x88, 0x0B);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period */
                write_reg(par, 0x04, 0x81);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x63);
                write_reg(par, 0x15, 0x03);
@@ -150,11 +150,11 @@ static int init_display(struct fbtft_par *par)
        /* PWM clock */
        write_reg(par, 0x8a, 0x81);
        write_reg(par, 0x8b, 0xFF);
-       mdelay(10);
+       usleep_range(10000, 11000);

        /* Display ON */
        write_reg(par, 0x01, 0x80);
-       mdelay(10);
+       usleep_range(10000, 11000);

        return 0;
 }
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par,
int len, ...)
        }
        len--;

-       udelay(100);
+       usleep_range(100, 150);

        if (len) {
                buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par,
int len, ...)

        /* restore user spi-speed */
        par->fbtftops.write = fbtft_write_spi;
-       udelay(100);
+       usleep_range(100, 150);
 }

 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.34.1

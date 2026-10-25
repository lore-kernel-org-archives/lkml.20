Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938166;
	b=5L81s+Z6Ztpd2XKO27J2Y24CEKPS9aXUgREj8uC8LcbeOKBviYhF8jkw5m/ov12m2gcq
	 v5aRE97viqovkT3jMkhNdlRVJoLuGC4i0jLkQF1CfOJhUHXgpoBKyPbZ7Zic8K8PK2o8A
	 4htW4OJEwheWQzvnz6844VIUKIJTkIq+Objdj6axSmT4aj/1LBwbUJBKHxYrG913nYH3Q
	 w+jtL32FpYwzqY9ZthKqnxM2n4acfaSVU4jWOU5/H2B1lyltmEvQ5B0/wEdartnVgfdYV
	 pRMssUW/kq7+3FFrVVzrNvNfuPwENjNahEL06dmKc6H2n52ms5B6JacaZrA+pPQ2XUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
	b=o4yEff5aqDQ+gRHoooAEIDSYaIdX6Kc2KCgI+ni0x2kDFn7+yyEJTvZYijaOtlrsdfKG
	 k06mfdjA/SM8TTUyf20WGniYW99IU8t5KQnuE2zAPuOlSQGKQlxdzZaYTMws9tn89nnXz
	 aOS1vEN/NjJ9DnxWfGpF8ApSqVEA2LWi1LOpg2ZhVfGTUEExHHfTaOJvDsMxatZqD9dab
	 QCW2sv6SkQabbrxfMlEd/zfZNm+59uY1v2kbqw79nImqiAI7rEjgVxWbdA8E7pMdUJkeB
	 e8qkMwDk2qz44zdsZmITcIMY0ieDBrpcK30GMAW11L72N9U/S/gO/20im4YB4O/rgWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YvB1UI7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C19606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C19606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YvB1UI7z
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e8c710847so263890766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938164; cv=none;
        d=google.com; s=arc-20260327;
        b=Tbptx+0emMiChlpMh/FAjRU4nOzwELDGaBSdshY3T4hl1uR4CeB5ZchxTfCSy5jkYp
         GCXPi9abcwI8cQb0pIbQttwUSCfbNZOXpBcmoFqZqfjBX89S19gH+47Mb/qC0I0D4LjQ
         jtDvaFXCXbWPydCfRwJ+dZtbd5CDfE9WP7Ci9vglnoYxsrt02cj1XF5+z2jDhngrhGTo
         sVzJLR3l/QXgp605Fv6dYyb5Pgyp0kNa+3Vy8SYOqo4V5jIfEFiIv+hfvXoIINLLvAde
         DECSzdtm8pM7rgJE28AqjUXwS/c+awHYHhhd0lYze8Lr0By0dTEUqpJLOfOXtwe7ajJ5
         Oa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
        fh=TbRnABaKEkT4eO3Zs0MX16cVblrsPE1k2LKtiFfv9Tk=;
        b=OsWiIUSMSCtPR8HB1+kthuCFmP7dmQaUhkaZFMIdZunzqpn76c6znFsBHH2k0vK9XX
         84mqHr9x/f+p1n038cFx9Rd228isCpk7ICwGXtIfukDNpTER1agBS8ZpwBQ/hUbc+gGk
         2idWiovjQEO3Eh3573RaKotDdX2lggaU7jGrrZDTGrICnAcDxx+rrIAvG+oY1ptGoVBr
         mCgc+JRlO2qady/lvYGJ4R0/TrUMJ69mToq8ahNMuJWn6kRd5+gpajCF8kRVRq/mzBDX
         2JlZvuRaRYCKngp3+ysScNucZq9p+w0ADY5NysAw4H6E1/XhLSV9E6zUsMliS+RbMcbP
         H4uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938164; x=1793542964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
        b=YvB1UI7zCPwKzfQoNIOP8u+7sxd+2SekPsPaL4cz4Caz6iuwhzKHqH265iPli9K7j7
         yWZKKZ7VDNLkeXwsrP3lYpbwRVnnpiUOSn7zDtyUcTMybO0wRTewjTdwepTKl/oBtsgM
         ON5FBxXXm1fJdNZ7FNaobq2wGyrOYOkRB+P6wYnmw8L5tUAFUx+ashFou2TA6xTmD89U
         tyi1beDT6fEv77Y9ro9lMTkZEQnxxMbAtvX/EIn3YdpMqUo9T4DSv0an7twk4RDd22CT
         aKblOnnVwPP+MUHmIR8niaNwjciFPotrSrAnqLCfcXEu8F9B//nV1sMXpgxneeA97cDN
         zzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938164; x=1793542964;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
        b=F2Sg68EfaTBE3WfyrIKFL94qUilcWpQd+CSyFcFRAb11krEfb4cxT60gZcIq9Jco04
         95CUQPVkfh6A5mdAmQpMxKB25cEWWxn9U0VOFWDETFI9NXmkCm+4o63XyrgOg0LFYT6l
         03q6Lx7eCZdA2R8kjTZ7/d8qtkkYVn0BxQCkxQaN90JEtct9y+/9aITSMk3YAAhUCihw
         4Z0FrRS/pK90u7+XD8v741B17/yZdjJoVmD8Zv6RC4WYarWZNSjTIW+P0rmwenm3uMPQ
         YO580gpr9BeQXS5uoijrmhMxYi+d5RErR98tKc4bY3yWPBS09yUmSYk++ZoTTEHFa0Ad
         C5vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTnZwNg8u+c53pHcvtiqqVB3oKks3x/USy8mqDAsbzpHRR/tEWnF8BSeK2qvY83xLZbqi1alR34fFB+vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ+fsfF1D7QWcNC7De2OoN51kNwKPWEoZX52mXYfh7Py33ltCF
	QPD7U4mfde8/WI5zSydn01e2i/409vwsbqDtQYXhVxiC0xJmx4tXp/Weai44U/0fq3xVmrtexWu
	F0eOosWfhEMaDANZWCh9aI287bt79Sqw=
X-Gm-Gg: AYBFou2YLmY7QhEP0n4koKRwSgqoPEmhLoR8VliLg8xBXmrL48INeSKX/J1l65pz4es
	GTXRU1VS9CsZjVi+C49ur1pWZrbQhZ9YLmAL3W5WUG/vNcbAcb9Thget0nusq9PUN4B2jLczEnR
	66pPxIe7/uoycr9cT5MN3BVX9hN/ljqYuZFbCr1+AMC3WqTLT9dRdd+PSjS/8f/SElM2UocDeBj
	7TLbzlAlsnpu54Imjf0o68tsAN6LiYsp0RRQvKFd5Wtn03yOwjP/EYDyUJOXcUvurgc79gh18UJ
	8bZU8ThbBnkj6e15JpgBKtIfqvIV2U95r6sfAZcEfAYdBGNc2fr/Dql/+mqfmA07k4VvpRRt9rp
	IP0SyCPTMXJvbcS/GdD2YFWPblcgdPnrsY24mX/E9B7Sf5vBVXjfwD3w/wDqVGlPFvA==
X-Received: by 2002:a17:907:dac:b0:c31:e9b7:f10b with SMTP id
 a640c23a62f3a-c46bdea43dfmr530904366b.42.1792938163869; Sun, 25 Oct 2026
 07:22:43 -0700 (PDT)
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
Date: Sun, 25 Oct 2026 15:22:30 +0100
X-Gm-Features: AclHuK9wgskeKFnwTz3UroDZd-FWWYPOLCNifdGibJ7BV5fPBFLMKtRw3_x8_lk
Message-ID: <CAHxSwT_bdBdiwwXpGpr9+rGizZU3p+RsB18hPH5TxqMuMZOsQw@mail.gmail.com>
Subject: [PATCH v3] staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: julia.lawall@inria.fr, gregkh@linuxfoundation.org, andy@kernel.org, 
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replace udelay() calls inside the init_display() initialization
sequence with usleep_range() to avoid CPU busy-waiting. Since
init_display() runs in a non-atomic context, sleeping allows the CPU
to yield, improving power efficiency and system responsiveness.

Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
---
v3:
- Remove raw git headers from the email body per maintainer feedback.
- Add a descriptive commit message body explaining the rationale for
usleep_range().

v2:
- Send patch inline in the email body rather than as an attachment.
- No functional changes to the code diff itself.

v1:
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c
b/drivers/staging/fbtft/fb_upd161704.c
index 7288140e7..94ae5bbf0 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)

        /* oscillator start */
        write_reg(par, 0x003A, 0x0001); /*Oscillator 0: stop, 1: operation */
-       udelay(100);
+       usleep_range(100, 150);

        /* y-setting */
        write_reg(par, 0x0024, 0x007B); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0025, 0x003B); /* amplitude setting */
        write_reg(par, 0x0026, 0x0034); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0027, 0x0004); /* amplitude setting */
        write_reg(par, 0x0052, 0x0025); /* circuit setting 1 */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0053, 0x0033); /* circuit setting 2 */
        write_reg(par, 0x0061, 0x001C); /* adjustment V10 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0062, 0x002C); /* adjustment V9 negative polarity */
        write_reg(par, 0x0063, 0x0022); /* adjustment V34 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0064, 0x0027); /* adjustment V31 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0065, 0x0014); /* adjustment V61 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0066, 0x0010); /* adjustment V61 negative polarity */

        /* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)

        /* Power supply setting */
        write_reg(par, 0x0019, 0x0000); /* DC/DC output setting */
-       udelay(200);
+       usleep_range(200, 250);
        write_reg(par, 0x001A, 0x1000); /* DC/DC frequency setting */
        write_reg(par, 0x001B, 0x0023); /* DC/DC rising setting */
        write_reg(par, 0x001C, 0x0C01); /* Regulator voltage setting */
-- 
2.34.1

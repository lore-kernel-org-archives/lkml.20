Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677993;
	b=chMkvExDoUlFyKESHWV9qM7pN1E8zASv/yPJk8lra+IVOI/CXTbYoQi6Jw5ISUXZvWRA
	 k7auQdWAbQLGI39bWPB8llJbtSRb8cPa1GnYwmzRHfKIrEiePd5PBheGffYRKu2ESEl33
	 GCOAYeTm6m543PpBXRUctgiGEtn0jyKkFDqiSmhE9dU69YOumNPwmXtugIXlLXQPNuggl
	 lLQbpr90ikGww4QDT4SWRzKv6MDhqxm4ug5RsPui5Da1Yty81fKFUzxQuEsPSv2atOAkS
	 oLBhStXYRBW/sFiBbaqOh3r6F94+zbr1Yp7eT5elRv3f7PEdeHY5GlrAa3P30YnP2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
	b=hAALhwpTrbJ+yozSe7A8gmmLD0zUPGXHlVnTxcoDwNLpgS1P5bfxTsKfK8DGxQS4gGpA
	 48p+jyWCGWEnr8VROI1hryhFxlTh7BdDrqkrjfY/C1Ntlg9wIdGGuiFAYzPK/kod/N/AA
	 hYENJJnS5zHhwl+uOeIZ7ScK0HqUr4eS2YHl9pb5o4KyHQmzw9mRpBykSnhwwU0S84Wrq
	 0z50YtvKqFMKiX+Bz+3IfIVz1bMiKGkXle4RFu2/QBFjaCXV18JKpklvraazN+LJs/Gid
	 3O8IHxNdTvjbMJRQ07isnYx/ycAViY3uuyd6SNHp8kXNKu0vjHxpKaQevh4LNMMdZmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567E4606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567E4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4b2bf375fso6206517b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677992; x=1795282792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=hNgFT9c2jrdkCXe55vN/stCrCyN+Lw640rnMSlUyfveTcPAERNwY5hXqsDsJ1Cploa
         mdt7EAcxVlt7g2rsjB2Rh9n+n1dhScx0bu7VqwBr501yTwPD360zJP1WmZfpRbhqYXxO
         5o2yA/UOKUK/dVFF459TiKvjZ27ntw3yptNDpLX68xbamI5YeWuyQiU3HOSz9dQDk2VT
         wjLEX0MYiLPIH9ChzzHBrwlWbi2Ae4xmAy1TNymeGDAumaqPIgJeOqc6v7o1PzePMM1+
         gBj+Xo4LhOm0QVTVxSM84IqijNXmWy+89k21MaEkHgwe2VG18EWvkvY5hC9saz5qYqTJ
         yKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677992; x=1795282792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=JTcW0r+f//e3npeom4yeKXhU6OHratZZC4QC795JNwAOtbWtm3Bvs0d6uYLFR7heiI
         8//BYug6pERHXdRoHJ3NRkegX+8xBXeecoGMPcE6Ok6M2durn3UZsmzEI/W7C4f7DRLP
         5nBdWTSesBMr18HFw0Pu9F+4P86FJL5sRBK41qX/0wBneUXIsA6tq88Rox2z6svd9Qwt
         e3e95P02ZZM0YCcv2TtPvoe7qSuvJzan5C+SO/PvUP23LPzU8N09kY6kZXxeABO+odAg
         0EGoYVUxwRkDcwEt6ZuTtaf1mMu5ytPJ3mU7TPUl/cwj4Sn5IxoPZGyZZC58c8O1KoFV
         csqw==
X-Forwarded-Encrypted: i=1; AL+hErEpBCtrXcSOOhwxBP9DPiXtrvZNoUxp7w5JbAStIgySilYGDiPOd6pmydD/7OlQQ/DyXrO275rKHPZgHUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lVDUFlR2u1bKoCo5qtsBQQ9qJPQ4DUbAInPJlfcZK4LmPHtJY
	YPyYnjGyTPNWUskH+zDRJlo50zOXJMqg0kWFafdNyVUFRgxapxnDGtpY2yptrp+GF3M=
X-Gm-Gg: AYBFou1o5BVlTQfPl979mctwcXN5A7t0gWwZiowOkUxea3sTG6KSQ/bzHDziuQM0uqX
	GV1zCjmXhOboklyrPTrcBMzj0mlrK6lcQtdsFh5258J7urXkh1q6QDUJwd9wFJ1869U0gXha/NP
	JXsNgBN0fFNqCVIzh0PE0zPv0So0Bz7vH4bFRA65N/ylvgW2CWXYH6yarRLUuOiMBDGFct0sff7
	HDgh+Mtke5OT6tFMka5AsWxvFhyuWhVU/2uY14MEtWiM0QI7QfiG+r70PA53bfpwSj0Xt6HEWBY
	/bBSAUczro18XAvFRREh4nQeQf+flhBqTp7iC6iBDYYSolS6rOfO7o7EbYRqiTXEEcljOnIGgxW
	JXhz2aDXeiY7Wk7bmMyiH+Uwk+SN4X65J4Sqyx+6raEov9yT6OPs2gPKbXvIn4mfrTZN/yurkiC
	/PfJVBipecvyIU4fRBbnvdpSLx1AOdp3a1Rn3fl/yM9l505iOECHYgS1dnT9O/Z5hfQclSRUxGv
	qMF8p0FFgwdFgXMfvxE5FZw5vfJv7cLiJcTRVmUpec0WPwo5bvYWKeygnYGDhD2I2zEWAM7CKWH
	Zq93CRAFJwE26FXD6x22VxAMNcJ6+wHU4PST3KWTonqJj+UZoKzHmNkCX6CmPVLhiLn9yGDZoi3
	4t7w32Ysq31EHQs3K6AlXxZX4GQNmnIca6hatt+nDjcjEiapaLKWD1WWjxHWbHA==
X-Received: by 2002:a05:690c:e3ec:b0:8b4:b5e4:e7a4 with SMTP id 00721157ae682-8b4b5e4f2c0mr27973607b3.21.1794677992256;
        Sat, 14 Nov 2026 09:39:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9d05acsm48540367b3.35.2026.11.14.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:47 -0500
Subject: [PATCH 1/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Y3Z+L3Q1B+1LTrQWdh3AhhyWOlCmGs2mmWLvmmWQrZY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHksxnqmP3lDM0usxYK/0c0pPTY7/r1lnCz6bZp9r
 nSy5Wn/jo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlG0pDhf+2LB+qXxP
 O2lV9Jygq3cygu3GHev37zmu9d67755yuf2c3wP+39hz4HjcAfYg8vS3Zwb7j3MEFxmegenlsK0
 Uc4sx+6cAAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..832567a3ccbb 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -24,7 +24,6 @@
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -62,7 +61,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       env->unit_id,
 		       env->condition);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1


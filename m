Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466250;
	b=IKSUHES4B8/XUP1jqHkukb8qPACnbFwQGKEad2MfneAUEz7eHHWKHtu46WdJZh7eHIqq
	 piuensnSKzEHtoqInagnIeRZqo2OQ6kX+vCMphEfkA8Uh24P4b+vCXShuNipBMPag6gpY
	 I5X5viXN+c5bOwheLtGQc4uSKxe/UA6gHipiqds09q66NOr5jwUeIIc5P/t9fjiD4cHIJ
	 8VWYi/12Xm3rgRjrgKVtM7GLhnpCzqkXroqTF3WWxSs/9C+4zzmYIlHrlCz5fe+ZPsSnq
	 p2EIRSOTv7obavf3QFUcXawZfIeLVbSTceg68cw/8uOl1X0Aa+3yswZxpucdFcn5eKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=euqatSCyYoCPYOksC8l3gC7RgvSB8oPL7M4zUMdiov0=;
	b=KnCVfteZOg60Wqe+jt1K03vXHgul1f52CYWqL3kEzIdEVZnWIwXLHS7IxJwm8ymJy3SM
	 7OKw+hGB358IlqKf7yZg1kZaNSdxhDIFAQhRW/+pVn5XxknEFbe5bX7aQerPrDC1ZDPCg
	 94caRvSYSwQNhHCYaNzW8fWKmBG8N5yWtT7NRvwaNb4AA9RwcqJjLdyfVz414EttVi2JQ
	 VLFCPRJ/ooV6oNtut6dIdbWBHFzS/FWgfzzZ/b0fzaBWkOk3yO6OnaTtsUxXYpXUISrGr
	 NLSPFwCYhB8Mjutgyp+cYx48nDYGjtFOZd78KJctet+nAECnT0cOqEdjDhuRsy9Ca4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zreSoGMN;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250560A3806
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B250560A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zreSoGMN
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1972623a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466249; x=1795071049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euqatSCyYoCPYOksC8l3gC7RgvSB8oPL7M4zUMdiov0=;
        b=zreSoGMNrTJC3Zn1q9S6QOkvTQMU1FITVvkgPEb6jkGbOa1grqbqUWdBG2XMuCtz3h
         YVIzsqYyUUKpHbbBTzHbP6yBp9TZkHN+/HQRzu5HxiVc2Cy1QTzDUYO8auFhX2U8q5xG
         nkg3sNTaKTJQ7yG/P7m7cHD8HtRnf8vd0FkfrHtRdTtMr59uBwKcfqPzVCf41yTePx0O
         rYS3N+L5z1v4ZKiGGCKoHodV6e7cmm/3IEaRJpbWJ1jbu/6Olz26iAFzbIX41B2vwN06
         Gjai4LecFguZbpE2WAqo6R+ro/Kz1pAbvLDNSJHD1B5PYOzrNNHhFc30rr0I99lpTR9c
         Waww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466249; x=1795071049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euqatSCyYoCPYOksC8l3gC7RgvSB8oPL7M4zUMdiov0=;
        b=j68LnUA2bgKs9dFrt3T7Su07I3ToNLwu0OKJDof5R+UNT/PlNxjLKhXDvDOTPgYEwD
         HGtfxiDpJXbuinkqQo1fIgz6X7JKCK7N5OKwVqMePaLFJSf1tOvGN2rH9Oz046xNj7uD
         vrtjQY/V5z0l8Z6BjJiL8mXYqj9wkRE0Jk0Fr8N5wLKR+GNSz2w7ewwPXkEZcmWHWyVZ
         wut26Bw+YJkcTqGntZalKjrEgH/MN8GhDdUilH0uGO20SRCRxgnS7L2/yEl00rDogqZ2
         300MfD5JUQajY6tAEREfBImWZmF3l1yC4bwkbz0qzB2IbjfmUe5ib5qv/Rj6NRMuOR18
         EHsg==
X-Forwarded-Encrypted: i=1; AL+hErFomv0SG1iztneXSqo+f9DAeUSmha5mmNTiSS4uQ6Ac11GiMYpqHMd6YFkLJKc/6Ipb0XPHL8yns/tVha8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HaZF+VD61qTmd2Q8Gu4LZOuk8iiJ9wTQ0HZDlB1ALWhmbhDl2
	KkY0Nszqcup7464S1CabIWVtIWS0pgl2orsahNfWNYR2e5/F5QcjcD7a
X-Gm-Gg: AYBFou0ZexggPKNKmXG460/gWixZIlw13xoV9YgKVs6iuL4QfGbRqGIvFXAE4AIJ/xt
	s9Z/9m4FYYpYxdp34x36sn5LtVlexX6zLBYgnNOphEqYcJzee/QLUScwnwxaQnb7y87zPteqyR2
	AUPGr3ooiSTEnPac+mRiCV12caHgUbOvuBWkpyWg95JTjLPMb+knxgH+dvnf5XcrBQ+70l+yKyn
	HJZmApCjv1CvCKmY2b+2m0bqlEdy4Ju2vjUlNvWsOh1Ht1e25SA7UN2mMHWWlpJcyQKdqE3LZ2G
	uyK68GpPrTnG1Fe3AZdTgNjHHmEHpmXrvtXMKec/WG5kqSE1s6LSYj5HLKV+jCvFx0sI8qfFzGZ
	od/hfHiZ4Si4ChtiW21aEa0Vh+/fSrrh3wV9vIq+I1crF7tUQMflRRl65GLoAIVZ6M6F1l48OTy
	KCBbly0/i6QpK25NaA9VPiZiPAkiODsPgGhMlBtmwzCKOg7y3uNunr+L7xTf66wy0QXrq5L482J
	m+uLsCrBD0SaiyuzADa2qpAQpzfixXXVHn5YoQjq6rOAGCEkCYhTx40GNH0dQEdeWv5HegakxzU
	GdKJwt69/novoBU/+kha8OCJcNZiQoYxeOAoI93hrBdcNVXEh9U3jwg/hKeNDoKUnRzZVR8YbhA
	NG7AC5AWczvsohwaG
X-Received: by 2002:a17:90b:3807:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b182fb6665mr4729745a91.54.1794466248801;
        Wed, 11 Nov 2026 22:50:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8aae8sm3073297a91.14.2026.11.11.22.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-input@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Input: tsc2007 - use IRQF_NO_AUTOEN when requesting interrupt
Date: Wed, 11 Nov 2026 22:50:37 -0800
Message-ID: <20261112065037.1800467-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
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

Request the threaded interrupt with IRQF_NO_AUTOEN so that the interrupt
line remains disabled after probe until the input device is opened by
user space. Explicitly initialize the stopped flag to true before
requesting the interrupt and drop the immediate tsc2007_stop() call.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 1fb2c26189ba..7660504f58ff 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -270,17 +270,17 @@ static int tsc2007_input_configure(struct tsc2007 *ts)
 	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_12BIT,
 			     ts->fuzzz, 0);
 
+	ts->stopped = true;
+
 	err = devm_request_threaded_irq(dev, ts->irq,
 					NULL, tsc2007_soft_irq,
-					IRQF_ONESHOT,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					dev->driver->name, ts);
 	if (err) {
 		dev_err(dev, "Failed to request irq %d: %d\n", ts->irq, err);
 		return err;
 	}
 
-	tsc2007_stop(ts);
-
 	err = input_register_device(input_dev);
 	if (err) {
 		dev_err(dev, "Failed to register input device: %d\n", err);
-- 
2.56.0.567.gdb80ae8cd5-goog


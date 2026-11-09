Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266071;
	b=OAEHcT9mwa0eE7yaxuFtiV/cp6GsEKb3QtMaM57+GpXdL88DqCnqio0VUTzRELpooauB
	 6CScKineERJpzhs44gkox8E2iaIKIZaJT1/V3OE+oecDn53OryXmJmWSoHo6lNl7e5Ina
	 06Kus7vGe/qvN50OZKWcXlJ1ZcEGhfARoXb0fAeIjdEXGtkgGoIAfv9DmyAnOJlxq/c24
	 uB3m1mSXRljU6dVgb+m2LFAs4dU3KCmt+dnf0/wjcXfCKSsTizp/hC5UEJN1Qrkp/q7jx
	 KX7TeS4IlAQo1ch+b8zbxhS0g7Ms7Rp+alzix0hjZvXZq+Nr1phqa6wTiNX5g18thDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ttzRCCZmtIduqcI0NA53dxcz7nQK0XuXfcj2kfCcu58=;
	b=Nx2G18A2fm089ju3pME0f5RP0vYkOI83N/e6sIdJSGPNxkSginuPHGMUOVrpA5QC0zmG
	 mlNxwcUF/PW4Eu45Q/zYKELtaLFw7n+JvCvcTAVEFR+OMobLB/VYsNU5Kr9EcqivDjUmj
	 Jd7C4g8bmGMbJ8a+Hv6S4aif3fsNQb2YL4r8q62OSeYN98qowOSEiF0tfNB9hWnNtWw9z
	 cASmU350WGQWJ/2kVKpS8TedLl6PSpEh6RAuHQS38IN/ud4sTQ4c/rwvBS57TFyTOWfZ6
	 gzWpvAqTci1cTp6jRrSf6U0QM+jsKn2F+h6dRwceKUXD65QMzf5nevw1PMkeBkQqtQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP5Js25w;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3946A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3946A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aP5Js25w
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1929904a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794266069; x=1794870869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttzRCCZmtIduqcI0NA53dxcz7nQK0XuXfcj2kfCcu58=;
        b=aP5Js25wSRQzgwagC3EEb5dMAyIC0OwMCUoUJuDNkCIUG40YoqoPPRJgJkK3Y8e7Yb
         eOtWoaVhvWDnUhlZUzIn9ru+h53ztm9Wd+lMNdyJADBOjku3XQTfjgYxZ4G2o8vjukbK
         pXEzoLgQjlli3x8CVINd89lZ/6ZAJK9juLFfuba1a8SMUVaI95DiYWFNH9qMkOIm9OgK
         AEF/CRTcsHfBlQSV6CG+Pzp6bPnrtQIIrsVWQpOmunOl3ThilkHKn3rOncUr0slg660x
         v36a6RNC8/tNGvTw/i3ihYl9SbCbSkjszcstdO5LvEFCqKNXJpHtHhy/6OsP11bDm4lb
         7ccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794266069; x=1794870869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttzRCCZmtIduqcI0NA53dxcz7nQK0XuXfcj2kfCcu58=;
        b=TXLkfSRdrmxScbKcLQQblHMIQBM5wht5lKbLes1nih3EOtSorUxDvRtIfAkjxwYYcW
         TPQc6ELL8aVGZhfoqQgrLJ1UoiAhD7FGxyANfBM37TsjkY3vklnzDkgRz9lIinm7HGMy
         iPRA9vaWi2QOg2NIg6lcTcJ5bRaXfQzt4NJX51Evh5lQ2/Bej5D4M6gk4/gp3Bjjo23u
         chw3FjRN0Zz0UngkhlMzzpe+VSPqSqZVxbtvFQPMpLIo9emu8QDE2rqp+OL0R8r7eCRd
         ltZaNHmSY+DsQUQ43wBzfTRI+MVnOxiXw2AwOmTIstuBUx8nEikJgk/vfqANQKybDowq
         3pWQ==
X-Forwarded-Encrypted: i=1; AL+hErEC8Qk3QZTVqAMJioG+j1SGjhkth8oeXf4FI8DzSwGd2tChCf9NdeCWz1DvrHvV/PYkiCTdQhvLMm/sjv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x5OheujYedLf9sQiUFi0j+vpRns0pnMi7jslC//rfK0xKGuSc
	WVHnBBw05cLE2PoMcctWPBK/CZ78LOffEJYumR32sKeQHXxq4GbdqhyY
X-Gm-Gg: AYBFou2LDnryw/DAXjSsnqmC+f/QNLk/CaphpBnBeeSMb+ZA/Ie51xWiSGs8KKDJX8v
	lhiR5V8QIn0ljAlk4m+RXslifQeZ3PeViu+/C+yY7Us0i99LDpXqSDQ3U32tw4SqyRRoPT/tWM1
	1wL7A4Ci93jyPgCSDiy6KsJ2CvsKmIjKUN4N3bHUkVVrU1Q5o0AhzQZrfa5l1TPt67/2iwSj9Ap
	U1+P4GxxqSwMyRWHzueVrNGuIhcdooBsrU7BUD+74Neu/Eo9lo/K2ruJAPfXXArctVRBnwPVS+J
	NS5otHMDbij0RzsiNPTdtbYPcujPzEYG8Gh8PLHzqxMUjyS+69PGpAPAHi9UhAUk1QdGYNc8XVT
	zgIAv2eXh2GMuGSBPZ09KwZRAvn/GlvKr9UGBLwDJHPq+206IovzKlsH78KpCtdtGS+647/1hJE
	yHjDsdD9Qr6wxNBjPProvauMNC3k0WLfgahlXHQxGus5GPfBcpusdD0zpPhPikye3lT/MNL4ggp
	nmCduQNu+pCisECoU0Ns/tFEY9LzHTREnwOhEYIrI7gPo7SXNoXbtSSlqq7++jLqyqZzhM/EF6k
	XnwD5v46PfSwMbn6RhLG6FfISxHUPfqRNlLGa1hUqYK0su4FwvV3LQGl4BU6Tk+oTO0aJdp87GT
	IppF1NcgN1avWvGI1LrD7iXaoPnq0rtm9wFg=
X-Received: by 2002:a05:6402:a6c6:10b0:6b5:6a24:6cf9 with SMTP id 4fb4d7f45d1cf-6b756ae3a73mr532912a12.45.1794266068494;
        Mon, 09 Nov 2026 15:14:28 -0800 (PST)
Received: from fedora.tailb87685.ts.net (ip-194.15.124.140.laito.net.pl. [194.15.124.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790caffsm273785a12.32.2026.11.09.15.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:14:27 -0800 (PST)
From: Platon Miller <platon.ksenzenkokk@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Platon Miller <platon.ksenzenkokk@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unused macros in sm750_cursor.c
Date: Tue, 10 Nov 2026 00:14:14 +0100
Message-ID: <20261109231414.25021-1-platon.ksenzenkokk@gmail.com>
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

The macros HWC_ADDRESS_EXT, HWC_ADDRESS_CS, HWC_LOCATION_TOP, and
HWC_LOCATION_LEFT are defined in sm750_cursor.c but are never used
anywhere in the driver. Remove them to clean up unused code as
specified in drivers/staging/sm750fb/TODO.

Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
---
 drivers/staging/sm750fb/sm750_cursor.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index f822d147e..571cf86fd 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -10,15 +10,11 @@ writel((data), cursor->mmio + (addr))
 /* cursor control for voyager and 718/750*/
 #define HWC_ADDRESS                         0x0
 #define HWC_ADDRESS_ENABLE                  BIT(31)
-#define HWC_ADDRESS_EXT                     BIT(27)
-#define HWC_ADDRESS_CS                      BIT(26)
 #define HWC_ADDRESS_ADDRESS_MASK            0x3ffffff
 
 #define HWC_LOCATION                        0x4
-#define HWC_LOCATION_TOP                    BIT(27)
 #define HWC_LOCATION_Y_SHIFT                16
 #define HWC_LOCATION_Y_MASK                 (0x7ff << 16)
-#define HWC_LOCATION_LEFT                   BIT(11)
 #define HWC_LOCATION_X_MASK                 0x7ff
 
 #define HWC_COLOR_12                        0x8
-- 
2.56.0


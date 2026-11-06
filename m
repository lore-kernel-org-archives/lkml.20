Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997827;
	b=oEdC7NWomfsudR+Uds7IjfXmodUGjdCG6T47v/bZ71mkgt9SHhVNp6C/3JJ46Lyafu4h
	 +8XHs62rx7B7UyAlaHLqOq4wEL5k4Enbufn2V8eUJP3FqwAQp3jlY721KsO2JAWj7scI6
	 pIlY/964wIFfkAfFCq9tw+/iaIGs6hTE8tPAcdLjCV0VKXSzQxdLRMsIfPjZ4OsP4iU8p
	 Wbjogt0olBO+GFv8XYObadooSidt6JpPYWj18/EY3IKjStHbvicN9JdbHWFyVH12mGHCX
	 M8gu5YByYjPTSqFJSdK2iMX7iNEhNYEmISPlB+TYAWzrSEdHQzdA2JSsizWIuX7OKbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AaqI4nsVwt8NwQMUqrGb4oKNqMy0e/MDsMcjH/j6UQo=;
	b=xjXIT/ks7lEHZAW4cX7G2xehPmEErcYxiSpCEJ0aQ+B1puTzLlRbqPs/HyRy3Zy+Ucb6
	 p0iKyoMnZlcehDg/Dy0f0dMWpRavcElG2wrr2EwzQtXo0n1BOxZbNAV9UZmLJN/3FoMjx
	 UTdwrygtVpIJDwECAdSWZ29a5Tg7uX+ewinvybFY3gPdzY8LiiLAwjfO7GyVxVqh2Zyci
	 9ueKNte9jHAOKxpVq5u8218CNEiXEfifgx68FWXSYgSPX14gwX+HJbKQOn48UHsn7FJ13
	 q9OPLXdtrRbf7u5pqX6r0kr2URDEA/F+5nbI62hOlYs0OfgVqs/2X2lMJNldgOLQaYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQH2BzUH;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B61606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B61606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQH2BzUH
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c11318ad1so719168d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997826; x=1794602626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqI4nsVwt8NwQMUqrGb4oKNqMy0e/MDsMcjH/j6UQo=;
        b=jQH2BzUHos+6wVQQVrDY0Db3P0nk5zQMZ8YzcSOOuzGGG+IqNiVNHmxDukOpVanSFn
         BdYNUUo2AdHsX1jjY3in/R4k7k6EiNTRVALyQFO7RVEW0mSJ/mrLmGWQiytj11HcjdOK
         ZtSQ05+zOeG9lotPJGrdMIitnMwCjoYp35FenSPEPxXYLfVvRC71WLV/1FMwA+IK6VaG
         BnR3wHv/vQBJn//+qD7NrX7dVn21OjvoHPkcfQLn9POqGmO3lEhzCBt8BIOWwNvgrolF
         OOLMxsg0cMaA/D5Nibvvt6O8lYjdhPgN+gWsOOMnTb6/uxpgR/xTokK/kO1PLoYLDO/U
         03KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997826; x=1794602626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaqI4nsVwt8NwQMUqrGb4oKNqMy0e/MDsMcjH/j6UQo=;
        b=qnk5sFadU+TrEQ/oIQ9FCKI7cOODIJJpTyvP0C6P9aqjER02M4TmIpqJEWF/MXSW5a
         sSAk1XxxaODOUDkr4+VmI8mFwRvW8yuS9ntODubUWXWeDOu4bvp2XUjqIxqsfZSg/Y+0
         gsx8Qv7VesZ2S19ZrXsvoruYHHDvuvPIc7nM5afmJAZDpxoQx92nV6VWR/SOHv6U4rgZ
         1211EIvG76g3BbQOfyMDqvUFGWsORZ13LnXiOuYuomLwnCbs6tMLLbGSd8P1jjbOmQ1b
         eNsIPmp23R82SJwle3CxA7HSLuNc3hOPdVy7m7BeSC6IUswRwK5EUsOwv/2ILZTGnpF3
         RVCw==
X-Forwarded-Encrypted: i=1; AL+hErEEagZ6ifdYcdGbj8YsW/vcioMWGeOsA5jYdsylp5qI+1MCo71HIsjHO0M0dZFiDSjrYTkXJp7KQT3Py3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PsDDYrQYXy4cHAo5oSU9vHw1QGKfpZMjp7SX8gMB/oA1k+436
	wLoJx/7bDTGySIgQfaQaQo6THQ3pL0szENmEjiY+7Gk3jUgTjl27KWK1
X-Gm-Gg: AYBFou0eWrEe6yiSkyah6mYYQEUh49/4tgMlIojzW49RL5QfDHUJJf6hWN0jF8le+py
	DHIr8B1aNw3XGi5Fk6wkDUXXKcQ15kMN82j/FieZBSXxMgkXe7TZn7oRaie0H/o+v61J2T8AgS4
	Ruw0JuBqPtWWWnfAm3nFSaWgk868bQpEA5tV6BhNu1CGAguPE3PncJJlZpBZ4hfcgRMkVEXYKeW
	kWnIZrW/SMHxN8/QDO1xEkinipfQsDEVEyDZy7J4pSLnsPiSSY2Te1fpuMbET6/3bFw/9KYzgic
	gyahpi4LXLiSGWoxr9VhfbsglZoyjLj3Z9lIe19pbY1jcPoVi5AbOQmRgYZEuqbFv8lAgreLZuR
	wL8JnPQNnXnsUxrqkCTQOrH7orZWKxoqZteDJQCPPp1GDo4xBoW9e2rhH6czKzG1Ws7olq2dDqf
	B5NsQA3MRL2Mjqfws82Ara89PkZovb/i9Rb+K0vlglgCTCatHVPyWnMWIvE1SdGIIewmfJaN7Aa
	eOtTQkyfIomVzFFVs4KViX9T1kMcE2QcYhguIYEd+qTOuMYcOwuuVGZMgoGAmwUFM2HI0qf+LJ8
	eOdZevWyQNGQIjb3MHlXG1/l98+hA17Ab7LDrQfRBXX+NzaW9rdkXmeVNEwyvh0AYLI=
X-Received: by 2002:a05:690e:408b:b0:679:a190:cf34 with SMTP id 956f58d0204a3-67c14578350mr2134231d50.98.1793997825658;
        Fri, 06 Nov 2026 12:43:45 -0800 (PST)
Received: from carlos-MacBookPro11-2.home.arpa ([181.216.192.12])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135ada39sm2731818d50.16.2026.11.06.12.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:43:45 -0800 (PST)
From: Carlos Alberto <carlosalberto4ti@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	patrik.r.jakobsson@gmail.com,
	linux-media@vger.kernel.org,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	carlosalberto4ti@gmail.com
Subject: [PATCH 2/2] staging: media: wire up facetimehd in Kconfig and Makefile
Date: Fri,  6 Nov 2026 17:43:29 -0300
Message-ID: <20261106204329.2176266-3-carlosalberto4ti@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
References: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
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

Enable building the Apple FaceTime HD (BCM1570) camera driver as part of
the media staging subsystem.

Signed-off-by: Carlos Alberto <carlosalberto4ti@gmail.com>
---
 drivers/staging/media/Kconfig  | 1 +
 drivers/staging/media/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e7f4c16..fab872f 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -4,5 +4,6 @@ if STAGING_MEDIA
 source "drivers/staging/media/ipu3/Kconfig"
 source "drivers/staging/media/max96712/Kconfig"
 source "drivers/staging/media/starfive/Kconfig"
+source "drivers/staging/media/facetimehd/Kconfig"
 
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 7d704eb..aaa3e2d 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive/
+obj-$(CONFIG_VIDEO_FACETIMEHD)	+= facetimehd/
-- 
2.53.0


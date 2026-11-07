Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053780;
	b=YR4gAcYfB/AXSdRecPxmQWBNIhz5dGml420wBnODeeRHJM3jd81CJdBIwD3u6h4esMpZ
	 g+1Kwo2aL/Ja5gIP/CHnOAoZLLK0jaMnTi7CMIHVSQnszs0t9sAPqsNFZRCJIxQ2ppn6p
	 6GHtt6mC5dUhpmNTOAomjKkNruoEP8Yv/U+nAxm2XlTsb9wYHlECqRIFgAbuqJewAXhxI
	 N9j8At2qLW1/3BLX6mfW+VpipK0PzbTgNWkrDi5hGOUD9I3jz+hHQxtCs6jZhrpJAU7SN
	 aPnJp2aeiVDn14BM0lhXAUpiVAhMYC4MMljrzdSK0MxTHEANdG72iHiMCmMJUH0oT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OJxe+L81yP0ZTM1ZmFPQhaTs3ZB0xTEsasaeTWblhVY=;
	b=CUniDvpfqEE0kDF38Hf3z8vasyBBKHFkHZyqjlX/B2LbCszrodAOdSwzf3ivBALFB1jX
	 R6W36YK8YLyjSlkP7+Uc7xpyciXN9jWhhHCohbkNJFrUehSESf/zbyRFnnG+fjjpMHzqh
	 fTEpKd8Laaerq5eWYyicd8jXkLNfq2iscjhGItqwhsDA90CHms39po+17KND9n6C7z6ZK
	 pWqELSkMW+U5h9l+gMbAbGH4md81nUhNG/pAJ1cHZ2DRyQ8sn3WYKU52wcrFgZZglEVGl
	 6rql5aFTMKDYWQ6tstsWf0oX+59lKVG4o7hinBME+eq2Jw5PpS6Vhe3rul7W+0WP3Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAX+Mbsq;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB8B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAX+Mbsq
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so1189999f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053778; x=1794658578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJxe+L81yP0ZTM1ZmFPQhaTs3ZB0xTEsasaeTWblhVY=;
        b=YAX+Mbsqg+MgSMe6blg0TrDSdsufX3PufOYgPTgIstHaWipo29/8SjuRuCTZvofY9J
         KNTjacHa/us/Ym1DcjJkWF0lIYTb7msntaAzwpXJOhpsr2HqLhB7ly7T01wP060MXz87
         jl9A+yhTlD1tr+Avazi+6YWqyxmdYOvHyGmNe+Zwt1rNjpsFUihHuIKPplm+RdATqxfJ
         kmReenPxhjoo0k26O/0IraY7h1YDiCx6q0Nb/yt60bWAyVhNhpRsY4QRD2U5cOG0HMBj
         6jAxbCU1zJKSPx9ACQLJ16u8LYAutbmeeJZ0sLNjSMnTup/oVbcRnK8J8H3FoJbYexoS
         M3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053778; x=1794658578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJxe+L81yP0ZTM1ZmFPQhaTs3ZB0xTEsasaeTWblhVY=;
        b=yoY8Bdg8NF6q8QG1hwfRKoS42vDxOiXNT3tF2s3U8kSFvMCrgQ9kzXtuNQxL9f8k6y
         aVnvZuaKQhlyeJXDsnn0sSRLUF6Yd1EKseAFmi9B75Gok1u0GoQOZHJPGkcMbiLeP5b/
         ANBSjC6KqZS3W9IPPnRMaIrmZRMyujlGtS3+e6HVvqMInbzfQ29qEy9LsT13ti/L2Iz+
         7Bw3iQ5tUIsJieaUlXTVINQ0kjM1dVsRGnlDrNu4Faj+qfx/oLkdo/PFxdTzVwcj7+cL
         R6HusjYCn4/uoAsA/snnACJPysndA00MTh8eYhf1CHzYiO8q28HVBbmbwrWp0XtQtzmT
         JxuQ==
X-Forwarded-Encrypted: i=1; AL+hErHlCzErTs4C5P14B+b1c0syRVbIAVKEdKeo7gApA911Nro8l2UwmoHALHPOpfllAzbx02KLdtBqsh8W0g8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KpWQipPBkuqhCuFoUGo5jpBNgSH5aAOaiYXXtbCx+nWPF9wKa
	cbHHIXtKSgfmaYqPseyEfD80dFBcPdAHDUBg8c2ATbYSYEyEiwq+uo/K
X-Gm-Gg: AYBFou0s4LOlPYeJiiOM/7LlPPu28GMtFy1JREeOXpMyOoVfmBwP/A8B34FdyTqzwo+
	xWedKw/01ZsaLvbwdUNTYfMaK2w0q17+oqsrm4o50codXYLIJ534lv7Ot5mokYiHacTeT7k/KJu
	x9eoo0DDRi2EWrVPXi9WS7hxad5XO8EKvXKCZ6li31KtaqQRityZN+KoLy/1VGtOCjon8yfFKNO
	l0U8l3nXb15/kCWhEf4sBL7eF4gBsXKa2XV1VpulzsQPMMjpzN7S64GYNTMnMwSESYar6quMsmc
	xC0FlZ6u54f5qVKmPF4h+QwSz2xoBhJIe4vln9z6gnfHeZUSpzyVRX3xusAIiMGhYITpRyFH5E5
	lfZ9nrzR+wC9yVO5zkaxl1NwYex+/3NVz5cN5i96AbgOUDiKO+RHUasCqLSN1/tWwYc2ghsqFWy
	SgPJLG7ltveS5DhWJgXrdJ4zkO86PCV7BsoCY+6wTpYhc0lJEBpjZcdqnYEilZ3k+lprN4nYJTx
	9/VFQTETs960m/KsQWGc68QdHh7kSsA0psms7vaEzKt8cPVaui64FqtjknyRPzrNpbX4a1mHK3K
	yZQG2dKBv6ph1TuNpAXIr48iJyfMEtxgqQ==
X-Received: by 2002:a05:6000:46d7:b0:490:50c1:f352 with SMTP id ffacd0b85a97d-4927721a480mr7374012f8f.39.1794053778032;
        Sat, 07 Nov 2026 04:16:18 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63accsm9569485f8f.17.2026.11.07.04.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:16:17 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Daniel Stone <daniels@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	=?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
	=?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Simon Ser <contact@emersion.fr>,
	Victoria Brekenfeld <victoria@system76.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/7] drm/vkms: Add driver-specific plane property for testing
Date: Sat,  7 Nov 2026 12:16:08 +0000
Message-ID: <20261107121608.103951-1-oaroraetimis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106-drm-reset-state-flag-v8-7-50fd046b705f@kernel.org>
References: <20261106-drm-reset-state-flag-v8-0-50fd046b705f@kernel.org> <20261106-drm-reset-state-flag-v8-7-50fd046b705f@kernel.org>
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
Content-Transfer-Encoding: 8bit

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

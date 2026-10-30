Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334564;
	b=nZVilbjg7LiCadeVoi2oYYKTthwplmb9EdX6xGn2denb4Fnvnhd3SPZJbk3MbBYmARgi
	 xb72Mdno4YEbL1AkDfMnRPSSzr05vr5iAnjPhGW01U0I8C/cg4jaXUBCJDZ+VfGzrIucI
	 6OReMfulALZRFL96ng1VCVedCE/2wrjl2V7oQTLvIVZ/+A5a5pysW4KUTIJk0qr0YOEwY
	 tCc4gk0X6JrXZGFhQV+kaI6h/a2p6+ha4kCHQ7XqpvTk1qvIaMnZyhnxOko6Qx/yPo1AK
	 e3qBY08Ev7hD04HnmSDaS1jBi9T2c+FabiRVwDKlvszrXQ4wkcbY2E5L77hRQnfxU7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
	b=jiDr4jO8h3e+CifAKbjsA9oorL3ahChpKNjw+ObQFQFAiFbPJOrisdxHocTVrrjG3RAw
	 fyCWpgcIDUJhl2d6gwDy0ifqxvXsGpqsnQ7fFC5TLq5g322J82qG+qKkpV5NldksadxlQ
	 8EjszxvfGDPCGxThMvxokfzzfcPbe02SFofb93ASgqh2S17Lcjp/OZ8YYou5DdNKF+6ra
	 TMqGo6QwtiuMllvNBQI9sBwGkNo1T4evirA0nm0IigvkBJcb+bfVTbyjCBf/WaxQyYBob
	 N2QipCIEf32NJOO8thHMEFfxIPhCR0XkWvu3b/+fC3fxwaqr91dsz6H1scPURkFTqnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQDX+igh;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47B606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D47B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQDX+igh
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so126516a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334564; x=1793939364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=WQDX+ighlA0CRmz6xmrYqh8MRT1ubdl1GaZNzjDEOOMFGhf87VDm+sHKrYM6Fhmnwa
         k1BQG2WiH3kKgXLfx0ooUDc3j7jwn/203Cx1bW1y2fQZiDeOouuBa0T/TShMksbhZjep
         OBuwMvKb5u0tilx2XrtW5cnD1oEjPyqFGs7k3IaEyQ/UhYHDN8k44zU6IVZsZi3pLsKR
         caAcsU4jRXkCdn7IvtSHlQi3HL4QQqDNxPfYNQkgqccWadOsmLZmTJZG9D/8fWsq8jnP
         mXlqdaAqf7J7PTynQsv1p3QcPa8hQ1h9j2/1+r0oG7RRDjqBnpH8rF7nhRB2Uil/0stu
         EchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334564; x=1793939364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpeEYAEKyyCPvuV7efERlE4nfg2Y+m/mO0FuoK2R5s8=;
        b=I5UhDDJxqhR63IHA8iP9cObnnBdXiV1J6znwEDGyeatFqBGQdo+tVnXhDCdSO5rXgj
         sSjL1qQsYc3Vnb95rZOECbazANvSRNeU0onn5+/Xt7Gi4/lCOiR808shQA6cyiDOg9td
         J/Tfl+TfZHWm6uXmM8lUTj95OYngqtNhPhp5Ao5mlRPgwZS4l33XE/5bS144KXpogncO
         E8xGuEGW6KDuKN5Cldyf588uAx5O+G20JvxGJX4FBOsWGUVF+4wg49iW9Rz6JynfoDWs
         MSvJdd0xcTv+GLO6fFWG1BJ6h+OJCimI06Be/GdCeg+D/9hxpf8IK/13NYzXb03a1jKH
         iqyA==
X-Forwarded-Encrypted: i=1; AKwUvBzI/UMHE11mbfWCo5JRS/lGW435rSqWmdrKVVHX6bvccddngzrLiXs+obLbsvhFbTPBQaIWhfh99VUc+VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpIoZfmPfRk9eYue4VqxNrV6e7Zq0dHItbV17BUn0vMuhsBVeb
	C+3LpLmixE+dkcbg0YPmxJ5lGeVue58ToUkPVO+WJEht7OZOothrPfM=
X-Gm-Gg: AYBFou2vOyXz5h/Hl5ZXocHo9cnU/SKYdWaubljPyCsNqj/pLlzKgs5rsicCr6Ih3cC
	xmza9BCn9ax1dScA3FAYGFAyB9UHE6YbTV4eL0AeJiJf583dl4MWPDDvUudD+a4gUyK2ypxA187
	x1crLB2+axcKAlUZsQHhUEmF7rcpOcIRHXX4a/38smdmWK167B6DdBl1/VgSsO5O01J/lfgMxI6
	OtgAukFwZKHYRJh853m8lkuKsKhiX3QVaLBGbsQPReY54W4FaHiVYB0Lo01GDFT8w+G60qFu6fc
	IgLHvc4K+lGHbop14djkKK2oas5ZXVCvnJaGkwLD1R9IMrmMmilAtFtEVHCw5Fm023TzQGf/uug
	ab1LOjOGy372rf16Z+k5STwYHe1jhbgX9LK3EYsE1spFnrZjLgoZIa5tcdttg6aiiRcQYssgX3V
	uDHpxMF5XoLJPs7r9FBVGFMw7n+timcvc+yU7WjMFudPMmSMFVityqUtAOxYxpI+uG9EUCtKAV4
	OTvmn7xBDMaOzBjhuEFfhEN0jUitPR8o4r40nnRC3VNL/gDphIDtzuPt3YzLWXwjm/SLtEt1rHj
	LRCJAtLF/3rWsc6KXyStTfe6Uy+S7vM+ykGyGn8O3v+FU8OMtpAFaVxJr7xLzX7voY/a
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr857008a91.60.1793334563678;
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm606067a91.4.2026.10.29.21.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:23 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dragon@radxa.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/20] drm/msm/dp: Cache eDP link capabilities after successful discovery
Date: Thu, 29 Oct 2026 21:29:00 -0700
Message-ID: <20261030042912.2745609-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-11-1835d4966da3@radxa.com>
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

On 09-Oct-26 11:16, Xilin Wu wrote:
> Discover eDP capabilities from connector detect before the first
> modeset.

I tested this patch on its own (not the rest of the series) on an ASUS
Zenbook A16 (UX3607OA, Snapdragon X2 Elite), on v7.3 plus out-of-tree
Glymur platform/board patches, which include other msm DP changes.

Without it, msm chose the eDP output bpp before the panel's link caps
had been read, so the first modeset after boot ran the 2880x1800@120
OLED at 18 bpp until a DPMS off/on. With this patch the first modeset
after boot comes up at 24 bpp, 4 lanes at HBR2, with no link-training
retries, on two boots of two different builds.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke

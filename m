Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195340;
	b=evWLLUvJlCcT7MKLdBCGKGSspT39Lt7Ws/4b1rBTxfaQjpJEqnqPuTyGZ3S0dVachMJA
	 KMM7SlubvbsIPgQI7r4MpoqO/FL3Uk5mS7c+W7BDMhYc+E6u9BH2ADjRTENrI/iXS9POm
	 X6NzBTN5NS2o56C+dF7hd/3a4gGmittuyDTKWwoOY0e6k89kcIloiK7FdUxMKNzWAJlKM
	 TI2ZaJy5hdNuIF0HbE6vUEUNBT/UDSsGRJQAoQ/0tNygUQ+qwTpiA6byuHENO6KXFymvF
	 3NgMvmuLWG8qQhKAdndXJ8BANiatQZ26Pg0lFw6ghsYcY6fWeKsa7cG3wMsXHFmwBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1YuJ53WOk7jrtj0trQZSUgggEA4iaV0qdnW5q4z5Yxk=;
	b=UJPxAa0xhDUYAODbHod3I+OCJFV9z1ZkOZZDp9HqTcBg1DGChhIquH2771Vc6gYylKmE
	 HdEquwn4I4GvKe7oOPEI3Cv9ZIAsWQx+K3JWF4xEDzf50YeDIUKEwkMwcyegU9q1qjag0
	 0wVptPmfJJK38jM2ru0eLgBtV/zWp5uerwWy5UrWWipsmlvCQfbM0dwkQvyrLdcegVK7t
	 O/wJj1SaeQ8VPUtTCYm23Tkv1x8VLc7UtbPSO7JXjlB3AY6QavDqV5N8hytmce5oYgsVL
	 XfBdzfFaLOg6ViHsfjOuLn+SqeG4Grhju9MUDxhkX4iUSt0s73Kw+rMsDXmEG+icbSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apmeTwME;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D4B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apmeTwME
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ddef424972so804706eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195339; x=1793800139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YuJ53WOk7jrtj0trQZSUgggEA4iaV0qdnW5q4z5Yxk=;
        b=apmeTwMEm7Er4RiiqptHiz26E8hD/INQ3q5n5r9r9rcJQ24FsKAzrfsc6yRE8hcFGV
         g7pUEMwhgEqcgWHsgW4LhmiDEPnRRuEIcz04lWjkq/1zxTucRWdRiPvtcrfdIDEJT9Uo
         UhdzOhTsphug2En4UvmxPYdE4i3WR72Dyt23Pb01/5fxRdxU7SrhSRjMHpzP8JONhr7u
         WXNLqAB/YC7hxIPgiSDjDb4vZvIp5Wzpw+Cx/P/HLmb1/wbVFFT8tCQJCYxOEP21WlHH
         6jghq5Q9o+r/ZqWSJILVxnG7GlU+T/WIS9MnM5ImdRY7Y7km3vr+hy5qjD3MzbFYe8iN
         GwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195339; x=1793800139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YuJ53WOk7jrtj0trQZSUgggEA4iaV0qdnW5q4z5Yxk=;
        b=TqdCXle3+vt1Cf7i6M+dWZCm2nz6WYD2miyCd9jpVGI3WDG58m8dFDBP+aXXzZysmY
         gd25tFscw/TSY0wB3mvdcwvteHlJJKvunFsyWqNDsRJDF182CPZ90Ok4YW9UageO2nqC
         ybWc/KNxWzdBnouTb/DyC60uLMLz6ffOz/krNjpWELnbpVanBKJF0NK7oIfpn8SlH+By
         jGh5j40XGF18xvM8uSJqRPir37gQWYxNgvf9HYfO1MUoIgsBFYguPRcfUWNjeS4zvoES
         GPbqyjxiXg6ILD/UwKE/tg2bWH7BqLNSct1DMhaL9PLUUdR5eJkWVzIz6sK2nZpRcOq6
         yXSg==
X-Forwarded-Encrypted: i=1; AKwUvBwRyLBuXuTyVshNswmrREVThwQuK3vXfoaa15qoi6lzUp8rZZhncaKTwflLE7V4U1XT9sqDPv9ggVp+yf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHIJ5csBwEn0ccmh1jOiBeb5cgNlrM4gTnK5cnwJcjQ4AF5ztR
	2LNxwIrDJjKdmVKC3spX6NdXe2jRPIF5eplowURcfhhkDUbedW677f+0
X-Gm-Gg: AYBFou3E0m/rsh5dVnzwDCHWTPik8x1zBKKZGFVR2VUxedyCEVRbrTTatBvZsyTr8dV
	4Xyk0jzujWrhLrQvYv6nCr0kYYgkuPrr2+mjwRZ1FwGHu9g1w/WZGOFvtGyEuA7xa9I0hNsV+NO
	2RlvLS/8SbfYNjKzqhKg2QZ35HnctoeA1ilyt8UONsmN2/CE0R9rEwY709QD8NPwO1KtALina9g
	W+VXl6AzBMHqyxSLZ006nN21LIxRrMZl6scIoa/3amBCa1rYV8MnT1ji7A2IuEKTC9V5UWXFaWV
	G+VOLjpvMWeYL7WeS9lZ7iHNkAVtzNYSRpThsaYoccTi1G0sb31dDMMEK91gxfVoUp55/scuP2u
	+RQlWhN1wcmoarX3cL+alBFO/1f0lIhdUrWoc7gZo7y9NXjcjgm5hpjUXD7OOKzZipHxwZ3gj7p
	lqQEI1R40e+IFmHyvr5DEOpkGOVWR29kn0GSRsykVntUjljH7MEdebGgwUoN29m3pqWGGBc/LdL
	5HyKXtrpC9iMmSv/7My56nAvLbCEnFGB5RSKCpu8rqjcpsMLzesCoOaEEezgf53n7OD8qVqfnG1
	AzLmEHVGDGlgN3aDlrsaXMnWGL+192jYsev2oNKS0wRejz6d0exq4Iya5nHiSHl7tRPZFPg=
X-Received: by 2002:a05:6820:450f:b0:6fc:373a:176a with SMTP id 006d021491bc7-713efb16571mr1090755eaf.77.1793195338875;
        Wed, 28 Oct 2026 06:48:58 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142d124f03sm1409758eaf.13.2026.10.28.06.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:48:58 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Danish Khateeb <danishkhateeb03@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] leds: tca6507: Fix use-after-free on unbind
Date: Wed, 28 Oct 2026 08:48:57 -0500
Message-ID: <20261028134857.36086-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179213356828.2581328.5085333261240588869@kernel.org>
References: <20261015144033.56519-1-danishkhateeb03@gmail.com> <179213356828.2581328.5085333261240588869@kernel.org>
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

On Wed, 28 Oct 2026, Lee Jones wrote:
> Please review, explain or fix the Sashiko review(s).

Sashiko is right that the "LED off" write queued on unbind gets
cancelled, but that predates 1b5c2fa7081c: remove() used to call
led_classdev_unregister() and then cancel_work_sync(), the same order
this patch restores. Since 1b5c2fa7081c that write only ran on freed
memory. If you'd like the LEDs turned off on unbind, I can send a
separate patch that flushes the work instead of cancelling it.

Thanks,
Danish

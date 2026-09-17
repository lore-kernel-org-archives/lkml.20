Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF11442B15
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630183; cv=pass; b=FaUYmL4Ck904+V+XZ9CMhTMx7l9Cu17FBg/vfV/QM1P9tRz+iyM1jbFKyfkZw1z1Kho9B2EHyDj+VOwPKnkiUl3TWPV5z7LjUE7YPY9zmJLjICH21oq75Etj6wXsLZt7lbIUHWCPlVV6a12tY8HaM0NvNlJ+5sNisrQsCf+hVOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630183; c=relaxed/simple;
	bh=X3UbFhQzAa0Mw9xO9LHhTOOuDgL3VifHPJjvSa1lfcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TznOOIdxnt7ygN4NEKcWiYnSaRWQgRWe5iamYOkKETveu4jlPgpdYhWSKBK3QrybTHUrQJz2pRtMDFxtl9KxG9mapS5KN7dVBvjUl9VWtmMpIE4CIDeQCiwc3Htbm4wIRTUKyayUHySiIXBsyD3qgiHxszTyxdQOZn39a55I5h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=cxNQd89N; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="cxNQd89N"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74dbc7359so363917e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789630177; cv=none;
        d=google.com; s=arc-20260327;
        b=sRpGxzP1p2Kc2T7zvl5IEbaZAN39Ay1j71SJ9jQsGb0u5pL6u7n/CtwpDDxvZip/mc
         1qaIe9fycmHphzG+RrQD7OtA/sEvsm3H0RVBO/OWdUcW6lEL5u3c82yk+vh2dmatDFqY
         TrPxbzULfq6Caud9aSwnVtSizr9FeCGh0mocNsp3EBSZKQG2bTz/Flkk4hxr5+5OYXQD
         2xSX61NkkOe5PBk3kvYOThkEDrciOFmumw7WW28kjQqT3WJlqHXm8AirI9AkMhM11nsU
         cFY0n0p5WOs4L7gSWUkyi55I4o+4H1lOMEElzaW1SDGCMKSXkv7Z4eVDMLlR3o/ERoni
         /sgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X3UbFhQzAa0Mw9xO9LHhTOOuDgL3VifHPJjvSa1lfcg=;
        fh=Sm92D7T7VSPx0qQeHSrz/EBA8rTPd5z4dP4YMI/xVX0=;
        b=KR8Zl6WTe22J0TnFyCTbwOorjjDFPX+XDjRZDyyPNI8EHkWBYebtmkBu7Hk6jIItOu
         kkhZqq2Ybn/7i1+/ld8l523DYcf2jN/VOcyw2Fepvbd+ziB0V+fiFXsyaPlRsm5nt/Vz
         8CxeraNX+Rv9B/9jhnZFv5cvNwztfZPiHU54maMIOuDtMZwuCiJ1vpZMWtf3yx/3D8ei
         ozoqHxoszjjDKx7abIgmlrZP3DwkI+luRtL7WUjKs3cqeAFpQ5kfdqIiX8FwpQXs8ejJ
         336gXWzQBm3/xqYf/MNxLpv8CBBKH1z0o5zn5CqF58gyQ14HJ1sQllK08cjGq+vxuk2U
         6Vrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789630177; x=1790234977; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3UbFhQzAa0Mw9xO9LHhTOOuDgL3VifHPJjvSa1lfcg=;
        b=cxNQd89NvK+k3yIjLO1S9ZnG5qaOMDvvaBihJjHm1piYUN+TJ9J4hZoJDCu/jN4BH1
         MGzz4e3nC3Jl3GpJCsYFygqtbDkK5RuivAzm5HhiEqqColzXOTVe2Y/XBxCsb4EDeVLg
         5CMREmOaTTN/FXt9Rnk5dwC8pq0H+B0Sf31Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630177; x=1790234977;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X3UbFhQzAa0Mw9xO9LHhTOOuDgL3VifHPJjvSa1lfcg=;
        b=e5tvzoHe0AKVjWc6liTwspfH7Ro/YPQuY4vgd9X8UtlHfmDv6IELwZzmOSRoouJicP
         Z42/2wQDQT3/nwAvfn4JRTuinvMkt2fl6Vg6ldi1mQPbkQd4EdMqOLHvyJo0mpuFUsLv
         ROu+2HCZBfVmnzoy1nVIWu8vlB+gbJXuVOmhqKQIv+3MMAobqxBbPaJs//XTz8xzr83L
         ByUJ2MoDyNf8Q4kh99WGr02vrQM+4/I4BlyWn3ZdX/9Dr6Z3Eoqph7bRcnMaON+vOtkG
         omOYgcmuKVT7uDsdy8+qT0YKsPYoCoKLx1faVesgvMK5wa3VOkvSnw+Z2J7kzy+uQuib
         dm4A==
X-Forwarded-Encrypted: i=1; AKwUvBzxf2K5odZU0QfHmcVB5hNmbU6pd+6ybzIBObeET9IdtUayuFCKRUMo3uiKgZ+oE+3W0hhxa1zGuMtUpw4=@vger.kernel.org
X-Gm-Message-State: AFuF++nrvz61ihMKCZbZoz51heVjzz29DRzayv/ODGouy34CjtJCFKwx
	5AubBQAi5v3G0HdaE8zCQj5TPdkGeic5ugfZMkWWpqZvsFs0LxiqwvBONqiMTiXzvdisBFzbZMi
	bvlGXqDIQXCCYpwh/KtszwaPWrVUb9VEVs2+6tV6T/Q==
X-Gm-Gg: AYBFou03ncRaFw3PIKO6gLw2LiH/WXJKqCp0qLg+Ps2XQPBYMZu5Eg/XAJ66la18d35
	RqMRquLmht91ff/3aLiVsWH7O3+jKAnJ82c2vy93V2cWijrXv5Yl9V5442za0wbYQgvq9svVXBr
	UFZ43+j0Jdh85A7RC9Q+QLCRLp5lzZRIzF3lo9Us6FpK+/qMWRZozDqw1uQeYEBV22yazfkJ2I4
	1Z4SHg/pffYsARu1MsiQKiY+dP06ot2GNeO2VwJ4HDFa+UjIUwDYJ329Awk3kbfMwzMPhLZqQOa
	RjJRjAM5Wrdp2TtJqhMZfixuadBLOr78mG2LT3Fyu5jeYBFeJji+R5I=
X-Received: by 2002:a05:6512:3da1:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5b8b66214c5mr1564777e87.27.1789630177213; Thu, 17 Sep 2026
 00:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr>
 <20260913-codex-rtw-rx-v2-v2-3-f09c964e0b96@khu.ac.kr> <2b956e6e0c5945e596d5825ace0c6203@realtek.com>
In-Reply-To: <2b956e6e0c5945e596d5825ace0c6203@realtek.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Thu, 17 Sep 2026 16:29:24 +0900
X-Gm-Features: AcwNN1Udp1Uc2lpIVknPTI_jVxQzzmyOYan5TRYTMh9qrixvJkqLEg9-rrQ_nxc
Message-ID: <CAH1Bc_ybPZtieaMkuUdbpv-STvJTqTxbFZgVbifNdbADt21C9Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 3/4] wifi: rtl8xxxu: preserve RX requests
 across recoverable transfer errors
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

Thanks for the review.

Yes, the additional delay is part of the reason for the separate retry
path. For v3, I'll merge the common queueing code into one helper with a
retry flag, so the locking, shutdown check and list insertion are shared.

I'd like to keep the retry list and delayed work separate from normal
pending requests, though. Putting failed requests directly on the normal
pending list can let normal completions bypass the error backoff, while
delaying the shared submission work can also delay replenishment of
normal RX requests. Keeping the two lists preserves the existing normal
RX scheduling while removing the duplicated queueing code.

For the Fixes tag, the issue is that a finite burst of completion errors
can shrink the RX URB pool until the remaining requests no longer reach
the resubmission threshold. RX can then remain stopped even after the
errors have ended. I'll make that failure mode more explicit in the
commit message and validate the revised path with fault injection for v3.

Thanks,
Wooseok

Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61922484247
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414413; cv=pass; b=HmdVJ5kFDDSdkpkG1Rs7PGk3la4HsPkm3FeKI2/Ao2Oax2PjgQkOmE0+6QevURJammJT2m02davr0VEk2jRF9ENL/7hfjf5QdqDGLvJkjvt0myDDvSGq+fpdw1ZiDzbNBhGsPYtb8Ht/cCfhc8KWYyLvMsobitSYpiq2Ryd1tV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414413; c=relaxed/simple;
	bh=FNwgn3FhczlTdrGyWzEHio80X7+yKZEdfs8EY7scwzU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ex74S55C69tqj1yqX897DXM2PEOZhxrHylSW7QTzG3MuCIC16NizRo6qNs7Ivl10Upfa20WA8+kS7MU9DQrxt/4MpsK7D1ljU0HUK0TwRmiJJCAibcxqHHy5ivCDCn2qZNt6e57IBpUF7AYjnP5q4LRl7bbVT7k+3NCj+soFyt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaR1nuTi; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaR1nuTi"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cb6dc850c7so428409137.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792414409; cv=none;
        d=google.com; s=arc-20260327;
        b=su5cIyOT3aIcmvWBR/9IgJXdSybUg/QZwenqcEtT5NMXJQJGLCug16pCDA7VzU6tf5
         TG+Sm0am9Eu/tnHRppReAQ7FJXf4AKd0Z7zommwDhAhQcOa+aOVMu08leHdXaG5APEzl
         JMbq4n5umtF4fb9PIr99c8tMclGArZ3AOJHazvmq2Y5ic4w1UitZCBiHCUMbwNJbwSuF
         7BOy47ljJIVtDaukd8DnI82Vx3iESznW/kWB8Wvjv39OMnsBkx+NPXATL9PMtcv/leN0
         40mSyR07O4NZLANsIM1HRuuVPMwnkfJ/30TrR1vibV9PbQ3FJ/aGDqT9e+61yWnZoWuS
         EY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=FNwgn3FhczlTdrGyWzEHio80X7+yKZEdfs8EY7scwzU=;
        fh=Ds6cnv2h0RX+ZULGsaxzxho9ok/r1atM1756HP4RvTA=;
        b=oY27nW71Ns8cWO90juTu/hoLUpwIQtjXyeFQQLRnSl2S1Oio9Gt74VNtwhUk5nRbcf
         2kj7cshBSFTzFMrOS2jOAVNTBsLD6ZBcVQiE3v5nx33u0RYbt6Crs4tc4HbJkG7JQX1A
         O6s8JHAQsslqPc3GTzxR6HEvSjQWjbv6SjGkdZ4riEnfG6QRhLzqgbVIjPFcUbTgxW3M
         advxfQSZXrnJahwLIf0fRVgdPn7MnPLnDyzJh79Keev57rNwA9ne93IM1R6WTsC3e+/C
         hptzpWSXHe+xC4dXsw8NqzwWOvbIUc/Sf/7xQslxMCF3lu2Zty453eL/UAWWGwcq7J2r
         3IvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414409; x=1793019209; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNwgn3FhczlTdrGyWzEHio80X7+yKZEdfs8EY7scwzU=;
        b=qaR1nuTixVyQmk2u80KxUFYI1gpZ8VyZ91daEtMon/CZyBUvM3a1nuimJenFCLAjwa
         5jQyHju8ir3Rcqbel4SfS5LKHrucKT38Ak6jFDSk1Lg7DJqAgRnShmK5u1R2gow1oRlE
         Xj1x1G35/ocveih6KIKNO3+XvhNyvxtzIwSNzq3zj3E66/KXjYnGf5OF+CFEocpp3sRd
         YBCE2ZEkngsKiCBi9VRGaYFX+CzG+JzXALmXmSpokQSBxgJW/7Sv/5XwYa8S/iZBnkbk
         NFngZlhms+Po8190oTHHTt8s0R0ULEGY8ErukFeHJThWE0UGP6xR91TGjCKCEeZx7WhU
         SJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414409; x=1793019209;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNwgn3FhczlTdrGyWzEHio80X7+yKZEdfs8EY7scwzU=;
        b=nSvbOJQQipnVirS9QaFcoKWD19x2nyGnVcml3A5Re4ljgL6iqdoHcCzXNMUrRAQy2R
         GI0UQmNrJk2B/zp9/eR39yx8lHKdHWO7pwG2mRB6lT+SjLMB0yXPYJyWSjeGLkHYreKJ
         aXyNFqYJZKhTtASAd404krmxXWHYaKUG476CH03QTFo+ndVY3WWYrVRecnlQdmvrNdEY
         EWjHisVDhC9LV/Je0Q/CI4/C0Srg29oleJX6wx+N4u/7j2KrFy/+maARcE0WbzCjUBFq
         SndGUBLjaDYjNiXfCZgbmP9C4Nbgy8dtOTLpBh9d5fRc76pAriTh0vaI9Ztmrjf+uj+R
         glGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoqnQcc/U9Ye/60UbQrxFbQ5kT7BbYC5D/OI+zrzpSRdRWE2PH/XADJjLcvRUg3OrsiGROpW6OGYx3AC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKULxcEveUa69AEq8qBQ2AqBRoVKUDvFM+JdyZydByefzSOrt88
	EokH8vAsABl0ok8VKXzAC2Z5y5bcVcZJ8KXLLkm5grefV/u81kOyTbmBMGBu3kWcklLaaHFCCNA
	hXAmiYJBik/kJg3s+m1TgP78pFEHT0iA=
X-Gm-Gg: AYBFou06qy18bJM5JV9TV+weHY+nT4MD06hw9jA9LM8Iq7ClFIV2jpdSngeWDZs0xdf
	j7pt2Il32zXGXxBMS5DzWLfRuyzEF4+wFgP9DBQkZI4yRO5Ay8Lq+0EF2K8t0YqdSiPwOdTt+t2
	d75Bwq0+Ug+60EdZkwuvl6ZiDJ2YuBQ7tyJSugBaNYFlYreKXOeuJMyB5AQ7Um3QlftmasbC4Bf
	qsBiSop3fSdhLllnCwYTUJddvk06b02uOO+SRlH7OSFMjgr3cmJ7P0fw36Tl7IP819DI6KllZ31
	u1hxANMbMPqzyiNJ67F4Na8460dQ2UOP27DoOD4Gd+in3rhobrk=
X-Received: by 2002:a05:6102:f86:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7cc369ac7b5mr1600977137.20.1792414409122; Mon, 19 Oct 2026
 05:53:29 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 07:53:28 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 07:53:28 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <atXvOA40_3qE2HA-@ashevche-desk.local>
References: <20261018-adxl345-period-cache-v2-resend-1@gmail.com> <atXvOA40_3qE2HA-@ashevche-desk.local>
From: Iron Berrington <berringtoni36@gmail.com>
Date: Mon, 19 Oct 2026 07:53:28 -0500
X-Gm-Features: AclHuK8Y7-0ZzVzseArWZiC8I0v3U9VeRhuq6uTpYC42bhbZYLVi-yDkZavvr_A
Message-ID: <CAF2O-sPB3ggqwEA1LXsrA=tCpZGJMdx8KAXLXrW7RcaEk9y1iA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] iio: accel: adxl345: update period cache after
 successful write
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review and the Reviewed-by tag. I'll address the
time-unit constants in a separate cleanup patch, keeping this fix
focused on updating the cache after successful writes.

Best regards,
Wenqiang


On Mon, 19 Oct 2026 13:21:44 +0300, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Sun, Oct 18, 2026 at 09:42:00PM +0800, Wenqiang Zhao via B4 Relay wrote:
>
> > The ADXL345 event-period read path returns st->inact_time_ms. The setters
> > for inactivity, free-fall and the ODR-derived default currently update
> > this cache before writing TIME_INACT or TIME_FF. If the regmap write
> > fails, the sysfs write reports an error but a subsequent read returns
> > the requested period even though it was not programmed.
> >
> > Update the cached period only after the corresponding regmap write
> > succeeds.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Assuming that my comments may lead to a separate cleanup patch later on.
>
> --
> With Best Regards,
> Andy Shevchenko

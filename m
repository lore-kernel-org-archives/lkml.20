Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792779595;
	b=BoZMM0OMMLsrZLH6VIMR9RmHjVNsTfSqpO0fZ8xvuqYnvciY7Gdu/LGi1qOVKjDA3ff8
	 p1lkleAZ+xPAqoPUD2Cv43ykXpU4rcpXd1dNGHoXXYkPIb6jT/y84Oc6XkkV/6ikBGKBK
	 hjKyHrgbJvCCjG7Cbw98BCFyp0W5N+z3uNUEERCdy9UWnYkT6MpjnUL66HCZee8/oZB1S
	 9zvyW2wd31ymMbYIdHY8XRSDKAsRLi1LhyC+7/GR77lxHTl933TQjMgyhIABJn1SNMmBg
	 Inq1E8W2M+/xhf3Mw9EeIGyYTpE0XwHnWgTSvG1QnvOZtPGE1RuX0uSvVk63R2cKecw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
	b=p+fp2Di6PKPxyHCsAsGW0FwoeNxLfQw4jq3hT8MzlW6qKjCC3YMAoigTjahHTWunOrFC
	 3s5ilBJ9qfMqRWqzUod2vr3ASiWzx1EXAQ9WmoLEOfDpU5L+rQLTdLHlAfHgNYjCQcyCL
	 MfDt1mBUTOMEqiFuqFeqRZNHneJV+wh2ggkcupFYyQ1BII6QrjkLAwwe3/cqNRxrXVNwO
	 tq9fzmTS8fMiWtI74WQ7NVQ26rkojww8Apey+vlgJoGrSOtW5QAYYXrUjee0UAaEFV2jk
	 eAApb1Jl9FpEvsU7XBKvFWoKvcMjmP6fQqjYjFWpNqcekJAYj2+LccVLoqrjELJeXAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTVng4+k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2894606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2894606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PTVng4+k
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1111963a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792779593; cv=none;
        d=google.com; s=arc-20260327;
        b=b1sy4HG78/zdANwpG/fWmflh/wv0BjBJ00WndNlcon/YOOLgWy/M51whJhdO3jOaFI
         X8p+fNsj+0ZVmDZ0Yo8m5JXKLVcR1Bds4FbXFVMYjoZGyeWcGfgvKu5fU/EMOc+Crsqq
         JaSNKIH34MkuJyklqHjYuOdgI5K0yCJBCdNxCsvC/Tb3/ZWDV8rI/m5bjfEj/h8GbgPl
         1CNXE+RFndAzXddkmj0/ldqBZohcFYv7wyVyhZJjyeFtLSKbps+vV50pM8aGCDwD3+Gs
         xb53a01FZ9EJSAvlyMVar5x9NMza7oUulWVWQTs9JT15ykhlAp1w91IUQtT5xTjXofli
         ozaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
        fh=A82+z+fxOu+EiN+jr5JzotHewVpxBm+GWl+fhtvTa6g=;
        b=odRy3xk44+STcZn7u0PV9ZAa0VHdjjchU71UsdxeCX7mixhIpAANenJ1OpU6m/qROq
         NrEfcPPg5E9Cyz37NlTKORtemcZ2oEn7g10HTc6unsamvGhF8jGtVuLEpxkHlvdazBST
         tMc/Bmi/XIyccHOpX66avVVUSo3zLo16ndh8lhnOla/XeBNhANZVCW7tKmwZzQdQ5vsN
         V+r8Hh104K2ENh6T463zvLdRR7cipzm8g1uunx12GVL+SZtbrqETMX85X2NY9xSBekgJ
         BuD+jLPPWwMNpAtClScMVNv/w9Hq5hw5KbIhlOGsKMRMdzbpu2RV/kHYh8PkmYAOsF9y
         nZug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792779593; x=1793384393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
        b=PTVng4+kNSaYoXcW9ZVpky8q6wGS/1f+oQ7ufoyFjtG2Wvv6QzpYc9OETVLucX0YLZ
         aINQMccPii23lGhCvpB7Ga/Z2ZGb4DGGs49zFY4sLcTgR8U7oab7Zr6cnQUQYX4tiRPN
         AiZO4ZfMme3RiM0tzElJm3Bud8fqTw0jGC743PLpawmnAd1St4vz6bmHO9/IZnURbz8j
         ao/O/+j+ZGgdYAMr3rMyOWXc7bM/+o+8ieMjEVgPYfs4nMtscFxszBWe5HVOjizdT1eD
         CEZGOxfccNgWXBw5eZ5jmaaax3HVC3Bak5/u0+lG8hrtCRQpTq8eNHqNJT8mNRXlSR+a
         A+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779593; x=1793384393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib/ri5CDuAjwUK4goxK/03XfhwG7mHhhdijFj1BEbio=;
        b=fmTnECKiPtPN1EnXYFC0A7d59RBrBWnD8qIv96G9VxTTVbZV98lOA+K+IxQkUhWil8
         2xOIFAjzDwGW4KceWg4c13Dw4oTlQ4CBCa3BoOyjNIt7WPYqQsDpBQkqRFM81e5+Rsog
         WPwE5GFq16Y2bhlySm+HtYX5Fad8yL/C1UgLd1oiMrm7SBj2AISnAiGu0xWQrzGz+OBy
         Jba5YbxQvVDFIsLOLoOTnP/f55y6Yn97HtRv8oDU1Ay3l9j+WqtTPy0h6zftMpW0Vsvk
         xAuXEO7+RH1DH96ewX2fo+HM5g9vI0JMTzmFiIX9HBos3IdPWCcvl2VQRFACCQETxiLs
         wuIQ==
X-Forwarded-Encrypted: i=1; AKwUvBze0HOJpVUR5gqvEpZuzUrlHqATQatDVt4ec4XhiL9BaXHj/iX+2q9xyXVzT7HKj+furCm5PpBHdhDV4vU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNE055S94Do/U5z5kQGbkYhaPV/nUQq4Q4e+eQaLLKKNSpzzQz
	Zp569WLnnJHFYPK8h8RZA8Fgq4cX0gtSCBo8u8YQmn3GK52g4kJsa95gYfseYdFgTwPpXGZ9xET
	IRfjmJd4RI3a2eaO+JbO7sy5mKiPLplQ=
X-Gm-Gg: AYBFou1+WEh79gq/RcvPy8ApII21GAqZ8TdNgPW7roGSbq2DzS6cAXN2MzSLyGPolJl
	jLhFOB39O31HXwxBO8j9/j99hEmfT/vV4/B/DvXRWY3Phqfs/wL3cQo67/bfYuv2Ligg7WBMXTo
	cRFcmzEouiaq0DkP4UHotJgvBlDoHJV/DNQMzN39O8ISuIvWijv3Tvy3CPaFeW/QHEYFR4Fs273
	A50SfhAH53/nxeANgv+nKA2BWVkxR5QTwpOfTjqWdy2vWpMzJxmYY+kldIbnC1Imzco01zKOUed
	K/hVBYLBmhDOW0SPrqdXQUyUA8JpP3Ty2xqawt4KtVlhdszb/Tm1RplnyN3dzCF9ATO33YySpG9
	ZzZC2Soa8vF5g1g4YoLP+NgNCYvEvRHN74fqgbTLhhfbct3Au9SSnNkUuAlHBmir2UqCDvrf9P5
	AvtUaJURrlImELraYju1H9J9lVQC5V+U40xSs3S6+FnBdDQsbFQylmcrfuQ4o/ZddcuyiySYhou
	ERNNFvjOPHKRlQs3ICC3S1mijWD3DhEJ9Py8StVJyhbLUBBgQ6gJ55X7NUh9tq6OrvS+ig=
X-Received: by 2002:a05:6402:1ed0:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b442a82876mr18979a12.3.1792779593007; Fri, 23 Oct 2026
 11:19:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022022343.1409432-1-rosenp@gmail.com> <87o6ckqvsr.fsf@toke.dk>
In-Reply-To: <87o6ckqvsr.fsf@toke.dk>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 23 Oct 2026 11:19:41 -0700
X-Gm-Features: AclHuK9hNtjapAGTuPaNp1z8hxnwNiaSclFMvsF-Bmo9RDpb45Bd-X4aERvn6hw
Message-ID: <CAKxU2N9m58fCS1L7SQd_yzxcJV0NNyYHcj=jt_BVkrcc5rSOGA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath9k: release the LED GPIO after ath9k_stop()
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
	Kalle Valo <kvalo@qca.qualcomm.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 8:30=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@toke.dk> wrote:
>
> Rosen Penev <rosenp@gmail.com> writes:
>
> > ath9k_deinit_device() frees the LED pin in ath_deinit_leds() before it
> > unregisters the hw. ath9k_stop() then switches the LED pin back to an
> > input with ath9k_hw_gpio_request_in(). For a SoC GPIO outside of the
> > WMAC, ath9k_hw_gpio_request() takes a new descriptor through
> > gpiod_get_index() at that point, and nothing releases it again. The
> > next probe fails with "request GPIO12 failed:-16" and every LED update
> > hits the WARN_ON() in ath9k_hw_set_gpio(). That request also runs
> > under sc->sc_pcu_lock, while gpiod_get_index() and
> > gpiod_set_consumer_name() may sleep.
> >
> > Free the LED pin after ieee80211_unregister_hw() instead. This also
> > frees the pin when the LED class device could not be registered,
> > which leaked it before.
>
> Hmm, instead of reworking the deinit code, how about we just drop the
> ath9k_hw_gpio_request_in() call from ath9k_stop()? It's an LED pin, why
> would it ever need to be reset? The commit that introduced that call
> says it was "for consistency", which seems entirely bogus in this case?
Why would it be requested and then not? I imagine on rebind it would
error out in such a case.
>
> -Toke

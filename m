Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B0330652
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789892275; cv=pass; b=hVNLWDHZt0wH8sjL8GaEslHaxEZPPh5Qr8tNljQeaSmGikVvFEOqp5y64gwRukaBIk8YGMXGkghvjAY8o6UEz5SfOpZC55Z4FcBbrheQA30bfDoS62kVW9+WfDJhWF2D0blGldGFuEa3WYgv05kPx9AepZdN81oN8UCpvXB76YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789892275; c=relaxed/simple;
	bh=Smp3Y01uPqMlvO9Jd88cM1aFv7HeN5iVUIh4V9cwYIU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmK7FpCchTqY3lyoAKzu79lPLD4pS+VaRAosuQQzD5xXeiF+qHYysRUfcBpNZGT5MTSoWuA8fEm5z2zTOhRniaTOReQo27In4CYGCwXhZqFi4iOhKvpTpWNPhGLocjuOTjEDiVLQ463Cucn5mQgBeJDLYC+ZW+TF9qNGHTz4i0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=M2BAIQkC; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="M2BAIQkC"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso3584260e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789892270; cv=none;
        d=google.com; s=arc-20260327;
        b=K+wuchcJUlW9AgLs/ZeI/nDTmPJQPWVzvKqIkgZYbpWhgHH9XUGTom5SHFX0iFgacD
         kIIPnrM4fLjrwsnmovFEZRG4queghVO2WsIA1/WXwAS1QXG5jUiMMeHbSUn7C1Jgotqe
         2XoYTsi9ib4ZylVGWd1WNGyiACAbfTHRDeYEjHKc/YisEfucygOueeIK8Q6sGMYA0FnQ
         eHpirQJ8B8/Qbm5P75sL+9R8f0Ezv93kn/aiCzX1HBdPsUxeUnPbjVLwjug6UDihVVvt
         bK9psCqAbYjP1TqHrYP4lBdgSa9r2K2r6Fe8AhtZ83h2rxekmhVxi66WitRpQSHpcw4N
         O9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Smp3Y01uPqMlvO9Jd88cM1aFv7HeN5iVUIh4V9cwYIU=;
        fh=Ko6Z3XmLtMYbexvbcbVek/kJSZlbUpGKUNosmf8ZW3M=;
        b=p8OgjS/cIMgUNuSju9X5k31rtiDW628y7t+imPiPVdeg6v2dGzf1erWXIk8VciolN5
         WgkifJRQ166NaQ63hzEVnKuwR6+g89ayKDU8w20Hktg2jGtWg76OL/Wi3HB2koL+pOwk
         xh8tmwjGtPyRrscN735H1Gfo8k4V3NPT8cj8KM52FNnP4tmA7pBp4vJSFgkCCKzNaL+U
         Q0+XHDxMmeYeRXJUV/wrjPWHQ79ZFvFHGN4nS7wtJiCZhmRQxbKgLpsadm6ePpRsGOuG
         RnwLDhBV0Q/PE6KX33+3xK4WtzQ1U9YVFgaBL3YxbbsxXd/PmGrhRtCarKnold31YtGP
         uLxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789892270; x=1790497070; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Smp3Y01uPqMlvO9Jd88cM1aFv7HeN5iVUIh4V9cwYIU=;
        b=M2BAIQkCWEDQ/EjlkvUlfjRbqd8U80cDcx20dW5zi5NlqUBPGT/2LY92/e75ePPq9Z
         SH9wejv7CXrE95t+pBwRJrwsuLO4NsAa0XwfZvu5ltabPEGn/WT+GPvDTwL76zcq5xUD
         laEHse5jdlyV5jD2yvcc0uOjYiV21cRaHiw54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892270; x=1790497070;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Smp3Y01uPqMlvO9Jd88cM1aFv7HeN5iVUIh4V9cwYIU=;
        b=haqMrc5Sne5s5S6ayWYabjJUp1KoyfPN/Xjf183I164n9kgnLB3P+VoBkByTxHeV2K
         DR5VV6frz9dP8n3gNjsmQXqqrsehuCoOosz0mgw/RXp1XkXpL6s7VRN6EimX0ce9h5XT
         x2Srhi3G7dqF1qup0/fpz/O1iqyLqkOM01ue+5nfG+t0bh1dV/eS1H7nBDgFLxXsKLgd
         0sDxAONcYFznnj4vdhCrarB5TezlXWSTewCXcAq2qq+BqKVvlBru83QGNklMNKDcnmW2
         01JJSXmOYH/0xg/n/PuV371BDjmVqQ8bDwv5+E02oKJbvfAtWuQ75WLRZ0qicD7C2GXz
         d06g==
X-Forwarded-Encrypted: i=1; AKwUvBzatHkHhB8hFpex2fhH/89+YIgA55eU+0YBVupThxUIGHTtSoEwQUgY2RifzJNVY3vVLkDA5eNwoifTTEE=@vger.kernel.org
X-Gm-Message-State: AFuF++kkvHvomTyzCCg36gnX7gOeGBi3fxqhv7+zgZ9o9WAPNidJuaA9
	hLPfbVsaIrBcm346UU/vujalLygpZU3GlI5iN5uiH63OtHmglvbKidU8j8J/2GV670cNL2i8ksq
	f/yDChatvTRoiL/Hwjbsev4CvjfLsXyj0njBhln1OiZJdCn4S+sgXCfA=
X-Gm-Gg: AYBFou1Tgd5l8mPlb1IDnDfl5eDOLmUYukakexihabYnxmNJItqkou8g2ej8myUTN4x
	um7owVNl9vcRCbYnHzhst5VrDJRx70rrMkObj4bZzAL3o7qg9iM1DzYTPCbKXclci02kf10KOKG
	1pFNOlmPqQcuSBH2P1l7Crntdm0yHklWtaBe31mu8tQSKJ5fC1l6XQrYjwWS6o874KRVLTij4FV
	9LYiF1zAB7u8ERsRhZ9Dj+pvWLEeujG0n1me2Uzvukfi+sbbs8tPQBUi0ofGbVVvbq7fGNys6Cf
	p9f7Whua49lYBferoGgU6me7P6QPY9jyM4v+wIfiEAwL/yzSOrg=
X-Received: by 2002:a05:6512:1389:b0:5b8:99b1:4875 with SMTP id
 2adb3069b0e04-5b8c181ac80mr2299933e87.28.1789892269766; Sun, 20 Sep 2026
 01:17:49 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 20 Sep 2026 01:17:49 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 20 Sep 2026 01:17:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sun, 20 Sep 2026 03:16:58 -0500
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <5a81fb985ac2481288d1be7f53c630c0@realtek.com>
References: <20260920-codex-rtl-rx-v3-submit-v3-0-883d11351963@khu.ac.kr>
 <20260920-codex-rtl-rx-v3-submit-v3-2-883d11351963@khu.ac.kr> <5a81fb985ac2481288d1be7f53c630c0@realtek.com>
Date: Sun, 20 Sep 2026 01:17:49 -0700
X-Gm-Features: AcwNN1XxQgRkxcO5wwnrBOWswhretMhzRiv2PX4Aa3gkOjaeu8_isEhGAGpFGIA
Message-ID: <CAH1Bc_z7mGdFKXHjT5x_XX8DqsOVOGfjNFG9H1d11rTuzTxDZA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/3] wifi: rtl8xxxu: unwind incomplete receive startup
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

> I have a request in v2 that please make sure all error path can
> properly handled by rtl8xxxu_stop(). Can you confirm and ack me?
> Or I missed?

Yes. More precisely, apart from interrupt URB allocation and submission
failures (this adapter does not use that path, so those two cases were
excluded from hardware testing), I exercised all remaining error exits
from rtl8xxxu_start() on the device.

TX and RX URB allocation failures and fatal RX submission failures were
tested at the first, middle and last positions. The same tests were run
both after a successful activation and on the first start after a
fresh probe.

In each case, start returned the expected error and rtl8xxxu_stop()
cleaned up the remaining resources and RX work. Reception resumed
normally on the next start.

I will add the blank line, initialize priv at its declaration, and
carry your Reviewed-by into the next version. Thank you.

Thanks,
Kim Wooseok

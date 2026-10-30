Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347080;
	b=qCo8cu+4Nc1yUhKNykYmeMwpL00Oy4IbWHcBUbsTMR79BtkO5sHCyTUh/KDORcRE0dib
	 geVePDz8uGfztLP59z89v8nO9y4G89V5mNZW2BLTHLirQ8bpB98/T9bpSPgp161yTKUpz
	 3tArWWif2zuL/vvN7+pmmf/gnGEIkZnV/9FItaq10ImjdQcyWggDzIEllksb2+iQXZoz2
	 ZJMbc4I8IY/sQe9W2LdoN/lTz6WZ+ujldIughxNZmIqhSobp9Xun1+i2UzwuH0bYjmj9u
	 rhIcm2FI3Y1gc/qvwcUFWFAmxy9mfOH6gc5tXz8hsNk9qUbzNc4jDOlSCLXXZGTuFCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=btT2jCwgt9ggtLpF1TehDKFcYntdtq8xlMgzuzJuKoI=;
	b=G+YXCpZZfUv0Uar0jW8rp/ncnWWsSIRsezxSoT8a2M/v6Ijb1GeUiSX6ZuiBWLwtIO7B
	 R3I2+PYxZf2QImi+47+0oxkA+f2UwRRbTnCx+i0iN1PhX+AnfJbCmS1GgIDHQvOtyx13O
	 +xOwElpaf+MSZharL6m3/Nf8U0mVlC8zTU18bVRKOYad3N+oaSX8F41a7OW3x/obkQYT9
	 BV0+CLVRp+eOKYDmLkPjZbleF6YTvxY+d6Nxs/TbQgZ4bJZDm1y3/oHz9VvQoxEwI2GUq
	 IEq4lvSG0SW/kkbZ9EAiGYXLOK5dXL+Br7zqhUu8ETagW1HfS3Bjqm6jzhK+eJVAjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qYTgNEps;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E516606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E516606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qYTgNEps
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so3269775e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347078; x=1793951878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btT2jCwgt9ggtLpF1TehDKFcYntdtq8xlMgzuzJuKoI=;
        b=qYTgNEpsbmLGlZ/LFVGrKXt0ImCVPBw6tQd5FClNm+gXLKD44URRo2hdr4rDI6uyNh
         uZ+sBVhpFezlNlB2TIRQLdjeVzA5Xw9fx8/WnbZEo5JhHyjKE5QZK3zKeH6nbywIcH3f
         nvtL1oou5Kfg5w1bLrtJPM7X67FRA/cTDmGJ43H85KKYYE/Vt3pZjWmVa6lgCU55DVVa
         VKVuQaOl5fuT2zdt1H9DZJpMZGUYjs0lzxQAgyYeIuauPMDgBmp11T92moteSBtRbGaO
         Z0yTzCjJx+igcGXqVIVM4KiBf/d3j9xCvRdTss6orQZ23DBp6+blcwGvwTukHCvbVujk
         sLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347078; x=1793951878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=btT2jCwgt9ggtLpF1TehDKFcYntdtq8xlMgzuzJuKoI=;
        b=mmtirJCaXl+WPBqJUKTHIel1UvE2GUoa+KyHTMRe4z8KQgo6gf0mMy8VpwW7k7tF23
         wr7FWN8nh5BrxLhpOqI2LFxF7wBWzVimpfMynfyV4dQ744wX9pS9KhmzwHR1kEKqG1a6
         vNwcKqMv3SwFiS7VQ0P4zhpDBuT0Lfg+vmTt9XNKAyZ84BOTtDhUO6dopWWCNsd8rYEu
         7e03SHkdULabCok5tYYDFdfJ8VJJ1TWWzIE97w4wgzBYtimk2W3YeccV3xNQHQ6azDat
         flWIi1iaAz6cxPSVMSAaxInGQWliZDetDci0qlZBbX0jiIHOfVLDdeWs9TKk2fERZq4U
         wE3A==
X-Forwarded-Encrypted: i=1; AKwUvBzb/zMm+qjCXsKK4l216h+ec9oodPXzV5UxRH+VTgeE5RO7QirH4+gECqHhwsWZiTmVgoj92//99VYeyl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYId/OjqAPH54CXMKj8NHdXtBiEyP+kK9wWdGJKP0bMPb2IPUbTn
	Cg1FbDIjbbnIhExWBYW+xAhFAcAwKi6K7OUNPZUKNjLJfugJ8cGVHGMRj05kWVmHEg==
X-Gm-Gg: AYBFou3WQiaY/Rs/TxSvlcvDrWTmSPhOvlanzoKpPn0ehaji+MT4cNjtYekiGc0LaEv
	4SHvhTB+1we+BiRdwz4ybr/WNRJHfQq1aMEpYjbU6CGB/q2rXOaBxckVsJEHapSTyBslmeIO7YY
	SbEGevVcnbJ8PxVHSsCVg9uC6m3g83s2G/EhorgXIcS0hne6zVlnQXQ2+CCls6RLMuY6PXsynet
	TEQOEmqifHmFowgT9yvMYw5uByHFWuK29MVGYaZC52P/320dGjwUOT2a0HUMBMyUpFvtsNdNDLS
	qiBoIt797hcmz/kHdZ28+65f3YJvGAcjhvGLbYOlcYrEdGAPQYJyd5OanZqw5p5Z/ggbxw+sXyO
	RQokgnvTEUg2c7MljwHAd4LR7eSpYFQT4ByzzW6G3STH86FT13YJZmfvfiejFdH3PRxs+9JiIhP
	9Uy748R6En6Bf/KcM2Tb7bOxnQ3fuyP9+JWYaYNVxaxBbzclFNGK3usq8imcY4EevX1PIEUJwjN
	ukBBR6JYkscuib4AsQ3k4p1oSauFplFufRY5WnZAtBUhcvC9gV1DV5L30eulOf53HDLEoT4s3e7
	Dgd25l4xLXmJ14U1wRnvhd9ubyYKV40wsjZt0gc/P1nTtAMrPICi0IDs9d/x/PzhGILg2Aoyum2
	P
X-Received: by 2002:a05:600c:4e08:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4ac17287d04mr32293475e9.9.1793347078577;
        Fri, 30 Oct 2026 00:57:58 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm118250725e9.8.2026.10.30.00.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:57:57 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: FUJITA Tomonori <tomo@flapping.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
Date: Fri, 30 Oct 2026 07:57:50 +0000
Message-ID: <20261030075750.356854-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87h5jzx5gj.fsf@t14s.mail-host-address-is-not-set>
References: 
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

On Tue, 8 Sep 2026, Andreas Hindborg wrote:
> We should represent points in time and duration of time with a single
> set of types.

On Tue, 8 Sep 2026, FUJITA Tomonori wrote:
> I could not find a user of this in the posted series, including the
> drm/vino v3 one, which looks like it uses `Instant<Monotonic>`
> everywhere.  Where can I see the code that calls this, and what does
> it do with the value?

Sorry, the user wasn't in anything I'd posted when you asked.  It's in
the drm/vino series that sits on top of this one, 7/14 in the new
posting, which I haven't sent yet

The dock has a real-time clock and the DisplayLink driver sets it during
session bring-up.  The message carries the calendar date and time in
broken-down form, so the code takes the seconds, adds a UTC offset that
comes from a module parameter, and works out year, month, day, hour,
minute, second, weekday and day of year.  That's the only use, it's read
once per bring-up and nothing is compared against it

So it's the case you described, Tomonori: the format is fixed outside
the kernel, by the dock's firmware, and what the caller wants is an i64
of seconds since the epoch.  It never gets subtracted from anything, so a
seconds based Instant would only be there to be converted straight back

I don't have a strong view on Instant<Seconds> versus the plain function.
If you two settle on the Instant, I'll respin on it, but I'd rather not
block the rest of rust-core on that, and the function is small enough to
change when the types land

Mike

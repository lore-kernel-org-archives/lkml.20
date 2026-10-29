Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.193
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793260392;
	b=Aq6Y1kmqV8JXsGwtGhtJcvgI84n0jKt+eGJc1G9VdGzFviJO08EV30MS1CVFrx2wqOUo
	 xRoMXTcGi6ap0F17uhnU2LxCY6EM99kIl+Lf88P6+56v3dwxHwVpCZkM6be/4Xi9J0La5
	 tuX+hrlhshB9SKjaibCz82gKsebgSHB95wSjELLbvUzzaLCuSoVbr03zoghkidQ+9XxGd
	 VWoSklUR+cKr30RCMDWSQimnKBtWIp7zBojfb04EyGqANjoolH0oPkvuGPQu0GX/08q7u
	 zcWKXXFy77cdJZTx0gpAdtBSfPr8+ghsyA9yTsdkkUnzypznvjGJhFotwjPtQaPWcnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kUc17Gyf3nvifNnB1KWpHD2qqumkD79iYmF/XwTcUzk=;
	b=YgtCBNHrCpEX9nhPS3mIRxZ79jJNI9UVsSCgJRjYkqs2jNcjyQlzupF+4DcfRhJhYMnm
	 EZeDveeYugZ/cJottomK60KIl+9C1D8HUjCw+Pu+yIgjQUBCTqf4MOQ5siuB7gsY4Tk3o
	 RdgBp0N32igM6voGp4uk4x0nMPspyy+Z79X8HqMyAQADkU/3tf+kzB/gZJEHdT69tSRZW
	 7wfEVM8VvnYnTxgmUg2ZRJz0q+BJaFjK/t08SfgvK8BDGIMgFxDVi/+s8ZUBfZ2wGpl/w
	 W6Ko3uK/yaKXQx+toU68muHE7JrWsadpC5F0yVRkSGpRZbaTj1ufVM5QRSqUWWmz05w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mml8OJiu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.193
Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mml8OJiu
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-539d2baa897so904925b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793260390; cv=none;
        d=google.com; s=arc-20260327;
        b=eZxe7jDcJhld/ehJRvcmBBFiBN8hLuj+OW8LPleGI7uobbqF6J5yKe+Vh7b/WKrMiO
         L2Ecy7ojjhNe8C0573xeyTeeBv1oPcWxvRQOVK009iEuegFBGR2XvQh3UyDHoDY3yM1n
         Ud0DTZhjmwfd7T6OkfKO5JvHl7TRf2ORHPVYY7V48DU93tJnnGy0XVLNyiXdcA2PSauv
         X/de+ASBU35Vgw/41Mjx58lSgcj/CKs9pN8snC9YL0FyckWKIGbzpd5q1LMJH8Y+cPHR
         J6GrotowoaMkVVsMSgXdHNaL2dW0bi6ikjyLKoSgpmX2fhvZHHEUDHIwAdQ1fFYpLcjn
         dzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kUc17Gyf3nvifNnB1KWpHD2qqumkD79iYmF/XwTcUzk=;
        fh=R0RyYsOztBVy/54xk70Q31DwxbpQD5ho4OMNTMxW2dk=;
        b=lZCilInokW2bVOAyJhnw0LcMk96ixgRYKuufhTd6fnz2lOQopBRmbGPwcw1OokNktA
         YjoluoJpNHLA5V7l8Rd3mOs3lwchWvnqZ+0cigsrs/I+eBcJ275lJufCPSM/vQWzFVFt
         AVTUA2It+VIezw5yKcrk3RkYxCrJDkB5exVxVxMj/Gbjgj+2xCsbWw104DBYhee5IraC
         cvaipyXyuiuFPSfJPeYg/6QU8o4ch0h8PvC+04Ep64Vv7vm3LbyrdbOn3lMZ+pSbfx4T
         up1VWyy9nmGlIoB2Ky1KFUYfenTNHeEAA+vFmMbGjZtIE0E5yrEyDA41XM+y56Koorpl
         DNhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260390; x=1793865190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUc17Gyf3nvifNnB1KWpHD2qqumkD79iYmF/XwTcUzk=;
        b=mml8OJiuTmVOXInxSBsTu3NToV8noLYGsPtTfZHP0vaDh3gz0bd0TFs81P27gH5O9O
         QPB9BaBvPWExsZEkTvysVmwlbl/tXiLLSGtxJN2k1BslC5QwcNLCet8P0Ttbf2K9R59w
         JC446ZKD0o3BMscpP4MZmJ3R6K+tm2viSMEAIAJLw849Xrb8ORrQ8ssI21h0Ol7vdk1a
         B3OEZQWBLtf/0ej8asKTmp84TaesJWhbzflfjs+Osf3Bio+PaLab/9/IFBnLIb8dM79V
         4lMG7iuxM4+Wb4iLujg5jy0MRqhQDMKu/joYpQ5/cW71Ks0i/JWsz0injqpUWxfFXllI
         +OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260390; x=1793865190;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kUc17Gyf3nvifNnB1KWpHD2qqumkD79iYmF/XwTcUzk=;
        b=M4pXGM2tVqHVMuadwoU7JGFjH0sxliMaJfVLkhlyo9Ka2b0wqVNKIYHdBHXhvBO+A7
         rW9lfRmYO1DJIWJ2xs8u/J8Q/6ONL1CN9c6zEl8sXcHrIwgfY7kj1ujSvNqlU0jX7UnT
         mIDbBGVlSqE4hg3tqnH3hRYsj/cKcThA8XMRixesLErMnU9BgaaBX6l8wncKehfLZk7W
         d2RNZxYjjtAQeHocJQe0WUMfptQOfDfXAVVhMevwbvC6GTA8CMLJ5ii/yd92IJ9w9B/J
         5G1ebGiIPVm5pdWjms2viY/oeCRF1GT8Iw4FBuZ3hYzIIWL8o93WWGyiwVPbfzrSrKJb
         4t9w==
X-Forwarded-Encrypted: i=1; AKwUvBzrgxv4nq4Jh9rZjjve2cQlOcx2ZqLssNys86vasN7Jy75OxY8hFMajm8bS+ec8Wdg/byGbzi6aOUmdkmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+af7Xl6gZ0XlTzrNVEbfDQkppMDxGB0fXwRr2h8QhWSZNNgyj
	70rBCo/QF8kJV9IMx3l6+F9ryZmYwvjOQbAb/spGT6wFBdHz/vQwXjYYrignYx1J6i2c6YrQ3Aj
	alKrqS2eFyzkq+hSrH3q6RsP8VI6YgiQ=
X-Gm-Gg: AYBFou18tS03aT7AaROkkwpNBcKw4t4KvBPHMD+RiFLCSsEHMlE1yWaHYAB2RpHw0m3
	JK6LyL015bYYLNCUTxonQXxrB3pJp4PKu508rYP4/NLlXox0hrTP/CWSLtJrB6WNf2SJitBg71G
	h4EqmH7jyM8+BeM/kBIX8QOwejQw8uc/fPYU+Y/fi8b1mWpPkgAamUdDlbrwh+D12RuIAm7LlhW
	C15UCDhQAzBl3/q/TFAuEf0FWD8eAuZex8rytrRtPkPgpkeTAdFboSypHANWbIoK7R+HSja40RV
	SlZazJ0Y4ewDEEab1Y7NFoxXZiZM5kzttrFFUM1zNntrQvUFiyWGF5s9jEKWGJ6BZKioGeKrk6b
	CPoVJlTpTh3j2HK60bENqZs+FgVOfqVRd1qpQTebL51nbK22iyhfDl+Jt9JgWa1K3hlkNSUM=
X-Received: by 2002:a05:6808:23c2:b0:4fc:3dc7:66af with SMTP id
 5614622812f47-56383482f5amr2991341b6e.10.1793260390312; Thu, 29 Oct 2026
 00:53:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029002052.54117-1-dennylin0707@gmail.com>
 <2026102957-suitable-gesture-be83@gregkh> <CAGEkeHft5gqu1Kq0saC1O0hg+ZE9AEO1tOgeXmd-g10uk2obgQ@mail.gmail.com>
 <2026102930-underwire-manmade-8083@gregkh>
In-Reply-To: <2026102930-underwire-manmade-8083@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 29 Oct 2026 00:52:59 -0700
X-Gm-Features: AclHuK8eIF8y_uq-0haaIwCtaPGzrYPOasOKqF8SErkDCEeB0RjNpkjMoQKSoxE
Message-ID: <CAGEkeHfTRiRmb-SpLUZeBkUrmRmq-bHLhD=CWnqsrvpbnymuYQ@mail.gmail.com>
Subject: Re: [PATCH] tty: n_tty: convert the full VTIME interval to jiffies
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Ok, and has it ever reported problems with this rounding error?  This is
> very old code, changing it needs to be done only if an issue is actually
> noticed as it might be relied on, right?

I don't have a report from users of those systems. I found this by
inspection and reproduced the early timeout using PTYs under QEMU.

For comparison, FreeBSD's original VMIN/VTIME code keeps the timeout
in microseconds and rounds the remaining interval up when
converting to ticks:
https://github.com/freebsd/freebsd-src/commit/d32198f15b39a0f6dc29229ba4925d67d136956e

I understand that this doesn't rule out applications depending on the
existing Linux timing. Would you consider the conversion correction
worthwhile on that basis?

Thanks,
Hungyu

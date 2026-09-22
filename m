Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C254CF54
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085948; cv=pass; b=DFZ3DA7Ws2zQNz8YaIASw+iZQdT/9rRI7LGJYKKe4WF5q1aKMYVL+1bfuIOvFgPuLxlg10TnM77S4a0XZ17L3/PNIGdN54n2UrWeB8oPliU7GeXoyLD5e2dacS2UVuOdF9TZYesQqzDMdYX35hpV1AigIS61Bbxob+xvqtYZM6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085948; c=relaxed/simple;
	bh=4H7cYh/XcFy79IKh5ntWbkLJLoAWIpLRyRLXVAEP+zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+aNJ4C3Cf7I/vFDwKTKmWwZqnvK97rYyWPACqsxyLP63UU6MXu/81hru+iSIgZ12QXvQkx1Xnfh0ZONTM2qh/0cU+75kDJHAKvANqwGOgthLfkK750GMaM0H8AB8vETwnlcd5WntXkD83cktP4K4SptIQ1Lspl0k189etaq2mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OaZw4Jlp; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OaZw4Jlp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so2513819f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085945; cv=none;
        d=google.com; s=arc-20260327;
        b=sjF1I7lT7iu6HwCpZ2n5LIW4BqOrYwYk3QhrDt3HXEPuDj4A9DwK2c9cEgKordj/ZL
         n5bEop6SUIatcUd2rM+rrjfuHdtB4ytMha9pAVa9MpITCOJMeIDd3gkj4wZ+RLBmonsa
         WBcNc8PHI0RkjM+H2sMtGlGzIn34ScYZsKvSiaB0VI3HaSRion6fLP4lNehwhg9FzW6e
         4ERv5rVaeitNva0HGCW+09ydZ6roadUBS5Ehc6IYZe5KchBhGKlvcqKnUliH1HuAUzyr
         254t6q14g4dgb60v09eqd8wBATR37EQC/k/SbeX90G/15cwhERfZWr5ENGsaBQvarR91
         YRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LV8hwkL+g4D+YUVw11Whf1ua4hVH+TJu4M6R33VpXN0=;
        fh=n2sMR5cDRGO64nzM5tlEjgEu+yKM9HDwOe5iioaenIo=;
        b=o9BJI+cF1aaqSDi1Z5ysteTAArBmL6ak6mhTs+HuM3stl6DovHyEfW9KFmxBmLjr3N
         UjhZVKCyGzgw7lMzTL5FUM1e0rhtu6uDo81CW6V4rP/0rP/ms0+pSdleQJGFemozZ2gq
         nMt6h8a5kEsvWVc7xVXSRD4SIUzRKOz6t7+wRBNZDP3BiEzc5PCVMjLIwy//Vy41jqS7
         gTFit/Rpg18+RQB/HhZxsfPTCKKA6GMmNj6oqD57jXn1/Y2evsVDvSR0Upip62/PQT8M
         pNQSJm6rl6wo88O9Hxsm2efgbMvQzY3vvw5XB88tA1h8/Ey5E2QfO8ske3fB8/3raFCM
         MdSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790085945; x=1790690745; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LV8hwkL+g4D+YUVw11Whf1ua4hVH+TJu4M6R33VpXN0=;
        b=OaZw4JlpEJnPotAAApkw/LFOiwvi3X6tj5Xr6yfn43f8A4HJunL2BYhfAn/tznUyVN
         qjajcgIof+vAF77Nlhhn7LGc8XluAKPY9Yugz6Saty9rYpmP2sMv0tARCSpOk7VNloUX
         pg6RkXpf1TMnVHEw2B1zF43vBSyFXnJTkQ80F6dOKOiEAGWiHSkNIcJ7rQ3Ikjox+m3j
         IWk3KcV3HzS5aK8rZVaUHv+4hEfKXf49VAYL0MLmlhtyUpDhuaGK2eEgUidZx8GkSY0o
         6dUI/uQ/eDY1C2+J4jWSCEsIm4YwmSej4UX+8SNIix6XGo6yUUSuhmH5ang8rK0XG26q
         sY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085945; x=1790690745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LV8hwkL+g4D+YUVw11Whf1ua4hVH+TJu4M6R33VpXN0=;
        b=NyTCTTE8zhCXkgCdqwzPplFYG+7NwGMqm8FqrXPzlUZ0Elvloud3VZ8a+djrFK3kFB
         R0nVxHYL4QSebOcf/FJOdtohWHXGcg5iYzWoOEIUlXDwXF6jmi1N9gRiKpni/+caRWRw
         bEpMUv3tHpEnab1TWw3hRMmxiBtNEhgKZZ1uO8yOQIJjdXOdu4PjCSFHlIUcpZxrKZMZ
         crfrOrSxI92PwHFG7ak3J0KJRQU3ntR+hQih0GAPqhWmieghJtYEyxKAEogEqFVLoI5Q
         0+YPCqkBgq0V7R4jIKggbQckrKey/Y/QNnUf8CPtBPnizbMyo7NVacRrDdjmh46rbxGu
         2lhw==
X-Forwarded-Encrypted: i=1; AKwUvBzXxxz6rUww47XKlSt7deEb7K91Kb0U7Re8MWd2OZgwqexVrgV61V1ez2KwN7hFytIRJRVFyrmo05wJDuc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqQV1994fclnLrJVL9ZFxlH1mxE4A/NAmShZSRRj6zsheIIrRG
	iauQ/KAtR75pZwJs95SzGXvUl9rXEoACHF7uv9Oyx+9qmR0rkvujlpfwUhQnplV/RqT6Z6w902k
	XTkBKcDCL/UcN9Tj4X3XbaflJZjw/4PmYf4tonAdGhw==
X-Gm-Gg: AYBFou1gIMBBBAaZ27rkVWRj3yQzmM8oUiKOURbq1VQiz7JZtNiVkEjrVsS26muX3F+
	w8Ni5q0ehyIJp7U/LrnmCt+PZOFzwKa+zG9C9JSi8wizyGVywSfUrvqsWkUoKf17RpTHiFll+99
	s9hBhnWiL9SSBhIWJ7fV91J3enP6z8zLBX8+LALvs1PiC+nnw08WoR0prd/FXLjGwXDHk0K6Mcy
	Hj8ysuyfdS6b/xI7361GYGH8YrIg3S1Jz/bom136GaqidEQH2y+y6Ti2PEO6j0kt3VJ6PU8GrkC
	FjNhK6k2uiXM8FSSrxX6V8oughCmJe0zT3+oR2tQmvhkuFt0STIuRJkZmpztD3KU5v450g57Zvx
	6N+OH8p0edVmZPoXuYDB5Ml6yw/SjJjQHSRldKwMezIYFkgcjiqhc
X-Received: by 2002:a05:6000:2409:b0:487:342:d147 with SMTP id
 ffacd0b85a97d-4871e363e1cmr24110192f8f.39.1790085944981; Tue, 22 Sep 2026
 07:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-14-neelx@suse.com>
 <20260601234454.GF25574@quark>
In-Reply-To: <20260601234454.GF25574@quark>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 22 Sep 2026 16:05:33 +0200
X-Gm-Features: AclHuK8dl-tYp2fYNBoxko904-iqmC5latOeVGuZqXI84CESlhxypC11MK8aWjs
Message-ID: <CAPjX3FctU6PQ1=2vL5yVPhWRb9konu2P=Oz_W4E-KSu0FmG96g@mail.gmail.com>
Subject: Re: [PATCH v7 13/43] btrfs: adapt readdir for encrypted and nokey names
To: Eric Biggers <ebiggers@kernel.org>
Cc: Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>, 
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 01:44, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, May 13, 2026 at 10:52:47AM +0200, Daniel Vacek wrote:
> > +     /*
> > +      * TODO: This should maybe be using the crypto API, not the fallback,
> > +      * but fscrypt uses the fallback and this is only used in emulation of
> > +      * fscrypt's buffer sha256 method.
> > +      */
>
> You can delete this TODO.  The SHA-256 library functions just do the
> right thing now.

That's great! Thanks.

While at it, there was also a BUG for folios of order > 0. So I
cleaned up the whole function a bit.

--nX

> - Eric

Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6247D475
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864180; cv=none; b=tDveGtZawzYm4FgjHA2Xm17vd2m7pydenj8VBL3AmhvKPIBQPgcb2Fskd/BoNT8bLsDDhMJ3Wk+jhAK6VhLqhccGxSPH0duF1jOcIpjMzQ4dkFJ92qhi9FRyy+bxiLgyq2iXomiaISxldoTSYK23PYPNjTeUtBBDwEwq+9rljH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864180; c=relaxed/simple;
	bh=K59ROpkIYBDGvMlG3UogNnKjJO3ttFZDSX7KOg/oL6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YywybHIfPbxoT203DjKdHnRQFPaw3WXC3OJr/7q3CSV1BQehlW2I4s4AQKVeZrowhYDS0Q4UQF/6H8fY7ZowYky3kMMQFZbyDp33ws85nRbysX314fOPbbw1gQyZOyHjOefzGBKPHrkj/x0DkHHAEqWLu4e4hcEaVlri56BO40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PV1kL8Dm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PV1kL8Dm"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso1158776a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791864179; x=1792468979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9wJ4fczHpBB7QAqi3kAlwydilUU5q2AAkVxgHET/ArQ=;
        b=PV1kL8Dm4iQ7FXxGOYrhAw2IALAfTVZKzcdGlIS4aR/TepWtLx/+EOnM9qgPnmdfdm
         hMoMvMeSY0pbxNvlHMa8eR13OAVb96ZVwmnyACszGK5+VV/40gAgP+5MiGX9AV9hy/uJ
         cGxxQ1PDDbLYEXAzPjBZr00QJVbh+JclOfQD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791864179; x=1792468979;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wJ4fczHpBB7QAqi3kAlwydilUU5q2AAkVxgHET/ArQ=;
        b=2ZvjpTrCGpgZBrpocu4uB1dlddhBzX5PAjOk2fNIF8I8fxFnANqf8SPolpf81kV1Ph
         BZuyLp5wGjKbpfB0B4WkqxcnLVe1xS3xwj/0QpR7ZIssZzwiFEO9qucrieWLFf/37JPH
         QM+PfMB1DiMHY+xtpuAnuyaeFBEGALnX7KsgOjnU5bHAJNtUpsRZUsjnwC+tT4z/VOaf
         VdENe0s8ceZq2/Zt0gh3mf9XF+6g1L1VkqIUlVH4roFcMPy7HfegtIwOERjHQAZhVvjE
         /WHD6iqQHHFLnuTu0jogjI2vhm09rqvmaFncJ9w+Fkm78R/u/Gp+78U+TtgOM7g46PC8
         VECQ==
X-Forwarded-Encrypted: i=1; AKwUvBxguu3un2StQV3sWAq4MmBnxSH2LGmqBKGLICe+YVjFDPUJJQ1MIU4CcVNcFwfd3pLqa4+PBcNoISa16Yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYjMLWfnRBJplWJ7NgvE51loFKIFHKg/QG6YrocB0MF+OvOJx0
	WTGOoAR+7J4j4+7KxcI0XmuMou3s1NHbzXTK87Qzf5/PNPJz0lnnKW2gydyEDzx2qw==
X-Gm-Gg: AYBFou38YUjKa6sPQWpnq9GvLfNYMi5hsXTmrsT3pZ2ZZRYutipuPM/6gnDc55yVeMH
	D4rs04EIwRkbmeIeIhMz0NE37Kw03RTbNev6NfMiSg4Ymia1mv8rd3qTwBvveV4tqN1eg57cFue
	7bQOW+iTF8hXQlxPMybzdQV34A/bmbK/EVYrvYUdDZ4kh5cBUaJ2PzvTo2nFyyV0XQnaGVANlJP
	jS+JXS3jyENO3eXGG655zPk3f037ahvsX+YT6qQMmxhwRbOAkcWwmUdn+iDI3ZVGnfDsXc0EN0P
	eW9KF4Jp3RKzFaS4sNu6DTN1dDfZdBSLr6I4VXoItR/iykVbnbPL6BvNEAEZWYZkLDTBXleWC0E
	FJvc+IpzpmBXvTsO7vmbRM/QtGYhIgZZDrgJAyaJHQ+z7qvH8Csf75nr0ntryrWlMwHUUO/1hFD
	zxdgaRUWaT1j32AlN2Rg6dZvO+Barzhd3YSzNM7sKjUVBYmLod9b0PEFmsR6/3dwFaAWMrqY44M
	f+jSbDzQwbfMKixN+TvCeQQFc6qkhgh7QISiw==
X-Received: by 2002:a17:90b:384c:b0:3a4:e234:111c with SMTP id 98e67ed59e1d1-3ab3a9183bemr9589953a91.66.1791864178821;
        Mon, 12 Oct 2026 21:02:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3371f748sm11618699a91.1.2026.10.12.21.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:02:56 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:02:52 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: senozhatsky@chromium.org, baohua@kernel.org, akpm@linux-foundation.org, 
	bigeasy@linutronix.de, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, minchan@kernel.org, ryncsn@gmail.com, yosry.ahmed@linux.dev, 
	surenb@google.com, suleiman@google.com, zhangdongdong5@xiaomi.com
Subject: Re: [RFC PATCH] zram: avoid preemption with CPU-based compression
 backends
Message-ID: <as2s0JflTS1wUUOl@google.com>
References: <anMPLgbrf7XMC7Qw@google.com>
 <20261012123328.1138059-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012123328.1138059-1-zhangbo56@xiaomi.com>

Hi,

On (26/10/12 20:33), Bo Zhang wrote:
> On (26/08/05 19:25), Sergey Senozhatsky wrote:
> > quick and dirty patch.  Just curious if this improves anything on your
> > side.
> 
> Hi Sergey, Barry,
> 
> I ran an A/B of the three approaches on a real Android device
> (MemTotal ~7.7GB, zram ~8GB). Same workload for all three: cycle 20
> memory-heavy apps through fg/bg to force swap-out/in, 8 rounds (~550s).
> The stream mutex is instrumented with a trylock-based counter; the
> measurement code is identical across all three builds, so the only
> difference is the patch.

Yeah, that patch was too quick and too dirty.  We have significantly
reworked it in [1], specifically patches 9 and 10.

[1] https://lore.kernel.org/linux-kernel/20261013035201.2809924-1-senozhatsky@chromium.org

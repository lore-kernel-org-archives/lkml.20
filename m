Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281485;
	b=Zh5WMe3QYvTkFZUT/53q6rmfZvoi9bcF+vc/lQYVHNZoUSww/F6WT+MbPWdoV/NbJ46o
	 HCKn7WrqqppMNFPh2djiT/nrPsY4bG8e5arvvI4LT5m02J4EWaOlAuV9tDggqnDANzB5I
	 5G6S+PpuwLvGiiEv7woZMuEDPMn8GZSYfd0Yj3Vru/qPL6Yuda0a0C6IHggnK3E0nPhoV
	 U0EqWNceHPkbaoJUbk6Eg0v25XxAsvQCSe7aaTwJGkPIJ+72erX2WOXHqXWgJlY+PVffW
	 b1101Lj80ftpIKDuE1Qo75BZKEO8KNkd18KLh6TqaSfSwFbPgla8PrWAtgGSzks8CSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=r9Yjn03pj845I6dvouQuyeLdqWNVyS+hRwAp++oHECs=;
	b=sRcdcO/KgyOuTh3fOAfI0CtF0dnry9ZNtu8Bp50fKHRn0u/4z5CsP7jjjtVOvvcnCS9/
	 FPf0ViXHWzlQZx5MSDFRbjGsxhF8tCgxsjNHejBU6D521vkxXCfwO41cVjuvh4RlKTde4
	 G6YpDmgAIkaEDJIU8HuAHANvDtm/62bhrpmGNAPQShUI8OZDOMqCoRBFHwmrOSn2zUh5f
	 3dSHcaiTq500Sbu+DzVL7JEjNziqzrdm3BXhfMs7VzlEq0HBjDv2/SI27IAqQbzukxxsn
	 roCJWKNMbwReQBD9oE7vQYntglXX1jMdbXpkGL1wKfvCD4z5efjQcHwUM3X3PNEq7WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t1jGd2wP;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DF606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724DF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t1jGd2wP
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a18fc7a38so4296053eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793281483; x=1793886283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9Yjn03pj845I6dvouQuyeLdqWNVyS+hRwAp++oHECs=;
        b=t1jGd2wP7FlHqhzmTXGMAvuTeVcRzBygvgwkK6YYcGJy//C+hGySWO7TU8DaNDK4S8
         l0flg4KDDpWc8i4IhrrKvC4w+jUb14sMNyjEzTOr0DONkCQzbgK9+8BbKYuGiXXD+Aom
         iJzZhvniayMx5de3s22t6ZyFplh3tR5zb+VEVSKx8hd7VlKyuAFiK+05SA5+wOwbH3KR
         8+01y4WGIUcgwBDY+K5Xek0IFb2Ih32teGQ3smyx6oF2EKVhxectETtW9wNRfLuR53Jo
         wUnYUQyU6/kcrUMZYTwYR5LoTFkyk54tbOoCOzlPzm9a/gZmFWawqN2VXML4AFDfUxJp
         JQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281483; x=1793886283;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9Yjn03pj845I6dvouQuyeLdqWNVyS+hRwAp++oHECs=;
        b=I6CuJReTw6y92WlQC7/yNXGpEBuhnLzffg2BMcXJora2ZDRiwFPLjNVz8zv2jQqNog
         fPJPU/Vv/3AOOtJdoFZ3LEvYN9Q/r6ujGA5dDyxdmyfG+bmIsUQBpZefXasOT9u5G75K
         Rcp6SNtZ4I2tngzc0kP1W2KrqL5AymqIDQn+fXX/4B+VmB0fpi4OQxLAa6/Kct7+j+lQ
         1inEL1t9RClDRdSZKf1+F/mFJUe6G24wbEcYYmhCgdwICf523liq2iS1QW36V4a9hogC
         m6IcLXVRCsMKpdnKWMURs3FG0IcKJWVpmw70vXqJXIDvyug66VzymkEBjSfojsxChD1V
         NDpg==
X-Forwarded-Encrypted: i=1; AKwUvBwvGB+9FGeB82izuHBDqr0n2WceCS/sRq5agPmBDvnYV1lG0yl/4Mk2KdsLtjLu8ESrOCAPG7ZWauj+d8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxZR3NjH573sB1+bhoYKCNHtcBoXc/0mVR7wgyRFtqQTnApEec
	NhZl6niPgB4T7KWp3KvlyzkEo4Av4Es4KC3iLJLnXXB0mKMir+6pPSsSQhQT1UWQJi4=
X-Gm-Gg: AYBFou1I0wJCUQME8Bq8rQoyq7ak67mMs/b28kiBod9VBmo/y9ILND2uCDInvYB+DDL
	NzRItvf7ZS2VBxUNfpgmbUoWoxDyTNtwmKQNXaSHahhbb5qfdj0aGSkPZ9LBGJ0vL+fbBpIOZDl
	ZNox9uQB5qSqPL/QGPb679/0m1WSxOeo0nQ+seoJwkKozON4GZ7557cVxSXG1HVDKiVlDfnxhet
	sk1iCQWZb59lHnq0ZG2S8vZVXhT6rwBk6aRJfVFFhiqA9QwaNTK9jJRR7DB64lWi1SudFFeT3wd
	Q1OwMoigfexx3At8l4OjZCB0vpyeZwkdA2bJ/xFnOlt9f4HEdSy4bj3Kju4Y6FHM9sZRaUirWYG
	ScoKro0bHselC1ye6sSdJzV9m+AHaWqp7LG4eMtgzKdL8gWtMtKJMJS0NB0WDpo2CtLWehDnn+W
	EDGJxaNXVkcg2g96D+nh7rLV58hORBbhC1myeWuIhdAeqgTvJcKpb/KVKH+7EC119jvgN/Vomyh
	UowEzkQ7r8ceMtCWTfI/g7BOqt24fFaIarNXSPesT0Ulx12Qalma78Edzsz7jHke/hcoZ1RJC9o
	x0DmExsXQRbngjS2gOj8ZgZiXCO8P0bR1agyO5q1CA3jZXr8hUEuNDjJeO0x6l0x5uvXPSD+h37
	DLt6eLHJ2nEGq
X-Received: by 2002:a05:693c:41d7:10b0:356:b370:a0ee with SMTP id 5a478bee46e88-36a2044d2a0mr7712963eec.20.1793281483283;
        Thu, 29 Oct 2026 06:44:43 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390929asm21976894eec.12.2026.10.29.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:44:41 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: tj@kernel.org, Kunhai Dai <daikunhai@didiglobal.com>
Cc: josef@toxicpanda.com, yukuai@fygo.io, cui.tao@linux.dev, 
 cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org, 
 mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org
In-Reply-To: <20261019125412.3123895-1-daikunhai@didiglobal.com>
References: <20261019125412.3123895-1-daikunhai@didiglobal.com>
Subject: Re: [PATCH v2 0/2] blk-iocost: fix hweight cache publication and
 donation fail-safe
Message-Id: <179328148122.1447413.1375912231299331612.b4-ty@b4>
Date: Thu, 29 Oct 2026 07:44:41 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 19 Oct 2026 08:54:10 -0400, Kunhai Dai wrote:
> This series fixes the blk-iocost hweight cache publication race and adds a
> fail-safe for invalid donation weights.
> 
> Previous version:
>   https://lists.openwall.net/linux-kernel/2026/10/15/1954
> Replies:
>   https://lists.openwall.net/linux-kernel/2026/10/16/1431
>   https://lists.openwall.net/linux-kernel/2026/10/16/2798
> 
> [...]

Applied, thanks!

[1/2] blk-iocost: abort weight transfer on invalid donation weights
      commit: c810ee88cdab27f443c32270dc7c0eaad2cca3f8
[2/2] blk-iocost: publish hweights as one atomic value
      commit: 0150554a3f38e1850d5964102eb89a720c5fe789

Best regards,
-- 
Jens Axboe




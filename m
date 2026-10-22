Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627314;
	b=rCxZprwafbFI6KHq50qe7lYu3tnUTE2bJzp2Lz2LzqdZBmuui31DBx9W+CG22KtR2+Nb
	 xPuVKnFy3ntxACDM6z6gquVjyAkxWhT7rYdaXu4Pf/OpXhC890jqIRLns1Zc5uyj+QFaQ
	 xpJfNOuFUHZHScw2IguI0Uu2u6todH5UbNPRyT9hq18G+sQKAYvVYzjbVfewD1sSKJVys
	 wr4Oz8mTH7AlY4Tpyml6jdoiqr+RI3luAA/lHrbEM00UbUUy724UsAYZeiVBme9EeIqQv
	 GgYf5CnLLQ3SbnvpvZCJsNIiap3Hw4yQ0nBHkeiC1QOogJHc0rX1HTt5XoQUUAo/REg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O094qediP2wRssZ1brE73mgAfR6yZlb+wTlB4/WavvU=;
	b=TAbnGkk01S8PNYsxK0EbziFrfiD3d3sDOJOyLDb86aJllWlLt33+sPVOVhNGCVsjfiiB
	 VQvXNk5vFIQsDlRJ8EGjjC0NJSGzgxVqKJvQex8KjM82ybVFICxpsP8VEuRUemATERd2c
	 GSzB41EMsIZkn8jwGdx2jWRoKsCK7Oj5nhZVjdLpdqYfD5wumNblIiuGTuB43Rz9Kyvn6
	 uzDQgBOG6x50y197VnGKy/y76aIebhgVffsd4cYEx8sK4Tz6Gl5eDU9xhkuqn7OOnPebV
	 hiI5KZ7rP2HCwVKBH8rOzf1Ktv4a48fsNp2/BeNc96wL61mLMdCfnBLcMGSn41wTTWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZhgsrPKU;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491360A5BC9
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0491360A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZhgsrPKU
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso2321483eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627313; x=1793232113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O094qediP2wRssZ1brE73mgAfR6yZlb+wTlB4/WavvU=;
        b=ZhgsrPKU4LMXrrq+6Elpeq2DpLIdDfd/eNM9DRANdago8lMKwnsdDh0mSLtOw+1A+B
         ic3OJYarLxbxRtaozaAXYSLAh2ZnILBpZuCBVWvUoH5hUHeCY+PKP6+auDMbJvtYuHOZ
         IuK87XGlpA3OKuVwA6bLP4v9MpH7QRvqZ0RJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627313; x=1793232113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O094qediP2wRssZ1brE73mgAfR6yZlb+wTlB4/WavvU=;
        b=RVldm5yz879y6wArf+7EbgDNxJAM2XxEBR8BYJ0wqIDTcO8k2Kzr1AFOePyDMYTNo7
         N5iRya1qg9II603Vp0xa1IZz3VscnRWb9aGbEzboyhW5JTGJWQ4WedEilwxijI3t4FkK
         9r+nzTzoj/wG8kR32fkQVOz1XeTguBFF0limcSofqSlJIURY3kEDpcKrKpi9n2Sogz0k
         TZ1/aB8X21yrodHtbPE/BvoV8RqN40x1xiZhXVv2qFQxdDBStJ2FaplHvcfTU99ESP7T
         jiBXGMTWn649TiKfDinaNQttwQtqnBPyWe+pqPSmzVfUJBPXu5OYMcC58aIL1p+QdR3c
         Ohug==
X-Forwarded-Encrypted: i=1; AKwUvBwC6vTXi8QdgU2AdLH65aDxiz2VAv+juue1X+ld5nrMKKvSSPvjxLdI3rpCIpt09mfrX5PpYU4kpttD1HU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbeGZQYJtaw5QmTUyCdc91eRPj8he2zNSvSTFqlCrkajgWx89p
	AVQqv33r+1rszIOu2tlpW8oiUZ6ZYI3QV4oNRaHKinPj0VuzePKcVlcX2e0BcUSg5A==
X-Gm-Gg: AYBFou1V2mm8MFt+VKZWdQi3jZ8D0Zym6KOTgkrdVufQwxmCYadjTJaWboq56dC+/bh
	WyrpC7T3hKrEixV49cekjMecvYuQNKdRE2wWrh3cFj5ht9FIvJk5LLnpZZYECkr4HQ3hzPA3NJN
	OkbRBt5+E1TIRLHjeGIgw5aTjIby6ZA9MSVyOpSe/sIIALxopdCyLcUA5lkLPEUFpoClv0J1U7u
	J+LPihV3AjbWh0+c4/ofJo01gXq48XuRFgZ7PZwknYdgQIMWh56WHna/7deF4rVFttwilqKFKLl
	voqY6xPpiAWQPyx8qYDj11FyZIOBIEmZtL64LQfTg0h5iSIdaV/FVfGuNJM0zn96SeCtsjU3fsW
	FNIBWKme/v6qHpch2Ird8mvkc4j6noOqwH0o67LBfnMqX4KD0yhL1SKKbbk+ooACsoqln3IPJTu
	WKdW5sX6HPqGJaI2nkWDH1Ia6WejMSrbZBZIsC9eaqkqd7Sv14n2OiBpcCysB4k5QHJo5oKNd4R
	ovvq5ycHm+uIeh7a0IJghVtogzdYhZZ+/S2qqUyI9SRlwppADUILuRxRyk89R9bFOQEb600uStW
	jcIypJg6Y15AWPEDKjFt2HIJVRSjm+aM8VTDP5S0
X-Received: by 2002:a05:7301:4005:b0:368:536e:c8b9 with SMTP id 5a478bee46e88-368536eda38mr2638548eec.26.1792627312863;
        Wed, 21 Oct 2026 17:01:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36740cc8c6dsm12073378eec.12.2026.10.21.17.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:01:50 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/13] iio: Discard pm_runtime_put_autosuspend() return
 values
Message-ID: <atlSbgGb0kEEYhao@google.com>
References: <20261006231900.3230373-1-briannorris@chromium.org>
 <20261006161337.3.If2263e6ae9eaa4493881b72922dcde031ce9d81d@changeid>
 <20261018211807.66bfea0d@jic23-hlaptop>
 <ataTYER7XM_MEYKL@google.com>
 <20261021194951.7b65c2eb@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021194951.7b65c2eb@jic23-hlaptop>

On Wed, Oct 21, 2026 at 07:49:51PM +0100, Jonathan Cameron wrote:
> On Mon, 19 Oct 2026 15:02:08 -0700
> Brian Norris <briannorris@chromium.org> wrote:
> > Also, unless you'd prefer otherwise, I plan to wait a bit more to send
> > v2, since the merge window only just opened, and some of this series
> > will just be a RESEND. I'd prefer maximizing the chance that the
> > recipients will actually notice the patches, by submitting outside that
> > window.
> > 
> > (OTOH, the bulk of these changes are in IIO, so I can just make IIO its
> > own series if that helps things along.)
> 
> I'd split out an IIO series but take your time as no particular rush
> given these won't merge until next time around.

OK, I've sent out an IIO-specific v2. I'll resend non-IIO separately
later on.

Brian

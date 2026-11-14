Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794624106;
	b=rU7dDvmMcXKKDRL8QpmwZb9q+tY074tRrSXVUgEn3wImz8mdN/cFSFHm5V6zkTwn1ndg
	 d2iiHtNef0sBz4Ca9Bc2vhNPFHXbW2c3SZ56zdUOt1WqJCY8HuHU2tdRkpUtljkXtlTXa
	 7mpjU85vmBospPUA1Fu4A6nDJ4l3vZFYWDWOQuTpjiG3OcqA7AxB1JiXAyGQyRDBEPgyr
	 lbfbSHh+D1j09AZzuFSR73J/Q8v+bTnddYGj6w+NIaRHfVnoioLFtPVTkE0122I4FtEzo
	 q3aWvYVT0ju5B7KrFt2RfE4d+MtqHfRdrY2rh/CC81CcyNnYeQF6dK4rr3GvmUMKjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BRx4eAMdYV73QvASEjGEoxzHdyiMslK/yjtX9V0T5Tc=;
	b=yqE3oGaJxyAxGRWfIH+A1R56kyEb3NKPZaTCHhGG+5MjaGaLvNcREsdKXQssFHlrdey6
	 rnB7EEksm30sRm/tR/GZoQSocG8Oo2TYr5R1zNhOrGWb7rdGBqjt+uklxEfZnjU+nlZ6k
	 thf9HnD0oh16XgMwcm360bzEl6ubAQAoETFt7i38hrezrK1Dxy4TapYjkD5vK3svCaU1D
	 9gWJQP5AW3eeLLK7RXCp91dxxkeLBX4DkzOcojfv9NcF3A/JI1dRzJe3GtussCp/qRPmz
	 ZwP6b7/FOJcVvAt3CH4+5k4G4YwngwPWxcrOLiZEFAogvA90RCjHl38JXI8Qs9TcNxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Oh/A7P2y";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D384606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D384606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh/A7P2y
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so2449583eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794624105; x=1795228905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRx4eAMdYV73QvASEjGEoxzHdyiMslK/yjtX9V0T5Tc=;
        b=Oh/A7P2y/i7OaeP0elOfugLH6LZVJdGwvDVLLPQTYFkuyjrI4DXSuTCQml9Ay2xisC
         p01/pRceBbJVM+EvcmMhUNVKptbnP9KgK26AntLzuPB6BuW/azxZEzQL0GGB5nK7ZO4B
         Rrx3Z04RzaYdTvWnLNvyHSTZIn9QXUy4Gd3gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624105; x=1795228905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRx4eAMdYV73QvASEjGEoxzHdyiMslK/yjtX9V0T5Tc=;
        b=auyNBoV20iaD9+EY/hXXme2t5Kov/jWd5tThgdb7Ce868L/uVTLpA29Dcj7lK+nJAl
         thJC/cHKMgzuBD5nXQB32T7q+5bDdM7cbbtQ1YKpx+gGQtkJlXbfP22J9ceWuDxof+0c
         4Rfe75whezXotIDFkfqxkYiuG39ZdwQB3RwGBGGfsVpr+HzUh4zKGPqjSgHob/et5xoI
         D5LpHP1x8a39HcKfzvfyTxvVgz4z6Qf18dyNfWrURWnNf527A6crrBbtQy5A3m6WjfGe
         IaQkSbrF+/WgbJ1UaSjM/h2ylgDWsvW0L8ut3H2MVFcRETWkiRhIO48wgePHW3+TPolU
         kj0A==
X-Forwarded-Encrypted: i=1; AL+hErFjDBcGx+LR5y5gpawrMlXSHD3gOh3AVNkYVdgitGF6Z8SIzouRdgT4VO/PZU/wAqOfz8Xcm1MHrWnrcIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mO7WWdOQMgSKCV/HXEoNuk29u5h792NcOpKc/2b66qgnbCmTw
	NW7sNIo1H444P6rqkkcjQCRb8bTcPgv5WnNvsBzijRFKa9b7SqQgimlzloaOEWKETQ==
X-Gm-Gg: AYBFou1oXrHo72NBEJy+3XPxGS2avWULnX2Hk3614ozqAu+zTOeEgWFfCiTtSuEo3EI
	jeTkttuyrEaw+SpuoIj9INVLFqWQtFSfAoDXtGwhOPbax3O2TPk2UTx/gcy9nAsQhHgOb7DgQ9u
	WbVxZdDsxNaZrW9Gn6XmT6liNK4ZXiBp4h5NFkeKQmA+DO4UTSFh4OauAurvtwhhMJkIir3PWMb
	dfp5f30fJBtTGDp1tHu6WejrANH1gGFuIV0zP5IUcMBq1PIFfFgEW2fucACG+Hsgh2bj6FIxCZP
	4fpd7Clv2OK8Ac4lbQVcM3XhcwMA9eHTNICGP4l/jSqBcjlq5X+XE8P0rPxvtSKVWXVE99pKiIa
	vuPoqmII1YH8+T5zjwuGT0+FdDs3foKa24fHTlM7quMQluU7NAxOhQTGUOLvsoqOey1comLwJeT
	5rlBtfwOiJzcu4Jze3lhQjqrBwuLaYKab3ZwStl/Hjr+AqITZzFeuUOorofXXxL8V2MqHI0+l4i
	fBUmqRB69r998KjUkDNb315dzDpwUadz5cjzhhz8a14J2eUcrKU9TelRzacAw9VdxRK3hTWWLLi
	7IfmJicNNGob7D1AyXXjcUQmTQ6K4AeN5jgOW23An/eIRw1P4F78974jfZtE5iMxzu4tzdUP05X
	q3KN15aPyhe3+44g=
X-Received: by 2002:a05:693c:864b:10b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-37960384530mr3982500eec.0.1794624105009;
        Fri, 13 Nov 2026 18:41:45 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d97f:ef68:a8e1:6af5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm10977717eec.16.2026.11.13.18.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:41:44 -0800 (PST)
Date: Sat, 14 Nov 2026 11:41:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, raoxu <raoxu@uniontech.com>, 
	minchan@kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: Avoid duplicate slots in batched writeback
Message-ID: <avfJOxrS2l-f5ZA3@google.com>
References: <F24EF6333964B482+20261110061830.272091-1-raoxu@uniontech.com>
 <avK6Y1VmIYIBrorl@google.com>
 <20261112232621.6e8916a6e92bbb1afeb1e2a3@linux-foundation.org>
 <1707907e-2261-4d3b-87fb-3dfc662e0347@kernel.org>
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
In-Reply-To: <1707907e-2261-4d3b-87fb-3dfc662e0347@kernel.org>

On (26/11/13 10:50), David Hildenbrand (Arm) wrote:
> > I grabbed it.
> > 
> > I did recently attempt to pull zram out of the mm project, by moving it
> > from mm.git's mm-unstable branch and into mm.git's mm-nonmm-unstable
> > branch.  Because "why does the mm project contain a block device
> > driver".
> > 
> > I undid that change after about a week - it didn't work out because
> > zram is joined at the hip with mm/zsmalloc.c.  zsmalloc is also used by
> > mm/zswap.c.
> 
> Are there cleaner ways of isolating both things?
> 
> Like, many drivers use kmalloc() etc, and they are not part of core-mm :)

This dev cycle is a little unusual, because on the zsmalloc side we
removed that "kmalloc()" [1] (along with other exported symbols that
both zram and zswap use), introduced new "kmalloc" API and this
happened atop of a very large and intrusive zram rework [2].

We don't change zsmalloc exported API too often, but it happens,
sometimes.

[1] https://lore.kernel.org/lkml/20261111064707.2568433-1-senozhatsky@chromium.org/
[2] https://lore.kernel.org/linux-kernel/20261025021839.1542805-1-senozhatsky@chromium.org

Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AA623C4F3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908811; cv=none; b=fypZKsFoLssVJZNcDKQ6VyMLwUdz6alisM9FAGUhEIg+fIXl1k5OX1tQAurFAulGGAiAZDjyR+CpNV/wpKlZuTwMgNLgjRXIpDYRSIqDZx6IbdwtjWmoasxlGy5mYexvZJ2/c2yHRPkRaRQJcAVUMQymjuF58e4Pc7Ix2C5btMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908811; c=relaxed/simple;
	bh=EGGw3miVGv3g5cGs3Y5Uv6JSfXmW9UFpDJgLxjdqzMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du/+NEZnG0eae19M2QSbZ0q/SqkdpS6MMD0w/DUNS0dRN/+g1fMS9FtJMCueLsdQgusUmJgRWmwHJt96RP5+0/5mSbOt0u4DpqTsxLAaPQnRd/kAkFs9frzn8RqS8w/auyjPCKJH58ZKvjGigZyFNtBhA+RY57PGMhkhzAyjSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pux+ojDq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pux+ojDq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-854f8068301so540035b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787908807; x=1788513607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dn4vRPgsu9ZH/AxJw/yAM2v9xHesMIpX1FxiYpcxLmU=;
        b=Pux+ojDqr4IkTYpL/QaDQYtR8zxovJJRNG43i0Cv03tV+hOm8SMKWWvNJoAdTDYaF4
         MpnrXyWNSuTkL6KL14753V55TdQm0aQsXuiIZE76CUNbGKXrXyKIKch6Q1hpl8Eb8CLq
         TtcURFnt8fDtIRmCIWFPLWSFf1iQaSjWVvTYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908807; x=1788513607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn4vRPgsu9ZH/AxJw/yAM2v9xHesMIpX1FxiYpcxLmU=;
        b=azLszu2qEAy2QIPmND1VMBultguUpyjXMO/PJL7r5KDY0HTntJNsbgDDlO3B0A4lcF
         lmY6Jt8k/YmlxHmlNerVcy5s7eqpxsDVpj36j16GKAxRxL5FGExlhXWPBaQkpQWlyRxq
         FOpUtAJxuqh+0J5TuZomIsgouqP9MBTdB0XCUlIubn8tc6KBkkGUQa7S6NEdsdI0kb5c
         9ICuEpqz3waFBtzy5axauAG5Xhn3VO0HQg+Ibu9CZ623GT04cbj/+XD23kpy2QcYZBgM
         p/MB/v8Kdd893UQK9cv5GYyRZRdABtDpryqMK5DnSpxmQzKqHuR0DNYwJqojdTD4sGtu
         KqaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjSg2eGiA4zUYktU9Vo1a8JO8TPifbjKYE0h7e+wproSkcWyjbf8BPu/xXSwsW/zSkhMo0xqaCLoYJaDo=@vger.kernel.org
X-Gm-Message-State: AFuF++kClWnIl1rtMld3/xVVQD/6qX4o52RXQXfE6NYx0ny66b+CVjq/
	ZBksgiS6qg5kSlc6i+CvVs7Xh1FGZ9u3FEbGyrCC9e0/GcxWu4YqVQ7I/HSYm105kg==
X-Gm-Gg: AR+sD101Zeujp0e/fcqwrMoxiuojHYzgxAXlTlXCxEfgcbzT/KaRt1NQy4jprjhxAK/
	OKJpc3kUugEThtkqL7WIBL+/hV/phEDac51G8dWqVz4dmXBELE5m4nZZl5eOFmrZPa8LEFWS16u
	aDYUjzDz/b2Ecy+JIVO0cU5AQyqUrXAAM2ayONVUI1leC6c/gA6Qbtm9Fofip6LgMXCowLrabxE
	jtFlxDMvxSSd00gF5UpOpSwMlifSFHd+oo9Yd6+rJDeZpzE8Hx3EIHOIAicKrj6f2tvUn/ZetdL
	hYA2oTMcULDbyhLBBl7VDFebirkmlTSa4mZztpCbcnKe3aSJGTzFXQMxeL0xoh7vPlSp9QU4RxR
	tzsqxhbei2arg33JVpjKkd76z5RJsLrfdWMobYL6OOYHZA3sF0fIilEzDCFFVKfuUEXwO3Z2lWr
	e9mirbGPEOZKw3F4ittfBFn0Zln6UEq8ig59N2HMWqx29wp13JZXTNZN+J00jWuEljR5WrLp7kc
	DFbk3on7XiwRKNaKwBAdW7EOsza
X-Received: by 2002:a05:6a20:4499:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3d263ad82a1mr12426617637.0.1787908807449;
        Fri, 28 Aug 2026 02:20:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a804:e404:4b31:580b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f68bdsm372314a12.3.2026.08.28.02.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:20:06 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:20:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk, 
	akpm@linux-foundation.org, bgeffon@google.com, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] zram: fix idle age_sec underflow in idle_store()
Message-ID: <apFSk6cEmfHNGstC@google.com>
References: <20260828083149.45760-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828083149.45760-1-jiahao.kernel@gmail.com>

On (26/08/28 16:31), Hao Jia wrote:
> After commit 2e8ff2f51dde ("zram: use u32 for entry ac_time tracking"),
> idle_store() computes the idle cutoff as:
> 
> 	cutoff = ktime_sub((u32)ktime_get_boottime_seconds(), age_sec);
> 
> Because the left operand is cast to u32, when age_sec exceeds the current
> uptime the subtraction wraps modulo 2^32 and the huge result is
> zero-extended into the s64 cutoff. mark_idle() then marks every entry as
> idle instead of matching nothing. For instance, running
> 
> 	echo 86400 > /sys/block/zramX/idle
> 
> on a machine up for only two minutes marks all newly written pages idle
> and hands them to idle writeback and recompression.
> 
> No slot can have been accessed before the system booted, so an age_sec
> that reaches back past uptime cannot match any slot. Return early in that
> case, without walking the table or taking any slot locks.
> 
> Track the cutoff as time64_t rather than ktime_t. Both cutoff and
> ac_time are boot-time values in seconds, so a plain arithmetic
> comparison against ac_time in mark_idle() is correct and no ktime
> helpers are needed.
> 
> Fixes: 2e8ff2f51dde ("zram: use u32 for entry ac_time tracking")
> Cc: stable@vger.kernel.org
> Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

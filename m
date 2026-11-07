Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057224;
	b=5cVAokmV6+6j8S9HJ5+rQ+B2ylLk6VLbYYBf5Czpofm5a5XZ645Do2Lwkvf1SWVb9usD
	 H6lXrWTcP1yrPo9wchvFrDsBbnhra6LeJNBb7exZtRF4vOMsQ59uqJQOYz/tPk59WASqi
	 8RKwW2eUyKYl1/Uck0x5dawTRMTykBPirVOnxHHXo6M4/yStiYs8YrMldl0ZwUejfLCtY
	 dMYxno2d/e0oj2HE+5W31hfhGVYcHjYMhzsf9tcCjabGA884+6G8hfghzHJmut/wvLxDD
	 4GcfpkW66QKnOI45lBQUfCaN+yzSQBLNvJngloYQhZ3qCEcUGRL5LkvTsGhmFGeR/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mU1gx4Z0JkOTxGLX6bcD7yBmV9bfZhBk7fJwPHCSHhM=;
	b=KzUhR2qyMfcQoun1kOVZJ37BJvh1CD+2Tw+2nYAW4/mCRSnFxNVkeCDme4f8jtX7aLxK
	 mBbgcZkLffLO+xlKtX07G/7L/xkOTGvlBlkaYiD9c47k+K6ZigzbdvrcnTls3ncrVEAw3
	 9vBTx2qyYiGVJmZBqAVc4FjF3J+Zi7E1DBKsQkBKzf8h3kbFRZxdS9ysoe8cfXs1wA9OO
	 UynRQrfpVmmdxbmph7W3AilAzD2M6G/HKul82UUb8ks4nZ52kBLPilm/n65ahWcaBJ0K0
	 TScQPfA8u3duybTB97C7m5jlH0XbUCULDo1L04HhSBYrEn88Ixc2RPstfIF2JD3PtSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdYi15Q1;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E43606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E43606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdYi15Q1
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso4082605e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057222; x=1794662022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mU1gx4Z0JkOTxGLX6bcD7yBmV9bfZhBk7fJwPHCSHhM=;
        b=bdYi15Q1pMs1KWBK0RrXq5hoS/1hDVt05L9aT3s1QT7Vjtg3L16N1H+sv8MuJ6VuDi
         nivbnX8QplN/hKzxrZi7qyRprlSJU4LaSkICIydUvDWyV5ZO6KhcALFDxIQNpcelbPQ1
         /cYMGp4uHWiL/6MWEfjhrRQpoktSGZ/X3etC3kbM7ybMyw2Zrgz6GtWP4D7yPwpdR+vq
         aQFcKIBb88Et+gCHiL3iqVEcKMamBYQWVbcFbLXtKH1jXmaOddtktKtS7mF7AzYtWJOK
         +kS9gm4L91kQM7t7GP+kKJbn40DVd8VfiC0KmDwT314GBzCc6vYpla+AtSY4/XZ2ssa+
         hR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057222; x=1794662022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mU1gx4Z0JkOTxGLX6bcD7yBmV9bfZhBk7fJwPHCSHhM=;
        b=Bq8RT+NuIUlTw13/O0ES2voXIHm1JkO1MYPM5N/UFvW0nEAEFSurRGNDKUsvtV9Vm5
         Y3gsu3y83mCBHZofMEY8ZVkawtZyjMVbonCWiVoQQI7iZqjhwBeEZQWI9n7AxH+vW/mA
         G45VrIG/+zzA3vO5sgBZFO/clVqZP5cNPTwJoy77fw6yj/wnVXU8t8TmTJ8mrLANpzP9
         Pm3ja0EODT4nrCEBxGcxM+1MfhFdrRGphyrIq/skqdZScpzQWDzMQCKGjlLDvTwIsoCc
         G8Ot5z4HPbME575q6LFtdsPBVd7J+uinO9v1XNzgaxWJ3PQJakakRYtS9yzJvLGhMzd0
         enjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmCGIYnw5DZFCiOg0FPBOVIEhQfiZgztEF3ahelUzhIOA8WZLcXX7EkGby3WzN1tgLmsj8jgr1Jgssyx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y5Se5Rr3c8SIJxl97dVhp+4qFDN6aGT//zZWtD5H2yUmpHMXY
	aHXVcyUFByzGmZKvXfJi+9p18qCkn1e1oUDl/5fSJQ73xHPBNDpVTVpR
X-Gm-Gg: AYBFou0Poy75Hxv2Cb+xk+awRw5Y+wkhKMNQBqYjyj10Atf42yBLDhxkyWR9v9dyRp+
	4NWOFK0JzrqfL1tHLmPUebzWMBvtsEEg2FtsqF4T69IIfZH99tC3Sc2uLj6IycZ/yU8Xmh0vExG
	ka0MTrrKL6cnI0DB+PKHPMRY94OYYCxJOV43u8C5ZjIm6t7XIFD8VFwuXvt4Yqp6Y9GGfXv/RGk
	X992qCYFQMXJg0ffVGgxL/t87JfJEWd5ykXtAXUde9+zlHOfG+Q4lk1z6mHE8F5Wp0aBTClQw6V
	U1MxZdZNnyEVqnBbRExlsujELgsV2nkBMz8Z8CyDTCksby9FGKxbmCFJitkT5YUhvO3Rd18D6BM
	HGlMsMQvMIuiaRhTN026Em+jRjSYpqYHnHR2hRIrlLHo9KEIqHU0TN6kUzBkSP0dgKvc+psjbhL
	lXLc3Y3lOihqF+2Ru38bgzlJbMmhwV+DZ8vj11Z6izrAbtOcbAm8J8mFqPj6BboeXezv/AG0WsZ
	8WP1jUwHMA+dZWO2IIba0kRQSafnGcTyAJ1yTK2ni7FKqxbNq/xGCcu5fLsGQu6iL9++2Jb78E7
	lOBCVr8I51b4ESF0IYnq6ZvQyxSOtYBSORoeR46j0IkO5mKqyk5v6vc=
X-Received: by 2002:a05:600c:4e94:b0:4b8:af10:d795 with SMTP id 5b1f17b1804b1-4b8af10db2emr24762225e9.0.1794057221970;
        Sat, 07 Nov 2026 05:13:41 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm122304385e9.0.2026.11.07.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:13:41 -0800 (PST)
Date: Sat, 7 Nov 2026 16:13:38 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH v2 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <au8eBgyrVXEWjhxX@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107113639.GK2668200@noisy.programming.kicks-ass.net>

Hi Peter!


On Sat, Nov 07, 2026 at 12:36:39PM +0100, Peter Zijlstra wrote:
> 
> Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> is marked idle somewhere along its ancestral path.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

First of all,

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

With this, now tasks in an idle cfs_rq cannot be buddies.
But IMO that's more of a fix. Maybe it would be good to
add a fixes tag?


Cheers,

Kayra



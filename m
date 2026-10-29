Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281334;
	b=3qfL4XegvxQ0XDyOWgFoHrHWclQy+zDyHi+zejMG9zGux95GAnyydRcpteskXJWY9ujs
	 zT09f+UGAx6be9NaZFBuW3JVElReGeMaDsO21MionJt5RepYVd0RyQGe3rHAyfrtmlxOn
	 efLVLSJctCD/YQZf9gV3gy7gwZ4qU2EKD6UEVyv/w7k21Vh1sM3m/D9YEcoR+YrestmEz
	 BI4q1qTJl5fOhBev9z2z707cgdMzP0lTl1EVwXIU9buiS0ClS1MZJmOfYhYvMMaGOr2uw
	 Q6KygYqR/NulphJFie/Ig6/yeVXAX8Z4AkaOtBO/k1iDFHYKuwga5R1o0DWO6CjSegA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O6CTOI7Goyf3DK/jXbQM9sZjnDLqWtwiiqPhDSY8VTs=;
	b=5SQzyzt7byr34eACj2spwjV0xOInnNip3/Vd6vHFGNr4cU474iJHitIyKXHghENo3ttL
	 pYe6h80FQ9CTrDSplvhiUSaHKuGsNP3BbatphHBS0t8a6L5ppfzSeYNmNl+3aL9CJzBGY
	 ar44VBsDvzlBAfPTMiH2HNMXoOGLtMpjz1gA/zDmej5P/3H7nibsDuW2Wpu1J28/MdcxN
	 IZGMTKdDAJwBG7HZ0zv4N/9cn1yqyRVtKEsdft9FsxUTQuK1/tXftoUiWR+H34kdpYOnh
	 igSlsadoAebWIKvxSLjt7lp0uCQEeb64jj0iIhxHFMGVd9xW0xAemmN9oZ/1YJvgg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VQbL3zQr;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CF1606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CF1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VQbL3zQr
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2003584c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793281332; x=1793886132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6CTOI7Goyf3DK/jXbQM9sZjnDLqWtwiiqPhDSY8VTs=;
        b=VQbL3zQrWIOVq4Z7tmllrXNp/F9Y/1vAbgkzY+NsMf49zm1WyIRTnXF5yUY+a6teZu
         1z7uiJ4jFHbGF+/iqGwEBEyDxle5Ef0QMEaTRWXO/ARS73wZmzQn4UGlARXyd81GTlG9
         ba+SuIPs7AOuuoWqYnJSqxcIzINoWvVsw+3K8pW2ZKfVCfUeuyZf1xJRQW/Mv7nXcFfv
         1QU18Cd2F1llrGeRNyDskRjAjvv3AZ46W2Sz+bPHUxPBuAA1ZRsCPw61qknLU7r0UorP
         uRcxoYRLeBXw4+xJeNoxM88JWSsdrg3NfI5Sa9trAT2uWC55hRcbeu5Su3xykZifEcwp
         7lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281332; x=1793886132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6CTOI7Goyf3DK/jXbQM9sZjnDLqWtwiiqPhDSY8VTs=;
        b=lejIj7HaTXjv0OM78+KGkgqP9ZL7fV0pbthbx4zgXbS78XTeAl4DmMAQME7SqHwQpX
         SuGlOTXmnlncyrrNfls39lN8v6JhIey6cvjfJ1+u3dyQrceigzTgJhbaGQUHEOzjV77w
         D2uJwvOJfZKvKIOHRSkaQcKiRM+hih96SDd17OsCxcf6TD6T25feBkEebv5C/0FC7r/z
         /TqUCB86v0fSFX/rB5tO8Hv3kX+Hr5A7tZPHXAZRm+9nw3APm4NlvHEXFXw4Irauk6q2
         J8Q7cm1WPi7cRs4uc7TAssDrBMEIZTkJI3Lwfyvfo2zf0jcJtw0WxOqhkR375HXAXsHG
         WaQw==
X-Forwarded-Encrypted: i=1; AKwUvBzcl3pHsCpkRWYrL/hpQp7PgK6votA08y1QmL4BlQCQhT7zIvrzdk8ph/HO5iT+j/iL9kaAqbtKx1shD/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP7ndCB6rOJ4jw8SiBcJxegs3FPHG0bIlECUH+czO6LbzAJefd
	kyHvhBDMiFzqQsY6OQZqKt6tPQP1uRUCCiFqYOKJA7Oqm95GdIixxhGL1PSuDWQuJ4Q=
X-Gm-Gg: AYBFou2KRbyaUrT62xpD0Ptoz1v5Yg9JIdMLO8OCJ4fQJbEs66xORkJgK1kWE5Juf8g
	6fRwvCz1lfeYn00vaRipfFwCM3RYxVsfReRD5LqytSNyXx9qb/G1+IW4YWqTJmCUS88pSVfy3DA
	fIDbcIknu57yuV9Ysd6CkHTZtHoc7Noj+gHtcsXK9fNIM4MuQk+qz7rLzM4xt1KP69lJEKvnLSg
	x0I4lFwBaST0I1nvVWjGtIvp1b8mEDN9x/vt6oj3rbNwL78yDw4edd4SYxWeR6wJtM2C15lE8/x
	YtQcZ1vfPuW8HjBBbE1bOFAUfAV8TnyoubkGmUConWFvMU/IYoKlwntFJqsBNGHxgl57kfQ6z+r
	AALYDyocR5zGPBQQSlweMpU0GBe1ptaEYLg87wwv/owvezG07FKT995f11+JCMTmpPL7WGNGQ3s
	J+bbHOX9omSUupHAdcSA08RFlp5QLBs4NumaWLtuqD2cDxfd20EHJN2nxW9VPflT0khMsj8eBpg
	jxKmbq/9PYIdrmABu08kYq/uChsRq+tXeflV+Cfxrg1/aobNsqsZgrxsIk9pIBiSYGra6Mt8k1r
	UEApXPP0gRbltxPZB9v/gj4pcf4O1LK0F0ZONCVfH3PJGg/tbphi4d360nRVxzvbpvLbnY6Y9Ut
	yXqXRLoS08pA4
X-Received: by 2002:a05:701b:4201:10b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1a6cced6334mr7561828c88.17.1793281332099;
        Thu, 29 Oct 2026 06:42:12 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e1f2de2sm14760120c88.13.2026.10.29.06.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:42:10 -0700 (PDT)
Message-ID: <502f31ed-dd70-469c-b433-577ccee36c3f@kernel.dk>
Date: Thu, 29 Oct 2026 07:42:09 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/napi: fix list use-after-free on PREEMPT_RT
To: Anvik Loitongbam <permissiontogallop@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Olivier Langlois <olivier@trillion01.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 stable@vger.kernel.org
References: <20261029102244.141621-1-permissiontogallop@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261029102244.141621-1-permissiontogallop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 4:22 AM, Anvik Loitongbam wrote:
> Commit 45b3941d09d1 ("io_uring/napi: fix io_napi_entry RCU accesses")
> converted the NAPI list teardown to list_for_each_entry() and
> kfree_rcu(), with a comment claiming that list_for_each_entry_safe()
> is not necessary because kfree_rcu() defers the free to the next
> quiescent state.
> 
> This assumption only holds while the surrounding spinlock section is
> non-preemptible. On PREEMPT_RT, spinlock_t is an rtmutex and the task
> can be preempted while holding ctx->napi_lock. The raw lock inside
> kfree_rcu() only defers the preemption until it is released, and the
> release still happens before the iterator advances. Once the task is
> switched out, the context switch is an RCU quiescent state, if the
> preemption lasts long enough for the batch to be flushed and a grace
> period to complete, the callback frees the entry, and the iterator
> then reads e->list.next from freed memory. The same pattern exists
> in io_napi_free(). I did try to produce a uaf on an rt kernel
> build, but it did not work.
> 
> All list mutators are serialized by ctx->napi_lock, so the entry after
> the current one cannot be freed before its own iteration. Caching it
> first with list_for_each_entry_safe() in both loops might be a more
> safer and correct approach.

I don't think your analysis is fully correct. On PREEMPT_RT, spin_lock()
should still be an RCU read side critical section. __rt_spin_lock()
calls rcu_read_lock() after taking the rtmutex, and then
rt_spin_unlock() drops it at the end. There's even a comment on
kfree_rcu() callbacks in there too, it should not be able to run until
napi_lock is released, which is post the loop.

IOW, I think this patch is unnecessary - there's no bug there. The list
safe change could be done as a cleanup, but it's not a fix.

-- 
Jens Axboe

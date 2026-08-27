Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0510F1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833851; cv=none; b=RJzuPJR+Iw000aak8phs1L1CbDmKvSSWtdhsrQbwG3KkC4jLqHe7vHTylPhI6CyBzfsUurHvQoCzFQ66OA3D+tMK8a18IwyfI7YTz/1HSFUlLx8AFFP28SLgY8P8qjBXzCwOzuXt8tmgZddnPvhUUTSylhXDS9oooP+dUxMKZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833851; c=relaxed/simple;
	bh=tPcB7pxS1CtvRI6+WBWltqzW1/4bgDW/w7xXAskR9sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1upFfvpaDbEbMipqRT+VB4vH3AOrRa1lK9YBWjHZ4V2R3gF8bxEDlZZyfwkbnQnUUK1YnzPn+zfroeAnsljErAm2pfI3iQv04VAnZa/fCVfBvx2JlRz4k41kccd4TTWZU6uY9nb/vrP5HvqvXvDF41p83pCdgxJ9mRp5UQi/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCcZKZ9y; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCcZKZ9y"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1025429a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787833850; x=1788438650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3z3cMsrGZIG1otUxfYnwtzC7nzo/8Ajm2RUqvlxc68=;
        b=YCcZKZ9y95dE8Na6PqLWUFrKjZ0E/NFzePouN2xONKqYKgKAYt9YxQ5wuyb03BeQfy
         bnYvEYqiofF76B2R/eSUuM2R02ilj7k+/YY3ng8x6e2VcFFz9RxTMCmYQoOAC/xWNUn9
         CSxGQa4hfNjFg4CJAtYVMif/7x7lYOxpTkA9IeQOFRwafuGUFLxHn1fATle1GZlRgmf7
         UCgtNx25pfCHLIio/+/vTS2a6Ni8pSlQbR5R2GuTdYIYVW9jBgYIe6EJgY+P3HOmVRDJ
         +WusQl3/N3xu2iKvfT6kVBJfY1cbQh123fqcdBTTW/AjCxnTjl+xkNVbH6mIEbn+qOb0
         z7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833850; x=1788438650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3z3cMsrGZIG1otUxfYnwtzC7nzo/8Ajm2RUqvlxc68=;
        b=YM4PrDwnUFf7hqWjVJmby6fbxcIaayNzcrrzzlW9nvCnARz9gtjHHqE8n027LliINN
         DEYE20Jo+DyfKLyhtqeRwbx655eRrMHCgxpohXG+byz1ZnBWcxZfwpbYdv+UVRjsjJls
         Lswj+rTxARyhgLyTwzehj3CUsGxfZJrs+oZd3V2BKHfQ2kHNFWlTN//aoc8B+S2Ches3
         w0TwdEBoBH97TB/bqvePpPC/YswvbwgUXC9sp2e2GOr89y8Oam736Bl1LarbHpRiEZ2/
         XCSSkjCt8uMdU7qABRkd+Nm2TKf3jUBvdo991UQlXrFrzQg7irHarOOlCC8ThLvECLIy
         Ea/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7KtBlqUFTyorif4HeRbZWOnbPm4NUlgb8SHAzeTi18rxZhZICAUFxVRQ061iesgS0z5XYZ1tgPPnQ89I=@vger.kernel.org
X-Gm-Message-State: AFuF++n4p23mkbZiS1FevOEdAbvKM6RfX0wTZISOJVrIL+algxJVjNHW
	Kp4iER28OV3hFX8ER+H6Dyef0Qf8nyx0ybuiXnjqVN9Ts2lGOlyIgevv
X-Gm-Gg: AR+sD13j6HtFdZP8kwGRufbYeVgA+ouo6EfzWhAHzPFfk/f70l3ZokosIZGA3D7Dw1+
	Wyih0DzWKjGRxcNHCCXRy86YWFYWzqrk8NSHwv1Ju54EW0QBD/SYRAzOZYFcKUcuWuLGpBjINOO
	clwSjxO6UEA36OpJrhb6Vgb5lp6NN5+1pg+ZncTKh4htc3zNEmKC89GHgS2Sju04H7UaZw1WBHv
	qA7AWIfmLxUjUsyFs2oMP8nx5d4KwQgfiWxOIzFjIzF+X6RnB3coxM+yU5Nn5pFkh7RecJo0Hzm
	ydiX5N9ZVGsfCNfu+JV/XTHxJ8xiPZ23wFjeiI1TGiPA6UuqN30TdKPU/FZWlRABv6HEJQ4AxFT
	3Bb5cge0LSXnFSknbMMv3uuwgtYNlxedVEzD1IBORHirbzW627MkekqMCteW3nbENlUjrXqgZJb
	fhjB/zSZboeah7QbYN7KUc8UkTgybIfG91HxS/Bl1wGSzqq1R2hQaBUv/AbG93cPAXGqQ=
X-Received: by 2002:a17:90a:e7cb:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3969bb7ae09mr6471454a91.5.1787833848973;
        Thu, 27 Aug 2026 05:30:48 -0700 (PDT)
Received: from [192.168.55.196] ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1125ff2sm2735225a91.16.2026.08.27.05.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 05:30:48 -0700 (PDT)
Message-ID: <69bfdfd7-3efb-424a-9146-ca0ed9226edf@gmail.com>
Date: Thu, 27 Aug 2026 21:30:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] srcu: false-positive WARN in cleanup_srcu_struct() after
 78a38cbf6f20
To: Zqiang <qiang.zhang@linux.dev>, rcu@vger.kernel.org
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
References: <20260824105625.3725157-1-shpark061104@gmail.com>
 <494f3e0cdb3692bf13690f4cddd3b40098b51627@linux.dev>
 <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>
 <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
 <9e216978-d884-4d56-b39f-d134f78a4999@gmail.com>
 <eb2132ad05cd3804a8f2a170de441d79afa793e9@linux.dev>
 <f85c60a0-81d7-41a4-9926-f69cf10222d0@gmail.com>
 <e6350377085ddd85d6ef00d8e9a67bd50c762d3c@linux.dev>
 <698a4d8b6c559f9049ee6fa6b0bc99d45a3d7e44@linux.dev>
Content-Language: en-US
From: Sunho Park <shpark061104@gmail.com>
In-Reply-To: <698a4d8b6c559f9049ee6fa6b0bc99d45a3d7e44@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/26 20:35, Zqiang wrote:
>> Which tree is your test based on? (rcu tree or linux-next tree)
I'm testing on the linux-next tree(next-20260821), regarding the commit 
[1].
> The step5 srcu_barrier() has been intercept the srcu callback which by step4 call_srcu() insert,
> so at here, the srcu_barrier should not be return, and the step4 srcu callback should not be run.
> the cleanup_srcu_struct() also should not be called.
srcu_barrier() didn't return at that point, it returned at step 9 when 
srcu_invoke_callbacks() (which was queued to rcu_gp_wq at step 3) calls 
the barrier cb after finishing the real five __free_bus callbacks. Steps 
3 through 9 all happen within the same jiffy, so the timer armed at step 
6 for the next jiffy is still pending at step 9. Also, a stale n_cbs is 
left because, although srcu_invoke_callbacks()'s invoking loop may have 
finished at that point, the control flow has not yet reached the 
rcu_segcblist_add_len(-len) call at the end of srcu_invoke_callbacks().

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/kernel/rcu/srcutree.c?id=78a38cbf6f20bc8247e93d1149f97c12dba9fbfb

Thanks
Sunho Park

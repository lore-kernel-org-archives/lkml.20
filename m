Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C742370AEB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835850; cv=none; b=gMIkawWaoxBoAjPysz7dQm1TmJVDNAwbAOKY29cZDGnaUU94UX1lpxhgRO0m0d7rSjga4kqJ3xyboRYV/FTP2hiI5ckn/KwW73Kl6q45z2B3gU9U5sIb9e4hlTWCTm626ehwktMy6E2rnt3t02KwgMvxcusj2cMZGQJJRR7mJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835850; c=relaxed/simple;
	bh=FycTryzO6CYp9jbhP7pmnkEllg/ck10vYf+Ck/xZVpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTZia5q/hyaApC8cwiI/Ru6c690Dl5/HgRTwVBai5EV9ucYyKTKxeFpHaPPnxqmDOec84rPtf7Q1hD5kMdOcu5xl8qScXjIhihYwuwEF3etyijCMEb2pmBW4yQosi9suy1WEvYxYDoXg8J05e/jdCzx977WnDDn7tQ4Zo96gPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmzJDWcR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmzJDWcR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7200b2e15so14101955ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835842; x=1788440642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zxyBr6L+CuEvCLLnTBBC05O3r7u5XqflfOC0yEsoRc=;
        b=qmzJDWcRqK5OMP0Gu9Vomknjhf/fiLf1bY3hQc/P6rXwU6cDW8s2Rc7ZUqqR5wo5e9
         T2NfMYDoW8OxI1+VHeX5mngLUsIfClK7fNseEsJi5LJDPvAtPS+lE56ncZIZ+y0mm7rg
         u9GcQcxu5XGqSkVsVxxj09kewkwxoXtX9NjNWW3ejZVnhOZBlnvOieVhK4GK2qg3Xg+n
         KgdCkIWSEVFDsXDLI90Q9dhJIWbU4JTzN/WcPwbiVX9wMmIAhJ8xHB0aapuKHQQwMEn4
         f5ncFfy9oLoL9TaD7886MORdkrG82ke3ADYobIo8aHACTRkwDm9wv1ArtumKrcQuyjmA
         sd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835842; x=1788440642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zxyBr6L+CuEvCLLnTBBC05O3r7u5XqflfOC0yEsoRc=;
        b=V9kNH1TkTIrLFFoC+z2HuDDTNqhlozd/2+EgmNOhQW56HlMATT9xfIrsnrYlmvHIcH
         uF/Y5+2EbqbewqQr2hrZbvCiLO+pHiM8SYe2fz41mEadNTEnQIuyHbLcxZcGY8mUoDVa
         Vtaof3IVX8e3wH85eUFHRMLVii0myklpMWyIgcKILS0/TbSuhlb0iYxkYZ1yq/GSUc7C
         yywZxN4aZbCzgedKYumGzdJBbI8FLV1IudkPbd4wwJsfQim/rwlpwA3boW6ZA5SLge5y
         e1+9oRbOKUkP/k6myMPPY9n6FVDHAo83nFnwaWYFVq4xz3wobtrqY9M6KMcFcktI6DZB
         hc4A==
X-Forwarded-Encrypted: i=1; AHgh+RqgfdMvqkHknCqhO0KxZJl7cvDqSBygBQMnCSHn8r2ZjqHMpdfETOB2u3p9xhafaCHVqjTjw9mprdUZyHI=@vger.kernel.org
X-Gm-Message-State: AFuF++le1BY/paN0D4mACQTQ2jWnVbjigBmCZn7dEGr4fu5E2cNyn2++
	VwK1F3dhB1DgzbO7BLLmKCFNSdrYw1taCLRBnqZ9rR/Y9C3bcfvwbGn5
X-Gm-Gg: AR+sD136IMiM8SKFxA4LLrwDVRgaC9DTkz5ynktGPaPx/SvTTz9CRC544Noe0aONWna
	PZ8iR7hmwsJF874EBXfpEI3rVXlsVl+hNEiTgfZuX116aOu3S1KjMmlwjl0oWll3spxW392WEHy
	GKQhQ7bmemZ65qtJldQ8sPo/F1xUP+PWUrElkYGX8AA2SpDJ4yAEBpMZfQmxGYeZBBt4my6pfl5
	1mRW7hn+s2OcnhlMvroDZb/CKLHOK37xMIpkTZ7os3TQnR53hW/9YnX0rXhM3IFauRjrZcKoYFY
	wZy51qoGh3HhLOZmpfFtkbFcfnxB6FuXffV4YaxiW5ChMJZtLj0qYDvH/GkrSDDdwXCauEJqQH/
	EqPFyLM1jxLjAzemw7U3YCzGp1svj8uN75+rg4/nJdKLjiW2ged+XPXmP6OVY4iLf16gfGBEMlt
	1w8b7XwhfTfQCiIIpYp2zSq8FbRt2bkFdzC4eEdzdw6YS87O79OX4V33wVaGZS2LgEorE=
X-Received: by 2002:a17:902:f78e:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d707c0d370mr230045975ad.13.1787835842448;
        Thu, 27 Aug 2026 06:04:02 -0700 (PDT)
Received: from [192.168.55.196] ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70493ce09sm16665875ad.15.2026.08.27.06.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:04:01 -0700 (PDT)
Message-ID: <28ac9afd-92dc-4c92-91f3-94f025977ca7@gmail.com>
Date: Thu, 27 Aug 2026 22:03:58 +0900
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
 <d036078f31cd8f0fdf0b9185ce8cadef803cc375@linux.dev>
Content-Language: en-US
From: Sunho Park <shpark061104@gmail.com>
In-Reply-To: <d036078f31cd8f0fdf0b9185ce8cadef803cc375@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/26 21:40, Zqiang wrote:
> Now, I am trying to rephrase your problem in the following way:
> 
> 1- the step1 call_srcu() trigger SRCU grace period has been end and queue sdp->work.
> 2- the step4 queue srcu callback has been intercepted by step5 srcu_barrier()
>     and start a new SRCU grace period.
> 3- this new SRCU grace period end, and invoke rcu_seq_end(&sup->srcu_gp_seq), queue a timer.
> 4- the sdp->work begin run, and call srcu_segcblist_advance() with current sup->srcu_gp_seq.
>     so the step4's srcu callback and step5's barrier calback both to be run.
>     all callback finished, but the len not yet update.
> 5- the srcu_barrier() return, begin call srcu_clean_up(), and then the srcu_clean_up
>     find the a timer is still pending and the cb_len also not be zero, trigger WARN_ON()
> 
> right?
Exactly. The real callbacks are properly invoked as srcu_barrier() 
guarantees. The WARN is triggered only by the two transient states: a 
pending delay_work timer and a stale cblist len. So I think this is a 
false positive warning.

Sorry if my explanations were too wordy.

Thanks
Sunho Park

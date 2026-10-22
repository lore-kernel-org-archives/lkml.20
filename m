Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667533;
	b=oxFqbHYYlpm7hmuFTFQERlAhK87NnDMwsnQggettIabIiwThGy4HnESvNr/8kji1yrCs
	 Zn6TAkej31pfBc+TkKmg/INOCrqj2+4eNgMTrTmim3FRtjlfUHMpA6Fqa3Jt01Rx78gDL
	 bxRrYsufs4obuy3MOoz7JDTXSaz3N8YPcNki0brYBG2OFfVL/GawmS7sPPlCw+e2Tbv3O
	 7ddlvH1SLpXUwoYd4DnMtJa81ieI2+c515O1at1JQ/1/vND+Xtd5RF8hthiQB1HIFO8mQ
	 vX5EM4ZISjFmj2mDdnds7YUy5LexOx3zTES1pTPEhtw5FJYrxFasVZFPiya4naQieQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667533;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lpd/iWIoxrsm+xCJT3uJAtx+84ErexdnmPEebY+FkSU=;
	b=YuVgNQ3feN0ptVhrBUB/PaUsGQhwoHk4NqaiVLivmlu66zI5qWI9Zogv654s5pSFWmDC
	 vlN0DF2yigGMakyOxYrSC3wdSmsJPGY3zgnkUg+3+RWUOvB1QLU2FdWW5ppV7oRHlqNir
	 9gnRpdN5zVDEWkkYzNAuH9BPCJfcW/S64aDeALx9lyRINfEeAvTa8bhVUXRwvFgKxNLvt
	 hGsc00ptvlnUGcPyxBqvi/fDxytfaLbMfxfAJ/RxUm3GqKPYBjv85Xw9W23w4FPPy/frP
	 lh56UuUDYuvFxHxZcTdE++NsZzs+lAdx+bPpFXub6+eL1dLyphmELWug3Kgp8P78l9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=y06uxhYG;
	arc=none smtp.remote-ip=202.108.3.18
Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn [202.108.3.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C8606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=y06uxhYG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792667531;
	bh=lpd/iWIoxrsm+xCJT3uJAtx+84ErexdnmPEebY+FkSU=;
	h=From:Subject:Date:Message-ID;
	b=y06uxhYGQoEJmoZZSJVCBOND6KOeXWxS+Ybrrxy25PlTN5NRS7E14Ar4Dm8e3jUpW
	 6sNb3KxAZg6XQGrBJwZydoF+7Ve9X/CG3JtbValaQUxVSEbxvArQDmeYkGZv3+w6Y2
	 NbzeJRT+admfcptx3gZhO4Df0ae9i1x8maDUkCxY=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.244.129.176])
	by sina.com (10.54.253.32) with ESMTP
	id 6AD9EF7F00002849; Thu, 22 Oct 2026 19:12:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1431994456874
X-SMAIL-UIID: 52917A70D3FE4CD2923250539711106D-20261022-191202-1
From: Hillf Danton <hdanton@sina.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Date: Thu, 22 Oct 2026 19:11:48 +0800
Message-ID: <20261022111151.960-1-hdanton@sina.com>
In-Reply-To: <CAGsJ_4wMQteCGxQ7wxUKP2g96myo91ipF_zedFVVbxKdDrb=bA@mail.gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 08:19:41 +0800 Barry Song wrote:
>On Thu, Oct 22, 2026 at 8:12 AM Hillf Danton <hdanton@sina.com> wrote:
>> On Wed, 21 Oct 2026 15:53:21 +0800 Hillf Danton wrote:
>> >On Wed, 21 Oct 2026 13:56:17 +0900 Sergey Senozhatsky wrote:
>> >>On (26/10/21 12:23), Hillf Danton wrote:
>> >>> On Wed, 21 Oct 2026 11:42:19 +0900 Sergey Senozhatsky wrote:
>> >>> > Split struct zcomp_strm into separate compression (Write zcomp_cstrm)
>> >>> > and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
>> >>> > context creation/destruction into create_cctx/destroy_cctx and
>> >>> > optional create_dctx/destroy_dctx callbacks.
>> >>> >
>> >>> > This decouples Read (decompression) and Write (compression) paths so
>> >>> > they no longer contend on the same per-CPU stream mutex (Writer vs
>> >>> > Reader priority inversion).  Currently, a (low priority) Writer that
>> >>> > holds the stream mutex can be preempted by a (higher priority) Reader
>> >>> > on the same CPU, which then blocks on that mutex until the Writer gets
>> >>> > to run again and releases it, which can take a long time when there
>> >>> > are other runnable tasks on that CPU.
>> >>> >
>> >>> Given lock like mutex, priority inversion happens from Monday to Friday,
>> >>> but I wonder if you are inventing some wheels in 2026 if proxy excution
>> >>> works for you.
>> >>
>> >> Reader-Writer split is a foundation for further improvements (like
>> >> singleton recompression stream and so on).
>> >>
>> > But that split is not needed at all if PE works, yes?
>> >
>> Because PE is good at handling complex priority hiarchy. In a simple case,
>> task1(priority=1) is the owner of lock1 with two waiters, task2(priority=2)
>> and task3(priority=3), while task3 is the owner of lock2 also with two waiters,
>> task4(priority=5) and task5(priority=7).
>>
>> When the number of locks and tasks grows, I have increasing difficulty even
>> describing the lock chain that you in combination with Brian are unable to
>> handle. That is why in general PE is prefered over whatever wheels you can create.
>>
>
> I still believe that reducing lock contention is the most correct way
> to address  lock
> contention.
>
Given the log message above, I dont think the issue in question is the regular
lock contention, but priority inversion caused by preempt. Due to preempt, the
preempter becomes lock waiter without spinning for lock owner, which I think
creates the issue. Particularly given the spin for owner in mutex, if the lock
is hot then the critical section is supposed to be not well implemented.

What Sergey did not show is -- what if the preemptee gets back on cpu at the
preempter's priority after preempt, with the critical section assumed good.
This can be checked by making the Writer high priority instead.

What I am confused is -- why decompression needs to run faster without boosting
compression up. Where is the compressed material?

> Proxy execution and other priority-inheritance mechanisms can help in
> some cases,
> but they also have downsides. For example, allowing a low-priority
> task to run at a
> high priority can affect other tasks. When many tasks require proxy execution or

No agree. Just because of the high priority lock waiter, low priority lock
owner can run at the high priority, so the priority inversion is effectively
erased, particularly given a well implemented critical section.

> priority inheritance, they still compete for the same resources.
>
Even when lock contension rises, the lock owner runs at the priority as
high as the lock chain can offer.

>So I'd vote for reducing lock contention as the first option. If that
>turns out to be
>impractical, we can consider priority inheritance.
>
>Best Regards
>Barry

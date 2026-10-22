Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627727;
	b=fRf+2Og9WEzX/J0sBlk+AevSrSYlpmx39/9cmMAYnrPDi5aukvhiN7VjCsRMHVMkRY+R
	 uo8LghRpHp3luFKrEMfCi6013d529kG11GlPTwSCpKfTXP506PE6Lcx/oK1YC2hXF44CA
	 YFOQDw+PO99YV/uwLalpt2+X7JyE6hGqpeOnRWXy8UoJyTume0K/p7u7uNSDdEmSqBKKK
	 FvglfzCJ97T4fs2ConJSj0sVgwdrGsqh+wug1+IugZ/RJJIoRyrfvufb+R4CqXr2NHdlB
	 ClAHzCSCzg2I4+fqSlyFVajUA+t5lgkzNL1UFUODUyPlYxtFUtusqs3itkllqfnTCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627727;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aW8G8tvB/aSV+Sr88rLQ9L/lx+lE4jps8NAxRfMRF8s=;
	b=4MrUozc5OpdkRLVfoklMB/ij76sBCLy2eKPzUWUf+oLerDBOOqyr70L99I8DcU9G4m5o
	 wGhEB7dYd3JUoSgmMzrPlUTt/jlsAG5paKWa5w69ryQEL9YG2LiSQfG9QC+wp6i+NE0SX
	 of8Lp8ZDv84EUutx82ZPmgP2uMnX2LSiW8O1b0EfbSvDAOZyvAYr5hnBKTlALwAg08egl
	 kfx/pGLqtwFbg4wcjT3Li7ZOfhYwh+/pEyrCu1Mv22pAToofBUmH5zGgzA+tz8Ri5Ffqv
	 71PlGHRMXf2hGtGJeCTb62eGHkzCQy3YKsbo9CAvmyg8VolZLte2ifIUoXQbq1B7ACQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=TpaOd5m7;
	arc=none smtp.remote-ip=61.135.153.141
Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EB3606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EB3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=TpaOd5m7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792627722;
	bh=aW8G8tvB/aSV+Sr88rLQ9L/lx+lE4jps8NAxRfMRF8s=;
	h=From:Subject:Date:Message-ID;
	b=TpaOd5m7wqym/8E1q/prX/su+fCo6PGulEu/7KkhxomJUIgM9WpIUaLi2o9OZhXUb
	 bY73Y7oUdgiHYotAiCO2wqU0kCAgivL/TcqPI3EUS1NOgbll4V4nFL+I2r4oaR9Iu9
	 gCQhvMh76/oBXSuV9iKVOKSvoVaETzhkSevOXyH8=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([124.64.22.182])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD953FD00002287; Thu, 22 Oct 2026 08:08:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3247236815943
X-SMAIL-UIID: BC0196746BD54520AFCFCA0E0C41DB93-20261022-080833-1
From: Hillf Danton <hdanton@sina.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Date: Thu, 22 Oct 2026 08:08:21 +0800
Message-ID: <20261022000822.938-1-hdanton@sina.com>
In-Reply-To: <20261021075322.923-1-hdanton@sina.com>
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
Content-Transfer-Encoding: 8bit

On Wed, 21 Oct 2026 15:53:21 +0800 Hillf Danton wrote:
>On Wed, 21 Oct 2026 13:56:17 +0900 Sergey Senozhatsky wrote:
>>On (26/10/21 12:23), Hillf Danton wrote:
>>> On Wed, 21 Oct 2026 11:42:19 +0900 Sergey Senozhatsky wrote:
>>> > Split struct zcomp_strm into separate compression (Write zcomp_cstrm)
>>> > and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
>>> > context creation/destruction into create_cctx/destroy_cctx and
>>> > optional create_dctx/destroy_dctx callbacks.
>>> > 
>>> > This decouples Read (decompression) and Write (compression) paths so
>>> > they no longer contend on the same per-CPU stream mutex (Writer vs
>>> > Reader priority inversion).  Currently, a (low priority) Writer that
>>> > holds the stream mutex can be preempted by a (higher priority) Reader
>>> > on the same CPU, which then blocks on that mutex until the Writer gets
>>> > to run again and releases it, which can take a long time when there
>>> > are other runnable tasks on that CPU.
>>> >
>>> Given lock like mutex, priority inversion happens from Monday to Friday,
>>> but I wonder if you are inventing some wheels in 2026 if proxy excution
>>> works for you.
>>
>> Reader-Writer split is a foundation for further improvements (like
>> singleton recompression stream and so on).
>>
> But that split is not needed at all if PE works, yes?
>
Because PE is good at handling complex priority hiarchy. In a simple case,
task1(priority=1) is the owner of lock1 with two waiters, task2(priority=2)
and task3(priority=3), while task3 is the owner of lock2 also with two waiters,
task4(priority=5) and task5(priority=7).

When the number of locks and tasks grows, I have increasing difficulty even
describing the lock chain that you in combination with Brian are unable to
handle. That is why in general PE is prefered over whatever wheels you can create.

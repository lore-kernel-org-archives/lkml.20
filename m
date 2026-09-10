Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77635F180
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055436; cv=none; b=huAxnb1dOScnxDx39S9kQz3FaqaMhxSAXIAJyYjfzaGt+GyLqsZaFlutgdee1ODaBVKVPsGoPaivuEqmqM6Yx2fjWr/gAnYWOJtLh/1k+URba/o+Lb5XMuUHQZRZ8Y0shI4MlVQASVJej5KKcHuow9M+50EeSotSu5jBcO3QRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055436; c=relaxed/simple;
	bh=P2cYmpDWwylnIYYzqHe2uB/lHncOSeAxt5HhICWyv9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZflSbjVmYofYgX24ukNqkfS5AyPXfzvfah2vz0LF46fgTWDW4VxX0sMvrswbtI6VPzJGZsYHn0zkdDBye467cONFZvfHfHwGPjoz4ToKnfC4HgjVFWGUjh9RmrqxRAo4gY5gpOU8Zpu2S2twYtGfYrN+NdESa4IIXnMW/WeVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cFS937W/; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cFS937W/"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-939d917fee3so102222585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789055433; x=1789660233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qCACd8tmHvailDsRp61klS/38HeTmJcv/x0NuwIEl6E=;
        b=cFS937W/HQ9IhaW+caCuEBqpOQJRKKtbHOPLFcy8iRo5JRjex50hc+mE7E5/DOqJLt
         ++rvq/enCKbFTH8Yjh7jNk5CrMt9YA4OsoqDLkrAQtCjf8vRzIEG8NKGte7BWNy7sp9l
         b4rP56pwFtw/QSiWyI+vapuKzqK6X5e78H7HT7VCzpEUd6Fjr7g9PMXi7ZUG3qN0HUEO
         +zw8IB8mMxqp+qTMVXLyeQwiL/meQh7XSHMGxl4OvjnAsvOsbWx+ALHdNcTNi6t4MLnk
         CGBuDv7U+yndMkPKgjVQx06kunxMb6Rarzy2IMRxHt7sSBRxA7jOIOywqMxgKBFVi2d9
         MF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055433; x=1789660233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCACd8tmHvailDsRp61klS/38HeTmJcv/x0NuwIEl6E=;
        b=cI9a+7GeSKyliIJi/WwI2TyonZJLjlcSE7prfJkvgu6BNm070f0khDzdhrefTkxLrP
         XcnESiSnX9AVyFuB195gDvHGPfkqzoDWXcYz2XhvceIWz+8dMBCQz5YslADTvq49D8nU
         +oA4MYOhhuXDk2RjCnWNjLKz3Qiv0i8Xm7yTzs26P+ibwbhYz7sI1W3rj1j3+fAgZP0K
         NoPL0cXeOD2zHFcRa/HgXu+yVACVJqsuIdtPTbEJc7FzU07PsNzv2L/R2Z3FFISRNmnq
         szZaBLBy3Cyv7dDrBLIvKYZpByXQ8AB6hk/rlYb9WWr2rqfCY9CISZ7lMr+g4kMRlRia
         devA==
X-Forwarded-Encrypted: i=1; AKwUvBwQKsslBYMuGzl3vyeDTOWJbT3HKjTy98RyAaHpAVataAHN62qU+jZi8u9ExldxZGzZ3WJu4wTdLyQndoY=@vger.kernel.org
X-Gm-Message-State: AFuF++lILJDgsAChf/Iqu6ec2n1uhXs5OydI8ai1fGUdHc/0+WTbe+rx
	CeXcrK5Ao/d01F6KXFCF5ld0F7UGP3ygi3vsZm50Rzd9NqW0CY0MN4nqiCQI6KPrew==
X-Gm-Gg: AYBFou3Er1gogNY0jov+qGDaypETlPnuy+2DPrimHdPYtUt9N7Wng2R7+loeUbSkBDG
	VUfsmbtKZIh0Exw2/MyCwxfnrPVGSX871YEvwtf0xTBqGlvFVNNK+OX8cF3DS7o3ec5dBl9t6pf
	WKBit94IuJVHQF5PBFDdybAB8XsD15kPCO8Cn+1Wi2YvCReuCBDL8vEGPk4I+QjMNsHckq+6Q+y
	EyTqa8ccFah5b6Ju6lWMYR1D9tOdJckVrWdlcTaoRe9Vy4+1z2/l8O8s9Fe3TzlgQw+2WzP04Ya
	jdfo7UhDDUxjoQ3vUjU35DQ2c50/oErI1G4cu+EEK+FRY54Hq+KuvAyl010aGaJNEz6fyhKY7l0
	+jbAsnRSjdjXgQy6jmpo3MsxgqpbJbYDLKA9mc1INBZazIBBDHUM6VKf1SxMfxGQR2hRmk1BPUn
	PVyzngGyRvnSIM7ljFDX2WHVw7d8UI6HT6/XfERXO30/9il008IR/Gm2W/SRKHRhh7/70lp04S
X-Received: by 2002:a05:620a:3941:b0:939:c0b3:6d8e with SMTP id af79cd13be357-939c0b37c88mr1866043685a.30.1789055432800;
        Thu, 10 Sep 2026 08:50:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7d9f945sm15031085a.6.2026.09.10.08.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:50:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:50:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
References: <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>

On Thu, Sep 10, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the second patch.
> 
> > In your earlier testing, didn't you find that with the unpatched driver,
> > the driver module's usage count remained elevated as long as the
> > ep_user_copy_worker() was pending on the workqueue? And therefore it
> > was impossible to unload the module while a work item was still queued
> > or running?
> 
> To check that point directly, I tested the unpatched upstream copy-work
> path using diagnostic gates at two points in ep_user_copy_worker(). The
> module usage count remained elevated when I held the worker at entry,
> before iocb->ki_complete(). When I held the worker after that call, the
> usage count reached zero and the module was unloaded before the worker
> finished; the kernel then warned and panicked. This suggests that
> AIO may not retain the file reference throughout the worker tail after
> ki_complete().

Okay, it's good to know that.

> > Could you test it and verify that it prevents the problem you observed
> > with only the first patch installed?
> 
> Yes. I applied your first patch and then your second patch to upstream
> v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> With the first patch alone, I reproduced the earlier module-unload
> failure with ep_unlink_worker() held at entry. With both patches applied
> using the same reproducer and ep_unlink_worker() entry gate,
> gadgetfs_unbind() reached the flush point and the ep0 close remained
> blocked, while unmount and rmmod attempts were rejected. After I released
> the worker, the close completed and subsequent unmount and rmmod attempts
> succeeded. Holding ep_user_copy_worker() at entry with both patches
> applied produced the same result.
> 
> I also tested the boundary where gadgetfs_unbind() reached the flush
> point before the completion callback queued copy_work.

I didn't think this was possible.  gadgetfs_unbind() calls 
destroy_ep_files() before doing the flush, and destroy_ep_files() calls 
usb_ep_disable() for each active endpoint.  usb_ep_disable() doesn't 
return until the completion handlers for all the outstanding requests on 
the endpoint have finished.  This means no copy_work items should have 
been left to queue when the flush occurred.

>  After the
> callback queued the work, I held the worker tail immediately after
> iocb->ki_complete(). In this ordering, rmmod did not complete while the
> worker was held; after I released the worker, rmmod completed cleanly.

What prevented rmmod from completing after iocb->ki_complete() had 
finished?  Was it waiting for the flush to finish?  If any additional 
work items were added to the queue after the flush started, they should 
not have blocked the flush.

> I reran the exact pre-queue cancellation matrix, the original
> null-ptr-deref reproducer, the directed cross-CPU UAF reproducer,
> deferred giveback, forced dequeue failure, the earlier NULL-endpoint
> case, payload checks, and CPU hotplug. With both patches applied, all
> produced the expected results without a KASAN report, Oops, or LOCKDEP
> warning. Strict KCSAN did not report a race involving GadgetFS or its AIO
> work functions.
> 
> In my x86-64 QEMU and dummy_hcd tests, the second patch prevented the
> module-unload problem that remained with the first patch alone. I did not
> find a new failure attributable to the second patch in these tests.

All right.  So once these last few questions have been resolved, I will 
submit both of the patches (with your Tested-by: added to the second as 
well as the first).

Thanks again for all your hard work running multiple tests.

Alan Stern

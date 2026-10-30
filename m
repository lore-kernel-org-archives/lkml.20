Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364084;
	b=0C3rKfQ8ahDPqRK6wC3/6haFtqQIErn09Ro9JCMEE94NGfCatgB8PtswLfo25xYcP9ib
	 XcG5coPagNze22F2wFC2ZGD3hctJI0rPrEiIRBbxdCruDbP48J+Rhvz6hOS6vcC17f1Sa
	 ZGcyDlv7H6S4iu5CwucqCBRLJ55yiRPWYsnN+pId/K+/1Zhgj7zKLIaqD0fQqTNR+pU19
	 Hjkbb9F49Vov3Y8XP78cFf20/6SS1AhVaF1nlLvPfi/QNbthJaM0SYYiQOHnTPRHhPcI9
	 0EWyNIQfnJVk8flNTz3uD8QzES+WVTjy60t9841aICLR1oEb0GS60DHAjB2lWScxv6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aaQGQIASZtAY5v52my+396XnoKxcAzN9Yy6b9xpTNoA=;
	b=hpqtrP65Gsg6NFuni6z/B73jDue9JjNmlw7bOjE+WzY6YuMpG/m5yXLEo5sZHD1ycK3+
	 B7HyJSOPHWcmXqyV55QYen2ahdv/eP4p1PI7AwVThlUTgeszXUJqD1oedmWj9MST74L/S
	 AkzNsfdrmHWCwfV4SbbyceNfmrlj6LgbZGnMapjssGeIKhAuhRvTUI4/MH/MVoQPnLg+w
	 cVq3z7B52HqnFVdJh/NE+Q4/ZLXuhNr+nUsKXa08WQ9C56bXFsVRQayP4W8ocaOef6pR9
	 4A5Myg9cptoVi4onaNF+0LiUm/YaVxG+yEJn4DEilSmaD19ix1FOFn1fb6fIsuvu5fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J7hGEJSt;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC9606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J7hGEJSt
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so5105245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793364082; x=1793968882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaQGQIASZtAY5v52my+396XnoKxcAzN9Yy6b9xpTNoA=;
        b=J7hGEJSth6NlohC0dzVFAafmn5j0SnmygwUV2K88QjsvfT7EOG1R8/DMPy7VTzFw9e
         Q45gn0Vi5WTZGPyismHItXOBD8xCYZ6Er7Js6dsYhiXIe3wBPurLsCyQhDd690VaoiAZ
         XezdXLm+K+bSmrcCGZUhsPGq8NyR6zgtf0FHm2u3okwNjODRRBlvtZrmatkoGcn+nCsg
         m8H1CmICguyJDA2Xu5SR0KFP562PNvz8XBNVxVLe5hLq+YBMv4RY22PmO52Jzh0hrlJt
         7N7holbEofHOIWo0Ly5nbP8RsvsUSGCzt+X3W78Pv8pb0VPutaz6VW/1yeqls7os9Npx
         3kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364082; x=1793968882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaQGQIASZtAY5v52my+396XnoKxcAzN9Yy6b9xpTNoA=;
        b=qPRE9TCqo6fUBl9sOkWCNr6vk8wbDpihlrbv805MNL45aN5zNOFs57e4OA2Dw+xlXS
         1aFW+UH0Hv+IXqugS8dAakkRyOkDhxsZB56Utm+aF5urecIP7DXM/8cta0bDYXMZS/8m
         1oDyIs6qVv9vXP3yH6tauIVYQKQQAxtikdLE9NPlZKcRAs6ktvjKEq+RNV5ifLhKp4tF
         JDgy7knETVhn5hEv83pAj8knw9a5iJjNdSpwFYpmcLiUOVXiGhXtqL0n1lYuE6oCvWg3
         LxlisZEj+T1UIwWvNPfhY2diTn50stvnYI5ZeqvZDRclbYsxPcYvwLAHRzCNvaO8PuDD
         BHAw==
X-Forwarded-Encrypted: i=1; AKwUvBx17LGVgTzeTE17QLn7tkT1cBfjn2svFa4+T+aRI+Q8LbwcWcmyvRVIdHEWYCoQKiAWZkUBTMi/qO+Z4Go=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj+GaPVsDMM1KCmSpMs3aqE+l9L1AW9hyvXjTngb5ety2slzeP
	v1aH3gQnxAiOorK5/wA9Xq5dimv0jlFJWWi+e+vfn5rSH5kT0Z1oI6OESlXpwH1he10=
X-Gm-Gg: AYBFou1NIiuAYtUAdKeCjfVd/coi2MLoomB2LdOHkllVx3XjUO+hfEhM/Hw/TcKRym7
	qjy4cvr7D8cXPC5wUbn0qN2qdk9oV4TUNIfE+sN+iS24g8fFFi825sOGoWG6agjaPxvEbki58yr
	Jhn4TvHEtYAIPKd3brfC/boL2/gQW71D3YUsFMDX+Vw/BbXUq03jt4ob2k3jOyl7qkz6AmjQLNL
	tjc37gZCgHR9BeuGM9aG3xz/1dVgEpn5EpOJ4lHtajRQpjAr66MEI3w4vRZYE0LUnG98mgtJfiA
	65z7pov3qm8TzylHl0pTWnAwjWLAip3JkhKZlpRa1cI+tGwCNhKxoPdVT04oXICq0AzePmPCoE7
	wH1IZRbkEVhZQC4qEiOSfM5aF2p811Dq/Wu02Mu2iTSRpBnP6oSgy+9zLwiy75R0V+6ljutNcIP
	CksFM/1oeenxKRtiflFVDNYt73uhPDjvlQh+rfBWTrkM1cEa++pkwUU6ZKYWKVoDMxxwI5d0sMm
	/gBFIjlLWyqGkY/uUZ0V/2NdNQVCSmW89TKtbLDE10yJiuJPANfv0XWlHx7f0D+HUGt/C1FqgRw
	2H905ysiAQLuZoipxpuTE+o/YWbObUL8tKn3l3lAET/hBx3mDHGrAj0qldnf41AWLlI1mEegeLK
	EVCjE70gLwd1lpvqCyY/7XKH5TQ==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr51707575e9.6.1793364081826;
        Fri, 30 Oct 2026 05:41:21 -0700 (PDT)
Received: from airbuntu (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm48480385e9.4.2026.10.30.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:41:21 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:41:19 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261030124119.xulxkpo7aas3wlwa@airbuntu>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
 <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
 <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>
 <20261030112825.z7k57twgua27p2vu@airbuntu>
 <20261030121518.GE1813469@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261030121518.GE1813469@noisy.programming.kicks-ass.net>

On 10/30/26 13:15, Peter Zijlstra wrote:
> On Fri, Oct 30, 2026 at 11:28:25AM +0000, Qais Yousef wrote:
> 
> > Peter/Vincent, what do you think? It seems we have a schrodenger task that is
> > both enqueued and dequeued simultaneously in these throttling paths. Shouldn't
> > this be fixed? If yes, any thoughts on the right approach? Should we throttle
> > if there are no other tasks on the rq too? I didn't realize the semantics are
> > that strong for enforcing the quota.
> 
> Urgh, nothing is ever straight forward is it ...

Exactly my thoughts..

> 
> Bah, so this is because the core does uclamp (for classes that have it
> on) but then the class does the throttle without going through the core
> {en,de}queue.
> 
> Does it make sense to have throttle_Cfs_rq_work() and tg_unthrottle_up()
> do uclamp_rq_{dec,inc}() respectively, along with the
> {de,en}queue_task_fair() they're already doing?

Yes it does, just wanted to make sure we agree the bug is there rather than in
the current patchset approach.

I remember seeing a patch to remove the uclamp_enabled bit and defer to
enqueue/dequeue_task_$class to handle this instead. Maybe I can revive it if it
makes more sense to go that way.

Let me find the path of least resistance and add it to the stack. Not sure we
want to tag as Fixes for LTS to pick up this independent fix. Note we have rt
group throttling path flagged up - which I also thought was false positive but
not sure anymore - but it seems to do partial dequeue and must be fixed in that
regard anyway even if it doesn't force idle.

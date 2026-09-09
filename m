Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2028423D7F0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788931081; cv=pass; b=nGVruARrGJna5BWdMzm4gOMrM0UDdykPbN85SiY2uGnkO3TMX0k9KovjBvx5kuYOjpOM7gcgjyRB8vHRmu7nfqm92GNkrVpFdo1NS1zTN0R2i4BYdkiThuqcIH43eZpKXGGVbFFTgDiUV+GCaGpTWa1P+rp9dBLQF4LF7pXpq68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788931081; c=relaxed/simple;
	bh=lTUeH7uBg1apEPj4h8nGLSJDSLS3Xk4Z953/h7Ad4fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ6pKgXVVVCCnAZYSGRhtBMryX/jJ0I9mcG7Dp/5uEXZWaitCBHMZUdkt6XA5NbNb9CMyi8GAlG/Lw5j8MEu1Z3MUFN21hxCHImCMsFBmwEkWb81DppmRTtBVLGLLppsgRa7IMyS67gKykFsinG2OXlmLLRDk7SifouF8p+lLUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lO+67OJ3; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lO+67OJ3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so6224554f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788931078; cv=none;
        d=google.com; s=arc-20260327;
        b=QQkKBY1xmtSY+VYdi84jmmY9A/raFsdK76fyW3oLrBmkDm0dUBKw7NffaQeVX7weJH
         296fjuQq5eJekAr2BEOM6QFTKXOI/lN9fJDy87o1wgl2NyjlJcRH5scdaS3FjMpvNAW/
         3Si9hveEz+1twPBPS+PmzvlpkpTAatW7jUQLvCzTLT+XCJfvTxxjJlKxCtOyFP9Bgb3o
         KpUgB1TVhq9tnYpOsNMbyoAYVwk41r30cc27a0Qgs+XU6rNWbqxzet9YSn94X+SBht2t
         1csbgHKkjnJMqSXP2mP+O3o/IvIvzsJ0F7f4WS0h/gN4on08CYVOXkDx9v0CFIprAcZJ
         tvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tpwg2VYWUV11d9na6aGEr4WCfSoveOTRZKFpwBK71as=;
        fh=MhfjvuVwQDMjzPuVQFrP+JmdJpKaIv7AaDm9AE1X+xI=;
        b=pCbhOrTX9SSiE6h21whPySJhKbKEf0LeHI3UEyyNO7Mli32YhlFWmYx7oHWBXzHh5c
         INttamrTJUViiXFcdJ8Uv8puwY+UHvu85iRSD9nO+xCpz7mn8y/2JGvPwMWUiTyr0qv/
         AdlbkawxH6ji0qKVACv+xOJF21CEH6UPXt4VQffwWW41XtbMTBeAH5LhMkEcVtrRNDZw
         leleWHj4gbKMvspO2//XCOR8naywGCm6ZnLo2bkigdtf5/Mn7k70jO1y4asg5skWsa+6
         rH2o03+f8waFB5Ts0K8KLNMrQ8qzhtMTOvCTVxZoS/mVtrRZvJrFrWz88FBQCcZA9Cd6
         hOyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788931078; x=1789535878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpwg2VYWUV11d9na6aGEr4WCfSoveOTRZKFpwBK71as=;
        b=lO+67OJ3IGhqll8vXeLvTOahZth0zjaiU3enZNvJ6P4MLNb4rTgDLlPsgs/xCvIr9e
         Euq/kbR6klL9Anfms2ejYXqd7EmMdXSAtvvk1znTAEyMR5WP2tKzJ96dADwwORfIMRMb
         oSYSqGMDQQaq5OOW96FoHXvXi3TXdvq39aaoNry/CdJsmeLHea0QlgymNH5CpQSIuj3P
         gaDl2lwRupsJ1L4/JcRAr4CDlEWtDWYaia+8LZw6sgl/rdnDoeGNLnbget4FP6tJP+J+
         7nmEqOEvXKtW6isp8j7nF1zcYlEqxIP2iHMXRPasjsX3odleCS6BKTOKkh9NGdmpcnBw
         z6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788931078; x=1789535878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpwg2VYWUV11d9na6aGEr4WCfSoveOTRZKFpwBK71as=;
        b=XVrfKCHMTIeYWndgvgOZf9XNubyn0FlLGgDwaMgywUh2pY1fX06pnQhf/UjgakAJuJ
         UE5NyvmWiU2sKR4kf6A53C28HxdJCdCRWZiB590csQPA5VwsDNcnh2eUnWXyuxiY1wAD
         vcatOQh5ooHpDFG6Blgu/kE+Dh6o8vcUNWQsyQoP00cz2ZlJKLI61htnlAgrGzWr+146
         mL/2SsBV+XKNzjZ7yRhoBClX7CM+y2bPrIm6UJbdNYrRzrOCrqsYq1czuENyqXxzrsCe
         hiey/bkfJ/mhp8K0Z1llYmy46y/SMnohyIBav+CN9bRiKaTHkpHqwQKZh0AxgD/zkQ69
         q8tA==
X-Forwarded-Encrypted: i=1; AKwUvBxyCPA09sK4ajnEzGqagQJnUZaYL7yw+b9LTX0s/0akE5dwWi9D3+yAXzh5rR1gmtp1sJSMbiGbi+5MprA=@vger.kernel.org
X-Gm-Message-State: AFuF++nfynC5FDMzWDxqFQKPO2wbBu5YoY3umKlnSnp2rYpAKTQ6ZWkf
	+z86dNJmUpSYAj8OzTUCEmBbPIFp387tK/5p9zt4dkXGoiNW3Y1b1bGRCZpCQ97NukNacP2gt1D
	Z8xXeIQYHuimljuPo3szPU2eq2jbFLzC2emEmqdU=
X-Gm-Gg: AYBFou1dv8M9agJs+tg7GEOdNo+mpi+YRjKvwbbQDKtWU1qcWIL0H23dTo8EJMFo4dl
	M1D93/5jlNUdcnETFkvcCp+ci8gwHgNy7hCvpQ1tRYgMrPG4NsBdrBN+AN6xBqE0UwOa1Riz7eh
	pFbmgZoP5YL+4EZa0G1WzP9AXIk+41hcAMRle58peIBRnTBECaHmTDdLlIiZF7CqY8ohWnkvO86
	POzYHxzosobQddIYm5B625H/OLgdRIhvULxQqy/FWP0vHmFs2ghb1Ol/JFY97n0rtYO39vebiLe
	H/KFMv29gdTy5zPNx6trwiwf5k04SwfXPgEE3OCrYHrkn2i2fGsU87jNw7nKZCIPCNdJCLnvJGs
	fH1xOqt/SwEUs/zn8K0Sa/ljxgZvBrgK2B8LT7um64DyvVgH5ckZZwZlv5p2pnII0q38mLmd53D
	BQuhtI3lg=
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id
 5b1f17b1804b1-49cfc6cc0f4mr295286715e9.25.1788931077754; Tue, 08 Sep 2026
 22:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904034707.268416-1-sh_def@163.com> <appnKwylGK3QUIJ3@slm.duckdns.org>
In-Reply-To: <appnKwylGK3QUIJ3@slm.duckdns.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 8 Sep 2026 22:17:45 -0700
X-Gm-Features: AcwNN1XZTxQTZZ7aSCZe1KjWtvEMHTatn6Zj5p6jHaQ6JF4P0FCajzYWel3JKFI
Message-ID: <CANDhNCq5iPq87=iKSJv-XzYzTYJ8Hp+bPJ6SoVfWB3pRa=HypQ@mail.gmail.com>
Subject: Re: [PATCH v2] sched: Account cgroup CPU time to the execution context
To: Tejun Heo <tj@kernel.org>
Cc: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Koutny <mkoutny@suse.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:37=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Fri, Sep 04, 2026 at 11:47:07AM +0800, Hui Su wrote:
> > Proxy execution separates the scheduling context from the execution
> > context. Commit aa4f74dfd42b ("sched: Fix runtime accounting w/ split
> > exec & sched contexts") made per-task and thread-group runtime
> > accounting follow the task that actually executes, while cgroup CPU
> > usage is charged to the donor.
> >
> > When the donor and execution task belong to different cgroups, this
> > makes a task's execution time count against a different cgroup from the
> > one the task belongs to.
> >
> > Cgroup CPU usage should follow the execution context, matching the
> > per-task, thread-group, and cgroup user/system accounting. Keep
> > scheduling state associated with the donor, but charge cgroup CPU
> > usage to rq->curr.
> >
> > A reproducer with the donor and execution task in separate cgroups
> > showed the execution task accumulating runtime while cgroup CPU usage
> > was charged to the donor's cgroup. With this change, the execution
> > task's cgroup accumulates the CPU usage instead. The same behavior was
> > verified with an RT donor and with legacy cpuacct accounting.
> >
> > Fixes: aa4f74dfd42b ("sched: Fix runtime accounting w/ split exec & sch=
ed contexts")
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Hui Su <sh_def@163.com>
>
> Provided John is okay with going this way:
>
> Acked-by: Tejun Heo <tj@kernel.org>

I believe I'm ok with this if you are. Commit aa4f74dfd42b ("sched:
Fix runtime accounting w/ split exec & sched contexts") was trying to
allow the owner's cputime to make sense in top, but we still want the
donor to be "donating" their time, so I thought the compromise of
charging the donor's cgroup would make more sense.   I'm imagining
something like the cpu bandwidth controllers, where it seemed like the
donor's cgroup is who we'd want to charge, and eventually throttle,
even though it is donating time to the lock owner to run (since even
if the lock owner's cgroup was throttled, proxying will let the donor
"bust" through the limit and run the lock owner using the donor's
bandwidth - up until the donor's bandwidth was exceeded).

But if it is causing trouble for the accounting, and you think it
makes more sense the other way, I'll trust your judgement.
Tentatively:
   Acked-by: John Stultz <jstultz@google.com>

Eventually I think we'll want to track per-task "donated" and "gifted"
time so folks can more finely distinguish the accounting.

thanks
-john

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792477342;
	b=dwg6Y1oEo2Q8a1dKRo/kkENdADbJn9RkI4OmqO5+fjYNX/9n3AusZgOraiHEzEaZ1mDf
	 C1sQfOA6H2G3mrZKzg8mnpcEv4V1Gp6K+ftkX+HBXddN8kIdBC49I/Vxe+so96pIonGNN
	 2qBirwIdIhB73ZuB3BjofDyE0SixysD8rvJ0H7QjuyEmt6OAMprQoB0YInal4ukJFHlDB
	 aSAZ9+djv52jcyMPUiZKN+iUztnEcmqYDaMfMFDjq5LktsVan3HBxn4lMc2MhTgoOk+ek
	 d9Wx666CFAAvu+6RG2RCXN1W5ZaET6AXh4ktji8cccED1hw89mRYlW//bT4711hGHNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
	b=PL0ceOIvGpj4zUXu0Xrca2+XEWldmF6Ztajl/r+0VwBOylPjM1KiJQ2YRrspN3N14TJv
	 F0Ja5kzC7A1xLuX3b41RSDxu6P0HNu9sKlaTDdMjJTFn03Pf8V135e3rxnz71mqmysfuU
	 /SxPIgTGTB+ZJDWE1O3XE8Ty0WyC8jIbHuInApH0g7bl0tv5phCSFLewJXKbJ121K9TcL
	 hOoaZWrZpqKSaYDHaj9RH79fXOrPqDDpmyLQKb9UJSkhN7NQreU5cB98068PbJFb0++sm
	 +uXiFaAG3pm0+ZwEZmBiWXHXisYJU5IWUrwULy18Ou5UquDv1MFYJU/J7X/e5PigjWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lKX2o7+H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95148606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95148606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lKX2o7+H
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e901e114fdso14093285ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792477341; cv=none;
        d=google.com; s=arc-20260327;
        b=SUB09wRNcpPTXE5uzGkBOsv1cwhrtHDRJKRyYbjNQXmGUcYH5OBPtIevBQPTQZDmvn
         Z1HQuVufNdqUs0qS2aLMSO64n28l3bHKm9gdr9ozlW0oNLlaoSI+7C3jWTkFESHx1YKS
         886SweyKHdAMkhvdzRDF5DBisul+5qMBbx3z56zU8u5T020rsrot1TconVgRvOAdG32W
         ZdULcNm+rVj2OTj8AUzt+B52XDWrUy2HiutPlamOhBMotqnZHzquKEIln+9QzIe3unZ1
         0qHc+7+90AWQMxF7tzWHaam20go8aLK8TidHF0U7xV9cFnuvgDh+/NwdqHQpCZg3iuDo
         KqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
        fh=pEQ9sG/crUBgGfCNdQFiQxPdxe2koxOP+gvebdKzqLI=;
        b=j8NsjO9qvBPhDwk/3ktGcXEg8FFSewe/NHmYwE83l/rWwMcIpWKVmqDDQwApjixuuT
         K7ibxY+DTf6KXhUzqqcjpi/wSAYKf6cASP30/DFlaUwziF3bVf5aHT6hCJ4xpe79LcX/
         0dvhmbIzAwiWjh+tt8qlPEHUal24tfph71urN99jE86uKX6m1ADVZVh0gQ967NGQNGgD
         Qgp/WFgPtzBVlCFqo56zcF3wu9W9lHDxqmPtVhOAIqUdnAllAMQGCWaZmTr3+1o8wL9g
         rDcJupC58GanZY3WJ6GK/0+OKCw1O8xCDekNJClQcVjsVxNA+nAHeYJTB9Ri1j0YY4gL
         hdQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792477341; x=1793082141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
        b=lKX2o7+HuD5fpQzZNTLEVq9KL1e8Mg8z16cabHaSJ/2C7LS6z3N6JJwzDTah6U7qBI
         0Lj4Nw1Z6+fnib8fx9+Q7HnXTwIWwK9PuO4Ap4RAkWDiDNOrml42b3GiPpLZ7uqQbsYm
         2CWHNx7TTHt2PQdvvmwyLu6JL14GB2SIAM3kcTBbj7gXgc9FNj5+tctXSfSLVQhuQ8Av
         Wjt1JUWa7uWleeCanSskhVMMuuU0Gpu544YbSCxqAF1tJH5nTQd2lquAcOtWdgTEpbL3
         rWxG3PRAJVitBBMaUDBkGgKW7mWpMCzCIfVJDBTZ/TtIQUwdIa9PTmGbyArlFuSM8Yai
         Zzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477341; x=1793082141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
        b=vWmvirf2SSQuQSdr+ew3GmNISF4SIK8ISLA2xKcLZPdRdGIA+GKsAOPGJfzjUgvvZH
         kw6b2yT/811YTAkhNtWRZrmvKJ2Nb3zB1QmFcMO3RVAo+qeoJFhul3GDIH6zX4QmoyuR
         7k6ZIU0BY0zjdMExE7OP668chPp6iOBapBTSkq1nddEXIiBinIapQkbJAhqV882g7yMW
         Hu6Kd6dxzANrMGkgIFOyXpVOZvPwZXpv5tww06hYobm/zXbhoFst+7d3o/KgnKAnQ3Jt
         SDxmfUGYIrbl58+L4x3nL6kh3fsdpnCmtb7yRp9YnYioilyGPxGuBv+4wLSWxQy/pozr
         4/dA==
X-Forwarded-Encrypted: i=1; AKwUvBwCrs/0o8YFkJw3iBgQhAdMbRGZXO5t9FG05s2/9nlMg4C3JvckGpBQESIdXQzm1gRREDkJ9yBVKiwMtQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Rbvj+JljYB5i1JLAi9GORo2ViciM1p0DgP09/3u3sr1We7gL
	lXM9uOOzonGjF3WC+WgbFbsHsHoFPLjOI/cc36RmIe5NsOnrXejwUKzPOX586sfM/FHJM6pbq45
	HLAMf41G27DNfnHM2KAnHDDXIBmXP8/A=
X-Gm-Gg: AYBFou2QiUbasNtl65HcyWiV4wwp593XGewwHkquQhWecHcOU60ZwvhG6NrbPMs73iP
	AAMGcxmqKTfWU1FKwTkJRKc+mTwVS+LJfaidErh8HGPrNkEtB0tGw/qktzUAXXpQYSUPiqG5G+3
	1xqncyti8KSOlx3wpWfFOT7PdW3lA22cq9Uv5anq/9V/FiCN5lK+5GGIBp/z0W4Uks8ZvU5NLPT
	aX6lMuikF367+0gd2v37Bz2eIt75o91FcVGQHMnymksC/lnQ3spisJjlKcY0524KvMsygd/z1Q8
	Ad5e/AWRXIFXTZhqrwRlFO5l/e4JxbQIw+lprVBnOpu5xYhijeepeJA=
X-Received: by 2002:a17:902:ce81:b0:2e5:334f:f47e with SMTP id
 d9443c01a7336-2e9a69ea07fmr86514295ad.21.1792477340861; Mon, 19 Oct 2026
 23:22:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-cgroup-kill-exited-leader-v1-0-c71ad94c20cc@gmail.com>
 <20261018-cgroup-kill-exited-leader-v1-1-c71ad94c20cc@gmail.com> <atYTukAn0-7CAXmp@redhat.com>
In-Reply-To: <atYTukAn0-7CAXmp@redhat.com>
From: Kirill Kolyshkin <kolyshkin@gmail.com>
Date: Mon, 19 Oct 2026 23:22:09 -0700
X-Gm-Features: AclHuK9ygSdoDJEA1JRd9ZHGPjt0wCVb9_5HzGSf6_SYCV4LA_12hP3cAjxp2vw
Message-ID: <CAGmPdrypQQnmE1iCTWS46c47P0puRsA0Z4jYnXFFnZ0Um7KJOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cgroup: fix cgroup.kill for exited thread group leader
To: Oleg Nesterov <oleg@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Serge Hallyn <serge@hallyn.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:57=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 10/18, Kir Kolyshkin wrote:
> >
> > cgroup.kill does not work in case a process' thread group leader is gon=
e
> > but other threads are still running. This is because __cgroup_kill()
> > only walks the thread group leaders and sends SIGKILL to each of them
> > with send_sig(), which uses PIDTYPE_PID:
> >
> > 1. The exited leader is still listed by CSS_TASK_ITER_PROCS as long as
> >    the process has live threads, but a signal directed at a single
> >    exiting task never takes effect: complete_signal() does not look for
> >    another thread to deliver it to, and __send_signal_locked() now drop=
s
> >    it altogether.  The process keeps running.
> >
> > 2. The live threads of such a process can be migrated to another cgroup
> >    by writing any of their IDs to cgroup.procs, while the exited leader
> >    stays behind.  The destination cgroup has no thread group leader to
> >    iterate, so writing to its cgroup.kill does nothing at all.
>
> ...
>
> > Case 1 can be fixed by using do_send_sig_info(..., PIDTYPE_TGID) instea=
d
> > of send_sig(), so that the signal is taken by a live thread even if the
> > task found by the iterator is exiting. Note it was pointed out by Eric
> > in [1] while reviewing v2 of cgroup.kill patchset, and v3 was meant to
> > switch to it, but the change was only made in cgroup_post_fork(),
> > leaving __cgroup_kill() with send_sig().
> >
> > Case 2 can only be fixed by iterating over all threads, so this is what
> > the fix also does. Once a thread group is being killed, its other
> > threads are skipped since they already have a fatal signal pending.
>
> ...
>
> > --- a/kernel/cgroup/cgroup.c
> > +++ b/kernel/cgroup/cgroup.c
> > @@ -4289,7 +4289,7 @@ static void __cgroup_kill(struct cgroup *cgrp)
> >       cgrp->kill_seq++;
> >       spin_unlock_irq(&css_set_lock);
> >
> > -     css_task_iter_start(&cgrp->self, CSS_TASK_ITER_PROCS | CSS_TASK_I=
TER_THREADED, &it);
> > +     css_task_iter_start(&cgrp->self, CSS_TASK_ITER_THREADED, &it);
>
> I guess this change alone is enough to fix both problems?

Correct; my initial version only had this change, and it fixes
both issues.

>
> But even if I am right,
>
> > @@ -4299,7 +4299,7 @@ static void __cgroup_kill(struct cgroup *cgrp)
> >               if (__fatal_signal_pending(task))
> >                       continue;
> >
> > -             send_sig(SIGKILL, task, 0);
> > +             do_send_sig_info(SIGKILL, SEND_SIG_NOINFO, task, PIDTYPE_=
TGID);
>
> I agree that do_send_sig_info(PIDTYPE_TGID) makes more sense.

Indeed, I added it for "making sense" (rather than for fixing the
issue) after reading through the initial cgroup.kill patchset reviews.
Eric flagged both places in v2, but only one was fixed in v3.

>
> Acked-by: Oleg Nesterov <oleg@redhat.com>
>
>
> Either way, I am not sure about SEND_SIG_NOINFO. Perhaps __cgroup_kill()
> should use SEND_SIG_PRIV? I dunno.
>
> Oleg.
>

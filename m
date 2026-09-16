Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8954FC8C0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567206; cv=pass; b=MkSN68JXEwg39jSWfv5PRhg37s8RpSyXO4wk583K1grXj7obvl/eoburuGkiceGkau52/fPc6cql8vu4E7ucFlM8MfmDCjsEZa3xdVSmm7JKzQLCYISHtr3X2TtGtPHiwDpP1yTnyOl2hPFQU7vGaHVZamHEi4b/XUW598J52VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567206; c=relaxed/simple;
	bh=Lo5m+5XbgBq5KlhQKWJHjSfUKAPx93SJbpxEjeKi29o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nW8xb5Y/CUcNg2rc3is/UJDUOGlDCOgp5xbsZ9Y5xyi2/SKtsXM0uoj8Hn8LOQAl7P4asCPv+ewfzExiFJ3jRKCJ2YdTIHJmHV8J/he8YDw94egQnLqfOQwmo3UBwAixQN2BvlVK6jdrVIvGX7LD6ASYi1o4lZa3i2Vq38HwcVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn2qniEh; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn2qniEh"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91064d2d54fso7823916d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789567204; cv=none;
        d=google.com; s=arc-20260327;
        b=TtAol8J4aQXHG6PsntetW0vBlUNVnRp21nN1DHfuaj4GV9DZfrQqBfzb6oDzslHFpZ
         xVigfanHLiYR/4H6hP9bBh8SdJE8J7Dxcp7XayilTqbmS5otBvwXdW3n0StCsn37Il+8
         bPyzseZyx7yQzrz760Q4CE5zqUdDl2zijqoZF736N89oH5DAHgdlqGTU3Ft7+r6LA7wB
         49m96HueD+nvVg5x6EWBdy/B3DkBs1jw4QNHoG5PogwUlLZCalLy+1evukLEWU623jiL
         mxCtGhxTz5rt1Nsx5/LtyPEpU4KPCa/xtyNQF6+X8RzziR7h6fsTE9wV3uwPZJE4klwg
         +4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+a9lIvcGaqBqdyOLmYx45wqcMm+lGY50sdj07F25cCc=;
        fh=Is7aXeMVphBeym3Y3cGIFyl9OrK4DAx53/kyL3yQ8pM=;
        b=WJGxj3TzQfiAdv/bqXvOtrQ1NwlUefqJc0V6lgK6CEKxhXUmdr1bqA08ieP6KS5Xus
         dHOuZQ10rKsWlRd8lNlkf2o2utA+05f5w0hFBc/ZriAQnPC0i9CbvMvvovml/BUOxWsn
         Eh//r9ScjNveeLrGzI0xks5Q3BU38ho/XY66rAb31UcND2Nx5tDFh332WONG06rxrWAb
         cfBYnNveTetC7vbEsY69uYDELFqPA0Che0EtkBjt5JC7wtiN0b9qKEL5XFwCbLrXqXJR
         93JGTcaiXTg8LrOk8pltz0SlJsWcYReRt8NtC05o3kxos5abW/Vdcl36dn4VeeYkxXmV
         IJQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567204; x=1790172004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+a9lIvcGaqBqdyOLmYx45wqcMm+lGY50sdj07F25cCc=;
        b=dn2qniEh6yu9wMRNN9Q5DCbpoZbIsjWxO3TswWr0Fqd3XQB5i/nxHSBa3I14t0928J
         IuIwA2SEJqQvpUDkdZRTqDtU5LA9qAxJF/c5wfL/pDnS9auWRu+sebO8t0m5F8J6/M3l
         hX7Zapm1TpQqYhKZ/rOq243zT7qp+ahYdS9qfHgw16W9Mex6H9lqgLnlSw8vLNpaEvZG
         VQ0nXHnVzxXRTxCwmi9TlUO3C0sFJYUQWMXnTEfHz8Hxb3Bjr4ToWVRpuCOGWwd5/7AL
         Esl+d6eMpuSrLDvZQGfR/DVVzYDwewPPFgZN7ZOGYHqnH8hUvFx7/eVmW3QW2kwwp5NB
         +vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567204; x=1790172004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+a9lIvcGaqBqdyOLmYx45wqcMm+lGY50sdj07F25cCc=;
        b=ykJxaUAjflCnIn99DDUNSnElbXWFc7dDja0o968kSkFWUUK0z11gnynSQJyPsmUqkm
         qSvNHe8L4jVRNjSxGgfCpqe6uclnFcGd8NaZOC1oLYZo/IA5xmOgvbzbjfCngsjsKEku
         ZBvMZ2TycmKzEEvMRoTk9sOOOE0p0//LKPjknkNjH8W11RXyohNvnlYW4FpNe5dOd613
         VMmSquAgWv4EExlsRsXpl1+jMFwhUOz9IxJf5HdHIqSqI3vz8Lu3OcnXPkEnK8PMO5Ks
         pLBmGePoBb6mkQRQrpgsbQe5du0xl9+m1zI2TDtaXuDPb9tc6Ns6OCeM2cdDIuzdtNF9
         f/4Q==
X-Forwarded-Encrypted: i=1; AKwUvByd+J6UJ3ccRs99aMJ7euh20LqU9NEWtq/seuzdPqP7scKKkDCudCyj/6VP+QCeDqBZcMjJZEtAEhl1F44=@vger.kernel.org
X-Gm-Message-State: AFuF++nmS7n4o9qK3xhcsP8uRvA7YuosHZEBBN+/DlVCuAu7KVtsKYNP
	N1wN3PXLPfns5WaWqv1oWlz/tZocxTjeWID9cU9wdJrzdfOYdpU2T4WaImc8U1rF6I7Ylzo3D3H
	/fifh2MZlx57guj/F7tc16JBzMYaIdy8=
X-Gm-Gg: AYBFou1k3DRoe8LpgB7g8vMDDBRB8UCvWpxSwwXhvpkY4yvDFgxt+NG7pd5w5/AZ8xy
	fx+InQklkmLFyCTXQXo4rp5rQ/R7SFyktCLRbFgzW+PAAvX0QdCzimilN3ocYv38HQh4bpwSyLD
	gNMVMYUzCaqVsvEN5S5YQyIxrkMPPToOesLVDAUszgjvIjs8HQl5rwbhWfN6MJUdxmtw8B0ie7M
	haihc90Qw/d0EO2urhYyUM61U6m5rcyqCzP7/W0cpRSvJLahXdJF+5tCasoYRw/VU4KRt9S6tU0
	jMuX/rvaI1XSqJ4eeCw6u9BabKPvhgXvSKmHxaPUjGSHwU/F1rQSTni3pSebAxpgRVzibvP7f5u
	E5+/iZR8i+3+aMFoRMoZfQi4jgvEH3Nr6Xi3eLPLGshjhjxakBuuU7ZVyq70i+m7o8oh/Br0lD0
	vXy/ZnGw==
X-Received: by 2002:a05:6214:268f:b0:910:3e54:8934 with SMTP id
 6a1803df08f44-9123d7c9ce9mr51289856d6.35.1789567203991; Wed, 16 Sep 2026
 07:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com> <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
In-Reply-To: <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Wed, 16 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1UH0LS5prZ4bk9c-WqdUi84HiceliEzveM4-BHB8J7JQJAMoI93JlxUlVA
Message-ID: <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> Hmmm.  Do you know where the unmount operation was getting stuck?  Was
> it the usb_gadget_unregister_driver() call inside dev_release()?  I just
> want to be sure about this.

In these reruns, I found that the unmount task was blocked in
synchronize_rcu_expedited(), called from namespace_unlock(), rather than
in usb_gadget_unregister_driver().

I reran the PWRITE callback tail test with both patches applied, using a
resident helper whose main thread invoked umount2() directly. A monitor
thread in the helper captured the blocked main thread's kernel stack. In
three runs from fresh boots, the relevant frames were:

    synchronize_rcu_expedited
    namespace_unlock
    path_umount
    __x64_sys_umount

In each of those three runs, the same umount2() call returned
successfully after I released the callback gate.

USB gadget request completion callbacks run with interrupts disabled, and
interrupt-disabled regions act as implicit RCU read-side critical
sections. The observed wait is therefore consistent with the diagnostic
gate delaying completion of the expedited grace period.

I also added diagnostic markers around dev_release() and
usb_gadget_unregister_driver(). The test harness signaled the resident
helper only after the reproducer had closed ep0. In five clean runs from
fresh boots with these markers, both usb_gadget_unregister_driver() and
dev_release() had returned before the resident helper invoked umount2(),
while ep_aio_complete() was still held immediately after
iocb->ki_complete().

The diagnostic gate used a bounded loop that did not sleep in the
dummy_hcd completion context. In three control runs with that gate
disabled, umount2() returned successfully without the prolonged wait seen
in the gated runs. The blocked task's stack identifies the wait point,
while the markers show that both usb_gadget_unregister_driver() and
dev_release() had already returned.

Thank you for asking me to verify this.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 1:01, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 14, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the revised patch.
> >
> > Following your explanation, I focused this round of testing on how the
> > revised patch handles module lifetime.
> >
> > I applied your first patch followed by this revised second patch to
> > upstream v7.2-rc1, commit
> > dc59e4fea9d83f03bad6bddf3fa2e52491777482, using
> > CONFIG_USB_GADGETFS=3Dm for the runtime tests.
>
> ...
>
> > I also held ep_aio_complete() immediately after iocb->ki_complete() on
> > the PWRITE path that does not queue copy_work. In two runs, each starti=
ng
> > from a fresh boot, after the reproducer consumed the AIO completion eve=
nt
> > and closed all GadgetFS descriptors, unmount remained pending, at least
> > one concurrent delete_module() attempt failed with errno set to
> > EWOULDBLOCK, and gadgetfs_cleanup() did not begin while the callback ta=
il
> > was held. After I released the gate, the callback returned, unmount
> > completed, and module removal succeeded.
>
> Hmmm.  Do you know where the unmount operation was getting stuck?  Was
> it the usb_gadget_unregister_driver() call inside dev_release()?  I just
> want to be sure about this.
>
> > In another cancellation test, both unlink_work and copy_work were
> > outstanding on gadgetfs_wq when rmmod entered destroy_workqueue().
> > Releasing unlink_work alone did not allow cleanup to return; it returne=
d
> > only after I released copy_work.
> >
> > Using the GadgetFS source with both patches applied and without the
> > diagnostic gates or markers, I reran the original NULL pointer derefere=
nce
> > and UAF reproducers and the relevant AIO cancellation, payload, teardow=
n,
> > CPU hotplug, rebind, module reload, and partial read stress tests. All
> > completed with the expected results and without a KASAN report, Oops, o=
r
> > LOCKDEP warning.
> >
> > In these x86-64 QEMU and dummy_hcd tests, module cleanup did not begin =
while
> > a callback still had work to publish, and destroy_workqueue() waited fo=
r the
> > remaining GadgetFS AIO work once module cleanup began. I did not find a=
 new
> > failure attributable to the revised second patch in these tests.
>
> That all sounds very good.
>
> > Thank you for examining this issue with such care and for the time and
> > effort you have devoted to it.
>
> And the same to you.
>
> Alan Stern

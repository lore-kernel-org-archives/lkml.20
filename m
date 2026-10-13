Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58969402BB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904712; cv=pass; b=AhbNkv+l1iCNWC78/ubg9tIVKHvB8nUr1yajzjNTkoFwExAPvH0j421wI8TEWTFLXJAILvFcWRmaL1bC5+fQm8opOSwqZQSFAPPTs5J0jnqr6vZumWIN1oQMjdWoS+RDOxn9/EkuQrcSZkD6a2VwXUGV4tqMT5dg7hTcnWMSLqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904712; c=relaxed/simple;
	bh=2Jsv0BRyroaUKtuN9tRNv/ahrTnvXTbR+DCRXc0RRpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSPtHBu15L/V+SvpFenWvP+WMNXfyREpNn9XWOYsICvyceNkVutDI3H6396ycZx+U3smUHdErE7qC33+Y4wlwgsfNM9zrT0SQyQItLpiEcUQqFfg1Ys/1GgjhvSIY5ZNHGtignzon8A001wzkRX8heyLErd/fL2ViY0NmnGXkak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uk3EQRUt; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uk3EQRUt"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso4454308a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904708; cv=none;
        d=google.com; s=arc-20260327;
        b=X4rkhN6HLQece6B7q91KZu1xySZQ68X09LsuvGndN0jFh3PyZlmfqmmiy6+2l0/n/9
         xq0AjemOt03o3FAACSh6ItteooqJAIYvRGOH1uBhTix/JRZy9CsxzUxj1nQa84ZOYLDa
         rStaafhSu85r5m7JO9a6S5/ih53vaogsbIgMGc28vvJiljxfY0un1eqJvGrJfUXLoISi
         i4JheSdf8kTRyLrUgsjPOaG1VVnwuxKQYHFmLSPaFluHU4WrFURmd8qTr+PFmLz/Tvmn
         DIu0+i11cu6F6cpmwt2Ykw9VRY0dFMCrlra3Q0hTYvvZRIkQxp4AMB5wNOla8JFvb6as
         1fBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HrZGfo4B3q/8yAdpMVlc+nHzdjT6I3tMHvhHHXxorTE=;
        fh=0SeqG9qqQ8ARPkCpS00dSinOriFsdnTNEsA/ic4m6Cw=;
        b=WwlvkoCyGkU36PWGzZuNyQvAF9Q7tfoc02f7gJj8vrnK6USMM/oqwqaqWAXI70x7uG
         Z+FnAqc+sKu8LvsdmOynL8vq8MJLHLF0Et02CCIECByiDFcpLQZwuS/VUA1Osxae4bW4
         Nlh3WFCQbE1ugq7u/ZvqW8wbaLsQ0M1ilI9c/xKv+rzzWbthuUUGT2x9e/8TW6A/D1TD
         +TM5jnbR/UZ07CNUhyO3mPc8Iq9CnblhbjrTmxprtkZ59Lx+x+oxuLSwEmSUFYzN5lSf
         gHNgHmk1Ci2V2sjH+yXxsnzMmglPfFV7zt4Gb7dsNPHxfn7VgEyMdNNmgbCVUh8iyy5t
         vcwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791904708; x=1792509508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrZGfo4B3q/8yAdpMVlc+nHzdjT6I3tMHvhHHXxorTE=;
        b=Uk3EQRUt2qhbIynIH1qaZtGrEn8e4wWjtrGBk9bucv3sxY+jgmZewoxVhorGjIOnkv
         LRjQ+qq+uK0NK9qT7Zn2TKJxtI8zEonBWzdT+LnqIxuZ57Z6tITF7NRUFqMYU/SWzItM
         6pnCe3pU37ayib+g9L0BGlM1iiVS/dcG6KhiEwXVHACWPquv34m04J2TOdhT5dBPfiPL
         ZoYjKTYe8K6o0Yn1vPeeIH6XPC10UfxanvRYJMtBIzhAIBdyxsV2N6L/pPXeeFB2JaLc
         zpZywQHfe/QiDBVgWCNiuCX5+dMH+uDzowc2VRmpzdO2YqE3SsbTK+WFN7LRAkXOhQiT
         cl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904708; x=1792509508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HrZGfo4B3q/8yAdpMVlc+nHzdjT6I3tMHvhHHXxorTE=;
        b=smLuHuTeVNiglfi4+Hn4sofkL3hhsLRZT0YbkrJ8em1dW2tIR1XVwoM21yM6EsBmcO
         4XlOmh6rnCGhgYZqQ5HdDjgzqDXVu6oj1/w9jHavhPlCSEukOfssCs6N4bdCuvAN/LEB
         JgCi8nuVcBB+PzZ0B4mn3ms0rGA+lLiWltjIgc6vrJMMk6THEu5w8upwDd0bBQFC5d1g
         wiVhYLDEc7uErXhau7q1Zau/FAxCvVutMvnJwCHXPFospi22f0Dn0wacg3MpZijpQQYw
         7jh0KcR3qIDaSH2YsRYYcbscYFAAivFdFVrElZLRDvIM0Yzqu1b04oWWl042NeC0JYvD
         VfPw==
X-Forwarded-Encrypted: i=1; AKwUvByKLPzYvCcxzS4VqRvSR6aSarv0g3RdLGZo4fIVI/9+7LYcOwvz4r6tYpUeIe8QBUKKOrclueypHLuiM38=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0ST6ejiI9fjQl8mgnId8v7QqgQ7UhUZratEhwPTIYG/xTBxzD
	5hdMWszCkfs7JeDwq/pL0suYAv4F6coQMNzag+I/SUAHvCedxPjL+wjfPXfeM8Q4XX8ZTsCewif
	C+qMJx74Tmzcr1qyG/SYWlju9mijg0KSspVIcQnBVsA==
X-Gm-Gg: AYBFou1G49PeWG5whIawHTzh6HJ4bjG20NADxc+eZi6E1LVVtW/auHh1pNNZLOtpUyk
	fpoF3VEFTM3i0q8IiQRolUvbKtcF2G7ENEeeAorqRT3I9D1MlSACkZCP5mXFX2tXvq6GT5cdXdu
	AsgAkzQe0S5gwl9xq27sOp8T8hjwrI/YICQSU8/yPm9XMLVWBd/SLgM7W5SiY6QnIsbHqm9DlZe
	SLWF4H3wLdi5AONDLfZHwVU5awxRzupach7jjDPr6GvdkaVQ9pl3eGeuWzhTY4lCKerzuG6kjnr
	dS7MP/hByL4SnHONIIcV6WVVgqrTu9QnQjJNV+9oZTFqKodFGIpYAT6dXyikwuBx4C2EWj0LBGy
	by9BRlEo46JcevGRzNsW2Ia75
X-Received: by 2002:a05:6402:a0d3:b0:6b1:c49c:c0d with SMTP id
 4fb4d7f45d1cf-6b1c49c109fmr4178015a12.27.1791904708391; Tue, 13 Oct 2026
 08:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929075453.2324597-1-hyz3367@gmail.com> <20261013140721.fbmsl2xn4xi5ljn6@gmail.com>
In-Reply-To: <20261013140721.fbmsl2xn4xi5ljn6@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Oct 2026 09:18:16 -0600
X-Gm-Features: AclHuK-NLU3gQe10W-ZbOyAwC_kGN7Z8CPvZmyr5136BNSmzjxHJLWY65oGxuIU
Message-ID: <CANLsYkyvF9Z_7uFJ9Z-8cXV9RbX+mQthKOKcuCCj+ps7L3vBNw@mail.gmail.com>
Subject: Re: [PATCH 0/4] remoteproc: core: Fix the error unwind paths
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 08:09, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> On Tue, Sep 29, 2026 at 03:54:49PM +0800, Yonghao Zhang wrote:
>
> Hi Mathieu,
>
> Gentle ping on this series: it makes rproc_free_vring() reset freed
> vring entries to FW_RSC_ADDR_ANY, guards the error-path stop() call
> in rproc_start() against implementations without stop(), rolls a
> failed attach back with detach() when available, and releases the
> resources and power references left behind by a failed recovery.
>
> Happy to provide anything else you need.

Your patchset is in my queue for review.  Unfortunately there is some
backlog caused by remoteproc/virtio patches that needed more time to
review and attending Linux Plumbers last week.

>
> Thanks,
> Yonghao
>
> > The remoteproc core unwinds failed boots, failed attaches and failed
> > recoveries in a handful of places, and those paths have drifted over
> > the years: an unconditional stop() here, a missing cleanup there, a
> > reset value a running remote processor could misread.  This series
> > fixes four of them.  The success paths are untouched, and no in-tree
> > driver changes behaviour when nothing fails.
> >
> > The single-sided ops configuration that two of the patches guard
> > against is not hypothetical.  Version 9 of the TI k3 refactor series
> > briefly introduced it [1]: ti_k3_dsp registered in IPC-only mode
> > with start() kept and stop() cleared, on the reasoning that
> > rproc_attach() never invokes start().  The shape sat on the list for
> > a month before the rework that finally landed removed the ops
> > overrides altogether (commit 41d746b3423a ("remoteproc: k3-dsp: Don't
> > override rproc ops in IPC-only mode")).  The point stands: nothing in
> > the core would have caught the intermediate version, and a driver
> > sent today with the same single-sided ops would pass rproc_validate()
> > just the same.
> >
> > Patch 3 mostly benefits the attach-on-recovery users (imx_rproc when
> > the Mcore resource is owned by another partition, xlnx_r5 when the
> > RPU is already running firmware): since attach recovery was introduced
> > (commit ba194232edc0 ("remoteproc: Support attach recovery after rproc
> > crash")), a failed re-attach was unwound with an unconditional
> > ops->stop() -- powering off a processor which, per the feature's own
> > contract, "does not need help from Linux to recover... Linux just needs
> > to attach", and which zynqmp_r5_rproc_stop() would additionally flip out
> > of attach recovery mode by clearing the feature bit.  With the unwind
> > detaching instead, the processor keeps running under its original owner
> > and the next attempt attaches again; attach()/detach() stay paired
> > one-to-one with the attach() calls that succeeded.
> >
> >  - 1/4: rproc_free_vring() writes FW_RSC_ADDR_ANY rather than 0 into
> >    a freed vring entry, for the callers that reach it while the
> >    remote processor is running and the reset lands in the installed
> >    resource table.
> >  - 2/4: rproc_start() no longer calls stop() unguarded when it
> >    unrolls a failed subdevice registration.
> >  - 3/4: __rproc_attach() rolls a failed attach back with detach()
> >    when available, keeping the resource table accounting and the
> >    state consistent, instead of unconditionally stopping a processor
> >    that was started by another entity.
> >  - 4/4: a failed recovery releases the resources of the boot it was
> >    trying to restore and voids the power count, which nothing else
> >    can drain once the processor is offline or detached.
> >
> > Testing: on an Allwinner T153 (sun8iw22) with an E907 remote core,
> > driven by an out-of-tree platform driver for the Allwinner remoteproc
> > hardware.
> >
> > The error paths of patches 1 and 3 were hit on this hardware rather
> > than constructed.  During development, a subdevice registration
> > failure during rproc_attach(), unwound by an intermediate version
> > that called detach() without the resource table reset, left the
> > freed vring entries at da 0 in the installed table: the next
> > rproc_attach() failed in rproc_check_carveout_da(), called from
> > rproc_alloc_vring(), with "Registered carveout doesn't fit da request"
> > That trace motivated the reset bookkeeping of patch 3 and the
> > FW_RSC_ADDR_ANY reset value of patch 1; with the series applied, a
> > failed attach can simply be retried.
> >
> > The failure path of patch 4 was exercised by renaming the firmware
> > file once the processor was up and then crashing the remote core:
> > recovery fails in request_firmware() as expected, and after the
> > file is restored the next rproc_boot() performs a real new boot
> > instead of silently returning success on the stale power count,
> > with no "already associated to resource table" leftovers from the
> > failed recovery.
> >
> > [1] [PATCH v9 17/26] remoteproc: k3: Refactor .start rproc ops into
> >     common driver, 2025-03-17:
> >     https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/
> >
> > Yonghao Zhang (4):
> >   remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
> >   remoteproc: core: Guard against a missing stop() in rproc_start()
> >   remoteproc: core: Roll a failed attach back with detach() when
> >     available
> >   remoteproc: core: Clean up after a failed recovery
> >
> >  drivers/remoteproc/remoteproc_core.c | 144 +++++++++++++++++++++++----
> >  1 file changed, 127 insertions(+), 17 deletions(-)
> >
> >
> > base-commit: 586a2fadadb160295a93e5d5d32db1a2558a4d3f
> > --
> > 2.34.1
> >

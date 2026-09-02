Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C45D3346BE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359435; cv=pass; b=HjiZqiQsPzYzFQ0qPZSFrZrRvWv98cPv2+XPVp5tyIbI5idy+ldJhW/F7w23wX7z2W6bgFzn0sGOnO0lsaS8iDuOzJAeo053jHy3IUhJ2csiEj/dzLkS7CGDbR3aEtfAR9fdjFxaQySpQWTIBXKaVztU3rZ+jOLhHgIgQ2rSLDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359435; c=relaxed/simple;
	bh=3vIL+Zi9cI5K4ONG+fTKiBTXtBVCBvQbed3WtggRMeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJono6BJfS8vkZLb6RvitlzwaMpdni47li2RVi/L2FOltPsqMaAlaHFT/ITsq4PkVb8w87UXri0GDOABoZ919bJoErWmm011mIsffGWHzW0ooWe6ML8gnxAqpvokWlZNjGjo2zKOy9/mIoutzA6/T2kazIE0jNPc9cEG6H7j/YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YECIzG4s; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWwyeerG; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YECIzG4s";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jWwyeerG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788359432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuuBPIWKXppe0fjH2ufB4IcRL908RTVx6ajLWwRfcv4=;
	b=YECIzG4sDaqfGi1x4bYBwFzpInfvRDePcNtS1NaJzU/gl9P/ntAp0hgMxjjdrzCGsH4Djq
	ayz1mS3As+vUsnw1ZdWPf53S/7TDFlEcQ76vRAXBnklVfH88XSz+wXLdSdQ5aE6ozwEafl
	9JO4diFvpRuXCboj/rAT6HKXwFeA1no=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-hwSp7ugPMvGfDsT7LIjHEg-1; Wed, 02 Sep 2026 10:30:31 -0400
X-MC-Unique: hwSp7ugPMvGfDsT7LIjHEg-1
X-Mimecast-MFC-AGG-ID: hwSp7ugPMvGfDsT7LIjHEg_1788359429
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a10378df3bso6464331fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788359429; cv=none;
        d=google.com; s=arc-20260327;
        b=In4AYnFSdYZ7HWQLOskntUMz1WM8f3LUm1Vk5HJNMHXS6PuC7qTI1aUETQ+75kGRFN
         Kz5yYChiJqdq4QL0ERzdTNTGyR+gyJl1oeLVn7NUC2dTYKZWCo/tOPTVxJzrwAGwf5ST
         OhxXJCFNee7RKcOqifLDI2hcl7FTE6k3j74rxpnTwszTwbQFvZhMtZuO3q564Cue6AkX
         vWGFv4RHI/cKVGq9vgofflZzMTeUQgMiCOMHOGexab8wk4UuKgk95nqYtz8UrY+Wrkyn
         MJOQKB5M3PGwRQZaYD2mGrVm6ITnVGTGuE+p9vAMTjwj3YKj6RWeMNyH10e8vYX/vDZU
         ZALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuuBPIWKXppe0fjH2ufB4IcRL908RTVx6ajLWwRfcv4=;
        fh=M0LzjrfkQObcSI8y65Xdm8xokJjdpXn2mJSfn3AzAos=;
        b=f8b/qvAS/gPsjjS3I1UBdFKl+LwBMpheYWFPu64zjowRfrBIPxFLC8Z6CIYI7+vYXz
         wGQGx73VTjdNV9IbpGnFDw5H/GVTO7yJEEhpZpJ4uaz/RBnWYbBqTZxfCdQciLYuNHBT
         s/mizEJupQv9F09ih53UtU36Fm9kDUd54PG+gqD82nwczjjJ382EjcWRRh5hrBd1VEIE
         xYOBgmWbhJIjWP1gL4lm/4Cauq1R9HAAj/paZDB7jT/k+suZervsSfAiYdhM+Du+g9HL
         SmJ650QR3rGWME/psdLGEkt4Z2zaYpr0dIjBJrRLFJ8WUeJxnKvmXLXJYZmqJskNXvjF
         IY1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788359429; x=1788964229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wuuBPIWKXppe0fjH2ufB4IcRL908RTVx6ajLWwRfcv4=;
        b=jWwyeerG7xnt/hfg9bxtyu98ZfZULngMJPi/6wI3g48CjqnojOduM8PPy0xRWAoDdT
         e+/91vrgg9srazNCXb+b0sluPBJKibPOhK8XSssHOtBZ2F799p7gdfzyv1IFOrDAjTCW
         4E1B2bZzZrfGKBKrTNhhlsF7nUFiXys5yhx1f4IX9tqV9YHU1HwGbxPAEuuwSvazukzB
         dHPN6NZz/JV9wWd56AE0UqFzdhtX9doCuH7ZLDSJt6P2RhK8PfjSOPer+jqaRzvGmiVV
         KDl0/e6FXDhqVbfclrMe34xTUjWaPmzQu+/XB8DSZzvXzxWlI58Ti/92k/p7BGhbITt3
         SVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359429; x=1788964229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuuBPIWKXppe0fjH2ufB4IcRL908RTVx6ajLWwRfcv4=;
        b=KLvUt+wLB3a93+FnPS/sZdS4GfCfgCvlYCQqcC4hbSfOVhzRhN5SfJACHARTfpJWHi
         H/e7T76++ngdsd+CZc76UVc/GblcwIlmqP3rGocurWzbx1TLePYepFY6FwyDVOHiKNrR
         a4sUkemxRY2+kIBfjsGCGN5ZX8DeFihImNv8mvKuL+X6R8RQdAuTBkz5HLosjPCXyzLR
         /jpcBV963BQvWBezMYy80pvGxjDNOlvIrFj0zS3n3ffUPjtk5b3AYaeIOJx0LtU5uwx/
         O5Otpt3QpSp54j3LvDNXdimMVSLL+PgXewguC9uukwhrrM5RBxuWJ0ikL4QCbmKUU6u9
         Kqlg==
X-Forwarded-Encrypted: i=1; AKwUvBxLU5cQJnIB1D7OrHOiRfmjesYah/H+hctM2Pm2v4Ac/QS2EM9ceLmFgMKrFgo4KFYGkYkZQgi/nvIl8X0=@vger.kernel.org
X-Gm-Message-State: AFuF++lVIXvChP43lLHuHzMyvQvMislI8VCOtMiYzV5W7S3ST0OoLo7W
	RlLjgfoEMxTLcNYyFVYJLu+oflsmRKgXwyU9ZbjZtl7DGU3Q8aIGIasIrsgG9m2hj7XRlvLgR9d
	ynIjp1cauyTRjn1/NuAJKDYfnyR9MWMUshhVKOb49CCRP/TIeMUAPmZh9Q2uiTKxRfONhRFA+Og
	xXxKQn6/oqicR7o3vIlLSu5RFQ0WvqoDl13Zpgi0Kk
X-Gm-Gg: AYBFou2OO1a5VpiF+cZzOW6KwVjJbH4TsLqBdf1onk1PoWPm/ETAs61AwrM6RAAhssQ
	Y0DfUijHQsM3x5407G9C0CdEhsdLELlAX9muCUtST/EEZVnfWWUJaq6ZQx5F1xMvk99mUSqFw8M
	X/t+20eU0IkwezyNZbW0Oz5IzuacUQuelPSILcmUr07pW0xXRKXeCzN3DA
X-Received: by 2002:a05:651c:a10a:20b0:3a3:10fb:e174 with SMTP id 38308e7fff4ca-3a34fd9cd13mr8404511fa.12.1788359429351;
        Wed, 02 Sep 2026 07:30:29 -0700 (PDT)
X-Received: by 2002:a05:651c:a10a:20b0:3a3:10fb:e174 with SMTP id
 38308e7fff4ca-3a34fd9cd13mr8404391fa.12.1788359428932; Wed, 02 Sep 2026
 07:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091836.16906-1-qiang.zhang@linux.dev> <CAK-6q+jFXsZpWHrm0CSa8Tr+P3qHDmWVQA+9stXViyUf48CuvA@mail.gmail.com>
 <b530646295a64f5e1cec5bfec5064f1fc79d3d9d@linux.dev>
In-Reply-To: <b530646295a64f5e1cec5bfec5064f1fc79d3d9d@linux.dev>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 2 Sep 2026 10:30:15 -0400
X-Gm-Features: AcwNN1XyQQYH9ZucUvyr7upwsRM1Mjh1-Yp-CdGPc_PFgcogBJd27y1L4kMmbKk
Message-ID: <CAK-6q+hr12xynik0e5sm_s2z_W31F3X1rSovxHJ8R-4f42tSpQ@mail.gmail.com>
Subject: Re: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in
 exit paths
To: Zqiang <qiang.zhang@linux.dev>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 2, 2026 at 10:16=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> >
> > Hi,
> >
> > On Tue, Sep 1, 2026 at 5:19 AM Zqiang <qiang.zhang@linux.dev> wrote:
> >
> > >
> > > The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
> > >  srcu protected connection and node hash tables and hand each
> > >  element to call_srcu() for deferred freeing (connection_release()
> > >  and midcomms_node_release()). call_srcu() is asynchronous: the
> > >  callbacks are invoked only after an SRCU grace period, which may
> > >  happen after the exit function has already returned.
> > >
> > >  These exit functions are reached from exit_dlm() on module unload.
> > >  Once they return, module teardown continues and the module text
> > >  may be unloaded while call_srcu() callbacks are still pending. When
> > >  such a callback finally runs, it executes freed module code and
> > >  touches the static SRCU domains that are being torn down, resulting
> > >  in a use-after-free.
> > >
> > I thought again about this and in my opinion this is not possible as
> > it is already being handled by DEFINE_STATIC_SRCU() with a cleanup
> > handling when the module is unloaded.
>
> When the moudle unload, the srcu_module_going() will call cleanup_srcu_st=
ruct()
> and free_percpu(ssp->sda) to release resource. but we not call srcu_barri=
er(),
> the srcu_barrier() should be called before cleanup_srcu_struct().
>
>
> > I know that srcu subsystem does a lot of magic with modules init/exit
> > functionality to call init_srcu_struct() and cleanup_srcu_struct().
> > See
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/kernel/module/main.c?h=3Dv7.3-rc1#n2711
> >
> > so this patch should be reverted. If they don't use a barrier there,
> > the fix should be in the SRCU subsystem, but I believe the current
> > SRCU implementation already handles this.
>
> The srcu_barrier() need to be called, there are some description
> from Documentation/RCU/rcubarrier.rst:
>
> rcu_barrier()
> -------------
>
> This situation can be handled by the rcu_barrier() primitive.  Rather
> than waiting for a grace period to elapse, rcu_barrier() waits for all
> outstanding RCU callbacks to complete.  Please note that rcu_barrier()
> does **not** imply synchronize_rcu(), in particular, if there are no RCU
> callbacks queued anywhere, rcu_barrier() is within its rights to return
> immediately, without waiting for anything, let alone a grace period.
>
> Pseudo-code using rcu_barrier() is as follows:
>
>    1. Prevent any new RCU callbacks from being posted.
>    2. Execute rcu_barrier().
>    3. Allow the module to be unloaded.
>
> There is also an srcu_barrier() function for SRCU, and you of course
> must match the flavor of srcu_barrier() with that of call_srcu().
> If your module uses multiple srcu_struct structures, then it must also
> use multiple invocations of srcu_barrier() when unloading that module.
> For example, if it uses call_rcu(), call_srcu() on srcu_struct_1, and
> call_srcu() on srcu_struct_2, then the following three lines of code
> will be required when unloading::
>
>   1  rcu_barrier();
>   2  srcu_barrier(&srcu_struct_1);
>   3  srcu_barrier(&srcu_struct_2);
> ....

yes, I can see this makes problems when there is kmem_cache involved
and you need to be sure it's being done before you destroy the
kmem_cache.

This is not the case here.

I looked more into srcu functionality "cleanup_srcu_struct()"
(srcutiny) and it does "flush_work(&ssp->srcu_work)", workfn is
"srcu_drive_gp()" and the comment states "Workqueue handler to drive
one grace period and invoke any callbacks that become ready as a
result."

In my opinion "cleanup_srcu_struct()" should be sure there are no
pending operations.

- Alex


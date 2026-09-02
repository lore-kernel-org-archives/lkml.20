Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8E4A4414
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360550; cv=pass; b=PmzhJkdMRvWvJaAVhtr9yoXj6W7MaXf3Hgmr2uQ+4gdHMqHkVXq7/XK3VNt/5xUEBKedwe5hnhqYla4bo8NK014cX2Bs3Ek4Rjqok8LfFHP4h3kHxQIM/FSgcWFoT1KmEwxfIPa8AIAK4vj12poeVTTDOw0GdWEY/bkr8bbMHbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360550; c=relaxed/simple;
	bh=T+Fbm/zEO1JT4syG834Lukx0Oo/rqPXgi0S49eo8Hls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1aLCHKmec0+YjKsU0A82xl/6Fi3xpbY5bplP6Id/3vCYPyAbN8X8tJp6eNTVzp8NLBwZbckVT3tfEQer46BsYrMeZQ6eBsvFoyV4/21cUUh6HjbRpp4zUQtLQdwyG51H44N7xONDF2xA6VfwGh7vVpokQoo8yWz0T7wNSllkUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1SS9kBh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyU6puYF; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1SS9kBh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyU6puYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788360546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZM0PDfVUjjwLjTZVTYLBQV+0Mf1xQqcsXt17+bwkLQ=;
	b=X1SS9kBhNsn4BTpS+RwVnWjsmhVTcPAS9zJ6N4kB092ujbnCiOpJNpdYZGMexY/MbYl6+P
	JHRGNRIafQs6L2WeSwjnpCGwMsWB682tSl4NTq/6+ncoFBqkBOeK+YzgaYhP34Gz0VUGSp
	e7rADsA+8FM0ywYa0bGR3kxqU4D4350=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-SMjGhFg7MYOTaAS_vLApIw-1; Wed, 02 Sep 2026 10:49:05 -0400
X-MC-Unique: SMjGhFg7MYOTaAS_vLApIw-1
X-Mimecast-MFC-AGG-ID: SMjGhFg7MYOTaAS_vLApIw_1788360544
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39c9666682bso5093721fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788360544; cv=none;
        d=google.com; s=arc-20260327;
        b=JLlwb66/z22+l0fErdW6c0WZbpA4ySKIv2yAX8awaoK9TPO9AGpxyrk16KqbUnCeq/
         NCGt5zwJOSOath/Dht9it8ZHp+ZK+fzSBAzUTNe6BlUfrh9erhypToY9TW9PYPwpKsB8
         O4zcY54liAxl6zYxpWA4Smsr/IzrXuR8PdJmCsnyI4aHRlPTejRw2oPhQZkgiNqQs3jS
         3T1IYssEH+AcOrArnxuwhANttaFLpgnVsNr1IaCkzSpt4r7NmUlvKu0I2GA34BKYYQYJ
         FRcKAL8Z4YbjGGmaLcANybt1xDuQMjDoBugaVdjytztiD6vqt6iVKsAIsq4YnwMgFX0U
         kvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ZM0PDfVUjjwLjTZVTYLBQV+0Mf1xQqcsXt17+bwkLQ=;
        fh=N51U+sxIkgzkvpULkW56MilrxvNbVPfsqixo8CQ5e60=;
        b=KxZtBRaz0SIMhUBWOUKp21PJwE9ej7qfwEoaogH4NKokDH0W39ihlTQRPRUv241JOw
         vBur7vIZsKp7Ur3nTfaK68ENSpN8lBSnqk0utru8Evd8khjffaTqliGhHQwnxLzOj8u2
         VdFLp5NM2BRFMRmTmtmOifTo/dkhp/EBi7JJQs/Z4exOUjB4eqRoA/aHuhAVlzabzEJM
         MpXeG5ge9ONuo7sAK2xJrnrBWACyH1asQfoJf+Pv6/B4OSshf6NjkwRRG3jcToU/ePmq
         fa9Y44QG3JhXuOtIULjllDa9DtASmPAHcoWkSeARgTLAWFPHVJnng7GrHHcWQvMj12VI
         Nl0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788360544; x=1788965344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZM0PDfVUjjwLjTZVTYLBQV+0Mf1xQqcsXt17+bwkLQ=;
        b=KyU6puYFf76vOD026PSAmtn6gNFEbczrrwHFQm1DdHY7iwH//7ky6AcxcdS/q1AHb7
         HIO13Lgfy5xbBfv0FKjc4BhnCh5eYvGVMqOu4wwn07vFwEA2pin+oVvyP5uUAsCO5/+S
         5lNssqjNQh/qCwXVVqcYkW6c+T5FWZO0FiYosIKdy07R31ZPCujnEkOgs0H8NOlKJtiO
         uOUYd0QRdU77sgvjxMVQnF2kltmZdUomxWGqVBFwKOGNYpLlml0+eqyhqf5qgAk9amD4
         rom1/nVWDKgKT+66fVa9Wep95+LIU+oeoJ7q8ajQeRDytCtXCr+JDG8OITrs4lBl6fa1
         oIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360544; x=1788965344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZM0PDfVUjjwLjTZVTYLBQV+0Mf1xQqcsXt17+bwkLQ=;
        b=YfeTXD6BMFgEY1w+NbFWQiigQQHl34rHArGZHkQOkyZ6H6+jnsuLPQsI5rBPnomGy+
         u9/71ev9BmSmzYz7oUgnFv9bt6NXEnF9ZBH/+V8nkXf/AYY8KqU7L7Nn1nRpOBnjEo5w
         St4gVQ/IY6GDS2eEvmTbJz2mr1lY1Lja2cN0oZBQKAV2X16wlY6w9J2xvmtPeWG3N9WE
         j2zB155FA6s31V/ebQzZa+fJxoOnUDr0hqWDdDzafOT2UloY6XWZX+yBWUe+LjlZk9YY
         BzX40QxeSA5JX5f5eW58aoMnNkNIbaYgPykDJKAOG4fhQBTSS1xyVOe+UETW0bvkwp0L
         HO5g==
X-Forwarded-Encrypted: i=1; AKwUvBxOh2/ebysQgUw9nmTNXaqjjg9JGFa5Ip+zFMQZNvod7PVyEcfAdu2OVa742UURYsq/hn3OX3EyNTRWePg=@vger.kernel.org
X-Gm-Message-State: AFuF++mWkV83Dz0IIGmtN9vbZh4UJEEZcTB88YnLCj9jTsnZVS6cPoLM
	v0qWWVt3JDh6QyAhq/yIejJFJkRQdGkVPoV6edQOmP1WunR+bepwiYL4g4bJn6LAJYUTohfe0GW
	jVcuauK1yZpQacIh/jHfFpLVikwFUlunQBWWAHgB0PVzY2LgSys6exsA1LEkjQVBwQ7cQRBJfmJ
	SqZJS9/UNKXyK3BHFHmdSBEdCnkx+fvl07OMCZrUZJ
X-Gm-Gg: AYBFou22xSMcRIBUmr2nT5OgJcQ/MNakf505w3MSepq0VCDdaEpPvO4yXXbTq0OGPaj
	bRQlOvia90jZYnrKDD3XwMaVbklP5khCwKTJ/5u7QlIIBFNP3idYCYIvhhuPGhbziOjDDAqExui
	r+YzM+t2nrBMrZ4tR/K31AEHXoRY9DMiytr4AJ6bF7Nw1hYukrj2iQ75z0
X-Received: by 2002:a2e:bc09:0:b0:3a3:22f6:51a2 with SMTP id 38308e7fff4ca-3a34fdcd931mr10371871fa.12.1788360543683;
        Wed, 02 Sep 2026 07:49:03 -0700 (PDT)
X-Received: by 2002:a2e:bc09:0:b0:3a3:22f6:51a2 with SMTP id
 38308e7fff4ca-3a34fdcd931mr10371731fa.12.1788360543099; Wed, 02 Sep 2026
 07:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091836.16906-1-qiang.zhang@linux.dev> <CAK-6q+jFXsZpWHrm0CSa8Tr+P3qHDmWVQA+9stXViyUf48CuvA@mail.gmail.com>
 <b530646295a64f5e1cec5bfec5064f1fc79d3d9d@linux.dev> <CAK-6q+hr12xynik0e5sm_s2z_W31F3X1rSovxHJ8R-4f42tSpQ@mail.gmail.com>
In-Reply-To: <CAK-6q+hr12xynik0e5sm_s2z_W31F3X1rSovxHJ8R-4f42tSpQ@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 2 Sep 2026 10:48:51 -0400
X-Gm-Features: AcwNN1UnmnZcXkT_iAGs61hpMPGkMVj7f5nC8b5LfPIW9S94Qxf9J3t5mOd2D-U
Message-ID: <CAK-6q+gNbyFSOhZdA2z1J9SkTeGudgiux9-zgMMhtUP3LoUx1w@mail.gmail.com>
Subject: Re: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in
 exit paths
To: Zqiang <qiang.zhang@linux.dev>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 2, 2026 at 10:30=E2=80=AFAM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> Hi,
>
> On Wed, Sep 2, 2026 at 10:16=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wr=
ote:
> >
> > >
> > > Hi,
> > >
> > > On Tue, Sep 1, 2026 at 5:19 AM Zqiang <qiang.zhang@linux.dev> wrote:
> > >
> > > >
> > > > The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
> > > >  srcu protected connection and node hash tables and hand each
> > > >  element to call_srcu() for deferred freeing (connection_release()
> > > >  and midcomms_node_release()). call_srcu() is asynchronous: the
> > > >  callbacks are invoked only after an SRCU grace period, which may
> > > >  happen after the exit function has already returned.
> > > >
> > > >  These exit functions are reached from exit_dlm() on module unload.
> > > >  Once they return, module teardown continues and the module text
> > > >  may be unloaded while call_srcu() callbacks are still pending. Whe=
n
> > > >  such a callback finally runs, it executes freed module code and
> > > >  touches the static SRCU domains that are being torn down, resultin=
g
> > > >  in a use-after-free.
> > > >
> > > I thought again about this and in my opinion this is not possible as
> > > it is already being handled by DEFINE_STATIC_SRCU() with a cleanup
> > > handling when the module is unloaded.
> >
> > When the moudle unload, the srcu_module_going() will call cleanup_srcu_=
struct()
> > and free_percpu(ssp->sda) to release resource. but we not call srcu_bar=
rier(),
> > the srcu_barrier() should be called before cleanup_srcu_struct().
> >
> >
> > > I know that srcu subsystem does a lot of magic with modules init/exit
> > > functionality to call init_srcu_struct() and cleanup_srcu_struct().
> > > See
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/kernel/module/main.c?h=3Dv7.3-rc1#n2711
> > >
> > > so this patch should be reverted. If they don't use a barrier there,
> > > the fix should be in the SRCU subsystem, but I believe the current
> > > SRCU implementation already handles this.
> >
> > The srcu_barrier() need to be called, there are some description
> > from Documentation/RCU/rcubarrier.rst:
> >
> > rcu_barrier()
> > -------------
> >
> > This situation can be handled by the rcu_barrier() primitive.  Rather
> > than waiting for a grace period to elapse, rcu_barrier() waits for all
> > outstanding RCU callbacks to complete.  Please note that rcu_barrier()
> > does **not** imply synchronize_rcu(), in particular, if there are no RC=
U
> > callbacks queued anywhere, rcu_barrier() is within its rights to return
> > immediately, without waiting for anything, let alone a grace period.
> >
> > Pseudo-code using rcu_barrier() is as follows:
> >
> >    1. Prevent any new RCU callbacks from being posted.
> >    2. Execute rcu_barrier().
> >    3. Allow the module to be unloaded.
> >
> > There is also an srcu_barrier() function for SRCU, and you of course
> > must match the flavor of srcu_barrier() with that of call_srcu().
> > If your module uses multiple srcu_struct structures, then it must also
> > use multiple invocations of srcu_barrier() when unloading that module.
> > For example, if it uses call_rcu(), call_srcu() on srcu_struct_1, and
> > call_srcu() on srcu_struct_2, then the following three lines of code
> > will be required when unloading::
> >
> >   1  rcu_barrier();
> >   2  srcu_barrier(&srcu_struct_1);
> >   3  srcu_barrier(&srcu_struct_2);
> > ....
>
> yes, I can see this makes problems when there is kmem_cache involved
> and you need to be sure it's being done before you destroy the
> kmem_cache.
>

okay, it can be the case for "nodes_srcu" but with the argumentation
it can release memory being used by kmem_cache that is being destroyed
later.

- Alex


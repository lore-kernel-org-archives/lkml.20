Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EDE3ADBB4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038022; cv=none; b=I8mEqH7x++R7n2cDVdNiLbY4EHiNU0Iw54iROQrqMTmrKz7j5Lj0EmVgozpBzZ7MXQz4lBYGvz+GuBB4lQbP7D5JM66G2STj+LPb+HNvlXxED0gwjyOp5OPmPiQY62/3nME7WbW7PHAt0OA8qRryBie/6CJ94NddVgFViJ9a6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038022; c=relaxed/simple;
	bh=6RFhPb2Gk9DDHKHVFOt9AK05WlI14WyvLEfFiplc+p4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUnXBdkP0jNmvr/Zn3rF8Mk4zlBocsgEn8seZ2Hy87h02Ek3AYqffpLwKNAUK4XmiwdTyaAZCANtlyw23DWV3MMwhOLgo1hiNIip/uf8/x8smkwMZflqacPDZtb/dZl3Q2qYbcC2W17ijknYsZKbR+gMpVo83aRkb+twom+gHWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2CGcStl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2CGcStl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso10904925e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038019; x=1789642819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDAmMcZxhMshZjhoUDkLHyRQSZBqRjdcOge6fnAnEeQ=;
        b=J2CGcStlQMHyri424InUIsHMnqz4LD8FVOhrV8v4cbh1852AI/DfvDRuvfn+ngKlSW
         +Q9wFIBuFx+nJphVMT87ogAECL7qQLJtDRdJjfn/Z5RExLgbI3QdoqYHKeQEAjyZhI2/
         HWeHu9WhKpheOPS0VauhPS9+l8WfwvIYICYVTpZIkyC+J4kBrzfVmYrNDTvE2wbwFdlz
         UFB/wDmyZNPElBCtGRJWZsuPN/qxbr4LvymTRffgxzZfS8Bw7G/c3DgIhs5QbKHIAJOs
         k7o0JuRC4VngaNQx2AkOK/ubmf8cM49RFupTLeuDu25NlOSxJ7SPf/bLL30/n2iaUq0s
         9Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038019; x=1789642819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDAmMcZxhMshZjhoUDkLHyRQSZBqRjdcOge6fnAnEeQ=;
        b=rMM11viKcG7tbastcwcLgLzg96IcVfWU0rQwt7nU0iLgMZsYeeU0GdE7IhxIqkvpdC
         dRSwKcK+4g91Ae0ngBevcOnF+tBirIL8AHZ7L++mq+Mpw800dVgHqXirxTwdSNQK9f1r
         W1lwKnoi4Wl0x2r6eyV3MBC3alrGN4m9HeGu0ulRE2LopdA2XwBwt5CwAvbQhkYOVoCd
         ZwwAxLxucnRAiUDvuXFjwX6Wpw2ksLF//cBWQpo8V/jizt2Jj0J5UCQIPqda58SKn09/
         XgrNSAokExdoWEyVgSKAu5a7+zN0a6SG8ZQEOixXBOPAOahfuqLL5Mm0o+OK5g4Rr4EF
         e61Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVpkrZzwPNyEu3JN+HuNYlCBSEdx3Y6EUsvrsX/Yq2VyxHHLm4V+viPgTYhd3UDehav1QgmEjz2QGRsX0=@vger.kernel.org
X-Gm-Message-State: AFuF++lyM7qETYG262i4XejNxFPJ5Gf9D26qCJyPVuXHYWRGe6RYhAW/
	SFcREWXrGmM1aGAqZfJfFFXLKPXPZniIeP++GNFb0WoaHdavhdB3E6QtafqdOQ==
X-Gm-Gg: AYBFou1wI/5KOzmRklOw+ejEH7TpkZgwIRjZkJVuyAo39nl1npss2KBkPH+erKt/sxM
	323tNG2TiRHioLBYzPP1n6YkUdlKi0W8fCNgxfSvWR84VMcyPQoqm+tdRTnM8yRIF9guwH+fUeZ
	VH1ZXA5k+fME6bRIdiT+bWL9c51j98oJVm96B6yJdNPgln5pKIAPsttl9FuGmqCy+88FBWvS+9A
	hlvaNNdQRadlx2UuQ0XQK8YipgdvKqgFnTx134y/zhNBlHidFb7z72cqMFrfIf68c7tmsAu7AoE
	Za6edr/+oGLjHS03aN/rG5phYUC+cIIqbO4AWFWoQUhjgSMArmeVvNHle8v+KxmI5DKccPvsgdL
	8vFleXeBKUOz73Hr+BPwm5lb4wyU7gLWxc6sJtVhHySDNkjKhUo4qeqGHkYeCzhZo3cnb56GdNc
	AEjXFgVrqAMTnDy+8JinD970M8HGEdBDLA+2oX2BsRC3obBdVzpXlWGRnvs6WD5PY0TGHGbbW4B
	Zw1TwEwR69tOPr+gEXbNuJRfuOXLEdubjy6
X-Received: by 2002:a05:600c:4fcb:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d26db4274mr42401465e9.9.1789038017825;
        Thu, 10 Sep 2026 04:00:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm272359765e9.4.2026.09.10.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:00:17 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:00:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Waiman Long <longman@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260910120016.04ba8ae1@pumpkin>
In-Reply-To: <0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
	<20260907182705.54585f73@pumpkin>
	<89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
	<44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
	<dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
	<0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2026 09:45:47 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

> > On 9 Sep 2026, at 22:33, Waiman Long <longman@redhat.com> wrote: =20
>=20
> [snip]
>=20
> > > Could you make that change to the existing code and rerun the test=20
> > > again on arm64 to see if it can pass?  =20
> >=20
> > osq_lock/unlock() is special in the sense that lock transfer can happen=
=20
> > either in the lock cacheline or the node->locked cacheline. Try the=20
> > patch below to see if it helps to pass the test.
> >=20
> > Thanks,
> > Longman
> >=20
> > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > index b4233dc2c2b0..51cecf297692 100644
> > --- a/kernel/locking/osq_lock.c
> > +++ b/kernel/locking/osq_lock.c
> > @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
> >          * is implemented with a monitor-wait. vcpu_is_preempted()=20
> > relies on
> >          * polling, be careful.
> >          */
> > -       if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() =
||
> > +       if (smp_cond_load_acquire(&node->locked, VAL || need_resched() =
||
> > vcpu_is_preempted(node_cpu(node->prev))))
> >                 return true;
> >=20
> > @@ -224,11 +224,11 @@ void osq_unlock(struct optimistic_spin_queue *loc=
k)
> >         node =3D this_cpu_ptr(&osq_node);
> >         next =3D xchg(&node->next, NULL);
> >         if (next) {
> > -               WRITE_ONCE(next->locked, 1);
> > +               smp_store_release(&next->locked, 1);
> >                 return;
> >         }
> >=20
> >         next =3D osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
> >         if (next)
> > -               WRITE_ONCE(next->locked, 1);
> > +               smp_store_release(&next->locked, 1);
> >  } =20
>=20
> The test passes with the above patch:

Do you know which part matters?

>=20
> # dmesg|grep mx
> [    7.010502] mx_test: osq_lock                    padding:  8 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.000 seconds
> [   12.014144] mx_test: osq_lock                    padding: 16 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> [   17.017572] mx_test: osq_lock                    padding: 24 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> [   22.019636] mx_test: osq_lock                    padding: 32 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> [   27.022192] mx_test: osq_lock                    padding: 40 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.000 seconds
> [   32.024907] mx_test: osq_lock                    padding: 48 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> [   37.026035] mx_test: osq_lock                    padding: 56 result: S=
UCCESS sum: 0 elements: 1000 elapsed: 5.000 seconds
>=20
> I'll use David's advise about including the osq_lock code in my test,
> so I can test it as a module, which will be more thorough.

At least with a build/run option...

> If you submit this patch, feel free to add:

I'll roll it into my patches (as 1/n).

David

>=20
> Tested-by: H=C3=A5kon Bugge <haakon.bugge@oracle.com>
>=20
>=20
> Thxs, H=C3=A5kon
>=20
>=20


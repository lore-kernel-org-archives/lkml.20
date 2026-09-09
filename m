Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886D368263
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980951; cv=none; b=LDa52ZHfPAYmB8TqJLErcSlrf6Jxj2gs9EDKqbEuA4tWTcoj2vmgQ4jEHSzw029rIlsNBufd2Z1mdPbYEQlrVmy947a18gdPUO1OYTXY1NiEBvkWH/LixsTJx6YtzKaKsHU462vzbfvULjILlkkUtP1rhbCEQAMJ8mI1jGqKc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980951; c=relaxed/simple;
	bh=6jbuex19+Axpyb4Z1+8qU2vor3BglGEzAcEYUwsMHaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QU+B8FrG3aOPHs4kowDFhGXQ7yisFrcfBOrZulRCe5wPJK4IF6TullMNw0tW1olv/KCTl9eWQjWISj3NfamTMrS01ZpuifwXIpGmlpJgxJ8dSUQzPRRNXrbR5lNH0W5W/0puNT9zYMMqoyxSOp4cOhUe7tNMUNzJELx5ckG6H2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4YmHGoT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4YmHGoT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48436216a98so4368143f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980947; x=1789585747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6mpU44jNxZcvuDscSHE0ZBvb4x0c3l6G9e3R908hz0=;
        b=Z4YmHGoTdNMsM7WkxnINRq3yJYBn6VtQx4JIbr0msAB4stYgjOpmHjui1r0VeJ7Qvz
         m9PLzjq8FkvnhJrVyVmSCIi3s4s8yPVmaoOv0B5qO8io10PLyUf4eTpDq33EgZlQzyda
         l+oOTd97DsfiuTgXooaDPCIEjd+03uLzcCW3SOc6BR6D5YO27MdFEM2IKMzd9+6MAmqT
         NkTlDWmVeqhtulXyc5QdseTYsJXLHs3GMpFs+Q35G+mLTJsdNSOSfIZilue2CY+5ADCh
         P0eV+NXQuA/uf6rSMSJegBP8CqGaJPSCdnNSfjlpRMX4eXpdqFzzGb9/kB6jiHwTo78/
         9o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980947; x=1789585747;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6mpU44jNxZcvuDscSHE0ZBvb4x0c3l6G9e3R908hz0=;
        b=LMKav2/P6FBNdFyEpOjb2Cwv9602AbeKX6iS0nrjaDw7ZhQzSTlqW8RnE9/hDq3yve
         E8bWem/MPtghnYpt0PbNVaYmJ8z0P3nrSu5xJfak1VOsxG8SCqkU8dtExe6BYWeIQHcG
         Eg9Aewb7D0zv3+V3TON02CQ5RBYLiShQSEpIhjgFI3TjexyxuJDyAbLl/6dtaB/fxljX
         UMpcdIeiShaDFOIIvTTgUC/reMcshv8zmu6+v0x0rzYT3YvmQjhG7Rahj7lLsvQrMKtt
         13YrLzd45Agwn+EFu0iA8R4H1u0J1gTyRsUm91XZRdr+Kp0yWkaMS0o3/zL1n7X9u0KJ
         5Fzw==
X-Forwarded-Encrypted: i=1; AKwUvBwCCCSp2tZEXmujJpyiqAv7sX/AvazC6Eof9pv1i/0rY1SoNTeGJBdpJRHUpx0pl4ba8V2CNImkuxd/Zkk=@vger.kernel.org
X-Gm-Message-State: AFuF++nBj36eDmXVkemvehirOZuua7v50yDGz45JyiVyOLa/Erh28Ne4
	etiFqglECs++H4eJzSibE8t6DIWeIhCXtl86h2IFvHVK6+HrvXDreUrP
X-Gm-Gg: AYBFou0+9WzRisdihTl3QhaoPUWVsmnYgy4cpM7foGQUpgvQD0qj9+bATTfeqAxyn5n
	QnFddP4+9jDf3zVsx282bROEWlCiR/02lroi0gmenaA33Z5lSWK07kXv8hrXIeGUy4rgN3IqpRo
	RPUYtseWMNG/H38Bbxtk0ezNPgN8RB97/5mPAgKE+6jNsOBDjzKfvrUF8soLPA24HQizjs8B4b5
	uG4qLrPKjna0vvPkPmuXl3IR3Yl9JIuW7Xp9rGhXqDLZ/ER2W2u5DAAPD7Rkrn6PLevi6tby+lI
	yuoLDmWlyUyv7LYCAq31AlEw2tK7H7486nQUqfHx86CS4Y4JM60V+5YZidcVOVuezO9IeiiKXcm
	jA6Z0L8xBFtEuVQj/cgezmF9uHLPahjFPkR+LBliJX9Q8K7UaWbMmRCkScxKppRm37Ny87xGjtU
	Mz+RQcgWOE8s71a33Ci4pEYpfaUku4ps/tlwS06DT2HumIcwqXydECPN4tk9fOAndxfjE7KHSUo
	MPsC4s4hw35m9eL3nEblLL33st+zjb3Az6h
X-Received: by 2002:a5d:5d01:0:b0:485:8547:5060 with SMTP id ffacd0b85a97d-485872a0271mr41059113f8f.15.1788980946812;
        Wed, 09 Sep 2026 12:09:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm37497265f8f.15.2026.09.09.12.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:09:06 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:09:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260909200905.0985ab9d@pumpkin>
In-Reply-To: <89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
	<20260907182705.54585f73@pumpkin>
	<89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Sep 2026 14:15:03 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

> > On 7 Sep 2026, at 19:27, David Laight <david.laight.linux@gmail.com> wr=
ote:
> >=20
> > On Mon, 7 Sep 2026 09:08:28 -0700
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >  =20
> >> On Mon, 7 Sept 2026 at 01:41, David Laight <david.laight.linux@gmail.c=
om> wrote: =20
> >>>=20
> >>> I've fixed some broken/missing memory barriers but left the initial x=
chg()
> >>> when acquiring the lock as a full barrier, I think it could be relaxe=
d.   =20
> >>=20
> >> Well, it should almost certainly be at least an
> >> atomic_cmpxchg_acquire(), since that's what osq_wait_next() uses for
> >> the contention case. =20
> >=20
> > I'm not sure, but am no expert on acquire/release barriers.
> > The 'fast path' osq_lock() code only has one memory access so there
> > isn't anything to sequence it with.
> > The important one is the smp_wmb() a bit lower down that ensures the
> > list tail (or head) is written before the back link.
> > When that was missing things went badly wrong.
> > (I think the WRITE_ONCE() could be a store_release() instead.)
> >=20
> > The ACQUIRE semantics were added to ensure the 'node->next =3D NULL'
> > assignment happened before the xchg().
> > That assignment goes away in patch 5.
> > But I'd want someone who really understands arm64 to comment. =20
>=20
> These are preliminary results. I added osq_lock's to my
> mutual-exclusion selftest [1], which has not yet been reviewed. The
> test is based on v7.3-rc2.
>=20
> For lock acquisition, I used:
>=20
> 	preempt_disable();
> 	while (!osq_lock(&el->mx_osq_lock.lock)) {
> 		preempt_enable();
> 		cond_resched();
> 		preempt_disable();
> 	}
>=20
> with the corresponding release:
>=20
> 	osq_unlock(&el->mx_osq_lock.lock);
> 	preempt_enable();
>=20
> Assuming that this is a correct use of the OSQ API,

Looks reasonable.
I doubt the rwsem code ever stresses it that much.

> the OSQ test fails on a 160-CPU bare-metal Arm system.

The inter-cpu delays will definitely show up any memory ordering issues.
I don't have access to anything of that nature.

> The same test passes on a 512-CPU
> AMD x86_64 system as expected, showing at least that the test is
> capable of passing.
>=20
> I then applied this series, but the OSQ test still failed in the same
> way on Arm. I observed no new mutex or rwsem test failures on Arm, and
> the test continued to pass on the x86_64 system.

At least I haven't made it worse :-)
Might be worth removing all the _release and _acquire (so all the xchg
become full barriers) to see if that makes a difference.

For testing you want the option of compiling a separate copy of the lock
code into the module itself.
Then you can test changes to the lock code as well as changes to the
test itself.
I did that for mul_u64_add_u64_div_u64() so I could test the 32bit code
on x86-64.
It required some pretty horrid #defines - and I missed redefining
EXPORT_SYMBOL() to be a no-op.

David

>=20
>=20
> Thxs, H=C3=A5kon
>=20
> [1] https://lore.kernel.org/lkml/20260817130239.343594-1-haakon.bugge@ora=
cle.com/
>=20
>=20
> >  =20
> >>=20
> >> It's a bit odd that the first initial xchg uses a different memory
> >> ordering than the later one. Maybe there's some reason for it. =20
> >=20
> > I think the 'entry' ones want to be acquire and the 'exit' ones release.
> > osq_unlock() used release, but the equivalent code in osq_wait_next()
> > used acquire.
> > They can't both have been correct!
> >  =20
> >>=20
> >> But even more importantly, that code right now  explicitly *states*
> >> that it needs a full barrier ("We need both ACQUIRE [..] and
> >> RELEASE"), so that *comment* would also have to be fixed with a why
> >> the ordering isn't as important as it states. =20
> >=20
> > I left that comment alone - matching the xchg().
> > Even though there are now no fields to publish.
> >  =20
> >> And finally: none of that will ever be noticeable on x86, since there
> >> are no memory orderings on atomics there: lock is all-or-nothing. =20
> >=20
> > Indeed.
> > I don't have a little arm test system, never mind a big one where this
> > would all show up.
> >  =20
> >> End result: I'd love to see actual performance numbers if they exist.
> >> And any memory ordering change would require explaining why it's ok
> >> and some other architecture to test it. =20
> >=20
> > This could even be one of the strange places where making the code
> > slower actually speeds things up overall.
> > osq_lock() is only used for contended sleep locks, and then not even for
> > the first thread to be waiting.
> > If you get a lot of threads queued you really need to fix the locking!
> >  =20
> >>=20
> >> Or am I missing something? =20
> >=20
> > Probably the same thing as I am....
> >=20
> > David
> >  =20
> >>=20
> >>            Linus =20
>=20
>=20


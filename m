Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399512;
	b=2BTk9c/4A56NGV8uoV1xV3+FbnRnOgHihX1q3lrKIOyleilGO6nBj+HqT7vPo6YYSupI
	 02CEEz8INxqjOvLetxgKszoHCv6L3vNDxTdW/49Pi3jra0prEENKTRKdUvZFUO1sBo0Jp
	 zxGqxU+vhQUa+Yls9ihH9FcDBcDjcRnIfBjSGJgJmoeNem2hDOIQdVvgKU7G+2UCSW4s8
	 AsnxHRr58bg1PofqXvxVPvY4TCZkbahmHoVVdpYfIOe9OnszJ8hj0HNdJ+QkLgE+b6KfI
	 PKYb4lzq0/nmfXj4VDeS0aEDqJ/UzU+76kanJ4QGeGrb4DEHslfjL5vJuNMHYf9OPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1p0Lb5eIRIxIOcyVzwKpS73CcwjRc1auFJPNnNni7Xs=;
	b=dgGlYcq787Nz9q5V60QlUfXPrmiaWlqPeSp3Zj39Dfm1PkbwOyHFLDsL/J4Up+8mlYpb
	 gbevhLci8INBt8ZkDcMQwci3oBTR/6cCXRqRT+Mv2Xy+K0VPb7sEG/9Eu67Vg4Miu0rAu
	 AXYNTs1HLX/cJz0yIZLJmJZ7ZdoFPV/CmaE5Qz2v5QnGMnbTjag0hXlizTmtNDqlR0rDm
	 haRroDYNf9xbzumEty8VW05kEUtoCWiphUcjxM64QJ7acCwWyGkxymZsP6otHPegM8kTZ
	 J+tTWcuk0xOKdjV3nePAKxa3ErscgDvDpMpxHIhvrTIc6fHmNiJm47RFbDZ4VhXpWmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAG2hka2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAG2hka2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13151645e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399510; x=1794004310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1p0Lb5eIRIxIOcyVzwKpS73CcwjRc1auFJPNnNni7Xs=;
        b=MAG2hka2A3fyyWz/7a4Rz0A8w5PR+P1PN9ER6oDeQ0BM0WVZIvCgyf+ZMjRLRbdZZV
         Yf45wAysm1oHdDy3QaK5OT3Fgqol+HmRLURTQ0ToFAOkOXS1bZZrMXOEydpXNBLyex35
         7N0djtVPoNd2QHe0lLx5Mgc34dDNNg6404dnqbxMmjvOokQwepZ5lAJCg3hxPme23FeS
         5RJ4J6UP2h4QHDXmZQl8v5xNS+qQ9z9ByQ/qCx1cIVFtf+G1wAqF8eFFtc3AqH7KKHvX
         dZnJL7AzC5MsSESNPu+p6kN7xfNM6Ew9SRiSpm5y4z3o0DzL0eXqnCIdBbIeBxEoWY6Z
         DxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399510; x=1794004310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p0Lb5eIRIxIOcyVzwKpS73CcwjRc1auFJPNnNni7Xs=;
        b=QEYcvBbTSDm4he1n1C8agc6/6p+bPkJrhPb1ERPIRKY0zDKciTi5LLcFcLyUGXTots
         qBepPGeAc1gi2KwafHnCDb71LORxgK+PGLRXs77XP6mn3PF8FuL157SE4YncB+DDH2vV
         aNK/oeCxm/s2RL8WHWRYdkzHNHdwbOzx7YIJGZ5zugnx0VUeePR8aopdP1RVnaPBDjzO
         yy9UVXbVpjPVyUkHw6kXFwtgDviws9Mgg+ioFXpK8A9O0u/tWp+KFkFYVvc+sCgHTJ75
         1waWRiXHE1G4fz2hSfWjdhThFk+nH0/3q54K/Olu/h2JbaCwOwCpg6eI3ec9k/cSdTvy
         nGfg==
X-Forwarded-Encrypted: i=1; AKwUvBwFrQcPt2r/92YqBmBrFRSWVcYy+qM3sxMromCl4vV8lfu1X9gVxMXCP2kBXqcoefVq+xP0ar1D88nGEv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwj24+I44wCS7x12wNsxfFf1hhAPL6ZPaQgPNyVsT8SAwbs1P2
	kV2uHsc/qq9ucmFoIY7LbuJEx1zEXWwFBoHkNmPvBfnxJaGsM9hTDyhU
X-Gm-Gg: AYBFou1uKon5dmnG2j1Zg0yXgGRmzALvPoxw81wrsdE2pSXg2xhc4xcTjbi2YAqyotR
	GpqECCNwNVOyVeHLkniaSA7udf+LwhjKUzhNplS3bZ4X5Q0eszbdDxeaCc0h/o92RbOTHn2Nf0c
	guokGyi6T5wB0N6/IBHhdIump5/vaUSi2Qnj9JHnLrbXrDOtk+oMGE/Vk0Ti0RKOA1eKp3V2yg4
	Ol3eLQGrUIkIu2taOrCOXYNEIUxtUYyPobkdfgmdTJ5LVDUPhNHR2akSvNE8om59rRoYuZ0+CYC
	KpSMBx005lPZscX79N5bqrCoYQjfkIawIV95vzIghHn3QGXXPkfIQO0k68LMGAeHNco9/MtztAH
	87YbOg6oiHzo2DZBr7U6N4XHK9UWVYXh3uF2DUbi4Nyz2ZX0QsF5B5bNFOOjIgtlexCBIvCU5if
	cFRMEACYqKEEvQwTx/dXyAor5XE0aml0Y5ybCzzq7YDaOzwk6k6NzhnfeDB4+hab+CqC0Iy32Ap
	SiKDyP0Roy1/Y7zv/ocHyR2BWfTxLAf/CAavsTWq8u4Z0x42m+YlJvq+xNkVvqyGi9uVEwItJMN
	VnGX7ytZNxnnS6JNUCPhgk2R2m629zhKBI4Z8XSwz9aW0feKQi0WZe3ho9YkOKinFA==
X-Received: by 2002:a05:600c:1387:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4ac1793fa6bmr84871145e9.13.1793399509998;
        Fri, 30 Oct 2026 15:31:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm172082905e9.9.2026.10.30.15.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:31:48 -0700 (PDT)
Date: Fri, 30 Oct 2026 22:31:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen
 <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, justin.ernst@hpe.com, kyle.meyer@hpe.com,
 dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, Matt Mullins
 <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261030223146.0fae9291@pumpkin>
In-Reply-To: <auUEkBg5P4AZdjLe@swahl-home.5wahls.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
	<28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
	<20261028142625.GU2668564@noisy.programming.kicks-ass.net>
	<27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
	<auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
	<20261029105121.39a4c74f@pumpkin>
	<auNnKmfx_2Dp0IxH@swahl-home.5wahls.com>
	<20261030162841.23ffeb6b@pumpkin>
	<auUEkBg5P4AZdjLe@swahl-home.5wahls.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 15:56:48 -0500
Steve Wahl <steve.wahl@hpe.com> wrote:

> On Fri, Oct 30, 2026 at 04:28:41PM +0000, David Laight wrote:
> > On Thu, 29 Oct 2026 10:32:58 -0500
> > Steve Wahl <steve.wahl@hpe.com> wrote:
> >   
> > > On Thu, Oct 29, 2026 at 10:51:21AM +0000, David Laight wrote:  
> > > > On Wed, 28 Oct 2026 14:58:12 -0500
> > > > Steve Wahl <steve.wahl@hpe.com> wrote:
> > > >     
> > > > > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:    
> > > > ...    
> > > > > 
> > > > > For an example, I recently used this method to discover that at
> > > > > least one version of Intel's MPI library likes to read up
> > > > > /proc/kallsyms from each of the processes it starts, and somewhere
> > > > > north of 1000's of processors the atomic increment on opening
> > > > > kallsyms, implemented with a compare-exchange, becomes a hot lock
> > > > > and initialization that takes little time on a smaller number of
> > > > > processors, suddenly balloons to half an hour.    
> > > > 
> > > > I'm guessing that was pre-ARMv8.1 ??    
> > > 
> > > x86, not arm.  And it was on a distro kernel, I didn't check the
> > > current community kernel because it was a situation where it was
> > > enough to understand what's going on in the distro kernel, and avoid
> > > the behavior in the application.   
> > 
> > x86 shouldn't have an exponential issue with cas.
> > Something else must have been going on.  
> 
> Well, the large majority of some 2000+ cpus were all stuck in
> use_pde() in inode.c, which is
> 
> 	return likely(atomic_inc_unless_negative(&pde->in_use));

There will be one of those per read system call.
If the code is using a sane buffer length that isn't really that many at all
(unless you are running an 'allyesconfig' kernel).
Provided the library isn't doing something really silly like 1 byte reads!

It is possible that /proc/kallsyms could be marked PROC_ENTRY_PERMANENT
and so avoid that atomic operation.

> 
> atomic_inc_unless_negative() has alternates, but I think there's no
> arch version for x86, so comes down to this:
> 
> static __always_inline bool
> raw_atomic_inc_unless_negative(atomic_t *v)
> {
> 	int c = raw_atomic_read(v);
> 
> 	do {
> 		if (unlikely(c < 0))
> 			return false;
> 	} while (!raw_atomic_try_cmpxchg(v, &c, c + 1));
> 
> 	return true;
> }
> 
> If you manage to synchronize thousands of processors among many NUMA
> nodes all trying to do that same thing, how can that not create a
> horrible cache coherency protocol traffic jam?

On x86, in order for the cmpxchg to fail it must have succeeded for
a different cpu (as far as I understand things...).
So yes, you get a lot of cache coherency traffic but progress should
be made - probably with a maximum total rate of increments that you
hit well before 1000 cpu hit the code path.

It might just be that with the large NUMA memory system the required number
of cache line bounces (one for each successful CAS) just takes that length
of time - but that is linear in the number of applications/cpus. 

OTOH an LL/SC loop loses the cache when another cpu does the LL (aka read)
bit. So when heavily contended no cpu manages to do a successful write
and overall absolutely no progress is made.
The more instructions between the LL and SC the worse it gets.

David

> 
> Thanks for your thoughts on this; if our hardware is supposed to be
> doing something to alleviate this and it's not, I / we want to know!
> 
> --> Steve  
> 
> > David
> >   
> > >   
> > > > The LL/SC retry loops for atomics are completely broken for contended
> > > > operations.
> > > > The kernel needs to patch them to use the LSE (single instruction
> > > > atomics) for ARMv8.1 which guarantee that some progress is made.
> > > > A CAS loop can still get starved on a single CPU, but some CPU
> > > > do proceed.
> > > > You really don't want to use LL/LC on a system with hraair CPU.
> > > > 
> > > > One CPU (not arm) that implements LL/SC locks the cache line for a
> > > > few clocks after LL to give a reasonable chance of the associated SC
> > > > actually succeeding before the cache line is 'stolen' by another CPU
> > > > doing an LL.    
> > > 
> > > Thanks,
> > >   
> > > --> Steve    
> > >   
> >   
> 


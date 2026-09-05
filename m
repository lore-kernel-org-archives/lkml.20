Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235D327C09
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576683; cv=none; b=W2JyizvdU5ZYGClYGTFDPnm+4Y6XESKvKU769ovMJt7BwR2j/Jy7yHQJJ9leQO8FlKbJfenw3kgwpru57qmGWTOXJ1NZrU0BUqVc87Is+0+o8pSPLofSs0rFCk5lyVojQnNdh/TIWOj0//O+VMCRYf6kQH2uThc2yNh8Yx9i4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576683; c=relaxed/simple;
	bh=C3df1ugh6rUzruXPX+OJp8A2wl50vXoeEbMwgMt7JGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o4HQ+W64aMFbI3SHEsWu4Qo8Xy7tUDI4SIUkTHhcFh5zxyy5G/SjHfnW47BASZBkEle1H7Fw63p42hmdtWeTl97LdrDz9p3M5HFobAA+qm9yOZ9u9EKJeOPKTzHtJX64J9yw5uOxIrcPrevp6MgClotmQ520RIaZVaJpjP3Vdgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f+IfZYh0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ifFd0LWf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f+IfZYh0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ifFd0LWf"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788576680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3df1ugh6rUzruXPX+OJp8A2wl50vXoeEbMwgMt7JGQ=;
	b=f+IfZYh02MvNdVrnFsEjZ4G++kBTWkOlKuUw+3PKhov/C0rvmt5d9hVpCYJeWEkZQCnoAf
	IsBOB9SJ/ukPY/NofPwrkYw4/z4/oXTPBhLpYDvle2leiszhwQKjoObZ/al6KWOFkgr5ZG
	msUKYm/quktS/uhLadceUv1RSYYg2tLiW/GzUBhTVp0f3D4TLdl4OX4CfSoo6FS/M/01AB
	Q4KfMrCdPHnia7NSvCqRo7ij0Q0+L+fFwaMn43ahpuAdX08lHZPdi6SclPCDbjU08RL7jM
	5sRU0wxlnItYPGPuGdk1dpMqhWM0jfej/m32kMv1Gh6Jr5b8o/ENLOEOS9NoHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788576680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3df1ugh6rUzruXPX+OJp8A2wl50vXoeEbMwgMt7JGQ=;
	b=ifFd0LWf4Jb0hg6moZmbTBt5hEpYB5RTHdy3YrlSBNWGwFhsR4JqdoTOpD87JnjOj19VlF
	UniHL//75eSm+VAg==
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <871pb9841j.ffs@fw13>
References: <871pb9841j.ffs@fw13>
Date: Sat, 05 Sep 2026 04:51:18 +0200
Message-ID: <87ld9g9zrt.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Gleixner <tglx@kernel.org> writes:
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
>
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.

I have hardware to test the SiFive PLIC. I also spent quite some time
staring at the specification attempting to cleanse the mess we have for
plic_irq_eoi() (which sadly yielded nothing).

I can help looking at patches. Would that help moving things forward?

Nam

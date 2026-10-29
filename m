Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270082;
	b=vZjePuu/iG/LXDv2FuK87sOWd8bwRIWQIk7yqRdvJD0R7d/twlC39z++E32yLO2EWUNW
	 pEr/qMmjyzqYn8a0NYj6uWZ2Fhld9APphH++Cx3ZkLQMt9iXqzI0sJo4ziejFuiDisdPP
	 Hke9L0zpLzEkyAyB5T4JC14tWW4c3xAeZg0WH5Tc44n65bmx4mpXAtVQBDq3KOOC79/Ko
	 rVxBUWzjRikIwwNHtY7FzNL9n4qtEANjPH3PD/MaWn5UwSPZSeutDac54FtxIxk+YGxhX
	 IXZfke9Hf7YnnMIzY/rzjKSh98QIU07mDYNASztkCmgG5GApmPJb2ebvcWjn/0PzX4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E0vgNmPDRtM5Q1Sz+bLH2qQwA1b6G8+tQ9Vpzrg7cm8=;
	b=yfulg/CUMjr6HXN4dqkh1z+JISkqw1dvsZ5/Ma54E3csGm68OEESfxf7Te7CFrJjsxJ8
	 v09GF1Pzga1HLHTr5IPDfSdlmQCidK1Fxg9luV58ZPS/gaopIQU75uIwfoNFE1ILsfB37
	 OukVwxaHmGeMnr9poUOV9miugFZPvz7fdRzhjHb6MVoGcSPgbNQQoULaQRYpn6JPvsbzg
	 6WLmK2kkl1f06A0r0eoWme9YxtQ4Drt7ZLX4U8mnfNoaejdBEquCzK3e6/UoYmT8iMgHw
	 41xQhkwIquXIGkLYYgsky9cSdfWFupZeuJoCMEC2bCOBNZ0L6Qmdcu60t7umz7ibByw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxAxIMyc;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA0606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxAxIMyc
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so18359135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270080; x=1793874880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0vgNmPDRtM5Q1Sz+bLH2qQwA1b6G8+tQ9Vpzrg7cm8=;
        b=YxAxIMycVkqwuvA+9ThI2F/PtcxiuJLyWsj/ZXZWlO35Nm6FciKWJ9XPU6WPLNyxsL
         vfE7XMjZO0SpZSmDwIQZ5jRU8JrvlWUw70JrWqcgcROxCd9aDstpLS4OsBFOIIG80yHL
         wS1bpRUy0EhI59emh9hoqJDidOKGH+Z7q/dYxkYSEhiAFx0/qQj7qVkGowTcJrzOYJPQ
         ZBayiHzWm9NnXf8QUwDqvdMGMyNksvDhTViSgM1Cam6duUdRLkKUJC064VhdM0BMvDbk
         lQ9UUYIjnJq++4Q6De++MhyPMJt47F+z5wi1fBGlnSEldtjDN2KBuz+Xh6/chXrI64Zp
         Helg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270080; x=1793874880;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0vgNmPDRtM5Q1Sz+bLH2qQwA1b6G8+tQ9Vpzrg7cm8=;
        b=xVKT8knowAxsXVAiL+mApFlWV1sXsh/qYQ+M4llrAxkMwTF65/ZIZSn+oLkDrVJFrN
         GZemnjzgevEk+6pC/kS03vUa9QI8TxZge60XltD+UwXvATsap1AxMMuac0favfKHcrNI
         wKeabG1aOvTyb7KFR/U4czFEgMdiuUbh+auO+q9zXnUocyYHjFtTm0afilF3Ov/Z2niT
         tWVRMMMXz/IqpFAHP5cE//CgoBSRfODFOiKKlRTLLb10iooX+0tW4UVHYr1QWXv/CrMI
         xhGCbbcQffhtZ5igHMEv0U6XgrIVRSt1Sb2nRgmKPiCqI6HuBEouVVpa0yJ1YOw1APaL
         SQDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAK0WjLcsWdqGWj4W7mRrU7+GfmcRXaIPjltu36z9BKSQ2BHlCN0XWE9W1luaMzyhV2gbfyHE+OTKksG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVPFo+DVsyt776LAVqlLtlvW+vpZtT6T5Ytw5BmOxFxePjBCf3
	d47L1nXdR1yjWmSl9Tf8Mdfc2/0PF2Gq03d+A/sqxNV5do6W1k2rO5gp
X-Gm-Gg: AYBFou3IJxh0qLCHTaKaYjmJgO8cymUHnO+rfw41Uptulu9xgHEgZmqQJPGwr2bqAjP
	EiIqnwimOcT+A2SKMl0F+APoZsFvUGFdDyH7DY2FsLlzjrJg7VvEnIg4HNgoU5CiB0gMs1Rp9kz
	Us/0IQqLpGe+H5OyXqy5ZrxG2mZE3DIWWbj1x7aQjFkgOYWbKrlj8RsA+eYJZXjjHr+sPyHdhpS
	rl3sDlKyVDBekcYTC8H5wvscCBt84cXXeasrdWtMRr7xvY+7a2sQkG/j8dhHUbVlgKXQImPPqnx
	ByuTF3BgRa1n4cvT7yKoIXqYNcQ2dVtucCSeIF//jIQ2uj8pjjUImtGgKXvGtEUIPjdcnvkEi2s
	v7vgHuyBrm8ktTo/KBCyC4kO5ZtzFWDDBfOcW4Nn3XC6XQ8Aze/I74xPI1/ntQkef5rBeibXMFN
	+1WWkoMB3XW1TuFNZ5L0PAJcDB0RRYEln5CFQWrY264VrAYiUZHQTTrwDO+JcJjDnm6ONnNhVia
	aHfeIStECe8Lo5NymwmJKZTbi8WQ6CuOXfnjYdSq97xtdkPyXE0TsVS3oDX7cj1HF1ysxyMgHgH
	cg+QeB9lfDlLFJs5A5Jvi0KKqMX7UG9LMnhpRV5UAvx0kc5IfRzdc2YpQxfQjzA3mw==
X-Received: by 2002:a05:600c:19c8:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4a967d96ed4mr117228145e9.25.1793270080158;
        Thu, 29 Oct 2026 03:34:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f418afbsm65736335e9.6.2026.10.29.03.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:34:39 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:34:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 justin.ernst@hpe.com, kyle.meyer@hpe.com, dimitri.sivanich@hpe.com,
 russ.anderson@hpe.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 Matt Mullins <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261029103438.69284f7c@pumpkin>
In-Reply-To: <20261029084606.GE1779021@noisy.programming.kicks-ass.net>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
	<28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
	<20261028142625.GU2668564@noisy.programming.kicks-ass.net>
	<27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
	<auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
	<20261029084606.GE1779021@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 09:46:06 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Oct 28, 2026 at 02:58:12PM -0500, Steve Wahl wrote:
> > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote: =20
> > > On 10/28/26 07:26, Peter Zijlstra wrote:
> > > ... =20
> > > > Also, when was the last time you used KGDB? I think I've tried it o=
nce,
> > > > some 20 years ago, and haven't bothered since -- it was *that* good=
 =F0=9F=99=82 =20
> > >=20
> > > I can't remember the last time I used it. I also grepped through all =
of
> > > my stashed-away kernel configs I've been using for the past 15 or so
> > > years. The only place I even see it configured in is in distro-derived
> > > configs. None of my trimmed down debug configs.
> > >=20
> > > There seems to be approximately one clear commit that shows anyone us=
ing
> > > the x86 kgdb.c in the last decade:
> > >=20
> > > 	commit 71ab8323cc357c68985a2d6fc6cfc22b1dbbc1c3
> > > 	Author: Matt Mullins <mmullins@fb.com>
> > > 	Date:   Fri May 31 12:47:54 2019 -0700
> > >=20
> > > 	    x86/kgdb: Return 0 from kgdb_arch_set_breakpoint()
> > >=20
> > > The only question for me at this point would be whether we should just
> > > config it out for a couple of releases rather than removing it outrig=
ht. =20
> >=20
> > I have never used kgdb, but kdb is a different story.  I originally
> > reacted quite poorly to this patch, assuming from what was changed
> > in uv_nmi.c that both kgdb and kdb were being removed.
> >=20
> > I would like to see the kdb action remain in uv_nmi.c, even when
> > removing kgdb.  Is there a good reason why both were removed? =20
>=20
> kdb is just a local wrapper around the kgdb gunk. If we kept that, we'd
> still have all of kgdb.
>=20
> > There have been a number of times over the past few years, on large
> > cpu count systems that aren't easy to configure for VM usage, where
> > I have a problem that wedges the system or leaves it unresponsive,
> > and I enable kdb, reproduce the problem, enter kdb via uv_nmi, just
> > to dump the stack of all processors and find out what they are
> > doing, and check other things that I can get to with kdb. =20
>=20
> So this uv_nmi thing looks a lot like sysrq; you could wire up one of
> them things to use lib/nmi_backtrace.c to dump stacks for all CPUs, no?

Where would the output go to?
The kernel message buffer is too short to be useful.
For a smaller number of cpu something used IPI to get each cpu
to dump_stack() in turn might be useful as a sysreq command.
But I've usually resorted to cat '/proc/*/task/*/stack' (or a subset
thereof) to find where processes are stuck.

David




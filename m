Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2891A3822B1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749694; cv=none; b=c/lVlArgqiu/iCp7V8vJrJh03HDF76x0rP7D73pOE0k6JDN3UHDWDlgRrWQxPdEf5Wl0teeHh5I1aebk03tmc3ZgVHFMQRwyhyZqoSaqgBB6vD1QpVKMxxnfkpAJ4WZhSsShaMIE5pecyj6J3KeG217A8f0vsL15E0cLlnDLeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749694; c=relaxed/simple;
	bh=hnFJ8o/cwXgYWTaLBXvzFXtx05pbxxRr5knTuhHWCqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j2vUPYtXJ70WWTGzl8/qmgUdr6GMa3YEcJAXVJB+VC8mit6NHGNDaE/nr4/XJUIlLbqFk+mzd/b+7UWZGgRkGwI/bLRAA1vZ/4sgUSrcWfrrrrwbh/ssDoM7WyL/sH1uAEhSogzkc+Y2yT1YGKP4RB09IsjuXFm/K6C8G4Cqa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rgW3UWyl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rgW3UWyl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7BD034E413BB;
	Wed, 26 Aug 2026 13:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4827D604EC;
	Wed, 26 Aug 2026 13:08:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB79011C78168;
	Wed, 26 Aug 2026 15:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787749684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gl0A6nv0UKopxLJJ2P0yKQzTeyc2eqLQfvtiThSJ35w=;
	b=rgW3UWylTUDNg4qU4i3FkZBvHmlSoO6x1lB4tlDj5Mnh+tPPzWuMeuh5ql1cojX2+o4gcL
	vUMHMzeYr5qm+GsVAPBcPgQF7lbCMPa0ICm3eHVlIZnE004300sDshpiKSPXZrfMHzCb2z
	aix7QV9Sp/3aLoeiPS5TBZyr45kIkHaxoCCob5uH2LnG/yHUVPLmO+0oSsu2XOZ35W7wk+
	D42N7jSJXUrsd+X/cz8C2zGw6oK30IEFeZ2kfc6Ae6AArXz91CXHFig4g2jbZuSFKd6sqe
	onSVYfbwF36kNZbhl6NSH4+vPavPcQywceKTjZIkdWRfTDlS90h+NBLEnWiIwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mtd: spinand: winbond: enable continuous read for
 W25N04LW
In-Reply-To: <ao6r15CbIMQZZWTB@atmark-techno.com> (Dominique Martinet's
	message of "Wed, 26 Aug 2026 18:03:19 +0900")
References: <20260814-w25n04lw-contread-v1-1-2968b07c962d@atmark-techno.com>
	<871pbmk1ma.fsf@bootlin.com> <ao6r15CbIMQZZWTB@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 26 Aug 2026 15:08:02 +0200
Message-ID: <87ik4xf2rx.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Dominique,

>> > Fun fact:
>> > nanddump -C is about 9% faster than nanddump on large data (tried 10MB)
>> > even if continuous read is not supported.
>>=20
>> That is strange. Is this really reproducible? Can you disable CPU PM and
>> try again? There should be no impact if continuous read is disabled.
>
> This system has no knob that I'm aware of (no cpufreq in
> /sys/devices/system/cpu at least), but I've shoved the IRQs aside except
> for the spi ones and it appears pretty stable (mtd1 is a 8MB partition)
>
> ------
> localhost:/mnt/mtd-utils# taskset -c 1 hyperfine --warmup 3 -r 20  './nan=
ddump -f /dev/null /dev/mtd1' './nanddump -C -
> f /dev/null /dev/mtd1'
> Benchmark 1: ./nanddump -f /dev/null /dev/mtd1
>   Time (mean =C2=B1 =CF=83):     511.1 ms =C2=B1   0.5 ms    [User: 7.8 m=
s, System: 419.8 ms]
>   Range (min =E2=80=A6 max):   510.4 ms =E2=80=A6 512.0 ms    20 runs
>=20=20
> Benchmark 2: ./nanddump -C -f /dev/null /dev/mtd1
>   Time (mean =C2=B1 =CF=83):     480.9 ms =C2=B1   0.9 ms    [User: 0.5 m=
s, System: 399.6 ms]
>   Range (min =E2=80=A6 max):   480.1 ms =E2=80=A6 483.3 ms    20 runs
>=20=20
>   Warning: Statistical outliers were detected. Consider re-running this b=
enchmark on a quiet system without any interferences from other programs. I=
t might help to use the '--warmup' or '--prepare' options.
>=20=20
> Summary
>   ./nanddump -C -f /dev/null /dev/mtd1 ran
>     1.06 =C2=B1 0.00 times faster than ./nanddump -f /dev/null /dev/mtd1
> ------
> (this is on our 6.12 tree and not on the 7.2-rc I was on earlier, so
> ymmv, but iirc the 9% figure was taken on 7.2 with hyperfine so this
> should be reproducible with the latest and greatest)

No big change is expected between those versions, except possible
(important) fixes. Make sure you have them.

> I have much more important things to do so I obviously had to look
> further into this mystery :-), but I didn't see anything obvious...

:-)

> For some reason the contiguous read variant seems to spend less time in
> spinand_wait() between the load page and read from cache op (looking at
> a flamegraph), but dumping the actual ops used I see very similar
> sequences of load page (0x13), poll status (0xf), dirmap_read (0xeb),
> so that doesn't explain the difference...

I do not understand why. Did you compare the output? Do you get the same
correct data in both cases?

Maybe there is some kind of runtime PM getting in the way?

> The main difference I see is that nanddump -C passes a much larger
> buffer to read (observable with strace -c), so loops for reading inside
> the kernel, and without -C loops in userspace: I do not see the syscall
> overhead in my perf record flamegraph but perhaps that changes the
> timing just enough for the nand to behave differently or something like
> that?

While nanddump -C is nice, as you said it behaves differently. I would
instead suggest to run flash_speed which has a continuous read
option. You should observe no difference between the different runs.

Then you can hack into the core, enable continuous reads despite the use
of dirmaps (as a hack) and then observe a difference. You may or may not
get correct data depending on whether the controller may deassert the
CS, but we have no control over this, but that doesn't matter much for
the current investigation.

Thanks,
Miqu=C3=A8l

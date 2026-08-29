Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C491229B38
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035695; cv=none; b=FuYHV+tWzk4sjdxuAoH55G0V3FBIYm3Fjm7QjKn3kvquNdc2IvTBTG4S3tvnfzq71rajUOiLhcorrs/GKfsZscV1lBGewDwn/jruEXReuwo327NAuiUF4jJJFGV7BBup7ZDAO01IESav9p6itaZt9M5sMDRLd/piBBvWXi0SUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035695; c=relaxed/simple;
	bh=LmHThhbvjPXgboYQhnIF3k82lpmB7K5HeFuBzh5emlU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oqueFPltJZRa48CSdCLwBYFAXMensq1FJod9SZ5Q4UUXqgmlY7YWrvT9a91epASF5C+RvGpFkBWex+EE5NdYr9glU3QT3FNIrP3rup3bdttEUiMAQ4GaxUOP3/QjBBrtAk4lj+m6FuTLNKupII15T9YP0+lk43tFuVXpDOrGphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=VbPZ/4se; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="VbPZ/4se"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D9089C33D3;
	Sat, 29 Aug 2026 23:34:49 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D9089C33D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788035690;
	bh=LmHThhbvjPXgboYQhnIF3k82lpmB7K5HeFuBzh5emlU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VbPZ/4sejYQ08MK5FeKGtT6a7V8c4anHjI7xcUigVZgJ+D6qvgcdu2cBNLmgRIkSX
	 9FkR0CXSGYQWSSj3ITSDnVhstbqeVarRqKWN8bkdxjO4H6iDhC/kB44jnNCU0HcYJA
	 foWFazSi0UUZAIFJ2oYrlxU4kyX6wWiCPmU2QtZcDRVLcnz0MCJs+SOcCslrQDTzLS
	 EHKTVabNwiHe/3yjR7BFl0wNMtXAno2VcgiUHFe6qkkleRMi4rCpdIjib9QKnZ2Wyu
	 Xl30byq174iVpID0JAQxKj7C1hSsylV8lnfQMnUlG6x3cBkYTEQSsKd/WacJddmk0X
	 zxZIsFyd37kgw==
Message-ID: <31cd7357e666ecc74b7a995641b3de3c0aa1bd0b.camel@rendec.net>
Subject: Re: [BUG] KASAN: slab-use-after-free Read in
 irq_migrate_all_off_this_cpu
From: Radu Rendec <radu@rendec.net>
To: Farhad Alemi <farhad.alemi@berkeley.edu>, Thomas Gleixner
 <tglx@kernel.org>,  Mark Brown <broonie@kernel.org>
Cc: falemi@asu.edu, linux-kernel@vger.kernel.org
Date: Sat, 29 Aug 2026 16:34:47 -0400
In-Reply-To: <CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
References: 
	<CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello Farhad,

On Thu, 2026-08-27 at 22:41 -0700, Farhad Alemi wrote:
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>=20
> =C2=A0 https://github.com/farhad-alemi/public_bug_reports/tree/main/164-k=
asan-slab-use-after-free-read-in-irq-migrate-all-off-this-cpu/
>=20
> =C2=A0 BUG: KASAN: slab-use-after-free in irq_can_move_pcntxt
> kernel/irq/internals.h:305 [inline]
> =C2=A0 BUG: KASAN: slab-use-after-free in migrate_one_irq
> kernel/irq/cpuhotplug.c:57 [inline]
> =C2=A0 BUG: KASAN: slab-use-after-free in
> irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 irq_can_move_pcntxt kernel/irq/internals.h:305 [inline]
> =C2=A0=C2=A0 migrate_one_irq kernel/irq/cpuhotplug.c:57 [inline]
> =C2=A0=C2=A0 irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplu=
g.c:181
> =C2=A0=C2=A0 fixup_irqs+0x18/0x1e0 arch/x86/kernel/irq.c:527
> =C2=A0=C2=A0 cpu_disable_common+0xb27/0xd90 arch/x86/kernel/smpboot.c:135=
4
> =C2=A0=C2=A0 native_cpu_disable+0x2f/0x40 arch/x86/kernel/smpboot.c:1366
> =C2=A0=C2=A0 take_cpu_down+0xca/0x330 kernel/cpu.c:1282
> =C2=A0=C2=A0 multi_cpu_stop+0x227/0x420 kernel/stop_machine.c:238
> =C2=A0=C2=A0 cpu_stopper_thread+0x259/0x3e0 kernel/stop_machine.c:512
>=20
> =C2=A0 BUG: KASAN: slab-out-of-bounds in
> irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181

Thanks for reporting this. For everyone interested, please note that it
had been also reported by syzbot a few days before:
https://lore.kernel.org/all/6a8c23a0.dbb3a75c.7844.0001.GAE@google.com/
Currently there is no follow up to the syzbot report.

> Our reproducer.c is available upon request.

If you could please send me the reproducer, I'd be happy to take a
look.

> Happy to test a patch if that would help.

Thanks. If I figure it out and send a patch, I'll be sure to copy you.

--=20
Regards,
Radu

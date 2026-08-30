Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30A83ACEF0;
	Sun, 30 Aug 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091225; cv=none; b=qNa4iyZqreSiyAstrLWLiLwuQS/kSLVEviGdITEJJ5BZw3cOCWNffRDLIz5mIEmblQNNWUO+m3tZM1N/CCzIDryIgUH8OmIEpDpmBiOW6b1eNFfyf0Hj2JCFrWqi3IlnYEN8HJXfGAnKSGpIj9TtVjGFsrQ470q6Pl2bkMySHbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091225; c=relaxed/simple;
	bh=PwX9bj6002H462i9TjMrY1TVcwVq0b7tUsRonNYBYvU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrgUvZdxOmgfz+5rvr8e7L0usssiQFQdWatR3HANr/nvl5dA2w8LI/53T+/dv0zDurvlZ81/3iDrWLbgBWI6JPzCynq41vYxxi/LwO8+FH4hM84n5UL54z+LJ19XI7gjhvsppWCM40fggEJujUQEmbHXBbG17IU7RDoYg4DkeLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gkPFBhQP; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gkPFBhQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788091215; x=1788350415;
	bh=jOE0CSh8ox9EXM8+5H/rT+NIWygOxY5svge8bmpNeDw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gkPFBhQPNg/GmAoXUIqvWfBHrFD/6jSYd+tPNux2j48wSvXPsEZ1rmUVOlAeDvh1g
	 e42pH29Gf3F2XVpuGLkTt84e3+Aw+ghCsCXE164mBGwKyOzF9IsSNl9Ji13TtgoaI3
	 bMn/PSI7FEzf4opNBiK+EVs1Qy2E80CxkEpO7vtsZpab66alQRLmHtgfOLNRlG6I3I
	 i1PKDpUGqYTanrT3jd3FRQm24A9YN0Ujo5sGWU1TwTK/IaQg9hNWjugzbqaUePCSmC
	 UMetNoR5n5JDdCKEtpSBJmNNhIQrpaFYigNzZpUclHRIYZsiIRcfKm/KPfeDSMcSBK
	 aznZ7JhGKGygg==
Date: Sun, 30 Aug 2026 12:00:10 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: int3472: unhandled GPIO type 0x08 leaves the rear camera dead (Surface Pro 11, Intel)
Message-ID: <20260830120003.35709-1-lsa.uz@pm.me>
In-Reply-To: <20260830112736.85573-1-lsa.uz@pm.me>
References: <20260830112736.85573-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: cc760786752fb274dbc3651bd4fd7188c347276b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Following up on my own report from this morning, because I should have
found this first: the question I asked has already been answered in
public, on a sibling machine, with patches.

  https://github.com/linux-surface/linux-surface/issues/2153

djmulder worked out the Surface Pro 10 rear camera - the same OV13858
behind the same OVTID858 ACPI id - and identified GPIO type 0x08 as
DVDD, a second digital power rail, mapped as con_id "dvdd2". They also
found three causes my report did not mention at all, because I had not
looked:

  - drivers/media/pci/intel/ipu-bridge.c has no entry for OVTID858, so the =
IPU
    never recognises the sensor even once it is powered
  - ov13858 never requests or releases the reset GPIO; the sensor is held i=
n
    reset by the INT3472 and answers on I2C as soon as it is let go
  - INT3472_MAX_SENSOR_GPIOS is 3, and the _DSM here declares four, so the
    fourth would be refused by the array bound even with 0x08 understood

So please do not spend time re-deriving any of that on my account. My
apologies for the noise; I searched the kernel history and MAINTAINERS
before writing, but not the place where Surface owners actually work on
Surface hardware, which is the obvious first place to look and is entirely
my error.

What I think is still open, and what I can usefully do:

None of it has been confirmed on the Surface Pro 11, and the two machines
are not identical. On SP10 the 0x08 GPIO sits at pin 0xC6; on this SP11 it
is at pin 4, with the whole ICL0 descriptor set at different pins. The
thread also notes the two models use different sensor clock rates.

I will apply those four patches here, report back whether they are
sufficient on SP11 unchanged, and say plainly where they are not.

That thread describes its own CLK_IS_CRITICAL and always_on regulator
constraints as too broad for upstream. If you would rather see a different
shape tested - a DMI quirk, or teaching ov13858 to request its own
regulators and clock - say which and I will try it here. The machine is
available and I can build and boot kernels on it.

Thanks,
Sergey


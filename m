Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD34372EDB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434095; cv=none; b=Q1tFuLfuUZ59Z5xQNmWySJT+D0U7KMKIualAiWM2L7NWBN8c7vKbxnGS3Mrg/X3EUyuxYI4GaXga2sCVXsnsas3PCi0S/mZeetXLsVSIl2AVF8Cqcw5N5gHwbUVgQvPVvzFUJ/VqKMnsJgPYGnhtHEgebtD5L68doRuZJGi/dHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434095; c=relaxed/simple;
	bh=JInu9RYj3meTFMOjD56CoUcJTLFeKLu345HSkoY7Z3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkMzF6dew8yre6iYuR9AtNyMYSCuKm8P6gPwAvsQDX9MSitDpS+NtVNTkxtqaLuq/5vusHHZQnSpifcKdyUyEmthYZuOThlYOHUnt5dDKkOip6LFz7RE1hDyHK4JyYduIJalPtaXAWalpnq8uGM62nzazpT3ykhc+dvh3uxMZrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cBJZFXtD; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cBJZFXtD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JInu9RYj3meTFMOjD56CoUcJTLFeKLu345HSkoY7Z3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788434091; v=1; x=1789038891;
 b=cBJZFXtD1NhHIIiJeAhJgzGarO6fOSWJXXWM0lNcFd4KEpJiJ/0sU3Cx7JWiL07uI51U1PQj
 0kDd4jrkIjfhb4MOK6WG0wioTC2y+TcqWamfV6R/ocd8TGfRJnmCKsNC6xONc1VAoS4rzF2sMOi
 mYpmxWAxe2GJ8CgPxACplaws=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c91ac9610bc2dd52;
	Thu, 03 Sep 2026 11:14:51 +0000
X-Mizu-Trace-ID: c91ac9610bc2dd52
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so5117e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmfv5wXILmLVbxzSQF/TbHdLFM86rkn3wmwAszvSd90xLeeajWVLjnuv+bxfCUzhM527TJ29bYDNELKZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkTM2FEhcjw47NK2D2rj3nkaTXp9vxD50sy0T/AhoJRxpUp+Gq
	5Iv5ifVtQm+Z3WBOuPJbdf/D21Y7CFTkilsro+GNQv6lMYcr/NPc8Q8Ah2629dXaPd+5O121VYu
	5VXDOA1zvRH/tiMr4W9aMMdRSiLeaje/gqiUiKSmr
X-Received: by 2002:a05:6512:2528:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b60f9703bemr75474e87.11.1788434086181; Thu, 03 Sep 2026
 04:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903084809.2027326-1-fuad.tabba@linux.dev> <cf59d824-80dc-446f-9b1b-ac9841a96a9d@arm.com>
In-Reply-To: <cf59d824-80dc-446f-9b1b-ac9841a96a9d@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 3 Sep 2026 12:14:09 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyT=bt01sALTgC7TFFYK8HM8j7aEd0Vg40Jrn1_z-jf1Q@mail.gmail.com>
X-Gm-Features: AcwNN1UwS0XUDiblUkZ9DGKXpH34SnYOyjjK7mojy0pO5pMFvqZv9Yc3DnNoNco
Message-ID: <CA+EHjTyT=bt01sALTgC7TFFYK8HM8j7aEd0Vg40Jrn1_z-jf1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: mpam: Document when to set arm64.nompam
To: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Thu, 3 Sept 2026 at 10:55, Ben Horgan <ben.horgan@arm.com> wrote:
...
> > +arm64.nompam
> > +============
>
> This assumes that the reader already knows or can guess that arm64.nompam is a command line
> parameter. Perhaps the section name can be 'Command line parameters' with a single 'arm64.nompam'
> subsection underneath or all in the section name.

Will do: a "Command line parameters" section with arm64.nompam as its
subsection.

>
> > +Firmware must enable MPAM at the highest implemented exception level and
> > +leave the MPAM system registers accessible to the kernel, or trap the
> > +accesses and emulate MPAM as disabled. Where it does neither, the CPUs
> > +still advertise MPAM in the ID registers, the first kernel access to an
> > +MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
> > +for that firmware: it makes the kernel treat the CPUs as not implementing
> > +MPAM, so no MPAM system register is accessed. Set it only on a machine
> > +that does not boot without it.
> > +
> > +It is not a way to turn MPAM off. On a system whose firmware has enabled
> > +MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and> +MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN.
>
> Enabling MPAM at EL3 is separate from disabling traps. Setting MPAM3_EL3.MPAMEN to 1 means that the
> values in MPAMn_ELx are used to determine the PARTID and PMG for CPU requests. At this point EL3 can
> configure the PARTID and PMG for the different exception levels and MPAM can be used in the system
> under firmware control. Setting MPAM3_EL3.TRAPLOWER to 0 is what enables EL2 to access the MPAM
> registers without trapping and configure the traps for MPAM register accesses at EL1.

Thanks, I'll separate the two: TRAPLOWER being clear is what leaves
the EL2 trap controls unwritten, and MPAMEN is what makes a guest's
choice of PARTID and PMG take effect.

> > KVM still
> > +hides MPAM from guests but no longer enables the traps that stop a guest
> > +from using it, so a guest may be able to choose its own PARTID and PMG.
> >
> Shouldn't this also mention that the MPAM_*_EL1 are not save restored and so if the traps aren't
> enabled provide a side channel between guests.

Yes, I'll add that KVM does not save or restore MPAM0_EL1 and
MPAM1_EL1, so what one guest writes is still there for the next guest
on that CPU.

I'll send a v2 with these once others have had a chance to comment as well.

Cheers,
/fuad

> Thanks,
>
> Ben
>
> >  Reporting Bugs
> >  ==============
> >  If you are not seeing the counters or controls you expect please share the
>

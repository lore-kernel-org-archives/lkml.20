Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B441B362
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787782158; cv=none; b=E5gLxzaMe3oz6NLrcUdntdJOLoVQfpUIchKmDRHbXXZe8jqWw+zFSXiPQymwTsKXOt3S3NO3NXgL5cXyF6l/8apE+wZeFoLu0mSuN1NyTGh4Ju0oWhR+nSZ2KpF/vS0IezL+5KtjDOG8uUW0to6vQSxR5jrVbsvMYGqAEfiWgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787782158; c=relaxed/simple;
	bh=Yw3MQh/OFK6YC5nj2b5LHhVJ/FGQEIzYpkSWqgAVzmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzFYcbcvSWl8FrqzHhPPd0bnSgWepYJ+Yhj7FLbjf7ETSFfxMUPIHT+9j1DcpltR3j7piebqw4nzAU+SDLnMZNgM0YaEwIFKWpVUx71Vwvr32ERQ0SuedntU50zYfly7007NIAv1M/7dlH4dYKJ2j3WAlNBNygNR61JzSX947tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bDTM4eIp; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bDTM4eIp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yw3MQh/OFK6YC5nj2b5LHhVJ/FGQEIzYpkSWqgAVzmQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787782153; v=1; x=1788386953;
 b=bDTM4eIpXWBsOqh/Z8UmszBGij63IW5C9XzO2+h14gDAiP3j4vZjSEVCLXkKg0upHOEqvBL4
 fn0IR/sEteVyJeqhaWNA7JKkNTStrUDYhSAKr4Ft0R8vWy+UVBnwLkxQ3LWev4IF4mvZbaw2Egl
 2spltYb29hJhDe8/i/WR14zA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from mail-lf1-f48.google.com (209.85.167.48)
	by smtp.migadu.com with ESMTPS id f86c97253866f4ed;
	Wed, 26 Aug 2026 22:09:13 +0000
X-Mizu-Trace-ID: f86c97253866f4ed
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so1405e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoN9hiaT8s3zffRbE5DUL4J5Q5x47EyqlsIzCCmYiqdfJsBV177K1whQBps0LPsSU4pHu/UUuB6NCZMIec=@vger.kernel.org
X-Gm-Message-State: AFuF++ndeJE5jzPYy6HD3cTt6UNU8wEdsyr1fcyXZjXPob4HX4aNxDn9
	7pI/ajPVLwPuaE+pncPFXFzetVVDdmCafctAbg+pZsUAPJbQKddzaDgnmnBBEauNBdsq9rlyHAB
	egcGjzYimm/LJHp8j5G650MDFEzbY36to5R0l0OJP
X-Received: by 2002:a05:6512:3502:b0:5b4:9dba:4ecd with SMTP id
 2adb3069b0e04-5b503831de7mr21458e87.11.1787782148264; Wed, 26 Aug 2026
 15:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
In-Reply-To: <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 26 Aug 2026 23:08:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
X-Gm-Features: AcwNN1VHViyn2yKtdSqUAjBUdbIAmztuL_h9bkSS25W3YELWBQ-0YqvkOY06ffM
Message-ID: <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under arm64.nompam
To: Ben Horgan <ben.horgan@arm.com>
Cc: Xi Ruoyao <xry111@xry111.site>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Wed, 26 Aug 2026 at 15:48, Ben Horgan <ben.horgan@arm.com> wrote:
...
> > I was wondering whether that was deliberate. AFAICT, restoring the
> > writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
> > it may not be safe on the machines the override was added for. I have
> > a patch restoring them, but I learned my lesson.
>
> Yes, on a system where the firmware ignores MPAM, MPAM3_EL3.TRAPLOWER will be 1 and the traps won't
> handled and so if MPAM2_EL2 or MPAMHCR_EL2 are touched to disable the traps then the f/w will panic.
> As you say, if arm64.nompam is set on a platform where f/w has cleared MPAM3_EL3.TRAPLOWER to 0 then
> the MPAM registers may or not trap . This is different from other features because the EL2 register
> than configures the traps is MPAM specific and not in a generic register e.g. CPTR_EL2.

Marc's "Fully disable configured-out features" series [1] runs into
this too. MPAM may be the family member EL2 cannot put into a defined
state on its own.

> There seems to be no way round this other than documenting that you should only set arm64.nompam if
> you are sure that MPAM3_El3.TRAPLOWER is 1 as you otherwise have a side channel. What do you think?

Documentation it is, I'm afraid... :)

Is there any way to find out what MPAM3_EL3.TRAPLOWER is set to? If
not, could the caveat go the other way round: arm64.nompam is for
systems where firmware ignores MPAM, and should only be set on a
machine that does not boot without it?

__activate_traps_mpam() is gated on the same ID fields the override
clears, so KVM stops trapping guest accesses to MPAM0_EL1, MPAM1_EL1
and MPAMIDR_EL1, while still hiding the ID field.

I will send a patch for Documentation/arch/arm64/mpam.rst, unless you
or James think it belongs elsewhere.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260302115653.1517326-1-maz@kernel.org/


>
> Thanks,
>
> Ben
>
>
> >
> > Cheers,
> > /fuad
> >
> > [1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/
>

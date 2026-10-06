Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CA4418D7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292772; cv=none; b=ua12DcKCKD0WdAEAm3vsY0V7PBcx5NQG/Su+c7BdpS1Lzb2varyoaPxZH6GS76OMS8SulNc1XC3911iqZY8nH09fy0ZT0g/X9uzY3tUbn4vr4yC6N5SY7c8FiqeL9J5H24Lg7xwAchWq3aBf3EeL/Jg2TYRiofo8P5Ph5YphGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292772; c=relaxed/simple;
	bh=8qhe/p55ZE1Kz6sMMB02BhuqILnoV4Qe7TICQlsgGOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMgh2iqMozlgfKROre+Pa7KY6h4omxUwu7uOYyyiMpm5vFDTlVANoyUsIzdl4jhLbeD9ulPAQ+Mdw8bSyebf4ffkC65xkm+sPoZEmsGPxQGTd6Eieo5InqUVIhe2XL35fxpf8VfSvg4PNHdyWQhzlIGvn1uDvEJPI/erdM5dMr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p8selGPP; arc=none smtp.client-ip=95.215.58.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p8selGPP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8qhe/p55ZE1Kz6sMMB02BhuqILnoV4Qe7TICQlsgGOQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791292769; v=1; x=1791897569;
 b=p8selGPP3C/KznRMu+FTTt9It0qxuHlDZKh773AIs8JWze39m2xjjaq10UQ71B0EaHj7LVWY
 V1GQ8WxOPiO/10bKTMys3YNFTEXWN4oV6H48cAfCIDOvmvuoODUnZAF0cvkP8+rQMbU1QHPUzYl
 g6Ep5wmGNZEREGbJhLuIZkas=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 451c19628f97a7d5;
	Tue, 06 Oct 2026 13:19:29 +0000
X-Mizu-Trace-ID: 451c19628f97a7d5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so6470e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvJbS/5Au4NBJ//2T2p65Tz7l0DIzCMdIIdm4xBi2mYbN58dHGD0P/eLUfef3uRmt4ZSmRw2daUu3Mb8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXJsmDHaMEan7nx5uQN7sxeOpF2/fvhq9lH6S1qVbZ9d9bLXyM
	rRcg8cNMOg4GPI9mgvK6MINgXZwKNzV08IEAwMj06x0MTcE6TMbJHm6g75HdYF3YBaxI1gjEPIO
	TwdtQm0Bl1Sq0UxUHDpOmxylEACDvCXdQBkgVUp+Q
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr123999e87.8.1791292766315; Tue, 06 Oct 2026
 06:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006092826.2201763-1-fuad.tabba@linux.dev> <asT0g8CcKoXBAmfi@kernel.org>
In-Reply-To: <asT0g8CcKoXBAmfi@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 6 Oct 2026 15:18:49 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzimjyBCPZ-SDzOHWTk1xCAiC4TbA18TeMwiw2324raEA@mail.gmail.com>
X-Gm-Features: AclHuK_KzKWaq2Wxpe7q-nJwzUHg_Ej9eV3dHBV49YDQb3SMjB8JKJGtmUuaTbA
Message-ID: <CA+EHjTzimjyBCPZ-SDzOHWTk1xCAiC4TbA18TeMwiw2324raEA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Mask SErrors in a protected vCPU's host
 copy at first run
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	vdonnefort@google.com, qperret@google.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Tue, 6 Oct 2026 at 15:15, Oliver Upton <oupton@kernel.org> wrote:
[...]
> > +
> > +             *vcpu_cpsr(vcpu) |= PSR_A_BIT;
> > +             __vcpu_rmw_sys_reg(vcpu, SCTLR2_EL1, &=, ~SCTLR2_EL1_NMEA);
> >       }
>
> Urgh, I hadn't realized that PSTATE.A is still modifiable by userspace
> prior to KVM_RUN. In that case, I would prefer the vcpu_has_nv()
> approach that I had recommended as a backup.

Sure. I'll respin with that.

Cheers,
/fuad

> FWIW, since pVMs do not implement FEAT_SCTLR2 it should not be able to
> write to the register at all.
>
> Thanks,
> Oliver

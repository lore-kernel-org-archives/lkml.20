Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F118E43DECA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123447; cv=none; b=crgG0ZoooAl/IFqfDBg/8+Id3FXFPnn8TVhDr2V9qrRrxFC0RxlMXXtjteu77eE4V4JF+sMHvIBvl92bRXs1IFa0RD96lLVZSHjt1mELGwYAoGgDsYAxDFfm+cPdDfKOvjvfbc3APnLnuXLZ7R4++XGN/XFmd0+JDbjCSqMN8tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123447; c=relaxed/simple;
	bh=dt7W7qoqMvN/pTVmBCQfsmPq57WbDOVswaYdZJuMgEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMe5+Sb2imH2MvC6CXCT6J+gl3b4GOGypWRTWZtTvOIvCItuyUhNmyU0tL9XvhaFDMXUVRCE0rjeCP5xq+BiRV5NdQ1a2oBYEwEIE9hbuW6GJXuB5CnZz1FpDWTAmS4Zs0Au7D2DjT5SN7dkJZ/8cIUPJaGj7a8xYZOaM+1K290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RIlB4Thb; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RIlB4Thb"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dt7W7qoqMvN/pTVmBCQfsmPq57WbDOVswaYdZJuMgEM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789123443; v=1; x=1789728243;
 b=RIlB4Thb+YX3VsjQtfMsck+mm6Zfh8XjD4cM/nm1sF2+PWpmsnCl3367U7Bakd1bEv4JqMLM
 bHeQrRaChRPYpcztYoXikR5v5zOd/p7G6JrJTdFf/MHiaWOZvGVMAKJPyoJL/+H8p4zjEN9mZ4C
 1/lZ89IUVWT2n2pgNQOTCixs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3907296b233dee63;
	Fri, 11 Sep 2026 10:44:03 +0000
X-Mizu-Trace-ID: 3907296b233dee63
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3695e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:43:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy20K7kKxnGau9Y9nxEzi9osWFke0hOqP+TSVmZRQztGd0Ntp8Q+A1qqSZ4ErLwEYGMTRRDpVGpMZm5GeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nofcS9AFNjfntnDjEi4nMgANgPkKa3CjkN9+ioVBD0D0o9LdSL
	5W+E2zyKNW+kz86JOIWTRgjfVhtTcKi7CIIFjxtfMwdOOAx8i862MQ6DEdcuvfdSABk08WIjxS0
	j1CF3Z+CR1fJmX00Vq0cYduDnIBAuYibahXsmuch3
X-Received: by 2002:a05:6512:6204:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8a05364c4mr124575e87.0.1789123438690; Fri, 11 Sep 2026
 03:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908145651.2828597-1-fuad.tabba@linux.dev> <86se3h748o.wl-maz@kernel.org>
In-Reply-To: <86se3h748o.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 11:43:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzos572k==mryykXi98Z_Ok_WKy=1nyv_P=+TmQSbOzdA@mail.gmail.com>
X-Gm-Features: AcwNN1VahT4s9utKWdo2oybbVii_jsZIqb7Y0hgJ-TEx-cPBPTlX6iufnxeQGOQ
Message-ID: <CA+EHjTzos572k==mryykXi98Z_Ok_WKy=1nyv_P=+TmQSbOzdA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Xi Ruoyao <xry111@xry111.site>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Gavin Shan <gshan@redhat.com>, Yuan Yao <yaoyuan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 12:08, Marc Zyngier <maz@kernel.org> wrote:
...
> > --- a/arch/arm64/include/asm/cpufeature.h
> > +++ b/arch/arm64/include/asm/cpufeature.h
> > @@ -873,6 +873,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
> >       return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
> >  }
> >
> > +static __always_inline bool system_supports_mpam_sysregs(void)
> > +{
> > +     return alternative_has_cap_unlikely(ARM64_MPAM_SYSREGS);
> > +}
> > +
>
> What is the rationale for choosing alternative_has_cap_unlikely()
> instead of cpus_have_final_cap(), which is more wildly used?

Not a good one to be honest, and it's gone in V3.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449734CC29C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830281; cv=none; b=klG99x11z3MUol4QPwjbxwtbMzsMUVGYyVNk+Ve7jv6hzhpgF6qHSNuvQiNrrTRZQijwj8XZ2pZgzOOcofZLLIAII12Qr+11HYD3U1c1325lV0orJJg1/mNybGWFDGG2y96UVXdkM7Lb/Ur/6GtEEKEvjRDJdpivnfwcVoIBls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830281; c=relaxed/simple;
	bh=PAJwNoyeV9qo8z7bFLcFxGpJsVQgzwLwwepP4CadQZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IC4RHlsZsE7jvgZIvIuBQYIaC6OPIiHHWoUKrdDSjuPQjnnCC8kbMR/OKmrD9eU2ShHns28rKQP7lr2KfB4Qnp+FAdWIHQAYb1TpvvIOg9RMEiXd7+dNa92oMjWc1v0wUQV770pMqOsTpM3pFo3cWigAt3DESUAyo/Ib9/qjY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PlhnKckC; arc=none smtp.client-ip=95.215.58.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PlhnKckC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PAJwNoyeV9qo8z7bFLcFxGpJsVQgzwLwwepP4CadQZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791830277; v=1; x=1792435077;
 b=PlhnKckC3xVjTIgA7jkgMz+6uNK++R8qduphQEm8UXYeMi4ik9yo1ND3wI8BnrHqEozKOJLf
 6GE73bBy+LDfY84oVf9Bg9tI/2AI5i8FNdSWKvf9k3i2GuHla8TpbsH6bd9BRcZ9yu+VoNTwVGw
 ISwGGNwok5dqUXPrNAOVuAF8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 353fe57a3cd0ba8a;
	Mon, 12 Oct 2026 18:37:56 +0000
X-Mizu-Trace-ID: 353fe57a3cd0ba8a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so10929e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:37:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwi72reXKK95gMV+ICIqa3ckBdRtdsIa+GfVhc9a39QePFsSCtrV2HqtIM+FIPQ1rMyDgJ3/t34IhJWHuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE0wddS5j2qVdanwzCIMtF6xI2ef3TyyzCGEO6m2AGYSDr7g/O
	sqGSQNY+Jq5qFfwLWr5P58rxybfR7oWpW6TOBjwEx9OnYuiFTnZXKIXGDwzUH8d7oyYu0RzozYV
	eEFotAZVES4B1SQvZGzrkK/cTmsoW2Y2EhhPe/l4x
X-Received: by 2002:a05:6512:6204:b0:5bc:f1dd:f0ac with SMTP id
 2adb3069b0e04-5bcf1ddf0c7mr137133e87.1.1791830271913; Mon, 12 Oct 2026
 11:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012084743.2228612-1-fuad.tabba@linux.dev>
 <8633ub2mlg.wl-maz@kernel.org> <CA+EHjTwyQPPVG4tGY0i0DRk=kwbdEmjca6+GNjLDXrGxkNbMOw@mail.gmail.com>
 <86zewi23ga.wl-maz@kernel.org>
In-Reply-To: <86zewi23ga.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 12 Oct 2026 19:37:15 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy1zAoOH32hsf0cHZGP1C-=uVBSJS91QGZ3_-NkKJEKhw@mail.gmail.com>
X-Gm-Features: AclHuK_918Jtmjw5j4JcpJhTo2ueYx7ntIhbD08RWsI09XibC9OrOgTwIR86Ta0
Message-ID: <CA+EHjTy1zAoOH32hsf0cHZGP1C-=uVBSJS91QGZ3_-NkKJEKhw@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: vgic-v4: Don't forward an LPI with no
 target vCPU
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 19:12, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 12 Oct 2026 15:13:51 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Hi Marc,
> >
> > On Mon, 12 Oct 2026 12:18:51 +0100, Marc Zyngier <maz@kernel.org> wrote:
> > [...]
> > > Isn't the core problem that we don't correctly handle the UNPRED
> > > double mapping of the same LPI? I'd rather we attack the issue at the
> > > source instead of papering over the consequences.
> > >
> > > I hacked the following, which is obviously untested. Can you give it a
> > > go?
> >
> > With your diff on rc3, the second MAPTI is dropped, and forwarding the
> > vfio-pci MSI to its event leaves the host up.
> >
> > However, a vgic_irq outlives its ITE while the LPI is pending on a
> > vCPU, so the check also drops a legitimate remap: a guest that
> > DISCARDs a pending LPI and then maps it again loses the new mapping.
>
> But this is yet another bug: 5.3.4 is pretty clear that DISCARD should
> get rid of everything (pending bit and mapping). I reckon this is yet
> another case of the initial implementation being overly worried about
> kicking vcpus out of the guest when destructive action is required.
>
> We should fix this.

I'll add a patch to v2 that makes DISCARD clear the pending state,
kicking the vCPUs out of the guest first when the LPI is queued on
one.

Cheers,
/fuad


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

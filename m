Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1509649B456
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399839; cv=none; b=cRIiKk0htuvLby3ViniIzek53xLLkQD/tO4XsbbOPpKxurR1aVLhwPeU/BbnmGlHrk+2FXy0r73ZPP+Uxd3UFcnN9R8ENEsT7gUydDeGWUx+XtXJ1Ud3f3eVpzO5IXMoHbSsZTMM93ZpgHCakOvZhZ4yHhVSBIIB1XOREs9+mKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399839; c=relaxed/simple;
	bh=smuPfukUTEhnLlad9GsBi0MdMFhYsr8EsSBrkOpeT54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZhFvHcA2oBxtpdt7u9/HnAgsKq5R3SMvDpLIHXIV+N4Yl0Or6zd8isqLiqSBfeFSOG8opzD+5lYHXFpc17vcAQ3GL2JYjOzCa1pS181Zcu8OI1yk1qYalr51jeTRWAXNPeta6e0Zlw83Is8R3/MVc/xyt5T2MnRuv9fy1Kcvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CnVNoI7W; arc=none smtp.client-ip=91.218.175.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CnVNoI7W"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=smuPfukUTEhnLlad9GsBi0MdMFhYsr8EsSBrkOpeT54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792399836; v=1; x=1793004636;
 b=CnVNoI7WKYqX4ZhlD7DL/KlSqj6WOfzOfBqX0ZJbLEfD82y0q/siPiANqTTgnkRWCMj5yKn9
 fGpgXDlLAauSv5gCB+8S+NQizRl5VX/6f7+XMc12kiOUaSlK8e0b8W8iQ8zhmiZaQG6CH83Rh9p
 Bu3dqT9n87cJv/lkSMGAwH9c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09bc3943cbadfe4b;
	Mon, 19 Oct 2026 08:50:34 +0000
X-Mizu-Trace-ID: 09bc3943cbadfe4b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be58ad9600so3752e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+BQbm7SHe0DgjQU26jaoENybr9PV77RTh7C2rWauy5Xb5f8UsVN1d3nzkSeSDd7GYK5bNTgK/7/R7jwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlrVmW4hLM2FMFhys2HXyt492TaAOAc7vvyvnvOTbmiv23ZgVM
	oTmPCIbXH4GEGPaFKqXpSL0a9nd2Q8UoUTRztBmv+RInHaVUH25IvI2GdE0v19mpf643UIsX8Fs
	GY/LqtwsszQqKmY7LN01VLYGC49f8yFIa8gYzNEBo
X-Received: by 2002:a05:6512:ace:b0:5ba:3602:4343 with SMTP id
 2adb3069b0e04-5be51d51c40mr121150e87.16.1792399829578; Mon, 19 Oct 2026
 01:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018080921.3942517-1-fuad.tabba@linux.dev>
 <8633u229lq.wl-maz@kernel.org> <CA+EHjTwHP7h_=e1s-iCDekMNvHGAQA3K1zv5v_4=PXQw9ueiFg@mail.gmail.com>
 <861p9m1709.wl-maz@kernel.org>
In-Reply-To: <861p9m1709.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 19 Oct 2026 09:49:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyDJ87A3e7tr6Q2UEvi9BRuuu5HQ90A_3VWaOFKnRmZkw@mail.gmail.com>
X-Gm-Features: AclHuK_GC1ojwYomVv0QIMlxdcqQYksqozcLWRejxdRqCJ0NJlVWgmqtZaSv6zY
Message-ID: <CA+EHjTyDJ87A3e7tr6Q2UEvi9BRuuu5HQ90A_3VWaOFKnRmZkw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Only enable S1PIE and S1POE with the
 features they imply
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Mon, 19 Oct 2026 08:31:18 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > I'll send your patch as v3, rebased on -rc3 with you as the author,
>
> Please at least add yourself as a co-author.

Will do, thanks.

> > once I've tested it. I'm dropping v2's trap table changes, since
> > they're redundant once the ID registers are sanitised. I made two
> > changes to your patch. The sanitisation now runs before
> > kvm_init_nv_sysregs(), so the nested RESx masks are computed from the
> > sanitised values.
>
> Isn't that already the case? At least with kvmarm-7.4,
> kvm_vm_finalize_sys_regs() is called before kvm_init_nv_sysregs().

It is. -rc3 doesn't have Mark's split of kvm_finalize_sys_regs(), so
kvm_init_nv_sysregs() still runs there first. I'll rebase v3 on
kvmarm-7.4 and keep the call where you had it.

> > I dropped the res1 half, which isn't set by anything.
>
> I'd like to keep this, as it will eventually get used, just like the
> recompute loop is a bit useless for now, but will become useful in the
> future as dependencies get recomputed.

Ack.

Cheers,
/fuad

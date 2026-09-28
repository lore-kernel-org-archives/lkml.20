Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43C3644C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577384; cv=none; b=SZOCQDJsjXseZ4dvlNY3k+9d7aXNdsF9RG8Qykyyw3jdtX3o2Wfs2X0DyaZpc5AWbjGgeH5xPwH/cVvstXxFl7xz/eMYjpbVQ7zHPP9TnH80S3SpSyS2yBOmS73S80pAh1NK9NNtC6mAOtKa6NvPtm5BgdhGxoT6JmP0ktZvsfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577384; c=relaxed/simple;
	bh=XmPJSx18eqJeVxHruAgtYbCK0Co0IzaObDatai+KAlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkEc1GxBvxO2LoHLFOCCrtIEVybaguRF1ituX8gUTIwXKZjHFF5P+11rauRx5YAdcXOZUA5GiGJL4MO1vJfhbu45l0/xi2mcVHHMEvkrlMZrVlOhwBY2t7SVwi9Hh5LrptqUTB55PSJ+TD0P8e7t52uj0eXO1LFljNgwGA+w17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CNft8E1v; arc=none smtp.client-ip=91.218.175.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CNft8E1v"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XmPJSx18eqJeVxHruAgtYbCK0Co0IzaObDatai+KAlU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790577380; v=1; x=1791182180;
 b=CNft8E1vZBJBk4nddyd1gfnNqz8/0sLsDBi71zGVNb1wRX33hS9S9zfQdAjJNmIzavGZsYjB
 Vpb0cQ21bgAzOpRSVaRAYizHy1VfLnw10ZHOdApZH71v6qjFixgr1P5ia1lwEseYBrjprWSYYDr
 Z9YaMU/a7Ne7mtM0F2R7jS88=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3c5904167a77e78d;
	Mon, 28 Sep 2026 06:36:09 +0000
X-Mizu-Trace-ID: 3c5904167a77e78d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8c42da963so8886e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRIEnQzvTqOWjfNDIKGQ4j7ne3nEKS4Gi78258m8q3Dx6tHreOjVVl4SrmG9Qw8YwxyeIiHEc3Bhz2Fog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvYqbLw9F7Dfi5PR0BllbRnYigmNksfiUYUYmHOx+HAYVMcDod
	+aqExGaYJ1loX4KP8hCmiUqoltXhijK0QC4ozNquxrW+mVnjkozuhAmTMEBe3loDeRArlSE6NN+
	J92JTwM3eSWgDO7uZYEY9L3AY5JLK4FcRmdiXrRTM
X-Received: by 2002:a05:6512:3414:b0:5b8:e83d:6c23 with SMTP id
 2adb3069b0e04-5b8efad55femr120630e87.15.1790577368622; Sun, 27 Sep 2026
 23:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925090619.852995-1-fuad.tabba@linux.dev> <20260925090619.852995-4-fuad.tabba@linux.dev>
 <87y0cn2gys.wl-maz@kernel.org>
In-Reply-To: <87y0cn2gys.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 07:35:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyk3t4EA8O9i9NmFMuzVY-GQR3J3SkRz=_9XM0jrvy60Q@mail.gmail.com>
X-Gm-Features: AclHuK85fW7vrPFrlWsC7DIcsxs-RY3lLVk9SII-CnTwoETGC8BkTe57Cq68c7k
Message-ID: <CA+EHjTyk3t4EA8O9i9NmFMuzVY-GQR3J3SkRz=_9XM0jrvy60Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] KVM: arm64: Use the host's HCR_EL2 for
 non-protected VMs in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Sun, 27 Sep 2026 10:15:07 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > ATA, an owned bit, stays clear, as pKVM doesn't support MTE for any
> > guest. TID2 and TID4 move to pvm_init_traps_hcr(), since EL2 now sets
> > them only for a protected VM. A protected VM's HCR_EL2 is unchanged.
>
> But the host does set these bits for non-protected VMs. What is going
> to honor these traps?

The host, as it does today: the traps of a non-protected VM that the
hypervisor doesn't handle itself are forwarded to the host. What
changes is where the bits come from: for a non-protected VM they come
from the host's HCR_EL2 with the rest, and the hypervisor only sets
them itself for a protected VM. I'll rewrite the message to make that
clear.

>
> No mention of why you are adding HCR_EL2_GPF here?

It was only there to name the bit in the mask below. It's gone in v2.

[...]
> > +#define PKVM_HCR_EL2_OWNED        ((HCR_GUEST_FLAGS & ~(HCR_TWI | HCR_TWE)) | HCR_BSU |        \
> > +                                 HCR_E2H | HCR_TGE | HCR_TEA | HCR_GPF | HCR_TERR |        \
> > +                                 HCR_FWB | HCR_DC | HCR_ID | HCR_CD | HCR_NV |                \
> > +                                 HCR_NV1 | HCR_NV2 | HCR_API | HCR_APK | HCR_ATA |        \
> > +                                 HCR_DCT | HCR_FIEN | HCR_AMVOFFEN | HCR_ENSCXT |        \
> > +                                 HCR_EL2_RES0)
> > +
>
> The name of the macro doesn't indicate that this only applies to
> protected VM.
>
> Also, please don't add new uses of the compat HCR macros. I really
> want to remove them (probably post -rc1).

Will do: the masks in v2 are named per VM type and use the HCR_EL2_* names.

[...]
> This feels fragile. You start with a restrictive set (TWI, TWE, VSE),
> and then drop it all. At this point, I have no idea what you are
> letting in.
>
> It would be better to express things in a consistent way:
>
> - either the bits that are controlled by the host for either protected
>   and non-protected guests,
>
> - or the bits that are controlled by the hypervisor for either cases.
>
> Here, you're mixing both, and that's confusing.

Ack. I'll go with the bits the host controls, one set per VM type:
TWI, TWE and VSE for a protected VM, and those plus the per-VM traps
and virtual interrupts for a non-protected one. The flush then applies
the same mask logic to both.

Cheers,
/fuad

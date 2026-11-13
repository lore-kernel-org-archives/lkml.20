Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794589747;
	b=iTv3KIndFH2IEoe8117I9UX+OT7l0OQN2pQjgM/Iwule/pBOvFHXkdJwczFPzWWb/9bA
	 v55hDRufXQX6GJJrcH4HqiobcA3XBt6Efwt/16r1a5Z1DNkY3mwMJ38ogcloP9he1a7GH
	 dKdckwf6a0ZYQuGwWY/VwsIF+9ZDoTooLgibcZpHH7FFbYrbj62YPb5jNI8T77iJXm/Sn
	 vowJeRweEiYZ446+KGLjSOQ6mGuhl7nClu4R0Og2o9EL4iGuvivN49R13Q86K9V3S4j5a
	 9pZWpgCAQRrAEiwy7Ty4mXjDI05XZtrHiVls27bZvI6meBYUETA3Lxass3GevFwNvqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
	b=5NEKwWxHQCZ/4d4TrQuPgp8oVZlWVFT2zd4xmHqHuloZQ1kCj8wrW4YvOw0Km62nojaS
	 NdotR6mHdXi4xwqbYN3jTJympIsCD1yLt5PR9rjQmgFiKknTXCb9VBW/SWSfMMh8nwS2V
	 pqR+o2QoEljiPq7gO5RYeSydIo6nGSBUUOm1Opnfil0dSfP/hH1qMmcbE71v81Vm0xHcA
	 PjsPJyzfL/CmZYBMKCoHz92jtGVw2rkR9kfP3KVUdp67rUJaBMs2/AWabRjIYCAMNRfRN
	 qrNYqLb3z7g6FaxkzAwrVhldeVYC7PBErzWcJyRFk4CcZ1oS3el1ls/ulmP3oL71cwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYpt8qHU;
	arc=fail smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170F8606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170F8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYpt8qHU
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67d8221074dso1302735d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589746; cv=none;
        d=google.com; s=arc-20260327;
        b=n7+QxskEa2UAGeACcZbNIBX8+rat3XwEQT5EV8EagDd6J9xcnPbZMMiEKQS702iw6h
         Sa4We+oVjzZ3HjSudPOLkAO/yY62RHiSkTdyLOtVUdOOByKva3wFg7lIod1DtFgJOKhU
         5BXMAPETvXAnQTOmwY6X09T6Beij0rSAqqCTecHzrgeSqo+zBziVMuuWa5QFQtgStPxg
         eaRNQADZB484xnRcIubRDd79p0XMGxuWh12ZjBdzCt9N9ylNxygmYXqzhsPIx/x8/ceT
         BwYXCwR1S0aQGoYckQyZaliTfVfm+1CnDhJZHy3wZqTJHRsajsm5TGoi8Ayu1WsNpveV
         T/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
        fh=FvFelN2AJnKUXF6pbU1JbpGbw2PpbvEGICKQACHEXlU=;
        b=SwYtDoP0wFfM4ingPJ56T8cEBvLgPewAWqL9XVlPMdbh2pngC/joFMZW66pIsarq1N
         hG46izlxzS4iVzprwlLDNfWuxIh+NpKXP36DPxLvSpXDIFGQyaXXYeVWGu0uk64EpBBo
         ljcxSAR5CXXkldM00bg0ExC9oOVH433Hv8zB2RVSWiuNyGPUYB0MLVXZSqaqs0fy5kYa
         X6svKoeqW300g5wqQ1KGEXl4Xna/Qxgzo3CI7aSSbq8DK0jNrEEfiVwS7L4mitXOd+Aa
         357F7HpLXtxCyGwodSLeaojs4e5FPTyELsOub2puYYGMi3wNfCh3lkWBM0j6rsillw56
         Lizw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589746; x=1795194546; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
        b=qYpt8qHU1s3hYs2EdjpWPeJcxzItZ/dHhSXtd8KhfZT3VZndoapqqo/OPSrbzOt0u5
         YA45CjpERrjrGn8LOk30kLgXGFHhxbKXm+0KJMvaOE5aq776n6/nsV9LuNgUcZOPzLP9
         Z6HJMWgs0iDKwIubCmVYdDf1dHLK+25mFG64ErQ3ErC6l3o2z3/7ihXV4XKJQ5pkd+3O
         xguj4lgkehPCVghW5LpqoZRB0z5nzLayOlxNzznfeFszFIuKZEv0SIKkzKBzEy7HkEsK
         C5AIM3YNskWJO+dHDT1aQa8TIfkWG+YmYlI8AR+konnAQY+T5yYgyfV1DKfXHoHlt3O6
         Z/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589746; x=1795194546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
        b=zhk5dwB5exOte365EmqVCvR1wxVuKK0A/Lr2Xwt3Sdmnr99gZfK/n8tTFVAYfLxCBf
         lMcherBR4Aq5Qd3GNSMK5qxohLJgVMM1hm+is5mLBjtqCzeFll3kj223HwA6D+omPPiI
         79wX3TQFj1oTFVxoIaEdBcJF7nLN3VY+7hSn3baoObZC0mREXjHIUhf9RqK4rpRPPoPs
         NyerGpWnjv0645ITwkgcDiI2NkZMrtCdckepbpMWmpLwooktUk3II2Df2MSbUhkBgvtk
         kBExk3zcgf26WmUEUrA76UTMOAFyxPTitn2GkUoerqR0UZMLWjFec4EP61InhKfnDZ6e
         L+ew==
X-Forwarded-Encrypted: i=1; AL+hErFY+tOMa+586D8Oc/O2GXcY0nhb3l5/9AXO1ibTnY5sE18Dc37xzrDJv5X4uFTDOa1sAVo1yRmzrb36NJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cep9alsQ61APFS8Rdfl2TB14ZlUMgWWgL48UwL0O63kSn3HAh
	v+vc5KgPvD4N3zuZBJ2zTLYD+hgVUpM3GPvj9etF5yVY2IF2Kxxb7+4hdUXQlkT+TZ9Z2dDsNdH
	MziRX3trbqa6mbyrwoOJFJ3UErPLiUxk=
X-Gm-Gg: AYBFou3UZQNHUop6CToK/XpQ2hBZJ1A9j8OPPtHStZpE701RsVZh2KngAvt/TCLRcr7
	UCFM/50UW5jH0lVIDgHc0yaTWoW+mxKYpuRQwuWz34zosoL1SYtMRXGKkiuX5feI9/BnYcSkMNq
	yq+r8ZAbqIflRVo5RcFTCARzBPHfpIbJtc++++AciC4wjf73JHV5Bp0ZzfnJTCTT1DfDfbRaNhE
	J2BqF9yZW9AAnejAFpNBgUqqM5M/Al0UROTKI9hCwrCFpeUac5gBtMY4Vo3esS0qfyFaXbs75q4
	0jJxorhnDLfDGurMFz51mJWMj1/gKBuDJ9gDSp2MpYflXWGn+Xy6liCzlYEnux3cRl5FdTH9epA
	wwdnUcxvDMqU5Lhsx2uAseI9Uta/LHUyqdsdIm1Pecbaymr5xORE+QoTVcxvz/HfwE/hMw/HpoM
	dMDlwMRmciIDhwv07DXAF+uM0oe+QnXO3zE/KF1RuDG2AIOkXOP8ZdpKhIPetK6MR78XiNRPv/z
	51U2k9l
X-Received: by 2002:a05:690e:b83:b0:67c:1fc:2a49 with SMTP id
 956f58d0204a3-67d970207c9mr377453d50.54.1794589746003; Fri, 13 Nov 2026
 09:09:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
 <86ecdgzp6m.wl-maz@kernel.org> <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
 <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com> <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
 <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com> <20261112180741.17614-1-sidchintamaneni@gmail.com>
 <0a5e252e-1494-4b0f-a761-d984238c9d0d@app.fastmail.com>
In-Reply-To: <0a5e252e-1494-4b0f-a761-d984238c9d0d@app.fastmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Fri, 13 Nov 2026 09:08:54 -0800
X-Gm-Features: AclHuK_eSsuSs47N6QK3g2E7GgnMGVY8PMc7m7IxLZzX0JjkDZoYycjEKtYvyFw
Message-ID: <CAE5sdEjVx-eGz4hkN3bMMJAag_g0hm+J18G6JvFH814Z4_ZGaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Arnd Bergmann <arnd@arndb.de>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Navneet Singh <navneetsingh@microsoft.com>, 
	apais@microsoft.com, rlmenge@gmail.com, hargar@linux.microsoft.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 03:31, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Nov 12, 2026, at 19:07, Siddharth Chintamaneni wrote:
> > On Tue, Oct 27, 2026 at 02:48:29PM +0100, Arnd Bergmann wrote:
> >> On Sat, Oct 24, 2026, at 09:14, Fuad Tabba wrote:
> >> > On a host that runs at EL1 (nVHE or hVHE), this also requires
> >> > __init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
> >> > __init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
> >> > access traps to EL2 and the hypervisor panics, and so does ST64BV0
> >> > once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
> >> > once you're ready to post this.
> >>
> >> Thanks for the offer, that part is definitely not my area.
> >
> > We are preparing to post the Microsoft Smart Data Accelerator (SDA) VF
> > dmaengine driver for Microsoft Cobalt SoCs, which uses IOMMU SVA with
> > direct EL0 ST64BV0 portal submissions carrying the process PASID in
> > ACCDATA_EL1.
> >
> > Now that Fuad's KVM guest FEAT_LS64_ACCDATA series is queued, are you
> > planning to post the host ST64BV0 SVA + EL2/KVM patches as a standalone
> > series soon?
>
> Yes, sorry for the delay on my side, I'll try to get it to you ASAP.
>
> For my understanding of your requirements:
>
> - Is that hardware using an SMMUv3 or a different type of IOMMU?

SMMUv3.


> - Do you have userspace calling ST64BV0 on the host, guest or possibly both?
>

We are focusing on guest VMs first, where guest userspace calls ST64BV0 on
the portal mmap'd by the guest VF driver (with bare-metal host follow later).

> > Either way, we have Cobalt hardware with FEAT_LS64_ACCDATA available and
> > would be happy to test your patches on silicon, or help put together and
> > carry any remaining pieces alongside our driver series if you prefer.
>
> Sounds good, thanks!
>
>     Arnd

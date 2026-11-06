Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979390;
	b=ta2cJTEz4OBfieLFOXFPuPIE1y/ZWFH2NyYI0WZmRL90vc63EnfvIxkuccwVhhQ2l+9O
	 6wQAN+cOoUyfisan58nxq6DLJXnqfKSPrPbszyO4zHV2+5fKvZ6v/ozhZCgBI9u2fq/Se
	 KVniaHHqomWEMhv44xTIbnBPeU3aPCJMvNN5iGE45AbvwiBszEJCLXAT9wNDSPiec1/XB
	 2s9lC/ZmXv0jGAWO3eiDyTxWsajzcL9pkZ2dpU0LBKFGpT0sfO4dUMrwN57GlpdefcEin
	 nD+MobaFvb82RIYmTdrlN1dxX7jqZIvgwsi6/2lnFaVnCgA3AywhK7wRGfj/lTUn06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979390;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ofV2qVpqrfBMyd1/zLMm6/WPtcgEV4myUPpyNdz12kw=;
	b=u2CvvwH0bN3ZVeePNFQxlxVyx7cu8zx+8P6cF40CzUu+J2Xb+5X/hMq8rjbhuYzm6El2
	 qcf2vEGjJ8MbRVRjQC/54+DhyDXtaFcUzcROfxh3YOM/RK0DwpTrGeTfW2UAgkMDLpm11
	 aKnMHSEzTNG1vP6FRiaUKoOc9AO15IZa4e5ua0LJJy1Q71v/LhSlDDAeX88ZP2FtmlGSt
	 iT7Y94pd2mcEsJpA5SlzyrkMbn/ebfXR+qIdMOKjefA8VUJbHzlF5+sgMVTufXzdIGy+o
	 952gABgX6X06I39wnW4bNh1uKMP2KdRZXTJbGd1EHtU7zkLiY5GvQsX9czRx7HBDUHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y+ng2dEd;
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289DF606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y+ng2dEd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ofV2qVpqrfBMyd1/zLMm6/WPtcgEV4myUPpyNdz12kw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793979387; v=1; x=1794584187;
 b=Y+ng2dEdi+zky1s1Z1rLDGIGS++Hq+vKQzVnVV3Bm7feiPr8ZGdEVZLuhGimil0MsxeWJdku
 Wv8tzSO6ymkaR2N6WAWSeB+tJL2H2bE8EjQI59BI4tuYJoXNOvchg1zOnOcmtfqtnen4V3tmW5z
 gLZx9KfuxZJeOA7j0GJZGBC4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5d380263a6c4ef86;
	Fri, 06 Nov 2026 15:36:27 +0000
X-Mizu-Trace-ID: 5d380263a6c4ef86
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so808e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:36:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwa/nxB124MniE4EOA9/tRA5tZRD11gEFi67UQnQIriHnf5E1IR+3D5Eyevam/bPb7HQnf6sNjXXWcrdVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v0jRm6JV61Lkxmzj39MXd2s6iYsdXqe1z6HIxHS8swqWrZnQV
	wni8k+w3/BY+RsKegBW7BzWFvRyxY3YoxOpP81Cc/7vD6iopr8y76UhGw1MtGQ1OaPilnSsbLVV
	pAZGYHrqRxp3rTWjHzXQFiWKlWkwdGbPpEgvFxD6C
X-Received: by 2002:a05:6512:1056:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c00a413bc5mr6933e87.10.1793979382196; Fri, 06 Nov 2026
 07:36:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104084842.132944-1-fuad.tabba@linux.dev> <20261104084842.132944-7-fuad.tabba@linux.dev>
 <au3pNFOMeIx2X4Dp@e143914.arm.com>
In-Reply-To: <au3pNFOMeIx2X4Dp@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 15:35:45 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwMv8NZvTy2cVtGRLoHxABZiv7yYUdRBHE69ieFUxoRXQ@mail.gmail.com>
X-Gm-Features: AclHuK_ZZQXxaDxpRQHq7T9rnG0s3OxixfWJ81iGmmqdPNJp-0OMdSXL2rZvnds
Message-ID: <CA+EHjTwMv8NZvTy2cVtGRLoHxABZiv7yYUdRBHE69ieFUxoRXQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] KVM: arm64: selftests: Add protected-VM library helpers
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 14:50, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> One minor thing below, that could be addressed or not.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks!

[...]

> > +void pkvm_run_loop(struct kvm_vcpu *vcpu, void (*on_sync)(struct kvm_vcpu *vcpu, struct ucall *uc));
> > +size_t pkvm_host_locked_vm(void);
> > +
>
> Could add a comment here:
>
> // Called from the guest
>
> As you have those 'Call' / contract comments above.

Ack.

Cheers,
/fuad

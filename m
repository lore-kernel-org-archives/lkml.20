Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC998473C84
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520769; cv=none; b=pm7q/ojBrwvOmlwS3k5s8h757EcJ+b6SU1QAp6qefdoM7sYmb+OroDhsYCM52GHX7OFazwZ2xjVroBlIDnkYHSIy9U+Fq1bbROazVbS1xc6Y1gJ+RWrkHtyLRakbzPEdU6+qPfE1DngcIiRJAuVTOQdHImbDGCOFUqAhwnWkqLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520769; c=relaxed/simple;
	bh=MsMTmcGG1X4n8TVMSg/WVg2Lsl8nVsUpAt6gmPDP8CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgrXg10H5cgCUdot2Q8xLBREQryfBNqXjX/FPy1gZw1YqaL7WkTUFpIMh8S3wQ/p6fOE6KOA96MuqNSoSnBRpli31f6vDSRcMISkmD5AWUM07L03dk0ih6+32LYgj4gQotPoP5wRuoakcuuiWXoEPc3dtWTDQbnXCHva5WhbD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JntTHgRm; arc=none smtp.client-ip=95.215.58.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JntTHgRm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MsMTmcGG1X4n8TVMSg/WVg2Lsl8nVsUpAt6gmPDP8CQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788520764; v=1; x=1789125564;
 b=JntTHgRmMwSv5cvrXNjbgWYDmX2zCN+ZlAhmU84b7QgRSk5ldsHEaFfJaaFA4ajZRhNNy3qA
 mXfDWdDv5pIlKvPrkmCvevbIpFDoMl1ddAA5IrtZZ1CIaXDkjtdTnL33QjsoUyg+2j4WtImG7LZ
 3qOalvS61YCTwJiafCTmuyAw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42f527b76ff03bac;
	Fri, 04 Sep 2026 11:19:24 +0000
X-Mizu-Trace-ID: 42f527b76ff03bac
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so5247e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRs8RLnMjrcLun5tyQqCoaP3jrf3J9hxIQ5yvULjQYyc0Dk3l9xnXCwPc9IoePJJX96FP/7drYl3ipplY=@vger.kernel.org
X-Gm-Message-State: AFuF++kLgg+IAoitV0t1auOr3EU7Iu4NwO+wjSdnM2cD36baryHwDpyI
	5VxcQteYuCf4DAbUtrehI/qTJbGg5K7cpdix9O1Km0BtY7X6cYlOgEEBkZFkdgAc4qE1UXcXj3x
	f8vAyNUHcaPb4PNsAhK4czpacG5OgrZrBGp4ETq2k
X-Received: by 2002:a05:6512:1094:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b61813ebf2mr96629e87.3.1788520761433; Fri, 04 Sep 2026
 04:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903160819.831518-1-fuad.tabba@linux.dev> <xmhaptfcp2gyoovgus35yhx2uloe2zt3zniwscd2dwnatf2fii@jqobvjdmkqed>
In-Reply-To: <xmhaptfcp2gyoovgus35yhx2uloe2zt3zniwscd2dwnatf2fii@jqobvjdmkqed>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 12:18:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwNJvqqeGtgxR2q+CRn5DJfigssLRcZxz-zY5XvATwOcQ@mail.gmail.com>
X-Gm-Features: AcwNN1WJOez3rM2VTfMTldMzLgVHCuTatIMt9J2llOzdukDIMVSoUgeLQv2Bv6Y
Message-ID: <CA+EHjTwNJvqqeGtgxR2q+CRn5DJfigssLRcZxz-zY5XvATwOcQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yuan,

> > +static bool
> > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > +{
> > + /* The registers exist whether or not firmware enabled MPAM. */
> > + return detect_ftr_has_mpam();
> > +}
>
> My understanding: arm64.nompam affects detect_ftr_has_mpam(),
> thus when arm64.nompam = 1 w/ MPAM is supported in hardware,
> the KVM's trap setting is skipped yet, and it's possible that
> SYS_MPAM2_EL2 and SYS_MPAMHCR_EL2 are configured not trap anything
> by firmware, thus guest can still access MPAM registers.
>
> Do we need check the raw id register values for the real support
> state of MPAM here ?

Under arm64.nompam, finalise_el2_state skips the MPAM2_EL2 and
MPAMHCR_EL2 writes too, via the same check_override, so the kernel
does not clear the traps either. What a guest reaches there is
whatever EL3 left, UNKNOWN when EL3 is implemented. This patch is for
the case where the kernel cleared the traps itself and never set them
again.

Gating on the raw ID registers would make __activate_traps_mpam()
write MPAM2_EL2 on guest entry there. AFAICT that traps to EL3
wherever MPAM3_EL3.TRAPLOWER is still set, which is the firmware the
option is for: 10f885d63a0e ("arm64: Add override for MPAM") added it
for firmware that leaves the trap set and does not emulate it.

The arm64.nompam hazard is documented separately [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

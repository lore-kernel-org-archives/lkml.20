Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227837;
	b=wVy6Zurk7r9W8SfSdoBSFZZoK0DhBj6hmLa5xyliMNVgP1pMGO8QKPxwBEvlpYy+Wlbz
	 KZPLzhXy2v3YcMfV20UCFxkiV58IsRoCAeKLGAlOO496bPBhZFxma391iE04U2+scqnPc
	 1q+dSHAnQwp4IvEP3cUzOFsrpJQnqUKNNWsVQfsoz68SnFqaMmZXpOI1O4ie2Ozl6U7tT
	 ALIhTnEOLrjT9JClEn6ZA4LFZSKWZn9j72jJTwjxaMbpr27RyT2z5Xklv99AHjYCmk0fw
	 kaYsR2mvKWIKn0UMc6tgxyrQ1+pvPEsZw5NDgabaqL2/RHR/B7yc4uGhfn3tZ1Ku4Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227837;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=4M2Ug6+sc3RFSzmdaYcK0tVL/sc44GoFVdqmCKfk9+E=;
	b=Z/FswBAooaglJnR1vWTvXgY20XiIUXQPd9t4I9BkTO9x2tJ9BdCWT/BRvKGWmmGxcPya
	 N39yZnMaPynTUHYqSplR4vJxHtRib03bG0ct0KU3s6v7OtidpW80qU4zpD9C4K6AtrHHf
	 R6tWc12OdhvnjecRBBNtqa0gb8El0nemcTw9iJbtVgf6czqj8Rq5TUvt3TQha7jiA27dl
	 TF/TKCkBua43OwcABaeYrtwG+mEBi+aS6H12Wvah2Sv8Q7YYBOe2GZuGp9VAZpwfuoqcu
	 BjjLZFZKVRdYn+H7tcCFT8I7OUv2jL4KCMqUmZBRZyVWbckMtlw4O9D0c1ZVTzl9now==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="rDSi/ksB";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C14606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rDSi/ksB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E34681576;
	Mon,  9 Nov 2026 04:37:12 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 143713F632;
	Mon,  9 Nov 2026 04:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227835; bh=bbU8vjk3/U/uslDQYyD+xxGnVcFZAPPAtmds4JD+P4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDSi/ksBFxCLASk9AcTB0iEcKrNeruGI3aeDjEnni3Ll2nyX78bS/2RQUsOeLiogC
	 6noVyfuAVurAtfJkSiWzuTr/kuvNwafUx09qib8u4b/a/bB3NU/fJy4Gr79EEGdZBd
	 zd34niL1ZGlio//dyJ34QCEDhf3hjFI6ISrNJReQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 1/3] KVM: arm64: Avoid re-testing walk_continue
Date: Mon,  9 Nov 2026 12:37:11 +0000
Message-ID: <avG-dw9Pa_94CxA6@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <1639d961-1092-4a47-8825-55c1647a115b@arm.com>
References: <20261106161240.1345126-1-leo.bras@arm.com> <20261106161240.1345126-2-leo.bras@arm.com> <1639d961-1092-4a47-8825-55c1647a115b@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 04:59:05PM +0000, Suzuki K Poulose wrote:
> On 06/11/2026 16:12, Leonardo Bras wrote:
> > __kvm_pgtable_visit() performs a bunch of calls to
> > kvm_pgtable_walk_continue() to find out whether the walk can continue
> > further, and if not, 'goto out', which retests the possibility of
> > continuing the walk before exiting.
> > 
> > Given that it's testing the same ret variable again, there is no reason
> > the result of kvm_pgtable_walk_continue() would have changed since the
> > previous check. So turn this goto into an early return, simplifying the
> > code and paving the way for further rework."
> 
> Looks sensible to me.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 


Thanks Suzuki!
Leo

Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7953A9872
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015905; cv=none; b=UvqA56OkrcnamsxMmDj8Azi/bvbiIojJALc8OqiS2t/SVjxS4HjQ4UnJTMMxxN0f8j56Pgf/PLwh/wATGP1fgMJ8JOnSFsuZ+9/6MI1eSXqrDwr80hkpUO9ueemUx1l/PIBvcCtPouUbJWdFh3oPlPB9iJPC5L5fsR/KXGNLvBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015905; c=relaxed/simple;
	bh=kwvpB2s4F2EzLbnFB1heuBDYWxBCbVtzb/X0O2S5ZOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5zvmb08MaYa6dbs7fs/88RO6RaiPZHQxA1rVR5Rr6ecOTGqR2CwPDwLfL1Y30W6g2fVCqHp+iBS+8iAB/YfFx5dWzk9HgbJhhna4c0lODht4BsxsCuAWXoDpm61cfLFTFQZ8ySOBL/3sPxjZJQjFmxaVmZ2/oDKp7y62yfZoqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SuZac4rp; arc=none smtp.client-ip=95.215.58.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SuZac4rp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kwvpB2s4F2EzLbnFB1heuBDYWxBCbVtzb/X0O2S5ZOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788015901; v=1; x=1788620701;
 b=SuZac4rpl7wsTyHk20onyyFyPkrlmN3Pklfv2HoxIR7ACDvebuRbw58JDwtCKmHcYIZn7UTY
 MVDQraPtZWXVelezy5FNad1e35vE5jztff2wdrfZLiVbt+x04pucBiiHtO/vBICpmyPbczsB+Qp
 UJOPwIuqwE9k/WYt4t3tDrIQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2e1ab461b82e107;
	Sat, 29 Aug 2026 15:05:01 +0000
X-Mizu-Trace-ID: e2e1ab461b82e107
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso4172e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvMPtL2drspNHF/2prBOp59CsdNlDuLtpAoMHHnowwEtxPD64XjC8uxn0ourFN367BmxoYYbDOvxCtpLo=@vger.kernel.org
X-Gm-Message-State: AFuF++lytKwFnfzkZF3ZhMCenWlDP9jkKpsaUmv/oxRoBg8QfsqD42o4
	SpdKRO4mgOsn2mKuT3BubZzNHT7TlyWfIoI6qe3MEKYns+slZCZY/SL/Oz2gHBmOTHAzermM8eU
	RBLFXIzuy/fFuVS0T/MC/YyZ55iwpOmw7ZDg1PvvP
X-Received: by 2002:a05:6512:2392:b0:5ae:b0ee:f737 with SMTP id
 2adb3069b0e04-5b5ef22d25dmr97393e87.9.1788015898930; Sat, 29 Aug 2026
 08:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829054856.70549-1-kmehltretter@gmail.com> <20260829054856.70549-3-kmehltretter@gmail.com>
In-Reply-To: <20260829054856.70549-3-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 29 Aug 2026 16:04:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzexMPUFJ_DuqAmKFP57UTd_nqGevWBqODDRi3tvg-YEA@mail.gmail.com>
X-Gm-Features: AcwNN1XqbhfaFCphLC-k_pbis2x4NMIEFS4Vcu3x3JJmr3Eq6xNmX3vLDUzikl0
Message-ID: <CA+EHjTzexMPUFJ_DuqAmKFP57UTd_nqGevWBqODDRi3tvg-YEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: selftests: Test empty SMCCC filter range
 at base 0
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Aug 2026 at 06:50, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> test_invalid_nr_functions() only checks an empty range at
> PSCI_0_2_FN64_CPU_ON, which KVM's end < start check happens to catch.
> It never exercised base 0, where the inclusive end wraps to U32_MAX
> instead.
>
> Add the base 0 case. Without the preceding fix it fails with EEXIST.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Same nit as before.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
> index 21e41880261b..a41ed3e016ba 100644
> --- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
> +++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
> @@ -140,6 +140,10 @@ static void test_invalid_nr_functions(void)
>         TEST_ASSERT(r < 0 && errno == EINVAL,
>                     "Attempt to filter 0 functions should return EINVAL");
>
> +       r = __set_smccc_filter(vm, 0, 0, KVM_SMCCC_FILTER_DENY);
> +       TEST_ASSERT(r < 0 && errno == EINVAL,
> +                   "Attempt to filter 0 functions at base 0 should return EINVAL");
> +
>         kvm_vm_free(vm);
>  }
>
> --
> 2.39.5 (Apple Git-154)
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002218;
	b=AVLGHEVbFgiM8d5Vjbf5sFu6G2zXg+8LkFSEBITOlmUFAN7AhA1XquoGaNMLjp+nesJ2
	 fyK9H48dunziFUNg1nQ83BB1bJPziEIplVwVTFJ0JxoslVdtTjKWEQHW7yW/SO3r19gKp
	 QVLTvojBdMpYAo28+DFp+GNopayxPuJhG3Pqrw3gTbcC1ooIdWSq4yCkX2ldRtaTBarM6
	 /hkHev4GmGSXvtIXSBglGBJdjNp6d3yN4C2SkAedXyA5vDbCtVnOw7eQiJwrjWwSu0x1V
	 Vx3QPNIGEQg1auId4FbBPfYRrRat/qBCsR548QRPFDdr26HET1ecpx+OnKU27WqqL6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002218;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SU/p59HmrY1l63uWO1J6fBGj9iSaP1sfb4BVk3OH0dM=;
	b=cbKqhFpkf5Q4DcH4ZP6moS83+KPxVCvQXdQ/zhUDLzU71aU943vuHnLfErOdGnNXQP+c
	 CDoyTpZdENUo1IVpE+R2fqpSZHpTwwVb9Qq62YDvnk47mjilPLvI5rQUmPzJ8vW+a0RNL
	 TJkaHrTgqDAKrX68THN/HncejKIIA5Lzn0jbKNw5wBLwyiBYkwKb4tVWC/urnC79KIWYZ
	 faQajf7/4ida0TNLlsh+qzMzxnjAmCG9HrC6G9WP9TvAuOfRUmhPUo+D0F+3zZxLjAXH0
	 6r92V+0bsVhI9oM2XdaoTitq5iTrSrix3+x4VnUvxwr+qiOQHkCeCYrXBwmBSiPfmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xo3+QzWz;
	arc=none smtp.remote-ip=95.215.58.169
Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xo3+QzWz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SU/p59HmrY1l63uWO1J6fBGj9iSaP1sfb4BVk3OH0dM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793002215; v=1; x=1793607015;
 b=xo3+QzWzJteLbNU3D1rBb0LpexN/nOrP7sDl+8i4KFfDJcU9wNZ2WIWFqwnFUoj1ib7qZThH
 lFjHr0YLkJCsd/hWTefzgbNhW2rrkXKc8xl7pus2z5UaMUQyNPBW9xQ+ffavvCLLWI8xl+6ormc
 2wV70k43g48QzCeHXIBFAAug=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a179fb6c550f64c2;
	Mon, 26 Oct 2026 08:10:15 +0000
X-Mizu-Trace-ID: a179fb6c550f64c2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8558e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:10:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLLA/5Ftd/y9EEdIGv3y8jQu/Fj5KNhpGNJEg9vssd61LemWkQLZltRkPR9uOMITLnsl0A1Hp14HQdQeo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPyq3JrpFkK8ipeugHBQB6P6yB+tdtJsOhm4O8jiJWUc72XKyo
	aq89yW3wqZ23gaIoS+Rqb70nnwl9pYcQh/So2sMDXS6E0a6RjuMSlUbJAQCRbLDkJGGGes/iLPf
	AUqXI+YGK7WvII5t34K6xaT3Go0/5h9e4jBEgV54W
X-Received: by 2002:a05:6512:3f03:b0:5bf:a28a:f2d9 with SMTP id
 2adb3069b0e04-5bfb79dafd3mr111700e87.4.1793002210084; Mon, 26 Oct 2026
 01:10:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026012128.2270251-1-sashal@kernel.org>
In-Reply-To: <20261026012128.2270251-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 08:09:33 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzF5PsNt+riasW-SK-nhkLYh3kojMFyCEqs372-Mficnw@mail.gmail.com>
X-Gm-Features: AclHuK9ieRbKRZ3vlLRpK7x9lOVSGw-njZY_CzO5qLbrpHOtyOHbR5m8v7LhEMQ
Message-ID: <CA+EHjTzF5PsNt+riasW-SK-nhkLYh3kojMFyCEqs372-Mficnw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: selftests: Skip unwritable ID fields in
 the failed-run test
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Mon, 26 Oct 2026 01:21:28 +0000, Sasha Levin <sashal@kernel.org> wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every field of every register in test_regs.
[...]

I tested v2 on the FVP AEM model configured with no AArch32 at any EL
and with PMUv3, under nVHE: set_id_regs fails on ID_DFR0_EL1_PerfMon
without this patch and passes with it. It also passes on QEMU (which
supports AArch32 at EL0) under VHE, nVHE and pKVM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

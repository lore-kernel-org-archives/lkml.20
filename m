Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908184;
	b=yaUCwXbIzxNC+fUZtBybFOubx6zm9DevoxipwdAf02r87AmhAAgg1FMVNW6GHTVYgWhJ
	 mkn3/DUPH5hSeE7xmvXCFBw5HYQ8MJ0B1PGwY7LdT7yR5N4BdPyG90UNpG/nVa6tny6S6
	 XylpvNrZiU/Lcyp5GcgSyROoRXAQWbFv5pB3AUeu5ykm2j00i1DMW14zpktQVRte7ydLb
	 3fgoEj7z9Jk4HTnOjEII7aCBsoRJY3uA/joh62AsMR5rRiTfgrbFON8yrp61OEwxjFxPx
	 4UCH9KX+cSK4YVkqdpcfjdftlD4xhA1HwjaM+J738MSUCLZytrKFMFxnVAz3oKeUTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908184;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Ohk8fjJcBK9UzrBV+dt2XFBrhhVb8zdE0nF0K/taFC8=;
	b=SM9Stx85o8r8mJbfx8GLm+9pO4jD9NOggQcq/eFZNf2VjyXLJPDQsUrXsZNn/TyvHeOb
	 9atb8u/tFrX9E2aRTgHWrOM1/xBhiO/jI2v2ylES7bMSEcYi1aDygrpoX3HEtbpBiW4pO
	 LBKZMQVENuYoPtkzqfxBVycTSHAJ3YN4ANmbbjNchCInbmxB6gimZ9xMSMOyBFjxuI24R
	 mVJ9DdwmvDoimXIq4O3znkebMFhrXXKZz/WJdPkm0lUeubXbHaECdDnTyr3PbGIUCIlu0
	 NqvHexljwB6uIjAizHHw8wgtMsZ9QP2g8lp31xK5wK1N7JfyKaB+s1SwOraDo+x1ocw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.26
Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128E6075320
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F128E6075320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ohk8fjJcBK9UzrBV+dt2XFBrhhVb8zdE0nF0K/taFC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793908179; v=1; x=1794512979;
 b=TLyqchkqOZt/DtlVYwdrSUXx/dQb2voUuzu/1DK0ROKF9lGdVixSHWdqSbho4P4ggx6CDdCK
 N1psN8/3tnUAlOBXHA8POiClwq8TTNpT7OaXx4ex9SQ6w96P2zcyob28/LC80FP1KwAMIBi2O8r
 aVnCkYn/uC7CQOhfUQxoKWA8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 791d4e604c55dbfc;
	Thu, 05 Nov 2026 19:49:39 +0000
X-Mizu-Trace-ID: 791d4e604c55dbfc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so1445e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwfGQzrBos34QCcm3Sbxdb1FyRfypVsK2+xj0J7Loza4+xbDrOg1Oi9NSRI1i1WuOBqnvGa5zxUEx0izCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QY/OVgXlf4ECIaXCQyt+pp0w4v0MDvwNp+9H5dB9PrKrBs7B+
	0EB+9BjqTiPkZCthbpM0QOBq1tnN9ss8449N1AE0/A3A+il1JNMRo3l21gvt73WL+JkwPAuyOhh
	7OCoA7F8nvafUQAYsIr7d6ky7IKAC8BRUnQKutmtc
X-Received: by 2002:a05:6512:33ce:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5c0030a8446mr18363e87.5.1793908174490; Thu, 05 Nov 2026
 11:49:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104124451.2148724-1-fuad.tabba@linux.dev> <56rrmewwluy2iw52zmusrys3qfqcdhtsgzpqtskr6zt4xhmhfo@hzlwy5ol47kd>
In-Reply-To: <56rrmewwluy2iw52zmusrys3qfqcdhtsgzpqtskr6zt4xhmhfo@hzlwy5ol47kd>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 19:48:58 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxms6TaXi1ghx=hPU3fG1EQUwQYeX+d0jjJ=AzhDv0u_Q@mail.gmail.com>
X-Gm-Features: AclHuK8cooP5vM3_YGu4N0f2LHYPXd6jDq8nHFV8TmXlzVrLCE4RbmmBQjeYTg4
Message-ID: <CA+EHjTxms6TaXi1ghx=hPU3fG1EQUwQYeX+d0jjJ=AzhDv0u_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Stop stage-2 teardown scaling with the
 IPA size
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wei-Lin,

On Thu, 05 Nov 2026 18:59:55 +0000, Wei-Lin Chang <weilin.chang@arm.com> wrote:
[...]
> I haven't looked very closely, but do functions that use
> stage2_apply_range() suffer a similar problem?
>
> If I'm not mistaken we previously realized unmapping a full IPA with
> kvm_vm_stage2_unmap_range() is slow partly for the same reason.

Yes, when the range is the whole IPA, as you found on your reverse map
series [1].

> I'm not sure whether optimizing stage2_destroy_range() and
> stage2_apply_range() together in a single series is preferrable though.

I think it should be a separate series. Returning where the walk
stopped was a small change for teardown, which runs on an unlinked
table with no lock held. The stage2_apply_range() callbacks are shared
(kvm_pgtable_stage2_unmap() has EL2 callers that treat a non-zero
return as an error), and the walks drop the mmu_lock between chunks,
so it's a different change. Only NV passes stage2_apply_range() the
whole IPA.

Cheers,
/fuad

[1] https://lore.kernel.org/all/eylfcgxs2xzu57czyuhkpmum45lpxyccyu2yh3mipr67aq3xo6@xinygxzavoja/

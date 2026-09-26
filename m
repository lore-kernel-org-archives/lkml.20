Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBE388E5B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790397654; cv=pass; b=MqV0pRUVN0+v0+45G3Ps8VUe0ETZ4Vn4++yfBaXnClpXxrfPs8w0Kfhzs78xV2++CGTCQWvwm1ZN4B4rvuIvna7/PqjnyV3ffe6fEJERajnVPtq+sOmlM9/MKj81l5QmfKXx5RoboQ49pMScmVaPeyNNr5joXjj22DBJuxShXVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790397654; c=relaxed/simple;
	bh=BZAAORgGy6Ms3KnxsVv8dFpiAsr6V0VyBa8kffO+g4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oavb9LGAwR/evUlYAfgdkFwiKMR873IXl8m98P2c8pPGOyGaK9wKP/+SjShlHxyh7tXb1fQBvYYZ/07RQERj2+o66msrymDMWVzflm3hjWyS13u2gfOu37DkylC/Mlf0+6L9jt93wxeCW5JAvZeY+TDqtnGZw3XC50IxqwhTZWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KHkr0/OD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0C8x8GB; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KHkr0/OD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0C8x8GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790397651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDMDQqBFeguZLrOJapnDiNiCw4jrA0CzviqQJznXwac=;
	b=KHkr0/ODnhjV864fn9qtcfszxURenBmWMSagi30435GAn7NlxxSnAssdf93VWgQJ5EHntf
	qMXtpTDQny5ys5rD/ImUHcOdgyUsnmBM7KhxxL4LebJNVO5SCrli1eNgTaQdAmMCAho+k/
	joSbOZ8o/hgyR7anxHErqbxtQ6am9Uc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-P6AFplloNeyOrpL6yf6mtw-1; Sat, 26 Sep 2026 00:40:49 -0400
X-MC-Unique: P6AFplloNeyOrpL6yf6mtw-1
X-Mimecast-MFC-AGG-ID: P6AFplloNeyOrpL6yf6mtw_1790397648
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fe8bf258eso18672675e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790397648; cv=none;
        d=google.com; s=arc-20260327;
        b=iJ+Gj3smCop9sSjsiqtx4/Y/E3Z+8fZR7d3FpqHBs5zyO8YKvs3m7CE9At63u4v3A2
         bXxJuZnbuvfzcTXQXtS6SARc4gnEErGalPhsl41tvUy4uujLIXjvnuRLKpKqRMz1sriw
         DG3aiI/HTv/PqfXDJ43TD4/t4KKqA9Hi7gTrVCPgiDNNiO99QeJpa+15PDcOITaWpJpE
         imKHedHFxZ4clwqoI0gJbuyc2CoDUy8IQ5Ot6INiSnMIDRGwuaSbejn96xyBfAeInUvJ
         bmvdF11dR1Fd+j1087vzIucRWB6A3mWg3jPd3Bsji0fYABNt1b5qsPMJx42tD2T8Aslo
         xQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JDMDQqBFeguZLrOJapnDiNiCw4jrA0CzviqQJznXwac=;
        fh=8i2p5wCccPd1JG20ZiYnmZ+WFYYcV3+8njSSVhIH71Q=;
        b=Pj2HUGKExU/FtFUtRnr4epcfiOYjyojhkJ64VvB+Ij7R6JXdwpSzUXG6JoIFGR0foe
         WNUq6WZMvjH0FgQD91ycBdAkmG2fD5bznKiGuJgHfJgok/xMlmskOOERImK8Wx0a9V8r
         v8HBPXiywSdlH2mFagm6EiOV6TE+1nmF74JeKPxIjuy/81LCvJcANA7k/yn3IHnb+wSZ
         Qn4Yc7Jq+hcpWeYkAnUmiuvp65g8vB6bDprWGPP1RNyZQCfg9iybArWITuRYhlsnVJlB
         jCfR0hOZI2vCQQi8nXw5UdGJobzcMdXR7smN6+i0S7Z3W5Y969aoRddDysnv/e++U9aJ
         lXSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790397648; x=1791002448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDMDQqBFeguZLrOJapnDiNiCw4jrA0CzviqQJznXwac=;
        b=U0C8x8GBfoiqUG2a9EZT01iRBzPpNl6VKJFUkCnztue0IgziJwk/Cm4BBQ5OubK7vh
         VvWg83eY0DwPXCqJk6iTAbxANMiFrr1NApShmyWaDFCYrodzrt0DkICcoy4zszDFR7qT
         rtZ44X+vMTevtJGINcnyllEmc5WdTDE9ukdKMLiEIE9Hxa0yT+693PEPyzA4AzAScmHN
         YnsHnJLH19LS89iOso5ddugHsrp1kgSwSaIC7ZRa+7NMr7nSBLWBIVL2ntAoRY1QATLr
         5vfpc/0DwzWw4GnOcS2dV0RDDnzm2hb/UTQLi7xy9TK2SAXd/R+hFW/RkZ5z7npHK49V
         lslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790397648; x=1791002448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDMDQqBFeguZLrOJapnDiNiCw4jrA0CzviqQJznXwac=;
        b=QJKXg1RuyRhE8Ul96UQEcTZOBOQ8s31hKaEmyA2R+hRfpxkaeHhRtOY9W5W/iTuvE/
         47erNj2hIDHr4G+sQv8+Ccdyu0ZZ+WiVKfje2UR1/2gWOiTPxNvsz+dSAAbFSC8DtAu/
         O3pqwGfAqiD3Q2rsGgQm3xwWYOrBpnUp+y1DMv3T7oV0ZsG9KTNbdQ3O3158uBQvHsIo
         Kqwkv2akG9Decf4YUu/Zl3L4MpgvY0wAWWc4ZAEk62Zy7U8CCEJsiyNovvO6ro20l7JU
         gVHivTQZN/DDYStEPwMg+UbpeLIoyc+j7CGJd/Uy1Y0CA4XjO7QVjbh0xGg6yLZI0B+8
         AGWg==
X-Forwarded-Encrypted: i=1; AKwUvBy5hpsydfmf2rvFpMu0TGVG1wGt7r79vxiNOQMw5XpfOoR12664fJpqdmcnAnK6ROzikA8EpKqrotuhD6s=@vger.kernel.org
X-Gm-Message-State: AFuF++mb2yKtkn1cE9QnCcAl2xXOLg48nVW6yGWmtw3tu0vuyW6liJma
	xadn6IrxU4u1u7eEEnlubFQa5XxQdG+tuvFGiZpDtP7qs7oybsg4FSxI2RsSFrq8264C/poSp70
	GXtIza39r4hE8Jrfne1/V4Hi8ixbMrLr03vzu+FTx40xG4enTY3Aj5Gjiio/xb8w824k0C82ELI
	U4iMC/QxthI49R+/wBITQjB+EXC5MLVS0FbKiAc327jdY89pqG
X-Gm-Gg: AYBFou3gsWXJP4TaoksUV3AUAdDt7zb+ufvuSb8SXP6DO3X0266dgIZJlA0Vdfk38mN
	VDj8SouN9Ec7djUqT3Rqvp5dIkfBUy8zajad0Vi6f+qr36e/8Ph6haMxnDbKTE1oYsNLlq8/QC4
	GFiFpFX065KHoyvZDI47spwq+lZC5KlHc0pkosdkB+3bT0P2dJX78s5Zxi8FrHW0HiQSe+YSrhQ
	io9cr8IC6wlZFUvyy6Xpq37KgkzOdymWj6evyY2rQsWtmEB9+KRwyNLBKzqJA==
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fe66b426bmr138635015e9.12.1790397647686;
        Fri, 25 Sep 2026 21:40:47 -0700 (PDT)
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id
 5b1f17b1804b1-49fe66b426bmr138634725e9.12.1790397647309; Fri, 25 Sep 2026
 21:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925233321.2381319-1-seanjc@google.com>
In-Reply-To: <20260925233321.2381319-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 26 Sep 2026 06:40:34 +0200
X-Gm-Features: AclHuK_Yq44dj9CGbs6sF4OIA_FkwcvYoMqBVDfogFZ_KeuJ9XSHG47vC6oNiI0
Message-ID: <CABgObfZeA_q_prxJhbdNqYpE8quPD360LhVBQv8ypcPpLA-Mhg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: Fixes for 7.3-rcN
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 1:33=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Please pull a variety of fixes.  Nothing is super urgent, but all of thes=
e can
> be fatal to the host and/or guest (except for the selftest change, which =
fixes
> a regression that was introduced in 7.3).
>
> The following changes since commit d599822bdb66aeec5ec76297b0fc6efaaeefe0=
7c:
>
>   Merge tag 'kvm-s390-master-7.3-1' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/kvms390/linux into HEAD (2026-09-04 17:34:28 +0200)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-x86/linux.git tags/kvm-x86-fixes-7.3-rc5
>
> for you to fetch changes up to 119e9db233ad0f4cbd4cfb9f9385a7bca378b37d:
>
>   KVM: Don't pre-reserve xarray entries when storing empty/NULL attribute=
s (2026-09-22 08:36:16 -0700)

Pulled, thanks. I added on top the SEV cache writeback patches which
are not present here.

Paolo

> ----------------------------------------------------------------
> KVM fixes for 7.3-rcN
>
>  - Fix a brown paper bag bug where KVM would incorrectly treat Intel PMU =
MSRs
>    as valid on AMD.
>
>  - Fix a regression in the hardware disable selftest where it checked the=
 wrong
>    macro when detecting glibc support (breaks at least musl).
>
>  - Never clear KVM_REQ_VM_DEAD so that dead VMs stay dead, which is espec=
ially
>    important for KVM_BUG_ON() flows, which often guard more dangerous bug=
s.
>
>  - Re-pend GET_NESTED_STATE_PAGES if getting the pages fails, to fix a bu=
g
>    where KVM would let userspace run a broken setup with stale vmcs12 pag=
es.
>
>  - Fix a class of bugs where KVM would fail to fill kvm_run exit fields i=
f
>    getting nested pages failed.
>
>  - Treat reserved entries in the memory attributes xarray as "no attribut=
es",
>    to fix false positives when checking for mixed attributes.
>
>  - Fix memcg accounting for the memory attributes xarray (the xarray libr=
ary
>    subtly requires the xarray to be configured for accounting upfront; th=
e gfp
>    flags taken at runtime are used only rarely).
>
>  - Don't pre-reserve xarray entries when storing empty attributes, as sto=
ring
>    NULL must not require memory allocation (KVM and other subsystems heav=
ily
>    rely on this behavior).
>
> ----------------------------------------------------------------
> David Ballesteros (1):
>       KVM: Ensure memory attributes xarray nodes are accounted to the cal=
ler's memcg
>
> Jim Mattson (1):
>       KVM: x86/pmu: Move Intel PMU global MSRs to intel_is_valid_msr()
>
> Sean Christopherson (4):
>       KVM: selftests: Use __GLIBC__, not _GNU_SOURCE, to detect actual gl=
ibc
>       KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
>       KVM: x86: Re-pend GET_NESTED_STATE_PAGES if getting said pages fail=
s
>       KVM: x86: Fill kvm_run exit fields in common get_nested_state_pages=
() error paths
>
> Zeng Chi (2):
>       KVM: Don't treat reserved xarray entries as having memory attribute=
s
>       KVM: Don't pre-reserve xarray entries when storing empty/NULL attri=
butes
>
>  arch/arm64/kvm/arm.c                               |  2 +-
>  arch/x86/kvm/mmu/mmu.c                             |  2 +-
>  arch/x86/kvm/pmu.c                                 |  8 -----
>  arch/x86/kvm/svm/nested.c                          |  7 +----
>  arch/x86/kvm/vmx/nested.c                          | 15 ++++------
>  arch/x86/kvm/vmx/pmu_intel.c                       |  3 ++
>  arch/x86/kvm/vmx/tdx.c                             |  2 +-
>  arch/x86/kvm/x86.c                                 |  6 +++-
>  include/linux/kvm_host.h                           |  9 ++++--
>  .../testing/selftests/kvm/hardware_disable_test.c  |  6 ++--
>  virt/kvm/kvm_main.c                                | 35 ++++++++++++++++=
++----
>  11 files changed, 56 insertions(+), 39 deletions(-)
>


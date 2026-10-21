Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613840;
	b=w4MoVAythfxE/GM+i/dIf/gdc1dNSHRJpEY5i3Lq0ApRSwSob0UcLGqiTBA9+l8SWY6a
	 7mXK+/iiFUdRRVHO4/b0FfTOAte/KZ4c7vcWpaBqK7U3PNAAPG3uFccwfqFFS0Efyfkby
	 pSg1rzjjIuumUnr8dJ+tqHBGpfhguv2Z6VVxuTRvzv9DNuERJx//Ya0vD9JkpnAS26Q8r
	 GX5gSKPEwLIfTA06UQjqoiNGMJuw3LkGQDTxBEtP+mo3rG5gBBXsTrxd7SEpTdNfhQQdC
	 FwbO3F/503ehZZa9Ff/sd2jbMWuUnO+yGiFrHeALssu657pppXNSBKT1+mOJMZU09bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=y5zGwiWlY/+7u7tVy4Nz9l+XQayzXqtSRL/HPTqEiC4=;
	b=BUeMFcwLPJmwA3c2TNXTP4r/e4q15QHvVXCbr3KMAw2K6VPopCsf8MuiYRlcHFGg/+2Q
	 CI+F8OEA/cgQXNwjc9E+tkskHnnPETFSReLYhJAqDaoD6rMnKxrZ6Ed1cQFcdtY0IMZLt
	 HwPRajfvrNaIz80cmdYP6hZHreGZan3dfIoMSEmyt4Et9KIo/xR1ih23uoAfcTo9jr/d5
	 w6BE1trBVzzS6OPrvYRM78/1hz+orQmvhhNSJXMnbDDtl7qGUq/mPGVPk1SLo0jP9mOEB
	 AdLtbrzKvD3dZ/7mg0mkjgWyeDHfK7Sdz6gCuptF0O3lftpmkm4AaIMnUxg6dmw9VEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JAetp1ki;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB63606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB63606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JAetp1ki
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd67d4bbdffso711739a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792613839; x=1793218639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y5zGwiWlY/+7u7tVy4Nz9l+XQayzXqtSRL/HPTqEiC4=;
        b=JAetp1kiqkjzlxZL8Jo5eBGSC5QmvhuD0DO3wx9QMVFZM2GFR+8xAh4BTJruUr8+IP
         Xl7a+9mL4boAb+Uz1za5fjJgByqs7v+sNwrcTn204r/O7aUk4OOsFjq/Jv/ahitzpduV
         SVCruaUS5OUIAiPfcVSDyxjxx4tpRF1VTr4UajXW02W24ozBnI8JIfkBnU6lq41gP00b
         0wMd4qv9FpV+lQ5uCEBTIDAr6bj5g13v2x70/KA8Y5FfYVE1HVYwopLs75ilUgrjqF6C
         jBVSZAAwjC7E+RN/cj7QIp5JkBjiyxEv+AvSyh+KfxItcved4Ol/oaBkFVVjVoqQV+Oa
         PBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613839; x=1793218639;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5zGwiWlY/+7u7tVy4Nz9l+XQayzXqtSRL/HPTqEiC4=;
        b=kYC1UW3zIEHo5L19IvX5ZpSb80nyDuIZg2VmOk64gyn68d+rvH2e5FFfk0SDfzfIVq
         hyMrRBeIm6rziUhw/9wovEH9SrVyPC9DxinZn+JZXCCbrDU1HRm356kdagJPx8vUMc7g
         RdOtapQPTG6TzUXtUgKUe0816hoMG+UNqh6B4OpBGCiksieTpx7WGcySBxSx2aZGplyO
         bXYIKwXaQGY5lxJcTBKuIZrY2XuOFPVE+U+5guwqN+TM88gXRTdBOiJmAi+1O9FOvXiS
         Vg7RwnTO8x85Lhom1aWLdBQsWwlKC24SfReTAVN5WQxcfGBr6+NiP1cCPeaweqB1X8U6
         atJg==
X-Forwarded-Encrypted: i=1; AKwUvBzV+1J+YZ0RpEbCXjXfmllTwChpL3ntVv4GdKFM2KQ4fDMMHcP1wHJz5zblpkaDVC8tjLZ+QjYEUwk7VM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIDIUJjEQWbj35vuKIPbtnKpejFVd1m2BkDgghn1nAAR/H5Nld
	9dUwcNRPG5SMEKwXhsQ9AVDyb6pw39S0p0wC+xnQQFc6ocI9AXJUaEYIS6/vTo8/KBvgBthg01E
	mfwc69A==
X-Received: from pgbda1.prod.google.com ([2002:a05:6a02:2381:b0:cd6:9aa1:6906])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e8d:b0:3db:4e0a:df51
 with SMTP id adf61e73a8af0-3e287dd6182mr2176941637.22.1792613838826; Wed, 21
 Oct 2026 13:17:18 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:17:18 -0700
In-Reply-To: <20261019135441.1420968-127-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019135441.1420968-1-sashal@kernel.org> <20261019135441.1420968-127-sashal@kernel.org>
Message-ID: <atkdzsPJgcu123DO@google.com>
Subject: Re: [PATCH AUTOSEL 6.18-6.6] KVM: x86/xen: Prevent runstate times
 from becoming negative
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org, 
	David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>, dwmw2@infradead.org, 
	pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026, Sasha Levin wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> [ Upstream commit 36a85200643e62d20a91f0bc1a811187b59f7762 ]
>=20
> When kvm_xen_update_runstate() is invoked to set a vCPU's runstate, the
> time spent in the previous runstate is accounted. This is based on the
> delta between the current KVM clock time, and the previous value stored
> in vcpu->arch.xen.runstate_entry_time.
>=20
> If the KVM clock goes backwards, that delta will be negative. Or, since
> it's an unsigned 64-bit integer, very *large*. Linux guests deal with
> that particularly badly, reporting 100% steal time for ever more (well,
> for *centuries* at least, until the delta has been consumed).
>=20
> So when a negative delta is detected, just refrain from updating the
> runstate times until the KVM clock catches up with runstate_entry_time
> again.
>=20
> Also clamp steal_ns to delta_ns to prevent steal time from exceeding
> the total elapsed time, and handle negative steal_ns (which can happen
> if run_delay goes backwards across a scheduler update).
>=20
> The userspace APIs for setting the runstate times do not allow them to
> be set past the current KVM clock, but userspace can still adjust the
> KVM clock *after* setting the runstate times, which would cause this
> situation to occur.
>=20
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Link: https://patch.msgid.link/20260728144954.355376-21-dwmw2@infradead.o=
rg
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

...

> **Step 8.1: DETERMINE WHO IS AFFECTED**
> Xen-ABI KVM guests with runstate/steal enabled (`CONFIG_KVM_XEN` + VMM
> setup). Not all KVM users.
>=20
> Record: [config/driver-specific: KVM Xen guests]
>=20
> **Step 8.2: DETERMINE THE TRIGGER CONDITIONS**
> 1. `KVM_SET_CLOCK` (live migration/snapshot) after runstate SET_ATTR =E2=
=80=94
>    documented, exists in this tree
> 2. kvmclock discontinuities from masterclock re-snapshot =E2=80=94 still =
present
>    here; the rest of the series is **not**
> 3. `run_delay < last_steal` unsigned wrap (ioctl uses VMM `current`;
>    vCPU path uses the vCPU task)
>=20
> Unprivileged guest cannot call `KVM_SET_CLOCK`; the VMM can. Guest then
> sees broken steal forever.
>=20
> Record: [migration/SET_CLOCK and steal wrap] [realistic in production
> Xen-on-KVM] [VMM-triggered, guest-visible]
>=20
> **Step 8.3: DETERMINE THE FAILURE MODE SEVERITY**
> Not a host oops. Guest scheduler steal accounting becomes permanently
> wrong (100% steal for ~centuries). That breaks guest CPU accounting,
> load, and can stall workloads/watchdogs. **HIGH** for those guests (not
> host CRITICAL).
>=20
> Record: [guest steal corruption / apparent 100% steal] [HIGH]
>=20
> **Step 8.4: CALCULATE RISK-BENEFIT RATIO**
> Benefit: stops a permanent guest-visible accounting failure on a path
> used in migration. Risk: ~20 lines, no locking/API change, skip-
> accounting is conservative.
>=20
> Record: [high benefit for Xen-on-KVM] [very low risk] [favorable]

Two questions: do we care abou this specific flaw, and does anyone run Xen =
guests
with KVM using an LTS kernel?  I agree with AI's assessment that this is lo=
w risk,
but unless this will actually benefit someone, I don't see the point.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041187;
	b=BgWFqRiQ1DNrByC0vApdpBRmYJXEyzrzHDJq2+NoYA0wZyHv4/WcIz8PqO6Ea3qDXLI4
	 QQHkVitkBq0WYqmW3Gv55ggRmWC1QntKWtDTiRrkLStLzLQcKpfmggEt9FDtSJzKFH0GD
	 hIxfUsHZW5j03Y8uba9nCZ6C+6RBowtzCLUSA0FzDkQWRCMDE6l+z7grESVVMFrFBXdqN
	 zkCwkCF3/01FnquDh4ezae/UOdkaXXHNICMlCWq3nUGmXSyqFqBe/4IM3O0NPh7UyUByk
	 XG5t51xVfZVa513dVfzQX7s4sCJm925vRE99Il3Lc8vz9EL+NPWyNVJxlvc2ibzWjtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=vFQSzrzMPbR886MkQnFhhUgLb0bB/SvZ7Bv3piD6vcA=;
	b=s5d3B6utnlDejIuHDHGRs1sXCGmWrnxXjpKAvIcX+lS+Q13Yw1e0yj2CAqG5DxLPf3GS
	 RA4yvk9zA5GT07FnPP052Iytxp3EXZrfsiEE4Vn5mYVo4wOya8xYaps62jSKxCK3GzMWi
	 yaGOASKgAp0pAR8AVRqt+I+mcDai2Qvb1aIuf93M0vSvW6Ufr/yJ0v3JjRfVFdzovpQRp
	 +XmmtsRMDSmIpzXedHsM09Rp3A5FZvee05ex8dsRyw55SYhBmpiYeAjtbtvsm9sFGL6BZ
	 It2lPjnOHRB+rI2edsb3U6uwb5mO4cZYv9l1Y/jg6NV5wB1jV5Q1xguc6Bm050PlzrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NUlN30vn;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14BB606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NUlN30vn
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9821ca96fso38594355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793041186; x=1793645986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vFQSzrzMPbR886MkQnFhhUgLb0bB/SvZ7Bv3piD6vcA=;
        b=NUlN30vnYiu/NIUtOUp+Tn4OxP3vIq7NpWCK/SBMEp0pzsRPLp3PSYWwv08HqWKq8c
         DMP+nLjVSEnuniHsAymIsTM7kpVYCHa534FAc0ZvmNh2LQP7iDWqKwIMJi38LGZTGDai
         UeOiaWkYNaKU5kKenhqjQOe59hKsMNOukDtG7z9etMGVjBwVzOIm2DDtSAHyuyna1r9N
         EKQ1ZW4a6Riu45WU8/INkcUq3hRDjnw6Gx3WDw/Nh/Zpx823xFlqRzTueV/kpLJei9sQ
         SJHpd3BuAkucBYeUwPkuvYyabt7yBtr8wYdd4gZisVFmGSmVfgbzBj7zOlsMc38qTUyo
         Ts0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041186; x=1793645986;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFQSzrzMPbR886MkQnFhhUgLb0bB/SvZ7Bv3piD6vcA=;
        b=r2JFD/feeoPgj3k1a0lsFFH2HBew8B+Ycdhv7w2d0p3qwuf5uGWDWOAqTdRdZ2Cmkd
         GVmeh8PRTA5ORDqkPanL4FXaXYKi2YRHC7EKXa4srVcH5U/LOMwdzDcTBh7z9haIvn5y
         YVAri962MVnIOLTme3bIf5m/4StErGvSiT4NcGQ38cz+YPitt2hFmNfRKayo8Po+pAE7
         QaFu2+FXjUshiPLF/80CNS195CcLExEQQv3CHEYSETlvs1VIjPsUOlpUrVIaXuFGu9Nn
         dhmcZk5dIuD2OJmf7fw57Rk5/cK4X4IQ56u/FyalDoE2XoBmwo9E6eJkoAkFGy3TU6+L
         eSTw==
X-Forwarded-Encrypted: i=1; AKwUvBxi6DQtU6zATGQKbji1AC9XJnKCV2YcQ3dDYbvUoF4KVq4ThqIEGLnOyWXL3HVGD7QYYX5peAPcZ3BvtGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK78HwraU6x+qpTODhMoe4Fxd6gsAcGMz/lct2WsqirzMb+smuN
	sq5Y94F8Ik8l3/Bz4QSvbKzsl7wo7FW5c3V10i9zo87dOeAQ25J/K53+Rbd3Tp4aP656ooYZnZS
	lAqvLZw==
X-Received: from ploe5.prod.google.com ([2002:a17:903:2405:b0:2df:a429:6698])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3805:b0:2e9:460e:ca57
 with SMTP id d9443c01a7336-2ea9c66910dmr71815065ad.15.1793041186062; Mon, 26
 Oct 2026 11:59:46 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:59:45 -0700
In-Reply-To: <kupecdcwbmc.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022215541.631694-1-seanjc@google.com> <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
 <at-Pfgjt__PJl55M@google.com> <CAO9r8zPAvi0vCENtj+7+gVrojB2nOHEoYfyhgdgxpmiUA2kWgQ@mail.gmail.com>
 <kupecdcwbmc.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
Message-ID: <at-jIZ4uK9_IgzZh@google.com>
Subject: Re: [PATCH 0/2] KVM: x86: Convert all runtime WARNs to ONCE
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026, Vitaly Kuznetsov wrote:
> Yosry Ahmed <yosry@kernel.org> writes:
>=20
> > On Mon, Oct 26, 2026 at 10:36=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> >>
> >> On Fri, Oct 23, 2026, Yosry Ahmed wrote:
> >> > On Thu, Oct 22, 2026 at 2:55=E2=80=AFPM Sean Christopherson <seanjc@=
google.com> wrote:
> >> > >
> >> > > Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs th=
at aren't
> >> > > strictly scoped to module init/exit, or similar, to ONCE() variant=
s for what
> >> > > should be fairly obvious reasons at this point.
> >> >
> >> > Do you wanna CC stable?
> >>
> >> Not really?  Maybe?  I worry that this will generate an absurd number =
of conflicts
> >> and also have "misses" in older kernels, to the point where it oculd d=
o more harm
> >> than good.
> >>
> >> I could be convinced this should be tagged for stable@, though honestl=
y it might
> >> be better to omit the automatic backport trigger and just rely on some=
one to
> >> "manually" provide equivalent patches.
> >
> > I can just see this ultimately preventing a DoS and if it lands on any
> > stable kernel it should be a win, but yeah probably manual backports
> > are needed :/
>=20
> With my backporter's hat on, it would help significantly if we split the
> patch per-area (hyperv, [l]apic, posted_intr, vmx, svm,...). It would
> also help those who want to analyze whether the particular WARN_ON() is
> actually guest triggerable and open the corresponding CVEs.

Honestly, I don't think that's actually going to help.  Exactly which WARNs=
 are
problematic will vary by kernel, a lot.  I.e. the set of WARNs that are spa=
mmable
*now* is not the same set that was spammable in 6.18, 6.12, 6.6, 6.1, etc. =
 Then
factor in different configurations and threat models, and the set of proble=
matic
WARNs gets quite large.

So from an upstream perspective, I think we should assume everything the wo=
rst
and "fix" everything, and then do the same for LTS kernels.  I.e. backport =
the
concept of "never do multi-WARNs at runtime", not necessarily the literal p=
atch.

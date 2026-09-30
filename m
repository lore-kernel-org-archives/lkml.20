Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4443D9DCC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801235; cv=none; b=Ncjz2jof+5GLkLyThGaN1Mrhi235gRKS7z0f7ESJ5jaZ1Md1LCMU6DWiSNEjObxU19VwAOgjeZuQuQCGblPsEOUFuMAwjVJEBhSe92NoSFJ4fhJjb6+OtBQTMRMbXmtQ9H2gfi9SjRnwzOX95f+4clm0nhhwOSb9RaEZHJHNKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801235; c=relaxed/simple;
	bh=Mog/FLzAh1i1x33jKg4tFuMrLWl4A7vyt0xscTQGKuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNtCoCXtVZKhQYXHYWcYN4BbLIJQg3vACFH0bG1Lj/B3Vo5ncESIvPYe3LZL2xCtKGl8sl0ABpndGMtG1pKtD5taeiq66HNYubhPdu4XjG97k+XnlYrcsxhYS68ypbm2HDoKrYwV61IX3J4EbBo/AqYs1Gwxbti32Wqih5Bkl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzOi+wBO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzOi+wBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEBF1F00898
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801233;
	bh=oA1Wp5l/4pd5OBAEkVMacf5GMMfFrP8amVpkQqU9f7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JzOi+wBOJtDfK8od4CtYUyQkR9gufb/sROMOflfTNYH+NHkUKCNOduI9aS+v4uIZ1
	 t25YSIiLp+Ba6lJxh+n5HJ0U/gqRdnF3MlySrZ5XVEixPM+1s3RZ3VnssAB1om1kh2
	 DkHj31BqWnwFUhMNMft6Rwe1DrQYzSCpI3pEztTjC+Gg0l+dMNPnA1TEfQ2rAN4KtC
	 Fe9VX/BRbmHVfEkF6SBrtwLWlsQ46PA6jezo301PcUkH64Go+jbkMMRm5OyhT4Ig7x
	 zitNiSMPXfs1Ah8fBjER2Lv44cRLKxnI7VPDx4DSnS5ztZz6kmRWOfpnaG654wVC/a
	 +GQ+r3JeTzIEA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso5146196e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDk1q78w0FHLR2uvgfDxKMGeLjRISp3GeY4X3zMFJBsaPtmhyPEMnwApG0J4kgLEKEFnQPfl24K79y3qc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeBG9iaKLaQnsTfv/TYs0/mfF/YyUHzo8hqNjqADK8kXE7UNRf
	tBWdCPi7ICG6mQw7YTwcOz5YvnyljsYw4TzH0Bc8jWL1GCCkU8edgZ7+DDSo0fAr43tnZqVyPpo
	I8ziZwPaEZN/H05lkoJIzVA7/0Etoo2s=
X-Received: by 2002:a05:6512:3050:b0:5b5:edd1:471f with SMTP id
 2adb3069b0e04-5ba405e14cemr1100142e87.11.1790801232600; Wed, 30 Sep 2026
 13:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-2-will@kernel.org>
In-Reply-To: <20260918161407.2300-2-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:47:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=XkQuYGjDx7cGbyAbA3PZxASF=gUJtjF6rMaiWgt+dYQ@mail.gmail.com>
X-Gm-Features: AclHuK8OBD0wnlj_zeKgr2mdF8meUFnoNCcPdtioxRKpQrlc9trGZVWgmVL-ruo
Message-ID: <CAD++jL=XkQuYGjDx7cGbyAbA3PZxASF=gUJtjF6rMaiWgt+dYQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] arm64: entry: Defer setting of TPIDRRO_EL0 until
 exit to userspace
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

long time before I had a chance to look at this.

I wrote a similar patch at one time so I like the concept.

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> In preparation for using TPIDRRO_EL0 to point at 'current' while running
> inside the kernel, defer its userspace initialisation from the
> context-switch patch to exception return. This has the added benefit of
> not having to worry about keeping the in-memory value and the register
> value in-sync during preemptible sections.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I would add some elaboration to the commit message as to what is going
on in the patch, and  correct me if I got it wrong!

- Userspace sees 0 in the TPIDRRO_EL0 when running native tasks
  so we just zero it when exiting to userspace for those.

- For compat mode, TPIDRRO_EL0 should contain
  current->thread.uw.tp_value, so in that case we just write that
  before exiting to userspace.

- Userspace can't modify the register so we don't care about
  saving it on entry.

These three seems to be what the patch is exploiting.

If this is correct, with the above description added:

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

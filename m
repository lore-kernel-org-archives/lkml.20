Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A6463B74
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284212; cv=pass; b=hfRASpRR8gTwBsEv5wMkLVXYfURvpGk6GAv/dV0NaVrbsGBRvbuDhqUY9I2SPSVB1s28W7dgSz3qI9ORW26Q1DXR/C7xKBX1QAAjazsK2JpWY0SgJTbClEwFbkhoSg0FW5ZLdODmVqkJ/EVhnThm4dXWEg7UIXM8UwDWaB3FINQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284212; c=relaxed/simple;
	bh=3yo5oIEYlMca4EoPsyPFlcJYhqFB4gK5zMT/i2Oybck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3nDGLJNNlK85SafQUvMa4zr8i89xbpHgGdQCLXXUkHO94sBQibwJ/0G5hGdEtaf3lnitgwKK+F/kjhFHwBLuayaZcRQGo9h8Hw3f5OpcPxtRmkKctm/v3EvRSkOZvPLPK7ri7+vNHQoIWkf7RHk7+L6aV24o2kcPDJDGmz2xY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9h/q2fi; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9h/q2fi"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0d298caso143616a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790284210; cv=none;
        d=google.com; s=arc-20260327;
        b=G/6eFZ0AuqqZKhNEexLPnPvca/vT9TSsBxtDQjToC3bfryBL/OwaX+YAeuJcd6hjiV
         Hp+xGEkfYdpcHUHTX/AaDjVsxe7lLxaQIgxGbVbmrqtatASomtKS3lx43is/oXdsF5/G
         ocAUwt7sPI+8o0Hj3GjrVdUS4R+7oI6fRPpfzALv6mzPm0FWP/yIQ84aQg5O12G09awM
         onUfPF1Mskya03sWxOFjLjxN573HtzOb+XLyK1MNYedJGeN8+1T74a+mYcQ3LA5sQFbn
         58ImUOVup+Qf89mVor/dxlIMKCaw/hX/NVasDgVO9ZykZtpZDFNb10xQ4e5U40U1CEv5
         lKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3/Kxhh+79/4x/LEoqCrUUyKZ1r0/KT+GWkhZ5N9V7vM=;
        fh=dyY/yWzZE6deWeCbxL2jibaioHymBYf14twV1Hc6aP0=;
        b=McicGw3JDc1/9kyAOCmyHbnM3nCuCPfJh90fQNMgpQrlggxQBxOuc2Qo1w2cC7Anq4
         4BJsU8eh2yKiaKTe2MS/HqqJ/qJyCxS+vfV607+KoWXzHAv78Zr7kXrGBPtbxtEA8Ptp
         QbOtSsfUzQkP4N6oZupfNZ2Ewc295hYttDs11WUIJ+xexHg386fYSEmJVg/aSVC39D8a
         wiv9ZxOXd7p7RWdIJplKv3Q7UVrgFToH3CvYnQejPKnMxjNT8fJYBpAfbwCiiTSfwXDT
         qUJgwjvsZSGHt6LsSYxJcwdbnPmrPz5p7msGdMUvdkHrZ0rh+ucBecZkLm0DOxhRzsLU
         QWsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284210; x=1790889010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/Kxhh+79/4x/LEoqCrUUyKZ1r0/KT+GWkhZ5N9V7vM=;
        b=h9h/q2fiKFlosznqbBsLAeC2hIhoSvMa0FU8pxD00MXb01FVtQ5+XiHzG0VBMBDQt6
         xbWlDXSBWGeGu6xYLc85UeVjyyVtYp2xFZXlvpAyQuG/43nFteDdHTtB8l0Vp7Tb2f2T
         Uca+T6HfZZEarJAJ+65yhWnePE2XyRf4qRy2/rt7QAjDWA/4KKfMCrWy5Vb6upzmiUSz
         7ahtIXG+5xfBz0LrOsJXJMoSeK9XsL6IKvMp9HbzSHMakL7vWFpFrgUyZe3eAvxp+yfM
         TvnGjJOR3FqfKXIALuRA4iiVnzyn970K0oFTTj7mSjCvwdQo33mJkRAp70OVjbFksC5v
         TD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284210; x=1790889010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/Kxhh+79/4x/LEoqCrUUyKZ1r0/KT+GWkhZ5N9V7vM=;
        b=gwKdPjiH5UWFOzFOxHV3a27Ec4L3rWGXL226xOXmZ+7WMQb+FvtNAmtMLqtOgiXjya
         0UdeV452i3k2vm8Nfy8RUSsxIQrkqCQ44npbR6ZkmmpLnX3j/ZBMSaz8DGk2tbv3PbbC
         JuPCGBBhtfXEr0Fafomti6Z4F1ENEHVbWuM1dEC0aY7UPHGoUW7VXHNdofvgpXdr6YgA
         oD8I1DF/dNrIHX5RychVoUcWwdfxhKr7Ia0wGf6ZUYjzLQYZo3G/e16eW2DmAocZs0Fc
         cdAyvi8Jjvx9d/4t+3R0G8US0HCNaM77G+HJguZU3NgS/xc14gq1WUj0Kzw91yT63WxN
         jCyA==
X-Forwarded-Encrypted: i=1; AKwUvBzbhrLoK1Emt1q3uSRAjhBYMLaRXd0uRBbyYOyj8wBRbPcQAm6YZzqIPtUaFd7P+D+nlhq8QcXKofvNHpM=@vger.kernel.org
X-Gm-Message-State: AFuF++kzxBhLa2TavoG4K0pllyeqhls3CZqk1BVd4qc56R5JdtujnPYl
	cF4XqjfXds6Dm92HIylp/dBLcNCZXtVib2c7ejiRub6fuG2eZ9rqrw4mlB4vqmnfJrlfse009qI
	V/vxNWLaNl1aON8fu3qKROvd7td+rreM=
X-Gm-Gg: AYBFou3Heil3+VwnTFPoDxQe8pSCKHO5GUldhptxvztz17gEYyKZv4fe5WgXOgnYFss
	24bSZoIRmwsWppzQb1jT5uYfuJmvbor7ur97cYef2iiRHX96vXVYtoLKWLxeG8RdtpmnIHcyN9L
	pBRy/KbYQQYVK/sVjO+m3As5uzsLZiZxHIYWDOqWgVKP1M1EEK7KO1J3AsQxGTNUpI0K95tphBh
	2atTudJbP9oDBhWkLpy8wlgKnMiFQtKnbap1t/rrFn1g8Xd8IBBxvVyLMIWo/N9FkaAxkBJHTkj
	vk2TqITEWZbBL0uDfq2s9u0iG2rlnBLJ6o0PZTxFoYx/9BvDdiLL6Q==
X-Received: by 2002:a05:6820:16a2:b0:6ca:453c:b001 with SMTP id
 006d021491bc7-6d4411d1c2emr3781223eaf.46.1790284209753; Thu, 24 Sep 2026
 14:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com> <20260924041604.3209659-8-avagin@google.com>
 <20260924184707.GAarVwK1eLHWLrIuag@fat_crate.local>
In-Reply-To: <20260924184707.GAarVwK1eLHWLrIuag@fat_crate.local>
From: Andrei Vagin <avagin@gmail.com>
Date: Thu, 24 Sep 2026 14:09:56 -0700
X-Gm-Features: AclHuK-DxmHv-xVrRdn_cNZVc9cfjb8aRW222NvS2nw2LvTOOE1Srz9Sb33akLk
Message-ID: <CANaxB-xP7b5=2aFF5oDvJfFPWJ0VKtwD8txZF77TTkA6Zub3YA@mail.gmail.com>
Subject: Re: [PATCH 7/7] selftests/x86: Add tests for signal frame FPU portability
To: Borislav Petkov <bp@alien8.de>
Cc: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org, 
	criu@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:54=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Sep 24, 2026 at 04:16:03AM +0000, Andrei Vagin wrote:
> > Add a new selftest tools/testing/selftests/x86/sigframe_fpu_portability=
.c
> > to verify signal frame portability and consistency when the xstate size
> > is shrunk:
> >
> > - test_valid_shrunk_xstate_size: Verifies that the kernel correctly
> >   restores the xstate context from a signal frame where xstate_size has
> >   been manually shrunk to only cover active features, as long as the
> >   FP_XSTATE_MAGIC2 marker is correctly placed. This simulates migrating
> >   a process created on a host with fewer xstate features to a host with
> >   more features.
> >
> > - test_invalid_shrunk_xstate_size: Verifies that the kernel rejects
> >   (via SIGSEGV) a signal frame where xstate_size is smaller than requir=
ed
> >   by the enabled features in the xfeatures mask.
> >
> > Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> > Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
> > Signed-off-by: Andrei Vagin <avagin@google.com>
> > ---
> >  tools/testing/selftests/x86/Makefile          |   5 +-
> >  .../selftests/x86/sigframe_fpu_portability.c  | 246 ++++++++++++++++++
> >  tools/testing/selftests/x86/xstate.c          |  12 -
> >  tools/testing/selftests/x86/xstate.h          |  20 ++
> >  4 files changed, 270 insertions(+), 13 deletions(-)
> >  create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portabilit=
y.c
>
> Sashiko has a comment which sounds valid to me but I haven't looked at th=
e
> surrounding code:
>
> https://sashiko.dev/#/patchset/20260924041604.3209659-1-avagin%40google.c=
om

Thank you for pointing this out. Sashiko didn't report anything on the
v6 version, and this test hasn't been changed since then. I combined
%ymm0 load/store and the kill syscall into a single inline assembly,
so I think it should address Sashiko's concerns. I've sent v8, let's see
what Sashiko reports on it.

Thanks,
Andrei

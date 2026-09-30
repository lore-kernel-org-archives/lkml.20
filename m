Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0465466B01
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803620; cv=none; b=USo10VwNn6vmVnVOiH/MPEI7TT/xeDfv1pKzR+LXXP+9hMfpH4y71xPx3dUsj4ht//IlBV8Z2E6WPjttfThU8O/iSyfBvTrfNskiAcm0g3Nqnj17+1N/upKfVZKX1e2GjYOECS6LbN/awE+PqqldnvgyHdNQ05FSF+x1D7YnOhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803620; c=relaxed/simple;
	bh=VMKZt394y8sP1XgH0k84NUhUZKk8kLGCbV/208seKvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlwX2mUaNSc1yJohZWW4Mn7hCpbUKEK+azkEiFR2tdSZ+USlW+5IGAE9eYneJ85WhZE2Sh1lQVIcreMqZZAxXzdwt3P507S2tTSrDvdr2dxDsodhhSkxawDARxA8cQ2jiihZs065px2+45UUBhdIYIltwNUd7gfQJTnV883XgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfO4pXsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfO4pXsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C1A1F0089D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803618;
	bh=VMKZt394y8sP1XgH0k84NUhUZKk8kLGCbV/208seKvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EfO4pXsSxl5zQ3uCou04oyizWVBuJikn3CALCL/Sj5ocpFMiFJg7PqM+IYZV25ceA
	 UiCCvJ7kghaZWUNN5iuFI9cyXK4znmZk1nOWkFN0cK5HdbwO9qpzY2ERggSAO88cnm
	 vhI/lhlLsUcFgxXTePMOwE8LHGs1jDIG1WEYbv8UfRciFlpBlR+vPE4awQ0ZJk4mPS
	 gREIXc4X8pwCy0Pf2Cz+eE+cLUgYJOcfpWUk+ypYssumVoiWEOStgp2xSwldBOsWWt
	 z3H/T0MxOicHsueFLTWwk7p5vqNPxJRvldLqpSLHACvsBudRZlzvm5nYywgWAVoscA
	 oEpGAA19Q/fNg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cedd9baso18503401fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgmx9cbHvA5V7EqWxlJ0UAYmKdVI4EQBCKOD4MR1aG8y8RmjE+0hm0nnN2V1gSNibSrK9fodLvGAN4WYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeFHHa4fmBTJwVxLY3BpX9l623jiyRvwRfpSgPYLXF5eGaR2BO
	rxhUsctvxtaN6jCj+6rqu8VnISVITj9gSepDhA+M09o46NEg66DXFzmJ+vj1MpaN9cZFMn2MUpg
	VlErnoXZm4xaP9PCJuKgG32t4oReBa0w=
X-Received: by 2002:a2e:be8c:0:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a7791db80emr8128511fa.7.1790803617088; Wed, 30 Sep 2026
 14:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-19-will@kernel.org>
In-Reply-To: <20260918161407.2300-19-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:26:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fFuH9dihJemKbD3b3ePbskAzMOjveAXvU-+F76hG35A@mail.gmail.com>
X-Gm-Features: AclHuK_U3gm46pGm8iBpRhWkJLq4kh7lrH5qaZAMF8hLT7PfyguaNDEGWOLAB7I
Message-ID: <CAD++jL=fFuH9dihJemKbD3b3ePbskAzMOjveAXvU-+F76hG35A@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] arm64: entry: Split up kernel_ventry macro into
 separate helper macros
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Handling entry from EL0, EL1h and EL1t in the 'kernel_ventry' assembly
> macro is getting a bit unwieldy as the control flow becomes increasingly
> dependent on the macro arguments.
>
> Split 'kernel_ventry' into three leaf helper macros for EL0, EL1h and
> EL1t, which are then dispatched by simple wrappers.
>
> Signed-off-by: Will Deacon <will@kernel.org>

I agree with this change, this is easier to read and understand.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

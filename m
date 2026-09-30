Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC13B992C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802182; cv=none; b=DfrPcUwQDFUUXv/n4L7HpBXjIB/0NpnmixbA0ob0kHcHyuQOXH8JNopPW2NxzHXiLdMN/DpSzQ5O0kaKScCLeNwvqObrosuYLQorPf1Xgk19TiltYknfaAaHU5OUY4e7ACQOzohmKxj9+UGYXiSt+oyAndjrpwwlW4QxaNPP0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802182; c=relaxed/simple;
	bh=VXcmhxRFPyDo7G0VXnE8mGBcLQuaaxOtjql+bmbJJmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOVQ+LmMPaW8RB8Yyha+xr8mZR3cz6gZaxaGmgiuigGbfSAiKPSOG+VPNLS95a1r1qzYoFySPR3/aWkeoiVjlCtq0ZJipWRQ04TjGQWd5CpLqXZ71wCmoNX6bYFq7GJ01PARYlONRajRkJ/f/NvcvN7gcj50P4i4HleEcXR9VLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXdsSByD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXdsSByD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96441F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802180;
	bh=VXcmhxRFPyDo7G0VXnE8mGBcLQuaaxOtjql+bmbJJmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iXdsSByDSKVDFBcxz6x99Ctyn1fwlU+AQesbyfbti47+pCthiWG9wLdIykTBlCKOE
	 SaoHwAQn1sg/ERmXOtxcTH26DgafFnr7cUmQgP0hNniXwDuXzvFmTo8Wg7s/csnqWd
	 OjL3fDG2vyQTcZbF4sOks3cZtRuvQ3Ht+u74Sk5aXaXYuDzY7WzrW/cP2keoOQMgG1
	 IZlXkqc5tcgGNEj8zgBXGF5cIECh5E1aCH8hBSZRaTh81JxeDRfyg/Y4GPrDn1LsVB
	 G6xkV8LjnWJioy29uuFh9WNMh8PT9NFFHH3tgD+QW4r3O0YNw1U0HSwePH5pCx428M
	 g8r3/p8TlF3jw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64b06fc66so40856861fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxbIrVw5p/ZC1QRzR7FiPcQn/s43LKHg1jIZ6M8vOhvWse+gySm+0FsRqLPhLt3bGefhj1qCFm40McT0ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBRT7/i/+19vn2t75iol0mQ6lq/obzAf8MRTRF5ni7nl04OK+i
	wuYv3vAODyFIHYqmP74bi1/I/7XdJ77PnRJioON8XZYl9z9dtIPjHieP38wcOqUyaq3HGz5Srrl
	lbwAOTXM+bOq5MYxbBXZ4BwE4uGmdxNk=
X-Received: by 2002:a05:651c:1991:b0:3a6:6ecf:77fc with SMTP id
 38308e7fff4ca-3a779239069mr7881541fa.20.1790802179476; Wed, 30 Sep 2026
 14:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-11-will@kernel.org>
In-Reply-To: <20260918161407.2300-11-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:02:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnraiZ_=3sBxCRZZRO4sYNukggksvzGMrJwVmLw5Q-bmQ@mail.gmail.com>
X-Gm-Features: AclHuK8lqw0xClayS2juku6qh8ThyYVtjid64ZdANDn9WV2EDJehSkAIocbI1Oo
Message-ID: <CAD++jLnraiZ_=3sBxCRZZRO4sYNukggksvzGMrJwVmLw5Q-bmQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/21] arm64: percpu: Specialise set_my_cpu_offset()
 for the primary CPU
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
> runs once on the primary CPU and before alternatives have been applied.
>
> Rework the function so that it operates only on the boot CPU offset,
> drop the unused alternative code sequence and internalise it into smp.c
> alongside its only caller.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

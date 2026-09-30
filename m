Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF46429CD0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801728; cv=none; b=gmnVrY2EfvwHCl0WqIWWLXdJo0cP9Xuj60/b74Vh/zntGHUwcJUvyleUcKSwgxmN+jQaVvZs07HefpOVaj0EQ+ivj4+rfhW+G9ebcqaMzoJZWiYeDSDLy7ASP9RnPqlYmWNWZqpDjeRkNPcSPDIb58+Zmr1SqnuccLSst2SHeTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801728; c=relaxed/simple;
	bh=HCgSqVGjXBaxfcapf/nqx7C7CnofVHmzcTzARfODWNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg/i6DvhFXYc1wQoKbVU/seqj7pvptUSIKNSveBdCsN9cjNrA1Ak+WtWuS54OqWg61GAuNht8XAjcGCjfb7hHSr94698K1JsLzE/7p8UA0xXejXQFf7BClq00b4s0fO4bCvTI+jHKYbjpObi6wY4Br2us9QrhEo5DTRCK32tbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyuAAozm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyuAAozm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1B91F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801726;
	bh=HCgSqVGjXBaxfcapf/nqx7C7CnofVHmzcTzARfODWNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jyuAAozm2SlG/3yaJzwaRF0564cBU2dNOYce6HgXWn8I0yYASB7aK7sdAw5+8ol5A
	 3MjxwTDKq8AgC0UNgXiEP7CVvNKsaLLPEY5eWixPJzFx07GU5n5u+uTIgzgXt15w8L
	 VCKu9ZBGrJ0S/xtEVtar44q1OUG2/lebF5fSZE/8opypl136+zUh/kWpMbmYPnbUn6
	 J/eZhWf0JJZ6ZjjHS/noRGToKk6hDAaqo2MHEFBekvH7K4YOiOhxURVGC4KHayBg03
	 wvIe3WCgxByeHqwAtGcxNomjS3vJX9BKigqCucHHvK6JOW3KxVjyeJW0hDntnJS1fK
	 Zi+xxkiUSyWQA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso61821e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:55:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVVzegw+rzbwdqP1t40gMXWxF8GIrJQv8+h5lWQFFTwpMr9oVvn9vixfnQuvhMM7X625HkW8d+B2Pgp7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPNW0ZcVuThFUxu+wQM/tuybvuPEbQAZ3QznEf2fZ0T1X/KV/3
	AHwHPeg5norP9IUabUIy2pSzpcrY+NL0QYSE9bYZ0aVKO3CX/49eeuqfhLlFZYB+2wMob+54wgc
	kO/98eF/Dp52vPP/eNlrMdCmrFqYN/Wg=
X-Received: by 2002:ac2:4a70:0:b0:5b8:f0a9:8acd with SMTP id
 2adb3069b0e04-5ba402b86bcmr792389e87.4.1790801725523; Wed, 30 Sep 2026
 13:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-6-will@kernel.org>
In-Reply-To: <20260918161407.2300-6-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:55:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5uk-iSHO4hjbnJJVZy5pTJgGA_82XVK9z8pe_DkqdLg@mail.gmail.com>
X-Gm-Features: AclHuK-aQw1JEMiKBlcrYG_6zaRzd-8YwVY1-spj-5xQF9lhNQZtAGIMC8Pjo7U
Message-ID: <CAD++jL=5uk-iSHO4hjbnJJVZy5pTJgGA_82XVK9z8pe_DkqdLg@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] KVM: arm64: Protect TPIDRRO_EL0 across guest entry/exit
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

> From: Mostafa Saleh <smostafa@google.com>
>
> To prepare for using TPIDRRO_EL0 to hold 'current' and repurposing
> SP_EL0 as an overflow stack pointer, eagerly switch both registers when
> entering and exiting the guest.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

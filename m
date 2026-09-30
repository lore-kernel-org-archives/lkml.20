Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01E4BA1CE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803073; cv=none; b=EJwHoPCOf2pssNo1BJuEB0q/zJezKDYJQuL3mL/2xOci5IsDy9yE6NBFgsZ1SUrfiG+iED4wEnsM7P/Uc//0m8rTpiHC6br9HcOeQ6vjPytsXFPFVfrxC/VZZNiN6hKesd41H/QyTFWhzttG08pJ+HmGBxOmJz4bgL2cebfrt/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803073; c=relaxed/simple;
	bh=fl5I1QV2eV1xWfYcij/eLCiR69UEs6OwINAi4wPHZ40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH6NSI0Sp0UprqIuBdbO6V+ZRWU8rWWw17sMpi7Oj8H5EGPg5Pn6u3OdjbJmXN1B1SZVVH2duQFrRtow3lH7lzrWokalASEYa4PT/8hfo8w9izKzQYAXWRai9ljVNul94Ho2SvVCl/prhaXUwqy8wCtwPREw7I1OJMxKEILwWrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMXfO6BW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMXfO6BW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E151F008A3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803072;
	bh=fl5I1QV2eV1xWfYcij/eLCiR69UEs6OwINAi4wPHZ40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MMXfO6BWn8bUWVdo0p3wi5ktdVKnFBqkJG/xMETceD1Ee58UNPFbHOodgJQo0JdQ7
	 i02bUnW/+FTf9s05fgxGwILL8QJtDwZmiCwAGkmzi9b/iZ+5kQPJxBsVGMYdHvHdOj
	 9fqG50EUA/44HThnQy6BX2F+xNsV0igLE+P6gbhIDxP56pTFptPqHmCp5wvOkqykoq
	 Emq+wP3ATXstsoayyVNjFZwAJEy1pCRBe9gzIFIZOio7LffvLhQXw4Ke4itdTzp/Fq
	 LZdGocmzEqYa1D/KEWZe0SchgBLyS2gL8+4X8whKrvj02n62N7vF0uXSIkRdsLHmDe
	 ApeXqVqVPo+qg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330a7e46so1966855e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOl6i3V5KKTz5og6jiIus7eTaUW6u46FbtHx8nD4xN1l2LpYHypwWBSiIX23c5S3hcHcHALrWoINqWA18=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/SuW3ZAux6uX9AFeYx0mVrTq5lAQNvZBtzHTNPlKFU7Mk8idB
	FgSGn+/SilyTiSGY2jZ5cKAjOM3kOdkn3x7WRajMAye9Z7mEGCradfOMhk+dU9t4RSEESG4pXAR
	viiysNTET6qFcGjlmqjQrV9/JtoaF2is=
X-Received: by 2002:a05:6512:2553:b0:5ba:3339:6f6b with SMTP id
 2adb3069b0e04-5ba405ea599mr830481e87.20.1790803070880; Wed, 30 Sep 2026
 14:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-17-will@kernel.org>
In-Reply-To: <20260918161407.2300-17-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:17:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmyeK_ofduD6fTqSDxBMn6Uw4RcqLzWrVAxHBFfrNi89A@mail.gmail.com>
X-Gm-Features: AclHuK-Ykzjqcpqr2_CBUXShzMhAuD7nlzJPuK2IKAyiJBm7WI7lbLkuW_lz0QA
Message-ID: <CAD++jLmyeK_ofduD6fTqSDxBMn6Uw4RcqLzWrVAxHBFfrNi89A@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] arm64: entry: Implement EL1t exception handlers
 for overflow stack
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

> In preparation for using EL1t to handle exceptions taken whilst running
> on the overflow stack, implement some simple wrappers around the EL1h
> handlers which perform a best-effort stack overflow check before
> proceeding.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

In the commit message, say something about the fact that EL1t handlers
architecturally use the stack pointer from SP_EL0 which we
have now started to repurpose for the kernel-internal overflow stack
and not EL0 (as the name says) at all, and handlers here will
by definition be running on the kernel overflow stack, so people
understand what is going on here.

If I understood it right:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

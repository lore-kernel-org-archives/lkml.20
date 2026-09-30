Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A6D364059
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802332; cv=none; b=PfBn5mp9/HLI1JokJ9wQvJunybp+PN2hAInihdMYOHeqnlvp27hk0rGTfQcNGz35AED+VWYsa6DK4h68WVKk95euLmbSvf+5mE66MlYi9tM1CY2G61MdcB/uB4RyWsOI0Cy1B8/FPt3ktXEw/d6ujM9KxQZdl+vFf3WfuG150Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802332; c=relaxed/simple;
	bh=NnElHm8Q6l/bSL8TEHAw6Ax2AIHtYbElSbr4X4CfGgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmXSD70DHe5ZmXHOjbapq19HYK/HXIS1bB3/itmXaWChy2bPqcCFTalhtYb+L5NCsUN2pGBMUnKRbKVE7B5Ge6EULcHjxzWgk4uoGRKqpfvIHno22Dlopy55MJ+pVxVBdLLFtHB0pIV9IxdY6fMGR9ftlReKJvWJY/8262zKxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbXsixIz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbXsixIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80631F00898
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802330;
	bh=NnElHm8Q6l/bSL8TEHAw6Ax2AIHtYbElSbr4X4CfGgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cbXsixIz22YnxWg62ghrtkjUOdJLcgXnVpmTb8z8xTtrRaGU0y8whehPZXe8vj6X+
	 h2xrH3L5dnfvooQGig+P+kWLSYPD0JABXTcQePkc4P/DyMZdccK54iAC3blvx9yk/B
	 4sogQcidA1KhHDlnvcw6Rk5jsUdiJGE9rTktUXcVl0Dx5DakSwF5oKNpIlayGT6kwL
	 qPALo/Sj7rOktyRrSHneGTHi6meezj13osm4SX325c7HrNzHMWKZreVT9C5p52Qjw8
	 QmHm5qo6ty2MnpuxxqVoi5T++9LUhjtnWEYwulsGO3mJXDVPf+AqK9ASPFlio3a92d
	 EsBOvbRPRUAcw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330dbd67so1953965e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpsKZP2ouXJfZ1Ml+9K+5olHV2Y70d6GXfgPeudJK2oaCrRlI3xVpLeWRBXgIlGLDXLtA4+xtdIdOe3BU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjORIMcvfkIQU98Rlbsl0xXq62newNfuWVSbQgR+Nq0IYqMji7
	XHyVuHcL9hlRGIYUtAFlPsJblL/SYo/0p4IyDF8HgGbGV5uuMYeR/DzPFlXHJWVOEt1Ec711hht
	AH9QTCwwQq9PEa7Y3uTqCfWpLn1Iflgk=
X-Received: by 2002:a05:6512:244f:b0:5ba:4372:9250 with SMTP id
 2adb3069b0e04-5ba4372938emr211234e87.4.1790802329621; Wed, 30 Sep 2026
 14:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-12-will@kernel.org>
In-Reply-To: <20260918161407.2300-12-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:05:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4Wr+WqQkRweiVa-w-P_U0pMUeQznDWy_h=62FhOJXag@mail.gmail.com>
X-Gm-Features: AclHuK_03X4xHg6tnkdKzchIyjnd1uMf9JvGEWQecl5CNy_dFoxGynGup1si1S0
Message-ID: <CAD++jLn4Wr+WqQkRweiVa-w-P_U0pMUeQznDWy_h=62FhOJXag@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset()
 as '__always_inline'
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

> Allow the use of per-cpu variables from noinstr functions by marking
> __kern_my_cpu_offset() as '__always_inline'. This will later be relied
> upon to detect stack overflow of the overflow stack from noinstr C code.
>
> Signed-off-by: Will Deacon <will@kernel.org>

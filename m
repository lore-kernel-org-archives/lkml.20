Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692796;
	b=BuYcFM1MbVJt7WwADx9CICURsDdTr4o13vNiocrKV5sS1nbKXUf3ej2pZA/taKseTQty
	 iki/HdFAk03ntLoyJtNgXtlmI4NJoadpgBb94ENsmV3RXA7h9HuUfyRcIYp08HM2ouTQU
	 cqi57ek5e5yZq5ZsX6ljBunbpLZkpMUO41VXKjCBv1LKB0Wd6HRjZObBowR+4wao1b/KA
	 1Hbf0SpEGIMDB8YMWLiR2p++PXur0uNlbyFBEmaDHejWRliP+kNVJbuP35WUewUSOn2VS
	 /gJzyxfia0EgXJm6LfV6HqIuaW3ICI3qBTZZ57LWSdFxr48NrG8UZkyYi5UvhZsCX2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692796;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WoKfb/2yGGVSnXt6CYH/Pbj+IvavfA6u3d8Xn/n1Rd0=;
	b=tjAQMGfcBefiMhMMnOGbOvUzMzsxicgali9O91W1kerzI6kx1VIqurdZbyEuCh9Z6Qk1
	 /oXvpm+ZHMklm9pftZc2unliFvoJwSCPFeDiMJmbbUq4LWFifbgPCm+jdo+wBVBao/67x
	 CLUjM2Ag+lVSwEjNJf0Pr6jIYXMZzbX8J/r6mODzOsiasRmYF07VGQf7XjSVmDHgBR2ah
	 +pHBam7MSHZmkRQJ98AtQsauXbP1qXMFRh6+YVgiu/+BcQPUczjxzjQnB78AeDIKWub80
	 JmuJRT7K0+nTnl7W1A9aoN9Wyw4JGHVUViSxsWUVFE+AZXvKnwQQul594cEoW6B45jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGT0N5Ne;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD527606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGT0N5Ne
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544641F01829
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792692795;
	bh=WoKfb/2yGGVSnXt6CYH/Pbj+IvavfA6u3d8Xn/n1Rd0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HGT0N5NekN0KEUSsObqhZrI0IV6Jy0/nsLWp5XhIGufZMljEMcfM81bQMi+uQ9gwf
	 CrYb4CFqawsRdcoxpa3pfccQ2SVip8zroqYY0HM//eETThHjGtBSjB0V19vcWgfaLH
	 guThOcgte4ydi4eTG52G7kKUEtPHZh4RKQ00zlmsx+GZdpg7WTnRF9mlomNGZ/Sn7N
	 AgkyZk+A2UWvdexa8X7raknOxt2rd5Dfrj8Fqao+EKo3dvFO6ch+d+CzFKOtG9U3bs
	 v5hcBHRSG1hjA8IPySHccloEpBljpj/+Zm3Vl0pD+lMOvppU3lFDHJUGqugn4KY9ad
	 U8tueRB35WcvQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1688440e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzW5vw5Bzc5jXQ+vPYP60fy0Wfttc+2Pvp/mr9pIBhcbXIDEH7gKPEe+8TIlx57I3MGygmkoQi5uLuyOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgP5jSQMAG4sUQSX6ZpsAy0LQXrH09SzEfOIe3eQU3M9vioGb/
	wwDEAYDM9pMmPGhUEnGbtGB96/D+fVD0bmE67W4VtlOI0YNmkdgp8Ck6l/qvtx0qmDnKO4CHXDZ
	hGXvkHR+NoullbN9ag6GX2shrTOeyhcI=
X-Received: by 2002:a05:6512:238f:b0:5bc:b23c:f7dc with SMTP id
 2adb3069b0e04-5bfa1c6ad0fmr2527167e87.9.1792692793746; Thu, 22 Oct 2026
 11:13:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019145421.47181-1-leonard@lausen.nl> <20261019145421.47181-2-leonard@lausen.nl>
In-Reply-To: <20261019145421.47181-2-leonard@lausen.nl>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 20:10:52 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ihGqbpJQiic7DkPw19LG-XXL4BmDht-0Mdx8PFNMh+Kg@mail.gmail.com>
X-Gm-Features: AclHuK8OnYNaemA-MReRJfiarOYd7azLSGRGGQtr9eN1fRbWuuXKTTqItN58h4A
Message-ID: <CAJZ5v0ihGqbpJQiic7DkPw19LG-XXL4BmDht-0Mdx8PFNMh+Kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ACPICA: Initialize ParserState.AmlEnd in AcpiInstallMethod
To: Leonard Lausen <leonard@lausen.nl>
Cc: linux-acpi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, acpica-devel@lists.linux.dev, 
	Len Brown <lenb@kernel.org>, Armin Wolf <W_Armin@gmx.de>, Ivan Hu <ivan.hu@canonical.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 4:54=E2=80=AFPM Leonard Lausen <leonard@lausen.nl> =
wrote:
>
> From: Ivan Hu <ivan.hu@canonical.com>
>
> In AcpiInstallMethod(), the local ParserState is stack-allocated and
> only ParserState.Aml was initialized. Parser helpers called by this path
> read ParserState.AmlEnd for bounds checking: AcpiPsPeekOpcode() reads it
> before validating the first AML opcode, and AcpiPsGetNextPackageEnd()
> reads it indirectly via AcpiPsGetNextPackageLength(). The subsequent
> package-limit check also compares against ParserState.AmlEnd. Because
> AmlEnd was never set, these checks operated on an uninitialized value,
> which Coverity flagged as an uninitialized read (CID 1684785) and which
> could lead to incorrect parser bounds decisions.
>
> Coverity report:
>
> *** CID 1684785:         Memory - illegal accesses  (UNINIT)
> /src/acpica/source/components/namespace/nsxfname.c: 712             in Ac=
piInstallMethod()
>         ParserState.Aml +=3D AcpiPsGetOpcodeSize (Opcode);
> >>>     CID 1684785:         Memory - illegal accesses  (UNINIT)
> >>>     Using uninitialized value "ParserState.AmlEnd" when calling
>         "AcpiPsGetNextPackageEnd".
>         ParserState.PkgEnd =3D AcpiPsGetNextPackageEnd (&ParserState);
>
> Initialize ParserState.AmlEnd to the end of the table
> (Buffer + Table->Length) so the parser bounds checks operate on a valid
> limit.
>
> Link: https://github.com/open-acpica/acpica/commit/19429ef91ebfb2144c9180=
38dce13e297b4ef051
> Fixes: bdc357540129 ("ACPICA: add boundary checks in two places")
> Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
>  drivers/acpi/acpica/nsxfname.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/acpica/nsxfname.c b/drivers/acpi/acpica/nsxfnam=
e.c
> index b6534187cd43..fcd94947fedb 100644
> --- a/drivers/acpi/acpica/nsxfname.c
> +++ b/drivers/acpi/acpica/nsxfname.c
> @@ -503,6 +503,7 @@ acpi_status acpi_install_method(u8 *buffer)
>         /* First AML opcode in the table must be a control method */
>
>         parser_state.aml =3D buffer + sizeof(struct acpi_table_header);
> +       parser_state.aml_end =3D buffer + table->length;
>         opcode =3D acpi_ps_peek_opcode(&parser_state);
>         if (opcode !=3D AML_METHOD_OP) {
>                 return (AE_BAD_PARAMETER);
> --

Applied as 7.4-rc material, thanks!

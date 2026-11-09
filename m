Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794206595;
	b=dqGpj0MpdbtQv0xN4qKlbDQkZK9+Kn6Ly9zCbNVs0+Ktf/DVS3eeIrreMjZJNISFc33t
	 ik2rSip8uMMuyf3uKpyArPdDQmCLxawNfPxcpU79g8ilG80U66433BVoWrr9MEiwGaMYH
	 v7RSAgp87t0T/HVYWsbcWDprRrBkGiwnyQb3D3qCtALXasC6De0bIdNDx8r+vOB2N/ReE
	 ds08aCeHUuw0GWHt8WmVDeUndrnQE+WrVuSh79a+pwzlw1kro0uvBbRHLc5in03vVDRG+
	 3MX/h7q77Hd9ZHOOtMdufQu1SyqmVxANFC7MKLLEoudn4fR0pWRY2IRdaO1icBJuNYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tGiqJehz9vlDJjRqUxMtSemUKCzN8Z0XYb7DwbJHD5Y=;
	b=WTL+FkLbNx2xhqV7YONUDUiWKQSMXDuCESI33jI4Zcsne71TKLTWf2t74ctUfYCZMdEU
	 LDEggW1MMj8hZ1L48VcOTD/rsrN7ZPekWNGHMXRRafjLgXLNnxWeVaG+2PocaEGjNK1s8
	 PxPXsovEVawhjW5DYh5JPY1pXQkgygzgsGfi7qG7nYtz4yKts788c3B9Oy7usBkOUB0az
	 aRNofiexJmbIwsxjV7HNZUJqDCq18xr5kHAcjQ7Qm7bhhp6Y4ehyO6TjSRwGZk1jSh3ec
	 LmHzHSeSv4ygYQzFcyTFEQyMzmzd3qJz+KnhnMcU8UrQ7nnzuyxRg0tsE9jitfo6AHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vi4Fe1wL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBAF606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vi4Fe1wL
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91eb7d1478cso6271566d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794206594; cv=none;
        d=google.com; s=arc-20260327;
        b=XHqLcck0qWrHpaGavI6FaITeDvAKouDT4hlhtjOpjtqUaHPVzC+PB+eYW71mhlyZZ8
         dHVMRMU1lDLTCIOVY2bHZu8uXXA4jvXClCp5JgAKT3JkFkSPzPH6eyOAjHLwIZuMpjEk
         GcBtqw1yKVsFBOIaOOckjcsNysyBrBw8gshGMZSAegeVT514nUnG3jNW2h7bCLjwBGoP
         z+laS+HFu2UE2hdGSQNLc9ey6KUXUEhSkVcGUIyz6e/SzuigelfHcxsA/acAlVJvO6nK
         sOdIw47mxV+6xoqidcDomV6qfJpciE3al/ussYMIQI50nmZkJH8U1lClQbzcuPByP5vk
         gNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGiqJehz9vlDJjRqUxMtSemUKCzN8Z0XYb7DwbJHD5Y=;
        fh=rlyJ3mlEmyowlRSoFhSKE9lXWX/5Q8AK92NbDFsH/6M=;
        b=VMhUARPcO+qVABA/pZ8XvavzNBXi45CeiVG1AvEeU29gwuR8IRNsWGnn0ztYLWp0MS
         j2Gd3oc/O3Q3VUnuuaBEhGKm5gMSEIwZkH0T3li7iYV2YKSCFhfWu6MGYRGP8QLg6D/R
         EI1NgLl81HVT1Oje5zsJUicO1vhAdUIwnqgguHIUemlG+DxZgMdsdfi1sdLvS1YjHT5N
         4Bsz1fUu5YbGDANZ+iukL9ATMjNNEOfFXKehwgpeZGF5nyMMd/HZEEEtJdxlBjlHO2Id
         9WCtD8+t6i0u+sIlWltySim6XCYtIceSRnIqMW/Bx0scUn5IVRjkmDBcppYcspittfCb
         n1og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794206594; x=1794811394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGiqJehz9vlDJjRqUxMtSemUKCzN8Z0XYb7DwbJHD5Y=;
        b=vi4Fe1wLkstDU7Fx9icdebeqSJimeOKMFyLHwwHCqPaxFzkTulFJII/dBCyoR64nsZ
         8Bf2K60OOcJtd7ZB/9JVLlbHvyMPGse4j22JD6++wQYRtaAUaZTMLOuGV3LTDKZ/GuX3
         S1foJxRrgUEqJyurx0o2IKPkW74FB3QX24rsERMkqJPmb9ZtoMGbl3G/mvU4EysLs3wj
         vyQZwVkNViuakoXCwgOSPoDfNYfFIoT+vYWkpfJ8sBymWuR27p0S0xEZVR/MdI0E1HQk
         NyvPOS1otMiw14M2IgdxgOCJE7eDJ0bN5mubKfLi0GpMvRLFyDvghi6B/Smgh1n+c9Cc
         k+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794206594; x=1794811394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGiqJehz9vlDJjRqUxMtSemUKCzN8Z0XYb7DwbJHD5Y=;
        b=q0dyeJ57GXXyib+4vAeGLadq+ClI/WIv0LNxhGS+rpztla1m7JafXXJzaVQW24E6LK
         BiT/nH3oYOGwgSR0MJXAXHREDIDUgGusT0B9MWRdAw5RlzUP3FEWS/KebeEpTUuEcNNt
         xrM/pJHRqm3eby20Pl5x/Ae4m6kXqmJKXJVc8MUuhaOp8w/fb6obFDUBVEQwa3LEIXDA
         QC+uTMXs7GvYjTAcgmzApGHT0Cf9H9eG4CCfrlN1UC14hHC8BsFQw0DgLN2kISuTlGMp
         jVUMMNWo0KUDnETOZAKwAfXRETKY8soHMc6+YWx9t/hu4rxGiK6Fuhz9iHUrjmMo3/nw
         4pxg==
X-Forwarded-Encrypted: i=1; AL+hErHg//2XKjbxJFBV6pQMafO3qe5ZGecJmbwO2ra8/XdFrrEAKdkGdmxX3gCZICEb8F21tA1pAE1wtJnPaOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T1zQmrzzkxvdJmKfXtaVF6UpVqD20LhXx2hveYnQRRA/QRFoV
	mJB+DAxeDrp9/+mGZiqhmZp+Dke5qD2iXJLZxLF1p2sE5zLvSnasNu7cfkJQY7LCpqotdZb5BN1
	pUn46yuxRNmrGKKGOw8/fRfO0jXNmb2F+ctw/J5Q=
X-Gm-Gg: AYBFou1vlyP32PKx3ZcWWNoHrzqXthbPvUfDU+xXzbASXNtgn/cZpn0CFu1GFXJWiwn
	/DQcXk+xO1p38maIswdZ6DxckKp3qz16Bo9fpgvu+STrlvKbO1NzukLkVZiLXdCFGi+Pfs0J4+P
	bOwmx9rjKb0G+ucGR5RwIEqDtcwQ/YkGaMc5XsHRuoaybCXv6ScPrecboYWwkSdHCMjtgFxaq2L
	nbbQ++VXKZGWqCRFSAScfwMdvWwznW15xG5q1TjKxZU7QUMeZObXjKpWUeuHHPNeOAZeHNJCDPV
	ILwh4ltgJv0tFqfgCuspGPdHOYrLzR1FgPsLmaL/+P2puzssNvWKZY8onGnPDY6lpb8HPDcBw5J
	0btbuPLls//oeoo+zMpmuUSimjueK9MSRIhF8bPO3mn2YxUHfNXTzE+bHEg==
X-Received: by 2002:a05:6214:2489:b0:91c:78cd:3496 with SMTP id
 6a1803df08f44-91ed245a9b2mr50051466d6.30.1794206593593; Sun, 08 Nov 2026
 22:43:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002041220.133911-1-artem122novak@gmail.com>
In-Reply-To: <20261002041220.133911-1-artem122novak@gmail.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Mon, 9 Nov 2026 00:43:01 -0600
X-Gm-Features: AclHuK9v-5gRSO8OGt-F7FiRMlEeUolL0hWii1BHBqbgdOMwe1YNlabS8mDmnQM
Message-ID: <CAPufuhaE=pg9yzqZYaDcfkxooZeQPzSNsKQw-kX7PHN99yZyQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sh: add initial SH7305 CPU support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I wanted to follow up on this patch series,
as it's been a little over five weeks since the v2 submission.

I'm happy to revise and resubmit if necessary.

Thanks.

Best regards,
Artem

On Thu, Oct 1, 2026 at 10:12=E2=80=AFPM Artem Novak <artem122novak@gmail.co=
m> wrote:
>
> Add initial SuperH support for the Renesas SH7305 processor.
>
> The first patch fixes SH4 compiler flag fallback handling for toolchains
> which support SH4A targets but do not provide the plain -m4-nofpu
> option.
>
> The second patch adds the SH7305 CPU subtype, processor name and CPU
> probe.
>
> This is the first small architecture level part of ongoing SH7305
> enablement. Platform specific clock, interrupt controller, timer and
> board support are intentionally left for separate patches.
>
> The SH7305 support has been compile tested with GCC 14.3.0 targeting
> big endian SH4A.
>
> Changes in v2:
> - Use my full name, Artem Novak, for authorship and Signed-off-by.
> - No code changes.
>
> Artem Novak (2):
>   sh: guard SH4 no-FPU compiler fallback
>   sh: add SH7305 CPU subtype support
>
>  arch/sh/Kconfig                 | 9 +++++++++
>  arch/sh/Makefile                | 2 +-
>  arch/sh/include/asm/processor.h | 2 +-
>  arch/sh/kernel/cpu/proc.c       | 3 ++-
>  arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
>  5 files changed, 16 insertions(+), 3 deletions(-)
>
>
> base-commit: 551c722f40809618230001baccf219193e22fc5a
> --
> 2.55.0
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114312;
	b=wT8MfW3IQLwfHEUJzBZWt45YH4farKUmWc2VB2ffoC3KeL0O/+EoYt3p5YemS7Q81W2P
	 n9DLCSnUu3SBENKOCoC2CsFDuZnyp6bxgAu/hFsAHZSWuj672uB93QHTzdlcro1JC25vs
	 rhitGMNGXnpf9/MWs5c9vQx2qDT15A+se0BWKxW4HIIm73wv72loPrrb4ky+yjD0F5W8E
	 XulSjPcmZ2JKgj388Ongyrapr3McOWUNvmFjB3StRKmXgSCOpRMa6VM0tD7wI/Bj6z1Wd
	 4qDQh4n25raL0Tc6Q0gOLNFQjDqT2Ws+HMLkl3iMLogmf54BUDyyWsV7GC8lsHeIvWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114312;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5u9pOhE33kqguxgR494dsEWXe7ZtrDvrnpyBZ7YKUoI=;
	b=YsJkCq5Wh9PUg1ovm1uKkmaLyceOzuhyP2Dp14BQ/DqBuzPThzmDOrqv4wa4K9C6X3Lu
	 WtSVPCcw2/dQCwkdBBNAkmnmu37xtwdxis1X4cawu5ImTnMYY0R14PIvP5vOPCdv4lPi4
	 OE6j6RxWAjx2dYKArztECQyLpN/iNIQa8mP93FEQZBhjdCoMcxoL6zM34hagmCgGVHWpv
	 zLFYkzOp40ro0RG2mRUPwQzYRA5xxAaGLJfnZ+O4vsQkLuB8lsok4c9XvXw1uc0ds6r+z
	 lpCdWuxd7/6ucx5YWTxKLytZxzt6MlMWG+/m9P/je3NFRJnmda+/1B//k4MpApS4Lcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+Wt18xZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E5606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+Wt18xZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA44B1F008A1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114312;
	bh=5u9pOhE33kqguxgR494dsEWXe7ZtrDvrnpyBZ7YKUoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y+Wt18xZwAMR4MPJEMQS4hQ+QgZweEM/oV3En6fO3qgY0JPcsbL24afMJ/r6F1OHx
	 2AN7RPqztiLPGBpE//Udrp8UAM8xg98r0mtyWGC7xuAg5CGCMBseDMkB9MrMDN7dCi
	 3EcqEGb5eOM2LGPm+IHVpjNZTvznxaO85qiuxbOfTpdgPpwug79R4CMTTQrgyBq8vc
	 u/JrrgOw81F3aRvbnL2DuLo+h8ET4eswdAXkVd27wFStRvrqONmdeanRdZehOJcPdT
	 swPtjArdakQqxPTDLMV3cmACTKT4tHPNtiQ6ZjnNTSh+0s4WbKKZBLND5Bfvh4nOUo
	 UCWAVbQzebZ2A==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so173556a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE1Nzy/iNdhoNTSS1T2Vnt6wEaLBZJNi5M0qxlQJqFbJ/if0pLMqT5K051BdB81VJ5NUknvPssfu3K/RRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H6ek41iFGU8mZ5w6nFTRUCOkoSdOiFFnFqE4tMatk8ZsXBFwD
	FopaTP6cohAhWNfVWm5or0SZHyPU6DeBWallHsX4m9+ysknihhEjE5rtCqgotMkDQtK7DUj8fk/
	FQti2qp01nVN6CsoK81ByJRfyWCFVGYM=
X-Received: by 2002:a05:6402:4022:b0:6b4:16fb:b9bc with SMTP id
 4fb4d7f45d1cf-6b7224d5614mr349494a12.37.1794114310590; Sat, 07 Nov 2026
 21:05:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105125906.2284169-1-ruanjinjie@huawei.com>
In-Reply-To: <20261105125906.2284169-1-ruanjinjie@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 13:04:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5jtQZs+cZAUiLTRt955yYiOx33TwsgoNs9bPNCDikMgg@mail.gmail.com>
X-Gm-Features: AclHuK-D4QHwaK4gbmoN3WrbT8MH-F2XcRC6F-4Ti5FNOEguflRxA54anPRIFws
Message-ID: <CAAhV-H5jtQZs+cZAUiLTRt955yYiOx33TwsgoNs9bPNCDikMgg@mail.gmail.com>
Subject: Re: [PATCH v8] LoongArch: kexec_file: Fix elf_headers memory leak in
 retry loop
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel@xen0n.name, rppt@kernel.org, tangyouling@kylinos.cn, 
	baoquan.he@linux.dev, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Nov 5, 2026 at 8:59=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> A retry allocates new elf headers and overwrites image->elf_headers,
> leaking the previous buffer.
>
> Free it before assigning.
>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%=
40huawei.com
> Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v7 -> v8:
> - Split out from the patch set as Mike suggested.
> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjin=
jie@huawei.com/
> ---
>  arch/loongarch/kernel/machine_kexec_file.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> index 5412aa9f3568..0fe60907b97f 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -166,6 +166,10 @@ int load_other_segments(struct kimage *image,
>                         vfree(headers);
>                         goto out_err;
>                 }
> +
> +               if (unlikely(image->elf_headers))
> +                       vfree(image->elf_headers);
> +
>                 image->elf_headers =3D headers;
>                 image->elf_load_addr =3D kbuf.mem;
>                 image->elf_headers_sz =3D headers_sz;
> --
> 2.34.1
>

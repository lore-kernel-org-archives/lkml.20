Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891234;
	b=abQ18rnNmeEroNuNELKcWnGMA88f2bjeQA4TblR8kXbXJsYDsb0AxMwZvm+uzdq8H6ee
	 y1FB6KiHp3E5ApiRPuJeSxgGtrvThU+UzVWNsZMfioGAvvlWHJP29HGYRfl5EZFOXLwOV
	 /YPRnGL2d7EFOPMLax6+r14WdCGUQJ4JLxu/7DH0BGlCELgnjbB6g2izwkJeTLcRBuYtm
	 yNw4A5LgTPKu8SELvb/5PpBGfCuCIqZUX979KjVKzGAu6rGs31FsAu+F/fGdZqSE/m70a
	 WUUWlYytSkpte4ezmRfd/BbNPrjqA8r8QceMkhjTUxxE2oTZfNeYbbChe222gPkjyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891234;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6LZ+1+Vvz+jfm5vRHAeunaTxWBAAAXS8a4MaB1JvOmw=;
	b=w/w0qJg8Gs7JYDrR3OO+XkqNx+G55sY7iVX+AElkcAk0EsHye9ct8BPC8wSazfv/kagW
	 laWRsgrv08ExSkFQ2oZQ0ntJR+VwCItmRDME/2KHz4k6+RXYerrhqY0wDz0nPYGOwH6Hl
	 2MbAZJH3PcybgSQ/+R9mZFYkV1TXlEYU54cdihtNDlr9TXuMq10dh/GT/i3cGkvdLHPF7
	 fd2WSiR9QYa2r45uezsxf/YrcxfndSzsxELUWIMfc8kSWrluquW7vAayc+JYaqJzwqaz8
	 qXW+WfCPaD21ptJ/a9eBbMLM4PMSmB2qw4m0xhy3ixTWZht5NMfHIV5AzkSV96VnIcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GD5p0u6J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56420606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GD5p0u6J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B681F00A1B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891233;
	bh=6LZ+1+Vvz+jfm5vRHAeunaTxWBAAAXS8a4MaB1JvOmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GD5p0u6Jseapx+w+38qghF/bxRs/L8q4opQu6FB7+4aFCDyJUWDg/stoFH7v+Zuzh
	 FwX/xd9Lw4PkbjplDNow/MwokktVQMCMD4J7OuqP+19Ou83wnaXIzD+3zwVqQHm8mB
	 63w6mEKeV5f8UcMwHxMZSIbxSSqQp3GRKNlyhiSigCECj7HUQIvcmhxBbuQEKIFh5U
	 QiAgL3de6CPWo7S6R9IvfyPgAgfFkwFYvNkMScBM/furgvFJPBEXHkpDFL/rY0lVTX
	 +umoa5XA2vTXys+cOkMDbG1Kiyd2X4vVmhth7Z9PsUSQ53k/Qf1fsBNju40h7KgsT4
	 nFxkJpbwXVe8A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso196411a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzgU8WWGeUh06g9Om4C2ulrL2bLecm6KWjrogbpX3+biIgC+NiFYIoL98JWNiS24AnLwqziuLXx1i5CtLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lI6E+FqC1fX6v6dcOxSY6Uah8UEvPO0VQhUl5tD6JMsMy++22
	IdazvyNY2tbSu0HfNI3zpk7JJet5N179428KJwECdUvbtb8ge0wIpBwl2dVJvnDsWG2IpyQBMF9
	o0WMNHXSXdeUVNGMoRM1uShoUUsU3lNM=
X-Received: by 2002:a05:6402:27cb:b0:6b5:685a:aa29 with SMTP id
 4fb4d7f45d1cf-6b5685aabaemr3342720a12.30.1793891232594; Thu, 05 Nov 2026
 07:07:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029172956.20791-1-dongtai.guo@linux.dev> <20261029172956.20791-6-dongtai.guo@linux.dev>
 <aux9Hm0QFJLUDPWv@kernel.org>
In-Reply-To: <aux9Hm0QFJLUDPWv@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Nov 2026 23:07:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Dsnz03iXChzE6nYM2cs+D6fdDFiWrDxX5jM13kYL6HA@mail.gmail.com>
X-Gm-Features: AclHuK-7ZT562FqR8Q8-CsL50vorYou5ohB9VqtWfcaV8ssgwEH9NV-xDdP2-NM
Message-ID: <CAAhV-H7Dsnz03iXChzE6nYM2cs+D6fdDFiWrDxX5jM13kYL6HA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] LoongArch: Allow memblock arrays to resize
To: Mike Rapoport <rppt@kernel.org>
Cc: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ardb@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, 
	akpm@linux-foundation.org, baoquan.he@linux.dev, ruirui.yang@linux.dev, 
	guodongtai@kylinos.cn, kernel@xen0n.name, graf@amazon.com, 
	liukexin@kylinos.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mike,

On Thu, Nov 5, 2026 at 8:57=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Fri, Oct 30, 2026 at 02:29:52AM +0900, George Guo wrote:
> > From: George Guo <guodongtai@kylinos.cn>
> >
> > LoongArch never calls memblock_allow_resize(), so the reserved region
> > array cannot grow beyond INIT_MEMBLOCK_RESERVED_REGIONS entries
> > (INIT_MEMBLOCK_REGIONS + NR_CPUS).
>
> This might be something to fix independent of KHO.
>
> Huacai,
>
> What's the reason LoongArch never enables memblock resizing and why it
> defines INIT_MEMBLOCK_RESERVED_REGIONS to include NR_CPUS?
At first we didn't define INIT_MEMBLOCK_RESERVED_REGIONS, then we got
boot failures on a 128-cores machine, so define it, and the value is
similar to arm64.

The reason LoongArch never enables memblock resizing is because the mm
code is derived from MIPS, and MIPS never enables it.

Huacai

>
> --
> Sincerely yours,
> Mike.

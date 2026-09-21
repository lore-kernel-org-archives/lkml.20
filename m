Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769E50B406
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025716; cv=pass; b=HJRXyOec4VJibBVLI0b72EVdpOzG3Kn86FcO1k+2HFHkFA4/omjfbv3MqoMWvOyVj5D7nM5bQR5Fz2LAclFVn7q9EqIz2FwHWMorOI3QqGc57eO+KQwFOKtyV9eaIshaIQToORHrYr27gpvn4bhjtOTpvVRKiapxbZZYiBB05dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025716; c=relaxed/simple;
	bh=AV1BUzrX1AeKorD9vs62eiulrZw+UpP9wmqdbCMjK9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq4UBFNNWyx1UNruS04ZtzqIz9OcGL+QuoJevxBqnJsJUxM10ka69RRrI2MLLMEC11jp8lFRTqTwb6Pw/OWJBuXdt1CAD9iaFI+ZvdBAMJtOgCr0XQuDGidFa+d7lIqcHBYsytwHx7T3Ov+aHxttF3X0EMEPLrZhJ3lWDAuD7Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoHhbBKe; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoHhbBKe"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso3144053a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790025714; cv=none;
        d=google.com; s=arc-20260327;
        b=LUQaBfDgsQ71DXrqx1DIQ+nubXOVm0rZWinO2QMI+8F8YPVithE6PoZowJDDqzjy9H
         SlUIG0EKDV82zvePcoSAOpKYm08Mwbt3KuQ1Ujw1uZiHnls2Caolcf4PIXcSJ3Dzq1Id
         5WSffe/LzPYwSVZ1CPCJ8VGigGAWOGHKDRfAhKa78ETahT9DadHJEHwi2yjmuZOCz8DD
         mFXJEw63qeVB+0nHcPrjNgild6vCl4U5Gf3ixC7r+bcwyTn4cLFQzY+lQgkeAjtVzj7J
         vtBwH86OuhlrXbOLq+wedmfnrv0PYfMUVmS/Qi0XpJGZgD9om3HCAPNWatkvxoJbWIx8
         WGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHRHhDpk3/uEQmuDP9Wz5eIXg6/pMCpvv5Kn9toDyoM=;
        fh=/FQ6hn/SwSpzrPVpAZNeHo+/D+sr4bslg+M5+vQCwU0=;
        b=H8u87vDDSdjuL7+97FtFx/f57/HXc/J/GDiGpZzjs7Bfx1ndV+nVLdxUzV7mpO8Mpj
         BVkWf8Iu7uMfyajnYrLP/rQhlQ6zIFMvKzCUNW22xLF/fFSnWCIWBht6iTJb4gz/ND0p
         8ruv7q975Aph/ic1R38uv96Wa+g1E66sJk8PUW843a2lwiNrRl/2JPMYyMh6wdTh5hnr
         F8fK6CIlnc93kyfWeGZx6aQ2g1PtAJ2vyZaPCk8RDnqjHq/YPCRsb5Z+ptHKn+jYJg1Z
         pFIO+srJ29rizlmehpd1CG+cA6lkE55x9Un5nR8PFOkL8OXpYChx0/7lQCC8Nl9nmoqE
         Snng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790025714; x=1790630514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHRHhDpk3/uEQmuDP9Wz5eIXg6/pMCpvv5Kn9toDyoM=;
        b=VoHhbBKeiDgVzcSUupWiY9zPqG8cfEhNQYUY8Q+DORh1tXcGymJg7gSQA/7ZR/lwA+
         HB9AfAqCTjarGqI3h3UDH/tlOtK5BIwHJiLA3fBURTDwFxOKHu4+9v1PA4KqGSW1ggz9
         VIY+k91r/kNb9ThyrBIjTg9SkGiyEdb3uIlLBvZB6F6U8G70fOCcyVhYx7xRv40ObHsF
         Nke0v0ZZ6JdxWsj8oMIyfFfIjAF4J5QHF9oB10uGLCuGpbH2lPYHfLJvyfrvU+gQtSuN
         SHBEZXSeiLg1x5ibzJpuLfuMgr4YMG9VMoaLYDJECD2C7tvjYoWZWx/Fb67Tmf8n0D1g
         gcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025714; x=1790630514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHRHhDpk3/uEQmuDP9Wz5eIXg6/pMCpvv5Kn9toDyoM=;
        b=hfGt4tHBz//3wMlmXFFmD9eCm0O1IldpNm33ocqVM2i9lz1tMgb6vsOHEIWd43BWuv
         EL69NOubnw+VneUqU6KcgveKL6IeM8EEgudI1YmsveuYE6AVm1t93HgHL89i2yMN7rbc
         cyIzauv8NfApyO5ohfFMhF36v2v6onvoB7VW+nAWuUDemOod9a+oMAAgEZAnBbPDR6f1
         zq6m8Vx0D2EC+xNYJ4Iz21uTISVqPje4XlUPuoKb+SYywNmnnK006/GMMFmIyNiXV8NG
         +SM1IGqjOKjsYKoEBkRjfHtEHlkOJgi73ANduUjFE/tFyaUNQ0RPivd/ENuI71jSxkQW
         fu7g==
X-Forwarded-Encrypted: i=1; AKwUvBxOyd09ZQoHKEHabGKbBjOAHgeR5PESaWckGr0f7xqsgWVXqsTRYfZ+P2Jvlvp1FWvPZA9EULXLjKClAks=@vger.kernel.org
X-Gm-Message-State: AFuF++mDNSwL0KoPnaMdcx2Fp1H5QVGKTY0p0quSN0brO2sktYGAwXCt
	2IhbGoO0h4yEzJBFphIGohqNgwD6p3Dx+juwSgkSveljB+6LAk4mZjr+9Jh1bzvq5yRe+0rZT3s
	g52h0bCLVqu0dhZxRC9TgWHzrkdn8cM0=
X-Gm-Gg: AYBFou30HaZliYYQxvP98xazE1baI6mOIY+EmfquK9/DUQZFmPxG2md2Vju6INfVTHx
	2zrDQnQIAoHoZPkzJFMVJzdOABqIuaX9NLzB3zSB7p0LCANumfjzJTX+xFLE+jrPrUV8IJyfgS9
	LPYUzSKbxaUxYzHDaYnuu7PoK0av1RV8777Y0e58KaGV3hmVSToW87BEhMKdxoHsWyjaasJLmNF
	qguo5LAhxQip+xKF2SW857XKtLVSwQyjfTsVn5ybPmdX5cp+SZSDhxjXYqfEGbnLiYt3dOtwqet
	Y4mwokBlped74vb+siqIzN+nFj2IDvqsC8kDPajq1dML1MWgEgWATiHJGnOt/MGEhw6o108CaCv
	133bbBIYADzYg1/Ev0HZN3WVwleYEu5FKwRgHQnD0VSrjyuIBn3ER
X-Received: by 2002:a17:90a:d64f:b0:39e:4c80:44b9 with SMTP id
 98e67ed59e1d1-39e54dccbb8mr18606149a91.28.1790025713935; Mon, 21 Sep 2026
 14:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-libbpf-elf-entsize-fix-v1-1-cf181da33eab@gmail.com>
In-Reply-To: <20260916-libbpf-elf-entsize-fix-v1-1-cf181da33eab@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 21 Sep 2026 14:21:38 -0700
X-Gm-Features: AcwNN1XzwqtWdeJgbuV9zPdlVdvjEoesg8GnBTaO-nRymcMgrDnquh4ZrZ7CKM4
Message-ID: <CAEf4BzZyqEFtxhPUxmWyBO_gEW6UXY033VnHa2qk1dcfNZjjEw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Validate ELF symbol table entry size
To: Luis Vieira <luisflavieira@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:23=E2=80=AFPM Luis Vieira <luisflavieira@gmail.co=
m> wrote:
>
> elf_sym_iter_new() calculates the number of symbols by dividing the
> symbol table data size by sh_entsize. A malformed ELF file with a zero
> sh_entsize causes a division by zero.
>
> Reject symbol table sections with a zero entry size before calculating
> the number of symbols.
>
> Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
> ---
>  tools/lib/bpf/elf.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/lib/bpf/elf.c b/tools/lib/bpf/elf.c
> index fe136d025967..ba0b3df37a59 100644
> --- a/tools/lib/bpf/elf.c
> +++ b/tools/lib/bpf/elf.c
> @@ -118,6 +118,11 @@ static int elf_sym_iter_new(struct elf_sym_iter *ite=
r,
>         if (!gelf_getshdr(scn, &sh))
>                 return -EINVAL;
>
> +       if (!sh.sh_entsize) {
> +               pr_warn("elf: symbol table section has zero entry size in=
 '%s'\n", binary_path);
> +               return -EINVAL;
> +       }
> +

modified as follows and applied to bpf-next

-       if (!gelf_getshdr(scn, &sh))
+       if (!gelf_getshdr(scn, &sh) || !sh.sh_entsize)
                return -EINVAL;

-       if (!sh.sh_entsize) {
-               pr_warn("elf: symbol table section has zero entry size
in '%s'\n", binary_path);
-               return -EINVAL;
-       }
-

>         iter->strtabidx =3D sh.sh_link;
>         iter->syms =3D elf_getdata(scn, 0);
>         if (!iter->syms) {
>
> ---
> base-commit: 10c4f610b215bf961235141161992f010cf7e451
> change-id: 20260916-libbpf-elf-entsize-fix-a0f9440e79c7
>
> Best regards,
> --
> Luis Vieira <luisflavieira@gmail.com>
>

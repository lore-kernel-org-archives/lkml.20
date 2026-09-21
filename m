Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB773559C9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999297; cv=none; b=RoJNz5OAjq9YI3IkDP8Yh0HvWU4VvRAT8fs6dIIUFZg9asyNOWe+p6Gs6HZV8Aa4fejSPBbGB5D4zjgDXsICnkGNiGJi1iE8a4bQkS/8LWoMU/Px6iq4My2RlGNKf7VRlspfsCxd1tBLKBB76kk19xA+MsMB6A6N8XTWHdMR0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999297; c=relaxed/simple;
	bh=zjK7w028s9kx61oIShxj9dEr85uplqEikz0aDEv3VpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLGUopRR7lOJkpGF2hmNRN1LfkgA1kVoCTTopRmhcLaAM2QM8iUMoDIT5DvYy+GAV9x/CFzjuhIVr35ZKVsSWvltp3IcJgLZeaKHIAvT/25hSTrF9nRudFZ+4FZDklnHp8PQsaXVWSiaRFztPf0ze/Bh1MbOP6hUlcigEsbx0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YslA1cC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YslA1cC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5D11F00899
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999296;
	bh=LY4eeN3OcEEOQ7rAxJo5ki/y/HLeHt43P2YeklF9Wf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YslA1cC5C+UqL9Q0AsaeugmYanOgWhHTH0QQcRenQ0nCN5EY+IG81eDuBDmNyes9F
	 ug9V1MsmIyoIJZwPhRao4ot7VO+bKwaya1G80Y9kiJqsmLRTcjV+aqrgQXl4gRzKjE
	 xEytFd13okQmwS4LTrQah5XwU5kzSupeWbjWlw35QlhdpGmQ/QwWeQO2IWjr+8jYmB
	 MSWdcVfw5mTa/Gi9Aq9FDXnlMFv505mopJjJlbIN8wlWXYNVI4k6C/SOaW2HXNHtef
	 yEh+mA7/6DmBRyD0+GfavaxtX5s2+gEU6Kc0Uf/AkAx0xzPZwNUz4LdNwsELDYaVwn
	 7m3YjON540udA==
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564424e47so534097137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxcbzZ0nLLJ4FuTaSy/0hJBFe+Fg93M6pIIpIKG3vXfp+TEroKnzPOMqHURW+h5y5793Sg2a4eeC1QOv/w=@vger.kernel.org
X-Gm-Message-State: AFuF++kGp+jIl3IbzCXwALVMCq5PsHAMhK1pTASucnmjEldMTubMuyc8
	7aGiFCnCGoZhBh2EzLlE+he//6cStHrGQD9Dlt0eCsAhIf48iAx9KT3Gjvc+rSMmNSzWKH+dgAN
	t2KhoubeWxns/gib9+vSFhm5QFBxstSg=
X-Received: by 2002:a05:6102:5806:b0:7a1:f2b4:dae0 with SMTP id
 ada2fe7eead31-7a55c47c753mr3275027137.13.1789999295106; Mon, 21 Sep 2026
 07:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920091237.136637-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20260920091237.136637-1-heinrich.schuchardt@canonical.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:01:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H50dvw9CiJ1qjNhSddt1C_HzDyz=ADka0CSf=pPYBJjAA@mail.gmail.com>
X-Gm-Features: AcwNN1XkREvYOzDm2lS0mEbytM7gtJLMD6z9HsbMdtvu3BJBS93ACe4dZjSMtpM
Message-ID: <CAAhV-H50dvw9CiJ1qjNhSddt1C_HzDyz=ADka0CSf=pPYBJjAA@mail.gmail.com>
Subject: Re: [PATCH 1/1] loongarch: efi: Set NX compat flag in PE/COFF header
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sun, Sep 20, 2026 at 5:12=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The flag IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
> EFI binary does not rely on pages that are both executable and writable.
>
> As the Linux kernel neither has RWX sections nor needs RWX pages for
> relocation we should set the flag.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/loongarch/kernel/efi-header.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/efi-header.S b/arch/loongarch/kernel/e=
fi-header.S
> index 6df56241cb95a..c041dad5bbb6c 100644
> --- a/arch/loongarch/kernel/efi-header.S
> +++ b/arch/loongarch/kernel/efi-header.S
> @@ -51,7 +51,7 @@
>         .long   .Lefi_header_end - _head                /* SizeOfHeaders =
*/
>         .long   0                                       /* CheckSum */
>         .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
> -       .short  0                                       /* DllCharacteris=
tics */
> +       .short  IMAGE_DLLCHARACTERISTICS_NX_COMPAT      /* DllCharacteris=
tics */
>         .quad   0                                       /* SizeOfStackRes=
erve */
>         .quad   0                                       /* SizeOfStackCom=
mit */
>         .quad   0                                       /* SizeOfHeapRese=
rve */
> --
> 2.53.0
>

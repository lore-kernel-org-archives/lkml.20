Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436083FBEBB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294985; cv=pass; b=s6/PGZgCOBIodKSpBaYuTriDMBVnAfpxMVnKbE4+u9TBspsDJNznMu7fxrzf3cQhSU42aNcZP+jQsbccUYyyS3OXtwVXv2f+g85DqRCMOY4wRrnXnhNdyXAkkIpxeZuSpi1/n5SyS7rbrc6SmJm1bESy9rMCkxeAvpsdrcKPamw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294985; c=relaxed/simple;
	bh=vbRT6nGrsubTAfIz8i+mXocImBW/c25hWjByl3J0uow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWCfaGmM+lfTv31e+nRNzH6ityEJJGkXw1eG6w+BYoBHgR381RUVGr0nx70DbmvkGruv1gV5R+67id3gyIuP2dY2tOReRFuGd0vRp6ia9RhNvJnRTsfhKV9BZXnMQXGmnqHeSQwjA6qthL3nEYte07Um+6woZi6MDyLeRI5txxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWgLPtGB; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWgLPtGB"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab3d3c5761so7049317b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791294983; cv=none;
        d=google.com; s=arc-20260327;
        b=B4vPETK1wAFpYjBvVT9XsjCLnY/K7wBvv51HbNO3Rl+JnX7lB2NQa1YUsro5wUpGZW
         T6aGndjQAvi6ySpU4HN6rm+jZc3NprJvjRalcutM0lsZWwhirubCuRG3sxENdNnvECMn
         71J92qXftFMpRv+XnR2hfKW7ihUppoMc5TcFLyLC8cUSgcqlmJddwK3Ajh4pdpYGanCw
         tVqegv5kArPFK7hL86pbgXb0ZLeONeLiaQdOvK+VKCC7HL+XEVBlciNr1h9NwDcepZJ1
         P9mo4dCUn0RUjDq0PrqpywfozH+08mCiHZqVHwB5GrOdcj93Eezi5EHsx/YXerPXAB9u
         l3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ydu+elXchGUSJ74vhM8S5kQyLVRWEBSg2Ux9RtIawfA=;
        fh=zPeDJCj19P0o+Ls8LJiYSi7ckIZBB+O8k5LB5BKDViA=;
        b=ltZv4drWTLERjj3uNlmTb2GLYt2K4P3S2nHk44aXkujbqZGfYPOSnwCmebHPrrH2NM
         pDfDpAa7hR4tY2uoeJJtkozD0t9YUCmgUuZXOSaZiIu5vZ30L2oQNhcOOhhYxR4wtqFR
         IziWNqg23mkqmrq/P4Q21Hgua//byWConL6+x/NE9XKlAEIBIncy+EsHpxLR/vNhpQXl
         hOf8L6BqlU8IpuGVeyqg3H1BwnaIN/1sHzErAcyKV+Q+OP5pMEOuXyFq58q/m5Ste8Sj
         TjhozLsYCWYiKb4EyRpHaFuyjpYm4igI6nYQJy9WPoLNBqe1Sz7lhzWjYMdvbXlu+8h6
         rTUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791294983; x=1791899783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ydu+elXchGUSJ74vhM8S5kQyLVRWEBSg2Ux9RtIawfA=;
        b=cWgLPtGBzwiMGY7rSfq1+75nRh7jC1WaWBuDb3BmTWJ7TOy4fooiVn/lUKmS/jjYwk
         6xu7C98s1Hj5wx1BLMMcFdyyj24nFSfrg2FO/A6X8jHJYE9jjryIUalWec9aLjx1TtLa
         BINRcixxzps2M5S82NcOnt1xrfHunRXh+VmOBaK0VcUGWFDT5T17Mu7V0CN2R/C4hHyF
         l/s9Vi86QZewK2K/NunDGkCv9h4J9N8wXV6u7JaqgT6Ay6qoLMlm2/ul14D/y3Qr67Qm
         tDHcdgJGHTxpyrNa1OtWu6HkPd9a8+2hVWRrO+Uv9wbrXQpZ48rXQjL4Sb+CmeXINIFT
         EKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294983; x=1791899783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydu+elXchGUSJ74vhM8S5kQyLVRWEBSg2Ux9RtIawfA=;
        b=ArYqPbD2Xn09plNhRXN6jBjpl2UEuDIVyl8XDpxPhqFRcg5PJJu8/7Si7XcdWm6fcD
         kYxxENm04Sco+6kPWX8ym9TI4Gz1B8Y/Lgact00xSGL9LytQJSImNg+EdyLI+DxVmIlu
         25YbiHdYUL3zeE3ghLIkQ/nN+wtK8vVTK98c9MMs+0Fcc5onNnL0G1JReIvqQHR4A96R
         wybdMdHd60tAXr9Anebg0c0UtOsR4GaNWcfen6ciW7o6XLTg8TUTKHz26icEEu62gWh2
         s4+YbEhKzH86FoAS1V9y5ezS1egPv/CBEO7TzkG/UyylW0CRVJitKddVd+uh/QUYBJIM
         iVqg==
X-Forwarded-Encrypted: i=1; AKwUvBzoLBBV7eBRXO47WtEZxyVypHfp5MoqbGVGeGsRyt0ysN04rG5JMBBXBFXAwk1jWHqBpBXPPf5oniWy7+8=@vger.kernel.org
X-Gm-Message-State: AFuF++kHFaA/K9KpSgrkXjShYvnOo4RiJNUMBS8usVWtIuwIPMgHGsg1
	5TYe8tkVcsMfJ5e5a5UO6B5KjzihDZlcMvJIx+IFJUgIMZK8GC/tq4lXvn97qkaUQdSPM1dio3K
	4GwKBr7CfkLzjGpydw1SuxvmT81r6X4w=
X-Gm-Gg: AYBFou04XULz/v+X7wNAm0gEH7LoYBSvtEZb/hS704vlSKBYDOwt632STh8w/j3a0jB
	YfJWqTYhWz0bT6SkPeCg+e2sEHVhSTbGRXpR5Yjj7whZVzxI9mf6sQG/C90BMMyGo7L0lZMVTB3
	hpa+PNOa8t1W+L1xLcPt1Lb8fC1dMqESJKWueYd3JCjPV68ESNWf/SPlLYd+Un5KL7E7R6hBVUT
	ViWqo/aQlrEnRhd1S9+CVZep+Pj58yKZNxT4AWxnxecVnMOPXVbzxiyE3bs+BpEdS5pE8QarR0c
	bW+grHFQx+jh7sjgK9L9ucT8Hl7aakRU0gD+VZw+yN2GFx7PWVsVX+GzOW5WYIaLijO7juLehum
	1YtMIOw/tvdk7mDuXh/DMxcZ79GxdlaFtvVsnK24=
X-Received: by 2002:a05:690c:c50f:b0:8ae:7fb9:8cc4 with SMTP id
 00721157ae682-8b04f4d8cefmr7480477b3.33.1791294982904; Tue, 06 Oct 2026
 06:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005041457.3021139-1-ravindra@intel.com> <20261006095628.384343-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20261006095628.384343-1-runyu.xiao@seu.edu.cn>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 6 Oct 2026 09:56:10 -0400
X-Gm-Features: AclHuK-jEawYK6Z4T-kBMGawZzjTV2I3SyCTjKA6Wuad8-SZxYRE9_EtvKz7ESg
Message-ID: <CABBYNZJsiNbgRsknuxYHJG-bX3s5mim6tiP-29LdzuaO_PS=CQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: btintel_pcie: use managed IRQ teardown
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Tedd Ho-Jeong An <tedd.an@intel.com>, Kiran K <kiran.k@intel.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ravindra <ravindra@intel.com>, 
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Runyu,

On Tue, Oct 6, 2026 at 5:56=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> w=
rote:
>
> The PCIe driver registers its MSI-X handlers with
> devm_request_threaded_irq(), but remove() uses free_irq() directly. The
> devres actions then retain registrations and attempt to release them agai=
n
> during device cleanup.
>
> Use devm_free_irq() for the remove path and for already registered vector=
s
> when a later setup request fails. This removes the managed resource at th=
e
> same time as the IRQ is released and keeps MSI-X vector teardown ordered
> after IRQ ownership is gone.
>
> Fixes: c2b636b3f788 ("Bluetooth: btintel_pcie: Add support for PCIe trans=
port")
> Cc: stable@vger.kernel.org
> Tested-by: Ravindra <ravindra@intel.com>
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> Changes in v2:
> - Add Ravindra's Tested-by tag.

v1 has already been applied.

>
>  drivers/bluetooth/btintel_pcie.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel=
_pcie.c
> index 005c77a4f..f8901df7c 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -1750,7 +1750,7 @@ static irqreturn_t btintel_pcie_irq_msix_handler(in=
t irq, void *dev_id)
>  static int btintel_pcie_setup_irq(struct btintel_pcie_data *data)
>  {
>         int err;
> -       int num_irqs, i;
> +       int num_irqs, i, j;
>
>         for (i =3D 0; i < BTINTEL_PCIE_MSIX_VEC_MAX; i++)
>                 data->msix_entries[i].entry =3D i;
> @@ -1779,6 +1779,10 @@ static int btintel_pcie_setup_irq(struct btintel_p=
cie_data *data)
>                                                 KBUILD_MODNAME,
>                                                 msix_entry);
>                 if (err) {
> +                       for (j =3D 0; j < i; j++)
> +                               devm_free_irq(&data->pdev->dev,
> +                                             data->msix_entries[j].vecto=
r,
> +                                             &data->msix_entries[j]);
>                         pci_free_irq_vectors(data->pdev);
>                         data->alloc_vecs =3D 0;
>                         return err;
> @@ -3101,7 +3105,7 @@ static void btintel_pcie_remove(struct pci_dev *pde=
v)
>                 struct msix_entry *msix_entry;
>
>                 msix_entry =3D &data->msix_entries[i];
> -               free_irq(msix_entry->vector, msix_entry);
> +               devm_free_irq(&pdev->dev, msix_entry->vector, msix_entry)=
;
>         }
>
>         pci_free_irq_vectors(pdev);
> --
> 2.34.1



--=20
Luiz Augusto von Dentz

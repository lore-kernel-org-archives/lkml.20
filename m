Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E383EC830
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816022; cv=pass; b=laBYV6tXOjt+Ht1AomOXeirapzkXrLtnjeer+dfh7e+NCpYFZCAIdQKrWCXlzl5wfbWliiFr1O7lGUpKBM9mGzuITYuYeOK8g2DqvVC4rNBwBb6ASmRQqs2WfnLWRdMCMA9MCraYXR/aqXQ+ScqNkwgSp/flgX5iVXMNuybrX9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816022; c=relaxed/simple;
	bh=vyjFk+OVzX73rkv+Vf4KwdMVbobAdz3wh39L0hTuAmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fxz38oyg58vaoI8ph80gORzeTUvsZMgIAF0bNaPBSc5A7+JdflfnsWHZP6izSRa1siclxbBj1a82jlBc69nQtiscAE1NX5r0940+QPSsmkkx0zrSssA0C9sw0qy2pETrjB8GjZh73e10sml52PqOF+UniPm5HJKoxoD68zIKI4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYWzYxqI; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYWzYxqI"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8aea7b7ca0cso11555517b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816021; cv=none;
        d=google.com; s=arc-20260327;
        b=C8S9VOs/F5i/MpD4QrEzWX07kqDvn7vuJtb2Ql4EjqErRVQgLafdbLwUjgVYsQvijd
         IAPhtqJ97+zbljggPjywYA/USEgpwr3/3XCpObUyWpjnrf5pQF7P7yzeJnkJJo7zKmLS
         sz52XK7yBVT3MMR4H31VnQvrd96uJY54kQJJJCMBjHKrsWA/UEeayE8eDytvyZGwuj+e
         SRchfM8eH2FhQxitr68GUt60gdv3J3T4Yw3p6nTmOUSyq9QX/Wju+ANtD51fTKltiSS7
         h1d/6I5gts9MqHx7JCllvIxRoDV5wIOquo4WHvmYcfgF8Ioe6xnb/e41POCBnSKTXQBS
         9Kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCv8gBANZutmGTGlF/Uql5wg79snoB/nJkY2lKkKjE0=;
        fh=tie0dzY/heHl6VORorMP0pwRuDCC8j9TBsm267PLnDE=;
        b=QJVMCUOVFvPkydIot75GtRuGEiRWyvv8uMzfLOTy9NK/kBjGtFyB6zuwec95+4Hszn
         S4/HLLnHTbINlZxnb760dJz3+2Dem+WpZldwuznylj1rL/H6FdOz60fHAnn0MloEaDA9
         phn1TUfxKLcywVm5u1DqOm+I7Notx/r/mnc9POIsMFrzZ5lfcf9dgE2fdLr070ZPzuS1
         I6jWMx32Z1dfI9ZWaS+O/ANlbYuUXYUp9UJaRrhTDxOLVfY4CDtfJZB9u4miIXPO9B6C
         o0xDSAFPoNiBli7VZisiBWhTrep4wL1vLRBnX//lqMkTj6MqHfPjjCuOuW8bYol2IDNC
         5uGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791816021; x=1792420821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCv8gBANZutmGTGlF/Uql5wg79snoB/nJkY2lKkKjE0=;
        b=qYWzYxqIFGs3ZcdrTMmsoWwJ7uja2OrKnsz9Hwne++42sA9Kkc3LTKJb26bHqSrzRf
         526eQ7aRiBtH0yqR8VoaaOsoVX602ReVnQVj15aOH7L7XzGo5Yu6Z8gclMxgn399S+0R
         vqJnKYI+L5S7ihpEDfDYum+ttp5dmKeGJLlabUjSnjI0AP1dLpNO3EbZ3NPXkwNLooSW
         yIzzPDbqDT9NCwww1bmsGLcoGXLMA91Bjk0AHkT7Wop7998l00FF/DYTjFROx1BYaKsy
         gYftlevQY36i54UMOZQhMyzTuSLgG6pyjQDrAst7L8IQK2H65u02XArTiig8DHZeb3pA
         AEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816021; x=1792420821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCv8gBANZutmGTGlF/Uql5wg79snoB/nJkY2lKkKjE0=;
        b=mM7yMHqFu0X0Tdw/5fHu3cB6luzta4oZ/wK/G18Bh2AsXWhgbFQkXLAe7zA9JTbkuT
         DU44fS+vFyghK6ccJxsohWZ/ERstDv8QurIT50Se/5VjD0eI7REgK9i5DN5rveX2fWML
         mu4iXpaofswa7IpVuj+1YzeR26szYGyPPwJj5PXYcV1kVXnMhPwsYX84FIA/NCplie4Q
         wSvrkBu5khtVB2fTdWnQzySDuIHrNd9qY9RaMHh0H66WeOvxe6Le/946RBWfaeF01xOk
         a75sn+KKsG0P8MibNjB1c+NdQWxM2e02SvxvcFtj9wG5+In0PwW/IwIx1xo+bPzMaZKn
         XA9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxni2YdhORJtUpdg9Gi79QfZkGU4d705454yQnndLzeUSEO3DH1V9bLlOEoDOCAGjOD70/NURKE0BCEstg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkLju5CeM0Ekvf/sb69NlL+Nhd5CVm7kreXQK+T1vvPbt1iGfD
	itdtdELj5F4Mlqli5yvnzkN0VaaVQAsYUz+dIjjMYfkNVwYrGzwQFLiqze//CaiItSbKR7JuR2I
	DLqFDgZlothMPss3MBHDG/IwAYS9HNzU=
X-Gm-Gg: AYBFou39uUntPpkFZyFnwTmerKfpEPgBgVs0WLBAzsk06NsLky9bf1eOPDCDv3J6jln
	mWnuwr50wMquhed89mM6+3CPHV/431OyoZajO/BLdtKU0JzFYzT3P5ME6Si+qSi9hodlorBl+Yf
	8sS5nlamaheSrq57LQVjEBBEwtf43efpPRz291BiRRZ+b3gYMHLmeR8KPcacgV8spjbh7E9hU23
	tY+1zjfL1uQ8+tQB6Fwn3U4uhefdMOoa6aDTZsZy3sq7NaYlbji6hXrKtF5IxAgEgjENoLGt/dH
	1qWKZNmpx8sZCTUNK9doqPLIc2A09i5kS7n69WkQ5IA421x4kaKzfUoGvg5eg2Y1t9CtwcUGk5J
	UztIr/ZubqKRGBPvquuY6ehwcIxRW3WC3sbBFA5UELQ==
X-Received: by 2002:a05:690c:ec5:b0:8b0:a5d3:7198 with SMTP id
 00721157ae682-8b0a5d37935mr8627877b3.47.1791816020580; Mon, 12 Oct 2026
 07:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012092017.3275428-1-ravindra@intel.com>
In-Reply-To: <20261012092017.3275428-1-ravindra@intel.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 12 Oct 2026 10:40:09 -0400
X-Gm-Features: AclHuK_W5r3-kSFq8ZOrp8v14qXeljv26kcEUvDpgPt4bofmiSEXo2HZBIzWGUA
Message-ID: <CABBYNZKHL4t+jfuLJ=6N4xge-XNYnqrsdJtjMRDo2fcubbuLJA@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btintel_pcie: Retry FLR on device lock contention
To: Ravindra <ravindra@intel.com>
Cc: linux-bluetooth@vger.kernel.org, kiran.k@intel.com, 
	linux-kernel@vger.kernel.org, marcel@holtmann.org, stable@vger.kernel.org, 
	chethan.tumkur.narayan@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ravindra,

On Mon, Oct 12, 2026 at 5:17=E2=80=AFAM Ravindra <ravindra@intel.com> wrote=
:
>
> Several paths request an FLR asynchronously, including S3/S4 resume,
> resume recovery, HCI reset, and hardware-error recovery. When a request
> comes from a PM callback, reset work may run before the PM core releases
> the PCI device lock. pci_try_reset_function() then returns -EAGAIN
> without attempting the FLR. Other FLR requests can encounter the same
> error if another operation holds the device lock.
>
> Retry the FLR on -EAGAIN. If all attempts fail, clear the recovery
> in-progress flag so a later reset request can try again.
>
> Fixes: 9c36951474d8 ("Bluetooth: btintel_pcie: Refactor FLR to use device=
_reprobe()")
> Signed-off-by: Ravindra <ravindra@intel.com>
> ---
>  drivers/bluetooth/btintel_pcie.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel=
_pcie.c
> index 3a555aa50c87..251dd4e2ceb4 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -3743,7 +3743,7 @@ static void btintel_pcie_perform_pldr(struct btinte=
l_pcie_data *data)
>  static int btintel_pcie_perform_flr(struct btintel_pcie_data *data)
>  {
>         struct pci_dev *pdev =3D data->pdev;
> -       int err;
> +       int err, retry;
>
>         /* pci_try_reset_function() avoids the device_lock ABBA against
>          * btintel_pcie_remove(): .remove() runs with device_lock held an=
d
> @@ -3751,7 +3751,16 @@ static int btintel_pcie_perform_flr(struct btintel=
_pcie_data *data)
>          * pci_reset_function() would deadlock by trying to re-acquire
>          * device_lock here.
>          */
> -       err =3D pci_try_reset_function(pdev);
> +       /* PM callbacks hold the device lock, so the queued resume reset =
may
> +        * run before the callback releases it. Retry after that lock is =
dropped.
> +        */
> +       for (retry =3D 0; retry < 3; retry++) {
> +               err =3D pci_try_reset_function(pdev);
> +               if (err !=3D -EAGAIN)
> +                       break;
> +
> +               usleep_range(1000, 2000);
> +       }

We have to make our mind here, either we use pci_try_reset_function
and gracefully handle -EAGAIN, or we don't then we must use
pci_reset_function which awaits for the lock, retying a couple of
times with sleep won't solve for it for good since we don't know how
long it will take for pci_dev_trylock to be available.

>         if (err) {
>                 BT_ERR("Failed resetting the pcie device (%d)", err);
>                 return err;
> @@ -3817,6 +3826,7 @@ static void btintel_pcie_reset_work(struct work_str=
uct *wk)
>                 enable_work(&data->hwexp_work);
>                 enable_work(&data->fwtrigger_work);
>                 enable_work(&data->mbox_work);
> +               clear_bit(BTINTEL_PCIE_RECOVERY_IN_PROGRESS, &data->flags=
);
>         }
>
>  out:
> @@ -3841,10 +3851,9 @@ static void btintel_pcie_reset_work(struct work_st=
ruct *wk)
>   *     in-flight one (whose recovery will reinitialize the device
>   *     regardless of the dropped trigger's variant).
>   *
> - * The bit is cleared only by .remove() / re-probe via fresh devm
> - * allocation, which is the intended one-shot semantics: a reset
> - * tears down and re-probes 'data', so there is no "in-flight"
> - * reset to follow up after device_reprobe() succeeds.
> + * A successful reset clears the bit through .remove() / re-probe via
> + * fresh devm allocation. A failed FLR clears it in reset_work so a
> + * later request can retry; there is no in-flight reset after failure.
>   */
>  static void btintel_pcie_request_reset(struct btintel_pcie_data *data,
>                                        enum btintel_pcie_reset_type type)
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz

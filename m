Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A1346E5D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321234; cv=pass; b=GbGU+ZWOMrpNAnT4SbOz6e83PpMw7QlJEsV12M9KATD2psad2km9gi1wub5z0Q4KeeqzPqayVwCoD1q9m9J2M/WyX561skJBlumuD7NWlCYiTRgsqp6lONnHu9ClBmbX3oaVEur5Fp+v8/1cGn8vHj7DexLfbhps6fU+VKPBO6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321234; c=relaxed/simple;
	bh=qIlt2ykkkdLl+dmoEHTQ6tI7nBNgRtj5wAg78i1d958=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPmzpqaR3vrj4SqyslMou9hOtzyPk7/W2l7XDFqNkeoNBU/yqrVNXq5a0hEwyyOn+TAZx307oR25wFaxPcn1Pi8Y7V1iWvFgA42Ohl6SCM8Td7s5TvB6UNroa94+pxe75LBPrQqdOO40TapZhsQpnTkSMcp6z5KTj1zFifmHwjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8vmoPlH; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8vmoPlH"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67990a45e02so1024934d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792321232; cv=none;
        d=google.com; s=arc-20260327;
        b=pYyVszXbNUvL1zS6Y0/IERW5j37EQ96XYVTOVP2xYYncP9xSCx8mhWFp/WVyM2t7mw
         CmvOQ57s4C4KMlwsO1sNJDNyPls3f7lM59vx6wzSjapVb2O2djfduK1XgAdt4t004Rwc
         br2BWYa9XwWB9/LDjUGN8k/2hGmkhlvoAG2PdQsYbcZU+J99eOnRgoB2/6mmk+jTuiyk
         zEGgDG5JCtWcXAES7woVCOjTWzlbcGmSjuyBRm/IcwFtFhB+Vdzvw/yBYJQvzjFN/eYe
         w6uEoh+8by8PgQjhQRDw99DlofuwPSD42H64MGV7oCoesvfq2qO11nlT/Jpb6+soY912
         Q4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KXioS6FbEBQDu7wrrnD4IMizIwgIPHAZuwC+6H4Y3ow=;
        fh=9YN2ccGdtg1OA33jaucM4zsHQ1n4GVEoIKMEVcMaVEM=;
        b=Bk0MxoPFjtYedlyyczHc2s1/WW2BnHZEM+1M4PMhAakWr09UpWe4tmAlAKZvIsajsU
         Li5kgXRq8uTxEdd2DixwwKHDu8Dn6tsk75gs6YPBEhPWzVP6g7dh09VpT4FbOGHcJI6y
         Q0+VjD0qdbeq+/3AjKvusrsET7W7sQsceTQGJ5VtShJ0/b3iO3BykDTnTAH02rYJVMQ9
         7qEvRIPi1r9G8grgfaNviHaWuTpezq9EJpMbq4nQMpdNlH72GH5KemgZQ+Qi7Y12X1zx
         vK4irab4qNNATPYUiJml+d+A0kzCg36YA7r002q/3sI2BTXaDkXQj0pLz+bc5IWHIlnC
         8eCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321232; x=1792926032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KXioS6FbEBQDu7wrrnD4IMizIwgIPHAZuwC+6H4Y3ow=;
        b=J8vmoPlHFCB+EuljSL6ZmhVQNeG7AXutWQF2exhgtbyA7FX5DMHIwvvOp0aFO8gGtL
         48JnOarC1kFwAQXuhWy4tFM3en46lEuV+e6Fw7dXesSkaXZQL0JdnaIZRsRB2D/hsPGn
         +Vvo6zAwbn0pynP7p5qXwZ+Bw/llcPOuhVD1M2EScjKjPpf5aV2pJgVCBv+Lx9jdu5AC
         UdbRqMbXCDpUTWao/vuo+IpQNW1DkYIwAt8y49tkwHoPtUvNPp0WyABZAisnxoQ3wXfy
         L80lJDuVLyNB50rDQTq+d/B5k7d5J3Oir7faXVmnSrvdI8KAsG3GjDsu3pxfNnYyjgib
         bmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321232; x=1792926032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXioS6FbEBQDu7wrrnD4IMizIwgIPHAZuwC+6H4Y3ow=;
        b=J4WAVn+ARF/3te+/JxTLx4pJYv+F00nQlzd0o8FYpnZw0nVSXh/zvrFSgm/QlFN6tC
         9d7GxqKEWCfNM8LQA/Q/8c20aipBg63T4bu7YxCq6/Njzxoqjwk+zXOo5Gdhz6MRDTxn
         /PYgW8E6oc/Jpjn6ElgQTY87pTxQeoKj626xvKMnlpdqwQac2nxCbAodRvKhHVhDdsxT
         c/8rPpVnoVMH+7qPsrbnAf3FF+Z92B56Odz4eSif7U2nklHhydgsnMBG0Gx7WeWO92Hs
         7W5ZCWkrCIobkTAHbSiKSwXNLiRLPMZHDEFTmbVJChmlAgIX0t9IkFX+mHOhR581SiLv
         Aclw==
X-Forwarded-Encrypted: i=1; AKwUvBxgh+2iyQPZIUKDZ+U/7kErZADuy98TxKJm0upSjmx1D/Xxz6676U/tVsdaTgCVFFOFgVtwU4ynWGyUmck=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAS6YYutLpOmGVScyVoz48w+aVBPdwdopbb66BG4EsAxLb8VQB
	5xUWNQPT39WnazTYkyPQXRepQp5ajYI0N2Ge/6vHoMJvFsPp19lUJdNNUkk1MOWog8/lFNvbYNa
	BTk9hKp5dXCPY0qt7kP0/SRDP47As4AU=
X-Gm-Gg: AYBFou1yymAGnNWhUWEzN+eBxERsVwcooJ1ZQJf+Od0Nkf4YjBePgD/WYKcY1QMI502
	RPW42DQ17lMgaAJB7tE5tx1osnk0GH0LSXQ1v7BcLkzkbO4Vg+uCR3lGFnTO7lPklLETCUBQnQq
	Jt5ggqWBSjIKkukNyJixmVckV1OpxPLa7NRKAQuts0QouYH9qomqKL698YSbWlQkziyyCXECAR6
	d49gYmLruQOP0al8TEQg7YGV2cv8XVELVZ9Son5Rt44+COJyuKA9tHbVmLzR2eE5CZPkhomrRDD
	EAwjseQyCQQRJMz5bYguwFTekB77aSyCnfJZFxIW8kM9HCLQ/jmKD1IQjUQzCCdv36TUig+efwX
	0a6FMIOTJncQIeXueGK+BMKN/mYkcBDSq9n3MirUxu3ZR/g==
X-Received: by 2002:a05:690e:e0f:b0:675:3dfb:4181 with SMTP id
 956f58d0204a3-679ca90956emr1197419d50.100.1792321231207; Sun, 18 Oct 2026
 04:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928123036.7902-1-kartikey406@gmail.com>
In-Reply-To: <20260928123036.7902-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:30:19 +0530
X-Gm-Features: AclHuK_KJR9M7A-a_H10VdZL31wdvN93Y54A56zC-z-g3fLOpMAC4sdIJ8zslV4
Message-ID: <CADhLXY6Pb9Y5f9r12RZA1bbjBS_ctXAkXHPwY8qWwn_1WOJAsA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: sysfs: Reject unaligned resource I/O port accesses
To: bhelgaas@google.com, david.laight.linux@gmail.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+7134530b25073b4ef373@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:00=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> pci_resource_io() validates that the requested port lies within the
> BAR but never checks that it is aligned to the access size. A
> pwrite64()/pread64() on a resourceN file with an odd offset and
> count=3D2 or count=3D4 reaches outw()/outl() with a misaligned address.
> On arm64 this becomes a store/load to a Device-memory mapping
> (PCI_IOBASE + port), which architecturally requires natural
> alignment, causing an alignment fault and kernel oops.
>
> Reject misaligned 2- and 4-byte accesses before they reach the
> low-level accessor. With natural alignment enforced, an access that
> starts inside the BAR cannot extend past its end, so drop the
> port + count - 1 range check.
>
> Reported-by: syzbot+7134530b25073b4ef373@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D7134530b25073b4ef373
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2: Check alignment per access size in the case 2/case 4 branches
>     instead of using IS_ALIGNED() with a user-controlled count, and
>     drop the now-redundant port + count - 1 range check.
>     (Bjorn, David, sashiko)
> ---
>  drivers/pci/pci-sysfs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 1f21856aac8a..8118cc6b3a61 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1209,9 +1209,6 @@ static ssize_t pci_resource_io(struct file *filp, s=
truct kobject *kobj,
>         if (port > pci_resource_end(pdev, bar))
>                 return 0;
>
> -       if (port + count - 1 > pci_resource_end(pdev, bar))
> -               return -EINVAL;
> -
>         switch (count) {
>         case 1:
>                 if (write)
> @@ -1220,12 +1217,16 @@ static ssize_t pci_resource_io(struct file *filp,=
 struct kobject *kobj,
>                         *(u8 *)buf =3D inb(port);
>                 return 1;
>         case 2:
> +               if (port & 1)
> +                       return -EINVAL;
>                 if (write)
>                         outw(*(u16 *)buf, port);
>                 else
>                         *(u16 *)buf =3D inw(port);
>                 return 2;
>         case 4:
> +               if (port & 3)
> +                       return -EINVAL;
>                 if (write)
>                         outl(*(u32 *)buf, port);
>                 else
> --
> 2.43.0
>

Hi David,

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu

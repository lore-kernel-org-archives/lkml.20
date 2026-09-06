Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB8271A94
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788707581; cv=pass; b=MaJk26lq/GXmJ1Wr1IfXMpXu8oLMfLQ1zjlTNqoS32AfAHcROXUfqBYZxy5U8YNkpOL95PxAZLS44ldCWxXH4IJnx0mUMuAYpWICZfDv5XvwB3xVgsZ7W2RiXN8usFp5gEWAIyq6mN1I9cFDdzBSjw7/5me9YtZzXFSYg+f2M/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788707581; c=relaxed/simple;
	bh=TsB6cDxdhS/vOua4uuGbd3ckAxlmfBPv0l4rlgTBeK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5LJWNCHUPzChWNRbYRiYXJsJdxyoj6Y8tiShjMWRxCvBbGB2n4wGbev28asoApvB4cr7SNytcmh1nlr2a84Y/0Wh1LWrPA82Al2qBTeTGj3AZS9ojmXAbr+yyCiDUwwOWxjbtS9jaiaJkXvMcruipHxaKSS+bFvL9aHHJK4nnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=XwxkOkIU; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="XwxkOkIU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1843822f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788707578; cv=none;
        d=google.com; s=arc-20260327;
        b=XN5jCsq6KK+iD3+rLc1szCLhr4+RY3w6FCKDAmYWKirF/Uha1bl4J60jmwFhZK/xWh
         CAI/wUZkFNCOBsynqAETc8yBweQU4BtCteux3hHRV8w3eA26aUYAWg2RI+Gp9NNqJCcw
         /YsaDQFrF/By6mw/yuF4GsSsJNmdwQuswzcEWx1Gtcf4b7dWxjK7PG8DRIg8/oagfgtm
         VVUKYXRpvgqE4BZO+0IL+FA5ya+MmOL8kzMvwmjBCP3azqubpJRTKe1UzBGtpduBMGsZ
         2eyiuFZyrMRZf+KhxniBS81duSay20v8LMG6Vlxg4tyd7wiKieAWile93AGQAq0R4wtR
         cmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/YAMMBN+At2K64uihmZTPRoHPZbkV/JDp6orkKdZVQ=;
        fh=IQT+AXJpQ8B59Pyyveb5ME1810O4/6lDmqmZ6V868h8=;
        b=OK+eCnLxchji7FVpjZApGk4yq4Cs0KR0euidXFwxkuEG/j24kOLoJbu+sBw0lnUuM9
         nLLs+s9mI3O5nvOlNJBoym+v1kvIi2HkEmQnkW7INGqHyIb/DwUHSTtRc2Hriernh1uN
         U84CvmM4kqAEa4sYgYvHpYIi+67ldQ6DQPtVPXIbfWgFR4l99v5KDWNbRXk4JE8f8LPe
         OSHbg+ArV4anLa+vint1j6Bvcq8OwL6khbHQvU+06YuIYo2KstY3CHLsd6PT6YyoDRH8
         0bvs4LkQhiSleW+KHVE2GJPTde7vj27GIYgBsB9Upaip+Lmo4NVR19epGi+9xpB3lMar
         S6wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788707578; x=1789312378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/YAMMBN+At2K64uihmZTPRoHPZbkV/JDp6orkKdZVQ=;
        b=XwxkOkIUTid60HpiyOteEKcB/31hj0ZDuQihCWvmZBeRh3Dm1qhriS/+/rhjNoH8ir
         T0nQPG7BRR5lvV0U5hq/tw30iNV6qB2HMWiVRHcLR5l2L7vfSYHNp+Oq9+oK93ycOcNh
         GcSWev2j6Qc19qQ4n7Lw6moErvSd0j4bVPuolpBvmg/yLUeY36nTbOwRrEDMAfOzxW0D
         QWb+YLocmJ3r4YGvansva0IBQh27tN0CL5O7DXvO8zW/9Han7zztYnrH3orHKidz7x51
         lbRpKK22/Wv8eDPi+49/ZUSFS0EokY0viGbGeQwSXb74ecF4yDAjxa1UZZqMJjuueyBe
         IbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788707578; x=1789312378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/YAMMBN+At2K64uihmZTPRoHPZbkV/JDp6orkKdZVQ=;
        b=Q99kgZeaGSbGf56xmcVUA5IUdG9W7jd3F56WErmdo0VxYUCCGO4RgqXsF/oxe5X5CN
         1X1W25QUEF/ARhbRS8RHJAF8ka3roMOAzDb1dwIvA06M0Oo6CdI7jHfZnZRJenbt8rIZ
         xorakIK2cQFKABRi3OF2ZHkuflN92NrEaPBemQBf2uCCr0NtLgAhhUTLpaDIveSuNNzh
         6K5tBvhU7anmCtOLYP7osbn7qLyV1CMYznxtNq8IVGCBv/i12txvitFu+3C0Ajft/ghL
         cWwnYU8DAYKWlPyYOtFEixcMUzcr8MIKCYBdXWPcTpXqRMlsCEReQBP5xG2LgOf5oRsO
         t6lQ==
X-Forwarded-Encrypted: i=1; AKwUvByasNL1XCvr0blVps2Lar6+PXb7ia+gt0putHCdzhfH3DYGvKW5fZi/MT6JxzZeWaczRBThfAzatY4BwUU=@vger.kernel.org
X-Gm-Message-State: AFuF++mAdjuoNuWoszK/lLHXUaFitgOEsKdK74nbiF9HMI0i1HD/caYr
	4euR/UhG7aOGADQO2vAJzXcLDi2WLdaN9SXEsa5F2CCKq6jQlz0Vyhm/gb3eTB1Cbce+KFtaAKS
	w8b0yzZy297gllEz8YCGZvOranTntHVPiAtc9Nbpx5w==
X-Gm-Gg: AYBFou2selmrs6mSDC8lvDyT/Onr25yhdaiaH8ETA1DdfGInOIsNGlhrgjf446EyMeg
	95Suzdnbbr3c2lYXZLU4OjzfCge041+NSRYbSysBqOHoLiBc8B5k/cMFDBBATYIuHrrwxz6mnF1
	kRj6X872faxNYtRcceuMb0YNsSQxaHKvwXmqx0jIMl/4QdisIqWDNAk6eVmyJ53+dybAunTxLkR
	yztoffnvvg7Td1DlhH7URKd5d2db+9hCMo3SAKOgSxO+40ObHLRnb10dQSAwmc4fYdEBayJEAJm
	RLemhh/jQzCdQWoz43+YrLA0V57HKMZqb/dz7qPo673av4UJHoFnfpodb24gQJAYktDBeOPPsIZ
	N9iFJLdYaTCk5o7WmT51WAJ0s6BsLU7XWNEBCsdwed4sqHx23ztMjTj/19LvYvaA=
X-Received: by 2002:a05:6000:2508:b0:485:8e8b:7bf4 with SMTP id
 ffacd0b85a97d-4858e8b7c78mr14147410f8f.33.1788707577698; Sun, 06 Sep 2026
 08:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
 <caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com>
In-Reply-To: <caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 6 Sep 2026 20:42:45 +0530
X-Gm-Features: AcwNN1X9oTn0svXCCN4OeBCKJLZeONyVHPKvQXZJrhy7-m9QRuibPvMEQrtTQVA
Message-ID: <CAAhSdy05y0Er=4xNDU166TA6E268ObPLghktNOsSfNvv_aupYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] irqchip/riscv-imsic: Reject overlapping group index fields
To: Pengpeng Hou <hppiscas@163.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Bjorn Topel <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:39=E2=80=AFPM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> The IMSIC parser validates index widths but does not check that a
> nonzero group field starts above the page, guest and hart fields.
> A malformed layout can therefore assign one address bit to two fields.
>
> Require the group shift to be at least the end of the lower fields.
> Check the upper bound using subtraction after validating the shift, so
> the bound check cannot wrap when processing a firmware-supplied value.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early d=
river")
> Assisted-by: GPT-5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index 44b9c34c..c6eb16ae 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -742,8 +742,16 @@ static int __init imsic_parse_fwnode(struct fwnode_h=
andle *fwnode,
>
>         /* Sanity check group index shift */
>         if (global->group_index_bits) {
> -               i =3D global->group_index_bits + global->group_index_shif=
t - 1;
> -               if (i >=3D BITS_PER_LONG) {
> +               i =3D IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
> +                   global->hart_index_bits;
> +               if (global->group_index_shift < i) {
> +                       pr_err("%pfwP: group index shift too small\n", fw=
node);
> +                       return -EINVAL;
> +               }
> +
> +               if (global->group_index_shift >=3D BITS_PER_LONG ||
> +                   global->group_index_bits >
> +                   BITS_PER_LONG - global->group_index_shift) {

The above check for "too small group index shift" is fine but why
is the existing check for "too big group index shift" not sufficient.

>                         pr_err("%pfwP: group index shift too big\n", fwno=
de);
>                         return -EINVAL;
>                 }
>
> base-commit: 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515
>

Regards,
Anup

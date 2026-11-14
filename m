Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794680542;
	b=po0XZb7sFvxS3YpjCSM0Ixec5Q0Cf2/Fv8gtyJMUzAtu5odvPraDKfalSShXVUqytvqX
	 dAksPgYXjgU9I5BYjiKv3w4PWPDkVo4/YbwGF0/YdTRumCQ6F2PCzk6Gbb8pCc6Bwk3aQ
	 QKQPjdAhHHKebqSzmuB5oIWL1Vb3OBlb6/L1/awWp7OMYAZXdTkAqaJZy4WDfMCW7OoFq
	 HvtNwqRUKAHsYZ9AqPdKgSJ28DSrIpdTjfOJp48YItZ+AOnjsYpxUzOCUIDyAw07xogvF
	 nMPy1Q0kgN3uo41w/L96ingXL1hntzfqh5kftg1a7wM5Oat82u4/wbMT7A+VcjpfwJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brX2hSaZg8oetdJBa0p7mNVdZYGvvoMmLGZG2mMzrMk=;
	b=efQNsxFBF1oH8DhFNXlMQMVjcq7R6xuwOKT7GiU19k0joxMYcKLeQNTJIiaEf9kyG0ja
	 qndYYbOL22f09iSDwZSe3VYXvWgXAfJGAsY1n02jCBQ0FWGC4S8xyGPYj37i4nDm6lNkk
	 rjGvrFw0viY82hWAS95gt1QlyuWWh3mPL6ss4cKwzsLAepCQpuppx2aCh0hInN8jy/+cP
	 ekWDcVYiuZWkUU1/ZJPzmlZf/NpduEXQPk3VYc/DPYvFXSOKLVV0JX/fnKtY+rs4DoLlr
	 rCKrTxl+e7VYb32CiywLgiOnAWMqO4AIx9bhZxof/PLIjpfCAIoglp2PzO4GyrHV06w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Bo17DvOi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03C606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D03C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Bo17DvOi
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ddea4b8ec9so126356eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794680540; cv=none;
        d=google.com; s=arc-20260327;
        b=MP0N+naOK8QvYvxREY7mL30I2phWLVAKugnnMj7raQskTO3bLWYXZxCRKdtSfnsPkX
         v1wxFtqGHgL4mDqk7mowxAIHVpFTDcTDvBcslazSl0KxvB/hYjBYI6kp23OwDxFTLdlK
         uFpxTZcorB93Tlhp0e+3ShbyK8/risurClBujs1Gg2bmWc3nAOaaVpI0c+W5LC/xACCa
         Tw7RvAN0svVYzvDUs/sbXW5ZX/tY9Tpgv16x3xBHoW9V0+pdlDiTK6roc1amzL3xz5EU
         5tgRjSvmU2IniKZipBlL5Zuru/9qNlcmhE1f8oYkRLqmktXIhEjl15R1UcuqpOC6BRsF
         UjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brX2hSaZg8oetdJBa0p7mNVdZYGvvoMmLGZG2mMzrMk=;
        fh=qgKGaIeZ3kQTjXMcez0pfnWvU/cWl70DM3Mj7q1/87E=;
        b=srTOxQsfiaYpOh3vxA3KJ5Lqzh4EFqB6Z47cUwPKRcQkV30ejoa9S0/7MHRBtps25O
         mcg46txzh26ID8LE3NKww/l1Sy2godaFOzffo+I66FmM9zHwiQoXZJb5dgi3yt4U+upK
         h5Zs2cOFVoFrA1oImduoZFi9VRYqsRHSYZXlPilg7b0FefnNDlWDGyal4d07uydN3mYE
         FYzRxogaUQhbOp8CeOAE8huVdYYwfCjv/thlT1lDZNzJeYJKZuutjGmpkcy5nyq/dPJl
         WzhoNUANkvuW6W5vEcXeGzWnflHVFEPfqN60LZZMfRFQBRG6ufUU2v6AyVKB75Nxdji+
         zO2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794680540; x=1795285340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brX2hSaZg8oetdJBa0p7mNVdZYGvvoMmLGZG2mMzrMk=;
        b=Bo17DvOi/V2m/1HvqEYFEbTUW4n/JVe0y92pSh4UDML9GHTbXNYgA78LRjlBB2DF44
         o+4f0prkf8bVU5iwzQsNQDcZn+H2nXqRhUcXvuBKxnX0/+tJ735hBWkNJ67nSowbgipP
         iWAe3YWrb3JsytM5yCG4y+D3gVQERxG31rNMnCaBjrYg6QGzPDmXQfj8FHLlk+e9UJrn
         p9d5VtrqpWnGD0V6pwwa1uCQDbPGE4IZ6yvRCnUHxtBIkle2wyzlvM1fwVpH1+YwC1Bi
         voRDN8S1xzrQugdPqN07A05FKSqkoZh9FZUqbg3JzrlOp0Zf3HRzRk5vL2Wd41iCvkyt
         rysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680540; x=1795285340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brX2hSaZg8oetdJBa0p7mNVdZYGvvoMmLGZG2mMzrMk=;
        b=2FRFZQgS8Mt1Ef04O2/s/7DGgBSPJTPTtEqfZ2QoNjIdgKfvM6+WzW2OHmAYxBPSpU
         w4a5A3yLgkESqh7kN50YqASZaCWF2J0RwTRfVf2o+/MbTcRHTckSeW5/0jxLA/XVPuaJ
         RlYuqJJqss/OSnc3kGqPZB+U1iEKkt96DY1G/TpHm3S+0yZ6dM9XNMlH0+WZBxGKoCE5
         spL1WDSQa/oheuNHjjO2IdeLZ1RKQpiHXlVpi3hVOq5oCrsjTj9gO4nPPZulYR3DhJ8H
         0h2/XG2OowIWx3AnLilQA36N3Px5AQtYJPedf7g8B0CM3u/VpuiIgUVJ/WTChbbYNFQL
         JSnA==
X-Forwarded-Encrypted: i=1; AL+hErFUG30O6WiuAmVVhjPGKw+OiticafjVA83reON07T44Hl3zpIB8h7Wvpbik0D0p36KMYfOflmeEvq4k55A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SeydxzvClO2p7/kwfST/luDhxHFWVTMYs3UQANxBN/ztroaev
	xhsfGgpk/CeYvq+mZezGakkY+V3qnqag+UnJBwMwg4oCLS3bu7zzDaeJJA3T7mKVzqx4znLe46U
	YbhnY1to9UV65m/I8YlHH2pYx/44/TSztaml6nd5LlQ==
X-Gm-Gg: AYBFou1iZpKGZHmLO8FkDd21sccINQi4EREJ9IXihosuHcEwqQrPrVtwjSxUJuBB9HI
	7PDjOBj+dPotwXqkxuxK9ET2Ehcg2L4y2WdsGTYySGayI0lZcnQnJ/sRHHz4rVGdmplec04yj9u
	d3SpD4Xoe9eLuIy6zGvW4OfQhJEjUy7XhbP8AjwJv0r3JcimrIL9RjOYgRX3K977+Jy0UcUkEUS
	K1U1UVOHp0ME2amoEN77l8VfaUJad9rCB21SMn4e0pVGypYnJp8Hu0T+7NSIwjEoUIxTzm7GlQL
	L1ftvaOuhsEW8phnrpwGZTLYOgB906y2jZeCT1f7nZKwxiyywU+OVJJIvSHU/kROdXKg3x/Da2L
	zBH2uCRB+ImJKmq3FLzG5/48pcktPLAL1XpkJtg==
X-Received: by 2002:a05:6820:83d2:20b0:70d:73e2:ff02 with SMTP id
 006d021491bc7-71ab4e4dd2emr5063724eaf.1.1794680540339; Sat, 14 Nov 2026
 10:22:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115003349683IFDCSTYhPzQtBozUiO8qN@zte.com.cn>
In-Reply-To: <20261115003349683IFDCSTYhPzQtBozUiO8qN@zte.com.cn>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Sat, 14 Nov 2026 10:22:09 -0800
X-Gm-Features: AclHuK90wndOV_f8yTMnaBoSKhlzLI2bHor72m5VaolatsM0n3yOElUuHNmhBmU
Message-ID: <CADUfDZqE4tXoVvFwmh_J1XfM8+fzRn9w4n2=QPwbicJrcKSOgw@mail.gmail.com>
Subject: Re: [PATCH] ublk: validate all parameters for zoned devices
To: shao.mingyin@zte.com.cn
Cc: tom.leiming@gmail.com, linux-block@vger.kernel.org, axboe@kernel.dk, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:35=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> ublk_validate_params() returns as soon as zoned parameters are valid,
> skipping the subsequent DMA alignment, segment and integrity checks.
> SET_PARAMS therefore accepts combinations that it rejects for a
> non-zoned device, including integrity parameters without UBLK_F_INTEGRITY=
.
> Invalid parameters may reach disk creation or advertise an integrity
> format that the server cannot access.
>
> Continue checking the remaining parameter types after successful zoned
> validation. Preserve the zoned validator's errors and the requirement
> for zoned devices to supply zoned parameters.
>
> Fixes: e84025d2a9cb ("ublk: add DMA alignment limit")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Perhaps worth noting in the commit message that this only affects
CONFIG_BLK_DEV_ZONED=3Dy, since ublk_dev_param_zoned_validate() is
defined to always return an error when CONFIG_BLK_DEV_ZONED=3Dn.

Other than that,
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

> ---
> Tested on next-20261105 in an x86_64 QEMU/KVM guest (4 vCPUs, 4 GiB,
> 4 KiB pages), with CONFIG_BLK_DEV_UBLK, CONFIG_BLK_DEV_ZONED and
> CONFIG_BLK_DEV_INTEGRITY enabled. The same userspace program submits
> ADD_DEV, SET_PARAMS and DEL_DEV through io_uring to both kernels.
>
> Independently invalid DMA alignment, segment boundary and integrity
> parameters without UBLK_F_INTEGRITY are accepted by the original kernel
> and rejected with -EINVAL by the fix. The integrity test uses valid DMA
> and segment parameters; enabling UBLK_F_INTEGRITY makes the same paramete=
rs
> valid on both kernels. Valid optional parameters are also accepted by
> both. All five checks pass on three independent boots per kernel.
>
> Separate userspace function tests cover 4 KiB and 64 KiB page-size
> boundaries. The QEMU tests exercise SET_PARAMS only, without START_DEV
> or block I/O.
>
>  drivers/block/ublk_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 3d322fa1bc83160f51fbd97fb89b17ee94bc1213..ce1c192e3590cb8ddfeb49562=
9540a653658513a 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -1011,10 +1011,14 @@ static int ublk_validate_params(const struct ublk=
_device *ub)
>         if (ub->params.types & UBLK_PARAM_TYPE_DEVT)
>                 return -EINVAL;
>
> -       if (ub->params.types & UBLK_PARAM_TYPE_ZONED)
> -               return ublk_dev_param_zoned_validate(ub);
> -       else if (ublk_dev_is_zoned(ub))
> +       if (ub->params.types & UBLK_PARAM_TYPE_ZONED) {
> +               int ret =3D ublk_dev_param_zoned_validate(ub);
> +
> +               if (ret)
> +                       return ret;
> +       } else if (ublk_dev_is_zoned(ub)) {
>                 return -EINVAL;
> +       }
>
>         if (ub->params.types & UBLK_PARAM_TYPE_DMA_ALIGN) {
>                 const struct ublk_param_dma_align *p =3D &ub->params.dma;
> --
> 2.43.0
>

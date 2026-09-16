Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8F364934
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543090; cv=pass; b=tdsL+WqSjt9gs7oyKvaP0xAK/hu87wZyZnqpQdvDNnLNFSrw2vh3HRNR6SvNye6eljRLD7SSUElxEhgAxYjnZb+RAAourn2bJZb2tGw9LD7q0+NEKQkmvS2qpTsXHPP8zEzf+vckxNZSFHjzWv5vbOGqUpJnEyCjWnchBfB8uHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543090; c=relaxed/simple;
	bh=NZR9oJcFKVLcrgem1bgASUkURlhSqxs9JZAAiNdx57Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZjqdr+6cO1UW8F/OTdhEQCS2W7F1rUWnqmRt5seOTvCYwX8QeLfUlJWbRp/aLkwVyw8eCklIm+xO3mgI2OCILpKlnvLNNI6MQU59EWX3OMvoeexuMbmtaYCtWUqHnhjrU3ytBQuZWemDJUz3AJqN/34+C6/Ak1OCP0W+R5etQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJ1ENgN4; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJ1ENgN4"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadeb0so48012885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789543079; cv=none;
        d=google.com; s=arc-20260327;
        b=N6k/SACw/VUqB6mILzQCMcESfJQ7IKjGCN/wXbQTJ7AX/thyhHVCiNDqUNJ28xzn4C
         As84YieJw3XQ6OvXva6kWu1Xcma76c5guzBCuSdFnk0WQLJaZNLxD131dKf1lQODqC/L
         7tEjEoQd1sPTo+tsTVaukJLi+gqeLo/hcQgN6M6gd0y0RKyQaPrS7T5iZWkweF2UUCgr
         jfYRmbegH+X3YX0gWNCbTxQj1aoKxWg19e3hz2aiAYMV8HxMUU6hL31XkKYvmXp5CEsV
         ORnqRtJA8tHgrqXs/nRquRpihWwMH6Cy6ysbgn09uSy7C6ireQehhp8CTRMfNf748o65
         QsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=;
        fh=XF8mTLozIv8AMScrSpboUi0zWfWi3Djch8F7l2dIc24=;
        b=qyLWMiIVyBqpno6Q313kDVhhPJKN6eAs4aIyU8K6ys3rEpMEcUaWNzAOi7xbc+ickh
         K2RAylXz3MqTysIJXm2UC6liRVezn2ZIMyk5wcZQbAuWu3ZlwcsxcBkxY1pnJ/7utj+K
         eJN1WzX65zmDw4Tr4eAY7cV0V3fQR7zpTQyR2SmtQ6Axlc9gDjnGa/6ulazkcNLhxffp
         4RwwekNF0zHWj+zbpNNmPtlMTdMlkdiXYbvxquawAN8xkyR0L4sXupgB728lRlAImdsg
         alSEoZbm4dgX+H1wMSqwhRl4rm2UvjiHa34wJGQP85stzeCxBN3cHM2+hPex6ZQ+7DFM
         soVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789543079; x=1790147879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=;
        b=pJ1ENgN4u5fI4oIyvdZIi/FUm9YUsmRo5XHoLZQdvFmP8eXh96bKKvMIYiodimWiqJ
         PstVXZqGfiCkx4PXPFqVwf9FlO5vWSYCSgtmhVw2SIdIazaHzZDKqWLZp1Q8m9v3u+uK
         s/bldKH4KY8nrslJTmMXbhFd/P8Vg6j4H9WQT1fi0oBD+IG8jpwc24ihHXlH1MRlrU5o
         uWj42z3jmCUyJFfaJbG7dq/DVxwYTKFOpwi8BOrwYGQ9Wbd7pXFNTXx0HYoCVH03GQ6s
         o6LVRp4o4diTX5bB7/2TfPUwKtzPd4JZsPP/ymZlULZS9Nbc4+BXLns7D+W23MSb1QUp
         gouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543079; x=1790147879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HePzGTrSXdk0LNKW30I8iTNCaViy2K7dGjEo2OIzHmY=;
        b=cY9z64ql+roneGJ6Ihx6k7TaZZy0x6SsvuOPe70xGDueHOc21UA+MsIDOONEmbQGdF
         JbceqAX2QfFGUyTJoLh6r50BfmXhhS2RfVD4JeyHvuq9iG6xPao3P9AvpIuVKvkL4ko8
         1+lfrfVjoTkn+Jpa//inuyqR1CwPrlt+/9pTGtwnobVg0AqhkY7D9Ub4l1f2wF7vz6yN
         wB3xonYTI9kWTlI9U+Gthmlvsayr5KAckIlylGxd2kvgrYYCZhNvimaqSyt2RLWnMZMS
         BA63P7tKXizGOm2/rTiGRTXS6pMeDaZlx4a1fgXzefAC9mFi+qgVJzLXZNYmVfGXMXw9
         ctow==
X-Forwarded-Encrypted: i=1; AKwUvBwzUejxpMaXtufeH2hchCFqM9OofUF6qiI8vkCi5R+aCJBSl2i5fqz7Y6mDCWNTjHXRKodEebQIMJFjHWM=@vger.kernel.org
X-Gm-Message-State: AFuF++lB78IPe9BkWlAyBtxILG/pLOBZapvYIsWExkpX+7l2oS0lji9U
	8ah+P0uL1abvRGe0vh8D/pHtf8gsx50MJ4HSchZ+b93fe+2v0M1axfpxBOqIc0gtJbUGumIiej+
	hAw49N+B7YiHAAdVmDl3/3a0yslXtbhQ=
X-Gm-Gg: AYBFou2RBhEPAGw+NQhYpXxU5WQdGBgpIHDdFFpeDBw41QM0AxYooux3L+baF0Ag06O
	B6zTFyculLuM3QkIm2wq4a/mm/BrJsKytrwKjQz82pYIZXO2zh3llqR+vAFt/2XounPaHC4986Y
	g74waH9GLjB9Jxyhx9DfsW5CO+Z8Z3nw/KkuhLDGFz43/yWGa8dYhzFw3C2DwR2TIYhfjs8R3RH
	JOhnWxtFP9kgJeabbPnOwsRwMxLR/FyishZlfjTZbCp2vTNan3LAL9unmdmghYkP0ktU4+wQcwR
	1P9PPTMkaof5/GBbUokTDAIFLyQEbWksFcTCT6TQqvPBUr45WjnU+Cfl
X-Received: by 2002:a05:620a:4008:b0:93a:7bc2:d75f with SMTP id
 af79cd13be357-93bb790da17mr204175585a.36.1789543078899; Wed, 16 Sep 2026
 00:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916070631.1965713-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916070631.1965713-1-vulab@iscas.ac.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Sep 2026 11:17:49 +0400
X-Gm-Features: AcwNN1VnmMXQfeYvkGasjznx5Qwpu_KfApsjjbpvaD5udE_w8aTgwLskI1UsZGY
Message-ID: <CABjd4YzNzZ0nnO4Xgw1JsRHhj9Crc6diX1uJnWHpHvd6BcPk2g@mail.gmail.com>
Subject: Re: [PATCH 04/20] i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andi.shyti@kernel.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@prisktech.co.nz, wsa@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:07=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> In wmt_i2c_probe(), i2c->clk is acquired using of_clk_get(). If any
> subsequent operation fails or when the module is unloaded, the clock
> reference count is never decremented via clk_put(), leading to a
> resource leak.
>
> Switch to devm_clk_get() so that the clock is automatically managed
> and released.
>
> Fixes: 560746eb79d3 ("i2c: vt8500: Add support for I2C bus on Wondermedia=
 SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-viai2c-wmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c=
-viai2c-wmt.c
> index 2cf3cc0165fb..74ca93b44347 100644
> --- a/drivers/i2c/busses/i2c-viai2c-wmt.c
> +++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
> @@ -117,7 +117,7 @@ static int wmt_i2c_probe(struct platform_device *pdev=
)
>                 return dev_err_probe(&pdev->dev, err,
>                                 "failed to request irq %i\n", i2c->irq);
>
> -       i2c->clk =3D of_clk_get(np, 0);
> +       i2c->clk =3D devm_clk_get(&pdev->dev, NULL);

Maybe we could go for devm_clk_get_enabled and drop some more
boilerplate which follows in wmt_i2c_reset_hardware, while at it?

Backporting this to stable seems like a stretch to me, though (it's
quite old code, so there would be quite a lot of backporting for a
rarely hit resource leak).

Best regards,
Alexey

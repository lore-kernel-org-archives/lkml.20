Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFFE4D0CD7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644508; cv=pass; b=F7TIpuY62bTiOE6aiy8nVjkn6MIkrz6aEdzXDnY9b8moNplJfMz58ptGoRKtCGBfSH3Y0tGRngvk2gaECNNjnzD/7YA+OzeKZhry4rc2FK3jGijouGvwSW8YLEzxt67WP3DywV9AMndegRz2pzE5xNROT0HhmrV6VMdRtStRyFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644508; c=relaxed/simple;
	bh=VC3uqTx64qtizJvIeWHTm2N1VvFon3rcWBswhTm6g3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SdeoYDsY+Y0vFCilWfrVlEfBRPc7MYeaZPA5uXL3sMpif2akbb95YYaCV8vdMOcz1ekfKT/nkj8sO+DgBtglVx35WCt+4DWWPMyc9cdHKv4UnaX8NCxpzLbyEZcEI9A7wcYOP84sRD7Gvv0SCDcIYv0lZKEoorE45fN+EzZ6yDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=ZIDyc13x; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="ZIDyc13x"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso118201666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789644505; cv=none;
        d=google.com; s=arc-20260327;
        b=FQXfEJ3hJJJwXz6Eosz/8+YMSsnVME7CDe0/p4LvBCuz7rIwuLLg+NeTWxmi03fI4P
         CtllWrq/IWEEuxsisU8Wf44aXf5MLvUKLpeA4JJKnddMD2YKLjBxhMxmvk0VWKnfaUMs
         rspmldnLQuVFth9JKTFRpZOz4uz4KltQP6UqRlRMMl/TW5fYH9DuKbcCHdd4MzCKYtLS
         G1kIEIQb/mYn0HIpIULAhIW6i68tyF7kkUFI2NsP3RjxT5RHL6uyAWy8cUOOXRmJmH34
         EUct+D0Vg4V9xL/RpRboSDDHjrtmNhDyEHTg8tMLqNsEGXsOm3voT7TA658slAihbmru
         OkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=elvP5BwKT6RoQAB5diX5NiXHvp+jdzVM7rvzbyMAHDE=;
        fh=v4PbOphBiZ836dNqxY9pJQSSViPCNfXBMo0gNgXTH6I=;
        b=UrKcDFna+1V9Nx+HFlw53bO144dSfYx+cUSutQkqvNV7Dqa0WabZkBThcTAogGiOFA
         YeTesObY45lLIXM4OCgFwmLVMZx82aCiYytJi06anrbioo3Zzdp8zr0Fho5yhsgzrga7
         ySKnwl9dkoWHjdEa+7fmhOsedJgPfLLHL3PtRY8YjJJNLF7cc9XgWJKTbkFC7AKaU5DW
         BWenJKd2gcHObgadC36IJw1Vqjz79ok4S1JI3yul3w8lLmzo0pAKf+tjAF1nM9zGgxWZ
         2IF7y2TBgwmJgkP/nk+6BGdMqjPqZncpirznQvv90ceJ04RXqN/hBOAFsRILH46D9j6J
         f1LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1789644505; x=1790249305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elvP5BwKT6RoQAB5diX5NiXHvp+jdzVM7rvzbyMAHDE=;
        b=ZIDyc13xhufzMYtbzy8CQz71ncNfsI2Ff3kMgccc2uUZpYyCZLm2vGb0tHaNnIW2WR
         yeRDq5gR5HFmFho0Bc95D1R6qfp5CRhoqWrlY3Qpa42vRzwxAoLlfHcq+cJblH3pBkjx
         M1O8myOLAjlwopcaYylY5jG78kngZD0QI5tJ3jbsMZTbj3uIAI2bdg2U9RyjR/FiqcLI
         GoOasFHEgtroR7HLwvtZt0O4Vn0i++HTkcX4xe1wt/EGF2gR2Cm4sOfUcwNAbebKA7BY
         BpFRBa8F/QJSiX4saVDJYaAME0LtURY1OPbcmYMhK0kRuK3B6cdnX4YP9CrheT/4HVBL
         BF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644505; x=1790249305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=elvP5BwKT6RoQAB5diX5NiXHvp+jdzVM7rvzbyMAHDE=;
        b=VI7/lFm1yFXgeoyvvT1cS8mahUZc6MowLw01+jZ74KrdZZ6gIw6fYhXFL4Z9bHUGTH
         f2m4J5nGiG2IQD8fVW9vzW51VkKhQjYiF4gDHXgRPcoq6+px61Unf7UHiNtb0xpgzRvs
         cgQHMIB56Lh6hxm8iERLMDdpfBNjgtw0qpDgC7MYgfQNN6AsDT2MA2Y0mbGBUu+rciec
         Sz/+nSGag+YrNqZXjslYZCuwtvWxWQSvbdTo05csd6XBR8p4jrnSPtgk6Mfltfus7lbW
         NXiXztxFpeVPAa60qQTg+M7M1lJyxZtPWcafeAGHZ9Ieyx47N7dqgg65GDDs/4tEln1q
         lCAw==
X-Forwarded-Encrypted: i=1; AKwUvBwD8Vr4NujH8mfOSZcvnfoSzyySaMvoU8I28KJot7tr6fDdjewk1HtEirepXp6eDZJ7LXU3ZHS/rrrm2wg=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ02AUiaICg2UFfSNW2XbM+csVRFFV3oAnv6OGtRmFlOI+Ajgd
	UbTfovqNfQz5CoDZz6mtxioVk6wGoKsI9pZSeUr9qqSeG5f7XWgXoX1fdT/FWvQkg21/u6fWEfC
	F2HqSx7aFj3wNcXcNS6NKbwVZsTO2sAcuDZEy+E4r
X-Gm-Gg: AYBFou0DffPMAa32YVgRqKhNf2+sl2zKsIDHI9Sc5ulReESDL+2x+xMRLHso8Da4z7s
	OwLTv/GGBfokanzHtsOUzH/7gGPYgWNPyrD7sl3nGuItLLpS0/d9BuwxdIA7BPE/sSs+IRvY0e4
	5llHL5FLS6K/bh16wBaKcqrqBfgl8hMs9X6Ai5MKoWmYjsh/PXWIToaipPTzEbevzZofy9Q5bha
	KNj808EDd4NXh6YkFdTvltOA5lwaEI3orNUuLXMe9ajUA4v5dUj/5wOgEriR9/b0+yISCi0dU0+
	nvdaXCOY4Ctxts1cBiJPKebqb7INM56Ev+67LkAs5RHns4Hmq3oW
X-Received: by 2002:a17:907:3e82:b0:c29:f5d8:9c6c with SMTP id
 a640c23a62f3a-c29f5d89e31mr218839466b.27.1789644505308; Thu, 17 Sep 2026
 04:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917110121.631587-1-salah.triki@gmail.com>
In-Reply-To: <20260917110121.631587-1-salah.triki@gmail.com>
From: Crt Mori <cmo@melexis.com>
Date: Thu, 17 Sep 2026 13:27:48 +0200
X-Gm-Features: AcwNN1UNrU3oHsY-myWs_zEnpWdpopKMRos-hB6K_a7zw0ZjQEus5Qd7uu-JNfw
Message-ID: <CAKv63utdoBrCFiw8vkGsMhY9PrWX0DWdxqP5szvTGpdmfSQh5A@mail.gmail.com>
Subject: Re: [PATCH] iio: temperature: mlx90614: Fix dual channel probe
 condition check
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

So this fix is for the MLX90615, which is registered as single channel
operation? Did you test on 90614 as well?

Best regards,
Crt

Crt Mori

Melexis Technologies NV
Transportstraat 1
3980 Tessenderlo

Mobile: +32 492 46 22 15
E-mail: cmo@melexis.com
Website: www.melexis.com

----------------------------------------------------------
The contents of this e-mail are CONFIDENTIAL AND PROPRIETARY. Please
read our disclaimer at http://www.melexis.com/mailpolicy


On Thu, 17 Sept 2026 at 13:01, Salah Triki <salah.triki@gmail.com> wrote:
>
> In mlx90614_probe_num_ir_sensors(), the check on chip_info->dual_channel
> is inverted.
>
> Currently, if dual_channel is true (MLX90614), the function returns 0
> immediately without checking op_eeprom_config1. This forces all MLX90614
> devices to be registered as single sensor (num_channels = 2), making the
> second object temperature channel inaccessible.
>
> Conversely, if dual_channel is false (MLX90615), the function skips the
> early return and performs an unnecessary SMBus read on EEPROM CONFIG1 even
> though MLX90615 does not support dual channel operation.
>
> Fix this by negating the condition so that single-channel chips return
> early with 0, while dual-channel capable chips (MLX90614) proceed to read
> the EEPROM configuration register to detect whether 1 or 2 object channels
> are present.
>
> Fixes: 3d5ead238bc8 ("iio: mlx90614: Factor our register IO and constants into model specific descriptor")
> Assisted-by: LLM
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/iio/temperature/mlx90614.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
> index 27d6ab5f5d7a..4f79da1f905e 100644
> --- a/drivers/iio/temperature/mlx90614.c
> +++ b/drivers/iio/temperature/mlx90614.c
> @@ -565,7 +565,7 @@ static int mlx90614_probe_num_ir_sensors(struct i2c_client *client)
>         const struct mlx_chip_info *chip_info = data->chip_info;
>         s32 ret;
>
> -       if (chip_info->dual_channel)
> +       if (!chip_info->dual_channel)
>                 return 0;
>
>         ret = i2c_smbus_read_word_data(client, chip_info->op_eeprom_config1);
> --
> 2.43.0
>

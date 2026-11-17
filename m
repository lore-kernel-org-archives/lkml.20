Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913906;
	b=3rw2KMbnGe7dT8DieUxFoDtZYOLe64krmganUx0zZHSUp0woe2To3C16ctfT9dGn2Jpx
	 Lsi2WAcOh57EcG0405ZVMEJhH3VAIWo3pucvL1TXNn0C8kFFXHADKOhhpHeBOjblSGDD5
	 1CpmcB2rBil+28CdGkwt3jN2coY8LwL1EympcgZKMoo1ErZ46voyTg1O34PDSlTXPz+8b
	 w3uSuj7zzYu8/CiZp3nJk5J3nVOd7zvxmcFpApv9eymzyBJE5uXbrnjJAp5tE49hvsLjJ
	 ZvkzCKGqA948r/cJkML5vXOwwJs6LPKUIQkQThK783L96cpv+ijc5eQ5lOaIBXBSZcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
	b=3NUZ/V6O3HXg6rrEp3KxoTX7IDQbbpvFHpdk+muZzGCC8FXRHGz+fLNhtlBZRSIl5xvY
	 12wFQhEuOQBfDUKxSRBvD4NWLOdNJySTcfkmOFGjTyAJZsYBlcrFrdq/5ftAM2rlTf2t/
	 ozrFVvFNJbG37+nxAb8wVc9FyZ5ZQ61hvyb47331OACKru+ylCIJvtF86QzY7xZWvfZNh
	 oQI+4o2+3Fw1GgDiH72FaLfJA8HCMuJlVvMdVFZh66VnzyZDu2/jQ+F62rGpKYuecbw+a
	 ajJkZpbduKhEd09CHbRZjeUOkxh6K+wMrCI1rPcB+Zy0AYvQvN7Yd2tK2RNCjSBWcjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50cc7540b7so359102866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913904; cv=none;
        d=google.com; s=arc-20260327;
        b=UYZc3lzTRXlU6qGFfExFs8/5CAud6gGlrMlYZ0pjsp71dYby1SrRXBRMYlhlz+L+Yt
         XirkISbS32SClJzY3JvwW2c7Yk1UwOt4/FilBzq9GJdDCBMdG6DowLV19HfnpW1gwFVl
         n3vO7cvNOAhf1mrydU+QHHSm2CjPp/b0cHqTpY4wU46/2Pj7ZriU8/fZuZJvWYj/Uk7t
         /6C2ZgM8xVzJ25kLlmDExLd7JrxcXop6U2/Je/Ra4IwVgNGRLkLOvzdzq+ZIhnxWIniR
         DZCUKXo8DmU0UGljU6aJAmScWUB1+fVDoGxPKq8HLunnPfgAy56OlurBwMCuJPjL0k8h
         DqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        fh=0+FBLmCcR7DxhZ7EdFXDhit1d0l/Fmm/6UUqIoqQ1dE=;
        b=JcuawjKneJOpFs8BeYrsl+E/U4+pBvwDkI2y0dRKSCg731wF9c+bVv/zwBwtkTFe5W
         7OyUmB81cs3f0hp9BA/msh4+487WC/qe3J61ORn9cUEw7uAb3T9h7vmKg76OL7jz4bZ3
         7vAy0aLHCfwcCaTihBPKICyShkamO+1geJo3utwc7DujWPd5e7k+UFYC/QaLQzpoBj0c
         UsDXjQYPDAZm5VAQSxLqdRawe+9t/sc1AMuiBa+8LLg2GIwa55kpaz+MvTT3QzfHz/KK
         SoI5WuIMcGEfv/85oZhengWvaA+3YT+yxXKyDwwQHUkuDre2PTJKtn2X7E5CJ+rdMbCk
         n53Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913904; x=1795518704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=yyzwQXWUh3hlTm75j49756a3u40dxwVtzSwHSTRdU1++KQVLHeGLEY5oKwXhbCuaYH
         6nWczAtsAkgzqx7tarkVTwqE/NcVSVZoNK6OuqrefHsu23luGO9vLTl0ReCdUF488lYn
         Xctf0sJGtjqLQoPJcntw5NhbgQ1nt+25ZO5G9d6SB0G6QMIK+9CNoivLQNtlpfq8YlX2
         bvCKhmaKDMno2IJ2CF+XBc6YetjTb5aYwyiC80kbZ0zb4Mtd9yiOq9GZfVJP1lOB2jXz
         W2YR+wlO7NuhGWOJ237/w17lVlBl32uKbC1Xb7lNg+J4sMz5FU92rzdEDYH6v/ndnBFN
         3FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913904; x=1795518704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=ZTaqa8aDbyQARek/hqd+q359RvsJS2fLg86f0djMNx+XxfxkQRFuSwT/BbsWc1KAzO
         BwdHVojMg7FJaW6O404F/XzgDevIq3eKQM4IT3WXxAaEymlYkaeSdAfbUVLSDF0VAH2S
         I/jTj0RIWe/ZLtuKMLGMgyc54OB9MfjBmfY4xoj48k5pEZ0Xv1XVdiSB2E0cJPGJ3IaG
         LHlXaCwNoYo1n53vYcIwbvFCiZ/tzp7K2n6cNfUnqGqE7mpevisklSIpyLvpeAbsH9TF
         ug2GRoPloAo4XKd12BlvzbFe8vM5VTkaoNwj7u0L565lSSYzr7hIxwyZzXPV/hTQfm2n
         V2PQ==
X-Forwarded-Encrypted: i=1; AL+hErEIRRp6kuaVrOJ1QvGKn77DKCvrZm7mAjH2+heSEgnCZIa+IeRMWO6xncgfnREzPj5Jwlj7LAkRl7YoOLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9shaoAUXJlu5ihZUFkqgALjnsF70JB/87F5Cr4fqcoo7ycViGz
	ECCBubz0Ihv/mWqgJrjN8RYsj5yCfyKxltjUd4y1sPbLRa88SKiBVSHHq2mMk13t0imAvmFiNq3
	4dGRtQIGYFjZxueQWvhRxBHsY9hnsMRI=
X-Gm-Gg: AYBFou1rKeyWgBRn5rTfbgFwIF+urgTelqtUrzvzve/c+bjhskAa9qXKEgcuvsuEOLb
	L1BJ/Q7O9cyh8vN1+bs/Eo6t/SsPP69h04JRgfvw+sxtz26UgsYXw3hWa1m914XuPdGct5Msof1
	4nLkPZl9RFk6oX41SirlxUB+t5jySdbyo+sltwx48Flnp4mnHXrjRy+8mHV1QeZnxaaZgQdpmfg
	98n78Utpzf51DbpFU26b+PwjoXLRkOhYBaL6/XQV/8NJ/UgbFVEqbwIPrG9R/2N0L+BYNOUyfLv
	hqOIaCrr5Fe6p4BeD3zd4VO9JxsXDa/QUg8mjxmPN1k7DAJalOK3oPEwRK4QqgOXCt3OSZyX4wH
	Qyz/GDixxEHRpnI8DcVO5sG+9CpyDmjuialxCZfUaDf3W0SeRuSl++wnlDPfVe8zBXtXUC532Dx
	DPBjtghsYEVhHb1XNroatOONc=
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id
 a640c23a62f3a-c50963d9089mr1499165666b.48.1794913904361; Tue, 17 Nov 2026
 03:11:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:11:32 +0100
X-Gm-Features: AclHuK_ySbd-btf70cw_u0VyMg7YEG-_OS2SndJeElSe33r8vAUxyZLJAiFwxJQ
Message-ID: <CA+=Fv5R9GknyU62ZwcGPvH9u_ucK=qP3j0mE5s-YMJgVbkGs7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Register a "marvel_env" platform device on Marvel systems booted from
> SRM, for the hwmon driver to bind to.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/core_marvel.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 7525f3ed6b62..169a1df6adb2 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -21,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/memblock.h>
>  #include <linux/workqueue.h>
> +#include <linux/platform_device.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
> @@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long o=
ffset)
>         return status;
>  }
>  EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
> +
> +static int __init marvel_env_init(void)
> +{
> +       if (alpha_mv.init_arch !=3D marvel_init_arch || !alpha_using_srm)
> +               return 0;
> +
> +       return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_en=
v",
> +                                                              -1, NULL, =
0));
> +}
> +device_initcall(marvel_env_init);
>
> --
> 2.56.1
>

Looks good!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

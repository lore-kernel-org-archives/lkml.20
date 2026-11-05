Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793847164;
	b=wVo4GmBT8lXsA3HgwdZzJLmpM+A/NHOxGZPY5CkA3YCKtz5UnBOAxR7Z1mN49rXGRY6a
	 SUuL/7mXvERP65u+0WL9O+D/ge/SsDDXPgmq9F7WBKmfYWD15oFJJnzcEfz+4xtj+Hcbb
	 O3CVKt5lojZQO84prbihp6LKuFSNVtKx9L3eGZzJBKlZf4C9CH/QG73mJEruzt/JLef2C
	 oUtBUqbukK2RvzmIE3CBQEZBCSgA0kA3zw5bkuV+ggACg4iUxP4ALms1ruNL/vm1RIw5m
	 oLyFu0lIrAKg1bcOmWTDZq2leRPkhHUR2tiAqRROHD782EUoaeTYdYsgm4t2aH+clOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
	b=HrrFct6TJreRnec57nbxu7kcOQ5PeBPxzcMr1CRashIKG1ny7pu27uePpRo3F5jCgGEg
	 irp7HfnRou6gwNB+byoATXmgnElSv1u5Uiw7Z1QjkRQY0gWQ2yZlKvpMpfbX1+ICkH2no
	 1gzEfF+3yKubc9Saxrdpg+6W2mpSXoJo7+VRoF95bAjN/jasBTL/EvzgCO4oMf6wDXLks
	 fzT5eRTPcrlTJwx1EI7w5SIIKfU/caRrQgSQ4ZOb669qrB+h3zICHjQ9tAr/kUPp6MZ96
	 tcIsk/Tf3rlaWrWVjcXEn7/MpSH0KJH254sy6f1z/k66mj9GROxrPWYZKzb2AYiiwZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/TXZGXM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A0B606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A0B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/TXZGXM
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070781f63so696122b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793847163; cv=none;
        d=google.com; s=arc-20260327;
        b=NoIrpGfqc/O6dh6+Zgg5JsjhZwle30oY6Q9UZF5nScp+k3GU40FUsIo/hOkYpU+H3U
         +FKXcQnlJ3QMBeHgekiFy4H61t8dzGceXcM8Ag4ExXW5o+0y5ghWWRXXmNSAVT6SUBtR
         SBZnGaMz/AvSSmuckjz2BJbxzN+9i+IKjyV5Ns2PMnwAE6u+y7pkBA422I4UHXVK8B49
         DjEWJzNNdnxD/5K8wwvBGCCHWDLDf1dWMlQSGyhK4Y+8aOHWbfrh7NJSB+NO8IsVKGWd
         JfdFSL2eQuiWL0KGvEx+hhvF6CVAD0yKP/iXCBivYJPa1XHfVxVBA/YFAxngtgPzl7+c
         Mn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        fh=dTOlsXAfSwB/JVB4eAHB6mI6esYd2OPcUPY+gVm5d0c=;
        b=f5HyamIzWFW7jsZfIWO5dXcwsZBX55kBmjrSx2JroqMSIPuK9q2FbUWTRlZhn52nVM
         lcfayZq4iaVh2KUvb8x9e58MQjg69vuzg8CQOZnBhlgnxg/+KqwW+suhcWFKfqgQe4xF
         +vzt1CXWiF+QQxkMxCI13UoQQRh/t5ucVyc7dtFmUOlxQJDVZphA6KUAUwTrxxl77u+C
         NnI/gwHJM2SQVMUdupLwQzmpWnzQj/yiWpAwluvrWr+uEfAubGQhasICl3sCZkQc/JVs
         KkLe/eplkYDVw0nMfnWgR1OgJMfF4YLqYyq9zkIV1WaLhlzmlxqWuz2k7hMQVyHAUiO8
         W5Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793847163; x=1794451963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=E/TXZGXMs0ddnoycXEPfkciCd++/kQrtcqkb17sG6C6fNDXLfGT9kLH+MOcHUv3laz
         CeiUBZCtnDAIRzyVvPtVaKqp3kg0n/vja0FdB+NTz0FyNLuuWb881TIHXxQrfn5secKO
         YDjjiT1F3r10+gFgILymw6ftBJTHN3Go0oNs21rgUADPvrQKzLsOfkMoSlc5P7JP9Njo
         VGKLkwtNbxTfC8m31JyIcJJYDa5uxSvqhAbvVEAI7nYdEkef2r6/86wzx2pCwamhjkmA
         FUDTOl8UvX10YnMe2Rn+GsZgdpWrOqMB82N+dN9XZMYhZmiZg0RXlk9lxofT7Czr8Kg3
         sbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847163; x=1794451963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=nxBvwl7C5GuMEN3AWOXXWpGxuL00q0hlV0+9FoI/RfY4Nloi+ggrxIW/WHS0r8pboJ
         kuZ+xwnwA3DhnRKXzMvTMmWiC2hKTHv5Jv5Fa6jX6ANkXATpTZPXClpsXtI3gbNHcoGP
         qt9Mkca7zy29a6yJy2Fbg8utXBETEyKnVhMuKgf8wQYQ1IH0Sc1uusFGiwotSRcmlVt2
         o0LBnhAJhUtxrDxPdU1h8qnjYIKpNk+NCVI+rRM18mq5kmKC7ELcy1nGcZpqsRE0zsJR
         RinRM1nNceL57bjMfMz221/oRqNmylh/rCUesgJ1JXDzd7z/fN3+dhC9VgQsMeka0NOg
         h5ww==
X-Forwarded-Encrypted: i=1; AKwUvByWDSuceKdeHN4Uk7WdXU4w/vOxxpQq2ovmkd8KunQs11gVtHbyiwWepFSrwUb97rRj7yuNGjcoFKzMssU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qtHwtuLCgZKHJdVfMMSIQH5qkgvWI7fEF7Ssxrxr8GgMWNYCh
	4Qu2vEFZGnkF84th3W+rjz1bsb825KPZctEQoPAyrtqoEhkPvyfzMHkqzLM2dsr5ilPCS/OibHh
	xxVMA+nx2+T/Bl4OhMoJ/erljrOOpYJI=
X-Gm-Gg: AYBFou1oVyHDiT3pemgKf29M/XCxOCfz+NSwEdcZ9lMVgS5G+LzfI4UArkY7Q1J14Hc
	U6QC9nMIpv0Ab0Hr63KGzckUFyCLPYR6difRRWveHpkfzYTgYynTtTU54gv6heBuSQiBvMnuovn
	PRSF2f3VWKSt1uvNQDTRKe7ilRedlSI/VE/LPnkO8TBCq2TT+k2UwXbtnvZzCnmEF+joWRXEywT
	C7pbIivzh4gkmCvApwEd0ajlUdD//0JJeQlb64wqX/nWkv1RfJMd8Hq27Ot2wvZx4KWRgwxwW1C
	F7opYPS1RshAhjZsZDqZuL3IVAjs4y8226pf6C9q96ujOW+Fy13jgqLmSfT+dK0vqccnipKRz5B
	fPpqzP2s+2xSPt8wwmuOor6gBR1ZIYHGQYgww
X-Received: by 2002:a05:6a00:2d96:b0:8a0:5f63:5521 with SMTP id
 d2e1a72fcca58-8a9ba703d12mr13438966b3a.8.1793847163495; Wed, 04 Nov 2026
 18:52:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 10:52:14 +0800
X-Gm-Features: AclHuK8gtw_SYmYC4rZ2ec9F7qmZC5mmmsY7xqdrym-SeKMj27M0HT9x7LVxGTo
Message-ID: <CAA+D8AM5Nr9vDzohQaz-XN=_F9dBfXoBJJv_3FS3jDeGQ_6G4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:35=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/imx-audmux.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index f8335a04595a..d46f43ab66cf 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver =3D =
{
>                 .of_match_table =3D imx_audmux_dt_ids,
>         }
>  };
> -
> -static int __init imx_audmux_init(void)
> -{
> -       return platform_driver_register(&imx_audmux_driver);
> -}
> -subsys_initcall(imx_audmux_init);
> -
> -static void __exit imx_audmux_exit(void)
> -{
> -       platform_driver_unregister(&imx_audmux_driver);
> -}
> -module_exit(imx_audmux_exit);
> +subsys_platform_driver(imx_audmux_driver);
>
>  MODULE_DESCRIPTION("Freescale i.MX AUDMUX driver");
>  MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
> --
> 2.51.0
>

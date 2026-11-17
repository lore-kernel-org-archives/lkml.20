Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913815;
	b=a+nVKLEgfyUGsd/Hc1oDyAm3AsBLHaiiRnK1VZYxdwyz+LPlPJ+rk1yaddhQceMYsELU
	 fdXF3sLNJr3war49NgL+JKUUmnpg1GSWNwweHesxR0VLOMV1xtUMB7Zjs+QWJe4bXaPeu
	 n927CsNGrsKi/WP0YocOXR1SiRAsbz5aKzFlIKEW64KBhk0gVMMXEIoUpnF6hX3+5yjjK
	 NXxe8oCrkLF5gOcf4pUbYe/e465pVTZ4nDtRGDC9sk/Ut1GD0A2Ckvh8F9FD/VbdVEOnh
	 rUcqPgjdpf2EOB8bpKJLOwYxyqrNyasYMWl7+jVZVo4Bmm2T+xBF7Bj7AnAquanVgAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
	b=hNSbGI6UiMWYa08og/pCKJm3PV/P56n+eAuEp/dC25FIwFPCXJm+JDQdEOgTB0RatnRr
	 4GuqszGWAjWplZ38KsjGOJfpQRTelRFU5A/xK4lQ0JZ1w3w90dy1zbF2y3ZS+LAfI6UHJ
	 0UcgsfZf+70O1c0U8xqw/oSxhe31jeTVMhKW8BIESRxarMfmAQwHBZo956tzCkNygcARG
	 mp2M5VdWSMgKyxpq+I1GtsAFJAA1G2eI1hxE85jI9U2GcWABp+osOwPMon7DvpX6MiyAB
	 FbGYc9IIJJuSGiIXVePbXx03WzmGJUVk1i/tXnni/fsxAvR2DN0B10LuEP+nZFld55w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so664538666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913814; cv=none;
        d=google.com; s=arc-20260327;
        b=YomU9aQoSxiX3LkuKM2ts1hBx+BNWUNsf/YoR2kgxI1g8ys5Oiy8OWRFkM2PH2J5DW
         yUqcMq8NkWhSAa8degGuYP1k+jrXHDD3qsc2FSDYFoxFnAE6eeinebpE0YHIngr4bqwW
         mzUp2Ui+b4JrUHGpge/eIb7Yh9N3hiPNS5YWFbexGEcpovV2WWXMm7uht58y14K2Xrxl
         tpHc8gnz10EBPHbvWkueSBCexzO0iZiTE3qiM36CHy+abDpjr/nxbY0gwCB12pD8cib0
         clsAPADB9z+Q3sTlHXhTeylF1bZ+fSffkFX1gL/cYVehsVCUWfB8mWH/HvI/YJ46ZgtQ
         HANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        fh=YjxGdqgQ4dhpz/aqJC9wcfIDBj5vwreZIG+VHx1UPTo=;
        b=NNuXrrXpPReXi3DiLUxtPg7mkZTz4QZZ1Hk46I5n8Ac/WEkNfhAemcmj+JjtA59TVB
         pJDSjxWA5I6A5sz9APdJgOde88/E8IT0zLr3Otdgv0awANKTcrjEDRzf7s49Q8nvnnkL
         Tx1ux+o/3Y9526QWa+0ME0ucDf0lgYR+XPQ8RYF7KhOqu5nr1hxro8Y1SKskecOs14WC
         cKf7wA2N6E6ze+0PnJ7WL0JUGln2aEecm/RifvHNeu6l7MN7PPRwZ9ywcxoHrqBl6VTE
         z43zBqis2hOwW0fwd46aEnZJr1g1KqcgT2mBKWAi5+f03yuzpbmf75CW2TeQ7TnsuKbK
         8ddA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913814; x=1795518614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=x2Hk1hKblfNfbBuIqPiQYQh2uP0SnQ8rF7azyRg4NYKTU3Fu7PbhEJPFEoY3qlSRFz
         T4COaEzFG92WXLtKX6fk63E1vsACOSPW5/ek9/aUiaptwVWyj+sJ2Q5rkTNyTSVXvxvx
         /5A9XHhMAAhtfAmWhFuuektMe6yqNzmace6YCtiehHL0xRx+KtowsiimYXlOejq/riSs
         S3s/uOKUsSWxJ3NHmOH3DkVJqg05gQzE8l7IhIRUxwEIe41jJmJInn8KzA4qLOVcGYze
         umI/PvB/VnSZkn4nBMxrMKsahoMhc9+btYRJpOYNhS2bITRufspALvbSPqUfA+f99JaT
         9A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913814; x=1795518614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=zmHgHoAWN280byw0KW/IV7L23d18nJH1NRZVW01SEsJvoHtV2cgbSd8FCNB8f+MfzC
         Z1WjX6GsVzOTLDq8LKGW9vOweWgB4lc9PHeKsv9Y+7VbRW4xXSU30mkTdwdRtz6mIa0e
         D+9KCLoJ3+ByFdPvWw/KnJ7R3/f2kUcR/wvCuxGeFXXaf4uy5pBecM2ridZtuq2sR9u0
         c5OtYTZ9vHBi69rF8dK74BhSekl18fpYTH5U1BRh8P6ET/sWw0xqRej9fACvsEHQUb8V
         Thm9r3GhnDCje8c7BiPX7LkbSVNm20E83x4GySXw7f40yQQ8f/Zuuh9/5I0+avrLkTeQ
         qcNA==
X-Forwarded-Encrypted: i=1; AL+hErHq+SktIpuFsjNW4ddzcOyhHI7AbmHnv8HFadNaqac0ipJ65vLsFNsJ0xLzk+KkmE49bQPRNXb7HBhdkNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WK4z2vqDFG8TU7B0kQA83CoWybTbzzhNgXtMKfv3QZQpJb0Wq
	aIuMulgoHz71j8qYQjG1t6aV9cFwKgD0ilGBrb9yKyfu6EN5lQg3RJPfOUpygXJQZogR7vAOcLK
	xoCQpfwX/LbyDxLTwSf+vv6MbHIjtTqI=
X-Gm-Gg: AYBFou1zHbnObjitOAn6CKqgAqkBVXtZ/xvT8GW0oCcMXgYvZkL6V7qEexjG+9i0peI
	2kvP61biyusnmFw/vTCPXzvZqzo3xyMIR4fPXq5w+tYzzSvebVes2G9p8N0rdNLfOtuigOUEHm/
	KyuXQBdKWbeM5a2GyMLtBbCPfRDt3n3E4obB6mE8nm0seatuhrRhcB3Piq4Bw5hpPlwQrqT02Ii
	/iUYFDMuuBice8k1wd00br4UM6Xk0pB/NUZCv5EfEaG2iYMxvMnDeXJx0Ad4m0e2UgZNCZIUNjE
	lRqN0kRdV81QdwAgV3EaFeLLl8mH1ysRsEGfeOzU0RTJI0VRpoJAU7AGpG0BWpjmKGkZVZeLu7f
	GDywWL4vJoq/2IQYITpPRnjVLNhKKDLpg87JviTRMgnyjrvkx7n0VwTClACUS4194fCuAlOCqsS
	yX1VI++lsmsDJlahBMrfg5LMrLoOGMTnkyf3ks4MCFnGdv
X-Received: by 2002:a17:907:6d06:b0:c2e:2944:d6cb with SMTP id
 a640c23a62f3a-c5096328166mr1059994766b.13.1794913813640; Tue, 17 Nov 2026
 03:10:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:02 +0100
X-Gm-Features: AclHuK-Br5Vbz1VzqXOUMBwObsh3mCpAfEThlMEgldrsDt8fW8D9WyXgT-y8mRs
Message-ID: <CA+=Fv5SCPN9wTpZ-FMToWtNerfPswbExZxEHtt=gwrXf+S994A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
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
> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/err_marvel.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 85f7a56816ce..46c521cea9a0 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -37,7 +37,6 @@ marvel_env_state(u16 state)
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> -#ifdef CONFIG_VERBOSE_MCHECK
>         struct ev7_pal_environmental_subpacket *env;
>         struct { int type; char *name; } ev_packets[] =3D {
>                 { EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
> @@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_sub=
packets)
>                        marvel_env_state(env->state), env->cabinet,
>                        env->drawer, env->pe, env->sensor, env->state);
>         }
> -#endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
>  static int
>
> --
> 2.56.1
>

Looks good to me:

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

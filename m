Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327592;
	b=L4vzy34cdDk1L2E82RHw5fRBwidY2fEAuUCa9ignkpghKyyYB15/5aeNMh2prrvH016I
	 UgyzWkzcO2rI0+CIXmTKhMRMFvV8ZTx6DS/Mc3hsszJkRv3oBZrNHU5tYxEvYrKtDnFi+
	 Gvn7uVlN5hxmY9HL19gnHVJnjoN/DZNRAVnPAdcGUbklQ9a4SgP6CVMfmk3f+NIxbqhGg
	 fnsBKhKEcFLoZVmGfy5A/O/AdQTWUqRObdzJAbYxf05CoO0PxwH4IbdVzilV6GjgLcxl4
	 IHSrVv9mFyuSyAuCaEeXcDn+XVKESY3FewetkZkB3Ih5cqQ6LUW9NGivXcQKXQhTHwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
	b=YiSioobRqfZzbf2yWTlJGyQ1CRKg392il8BdBV/LyntMWQJF9kjRlLkd28GAI7J/59kL
	 dd7jizWdO2SdEKaX46nSEvVOhFTF7n70JRHo3rfyCaYyZKwAuOkmZbLgX5jr7ZlBfDO84
	 m/CanQFi0RxRdbmDM3yUb9emHf5PAnqXlDGl00+OXS0h2gFmkycx8O9F5x+d/MPDDAcm7
	 xGk1PaEntRNbQz94x2mddkL92ZeRoyr0zQ1GJpsuaJJ1qJnGfZH2P3XzyT+2RQWeCfhvG
	 pQqy+zt5SMyDYLN6kDIOBTundR8mb4t1LneKVptBOd4IeW286Jwltpei9TacNg85UDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4XZ0qoc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873160A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E873160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4XZ0qoc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1905730f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:19:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794327590; cv=none;
        d=google.com; s=arc-20260327;
        b=XOy8D5H803dzoNmyWNJxxYKLVKgL0dfTsKhgGJ/hk6azdMI+IURVfs/ehUV9+HNlL9
         g7rapgJV8laIOVGxRPtqG1Nh8lusXYdqjajjpqkX2CTHmeaGqgjJp3q4vNpyuxn8CTaC
         plEo3PiNNYkdfAME58gQ945PdAfvW2VmcrM5BKS7COojqKBDZVpRKATrC8pxRI4ygMsf
         5raNgLrEFhGjhM2GvrqWkP52xmIpYlpqrsnaUg1Z2DetmhC6IcIicR7al6TPpk5bJdn5
         +claNh9ieowIbAQXJGZZjWfJHDyT7uteI87Aiuri2GHhVGriO9oVn0I6PhCJ4xE89e81
         hMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
        fh=PTGaWO8iMWq77oMXJTc63luhUyoIuii7SvIfq3TamiM=;
        b=UFBXSpmUFVyOZ3zPwqbK9UxvsQkXpU4SJnE4C7a45eLzLYJZyYgQA4RWguGLS+c6Zt
         hwCTwCzhqQNa4ZpxZ+oXWz5PeM4jkpQdJ832FyBtjU85OCgz3eFLLYcnIpPYYL5Gcy5P
         tvGniCwQsorbwkkbcxypEoOYtYN7nyta2mfswba/fXbCS7l953H/KnHODOdRkIbVOy0d
         fvGxIDDkuWpQxCkPJURIqk14lD0d53XtiQ7iQGb0e/PhffXoOj3UriUxTgmA9yYHjdIi
         Vg83D/wc97jrCWNzUpmbQ0+XpKQHm5fCa4hBx+3Z8sB1JQw6KWokh9geh1oQMJme7/Fd
         b6Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327590; x=1794932390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
        b=Z4XZ0qocZ96lpxd7Rb0ui1uFPo9ng20FkuyqlODIetmWhtNNqX68kxH/u14G2+tSPn
         3oBYCMCRaozcM7Cy1iPAjl8DJ6e2saSIp539Kv+qfR1OnJfX2dXSeqJNo6yydEzO6Y8Q
         oIs6L8H10+8DhzeUD+OedTs6d//Ox+ARVUZ2kB7y4/wXQPEmHU0nC7lrR/ElWo04ZPWl
         nlqmwMcOwgUaOT7r9dIb9C2WPT1g+tos6P+SdMSK+MIMqCLpDJEIvaqiH4AwDd7p1jSY
         jc0AnjU5JOFcK/bF7HDq5baAJppXK/xpMMvua96Hq3CaTd0xtmvtg61KD/yy+8WFQlCU
         0/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327590; x=1794932390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
        b=fAMPa3ZATtvLR4CBsfBSJcRVD8TUp43OldsWtGvHcLoel9oy7kpjQNL19G4dF7xmZW
         zFyIZUTRrassDFGcpEvIx/LIhD6mSS2i4HTwyOAwSulN22C8tlB7oy9UVHx017tMWol6
         RRbeQK5uVYUb8UWxI4/uTt42uT1jHosvcUNoUIaFAhkVR5bXQwLtudDUaN73OGMBjgx5
         d1P2uBXFwxPFWsGgJsVeis5zGLEHDmiIY+tkhov7sD0cg8kNqwE3vnFPDSMro3uyxlcV
         G7s+oflOSgcI0rTMtXQ5A73uxwIBylEfFoI0SPAJFCky+Me81+Z3OwUT03ohnGQfXb+N
         wAFg==
X-Forwarded-Encrypted: i=1; AL+hErFWAcA/TvWBMVZaAtgAp2OyWDeptbkuZ785tLWMuo8/uwmfFLLi+U0q9QqGhgG2aP7eiHqw7C+telzuVv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ymFaW+T5jrADAzMvT2AbIZwuxT6acUn4z5jwSK8fVt08T4LAn
	2pGgyK0Om97iiPREKx2mFqVYDaZXOjKigncybzCI5dUaiEchoawhOVPacA66+WBiHdr+xHJkee0
	KNfXKcwOp5RL+TVetyoh7+R2U0msIdJM=
X-Gm-Gg: AYBFou3uk7qujMqDWYY8Hme4FNC+6k3vpjczOdRvsyV1+yut9JdjTTnVLXwj6/s0UHV
	4j1UOkOehqh9ooFnwf5/27Svpchpk/FYfQX+NxFFb4SDx84LYWd0MxOd8JKiePGhhsOm7dHEqhm
	UBxhOe3rF7oflae0jxsT8xMsBhVovTiNTkcC/gfF+GYxc99XD+/X6YKcDsVnL3cd5qkMLG8jU5+
	TXBHI8B6EQmXr+jtHSCaSUla0Dn9ZP2Q5ib5GleyR5/2tNh9pQkmnOkKxkx7noIUHTEg8kUCSBn
	LX0YV0OkJIEwQKq8lHso2GVcZqG8ZTGgIf31vQ1+Z0uxUDy7J3HnYoCIg1s4qdtLLolpHWdh+qG
	Fwgu6AWS2Bb1eER/ZX90uXXMDZHlqnCwxBI9Dl2u+UihnCLEGrfc5PChQHYzLcOQOdnn1DYB+xB
	3AE/XSPxritTp1mEJdXHOPCFqtz3pKVQkaKqk8jt9wcn+pi+cQ2yOwhoWxSA==
X-Received: by 2002:a05:6000:2689:b0:492:20e0:f666 with SMTP id
 ffacd0b85a97d-49828b4d6a4mr6624888f8f.0.1794327590092; Tue, 10 Nov 2026
 08:19:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
 <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com> <a1bc40d2-f12c-4cd1-a4d8-c74e79606f39@oss.qualcomm.com>
In-Reply-To: <a1bc40d2-f12c-4cd1-a4d8-c74e79606f39@oss.qualcomm.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Nov 2026 16:19:21 +0000
X-Gm-Features: AclHuK9H7BCOsVyCiLXD4cG6ix6o20RW4-wpITBgbhIG6H4hpyEsxBCwGkTKdsU
Message-ID: <CA+V-a8stD4TFkrFHxddMLm+GPYReYAMcMdFsAC5zAKHPB8gV3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Nov 10, 2026 at 4:03=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 10/11/2026 16:57, Lad, Prabhakar wrote:
> > Hi Geert,
> >
> > Thank you for the review.
> >
> > On Tue, Nov 10, 2026 at 1:47=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >>
> >> Hi Prabhakar,
> >>
> >> On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> >>>
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Enable the RZN1 RTC driver as a module. It is used by the Renesas
> >>> RZ/T2H and RZ/N2H SoCs.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/arch/arm64/configs/defconfig
> >>> +++ b/arch/arm64/configs/defconfig
> >>> @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=3Dm
> >>>  CONFIG_RTC_DRV_RENESAS_RTCA3=3Dm
> >>>  CONFIG_RTC_DRV_MACSMC=3Dm
> >>>  CONFIG_RTC_DRV_S32G=3Dm
> >>> +CONFIG_RTC_DRV_RZN1=3Dm
> >>
> >> I don't know what happened here, but this is not the right location to
> >> add it? Moving between CONFIG_RTC_DRV_PL031=3Dy and CONFIG_RTC_DRV_SUN=
6I=3Dy
> >> while applying.
> >>
> > The configs weren't sorted, so I added it at the end. Thank you for
> > taking care of it.
>
> What do you mean? I just sorted it 6 months ago and it DOES look sorted.
> You just placed it randomly.
>
Sorry, my mistake. I assumed alphabetical order rather than
savedefconfig/Kconfig order.

Cheers,
Prabhakar

> Thanks Geert for fixing up the placement.
>
>
> Best regards,
> Krzysztof

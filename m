Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473041;
	b=XZlswekAsyHShYZMXRuOaDyF+CHhQLAZid0ln2ljhU+OniB5j55kXywl9ynVpEqFZxcb
	 ieIoi3OzTbbZ1yUJYAgB3JGiqii8LGyk2O4Yzj2bOBupyKD6PP3RzMhXXg7llAOiLSssr
	 dyrPAAwP9h9iKIABB6zsYWsnJjK3cp3LklB50Qge/9oyfPTWb3oyOadlxoSJQp/bGjzNp
	 LoVYbXpNkwYfWctGu/ZMkCoa/6J7XwSNeR77Ac7ZrwROD2zn857y2QlW93WCKlhFJX8w9
	 dA/K5FzmO7oIzvs4bLFvo3K+gncn05oF47GE8AxZXFJmMHZwojBXLF8kzeACZ7pVaeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j4z+t7xZiBYWqSlCxRL9tqHGVa1+jJSPT4E84fY0Opw=;
	b=qzc/Ihfo+IoYU9dE85MKsNFHbdWEHqiGOgp3pZts/VNe1rJ+f5Wglro7G+DZSL6zg4Sj
	 nOIJ5tZsCVj/5abKQKC2NanQMxGMDocCON7Itsh9azDbRuRuK8qDRfC3op56Nh2h7CtfP
	 VmkzdMZyIwkomaGoXORxM9dQkEKKiNkOROYtV47yOMGgOKqMiZR5fDS6PIcRvF0+YwqzV
	 4I82sS4nc3eoRiYeA1HTxRbSyP0OWc+Udbiu7vmBPSerKkK5CnXoezI3vw8OFOkI8quvJ
	 gJApc7R8cZbXTO/vFfvzu3Ggbrj/3F09RLAexsseIfOOcd96LRHKhONWFeCP7vGux0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U1pDnbWC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91E606B247
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC91E606B247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U1pDnbWC
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3acd523a802so33563491fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473039; cv=none;
        d=google.com; s=arc-20260327;
        b=BnNVoCU1sPeLiT7bpS5zLCCJrV1Q7q37T88K/BNSTyXBq+gbs0gJMAGkJRxSCdcYtk
         e1iPs+QCuno8DEh4fe1KlXFDriIgN24wMlqQUQsLkZunu/bUbmJyu7iVMj2HxKzgjjmU
         nqYCMtrnJ45fb3L6cnSiKhbqK00IW7pWxuljy/tWGFb/xyNjgDfxKcubSymCRbpntswa
         WSu2IQqrviUsyPKIOTZZevhRIbPFUwIChMsoXRJi45mWL4Vd5fN1ScsoXfmDmY65B26E
         MJwNhFdMqHDHoJIe353UZNpp29vdKD83Q1enSrhimu05n0W+Gz1SBgOgdzN5YO56KQqO
         Cohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4z+t7xZiBYWqSlCxRL9tqHGVa1+jJSPT4E84fY0Opw=;
        fh=2QmtWkt0gVKp+6agU+HzgL0fCdaLx3nG7PXN6wCYK+8=;
        b=KtBd0HEDFibWfWoXqsYqvi/mirZHsj++lPdiVeiGSjwkKhKWLv4rppe4Q51skpbLzM
         ks7PJALl1K3JUmOgnv/xVKZT1cspZ+AIvGJLMg0YeYmPO6VTor6SsQBQkbj1tmWX8vUP
         bS2W/EOhn+WLI63xyWrBT+IL0K5aZsufaNmrpCvUUS8dXtEObjTaLCPBFlwZ51Tc6PCV
         k4MOfh+c1i2q+NYJQMSgq0UpdcjMcNAKjgaby2RtN/ot1YQ+uH6St/y2ROM+WRb45wHG
         Laefvkr04Hst+skidee3tGGCG4VJPSk3Py2lb0GyHKg5jiGUmZUvsKltc0c2vR7Ym7bA
         lA4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473039; x=1795077839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j4z+t7xZiBYWqSlCxRL9tqHGVa1+jJSPT4E84fY0Opw=;
        b=U1pDnbWCVTCGQ77KHMpS0ryIaY5Fd8M8qQtnYvIN/tmX8WicigA45WByhGmV43ossZ
         pfnI64oIMCvXG8XXWmk+gr6tcrgPDj2fU22ue+zSzsR7sWEBVKcL1DmwcPTMaCnFOF0r
         jtyUZsI2FR+DNUEReCFY+5P31HvJWHAgDLN9G1NMVXtFNZO/8aFXIldiyBt/uGWxzziM
         0EcImUD+ORPm4MwTBn/RrhH1tyrHovLeXJYT6nviSzb3QU2VqavcDOUCsYAA0KG4QHaj
         NY47PsuSV+Mo+t7BQpe02fEgrRDAVk6MO79V1ILDOteoY6ktLVHeZRk2yQ0X/uOtUpHq
         luwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473039; x=1795077839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4z+t7xZiBYWqSlCxRL9tqHGVa1+jJSPT4E84fY0Opw=;
        b=pVcROho+qgTcu2Kt7gC37EnydIsGgDVDxNYpmMhUxfI0Tuyw48iwF/iqXwQH+QgZSV
         +RsALAs4IDNvxLigy/OsxIij4UGGNy1JxWsEHBRtNbTnG36a0FZHfIYcy4HKqLq/bbdh
         8QVep8GWrCu0b9+DpS+qPLllKqReEPzUMsvcXcq6XihtNQO6jdtcpxMLddN1DzEkVMAQ
         Vkdx7pkXGbYD/wSMdsS/NdurHWsztoDHKKVEMcHXScyXPcCDRsTL4JTgLp++pfBEQ4yM
         57Wo2JX4WweNQe/Z6nvJjmwyKwsQClcFbm+LAEdjW45wn5SZhXphWs2RGEGJXqlpovFk
         2eGw==
X-Forwarded-Encrypted: i=1; AL+hErEE/hPGOWpHW04WJcbtoKtJ2AbWQZ6IaLq84/mGs0CT4r0jJd/Es+m8H2M7drih8OBBOr8fWr9cOVVYlMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HwlHHMi4vuWn9U/+J1D3OeQmLGOyjULntCpPpZ720MO+ByfJB
	E5ii63VgwmDAbumG171kkzRJyU/Beh2fESnxXjIIK//FuPzy0coEPVsOguMzDocODgftmx8Ms7X
	uo94Yxb3kYsFk2Ij5UZog7nvRkXtscL0=
X-Gm-Gg: AYBFou3HyKXPcxa4WafkAan23o4tGDMGhp9ghvTB3/QOvZGpiQe7Xbj+nH/tYC/EAsR
	o/ckhkUycEtLLGDPtRmmCfC342RMvSEvsjh3qEFO5JT9oueaU5VfrAfRGl9qSBGCdUXoWdi/6MI
	1b9Z42bmhgrZEzWi0ucd3LU2h0vIAgPnEuP1QZ1nGczt/5jtBZ1J00dsyw6Z7yR3BF3nv8LG7LT
	cNt1qQhE/1tENjGgqe5FESuG3p+T9Gds8kRjK4KbN/h9lRRWrCiinifc/iPncFQArrw7j+6ZM9J
	mg3o10xvEsEg6NZbzVPNU/XbR1CYPBvKvbFC+boFTTwQ+NGQbD21Hgzn14ugCT3dNEP9m/4VSpx
	3FzJi7dO2/RTsqD9YZcOSz7dApCG6gaQHUcZBdlow+pPLIjJMF4tXWIEDBdxT6SF7
X-Received: by 2002:a05:651c:a347:b0:3aa:fc64:a92c with SMTP id
 38308e7fff4ca-3ae125cc73emr11313481fa.1.1794473038570; Thu, 12 Nov 2026
 00:43:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com> <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avMcB0q7wF9oP5X8@sapienza> <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>
 <avRttU9N0EZeq8nY@sapienza> <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avVPRySmoH_KKHa6@google.com> <CABxCQKt9o--KrucZ-jcG+tb4AGtrBnPY_mypqX64ojWRpoO_yw@mail.gmail.com>
In-Reply-To: <CABxCQKt9o--KrucZ-jcG+tb4AGtrBnPY_mypqX64ojWRpoO_yw@mail.gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 12 Nov 2026 17:43:21 +0900
X-Gm-Features: AclHuK8ZD51yIggX2ulMSfaDbMsjgHBr0y01lwFMAIyoSpiv0HXa-d3ugFJHB-A
Message-ID: <CABxCQKvPhvs5X+fej2gHaCJv_rWWPYciG8cUKVtxgSb-iFK5yQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?SmluZ2xlIFd1IOWQs+mHkeWciw==?= <jingle.wu@emc.com.tw>, 
	Yao Yuan <yaoyuan0329os@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?UGhvZW5peCBIdWFuZyDpu4PkuJbptaw=?= <phoenix@emc.com.tw>, 
	=?UTF-8?B?U3RhbmxleSBDaGVuIOmZs+W7uue2rQ==?= <stanley.chen@emc.com.tw>, 
	Vishnu Sankar <vsankar@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:14=E2=80=AFPM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> Hi Dimitry, Jingle, Yuan,
>
> On Thu, Nov 12, 2026 at 2:33=E2=80=AFPM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Jingle,
> >
> > On Thu, Nov 12, 2026 at 05:26:46AM +0000, Jingle Wu =E5=90=B3=E9=87=91=
=E5=9C=8B wrote:
> > > Hi Yao:
> > >
> > > Upon inquiry, it was confirmed that a black TrackPoint stick (0x07)
> > > underneath the red TrackPoint cap corresponds to a vendor that is
> > > compatible with the Windows ELAN driver.
> >
> > Are you at liberty to share the vendor name? Or should we mark it as
> > "Elan" or "Elan-compatible"?
>
> Sorry to jump in; this is Vishnu from Lenovo.
> I have now confirmed with the component owner and supplier that the
> TrackPoint reporting variant ID `0x07` and firmware revision `0xA1`
> are made by JYT/NDT, not ELAN. The physical check also identified the
> corresponding button/stick as white. It uses the same ELAN driver for
> Windows but has different FW.
Sorry, typo.
The physical check also identified the corresponding button/stick as
black/off-black
>
> Therefore, the patch should recognize `0x07` as the JYT/NDT variant
> rather than naming it as an ELAN variant.
>
> Can name it something like  [TP_VARIANT_JYT_NDT]          =3D "JYT_NDT"
> or something like that.
> >
> > Thanks.
> >
> > --
> > Dmitry
>
> --
>
> Regards,
>
>       Vishnu Sankar



--=20

Regards,

      Vishnu Sankar

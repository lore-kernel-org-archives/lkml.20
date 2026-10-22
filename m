Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792636361;
	b=Ji92NgOnmCEJNq5X0jLPpuPjyA1wzEd/IM0KdJZe49+0f9gDqfC6qN0opXQs61qVzmIy
	 xeJ+NOCzMo4hcx+FRdirWKKe1uxghjrOzgjMt5xh2bE0hJqSrDfCFRI6u8yDTDEFDWVYy
	 jE+38IIcvhpiGEg/O91mcwO7T8QrlUh/7zshX3rSvicj88oYOvBTcCRvQzdumGE6vNALj
	 yM4vuQwT/Gv6O2/QX1pMbUTgrt3xxngvCjmu1WlkGpBk+gkl/0DpkjaO/YW2rt39vi6iT
	 26cq4KDIMNf6MdUYcAKPnfc4RGiG7jw8VrmGXr8Q2PmnXlj+oPfl9CeN46y6zc/TwjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
	b=dDIzMOfPpS9E43o3A7QuXLHy18ZBdhGY81tgfTTSs2fPewm3nuJuscdTwTcj6GRk9a1R
	 j7vpNRSTnojKXyBqInKv0S08hfFJzrWd9Og8KS3+zpNHUl3R1o5eoAi64x0Ph9OLxKB1F
	 Ju6dVZyXV7oSBKOtdxhV2Ik6eyyO5EXnWMCj4G4OzKDrcjzwCQbR3nfWP0NJwyXt4DsMF
	 yfTymGBIY/RioaAVi6pC2cYjbWTIMExijJsZJtzCnD/57WM5KRkpqCP4EfT6G57GQ7cHP
	 Gohogv/8V2xGSWDQHizr0WKYEQdHJU43m8P7Hr1j4e99UVKO6Qi6Rg7KPT4oK/0SM4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWchPIps;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.131
Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28741606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28741606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWchPIps
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c3e0e38c8c2so44068066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792636359; cv=none;
        d=google.com; s=arc-20260327;
        b=F/tNPuAfgWin23V836wUxeF0NZL0RbYu13VYYeR8Lqx57o6J+9CY/4wPm2SQG6tqTX
         cSwic61TogF7BU9Zx/xWy2GPf/9VSuYqa0LhsLojt4zUATCuiZzvjboAqDWm0AjtLhDQ
         uZgeegygNdQCxDskpXpoz5cGZ83XBEdNkkPSfdLQ/PxOIhpjvjqDOhEjx8M8RDtxEx25
         E/+NUnXfRB/Ga6vEkF/ZNYsHQrDYP2qEe7xtn2nRlNDwNe3bp0FZgCpNqI6dCCq5sCoV
         32s53ZK/dFiz6WV0H4DkXMTcujZXfbIg8Dy6uYrBakXtml5QLlYmSzUCVNzcWYT/zQQ9
         P/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        fh=OrNBQHPNlSzXgg5/9GD2ejDCysR0k7aA5MLQFzBZPao=;
        b=LEbHnKRXoYas/SGlA1UW4znH4BzirwX1pOwgUliztJzG92eULtkyVtQjcr5isXq4Hq
         iCq0Y0BnpXzhwNkp6zv8uQFq8VZvrXcwZZgyTZ16X97DmqKNR1GKAxBKLo8u0i8ALUrf
         b6iaOJrtvs/DN3OihD/gSnk38RzlmSHN6hak7pB9x0AtWZKkCRcpYt8Q9/BDT5pLNT5g
         EDpXEhGD0KJ53jrdrfgkydyTxRdibUqv4kO2LTLOHtLdRgZ6NstwQEwvbqm8RFVVmyTJ
         Fmxgjvfpj/D7VkQ1MvcCMs/YUZbGC0l0u5U2vEMQymGlp07cNji75LcItwdUkpkRMOcY
         9FtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792636359; x=1793241159; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        b=SWchPIps0wF0LZgoDv8tkc2AmwPfkcYTGLPWl8UCwAj0a0efCcc/cmlHa8cLTYNrVm
         SIXuGF4slC7PXMR98oP+hxhoSX4497KLNSaLLLMyzaYZBmG87dAl9lPtw+KxRuo1zgq+
         XRcOoRJQSaM+lBduwVlI+j97aMMUkeiWA3rJafjnwfzyCXxpN/f9pPjCkLbYZU1Qq3T6
         4L1gsefHE3/yPALC/pN4A5hPGTozNUv3846ve/vtmT/lLlwucIpa0wHEovmA/EHTPM1U
         CkGbiYb0yY6Pde9BmNqqfcakOiGJucv9p1NvAwU44drWj9/onQIQ6IEfdFdtKG+uOPM5
         ucLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636359; x=1793241159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        b=nhPZfFnuqqeHDPxBvr+Ba+ivJmsqMd7uey/sLVDpEkr3orNrlXf4ogrdGljYU3ZQhD
         prC16cO9eNDSuZUwJRd/nvQokQAKpnWH2vG4raS1kkY7RgSLPcKi4WgTT04fWcqNPVMY
         XObtDOB6CLzdkU9gUuDUEiIW5sgTwxvtox5Y5QqMbsw1VAjnh/EXbly5B8EvbYGN+V45
         f1Ds7/WWc5teLCnRNPhRcQS93WpF4NCW8zA9FryM4FvpWzq4VWKjV2OyT1tL2VtKEa/j
         xzjpFWPPnuCbHueWaYUzgg6s10Y6zd+G9XITtL0+PpCDqhXwkrny30EQH6kJqjTbzDCE
         nOKA==
X-Forwarded-Encrypted: i=1; AKwUvBxJV1JgK5w9mj/A9yD6BOMdgx/WKlcxCbABkbzGcxjQvummO7AffXqdwiGOfgnEbP7z0eSDJStqHZzqiQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeF4Q0wTb3k+wqJlkxsLoYIkPwkXSry1WdWXglPkdOcroLSs44
	xddJg86UOuU4nyxE/IGigr6q7smRaNZit7Jn6kLwVIkIURmik9X0mOFubS+cYzTVFxhG8s/1ofE
	ocwNeP9anfHbMUgXrLfSzYUkNlDJSdU0=
X-Gm-Gg: AYBFou1lRIBRbVbywOhAFSFEh2K1PCFYCIC+9Zvs9w8J7Iyh0GMcZG7x57PGyVwH+pW
	ruKsVk/Txt3vBYY41j1CaKRBNLxAIOWVNrGrLjeXUkxXrgjFjiW78PXj77wpKJPz1Z349C8av68
	uVIVY0HwlNDanOYsvpS5NJ8+Rh5YEUZiaM5te7bfkS5tJRthlAhjsfCgPIbrBZ1ir0aEIUZPa/4
	Ah9whjzVLnTw1qVApwSc+R+5uBuS3UFTV5Kr5wMnpI55chhwMYjBg6drhWZjW3pxQNeqb2JlcUt
	lGsDw1SQuUzlLtmz1Lg88Ms8zlwFNwlJB3LfMz5BkhF2KDYqqjDyssa+DlYrp0nv40ud9FHtPAG
	PyEVB2ogYXcEUohVdVsbkfMBJgVcyRe6tLU7s3kp2OpehNT/5aAx/Qy/m+nCI
X-Received: by 2002:a17:907:9347:b0:c2e:4f16:fbf with SMTP id
 a640c23a62f3a-c4679797086mr354694766b.31.1792636359268; Wed, 21 Oct 2026
 19:32:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
 <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
In-Reply-To: <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 22 Oct 2026 10:32:27 +0800
X-Gm-Features: AclHuK9kgEi-QHylQHY7HMeWPzlEQ4T2NynHaEv25TGkNX-ohXQB3EsA_FVqaQo
Message-ID: <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Gentle ping on this series.

The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

The DTS changes are waiting on this PHY binding and driver to land before
they can be sent. Is there anything you'd like changed, or is it just
queued?

Thanks,
Coia

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889253;
	b=ZughVvxirlo6fdc2Mz3nKOJ5/wMj+bJOp7AsUXuUIz8U2BAopJKcqRhEQ/PL702j35BE
	 egbdsgp4o0GYoMSPDEAvN7F4XK46GOBo+1iepGHUiaStZICmHUdCVtEZcV0VMaz9zSLxh
	 pLcR28lsmlC8bD2Xmxs0lYLk8u51+uKIKI7RzvJ/aFtWbPOVoJS/VrFRKUldQQwgLX+F9
	 asttEpnvKpiIkBz8/B1P3HYgBMhMq03N+IiEz2cKu/zUZF0FWvrQFYZeOuhnanRSLN5E+
	 cHQr1GkAhFsR+wD0+HipB4DFVoN6f6StD5YF631YXIAzlv0u2qvxtJEbhzpEWSu+4Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eBSMLq0Cu1SynJnQjT0GgdGhFl16/3YHv9z0J8QstiI=;
	b=i3oHapIB7EqwoW0JpnE/vKTkxf+ZJ1OIhGGk4wKfylqiewzcVHMew43QqhcNM/OB3yes
	 Kq2t2Ow2y7bgFYdw+TR55XObKxyXryMC0WrWoUBIqyFh02FvFGq1kbnV3llL/bFrZRz32
	 QXqk0Ima5lZvkaZx5PaYRPcXxYwIRffjUsn/j/sfgtNfWBx83nVbMvoHG6zIkGVLcU+lj
	 E0LwJiiiPkw6rJehUy6nEXCyqR4+/2QNu+EjRR6P4MlECKS2+RJN/GMJh6rBj5TREVVkS
	 crdf1MStLsf3CnarZ8tCZj7pvirEmOLXFjApHchNkwZDAPRP+xq3PfxV4m/itc+RjQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fn+U5J+q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526E606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1526E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fn+U5J+q
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c450ab1483cso325407866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889251; cv=none;
        d=google.com; s=arc-20260327;
        b=nuOc7j+Hu2qfMweou3tYaxEKIyjtHFDAP4cecgc9uhZYV2gEd5GzhDG62T1928j58H
         cO2Yh5bOsjTD6TbGWMFKB4qB9eT6H0rg/kkzdLKfzNEjBgTmuXiVtyUqoq390FNtNzsD
         it9YN5hzMKPL6pI3L3EgWR4aD6HOa6lhL1PYv/N222D07sdMR4k1Npx+j57Bh2zdnWuD
         8F0Eqsda7uptmBi8DecSl8HCxaayjOzuDIHVRuPbT/6ATgNVZbBhljjut5T1ySgbbVlL
         p8KehHxTjvpx8bzJfswOcHuV2YadSkq+QuA71Ba7sDXXYLf2pmrj3lJCCZx1w89Jayse
         7vAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eBSMLq0Cu1SynJnQjT0GgdGhFl16/3YHv9z0J8QstiI=;
        fh=GmqAlC9z/a6JsWsFlOXZ8dnWVIwIG3eZQRE6Zw/i03k=;
        b=SBWIfF8jqZEUabW+cJnNF4TfLVrmuxfbl2RemDH3qJ3N8+bbzn8/Bne4dCJF1h+XzU
         nB3h+yb5ysEwSgMQVbSbsR7CoPBj340JG3+++7GpsGg+MCoZLlAtxRLGWbUTwG7BLQgU
         Gy0kr0q8IvaRjYMmZk3tmvNb6n4+A1AWAyFvEozQMi9/tUHc8Vc/3OBR1lDffhmzKKex
         r4IGJzsBeoYFBHxJ99LbdNPI88jEvECP2JE6bEyrtn5M8TMHMhVank2huAxKL/NkMMII
         c6jpE0iTAFdJBCd3lerPylpU7IcYRuTklfmKnQYV7zXklKp6MQyukga8LtkG7yr3ioIu
         fEEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793889251; x=1794494051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBSMLq0Cu1SynJnQjT0GgdGhFl16/3YHv9z0J8QstiI=;
        b=Fn+U5J+qza0f0zVWfDQpvwHfL7j9SJ4qtGbgBjH6baz+DktXPUSGubXFFXYLc7pA6h
         rlyqwf4kuZg40wM9eB6JhjaW3lOTIAEOE+bg+4s3+PjsSeVlQDXEq1Bk9Kb4Upurd6Gh
         fm9G4pdwkPb6g1KtBas36NcDQZAx3CILZK4n2AmuIEcAArbdGvVhvtciL7h1gzzR+1qr
         Hghgim7FvlxncFLfcJx0Qhr6d8cZvSnR2sp5jbB4Pl5feXIT9c6iiYBrvOpD60SCBYTE
         6ozzOnhhpOusmRc/tR0lj+xhgMsysIz9IU2Xl0OR4KztVscyWuN3nCyb+zEC1YMnmjZd
         0JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889251; x=1794494051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eBSMLq0Cu1SynJnQjT0GgdGhFl16/3YHv9z0J8QstiI=;
        b=gzofi7981INTh+gcQ6uzJX1lU3GLrt82LgCK/Ug3PvrrV1gRUDVQya4DoOPY/FV4yl
         OaEDhZhtUuEnv+Bts6C5J59aKpOyzlyIiwuh35fdte+MBaBRSZCgd7/FcuwnzDSAMUNS
         bPBnaryR+nPGScF/qK21iX3VERkspVrke5j6XlVDdlXfwPUuk1MFfrY77EWkZN1txBtY
         O8FAWmq9AiTlxdPhlqzFic63cZBblczntl4H5nFFNdNUaXgMtL/iZIWwAOn9Wzio3Gyr
         1nFxyTrlo/PYJSHiqVqcKOLSjcDq1oL3yX8LovC/5acSqO10bpJ7jjAtwJJMm0Hf8sBB
         eaAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGFL7V35+CAQoC1h38pI09KBKH/5b/dJ/lyWaLYAixARDlY7xUcJCMrhObiIUkIr5DIosD8cu7vNuobLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/umPjLRbrXEnhRKLZ+y4gRrjlJLS1h9GDJJn56fhcwYJPAMD8l
	XIczCt7xwWPBBjU9qiIePD/YhCVgqRB3P1oDzJHW4XPxEGwXb6mpD8b+szrb+LzAB2iRgQadKbv
	avVfPcZJIw/rb/ti91JQoh1YdFT/QVR4=
X-Gm-Gg: AYBFou0KUKS2+UlMUZD/TfCm1JZ+sjdtrbi1qgYMcLVtFPWmhbuljjVqtLTtE7Jpni6
	igvuAcCoXNumuNXZpTXv5BVZg8jmPonV1Y5c7bxf1aoEWpsOxU+THiEdyS1c6mKpDVAK38lbuB9
	G1+d+AIgCqwxOC4HJ9Qg8KiUMPIlGdrrfe5bYQPYVHEVnjNYEFf5tAH5nNlFiEGUXUOmn25IMM+
	PJ+Lqg6LwKuo+V1s1MURcAjZIuUJofZ9mkKnrpns/ueDh9oEDv7cBZfcLHDNNXTETFdmEqrUn5v
	HDLdura2A9uWuxL9Ib4R6l8Yab/GPW/lOFzYj1UJ5grBoTgaSITE+sUNwt/VKO2zmn36tPvL/Kx
	Afb5toza0t7JYAAazfVI3io49rWPGoU9HaMbADfBtvoFLK8pQdrVAI7Ss
X-Received: by 2002:a17:907:a08c:b0:c49:cd37:177e with SMTP id
 a640c23a62f3a-c4ca7ae9ea5mr1685184166b.48.1793889251247; Thu, 05 Nov 2026
 06:34:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102132903.713908-1-tommy.shih92@gmail.com> <7e1ac14e-b306-4921-84fa-8266b3263f2d@lunn.ch>
In-Reply-To: <7e1ac14e-b306-4921-84fa-8266b3263f2d@lunn.ch>
From: tommy shih <tommy.shih92@gmail.com>
Date: Thu, 5 Nov 2026 22:33:59 +0800
X-Gm-Features: AclHuK-34GTXXDn6VAAgsncXcgyq2On88P1RdV4SufAnBSG2fIKBHz6EgP79Iqo
Message-ID: <CABXpiCoUqhq_Jt8AWcZRQWue-pTvoYSGxNkbz7e5MLvw0Mjh2Q@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: air_an8801: add WAKE_PHY Wake-on-LAN support
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Golle <daniel@makrotopia.org>, "Lucien . Jheng" <lucienzx159@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 09:29:14PM +0800, Andrew Lunn wrote:
> This is an interesting definition of WAKE_PHY.
>
> Are there any other drivers which use change in link to trigger a
> wake?

Not really among the PHY drivers. mxl-gpy enables the link state
change interrupt (PHY_IMASK_LSTC) in set_wol() when WAKE_PHY is
requested, but it does not register the PHY as a wakeup source
itself.

> How are you using it? Is your device plugged into a manages switch and
> you are making the managed switch down/up the link?

I don't have a concrete use case for it. Waking on link change does
not seem to be a common way to wake a system over Ethernet; magic
packet is the usual method.

> Is the hardware capable of waking just on link up? Is there any point
> waking up if the link goes down?

No, the AN8801R only has a single link change wake event, which
triggers on both link up and link down, so it cannot be limited to
link up. I agree that waking up on link down is of little use.

Thanks,
Tommy

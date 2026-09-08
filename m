Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9FE525A60
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860703; cv=none; b=Jhp0sidFWxxQKH2fjvU1KjyYe/KYLkxJ7a0cssnCiLw9LOcJ1I5+B32UhzC08Al57ijrAxWOkBIup/mexnUIe7c1kMPheY0RomXQvUPSOKxufidB6RtVKxzqrhTS2sXtFFv3I+uXUgh9NpeH83gdPifUfLSnRsxlKdTdYIVVyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860703; c=relaxed/simple;
	bh=nPvXdXhz836eZhcoG7q2K7zxkrEoHotO4Jsb8CDlgGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LaOt1LvpBreChdsW+0XElvEfqopYshOmKIFJn7HsUkCODkTY/AwEOh0osSlLhpYXJV71Kiev8vlUR9HQBtVkGXf2BzxOG9EF8U4uRJPoW8z/fefJmwIaLz14HnWi0oiCvqdvmtHBLaS2W8LS1pFkAiIjxXZ015B22k98FBWloAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AW1zTNlW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5MkPsei; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AW1zTNlW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5MkPsei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788860700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VTIsVmfyzlZlhmHy2qsI6PXTaULkG55278aDJtKP0tQ=;
	b=AW1zTNlWH7faNL8MSSoNlj8uL+WvyZ5j24mz4bjfl3EIuF6Ly+W8vm340zv1uVwrpQ6dAU
	hVOkhlCqFth28qhYEjTKrsVBTG4c3dghTjGDDNfKw6/RUTaB7uolIUDGXn3mJPr3Ubtu+S
	8R+sBb1ZKwfgzKV+xb6Cno1/6zlmU3c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-BBZ0K3H8OAqLrPd9PYTQhw-1; Tue, 08 Sep 2026 05:44:59 -0400
X-MC-Unique: BBZ0K3H8OAqLrPd9PYTQhw-1
X-Mimecast-MFC-AGG-ID: BBZ0K3H8OAqLrPd9PYTQhw_1788860698
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4858f06e142so2173783f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788860698; x=1789465498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTIsVmfyzlZlhmHy2qsI6PXTaULkG55278aDJtKP0tQ=;
        b=H5MkPseikTD+oxF4GZu+SpwGtdFGy6SgAKexbcXKWtX5tu1o7ApKvcg9HvS40RuJMX
         Iox/mQRW9F2AbpS8sQ32252/jECY2VkigzLl2Ry3PCL8WeeaodlV17Gjrqle4lCzwXTC
         QONrPpJorDTp2jdLAKma5fwoP3XGmFuzJBgnih8+BKNXR2sfX5ZfX7u2pX24hEgDdD1m
         LwOZ0Ax6cPZJRhISMqSpl0Q/igfqRFas4H2Xfgjctd3OIzwYwCmZJZkkZWLIZPcx2Nqo
         gTxAV2SuBbkakE2rwAGh2zavBMQMfR3ddf3F14esStTctzQhs5PXpZDXbjxD3N12WY5B
         PIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860698; x=1789465498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTIsVmfyzlZlhmHy2qsI6PXTaULkG55278aDJtKP0tQ=;
        b=jQywpIYl0id7lu3o46GAkL+3nlVvzQitM8Ukw1zHcavXuVD1J0VMfKnfVqyoPyOPHO
         2hOh2BL5C/xYIN/t5XbisfCuCYVO6lBqGt+ysbWgk0yb8UrIv90g464Xz0PR5zwE5al7
         tVhXFnngLBySnHtnGPicrTm1kXAlvlsSTIxpd2aasaeWJomPLroxz8v5+0G0b3qObwkc
         gwJpERqC6jiafdLV5HkHaeY+lgC7K4Z+MFTGeMt0I9ukXJ62RsG1HHOrQDtrRJ0ceJLH
         bp+7QcHIaUHVd3HlrqH5zUyKH0ZE6w4rXPUBG1YmzvSV4IKM1E/M9TPeVQR7yD3X2F7g
         PDCw==
X-Forwarded-Encrypted: i=1; AKwUvBz4zRgFdkR1Gj8zYCNdl5hZXwWARe5yolGon8E/aVGu1FNJOpPvojBKmsidyRg4jNjWHjOzHdgZIR7sS1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nPyrua/79dtwIoqH9QQmB3Ye+bb/QrLX3/GnI6iFlLfFr9Pp6r
	A7v4QT3pMjAFaxty3pDwehDjA4FhDNIDotbuV59IreDj7RfMkm3O8m/6Qb/u232HjzFB5yuNLJo
	SoHe4mPlKpuHFLmREGmyJ1FxWSFuF9mFF8zu3ymJ+ljlneALoOVsy5SV8vKS+RjYcnw==
X-Gm-Gg: AYBFou3DaHz3cHC+fzyvIRBQn/8FLToSpzbM6bhtmCkaGZi828haFUhANsgpuvIVQVW
	t4xTDUVuwOE7sN8G8VC+OrfH8r+a4Kbv+J5SB+UfRFZB7k62D82ws7Q8DoF5NN4iSc8P0MW4DGH
	CCY6VLSLPca9ATmXhaUMt9GZFyIpPb1+Es6s6y2EJTKNiIGPlvxCPTl1oLkRkPXU7HnLojuSPnP
	vqNbfNoRlprM0el2DXaMD4NWArhto4dqamIGJxUCNOpMKbSxRo//bT9j0ieyGs6dZYPS2YW9F/B
	wHfjOvWPmuAcDpCu5SEdGwxuJJGOHJSds2TEDcFA9AILVcv6cwZmIReJP7KiA4S8Xu1r6soTYdf
	0w3fZzE1M679B9tAOGai3t6nMez5cnH0zQvGDU9bdq8oWKAeLDqpxn8bnwo/bzXpFslUAbGGe2Q
	==
X-Received: by 2002:a05:6000:2dc4:b0:485:8a47:5b8d with SMTP id ffacd0b85a97d-4858ddea668mr23106466f8f.42.1788860698316;
        Tue, 08 Sep 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc4:b0:485:8a47:5b8d with SMTP id ffacd0b85a97d-4858ddea668mr23106420f8f.42.1788860697815;
        Tue, 08 Sep 2026 02:44:57 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm34149332f8f.27.2026.09.08.02.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:44:56 -0700 (PDT)
Message-ID: <6cfd72f7-b6da-45ef-886a-7703027a55f9@redhat.com>
Date: Tue, 8 Sep 2026 11:44:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: macb: zero the link settings taprio reads
 back
To: Aleksei Sviridkin <f@lex.la>, Thu00e9o Lebrun <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260903123652.23900-1-f@lex.la>
 <20260903123652.23900-2-f@lex.la>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260903123652.23900-2-f@lex.la>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 2:36 PM, Aleksei Sviridkin wrote:
> macb_taprio_setup_replace() calls phylink_ethtool_ksettings_get() with
> an uninitialised kset, and kset is not only an out-parameter. On a
> fixed link, or an in-band link with no PHY, phylink writes speed and
> duplex only if kset->base.rate_matching already reads RATE_MATCH_NONE,
> a field it never writes itself; in PHY mode before the PHY is attached
> it writes port and supported and nothing more. Either way the speed
> read back afterwards can be stack garbage. The ethtool core zeroes the
> structure on every path into the op, which is why its callers never
> see this; taprio is the only in-kernel caller passing its own variable.
> 
> Fixes: 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling support")
> Assisted-by: LLM

Not blocking the series for this, but note that you should actually
specify the model you used.

/P


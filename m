Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321679;
	b=lMhwriKWaPdFov5OBp7KMLkrcVlUZsWMx9dQaye5ob863xDRd/jZZz16SMxB9aJh1ZaM
	 Uuluvg8khKasG/0RDhXeGRu+68Qxk49zeZGScBTqhXFjBkjlqv3dZDurQbNsTIUMU94W6
	 qYuaHc49NfxtE1CerRc+yqeswEWM8+IUZaw7NlOK/r7DsNfeXv8uON6ru2bzLECFHlzo6
	 0dApQdrpB0C0E5RDUz9kuKPl5vwvuIED3/yUtTnnjZ7aA3jp+90h0p19qf0dUatkVE67c
	 b6aLsamQwu3nIn0jmwywr+Cn7oVgjyuhkyYCxZZri79vnPWPao3JeK+8DZpvoYuv6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321679;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=;
	b=OXvh7m/HW++93umyd0zG6IfQw0bcwFa0stmf8Kzd1i7oB9brrUrB5RIgkQ5nfPf3nijm
	 cxzHKWwoe7xFL0EvZid5Mc6wTzNAm0bqJv1pFB8iaiwl3f8Rirj8BwsBTXcEs+Glwb2iL
	 ryFRMLBKWoFH+Nc5qz7MGHlSlWMKg/dRTzYCZFntjStsUTyUx7I19joAsvXnruUfOatLn
	 LnRzFCl4Y/cYNulz5yCYCwL+iKWKlypzqCk99+aCnoCwe9fGYwgE04v1G3m/rylReq8WG
	 esmvwC3UwgnjPiQqcWpgtxaF60ZQfc7sSf/LTuHY+TDOJbmTQy2Dvl/RDvYRzA6tvbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jOgLSzER;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=t4v9lJxs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F5606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jOgLSzER;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=t4v9lJxs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794321677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=;
	b=jOgLSzERd38dEI697TiSGkguueuN07KUmXgvFVSJ83v+g48ei1eHvUa+SiF/IrAlUj2sPI
	rc1RnfGlgmG3ZIpnibqB4ULGp98moBl8J3Lo0ERgD8o2gzTa7bPCRXyhnAJaQEjNCN/jlr
	A0ssqkWsXOawwx5uWa9yOokLHq1Drbs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-oTyfVjcRP8iqI1UMU2ZT9Q-1; Tue, 10 Nov 2026 09:41:16 -0500
X-MC-Unique: oTyfVjcRP8iqI1UMU2ZT9Q-1
X-Mimecast-MFC-AGG-ID: oTyfVjcRP8iqI1UMU2ZT9Q_1794321675
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so21434685e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794321675; x=1794926475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=;
        b=t4v9lJxsDXuT21EpVxi2YjYy5Kaex6++wgkV19OfuHGPOFtxZGQ2EHsQraHrI2SzD6
         RhYGkUGGBi8Ce73dgdimTxWL1SQBwsu7U1DhSXrTQ9sVYlLEhgrbjNiW+JD8olIPpGDv
         d5w0zFC7vv6HtfoHDv+AjoEz5J14bpyGXs+O0Pfo1z7iCo+p4PcfktVIlToS0v/9mwL2
         UHi3itNoduyzWLS1sSxTr+2+LdpIYv2PF95OUrwQ00hDjqyTKY58hbBw/A+DGU0iXqSr
         xLF/IRmSYRoOu1uvuBuk5olPlEv4oaJbiHuj20g3VqEV+KzKpNx9cXlTI1gmiXVaJ3gS
         phOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321675; x=1794926475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=;
        b=hlOImArajxASaYo/22duy6oyhe9B/iUTQ49QkKpLDcS4zZzvdSVRmuwxbwE9/coRi/
         2q5MFYBeOCAGH1F56IotFAx8SrLIzTqW/aBaLoOcC9IjwW5lehLw8kkBn1+W8cAGsgTw
         9M3fWMBWGGyXU9SlPWce/dxlVMdau/aDFlj8excEyH60wmgy8f4elPbHhFPEy1JPsW5a
         77E3ujtxWtAMoQYMo5XkzucQdu/TJWfcicBDMUX6jAjQyHrx6zRdNat3km/Rtt+c0oKt
         H9pKZGM+RaPVAoT8SnUWr33nOvyQghaq3Q9KKqpqDOOt3BXuA2z35P3yDAS5pksgKNHd
         zipw==
X-Forwarded-Encrypted: i=1; AL+hErGzVXygem12C33fgSyfUNOSV4cn+VolN7uPaMt790xqXZKqFLioB95UJ67KWCUUVNvA6L9hyssJAoCEXN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K8LEbYXidXGiPsE2MPKrvqnrjct38DqVGyIYKuGh3WmhJcDgB
	i9+vVrjSUUoWZVCkYAJ/TJtDLJkIoo01Pe9/iXUTMc1VM6PZYElVWx7otc/NJ/V/IIWKBTJesqu
	eaMtGNccG54OLA9HkQi6pTVa/qveglNtaOh7QazsKDhxO+59gfK2Xm7JuOgJpzwGtBg==
X-Gm-Gg: AYBFou1ZZVxIuj0Wqmr7uB6a2iv/OCtUUWDNA2gi2e4QCO2nWnnh+LxJi6X5k/pXJG5
	IEjxO01N4oj2R1gr7N31fxP+YSWa41GDETmKJClAwsSklSP/253Ek/cdKG8HB9Dqc9ykabisGCz
	jsuYlTQfhku/JJbTVH8kbx9XnGtVSe9Pjyj1FqkuIfhPsIsS0/rcOu9Svvijt4BcLdKZILWwFC3
	Ju8Z8ow/LFDKcvdaHXZVhEEKR3fc8HGo2WzfkGtL769o2MvU3H+aMIpijV2OHouR+Fx5eh19g2Q
	dbv/JSaFC7PygghWRVLQ1Hd1JhOIhY+iblVNCo060gA83LZDIiPtoP/VylqXJ1hLMjrJPDeyiwt
	ALaLA90HurmRGBtaRY37iMll0A45w6dxKFOgkl5MBxb8yeox6esf7lCyYf3TjR0S+Qtc/S4URoE
	aV6z9TBNKhXKjCoRIPwPDRck5afQHyXrMhz1PJJnLRRur3
X-Received: by 2002:a05:600c:190f:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba02336807mr53183115e9.6.1794321675130;
        Tue, 10 Nov 2026 06:41:15 -0800 (PST)
X-Received: by 2002:a05:600c:190f:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba02336807mr53182425e9.6.1794321674505;
        Tue, 10 Nov 2026 06:41:14 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm78127275e9.9.2026.11.10.06.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:41:14 -0800 (PST)
Message-ID: <1754e4c8-3b6e-4983-a7fb-d3444c1156c1@redhat.com>
Date: Tue, 10 Nov 2026 15:41:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] net: pcs: xpcs: make supported_interfaces
 authoritative
To: Coia Prant <coiaprant@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261102212506.3348537-1-coiaprant@gmail.com>
 <20261102212506.3348537-4-coiaprant@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102212506.3348537-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 22:25, Coia Prant wrote:
> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> index 6f0a110e32d2..25fdc9c6b72c 100644
> --- a/drivers/net/pcs/pcs-xpcs-rk.c
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> @@ -483,6 +483,7 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
>   	struct platform_device *pdev;
>   	struct dw_xpcs_rk *pxpcs;
>   	struct dw_xpcs *xpcs;
> +	DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);

Please respect the reverse christmas tree order above.

>   
>   	if (!of_device_is_available(pcs))
>   		return ERR_PTR(-ENODEV);
> @@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
>   		return xpcs;
>   	}
>   
> +	/*
> +	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
> +	 */
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);

Sashiko thinks this last statement is a no op:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261102212506.3348537-1-coiaprant@gmail.com

I don't think this is 'net' material, I suggest resubmitting for
net-next.

/P


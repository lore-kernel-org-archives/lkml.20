Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97CD477993
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245454; cv=none; b=oC0aqdVFIyl9+7TA6wUT4i4xWAGcl72ZuDwgAbZr9b2bTHg63of2J53wBC59BFFWY6YALUEpC51rBXUulFbWYNIz1Eh1VjyuoumdkEbOY9hI6ynXUruwxsRL+kvAndCGFe+sfPECL2oziwi9aXhaZLQkLarC4jtB+sZQ6aunzLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245454; c=relaxed/simple;
	bh=/I7sMKRC+Fm/RMOumClgldkrmS5D2N3LRxy0pszOg5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQnawdEcOv824XtFFM7V5Q2pkkcGBZI2yPkz5qZoZ/pUiXFwiUpxyaDVCOBXVC75oEdK+epnV9qhsy1gOvc9KPH7CePx0K2BQlqYxaSdMq5YcUEEBddgot1NMyFzkpx+d+9Zrb0p2bew4HYFA6VGb1aU+TtflvJyrdnEGEUssrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BRSsvSP9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=je/9Iry3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BRSsvSP9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="je/9Iry3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790245451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gKaCmlo8zL0/IT3A5NQAgJVMGj3NM0BKVIjo7Jj9JQ=;
	b=BRSsvSP9EAYfD96c3oIeSc76t4kgZXA719z8MqX7VCQtyeFVo+NIlqqtKVULOmdQYtNNWB
	7k42+m6DOxX7Ay9PsznS5U7181tkz5LcKIMLoFdwtaRjTqX+PBsYlAbEAC/e8iK3g+xboa
	/Bg83zsKUHO/LqLck0Tw4MA0MzGYFlA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-v0f8sJV2PzmJobM6O6zLOw-1; Thu, 24 Sep 2026 06:24:10 -0400
X-MC-Unique: v0f8sJV2PzmJobM6O6zLOw-1
X-Mimecast-MFC-AGG-ID: v0f8sJV2PzmJobM6O6zLOw_1790245449
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso16299565e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790245449; x=1790850249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gKaCmlo8zL0/IT3A5NQAgJVMGj3NM0BKVIjo7Jj9JQ=;
        b=je/9Iry31orocT+TydtDO4LoZoImemi5GLj1nC1oix0kHTLL2jw0ngFY3P8YL0kQhw
         2M5QM8UCyiznNF36aXWxxu1PDk4dEK26bWbcklHcdvMfilb/aDNvCHnzIGGEAKAF3tk/
         RMCjHM9bNYjelS7kgNnfFJnP3WQOth/uPYcV6Lpk9XYFizKGNdRatLAXTIE8Yo4vD/DS
         XiCyL0uAwm/aOWi1hV47FkbxLton4y7xnN/o8V4Q/8xWvQZEpqQPjU/qafacStuBDERT
         YikmMFb+RC0HRjPCxsjzYQkWgCHpiNXhgLEQN97iw56SO2mKx5Z9byFutvRM2ecpPZMU
         D0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245449; x=1790850249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gKaCmlo8zL0/IT3A5NQAgJVMGj3NM0BKVIjo7Jj9JQ=;
        b=fOgcM0l6jPWn7MyChvAjv9VyI8q/U+rWEDp8ZUMrAu876Dd89YF9aT3GYF15xwuqwJ
         kf8XJ35oUtEinPAwQ+dqcg/ai/8V0sXXHYYKaGpcDxcGyshcT0fpoqTRALspVUmfoVLN
         KMIqxDrdin1d19tMaJffpfLGCsFVi6RuY9s+vBlFKJFnikhNx1L9U6bPvGnzdsr4+EUG
         r1qqlkSuYzUf3vJGNtMWmPYlQhc8++zzE1XwGd9o+xieoO7CT3pB8jYP3tJiNyoYQcEE
         HneGwA++nhbYSGqyOIKqLuTbr96A57COdMelCjjDzDXZDksm0ZACzoNntFbgFGXKWvZI
         j6lw==
X-Forwarded-Encrypted: i=1; AKwUvByT6/xYqfYwwBGaFNGXGKu6nIhb+teCYKUVUMB0N0uBEtXA1dCVaDKxn2d0yd/xweqKLvz+GEaXkULuYck=@vger.kernel.org
X-Gm-Message-State: AFuF++lj70Cq2E1YbIthHmpHJ8s+/HtPyO/A4DNyvjmo02wGmwXatxyA
	FoTajweQRa2AB7kx2Ft5z5O1OYzhJo2ANdKnCI3z7h4lnOnbsErin80TfonvzvbOVa7Q/Nxn9Pd
	MZSBT8Y3YslStB3gKXmi7T+gyKpGmtxlHpm7CFY1Fo2668IQdqrAju94rQxY/VL3U5g==
X-Gm-Gg: AYBFou36nWHAdbRSmAgRyP7drie2DnHrpicegYVHYX4iiSSpHCFBolUC2HEVDs78Fyu
	l8b/lSG+jTBKMVei8/SyqEosqNHX4uCnTYyLy1QX0eVzuzNmDWUf0ch+XG4ac7s4Tj/kGSrHt1f
	A9Bxi8PgRihn0zF6bjhngzIQsJhG54FwKNYi1xw8KwH3HQVPBk9pczJdroxflTEYP4EtKY8oD+c
	F4ssqXS5qob14/ZXsS/S1hsxGHWexTL/MmjV1RTxCo/RZN5qK9rbCh8XS2845BAw0hyqfOIhUTF
	3dNY7edPd2QqytEHz6EPF8o0Nj1c8tAYfoM84bA4sfci1tkmt6VFQdzS3Q0HEmIYL1syxNn8xyY
	o/NxqAj5ByL0wBKBIFvs7/82aCegApFOfgVlEYO4fQ1sVG0eSyV5nk/98zXZcvKxVkQuJs405IQ
	==
X-Received: by 2002:a05:600c:3515:b0:49f:d778:be09 with SMTP id 5b1f17b1804b1-49fe66fcc19mr33137795e9.24.1790245448083;
        Thu, 24 Sep 2026 03:24:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3515:b0:49f:d778:be09 with SMTP id 5b1f17b1804b1-49fe66fcc19mr33137285e9.24.1790245447655;
        Thu, 24 Sep 2026 03:24:07 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9c59dsm52797735e9.1.2026.09.24.03.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:24:07 -0700 (PDT)
Message-ID: <4d5e2857-e6eb-43e2-b668-83e779aaa734@redhat.com>
Date: Thu, 24 Sep 2026 12:24:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: usb: cdc_mbim: add MeiG Smart SRM821 to ZLP
 whitelist
To: Ming Wang <wangming01@loongson.cn>, netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org,
 Oliver Neukum <oliver@neukum.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org
References: <20260920074500.826121-1-wangming01@loongson.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260920074500.826121-1-wangming01@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 09:44, Ming Wang wrote:
> The MeiG Smart SRM821 5G module (0x2dee:0x4d53) crashes and drops off
> the USB bus when it receives a Zero Length Packet (ZLP) after sending
> or receiving an NTB of exactly 16384 bytes (tx_max).
> 
> According to the MBIM specification, devices do not require a ZLP
> if the NTB size is exactly dwNtbOutMaxSize. However, the cdc_mbim
> driver defaults to sending ZLPs for devices not explicitly whitelisted
> to accommodate non-conformant hardware. This default behavior breaks
> the strictly conformant MeiG SRM821 module.
> 
> Add this device to the ZLP conformance whitelist (cdc_mbim_info) so
> the driver will pad the NTB to avoid sending ZLPs, preventing the
> device firmware from crashing.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Ming Wang <wangming01@loongson.cn>

Before any other step, please read:

https://elixir.bootlin.com/linux/v7.3-rc3/source/Documentation/process/maintainer-netdev.rst#L454

AFAICS this is actually support for additional H/W, just worded in
very unusual way: please reword the commit message accordingly and
drop stable from CC.

/P


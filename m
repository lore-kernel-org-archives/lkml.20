Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC952BE43
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571006; cv=none; b=n+cfUKWs9yfZiibfMwL4ooVsMASp+TnLm2Kypo/RLM0DgvpAO5scZdzRl+bivKBqRpe0/TCWorz4ymH1lEB11/iAcsaAQ7Y3P14Yu70nIrzV5rg3dJAQuL3zr3TTAdMIu8gcaDDB9Id2dKkGetHjuCi84rntn5eQ/FCHNf4htsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571006; c=relaxed/simple;
	bh=Olfv1cEj/Q2V2EfL0TClOBsolKlcE/xB12H/kkUWGJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUXw4XKfK2RZ3wVrWO86EQw854OjuJwlSy+7N+nkixzZHGjemuWMLrzny7cHal2BidQSWvyb7HRm2k9HVjsQtf1J4ItPo1T8yt35DpVcNZ+qeIPxlGcBfHJ9Gvf9nGIDqDB+shgvBLHj5dUDw9IiDmVeK8YSDwvBmge5xmkdTSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MqZnMWBh; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MqZnMWBh"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so695252a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571002; x=1792175802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j5KFGHzmm1JQcpIgDGRE5WvyzYcpsU0vk5ld62/+7O8=;
        b=seefUz3/GDw+prrH7Zi0fHDROJ54zJJzyszmhG9hKvRJoDLXLYwT3w7anoKqBSN/YH
         gTLeDDrYSEYWI5C6jeWjGj8KwyS6kGxUPSnIxAunk5afLHDYUwZS1DvX4f73uTfrXwqi
         O4gSDWmvHzcBnEZeIgaaGd6mGTGEN8MkJFeneoAElwkia0QtS9PI/pA0HvGPRagclsKW
         VzbIjkafsYJ7ZjBgDYq+g4vVnsDUTMxXnEowuN+I6MwcGZH2emi9ZQZaNRceoxVFM8YD
         PyX+zHcqSZ6nvznKjy5Y9wT5zXhMiNhmCM6B/sDJbh0SUaNuX6CmvFG+3NnfqROi8Xro
         1Zdg==
X-Forwarded-Encrypted: i=1; AKwUvByUWrT0fygI34qqus1kSvmZpM0ZJltK0e2c43px9B2WA7A581Y6MUmPOkVn6N7qRawzzw9lQ2umSx4PlP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/7R8j+hoTHabOAhUOmOhHp7i2wiR3yDhyL1b6hosT1HXtasG5
	iOA3thMDXsitdNdXLxqh15uaKu7OmM+f1G5OWq9Pq6l5ul4mjZLpM6YjPV3uOTbTebKkO+yr1YK
	6QjuJZu+wBGxdTvNXI3/9gIJDugsFml7LyDxACIHCB68oBIxd44PF63og2aLWjHaOIrMcQaJQYu
	vIn+v2bfGi2p6i20EK/PcOs0oIMyhBtAN7gpDWCgRUWVxPUlymisuF275uxJ1eb+DDBXSwipmoL
	dUDESr9bKtiPZYgLg==
X-Gm-Gg: AYBFou1ghlYGwAMgOh1BNMF3Iyqp5KeT1s3GQCNIMT/C+FX2XZxsNrvZCTfY9iRoQjl
	K6nod7d55E8Nj/FP8NOJRvilPi2TntVEea1D9Xk+8n+iJassiLrOearwgsXvWCi52t4i2xaVCQh
	oYE7LJiWUaDTWPAdwuIk5qAkvpmXvUFYg12yoNU3DZoTcbKdtA8U/d6FuvHn0gWpObqCRjlkItF
	d1hb+wv4Iaxix2Ft0jpJoSm+zH9E3EsErZssCqf2g9OEH3zFMx4RmmXMUPtkuZ746sD06v0bIjR
	p2LRMqR3IDyjvO27hJUUTchJrfbng77ujA2Kejmpp0QpX0n4aVtFpnKNcfzvSAYJ9h/J77Bopsh
	u4W77VZWvLHuJtahM7Ob+wQxI7VvL5qOmIr2+Dg4i+G39kXQ/MifLGl8iD5lcaOc8buW6+5Dv+3
	hBHR0ZXpHfoSzj++iORSyMAxNKVs9n1HusNOyh
X-Received: by 2002:a17:90b:1dc1:b0:3aa:f4af:1e14 with SMTP id 98e67ed59e1d1-3ab3ac7eeb8mr2628522a91.51.1791571002313;
        Fri, 09 Oct 2026 11:36:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab36d74b2fsm1486258a91.4.2026.10.09.11.36.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e767948f7cso201095ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791571001; x=1792175801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5KFGHzmm1JQcpIgDGRE5WvyzYcpsU0vk5ld62/+7O8=;
        b=MqZnMWBhFqLZowapV+6rlOE9Hegh8ses07klmtGIzk4ARZ142g9KRKzHoODnFUULn6
         UIXjuwfcSsYQH9gnd+3Hqkx4Qsb92Rtpg8NGEzCSa1cDqBMNV0MhTezj+/97MvHEDjSB
         cmgmBBHchVjGS6jwmRjJoucRAzh1r5fOw6Nzk=
X-Forwarded-Encrypted: i=1; AKwUvBzEr53hdp5081JrSVL+1kgIvFPTyGWE/1HDGfrhmwVpR/6ud24uWGK5ChNu/tHgwTfo94LA7p7ckeFKcJY=@vger.kernel.org
X-Received: by 2002:a17:902:ce0b:b0:2e6:2868:e572 with SMTP id d9443c01a7336-2e84280a97emr27659365ad.6.1791571000865;
        Fri, 09 Oct 2026 11:36:40 -0700 (PDT)
X-Received: by 2002:a17:902:ce0b:b0:2e6:2868:e572 with SMTP id d9443c01a7336-2e84280a97emr27659235ad.6.1791571000435;
        Fri, 09 Oct 2026 11:36:40 -0700 (PDT)
Received: from [10.14.5.199] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm14968885ad.33.2026.10.09.11.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:39 -0700 (PDT)
Message-ID: <5e07aaae-b9bb-46db-ac22-bf8af3aee5a8@broadcom.com>
Date: Fri, 9 Oct 2026 11:36:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 4/6] net: bcmasp: fix OF node reference leak for
 phy_dn
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261008210621.1374785-1-florian.fainelli@broadcom.com>
 <20261008210621.1374785-5-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20261008210621.1374785-5-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/26 2:06 PM, Florian Fainelli wrote:
> In bcmasp_interface_create(), intf->phy_dn is obtained via
> of_parse_phandle() or assigned ndev_dn. of_parse_phandle() returns a
> node reference with its refcount incremented, but of_node_put() was
> never called on intf->phy_dn in bcmasp_interface_destroy() or the
> error unwind path in bcmasp_interface_create().
> 
> Acquire a reference on ndev_dn for the fixed-link case as well so that
> intf->phy_dn consistently holds a reference, and release it with
> of_node_put() on teardown and error.
> 
> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
> Assisted-by: LLM
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>

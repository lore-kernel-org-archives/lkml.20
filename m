Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481616;
	b=QKaROqTkrIkxdXsZI2zB1mMZ0GY2EZnc1K0i7qCvL4EIeOARGSR4G6/sm8QX5QPYxLd5
	 pczbMf+1RjHEOGOgdqEfYksZyNAUcp/KF65KahkYxzvLezEywIlEQaTWvCPnV8ybQ1xtm
	 v1f7xwdIrcdK38T3amrpEiH2Ls9hpsQaGdkFwWlRavqioUPF5qjvkVZs9xVF3yoYhPsyz
	 Y9YojQnHWSzsiWou+EkCzU8SyDVw3xTnQoHIfyJ9Kp5bgTEtskUN96a+nsQgJ6pca/lK9
	 NAFZQApFM9GzvNvJvXkMwFM68tEFhAHkpq2xasUMU4LUtP1jkxM2ygwjmzPXu4dXlng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481616;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jkl+rtsdURDObBSi0vgDZpi3RyOFjXWoPZgIXkAsj7A=;
	b=CLtEW+p4xx+YFvmDMROzg/7IxXEmlrFgoVJHc1r4YIJrhfrrtPQXqUM/tjIHa0eHqlWY
	 Pn9rgrC8gc9plajABp+WLri10PAi8TaZHw3yz5/wbF7DkHnUMkVQtpMg4IsNo9EGCaC7J
	 sMDjojeJyPZkMVV7pByywsVSy6C+S8bLL69ULjDKLlj52Q6wBlE69kIRWCKTJCwmYq1ex
	 eVBO9FbBnp+WJ8+MhFOvPijBTu/ZRgvp3i9pIHv6uuotk96vMdYMGR3Q4XIm2RvfAzoJU
	 a9g652T8Jz6zSqioyCllm1Wf1Za/kut356F+6p4Fb8kXyktn8K0CoQDyiGemsLJV0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U05L5wnC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ayze4ztQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADB8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U05L5wnC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ayze4ztQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794481615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jkl+rtsdURDObBSi0vgDZpi3RyOFjXWoPZgIXkAsj7A=;
	b=U05L5wnCqKNKCabIjLs3X7kB2xZUKavMM7/Lta+AlC5IhM56JpL1HJyCxwPo11lovlVEc6
	DyeQXFyDH24xUE8/Y42DeZa0CtTW2Gx7tki+ecZX7THUC+YkGcxziAq3AwP9RjYVq58MdV
	MuQbIBTjs45rCPMonEWgBw4Rtj1dF0M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-NfR5TjUpNmmOX-Fsdc_1sg-1; Thu, 12 Nov 2026 06:06:53 -0500
X-MC-Unique: NfR5TjUpNmmOX-Fsdc_1sg-1
X-Mimecast-MFC-AGG-ID: NfR5TjUpNmmOX-Fsdc_1sg_1794481612
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so30986145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794481612; x=1795086412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jkl+rtsdURDObBSi0vgDZpi3RyOFjXWoPZgIXkAsj7A=;
        b=ayze4ztQA+QisQAQKoIp6BxYy7yIeln1fLI1Bxpnh+14J9eHN+fzPPKxMJrtg1zsfh
         LF9QLyJtCzy0jSp0Bx9nhJP5AINvC/bxkSevQ7zEFwFAzk0JU2SQUpbiCjAFOcpPo8J5
         LsuxCUCn3aQS58Sz1VWwqPUeLY5o/vllCD9rfP7hoBvmD9aHrTsLGTSTJ0jrECS3t/nF
         ZUQMqpdUQKQCsrMdEDuTT0yszTjwJTdtGSVPUYWbVSerqfEmqRUE6Kfxzs1VJCX5WvXh
         X//6V1As9hw4xvDLk7A3eUJJadr+xd6Rxt0ZFKNEh5GrCR8E9UvJTbyQbo+UIGMfLIMW
         ShGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481612; x=1795086412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jkl+rtsdURDObBSi0vgDZpi3RyOFjXWoPZgIXkAsj7A=;
        b=Mp+w8v6QF69dfjrRPD4ki3vFqgkOTU+PViQis0UpYwcrvh8AiNq3gsedAoVXn+iddn
         T1sVbEFzO1y77QXi4cawitZILd4BbulIJLmeez+2z6odnEN1oW4e2lo0Yze6D2vI13MF
         1KmedYZJPIiI63W5dHxqMkT7Vdu7BDXAhY/+VkLoG4KGT1eQh0vgsdYnqQeZy4Bjf2L7
         I8S5D8ZNmxf2Jwjo7Hpm++WxNGcQ11/p09ufeDGz2fGOrbN+LfNUTa4h5To+QLfxg7tX
         qTPPLj29hcPckxfb5+LtfpJD9C2v6D+mf5Kn8ndC9o4jUMeo26AolVSsYMNbZOHcTQcU
         XVAw==
X-Forwarded-Encrypted: i=1; AL+hErFXw/ixmle/BJAsLgQAMwcWWmwKpiklc+hb8ddPXZal3+rveaZ3BVO8qf0r/AwPAFjv+gG7R7Q/V72H5Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ngk4ycHwM0kRFrmm/3XmflNsiwMJBeuw4Mbw+VX6YV7uWV76Y
	b4YPpE28GfxoxjNbJhWHIsoNS9MZRUWZAXIsZEKUtJEF7V4ibEWG4k+j22eqoATc0UvBVmi0OpT
	Y97GRr94c5iN4I1Xn5XOBK8mzn3w815Kqw4RBHNTOF9gX02EDjgxrwq8AFtRgNbVIIA==
X-Gm-Gg: AYBFou1uC2F/mtChTux0BZi65NRgx+DekFdaPuyhVDAUwUHfrxDWeojgadHRtfJUX3Z
	mMIJpbznvaBAhRmI1auelOCmpwdTa8W35fsMzyB87qhFpYeAptah7ljnxau7yY46Aw/Eqtv9qBQ
	Ku459N4Xj7Ljztb4yO6mUSKiqiRAicyvvuxisiQH0Z/M3h6yVMYa3mck5znaCzn/zJx/HAF/8Qb
	hxcb7fq2bn6NKzPljS4ppBxt4ox531eqyNANvAE+ArQx2YnRD5BF773IFzVHrXI1BWaPTQqCw2S
	HAcgWrXFBBKDYtPJ4JCUiawdR+01Z6+pMXFBQMqd+XJRNRxG4uJP93gw4+W0PLn9+oYaZ7K/qf7
	IXkh0MntJaHXpnPDi1owWUxoSrmND3OhM2hTeM/7l3A0uI77t5eGj5OGYZXUaVz61l1uBwQYak2
	OkXhIhzCDtUXo+XzkQRMn0KzindKZUKrylP29BQpQ/qL62
X-Received: by 2002:a05:600d:c:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ba093be23emr82662515e9.29.1794481611720;
        Thu, 12 Nov 2026 03:06:51 -0800 (PST)
X-Received: by 2002:a05:600d:c:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ba093be23emr82662225e9.29.1794481611257;
        Thu, 12 Nov 2026 03:06:51 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm70550895e9.10.2026.11.12.03.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:06:50 -0800 (PST)
Message-ID: <a8cbf073-c242-446e-85e7-6cf9158e0b9d@redhat.com>
Date: Thu, 12 Nov 2026 12:06:49 +0100
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
Subject: Re: [PATCH net] net: ag71xx: let both QCA9550 MACs use MII, RGMII and
 SGMII
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261106221607.16215-1-rosenp@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261106221607.16215-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 23:16, Rosen Penev wrote:
> The GE0_SGMII bit of the QCA955x ETH_CFG register selects which GMAC
> gets the SerDes (QCA9558 datasheet, 10.8.1): when it is clear, GMAC0
> connects as RGMII/MII and GMAC1 as SGMII, and when it is set, the other
> way around. The driver only allows the second layout, with SGMII on
> GMAC0 and RGMII/MII on GMAC1, but boards like the TP-Link Archer C7
> use the first one, with GMAC0 on RGMII.
> 
> Allow MII, RGMII and SGMII on both MACs.
> 
> Tested on Archer C7 v2. RGMII on port 0 of the switch works.
> 
> Fixes: 0767ec042897 ("net: ag71xx: extend link validation to support other SoCs")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
IMHO this is not net material.

Applying to net-next.

/P


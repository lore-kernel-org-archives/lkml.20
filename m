Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696191;
	b=HJgAilUSZnJdG2rx7tbwYjV82k8znpfousKN7FpsVB+jLfvk58+WvW1gOxIbxcF9/0/n
	 bAtT+zUvAjU226Yw0HHjifWxMtqbJSOwPPowDcV6IGgczTT9aYnsjBB/KfzpXWLnGauzv
	 jM5s8RM0//i+rCFhBEDGEfy2UKH1uS6AcGsGHBxVXp/fE0/0cesoyK9QTVAhJVCCSFi8z
	 4ip04TRXroulN5lxeXhx8rP31mzklmF5nxM2FXccTxbSLgY/N7WhcFnIHDxR3SVnD2Tyi
	 X+R8Nwn+Hd7XEiCIzWPEeSiRbwLEEsDO+h0GjPe5A6koQHWxR9gvr+pDFe/2xIEUCgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696191;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0eq2D2jYQoQcNB0A0YEhxE5qSu++X2zrdL69lZRBaaY=;
	b=u53TPdVG7NbuiqdRqe4wNOPjoW2odAL1F9kgWWhRRtoh4bAG+226MgqaIm8P8/nsvxsr
	 BvTysVK91P3JFftdqxpyRlYCv6/eza49G4ePFNMd92rhO8u9xolDzwHV31P4jVjVISF9R
	 ZODllLcyUIdfbnUbeOzHtpexBtYA2h5jMDoxB6MiJS2/gj36ccEJYrxDMtUYFV7q5RQe2
	 buiLeBZPy11UVjPJBm/xiCkMT6PoQvrSbwRcIBEQFN+wJx306VWICaLDk0Z2iyui65DIu
	 ZOCygFBZcbgS8ONi+y/yvfsjNvkhr1OMsUNuKIvrDiiQlTQHb5LMlrgqXqf2no0fByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I4iPZ1RG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Q88fxJgs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C61606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C61606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I4iPZ1RG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Q88fxJgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793696190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eq2D2jYQoQcNB0A0YEhxE5qSu++X2zrdL69lZRBaaY=;
	b=I4iPZ1RG2gTiwAT0DLwOylVMB7wodJ6mcvfcNE37oXUzzmsLDI1G6a06oGoFcKG3AiIHXv
	1l3BWLfpli10jqtHVuIJvATy1G6PV7/AAjIxqxiUpWc3zuvQRUOo0HH9Jw5XwI5wm1+PrM
	S+uvywORUEFZuvVBIr8TpE7ZjOjLCuE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-QmsjHHdgNjee_Wjmfnfxog-1; Tue, 03 Nov 2026 03:56:28 -0500
X-MC-Unique: QmsjHHdgNjee_Wjmfnfxog-1
X-Mimecast-MFC-AGG-ID: QmsjHHdgNjee_Wjmfnfxog_1793696188
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso33273985e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793696187; x=1794300987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eq2D2jYQoQcNB0A0YEhxE5qSu++X2zrdL69lZRBaaY=;
        b=Q88fxJgsJA4E0kXmoHEzxKAQVBFcDXBz+8OUN0wBDR7hK4A74Ax6t5CHgVkkcbx04l
         Xs9gl9jYaRfreUu+5eUgCye9Y9J1iLGe40CWCuEfpAuNUcL+PpQ/omzGcO5fEbIMOhWe
         L9lwis0Y4wZDcoYP4sShDhD23YKA8/vNYNp4Zzx5WcYjojwIrqc8gpaSPLo0aObyG1q7
         f/6INvJRwP4snqIs5DJvi+XoMqeXoS4aDIkXyt+/xLRPLqxXypHGgF2Ue95s6Sbgx/rD
         FlwZYuwkhFqIZCJbBKnKatPw6ks3c+/6E/RtInyRHtLttw534NOxp7UPOjMPn5kYyWzr
         z7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696187; x=1794300987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eq2D2jYQoQcNB0A0YEhxE5qSu++X2zrdL69lZRBaaY=;
        b=fyrjmHp2XFMAbiXIw2VUzQp6wOESZ833cZuQHI9U+Hs7vrGSHgXWeePlrhH4mFAQEU
         D8eV2PMnhST2J2EbAEb40HhCoOjYrUlDxT2bImaHJEhilm7c74x2CkSkMPzQc437Yl1x
         BYpjEZIhPwHksKGsgL9R13r+43QEHLbGL6Y5wUVbCS7PPJh6k4y+imjhhLF3R1X0JOJm
         pbK8KKJK8f0q4zCRENly8vH4dcqE/03W9dcZQ0Y7+zQh5qVoL1pxOQOKVXwNojXTOr4q
         9ZEjfNWK1X26qftAuiZphobjt2jqoCt+DUtYE68SyPUvMzoA8gjbf5OGhuxU2XMTZvuB
         YoJA==
X-Forwarded-Encrypted: i=1; AKwUvBzdKpSmQcl5tn9CjNjWcX3/ONPj9PVdFXyQ92uJOpcMv9OdvTSsGIB/h82kRevsdGt7y7t0HwDF4zADt8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gAEg95uyW6EHpGl9+dEKVEMjCocVD5uRnInrxEsa687zrB25F
	YsEHY1j7DGw+YHE7cE6itR2ZCu0OXmmbH2CS9KpS3MPolUSBYZKcMwhHXsFWOG3LrvKuJmGtaK7
	RJsl9FT1gcRyPxzqMrOtxzw2KARKzl4oEwlh8aANxe/Dy1irB0cug6MBVflV96TBIgA==
X-Gm-Gg: AYBFou05TpBAtbxutRBv33h2eQFhVouhgGxjkr3CiifevzYDSPM4HQqx4W1Cm7V6ixe
	TXRz2tKHRVcwn3KuVMxj6itYeYJc7ddExY9vTiKG4p31uCBw6aFfjigLplIQcMSXMZtwTTvwMAv
	YQOts9PWbR1xNP/UGjOqz0b3B8EwrjIe3MmtX33gB72lvbX+Ik3s/9fp33TGmXr4AKckWSM4LeR
	2iHH3PrKodi+Ea2mSsbsNtcR2h67tELWdv9scIBrN+XXnW3HyV0I38q+CTMrVby+f3mXDZro51A
	Iussqxps0WspJbUjny6X6kr6pK36V9MswNYAt/E98Y6s3q/tSkQXLAS5tXxh2qwkdYWF8J7aWBm
	LYPozmeiVy8IaZ4x+ScF8fvSfaG2FKW7pJzwvDrpqw7LdDnzCZujvgHlfDjBaVUmKSVaoT4h0a3
	JKuSIAVa2LW/90fAc0ehQM3RWCNx0lQ297qhui06O9Uog=
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr257502005e9.28.1793696187584;
        Tue, 03 Nov 2026 00:56:27 -0800 (PST)
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr257501695e9.28.1793696187165;
        Tue, 03 Nov 2026 00:56:27 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm433231295e9.1.2026.11.03.00.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:56:26 -0800 (PST)
Message-ID: <a2ad86f8-1e4c-48e6-8cd3-4c43d73dea3b@redhat.com>
Date: Tue, 3 Nov 2026 09:56:25 +0100
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
Subject: Re: [PATCH net v3 2/4] net: phy: as21xxx: fix read_status speed
 handling
To: netdev-bot+sashiko@kernel.org, ansuelsmth@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028073024.25175-3-ansuelsmth@gmail.com>
 <179335632134.3134.7804602022043442736@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179335632134.3134.7804602022043442736@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/26 11:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 5 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] With AUTONEG_DISABLE, as21xxx_read_status() no longer takes
>    speed/duplex from the PHY.
> - [Medium] In autoneg mode, as21xxx_read_status() now reads
>    VEND1_SPEED_STATUS on every link-up, which is the PHY's own report of…
> - [Medium] The new early `if (!phydev->link) return 0;` in
>    as21xxx_read_status() (drivers/net/phy/as21xxx.c:732-733) makes the…
> - [Medium] In forced mode (AUTONEG_DISABLE), phydev->speed/duplex hold
>    the user's configuration.
> - [Medium] net: phy: as21xxx: missed pause and <=1G speed in
>    as21xxx_read_status()
The above ones looks legit to me.

/P


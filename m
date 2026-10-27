Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095375;
	b=yK8AM9U4ZcttShXlizdZmsw8mHvDTzCla8POsIRbrorXkC/C13I0pYULPXQFSJTusyM4
	 R1ccKSc5mrKecOkCK3jfjXlX6qOWcWK1AnZjH9gGfFc7ytxI9Or0MM3yNvwe5+xlScClr
	 PqXbZA5Tje//MXTi2vJxRL3FiMn1GC7yLSeRkorgD9o1jdtD62LRxKNyYzwXSWHDTKyK8
	 fQ/8MO9XWQ9ERPymzptPdmr/415lCxaKLSGTuvS7TBgF8LX6r4tMk1hz+8aUg5lt9c1wO
	 +BPsRVqfBg4c9XENHp/pZmu676wk97RFWBZy3CHHDYkGqILUXoTdMbhy7Tt++yN/HYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q9lVN24nJh91Od/QYZ2Ns5Zk2L2QYYH7vXm1pHzeCnk=;
	b=tCY9pEmDUq89Ece5trx69lZFsGtCVGF/1Z3E5ZnER2vVNW6nEdxVdv1bsReITnx4lXj5
	 GURC+ngDE3gU24Bw7QcpshKRSNSHIxnWTPZDIB0FgecDf3l+mww59uvmkdKOvgCiX41Oh
	 /LgwrXpc0Qwhr4kBrrnP3WyMWavmawFvD2leSpkhpD0WOzSFBB6K3WpyY0mMJq9BLPrNN
	 qvWpATs49jpnVKPdj68bIdsqsSZ2ehVzKHD9YQ8APajBfkIETNtIKoi3vvkRZm9uSdmnJ
	 m9wYy3epRDrH/Ue+mo/Y07r7aVUZaJ613RTtbu11WZRHee8rcNx+poiMAPJnOdC+rFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Bbh1mXA2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Bbh1mXA2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27758885e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793095373; x=1793700173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9lVN24nJh91Od/QYZ2Ns5Zk2L2QYYH7vXm1pHzeCnk=;
        b=Bbh1mXA2WsFPVuJBbfUZV9bB7+bP6XSc/Zjx4X7wCLe/AlkqhIj/niiwtxWf97e47H
         /UCs0gaj9mKsC3CCgKWF5EAQMBjgOQpxhO41zg0fzYM3joC1/cvk/JIs+YrEritqR4hg
         DWfrrUB13zd4SsZMx+Q9r+YdiU5YpivcnfOkREx9HLJvTRffeBj52+6YU0hPu/FPzyIx
         CNNDEh/c6D2l+NNWOeC7XL6dj6tq9a48cd3Xk6m15lRmQSv4giuVZlQCu69ASrksuEpo
         jG6MVrRJf8LPsUcz0tlYDtmfjkuc30TZHyfrDFBN0SbR1MwUcKclPqwYurZyrguJsQAB
         KJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095373; x=1793700173;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9lVN24nJh91Od/QYZ2Ns5Zk2L2QYYH7vXm1pHzeCnk=;
        b=oe4x1VHgUrwVHoXo/ta7vpyhUXilRTbhA06hqARaJqd2sW43DmRG71RFTuVtIq7miB
         kSYTlFOJFpnJQXgIB0AHRO8QjtRGEFLEwESqdkn8313RfEcPfdQQQU7tpHdH5MRLKKaH
         dhpuviUjDlz6B9VTT19cTIF349WUyyG61GovbommFLco1QDMwgtD8uq4lfadYADvNWFH
         nO4daYuBsMG0qTE/Oc0eA0WLkFTfYg9rnE8nvT1/0GJz6De3noM59h1sQVqUu3uOSMYt
         W1Tla6V79fnssoGJQa60P+HrVZGpAB3WyAopO5kP50MHzV+0D7eKouTu14pde2RrOlV7
         9K4A==
X-Forwarded-Encrypted: i=1; AKwUvBxNvD08V6AsXKqV+BZxe8DxQ9R+vgIJbO/E/yV55YSARTUQ/M9ac+jRk/DPqkqQguAc3twBIGyydesbH3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYRLAoEWoQwpaYsj58tKW3s96xsfKxELmW+R7XijJGv07Q4hOh
	jHuW2jXxSGmx6GeS30Ke1Sg5tncL5fyCjJpI4KH3IVykmREeN+mRdWL/aouHAUQzhG4=
X-Gm-Gg: AYBFou2Bsy2K1f7D9YDIYzyidAYhGyNGcLgTWPeRxpfiKmDOmoyO6kawxdcYIwKY3qc
	CPl36OCmMbM4zbudUH552ds1+17nOtB1FOKZ0xxmpCSejAF7EtkU39U+pB6bN1TxUrrerqiHSWh
	HscT2WFKUDUvcDl7Wj0Z2oT+GDaHdLrZbPg8WKQHGGHR4KOGWW/6IzJm8dvimkKGrSRg2p1htwX
	Vew6EEiUYxvl6bPxL9mooPa5n4BdwiHG5EFWOMtuBaHttx+GQfqf5u9PSgMtnN6u1NwZNb+nqDT
	lEC64zAF8qJfEGJz3rrs4u054rdYg0RsLzUZ5WaPoYhLw1DgSi2iNo3yTNmq37/4oSMwqIBugwQ
	kVokSKXi6GZ6BENGnXkfMy3gQ3Rv+aRhnxC0I2wSURTcFdofRrvy0iCKpsbelS8+LIrrW1DW35p
	6InOBHva2wJT5CbJdpxKrYN0sF0K/gzJE6XYB5RHzM5E6nWlho0nCnr/S40XNS8BNR0CILIinMc
	LgBPqP3py41pklEj7Cd3jMt+YarVA0Vd+jYA8RRVuoUrVmFvOiefhAQGvwa9ADMZuv4CfrtCVdh
	RG30/Zw5Z3WHh2kPqZfzbt5tNZ4ZYw0=
X-Received: by 2002:a05:600d:82c5:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a7ca0f7e06mr41589645e9.22.1793095372108;
        Tue, 27 Oct 2026 03:02:52 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm318071495e9.4.2026.10.27.03.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:02:51 -0700 (PDT)
Message-ID: <2774953b-daa3-4f24-8515-906b691bf5c1@blackwall.org>
Date: Tue, 27 Oct 2026 12:02:50 +0200
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
Subject: Re: [PATCH net] net: bridge: netlink: do not clear the vlan info dump
 error
Content-Language: en-US, bg
To: Linkui Xiao <xiaolinkui@126.com>, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org
Cc: bridge@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linkui Xiao <xiaolinkui@kylinos.cn>
References: <20261027085200.1501599-1-xiaolinkui@126.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261027085200.1501599-1-xiaolinkui@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 10:52, Linkui Xiao wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> br_fill_ifinfo() assigns the result of br_fill_vlan_tunnel_info() over
> the result of br_fill_ifvlaninfo() or br_fill_ifvlaninfo_compressed()
> instead of only running the second helper when the first one succeeded.
> 
> When the vlan information no longer fits in the skb but the port has no
> vlan mapped to a tunnel dst, br_fill_vlan_tunnel_info() walks the vlan
> list and returns 0 without touching the skb. The -EMSGSIZE is lost,
> br_fill_ifinfo() completes a message whose IFLA_AF_SPEC is truncated,
> and the dump carries on to the next interface instead of stopping, so
> userspace silently sees an incomplete vlan list.
> 
> Only fill the tunnel information when the vlan information was filled
> successfully.
> 
> This was flagged as a pre-existing issue in the Sashiko review of the
> net-next series, which noted that the VLAN fill result is overwritten
> before it is tested (see the Link tag below).
> 
> Fixes: efa5356b0d97 ("bridge: per vlan dst_metadata netlink support")
> Link: https://lore.kernel.org/bridge/ed1de95e-e112-4076-93f0-6f7668e657ad@blackwall.org/T/#u#5
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> ---
>   net/bridge/br_netlink.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
> index b2cd4e39326d..8ed86bf71a00 100644
> --- a/net/bridge/br_netlink.c
> +++ b/net/bridge/br_netlink.c
> @@ -540,7 +540,7 @@ static int br_fill_ifinfo(struct sk_buff *skb,
>   		else
>   			err = br_fill_ifvlaninfo(skb, vg);
>   
> -		if (port && test_bit(BR_VLAN_TUNNEL_BIT, &port->flags))
> +		if (!err && port && test_bit(BR_VLAN_TUNNEL_BIT, &port->flags))
>   			err = br_fill_vlan_tunnel_info(skb, vg);
>   		rcu_read_unlock();
>   		if (err)

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

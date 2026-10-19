Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C30E4CE685
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408763; cv=none; b=kVVLn3shD76XaWupn6mWu3TD9Luk7wakGqaB/biPXmLuFYPz49MnDJiRMCTd2SRBa1k1rV0xn4It6yuLH7bukzvvClTFTcdqGMD6Fr5o66K6v2IZ0+/avbMY0b3k0Pu6dG7UPOAtY7Fmdve5rwe+I1GHeNQ+3MoyHF2PeeP52Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408763; c=relaxed/simple;
	bh=0wYYm4Y2+8dNXMXPj10AzLPIs6v8UEuEBCpe4Zsa6Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ll+CLKMZgDjUGqZe6xxKaDScRganAqNKN851gcoK4EV6rGZEXhIbWpIukIqDdmfgG0na0LprxRrM6jeffUcxF+CLw5md6tb8iTkS5sxXrdKwb1K8NmrBM4yerzwkyxBJcAUNF1kU0f0HtF79oQvmUvTrfK/n3Nc/79528OCwZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dMHMdGgB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLnjiXIg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dMHMdGgB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLnjiXIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792408759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xSlFMVnKmDw/ldSbYNn+iTNtpWivGYYCAIoTzRKpx0=;
	b=dMHMdGgBBxbGlMAeX6m3G1fDVQOrXz0RZQ+CHzuJXKQF0OEYI/JBXN9c1UT12pyhCjIjWt
	pkKo2f7pSujB+UFGHTo57ZyA7kbrusrXKGPT7eK0K7VoBabz2wSTlputmHzL3dXTU9GqJt
	ZXo9IrWfD065VkAMANZabDp5iLrH1tU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-J6vaUi1iPSmToun5D0hS3Q-1; Mon, 19 Oct 2026 11:19:18 +0000
X-MC-Unique: J6vaUi1iPSmToun5D0hS3Q-1
X-Mimecast-MFC-AGG-ID: J6vaUi1iPSmToun5D0hS3Q_1792408757
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c46582442so1288213f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792408757; x=1793013557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xSlFMVnKmDw/ldSbYNn+iTNtpWivGYYCAIoTzRKpx0=;
        b=GLnjiXIgq9isTjwdqOZLsKhcpYeTMioOMxiB/4zjwopOq10x3RYgaYUG+cogE8DHl5
         0rHS5OuTo+2AGP0PP79aq7/EP6S0K3N4wkCrowT88822szlDgoFcvcW2E1YCgc9DqzG2
         NZ1N51yDL7wGaTn+jktKMs5wbY54aXEv1ZpRD4HlHcJV0Yg/r0AT1hKf2A5uDSsQ/tqg
         ODG0UuCbK/bZ8m5lcdc6lPSuHScZUZS1PQaOz16+nwVDEheu8zDm6qA6DNrwA2XSmU5v
         DsfL0mJY5tdNsPG2yL37I5moIDIWjrbwq+sJl90sWeaCHphFZo/AfxJ1mGkXOtSTpA47
         OPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408757; x=1793013557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xSlFMVnKmDw/ldSbYNn+iTNtpWivGYYCAIoTzRKpx0=;
        b=AqoqoUOv/r+N7efhhmTbVn3+rTUMpZli/LpC/U4By59elXlZ+HYLT4crYvzqsZJniZ
         3EF9/GxaksA2R0QMVXr6PFafCI3iU4mkmdrIy6GOTUW3KN6Qjbth8+xf5UwEXaVUlwIV
         1zMgcNJkHnsNTijZqW8K+Hcm4DDJlGzRJvTXpVjvmteWxWiBews9Yme8xZyB6qldxiID
         Trd14pP9fXFY7u0ZsNRVaI/rDJpcNgcDmqDxQtpLz5n8V0PS9BKjrcCrYcoqHQF8ppp8
         HN3B6lIUEl1/BAaNLaQSnuiYNyGlX5g0fz8yHFKyY7dDwezyx8YORGpjZqRZTytlHJbW
         j9Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxG4QbUwh7DMh90ACHjtFNj6Z6HlLIyGufq5YVsdijp63qQUhSzE0D9Td9PJSzG7s8S9b1JLjs0W7fm+3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcW1Nnh2uRfNYJod3hTk9VmlTXtZWDLcd559fk1gMDOE/VFsWm
	oJTf0xX8fpyp0JPPqowR2jNFwKaKntaTqnuGUGRUcP9IF+dWv8/OkyTKHVro9RTYum9sNQ5wWGg
	gDSR8TndPP2Uwe/GsUnmvYNyXVVGQ4XRhBhx+ADCnkxRYqoLiF9Nf6Ygq6A/YVRPTHQ==
X-Gm-Gg: AYBFou1XohB2zVlVgGEbO/RyUTixR3baM4TdBCPCGNabyg4SVeQhT/VsYVwBOyiN9MW
	VQVLQnzYyScWgIRxcx2xpM/4gJ+CPbiup1RHs8mhoDOmRDW9voZieQz4S16S1PStVZZbu3GR0he
	4HwiDQ9SMK7Q7vmC78Qj6q1mPHthdPM9ZZDABc65H9hQPX3og2QkpmytjeGzxMQmMrqL4hCnJFh
	IQSXNqhIOgH6QW8HkS22nL81WiQ7zyL/Ng9wkvh0i3TT1bu1SBOtyLausFcIkWVhwqxQmhL4pXw
	g270LiJH2tN/m+IANuv8Ffc70qWrhqqFvERMH3nNjpWhFwuC8ib1uwxj42GujH75OVrDUL5nlVm
	7mE7bVTrBIUKnyeFvdAl5nFKxZIJJt/5a60KTBUhaqfuMx/1GmqwrYE4e3T9Ryv9Mu6nsSGIWmg
	==
X-Received: by 2002:a05:600c:8a97:b0:4a1:d061:1d3b with SMTP id 5b1f17b1804b1-4a1d75fe17cmr117125495e9.8.1792408756707;
        Mon, 19 Oct 2026 04:19:16 -0700 (PDT)
X-Received: by 2002:a05:600c:8a97:b0:4a1:d061:1d3b with SMTP id 5b1f17b1804b1-4a1d75fe17cmr117124855e9.8.1792408756224;
        Mon, 19 Oct 2026 04:19:16 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193231875e9.0.2026.10.19.04.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:19:15 -0700 (PDT)
Message-ID: <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
Date: Mon, 19 Oct 2026 13:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Yuyang Huang <sigefriedhyy@gmail.com>, netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com,
 andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net,
 dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com,
 idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org,
 johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com,
 kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org,
 sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
References: <20261012011707.3378-4-sigefriedhyy@gmail.com>
 <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/13/26 12:25, Yuyang Huang wrote:
>> - [Low] The commit message misdescribes the precedent it copies.
> 
> Looks like a nit, will adjust it if need new revision.
> 
>> - [Low] The patch adds an 8-byte 'struct net_device *mc_dev' to every
>>    struct netdev_hw_addr_list (include/linux/netdevice.h:253), but only…
> 
> It seems to me this issue by itself doesn't deserve a revision. Will
> fix it if new revision is required.

I agree this is not a blocker, but I think it would be nice if you could
follow-up on this one.

The solution proposed by the LLM LGTM.

> 
>> - [Low] __hw_addr_changed() (net/core/dev_addr_lists.c:22-26) reads the
>>    device netns with plain dev_net(list->mc_dev).
> 
> This was raised on earlier versions. Every dev->mc writer already
> reads dev_net() under only the address lock, so this adds no new race.

Same here.

Also, still speaking of possible follow-up,  I think it would be nice if
you could change the addr list lifecycle to RCU (no idea of how much
complex would be that).

Thanks,

Paolo


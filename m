Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819648;
	b=yHFEeLuWdutQ4EZ+cERG+23u233+2sMxVNIw6mEfAnmj3G42J6rHSfPC8tE+ElsqI85Q
	 01lqVWkSFqHEI3Lnl6Ikz865zWkY/9zZQ0fOjDD/+1r0oj1Rp3q2g75o5IfVq7LBMdSlE
	 tNkHR/IuJGBSsdJgKeeWZ7HQM9CR3YD4u0GKeZ75AA+aNWW7yoBQBJ/YjfMrnwfXS2KH7
	 SjHcwJwmbbo59UEh2y4m9AlYYFco75J+6MCOr4BKp71cOmD/mayMQdzRJXbdqxCVkkJhg
	 BrPtTnuh2r48AiZa2R0dHdZdzdwR2YdbciQ4WNgJPqVYi21wfXr+/ynJqD0SEch/FjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819648;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
	b=NFTWumcgb/DgyPygQuUh9rmOA6CDNZMTSNyHpcxsAioUQBwVBF9zoWG3txqb2KYoNH37
	 xV4QMdv/jGfEN+8+FMKxEYygiM4TfWlKGrcLjcgAb1Tae05kCFtQY8hnDi5/in/FP5IJ0
	 B/5THQbfQY8ZUrodvUt49YRsFzmq7+7KU0mxpKAOviN04EYzDUrG2TD684xD7kz+79e2U
	 VgIQ/VNU54H86GjKc/Fbl4IQFE9c/JKBnrIlZimDEJMzmfE0r+QdYh2F8WoGJ1PWKly/9
	 rdhK3r3LXYj5lvw6vuSNxcPJ3j3JZ7LOmYY45DoUIet4Y4lqq8C6azjU84HG2YGs5Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIPZSJew;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XrXXwcYR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD0606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BD0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIPZSJew;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XrXXwcYR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794819647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
	b=SIPZSJewbuR3msibV5KWq9pH8y07qQTWZ0/ZG23C25J/DKQ29eTe1M/CyXvmSJBeE6HmR4
	sUIkql9qjjUBu4tI0St1Va+R6W75P2gM8hEckyhnBUb2FMlNwZfGaXrdizw7DyV+dzmNda
	IFdkXDRIVsgTeKPTYcNhDp9lt6rIjfE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-VknJdJjfPGyeNBFwJEERZw-1; Mon, 16 Nov 2026 04:00:45 -0500
X-MC-Unique: VknJdJjfPGyeNBFwJEERZw-1
X-Mimecast-MFC-AGG-ID: VknJdJjfPGyeNBFwJEERZw_1794819645
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b57668479aso3260943a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794819644; x=1795424444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
        b=XrXXwcYRWiKArWCNCwX1GiKcvxXibPtrB7wPYiiQT3Mmn+Di6DD/+YfhcsJH6Gy7LM
         7dMwJK1ZVQR3OOidpofo2b0FeEmWjNvMOoN0DG+HD4GnEjPP2KH9LvXddlIK5ie1ErYZ
         E9C8vVPXNdnEnvo1zCyv0IYNxJt1M7pytuw3icoaeVAuqd6i7FHqW7sFyWGcMYrjtoan
         vufkZqzW44sY0wQwysjM/qHRlZi6IeLO0wAQ8JkvFmiAP3U3befFmCUv+lypxE7EFxEN
         SZviZmeIUqJ/Q8Gk2xAPnfMvRKDBrpfTs8scsLYwZFOIWI9z+uKw9V//deB0ylVvpWBS
         sosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819644; x=1795424444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFRAJqmxoqqfZ2LnvH9nq2xqgAiXmyl21Bgo26KGPns=;
        b=0a4OjsTRt5o3A62ZFx+Nb9Rf1Q0v+WKswIT06rOU4TLXoe/ilkn5b0bXhTNTnVB73z
         1IRHcPCawze//Y8MWFK19ROZQNXVV3lrvYE5ZoKJ+0zaeDvPloJogGFm+TGQtQ9MEjo/
         6nRbRfneqCZNHhKolunkIzC8UhM5e4q3k4NJnwK9yuOPpi6PYajs09tuPO+pQCkXaJeu
         RmvA2M8rVXGl+G4g6iacnsSRB/MJJUokkbKsCE8yAm5DYDLXsejS6pAkmfyoE8I14PT4
         y0J4fHX4vaUkSbOysMm/UuOwmw4ChEJCp80XpzQ5q5vIcbv3mNrkj8zo6GwXk4z6JRwD
         wAQQ==
X-Forwarded-Encrypted: i=1; AL+hErGAunsQAxVEVv7siSQNO8rmySeaMjbO6sPrzLS+BpOdX/ug+ZjATVVfeL0X5WLlA6L1FbTs6rZyOYp+tsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ex8WYfrUrwhKzDpTEAPYmrGKfSSO8T9GiMpWvaXc29TeC2T1i
	nrk1hWCwUxCb8sBcX5J35FOWP4I7vNCoBMXK3jkHaz1muGN69rzcoJnCWK1Is6B9m7kIyLfzJ/2
	QezDnL0Y6eFpVCk0xSlG9UsXFsAoEYkBze0J+QlBfSIpE5XHBfa9YzwfMuYvlK4+Aow==
X-Gm-Gg: AYBFou0o8DJgYbkDxARNcdA+kGYxTy+bE91sDD2AXU0dxuSo8m0XRQQ8gaiUD63IR+H
	3E+p6hhN0cgjOQf9OrJHBVZIlp0cgAciKDKHG3Vic57rhTaH3Q70Oz+Y5mNANHUGUILH/Esogc9
	um3r0sx0hgbmcOEaIPJOXMAewG6hnr3xOUCij0yNZJNNmKNcSX7dn5wtmzCeBPRySrGsoi2l/Db
	K3l+W7pfwoVtAhVOyHf4eyU0TJQB5SpEpnQ0DDC8+L9SkI17XhrEziXb37gz/ijIqielJq0HtN7
	dSEPoDrkrqQ8rHodqeZo5MQT23/MmujqIT6qO+f37AsA5HfHwqT7ac8qV5uD7CL27867IWdPKox
	aArwkNXXQdBOcsguDls7t7dYKxFOOn+JZ9iguH1MZq0r9wcSzzMFyo7wFukky34DRe4UWBbnm06
	ePfk/yx7Kbyagt+2fPbykm4EUxSQt0Sw==
X-Received: by 2002:a05:6402:11cd:b0:6b6:fa19:41c1 with SMTP id 4fb4d7f45d1cf-6b7c09580e6mr6633114a12.8.1794819644325;
        Mon, 16 Nov 2026 01:00:44 -0800 (PST)
X-Received: by 2002:a05:6402:11cd:b0:6b6:fa19:41c1 with SMTP id 4fb4d7f45d1cf-6b7c09580e6mr6633087a12.8.1794819643759;
        Mon, 16 Nov 2026 01:00:43 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c262338csm4287688a12.33.2026.11.16.01.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:00:39 -0800 (PST)
Message-ID: <4418e4b8-0f86-477d-b9ab-7fe84ceba52e@redhat.com>
Date: Mon, 16 Nov 2026 10:00:37 +0100
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
Subject: Re: [PATCH net v6 0/3] net: wwan: qcom_bam_dmux: fix DMA channel and
 power-control lifetimes
To: Hongyan Xu <getshell@seu.edu.cn>, Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <179474327647.103840.9539614513141118915@seu.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179474327647.103840.9539614513141118915@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 12:47, Hongyan Xu wrote:
> The original report described a TX DMA channel use-after-free during
> runtime power transitions.  This revision splits the work as requested:
> the DMA provider now offers device_synchronize(), the client serializes
> power-control and DMA lifetimes, and removal stops the state publishers
> before tearing the interfaces down.
A few serious process issues here:

You must cc netdev for networking patches, otherwise patches will be lost.

Races in devices tear down do not qualify for stable according to Linus guidance.
They don't qualify even for 'net' material and should go via the 'net-next' tree.

Too much stuff at once: I have ~10 emails from you in 4 different threads landed in
in my inbox at the same moment: keep one or a most 2 threads in-flight at once.

Thanks,

Paolo


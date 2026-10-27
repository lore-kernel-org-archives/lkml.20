Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092041;
	b=3eT/E3yaR0a0YS5RQ6hkCHrt3BKZBT4iNUir4Tfo4c8K0tS0EoBYDs0o4nBECGF8o4dB
	 igdPCvxSSPeeitnPERg40qiUfsqzlYNdf4F+0ue6f7QLKJ8J1lJeQkv3//hGH+kPSYzgO
	 1wb3sksuutxWFJ7su3GLwRGogLvMD/y8XbrAfv4/TRAX+zRZgijZEbZWFfasw2PJ7K6Py
	 hHVzUKGToRwRGUNGfnTP+cyF6kgVbBB87b8qSc5U6GrKktpYq4Z/7s1Pxpe7YyQAMU5n5
	 VZ9XQugPiiDTIcZcvTnmA8FmwbOj7W7Gw+TrkBLOPtBb89jQAz0RfmkZ1WGb7iDAzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092041;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CvG9nuygN0yktJ32UyxWM2+If6+E11EHBfx2QJOffRY=;
	b=2eEDzIRUSMrBrX+YNgD+vf+brwjrWd0pSVYGWBIwvQJwotuNrd+L7mfkPZ4iNGPQkUNT
	 halZ7561e9kfD52jVVxgf2AOefppJ4H8j0i36YQj8t6m85gNSKqlBhGLEyIYuD3Mr1TiI
	 pjx2NMses6VnE63awyGRIPfl8G+xoTUX6nB0e16hEY4HIk71Tvl9Db3XFmk53vt2PmdEP
	 WJL5bqQ6nHmosfbJHZB3c5srw3e+INWj9zEEtO9kOJNEsKDcoXGWHjpWENgWwjkPUg37J
	 I8Twkuc3IFpPEi4UcRXBl5lUy11RHKJpYkHNIzFJJizefjnZHJtbYWd60ICsbXvuXIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IWMnAgtZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZGH3OXvT;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B893A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IWMnAgtZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZGH3OXvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793092039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvG9nuygN0yktJ32UyxWM2+If6+E11EHBfx2QJOffRY=;
	b=IWMnAgtZBibjGWiVemPH0LYVfbX21tcYOqtX0zb2IbBLG1/PiXp60/yLYg9VAnvxm2+gk8
	LLX3H/tU433xLjYsQM84MeKwUCdCBuBj9GDXq1kIXoTT/rrpn0UdfG9lnX+pX5lHa8N8YD
	RTOAPMy7cqL2zYrS/LTXLdgjWsXsYzs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-k4jInuOZN2e_RTMOh2RWHQ-1; Tue, 27 Oct 2026 05:07:18 -0400
X-MC-Unique: k4jInuOZN2e_RTMOh2RWHQ-1
X-Mimecast-MFC-AGG-ID: k4jInuOZN2e_RTMOh2RWHQ_1793092037
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso3521400f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793092037; x=1793696837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvG9nuygN0yktJ32UyxWM2+If6+E11EHBfx2QJOffRY=;
        b=ZGH3OXvTbDPuFQS3PLOceC4AkGEYOj6E0wYTqriuirsATNGRSAm4p+UWN0rulZxVrM
         PiP+jOgS6xpKIKWSyOSDFvU+c5g5oKaKWzshtwwcKUTV6LxzQlAkz0FQE33sWVGhsf+Y
         kbsbGK3AVei8YLlWayK/qqjivSnI29T9TSyfmicGXftowA4hXqzAH7vvuVuvMugyiZyL
         UH5eUlWz/JQORgtOfN0WNofCyeklipg9cG9n3/QfgvWfiwExYWZ/FoTi7f0OQq43NJFn
         K7w57jsXLQ+CKfC49fIvKIFguOShYpCBkiFA2AV25mTFODtmWSHeziN2cEAQoCGdlHMe
         qUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092037; x=1793696837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvG9nuygN0yktJ32UyxWM2+If6+E11EHBfx2QJOffRY=;
        b=JtNXtzC5gpFcLq4461gmaKRQ+lcKzFga7y46WZcBY392qmh7/XLktAQAI+/FonmZq1
         r7V0mwX7H36ouojTlh/J0+4nkwac1Xp0DbleaSgAjtCzuZUh9WrgdsK+RlX7jFVE+UAK
         LwegpHKLSjZ3VUBHfrHz6adhGCszpPvEYHdlbMbvdroZelV8kcnjhKtDCsQNMrOBCk9L
         fF3H8w5bzoqYL+SVp+Dkfifrox2GLSboMsklQghE2pava4d5xDLjo+XDtkoO8suQ4wiu
         gI0IMniskeyNoAloT59a33pZ4rse8o0B3mvG7s8M9JhGW2/M049zomasiSEQ7aYRgqOf
         +9kg==
X-Forwarded-Encrypted: i=1; AKwUvBy3GVeeIOYC9BQhedZuHzzT1+HNDkrYzV27z9Mt1WqEpQEx7iAlcGQLPQpCAz2AvELe4gez2pzy/kho6Z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Kgq0ayNpjjA6opsDNksm/kQSC2GflrN5WGkR7MP3b32ZH31v
	95lQBXeTdGaDRvtFKx/rRTBL8A3xS7GqwfQpx9Ko15ugSRqZu+5Bjd1HWjamcBk6HAtw0KL994z
	/he7t3mCJPUoorYhBCRicjK/OOw8HtRHF1yHdVeoEol/V3nh6WLuzV+wIoLZB9UlVaA==
X-Gm-Gg: AYBFou3YKuTtnB1DvHbXHHt9lhO/qiys0hH52+ljRol7YPujGArYWzXk6gIgp7mZY1B
	GMayT2Y3d2ySpWdPXR1TDfNImnUeu7UL5ygBRIYAc2VdEx7n3MD3U5KxgkGgfWVJ4gfT9hGG9Tk
	KyJy+d2tcQNjQ8XxM5EEZ6mYhffrQEuoRYn5VWoUzTuDkwXw4sJ8GsPPMkJzAiTpil0yK3xx7t2
	5mPGfNmZZ4J2H8944va8sWM7NoPDLYdAMfJE9RpTk/LGYZjgPHqAq9oRsYd+BY5iaWIcfYrdNn/
	OqlU/syV8IoLJM9ffE7s5h9cERieHlXksh3Gkxz3gY6kd+2JtuVJvhuIFfB3LRpMGJiGLHFhyN5
	erC/TKu1ti9W5Lkabj5+eufYxT2qTf3bOpRqycQpfCDSj+KGWA73ov4OtuDzRunNUPGcchgne2w
	==
X-Received: by 2002:a05:600c:620f:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4a35ac9956fmr157313835e9.13.1793092036775;
        Tue, 27 Oct 2026 02:07:16 -0700 (PDT)
X-Received: by 2002:a05:600c:620f:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4a35ac9956fmr157313435e9.13.1793092036309;
        Tue, 27 Oct 2026 02:07:16 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm250416975e9.8.2026.10.27.02.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:07:15 -0700 (PDT)
Message-ID: <0f7f68bf-d02e-4bc5-accf-5f89a599d37f@redhat.com>
Date: Tue, 27 Oct 2026 10:07:14 +0100
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
Subject: Re: [PATCH net v2 2/3] rxrpc: Fix counting of in-flight transmitted
 packets
To: dhowells@redhat.com
Cc: netdev@vger.kernel.org, marc.dionne@auristor.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 jaltman@auristor.com, stable@vger.kernel.org, netdev-bot+sashiko@kernel.org
References: <20261020201258.290827-3-dhowells@redhat.com>
 <179262720290.3135.1509720869529893686@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179262720290.3135.1509720869529893686@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 02:00, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 0 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Incomplete in-flight accounting: if a segment that is already
>    soft-ACKed gets retransmitted, its tq->in_flight bit is set again and…
> - [Medium] Behaviour change on soft-ACK reneging (ACK->NAK flip).
Basically sashiko says that the accounting looks still not perfect. Is not
clear to me the new status is good enough.

Side notes: sashiko comments on patch 3/3 are not blockers, but you should
revisit the commit message in case of a repost (and do not include patch 1/3,
postponed to net-next).

/P


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6853A890
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076237; cv=none; b=GA3p+/M016PrHlfXEmpV4qB+miK9KcyrMkUuaYIdDgIA7q4r7UIq4vXch0kJNnbAbMWaBe3zQVaWnCMeZ+7L+ZuurjQUF7yVGXMjGPCWaeTlrlGiOk85imMsEtGYRHmEdBgKe/wxCs3Fig+KPY7CEMbFm/pPu+pY8L+tY0j1tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076237; c=relaxed/simple;
	bh=jXl1ULK454nM60julbrVhY6nJFLqiQco+Mtsod5YpsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nprKfiAIwPJNQ8JiJ6ulBjanABH9O8DZ6rAAUYPU09yES6pPr/dKMr836+IadGAq6EzWvWQd4ne0JQgRMz/vQeaPNO1PAfaH7iAyUXn6MdJXTymr7w1HY1m1AonOzAxftJC2vSN/KFOuuXWzkFsxWeMb36uXzCRBGX7Fgo8mKIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWKgNIZb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPUfLCxo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWKgNIZb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPUfLCxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790076231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jbma20fC3+gm45sO3uCEYISexy2c3xSdJhJmJ0JgBW4=;
	b=EWKgNIZbUi4vCpsOv5KKnG3Qabsf9uubqOtGBbe8V+Iygkfx1PB7GICPvwaQnLAQcUzhrV
	Ufevb5yZ4o3+eZ3IiYXSYDpj4HXvsQ3+L9FJVI2FoELfItE1WdyRJNMIF7OaUn9m9Zh66X
	QbaFxzFpTX+uOQukIfB1sWN9pH0WSzE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-Olri4cQYOmqdwnK-WM-8Wg-1; Tue, 22 Sep 2026 07:23:47 -0400
X-MC-Unique: Olri4cQYOmqdwnK-WM-8Wg-1
X-Mimecast-MFC-AGG-ID: Olri4cQYOmqdwnK-WM-8Wg_1790076226
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e76a80fe5so56458635e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790076226; x=1790681026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jbma20fC3+gm45sO3uCEYISexy2c3xSdJhJmJ0JgBW4=;
        b=dPUfLCxoeUwW4ibOjCLxZenxL0IU9Zr2x1z/Ugp/aL3/r10ySb+McoePIwUZsO61Il
         HYcWeG7tWbPcB5Egg8yZXLx02HWfmVaggfBu4PjQ3EUeM++R33FI+VaIQuWYZ/9EdRp/
         FgEGWdhYSC5u0vqwT6fWfIkMrb1tFQouZGOQX1ndENVjwYqnKDcF1Vua1E5PJi63K+U3
         QnclGTtuIjpO9I7l5FJ4yPWQN160Ud1Lq6WbZ/ax7OCwbrOM464eBrBr6uae5+s6DZvZ
         EGt4AUqTuT+HbVyzMtstfbZryj6Ols9Qu39O2bLP86woV3XYB8NWZ0AQCCwQs3NtR1DE
         XiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076226; x=1790681026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jbma20fC3+gm45sO3uCEYISexy2c3xSdJhJmJ0JgBW4=;
        b=VayDJegok4mkBTSBX+oiMqULdILdrjq3wlXOrT0fI1jZORGW8OKlbYh37HPs73wss9
         K/brIoYFZ52Q/DWB7XZRWaAZ2OKm6Wjbuch5WvDrAIyJNlaW8LowFP+Dvxbmaq/KX/Ik
         LLibRaS/P5IxIxiN0gVrrspWh/3yGiRoXa28ET9vm0GFU/Gpektm03A3m+3ym2T2Fsy7
         56IMgpNoQq1T12FatM48IHx4hK/+ypNfEIHzz9Kb+AcYeuJzJHLRQo8sVT2g4oYJs7Yx
         JuWbmnprgg8mEvjmZ8E7zB3/rwZwjNRJkSb2y67IPHJ1qfSoqXL0LtF9gtI77xm8iwj3
         ZHqQ==
X-Forwarded-Encrypted: i=1; AKwUvBznsW3QKHJjfgYGtPEPBLF6+TvMCfCn3KbpYjBkzHMGYjW4QSWo1WU5wkdvJaHTg6sH6dEb1aqpF96RKok=@vger.kernel.org
X-Gm-Message-State: AFuF++noF1WGzDwkCjjAfBs7ShBgJuIaajwcn2q2Ixb/KVCeRnDJXxxQ
	4uYioWvd9QKlX4nr0xDu0cn8NYsOHy8wJBmir8aW+ozDZGutRcKl5a853/b77fIYa2hFrYcUIkg
	tgiDu42s9hq9W1jEPlkjCqkIKOpua9YYnxMUsS3p9VvlInL7ROLq9JCmMt0wcF8TPdA==
X-Gm-Gg: AYBFou1yT4tacSvOXtvsrAormT/AqMhFVMtBhwHLlsflejFSvANjzSwkBBbheK8k87h
	3cKzCvNtECwTH3SF6JZo8uuDaCU67exRan9hE2yfFpVioRnnEAp+LQLrOei3HW1mnoPdbHd7nCf
	pTUpizgWR+iMt78h0au6MG6g1+baBTzJKeB96UE97nFz23kfIBnu3VXEc0KP8lOmBNe2jKvUl8p
	IQCisevchg/gzD7Iih67ubh6HLrvM25/XBrPqWTFZOebNlfLtWDd029S80wdhfs3w8NeyoTilsw
	KeOZDVwEWOOKFwl+qH16gwtWplUCPNu/5Q653zhJW71t+2JMFCvHPfjbYs+aD1cqK8Zc8kegD+s
	Yc0nQRinRArauS66SFtY5nWaOhNjInhcYBjaUxZMN/28phfWAj9c85Awvy5YK8FixivoeJFDqhA
	==
X-Received: by 2002:a05:600c:c8a:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49fc5743da1mr201398735e9.27.1790076226274;
        Tue, 22 Sep 2026 04:23:46 -0700 (PDT)
X-Received: by 2002:a05:600c:c8a:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49fc5743da1mr201398405e9.27.1790076225869;
        Tue, 22 Sep 2026 04:23:45 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdace76e8sm58905205e9.1.2026.09.22.04.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:23:45 -0700 (PDT)
Message-ID: <d1293e11-ea27-4141-b085-268847d6f88e@redhat.com>
Date: Tue, 22 Sep 2026 13:23:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/8] net: dsa: motorcomm: Add SerDes PCS
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org
References: <20260917185010.3189199-1-mmyangfl@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260917185010.3189199-1-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 20:49, David Yang wrote:
> Support in-band negotiation of the SerDes ports.
> 
> v3:
>    - fix build error
> v2: https://lore.kernel.org/r/20260916164310.3168269-1-mmyangfl@gmail.com
>    - Remove YT921X_PORT_MASK_* macros
>    - code style nits
>    - unconditionally write BMCR_ANRESTART
> v1: https://lore.kernel.org/r/20260909190541.466476-1-mmyangfl@gmail.com
Sashiko's feedback on patch 3 looks like relevant.

Also a slightly less terse cover-letter would be appreciated.

/P


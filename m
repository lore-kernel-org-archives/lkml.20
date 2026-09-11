Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BE34BA1CF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161778; cv=none; b=ae4Yp0b8kV/Wsek9UIchL4uG6E7AMyqugTiMzxyDR3AO9tTqZZ+PTCvsgHMxX3FGtOxNIDnG2MnPRt0NPhMnkMh321dq29lC4tbQbxuqfni/OWNjPAix8YtpF/NaEWwsWLnV5Cqt9CF8HICQ1T0znLCr8om3RnFfHS96st4ViOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161778; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CivzG93EH0ar8E6bk5m5XYkP5Cdu1MFuUUckgvBkTEry3zQLB8OHDjsbUp2zr5iCRgsxq+et/ENZ9+RG8ludt2AhErQe/bLjVgnayH4Yq0GN/8kIQfgfh9Lo3q4L/yF5czr9zF04X3HL0Z87ezw4EPMmz7bXC4FKsbnKVtTxfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so4211095e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161775; x=1789766575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=oFTSG8rKqoh/ES3TsqiBf1ZhxJcad+NwR5ORJomj1nsb4zjaXqRGFzVx6OWcV3h8rn
         sRhTkK3rUeUYvxWVmM3AjSoMgPDzEUfzj3/Nw+7Bsa6pwanQJg2m0ii/a9QhflYmj9n5
         Z2pF7EuTMTi7lHruI1h3wYxEIPi92WRyU/tf+kxLVNLhKf7m8GFDb8RjuVod8Aga/971
         QhRP8xhZSqh4QO0t/paQr/D2XBzZoRGgucTiIbmQ6W47uV0P4KMbK0wBWuHnYfZrYLcM
         /9O6BMSLMWgPxF3+ZYAd3k35TsC8iZzmhzKpP210ge4gTE36h7EMZ7RyCheLRdh+9upk
         p1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxIYZad4Jp/II96U3ou4VjBZmV+Vz1jPwsYSJXv68zMrTSlZTnyuphV8YJwahWCo+E44GDLwglUYY+Lm0=@vger.kernel.org
X-Gm-Message-State: AFuF++lBcEuW+xlw5EQ3lmVswScVa32qlhRRTU7eJYgMcEENzo3JTqQa
	Usbue//MV8xrqQfBhPyHlEBarSYytztKdq1mShGFt/t65+Y+rDxLBUIA
X-Gm-Gg: AYBFou03h2dJckELENaD7YasjZlyMw3+ZXjgz31JYh+EhIr0rt++1qT4vjntoYeTIye
	JynW7nfiSoEv9YMLk2vbPGDqEDH4Od7m2B6uo5Rny7VUNS0DpL9iPJK/VhDtXH/BEcWiKip4+bp
	xehfQcGKovUSGU7C0ph2jGbDpSumjwHafFHxm350ImmE8KLOFUbLK+cHSp5vGi+jXRSyEl2znJG
	0PQJ9sydP3qiFivXWnuAm8K6Yi3lrhKESNq5EoXBhfnwpHB2/JMfADSgqp01PZKcSPU6u9oejqJ
	r9ufFwM0BmNWnhNqrhk57ea9VBzah3ojPSUrxtK/9v9ptxN1FnnRMiuOSD8Zz98AWQdee+usXP9
	O6MV3JQHZDKkUz/vX/ZuBRXKsIo1cLDZ/zaFj71gNtzLQgbsNPmFRLGC1EzCpMWJL+COJ4eqlYt
	gNOiF4vVMkvUzMgCThgikuUqsaVgWXZ4yuyvgLpQDCsf+ykyrw3lV/GhikHhgSQsMvYcmoTHKgm
	lS16Zw5SCChhCm8UnHxV5910oYo6M96UHf+F2cHJ6Lz
X-Received: by 2002:a05:600c:19c8:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e619f3ae1mr131418245e9.10.1789161774848;
        Fri, 11 Sep 2026 14:22:54 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm8787126f8f.7.2026.09.11.14.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:22:53 -0700 (PDT)
Message-ID: <59b0d6b8-133f-4a53-9754-bb308231a763@grimberg.me>
Date: Sat, 12 Sep 2026 00:22:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] nvme-tcp: store and use the caller's network
 namespace
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
 Roy Shterman <roys@lightbitslabs.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260910202812.1642832-1-sgogte@purestorage.com>
 <20260910202812.1642832-2-sgogte@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260910202812.1642832-2-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

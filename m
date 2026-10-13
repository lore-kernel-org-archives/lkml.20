Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95621360ECE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899289; cv=none; b=su57iwEPxc7B8yYaY7D867O0QlEw5M+iMDaXYbhh6l+8K/gAx55qGl+wR3iaPaM+n6lJiIWw3tF/sugpFG4F9ErkfTPrmI+wmjRMbwpnGV1y4YdTzPLDeyXi/uzJWbhxbfEuDrt13xjM2LqBRBUr+BsSpY/nAivimgHszP6lSMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899289; c=relaxed/simple;
	bh=REg5Mntcb+tsmQNtdHglZYMVn8Nwol6pChdRnAFVNkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUpjlBs7DvB5h88Vd7vx+sXDjwC3/aHWz7cIaTNkvsvNvbLUHMdxU7nhgHxR4tHkTo6f1XYygLJaqfYzBPXcCjszPf1PLgSTnthTSaw2piW6DVUvB4nrVrP8Vuj/5IQGs8aK9YZoq2ZWkpOuHsHyOSfjX//a+2BeGl8tfYzDQtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IuoScBQG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KreR4oPM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IuoScBQG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KreR4oPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791899287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgGQEF0Pnm38fJNWvw8gvjA222tZmizMgG6WO+7xu+8=;
	b=IuoScBQG9LEQtYiTbBltqxGNbzOnKIbofFHYQLFKvRaGJhX367ovbT16gmngTmzRNKrEkT
	al9neFSOIGNR1LT+Zh4Sd+tPQ6N70Ow6J5vVNCwZ+ZhdZpFbc6LyurZfnS1np1K6WVp5yn
	z/R4l657x/tp7Vvc+YhjJIo/TNbWJGE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-AQ71eUk7PXelIli7BVMvAA-1; Tue, 13 Oct 2026 13:48:00 +0000
X-MC-Unique: AQ71eUk7PXelIli7BVMvAA-1
X-Mimecast-MFC-AGG-ID: AQ71eUk7PXelIli7BVMvAA_1791899279
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so21037135e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791899279; x=1792504079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgGQEF0Pnm38fJNWvw8gvjA222tZmizMgG6WO+7xu+8=;
        b=KreR4oPMlzeA0zSZnRmCu3+uNiACc7J02qXHHcbrVfGaA0nN4/L2X+KtpS6T8de04f
         BjIckzJrTgDP1J8JUCueZWKvjyiGHBJmVLmGSmqNM2l+hajdR9TNl9/tZLvoM1iAEp1W
         EF7N7G44nH7c0aQXyVPurYyVkNt2ylKQWfe2JY9GG/zR/kC/XVPOjTU4aNIs/3+BZUTW
         JXn0M1aorNcTo5RvKE2VUdp2TzeROyaEJWXP0SjqEt2S0XKLq+BjSOVRZqrHlueUHdAF
         oOcihgJupZ65XRipFYuMyyZRe+U14RydMdak3vKdn4w2ursn6703M756EeJqAnH7d4y5
         32sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899279; x=1792504079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgGQEF0Pnm38fJNWvw8gvjA222tZmizMgG6WO+7xu+8=;
        b=BOb1v/3jdgLWNX7lbLoHbF3NflinXiBlVx582OW7j4zcbuLfQWcphwwXn7FZfNOn3L
         1XDmRHcp7d8o4jowee0DUHHeVzgDL9PJ1+qSloohoOCuv5LQZ1bo0LMwa5iHCzbfGVZ3
         jdp3oEWNHFAqAaBpRgHjC2vWHbLk2o4emiIeZbCC3UrC9bo28VMiOJsjcCi0NsJtB/3C
         RQxrDZdk5G5Y/P94Gyro1rHeADpg7nVxdyiWhuwkjqzCK9HVUuKzKi5hHIoC36pVnaAm
         n2FqvPbPzFF2vjQldHkm9nD1NuymVMQw62XHLq7UxO3wkYYVHqvIUhUOiLCVc8H1pb0d
         NhIw==
X-Forwarded-Encrypted: i=1; AKwUvBy2KVhw9YOP0MSCligh5L50UXhVvdYrlCCFN/SLC+JXcM7wllp4+6XUXGY/KKzN1zZlR9rka1a8QGx/pp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjZm3RkidBmljkXAnQcj70QtWgtyh0xmO5FgXsw44P70NAb0Wk
	8Zg16tNYY4ZQGa3AAVgYGHcDd4mtLmP2R1fYZMrx+FatAskSQa7mKf2kV+uKHB3AtN9KzFsKjRo
	GPuurEpk+Ary4gmTe2wgKB+ckekL2y+pdsI9e6kFREfsXfyhNxwAqL+TFz7BMHDVdrw==
X-Gm-Gg: AYBFou36JS5zpe/PfubH6/z8geZ+SK8BMTMQR3Br/yQkt/Aksp/zEtMb3MZr3lT0FCC
	j2zkchTidmZ6AyH1z0exJS20VpS4n5rnW+CpSEPHiKzxa3A+8eyoxIncO98w75nVANdvkhND+6d
	PKtSF4m/OYfS2Hi2hnQHdlze1q8B+S5P1XPeQJeDY5GuImdA4cIGQS3khq+8ooZW+/O/7Ml8wSC
	tIeg/dECA8zhleDStvZ7KrLoxGLMd8QZwR0Y5ZNc87ck5UWFnWKzGBTRWAVEieLLialvLgZe0dd
	niGc16DArrf+gZHgy7vfxIWPOjdg5aql8XLoF7ehL5j3rINdswnbI4AMrNWSEVW5GkLJY9xv4Nm
	Yl2ADgugnigbFWQ8y6bMiK2EDySYDI37ezlqWdllMuQtl+yogPQytwzMqwLmw2aK1mjYpXRaEQQ
	==
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr308259055e9.26.1791899278728;
        Tue, 13 Oct 2026 06:47:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a18e4a7cfcmr308258425e9.26.1791899278275;
        Tue, 13 Oct 2026 06:47:58 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm4979371f8f.54.2026.10.13.06.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:47:57 -0700 (PDT)
Message-ID: <8c40f576-08d5-4b42-b125-abda8da2a335@redhat.com>
Date: Tue, 13 Oct 2026 15:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: alacritech: fix dma_free_coherent() in error
 path
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261006140912.50828-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006140912.50828-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 16:09, Thomas Fourier wrote:
> In slic_init_stat_queue(), a series of coherent buffers is allocated
> with the length size. The size is then stored in stq->mem_size for
> normal deallocation. However, in the error path, stq->mem_size is also
> used but is not initialized. This error may leave the freed buffers
> mapped, leaking a resource and allowing the device to access freed
> memory.
> 
> Change the length in error path to size.
> 
> Fixes: 60c140df15db ("net: ethernet: slicoss: add slicoss gigabit ethernet driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

FTR, bad things in NIC error path for old drivers is the exact
prototype of things we are actively redirecting to net-next at
this point of the cycle. Also stripping the stable tag.

/P


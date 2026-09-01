Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B053046AA91
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247904; cv=none; b=Qzt24FAFZ0C3DqlnA22j49eGskeMisaMeaHg8ikabQyddfKWskHBtw5vS/vz56JLvCq0rdvYB+M4vgBiLSbt6T0NqreSC5YHje83uEb+ekTtcnbHh1aBjKq11m3t/KMwQXExmlt4WScBMmg5rxoifN6TU29+/o7CthS1GrJpIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247904; c=relaxed/simple;
	bh=zGhJ9HaYyZ7K+ijAn1Ufy6dOppFjBPbx8iBoOPASPKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2R8ygKUEjaPBieHI+27+mDn4b+UBwTjWYd7lfvdjpKfrH0XEQIC4qn1Ned3kg+ekD1YzxnEY91ynNbSGLM07xCEvlAu5Bsesq8OIslHWOnQ2NvyVsUvGpf7MUD4mhxX8/jTubnRjcAUbMW/32o1xiiHaIWmHJOo4t/EQcQebAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzgKZERY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uAWSDE9g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzgKZERY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uAWSDE9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788247900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=996Do7cli1wrzMhcoRVI4Dpnoxul8kFICpQpjRm0D38=;
	b=RzgKZERYlM4x/o0dIbfSWC+joLNqR8x+fJ/CuTIOR00iJ7eIRrx5Qow0ViQa77BjtP/4q3
	95ENdDiS2xeBFc/FR4Vb6OTt806vR3zH2TaZE2Nbo36W0LZgCaK8Mkjqv0ntUKP5qFDP4z
	dhIBNPRvIeduTfd5y2J7n/6L0gCZxH4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-XscPmY99PCW1JihXGSiemQ-1; Tue, 01 Sept 2026 03:31:39 -0400
X-MC-Unique: XscPmY99PCW1JihXGSiemQ-1
X-Mimecast-MFC-AGG-ID: XscPmY99PCW1JihXGSiemQ_1788247898
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955fd77c18so23857715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788247898; x=1788852698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=996Do7cli1wrzMhcoRVI4Dpnoxul8kFICpQpjRm0D38=;
        b=uAWSDE9gTZaCtnNjCrRa0Cp47o69hAPjgpwpRhd8C2/bR+KAgqqz7raR/BZM7Jbsyv
         BWtFfQC5338IXnkaEic7YAJzCm82mqAlnpiBIQ//c6jR+Uh1JilL08lYdWmN5ZDitxsI
         AmaLSgRSGnzvub/8fDyf4Px/Z/bYEKZrNzKlWEckYOMh60C3/Y5Go6jMUxGml1pC1ryY
         lTydfSpNi+A/P264j2WdTIptcgLHVTyzLPCbV+/WeBfTGH2BNdMj+Rrx+fZ8ZZ/eC8E/
         154YD0uuMjrCy2ZuX17aNQ0Ga4YCgnfJ9e5qssVfeYxknrmnTrETQdcKM21EdMJW2X74
         OYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247898; x=1788852698;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=996Do7cli1wrzMhcoRVI4Dpnoxul8kFICpQpjRm0D38=;
        b=aJSRxVvggidTH7Ok4/9a9qxC16rG6Vd53a0/Dc9OkjnGUkgKrUEhJdKmo6+lsXlhun
         92tZ5iUqUT0mImsCrGbxwILWzwI5K8LE8rmfKRphcfB2D8Xp8OKVxJWRCL8PYq42+qqM
         1UEzrwQDlkscUdAjPngJxzgwTwfSgDhcaXJFEZ0mOG283aVZUjRy09diWHyIKirLcANH
         YUL101wiWBxhoEivHJXeCBeF7tgDf2toTwlLQzrWTqcW6a1Da/7MDqR2kKXj0WRH/8ns
         G2biIyOtjy/HXB/4aR1nnrpB9gJ2bzd7FXbDjjOaQWM4AC/mdHNEpArYUbhT4ymPFyxU
         xMKw==
X-Gm-Message-State: AFuF++nWnGaIl9BvDuHpPm+FjSmJ/JaSUVAmqDQyd7d4CFFn6r2EWdav
	tivKspanSSZJN38Qy8ihASIFeuorv5NNGVvwP4pvVvRvyTv53oQmCtT+U5E7BNaDkOKh/pheybA
	98YcYgPJgwnGRmkHg0vq57ewA0FH4gYcDYuzVglDwHgUjzUIf4SlCuZSrhvhv11BgTg==
X-Gm-Gg: AR+sD11DLhI24Ip9JpME92/KAyB4MO9L19j82OFU34ZKFLxAfc3VTTZX/cvHHUbNLlK
	neWTUY8NHTRRR2jLLEySnmwf5INlOw+2nUCj1X8R0wBxfp3iP6+xtK3kHku0JCc/WXE5ZrggyXu
	Bb04fLbyyYTFWAgpdccfISZigionXDFwPcSE2KArF44kTLtNauLX7vtF+2f4iWZq+8Y5EidLsU4
	OnF3GDldlC0y2zuXsadN9717ZOueeowNj0gCCRju/r4C68GTFhf+81W74AjLreFGo8z6zuovu4H
	lBHIo7iL0Ri2OO1fTj2hJBjtD5/5nZ3ziWeLdK6ntB2ccqxQ8KHh015W/qJ7SZw0w2Mwa4Zf3gh
	rpYQPjP+9cadfE23fBkhE/IZJGxYATcY2UjM5Os/tPI5eN1rpAwomFfxk31VFkxL/2MPONZohGQ
	==
X-Received: by 2002:a05:600c:a114:b0:49b:9438:7785 with SMTP id 5b1f17b1804b1-49cdc429f02mr92591575e9.4.1788247892934;
        Tue, 01 Sep 2026 00:31:32 -0700 (PDT)
X-Received: by 2002:a05:600c:a114:b0:49b:9438:7785 with SMTP id 5b1f17b1804b1-49cdc429f02mr92579265e9.4.1788247886584;
        Tue, 01 Sep 2026 00:31:26 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10f08sm49011395e9.7.2026.09.01.00.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:31:25 -0700 (PDT)
Message-ID: <3b647dc9-6653-4a75-b0f9-d934337ac2ef@redhat.com>
Date: Tue, 1 Sep 2026 09:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] A Syzbot-style Platform for Verifying and Fixing
 LLM-reported Bugs
To: Guenter Roeck <linux@roeck-us.net>, Yuan Tan <yuantan098@gmail.com>,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 frankw@nebusec.ai, jhs@mojatatu.com, ksummit@lists.linux.dev,
 kuba@kernel.org, kerneljasonxing@gmail.com, roman.gushchin@linux.dev,
 jgg@nvidia.com, mchehab+huawei@kernel.org, torvalds@linux-foundation.org,
 ben.copeland@linaro.org, gregkh@linuxfoundation.org
References: <20260830115546.3942129-1-yuantan098@gmail.com>
 <98d4603b-0559-46ea-8b76-1f0245b3b266@roeck-us.net>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <98d4603b-0559-46ea-8b76-1f0245b3b266@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 9:08 PM, Guenter Roeck wrote:
> On 8/30/26 04:55, Yuan Tan wrote:
>> LLM-powered tools such as Sashiko and Claskiko produce a significant number
> 
> Is "Claskiko" misspelled ? I don't find a reference to it.
Clashiko is the "informal" name for the sashiko instance running on the
networking subsystem CI. Since it's ongoing under constant improvements
and changes due to a lot of effort from Jakub, there is no formal
documentation on it.

/P


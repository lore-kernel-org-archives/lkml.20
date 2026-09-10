Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1F3D413C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030660; cv=none; b=NOoAGeWsbOrZ2/u2bbA3NBZ78NsVj8gl/pZillwtYwSNBcHuOtqw3nX1YohWC4wM+5q/gIrZd/3J/o6maxp+0fCdUhkOrCn8no/icPR1iKRJFkHScrd4ap8Sn0vtRmychDarnboTKdO0QghPQ4JL9NCr37X/oXNJRBhhOit1+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030660; c=relaxed/simple;
	bh=b7K6pIWMoglwO1Ja+bQ2JtN346C4MXe5NqlN3W0b7Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNVpYvWPviRmvFR7YBJc+ew6CtwDs9sdzkIeJUrzjaL+2yc4/edIFgHbx9NniiEtyp6KIlFKi5IW8L3AEygcymor2PqzAB/yvzpJEtECVktOcXQV5utT7NoHw3YBdL9hwKAhXoZs7XWKe89eigH2J9XqG9O2bVPt9ffE6+J2a8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SoiU1CmV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p6HKrO/7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SoiU1CmV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p6HKrO/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789030658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y08MuvRHSicjXeoYJ3CdQ0GrnmqIMwlAmbYm+7kzbhY=;
	b=SoiU1CmVnHR6UGmxGdNQ+zMpfawOShB+KyT/SfRSdT0rbLXjs0RvelRdOdTDISSH0aA/le
	MwAwf3oT9qqVj7JLtngJiPdidm4rCbjoYNlb4OyJl/AB+R+iIGyzFsXTf1iC0CXRSBhx4T
	lZ8SoNw1oVOlk410slzrJuTH6OGheZQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-cqIeTkCzPe-NHL_-_XRl1w-1; Thu, 10 Sep 2026 04:57:36 -0400
X-MC-Unique: cqIeTkCzPe-NHL_-_XRl1w-1
X-Mimecast-MFC-AGG-ID: cqIeTkCzPe-NHL_-_XRl1w_1789030655
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so88306285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789030655; x=1789635455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y08MuvRHSicjXeoYJ3CdQ0GrnmqIMwlAmbYm+7kzbhY=;
        b=p6HKrO/7Sx0XGr5o2hbpsC0j/4IOnIjJZjF819j6Xg2v/B+xV6SDUep756ptndGJBF
         PnTNdV8hIgDsWwo0njzB7pufTg1nRIEQfIhW9ACP71kpaiK/Ep0zKVE5pSPF8xSnmuta
         K2YI0obnetn0aSwI2NXaVx3yhT8su6SKsWtkc2uMgGp9DI2bvvD724TqhesTaAnkoY0M
         rygo833uBYB3p+tr5BOOYXl63Vf74ye0rmxM2X1jqAxDfo5YMbQ9AKpEW7eckvlzxtcy
         jGFfU8TF7vKxNnJovfglsfhIaXxVFrLn8PBMOorVZp/F6wmstKXQe3NElPOatXKysq2M
         BlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030655; x=1789635455;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y08MuvRHSicjXeoYJ3CdQ0GrnmqIMwlAmbYm+7kzbhY=;
        b=SeeP2Vdphvq2iQHEIdhhQI9giqesrQIcsTt3VntfkiMZ8tgJ+n06Hgq3yYZPqY1DZc
         BPAAMP2WrlogirfTT2YcYJoz3IX+pCpWId/vCaQQMRcn1fvr9saro+sUejcbKoNBqt7a
         lIxd3qiTWeW8XNkDMBwVceHF5Aww6bMZ9TnJOg2ElgBA9KkpTl5RdLtBrhvWvtAcB1jH
         zexzFhLbyjyt6oc4U7LvfoMs3VwAm7p0irD7LLM1AEkF4+NGExp8PBF1wDAk732iPm0v
         AKIhD5EfrxHxQVNfvVPDJjMCd8dseOOjaCVLcrXe0IwgBboqePVcpBoq+Sffkrumibr+
         BxhA==
X-Forwarded-Encrypted: i=1; AKwUvBzkmSTgWZ5rHaVyg8NqECTqt/TCj1RmLB9DO5zLejUtuGQ9hAJnQyo8IuhmlQETPhdxN5DyepxBzsqIqTk=@vger.kernel.org
X-Gm-Message-State: AFuF++lh3DYoOfzUUoHy9yMbS7OfIxNN6KDTaWDC29APyrCw10QyNCrk
	LnVJDBuQSeB9VzJVlEdaKMe4cTvSUmsVYcg+5iKFXHdtqT5m7QBkiVGjumDfyGBgb7V3PwfPK4Y
	I8sxHiINtD7YwAv+w8qGeJJ2m26CMK+S/fQv5esu1VivgbDrTZ8zVw3L5T+TC68FeNbRmTYvYDA
	==
X-Gm-Gg: AYBFou3k4oeSn5aIgg7DjB8CfgYZKWkX0RF8UaIoKMHFfApMjuYGI5UknnNslTbofnI
	R91Cc/2qhlHLAivD8y8Me5i/c4nHHf6zmC8zDc8OJxVuDEs/mDrnqNYbJqnhvNa7AuZ+vWnCSvT
	KOXzdXxnVoNJcOaczaRNId5zwRy9ZSfCsH9mxi1McfAx8maMop8jlUdUNOm7PzyecmOqG7dFm7s
	VpLJQE3GZgw7nBmH2CqUFuWKFNO+A42v8mmVgaGWzmhBk5H7wfoPsVqZQcmyQ8r5FTH7Hr4mupm
	oEINY0awoRUcOIvZulwejploMZIN+qMshdrG4jafIbED2KfUyPFoZ6mv7b6sPg5LEfNrZPeA2A=
	=
X-Received: by 2002:a05:600c:3550:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cf7f4a6cfmr363669265e9.0.1789030655332;
        Thu, 10 Sep 2026 01:57:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3550:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cf7f4a6cfmr363668975e9.0.1789030654851;
        Thu, 10 Sep 2026 01:57:34 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm26614995e9.13.2026.09.10.01.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:57:33 -0700 (PDT)
Message-ID: <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
Date: Thu, 10 Sep 2026 10:57:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Joachim Vandersmissen <joachim@jvdsn.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
 <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2026 05.24, Joachim Vandersmissen wrote:
> Hi Thomas,
> 
> On 9/9/26 9:36 AM, Thomas Huth wrote:
>> On 15/03/2026 01.43, Joachim Vandersmissen wrote:
>>> Hi Herbert,
>>>
>>> I don't think this one can be applied yet since dm-integrity still uses 
>>> xxhash64 through the crypto API. This would break fips=1 systems that use 
>>> it.
>>
>> Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway? If 
>> xxhash64 isn't FIPS-compliant, nobody should use it for dm-integrity 
>> there, right? So I doubt that there are any systems out there that use 
>> fips=1 and use xxhash64 at the same time?
> 
> There is a risk that users may not know that xxhash64 is not FIPS compliant 
> and would still use it. Especially considering it was marked as 
> "fips_allowed = 1" for a while.

So isn't that a very bad situation? They think they are FIPS compliant, but 
actually they are not since they use an unapproved algorithm by accident. 
Maybe it would be better to include this patch so that they are aware of the 
mistake? If there is really somebody running into this issue, they could 
boot once with fips=0, fix their system, reboot again with fips=1 and 
finally be really compliant. Sounds like the better solution to me. WDYT?

  Thomas


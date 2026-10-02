Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110A47F3C5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939228; cv=none; b=psaJQnJ2hks6a+hZOMfs3pmj4LLwoNJ9Rw8whdpQZERfivgu+UCUepoNmmXZKbrUjxU1M5mIbthoGOR7I3/aq91My4fALZQ/v4KyrEDtQIeXG30qZAVG7GjK7fAQyfR6p1cLlWmpJJ++js3kmZ790CBZY1Hgv826chxRVnei38w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939228; c=relaxed/simple;
	bh=Oob0Q1HTAEWrLlkKz7jQ/Xzofqs3tWxrWAQLOWcy6uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sib09UKZJwmiyH2x2pUgzcSID5LeQPblUYJJ8LjnG5Eha2v7cTSqr70IipptOyLY2EJ2/oVzQNilql6IbTaDYGJ2OhSPFLVe3T35PBAX9L/z7r2ilGTtp5+Vo9+2pcc7WWfBQIp2Oza2EGzj4V1gIOQ0d6doIPzAhpU4rCuXCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4eZWJmt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVo7gn1N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4eZWJmt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVo7gn1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790939225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qhNOry5SPjqFJfWAABwlECFJ8i+7DijkyXrg3YFBS0E=;
	b=W4eZWJmt/3oCPeuIqpRbc97ZXpfIZuykRBFVGK6eFhR5mvUNRPnz13fR+xiuoi/6F9q8fy
	uuSIvQPLj58x7pmGWIxgFav9Vk3nGOufGS3pSIb5hG876mEmSdAYZ/jPd9JNCu9khvmEoi
	s9UtsfLJEfwY/oJVwa3I3Gd5tq26i7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-2SW4fV4GN7i341SVk9t1Fg-1; Fri, 02 Oct 2026 07:07:04 -0400
X-MC-Unique: 2SW4fV4GN7i341SVk9t1Fg-1
X-Mimecast-MFC-AGG-ID: 2SW4fV4GN7i341SVk9t1Fg_1790939223
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6862e924so60477025e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790939223; x=1791544023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhNOry5SPjqFJfWAABwlECFJ8i+7DijkyXrg3YFBS0E=;
        b=BVo7gn1NXfU5Ta1SSqkRjqotJd1kBBDUIsbE00OGcKuYcnocv/K+L4bXm8KhFR2ElJ
         VU/4LQN3QCqPFEcfXwipxWjlzkcCiEHUlQr7BUJ4SzsadmZop1G7zrJph9HNfZBQS2/f
         L9BAKbsv2psjaEJYsgQnjSFDnMGpGtpOS+Ln2xAoV0ORCBTZy3T6iyzBnMYazk7xCcm5
         8NYA8A/JrWbeAtVlfWLpBdqJAmdZxt0k5m92tEMdMVFBOLdiraXtZ1OmQNwbVgrdS149
         wZBa/1UbCJPhL2/eWFpAQ5REZ5xZLHO1gibd5FcazKH9xknIDYo2fTRuRNP1EfML5sKp
         OI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939223; x=1791544023;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhNOry5SPjqFJfWAABwlECFJ8i+7DijkyXrg3YFBS0E=;
        b=YhDNlsghicwzh209UsK9t7V+GkenrTrtAnWP+/2OQpYi5Bo3Yk+030Fth6ffScAXSA
         eVMKqS4xbdGvJFvSvEfQmDbr5vgnorOZIxc8M+GZYTyo5SxLHRnOZo5+8Lti2KhDj2Qw
         +yv2gSBO46KBm2dRhViD9bsie1OOr3lbhXlSozJpUr7CKcVhUhbQMDqQOsEuahMu/I/l
         73pUFRb9XekkUv3vM2wqQ3kvu4MhbLBl81qcRIgRNd/RrOWVFNdF20nWkegm991R5b9H
         qIbmkUmoqtcByfTMIAJbjNKnAfQVkgh++ZSFS4dD/9Ma684r8I8W75Onrc0+uJ774pGc
         GTYA==
X-Forwarded-Encrypted: i=1; AKwUvBxTwu8ZFAghRPt6w0SQKBfv29WEPnjUX8gUStna9vqttKEdklq4BJ0ygrfyMUaQYvj4esjEqNlcbVVVomE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZq2mf85gZijkx3vImxMKLNGlWD+3jp6fhPherL6SgdNz8FMBf
	pl+D53aKD+74xse+bPoyEbMLC+sYm+htzB44EuLQpf5HoDy9A5DFNhHN33lhpLSB+Y0xCL4rRlN
	pdt2qFsqDux4YhZeTy9qOviYELsWxr/726eeq+LPjjG32dQOw2/vfLOqjTzRJVlfRPw==
X-Gm-Gg: AYBFou0pbZziQ+cLCnMdZc4Ajup7KkFYYfkEn9qB8BMzT3dRyDPoETcAJP5kbbTglhe
	vP3Xz7N8ai7MehhXjhNtZ7vE4IJCvdNtE1U2tuwxJ/sKrqNLaP1SckuQT5r0OQLpRfQn1mRKqeq
	V9/Jjnvc45Acfdig8QdPP2bE5N0Tn26L/5pUydRQ1qcLnKdJzg/Qa0w6t4EjS+ZmWR/ryTyYAdX
	HAC/WM3C+dW0nW8mfZNMoeDAPuicEtB5dGMxXHIIwiQ9Mn1RsDovxm+XYmDFbopYtwPeaIpWtGl
	EreUnFYMIRIxfDl23gzklbm5Er4ON7+SSv7bdarXq4GPSHm2bARo9pGTQbBp2SlzmVLNgHOH
X-Received: by 2002:a05:600c:6099:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a0276edf8emr40618345e9.30.1790939222706;
        Fri, 02 Oct 2026 04:07:02 -0700 (PDT)
X-Received: by 2002:a05:600c:6099:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a0276edf8emr40617835e9.30.1790939222263;
        Fri, 02 Oct 2026 04:07:02 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75868355e9.9.2026.10.02.04.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:07:01 -0700 (PDT)
Message-ID: <2f158324-fc8c-4fee-bcb7-20f986938201@redhat.com>
Date: Fri, 2 Oct 2026 13:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Joachim Vandersmissen <joachim@jvdsn.com>,
 Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vladis Dronov <vdronov@redhat.com>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
 <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
 <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
 <20260910141456.GA1936@quark>
 <e1d45f87-de65-4ff2-903a-80fd2c0b3861@jvdsn.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <e1d45f87-de65-4ff2-903a-80fd2c0b3861@jvdsn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/09/2026 04.53, Joachim Vandersmissen wrote:
> Hi Eric,
> 
> On 9/10/26 9:14 AM, Eric Biggers wrote:
>> On Thu, Sep 10, 2026 at 10:57:32AM +0200, Thomas Huth wrote:
>>> On 10/09/2026 05.24, Joachim Vandersmissen wrote:
>>>> Hi Thomas,
>>>>
>>>> On 9/9/26 9:36 AM, Thomas Huth wrote:
>>>>> On 15/03/2026 01.43, Joachim Vandersmissen wrote:
>>>>>> Hi Herbert,
>>>>>>
>>>>>> I don't think this one can be applied yet since dm-integrity
>>>>>> still uses xxhash64 through the crypto API. This would break
>>>>>> fips=1 systems that use it.
>>>>> Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway?
>>>>> If xxhash64 isn't FIPS-compliant, nobody should use it for
>>>>> dm-integrity there, right? So I doubt that there are any systems out
>>>>> there that use fips=1 and use xxhash64 at the same time?
>>>> There is a risk that users may not know that xxhash64 is not FIPS
>>>> compliant and would still use it. Especially considering it was marked
>>>> as "fips_allowed = 1" for a while.
>>> So isn't that a very bad situation? They think they are FIPS compliant, but
>>> actually they are not since they use an unapproved algorithm by accident.
>>> Maybe it would be better to include this patch so that they are aware of the
>>> mistake? If there is really somebody running into this issue, they could
>>> boot once with fips=0, fix their system, reboot again with fips=1 and
>>> finally be really compliant. Sounds like the better solution to me. WDYT?
>> As described in the dm-integrity documentation, dm-integrity supports
>> non-cryptographic checksums for protection from accidental corruption.
>> That use case is no different from any other use case of a checksum.
>>
>> It's also no different from using crc32 or crc32c, which similarly have
>> fips_allowed=1 and this patch completely ignores.
>>
>> The solution is not banning checksums or making any other code change,
>> but rather just doing what it seems everyone has already been doing:
>> documenting in their FIPS security policy that checksums are only for
>> use cases that are not "security functions".
> 
> Unfortunately, this is not an option anymore due to the opinion of the CMVP 
> that was issued back in March. If you have an account (you can sign up for 
> free), you can read it in full here: https://cmuf-workspace.org/Products/ 
> Projects/Messages.aspx?prjID=3&id=559. I can also send a copy of the PDF 
> file privately, if necessary.
> 
> The relevant text is:
> 
>      1.a. Can xxhash64 be used in approved mode as non-security function 
> without any further action (in this case FIPS IG 2.4.A will not be applicable)?
> 
>      Answer: No, xxhash64 cannot be understood as a non-security function 
> because:
>      1) It is offered as an equivalent hash alternative to approved hash 
> algorithms (i.e., SHA) using the same interface/API and therefore appears to 
> an operator that it can provide cryptographic protection (i.e., security).
>      2) Its return value (i.e., mode indicator) is the same as for approved 
> cryptographic functions that provide security.
>      3) It is accessed by an interface/API that has “crypto” in the name and 
> thus implies security.
>      4) It is an available hash function (i.e. PRF) of HMAC, which is a 
> keyed algorithm that implies security.

Ok, thanks for making this clear. So that means for FIPS certification, 
xxhash64 *has* to be disabled in fips_enabled mode, right? Thus every distro 
that cares for FIPS certification has to include this patch. Every other 
distro doesn't care for fips_enabled anyway, so they should not care about 
this patch whether it's applied or not. I.e. there cannot be any user who 
uses xxhash64 in a fips_enabled system (unless someone is masochistic enough 
to turn it on with an upstream kernel in a environment that does not need 
FIPS compliance). So I think we really should include this patch into the 
upstream kernel now, too. WDYT?

> crc32 and crc32c were not explicitly called out in the resolution, which is 
> why this patch didn't target them. Though following the same rationale, they 
> should also be disabled.
Sounds reasonable to me, but maybe this can wait 'til the CMVP explicitely 
asks for it?

  Thomas


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582A3EEAF9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670600; cv=none; b=t2x/wNr3qXCUTCNttDfMzPnqSUQ03E6oI5CEAFGDzAecelZye4rmfAxo4HYBn7lvuIY+h7DexgV3Z5pl+IQpjTPg37HzQwGblAsR76/Q2uL0mLYOSCo3ZtTStPaDl14iPiJXpTDykX06EZCGGmiRnBITVl10Hla+A1L1Npm0N/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670600; c=relaxed/simple;
	bh=8kxH/OayBaB/YISkRgr8hDh2O4L9NhgdZOgWgNcyhkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9H0K9ILQ4FMu6+l9ZukdheTCrRfYtIsTxvFM0pdw6iyIntOMgB+2CAvaQDzDefrphB6MeypW0f8rIUo9+iSd8q0K6O8gdWBpMJi1ywdg1ZrETCUCJj/zdbDIjuQ0YedjnCkkiMepfLxnMejoB7WcBdC0Ury9QXH6rXUO5AYnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQQ/vnp1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQQ/vnp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790670597;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vxbsc+NCljbcHcDxhWzgsYHRMDqK6k1gG92IIwNO9h4=;
	b=BQQ/vnp1v2TXDT0K2/FJlbuT9xYWkmsDtm7ModLbDevLUrlgs9kDDnHcLZgXsSmTrTC/V+
	CPe5CGdjJj7N/Usxc0l6OkOM16rR+LfPRxo7p9e9bdT4tdQKmPrNmWnh3ft3KkiD+yHNVF
	sZxrFEAAKTuI6cU0YUIYaBrrFHe5+V8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-1eWOzWVMO_KNLnP_Sr67ZA-1; Tue, 29 Sep 2026 04:29:56 -0400
X-MC-Unique: 1eWOzWVMO_KNLnP_Sr67ZA-1
X-Mimecast-MFC-AGG-ID: 1eWOzWVMO_KNLnP_Sr67ZA_1790670595
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29959eb71fso400218766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670595; x=1791275395;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vxbsc+NCljbcHcDxhWzgsYHRMDqK6k1gG92IIwNO9h4=;
        b=mLll56AAo8EFTRR1fhS7jySxvpk5ZWZ2KQsfn3N4TEAmNoB9In3N7VUb2MCB3j/dfe
         Ovptdjz57Jv9nf4XuslytLDGc9jMMqqhyGrbv+PUjZAzL2fffbytR5nHmgPutd5DGc6d
         m3c2LWOeyYD4JrDfniBYdTQK2JIobO1nxHxGGv2AxDjRwhJY1xtyTmIlqQzeN8ewC/77
         nhIv51qYDmeqiO8+zX28Bqjz2MkCpQzkrW5IP1Wh9mG2FmjUeXJ65jMVafE3ZOeAHFT/
         VczO8j5RrGKrXN2MKmZHkV7p7wUNlE/9vFO0+g9f/Xr8gJ+Wk5VRdgqnQzvNSfeoK6Ly
         JXBg==
X-Forwarded-Encrypted: i=1; AKwUvByZ0pcqQBlAstBMWhqh10cuuZZX0AC3Hx3e+PL2IKPSsThlqM71BZPnJ9qOMN4tXHy6xtERNJr006MYl7U=@vger.kernel.org
X-Gm-Message-State: AFuF++koOgm1As8NWbXbgWi4FJ49TiHk5Ng0oiN3YDXcHuYr7rGkhky1
	KouqQC45gUvezfthBWv+j9LMBGGsTmQg6hvuBAzpVjOlotnRoeT3j+fSeKrQFmC5r9pw/210zjW
	hLSMGuxdiWoXXNZ61MQRVjpG9UoAzmok3pTpu44ZHQMF16XTUtssPvdjBd599nqqaZg==
X-Gm-Gg: AYBFou0LBHfvkYNSR3HIOpTEvtpIA64KFr3JWUUANuWMZODm3XzpK3lxozSAcI0GiXT
	2+iaiQ5PksQXFzA/BJXzPWkRvc8S2LcaNC/N6fuPheCliEdmooSFJC9i4C6EnYONP317WlfzLZX
	uKHDdTfKDSwg10gTvZNLqQkhJkJO8ySwuzWoDx3idJTfToGn/D9IZ7e9mNy+HK60+mFPEPTmAAP
	Igvl6CJAA/KlgNy7RRRNT66ThyZ9D07dpK6+wFdPdXHWXaxSee3+9eEyxU3KySj1DEPsgX+1RDf
	YO+/XaXW0cd8d0SeA2nU7MiY7QRMMoOEGgWOfdXMJBaIqiG1PW6/cKtQPD8U/5FwXFCRK27v09X
	ycf7PkwS/Xv/jCRhTbj/1Gzx0tdgpr5OWvkhMnPmAR6lTMHTR
X-Received: by 2002:a17:907:c609:10b0:c2a:cf73:63fe with SMTP id a640c23a62f3a-c2acf7369d6mr801066366b.6.1790670595111;
        Tue, 29 Sep 2026 01:29:55 -0700 (PDT)
X-Received: by 2002:a17:907:c609:10b0:c2a:cf73:63fe with SMTP id a640c23a62f3a-c2acf7369d6mr801064266b.6.1790670594668;
        Tue, 29 Sep 2026 01:29:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc57c8dbbsm363629266b.12.2026.09.29.01.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:29:54 -0700 (PDT)
Message-ID: <de7adc58-cb00-4ffd-8b2a-29728114c655@redhat.com>
Date: Tue, 29 Sep 2026 10:29:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 4/7] vfio/platform: keep logical vm_pgoff in MMIO region
 mmap
Content-Language: en-US
To: Alex Williamson <alex@shazbot.org>, Abdifatah Suruur <suruurism@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, smostafa@google.com,
 praan@google.com, ioana.ciornei@nxp.com, nipun.gupta@amd.com,
 nikhil.agarwal@amd.com
References: <20260921122334.2099-1-suruurism@gmail.com>
 <20260921122334.2099-5-suruurism@gmail.com>
 <20260928170019.2b46ee5a@shazbot.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260928170019.2b46ee5a@shazbot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/29/26 1:00 AM, Alex Williamson wrote:
> On Mon, 21 Sep 2026 15:23:31 +0300
> Abdifatah Suruur <suruurism@gmail.com> wrote:
>
>> vfio_platform_mmap_mmio() overwrites vma->vm_pgoff with the physical
>> frame number of the MMIO region and passes it to remap_pfn_range().
>> The VMA is inserted into the device file's mapping->i_mmap interval
>> tree keyed by vm_pgoff, which VFIO expects to be the logical file
>> offset: the core links every device mmap to the device inode's
>> i_mapping precisely so that unmap_mapping_range() can revoke all
>> mappings associated with a device (see vfio_device_cdev_open()).
>>
>> With a raw PFN in vm_pgoff the interval tree entry lands in the wrong
>> coordinate space and unmap_mapping_range() cannot find the VMA,
>> leaving stale MMIO mappings behind any revocation attempt.  Keep
>> vm_pgoff in the logical VFIO offset space, as vfio-pci does, and pass
>> the physical PFN to remap_pfn_range() explicitly.
>>
>> This is defensive hygiene: none of vfio-platform, vfio/fsl-mc and
>> vfio/cdx call unmap_mapping_range() today, so no reachable
>> stale-mapping issue exists.  Keeping vm_pgoff logical preserves the
>> VFIO core contract for any future revocation path.
>>
>> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
>> ---
>> --- a/drivers/vfio/platform/vfio_platform_common.c
>> +++ b/drivers/vfio/platform/vfio_platform_common.c
>> @@ -561,6 +561,5 @@
>>  	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> -	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
>> -
>> -	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
>> +	return remap_pfn_range(vma, vma->vm_start,
>> +			       (region.addr >> PAGE_SHIFT) + pgoff,
>>  			       req_len, vma->vm_page_prot);
>>  }
> Eric had provided a Reviewed-by in [1], I think the only difference is
> the commit log, including dropping the Fixes: tag since it's not
> currently reachable.  I'd keep the R-b for that, or he can re-add it on
> the next spin.  Thanks,
I do agree. Feel free to keep the R-b

Eric
>
> Alex
>
> [1]https://lore.kernel.org/all/21fda51a-6974-487d-874a-387dd73e2346@redhat.com/
>


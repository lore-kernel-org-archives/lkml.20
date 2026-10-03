Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61C41A76F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039312; cv=none; b=gbsH4Grik7NJFnaEbiul6OnycjkhIvARYmYkYbYfS0TzdHklTWoVT95yYHyFAnPQyMcuQR/2nddIGemRamXZBLsA9aJXRmDN17NZj/2ZDK/rZPv6jbQGwaUrzOrtesLBdKHxB+42035tG4zd89+oh3T/9GtFmrZw5ibn+aEOzoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039312; c=relaxed/simple;
	bh=zYjqs0mSP0nxnqKUq+M5ZXqgpYFJblQIKXJk7DJEU8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAQRpKlhEjnuNxArEpb67vzvJWqUmlktci2+t60r/XKmbbXwjcD717qQM6+k51TvcD0GYtZTPcqY2r/8PtKzB/pI9g32C9mOkJmkKkGtx/AE2slss7KdXjHmxN1Xj2DRGvR+fBuV7Z46Ay2s3z1v9kTGTMI7t/CTu7cx/VBOwHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVdfenim; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVdfenim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791039309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7a1SctiCKt2b+Nd5jqZyQ8jpoLFtlfz4f9NN/1vqWo=;
	b=BVdfenimWC4BsKJzavxdBhqdLo7674ObpYaJixXWzSa5VtYgrGzgNeORBP2FgaepLeQztJ
	f7X4dcDYMg2MJKaQY/9zaomellIHw3G2BQtfT1m8PD2Kt/m2UhyJXOWgpNrSgq6BLrHf4H
	sBOn7PdC4MqJ2aqy5d0qcGVMcTTupnw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-3OFrJuEUMBmYRGZPsDCVhw-1; Sat, 03 Oct 2026 10:55:08 -0400
X-MC-Unique: 3OFrJuEUMBmYRGZPsDCVhw-1
X-Mimecast-MFC-AGG-ID: 3OFrJuEUMBmYRGZPsDCVhw_1791039307
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso88382485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791039307; x=1791644107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7a1SctiCKt2b+Nd5jqZyQ8jpoLFtlfz4f9NN/1vqWo=;
        b=K2v/jR1eDKgalzilKRylFHBmXNZYb8DGi/7goHM0GKsy+iQkFExPq+5fY+fAo/wKEF
         S0m/46O7IF/qTt1pBa4FVw+hq/eKsn237xegP/LQkukn34FQGP2d8j1884HZz0dUE19A
         O7nYlMBQLwqKT1lF2MC2HJ1gveGj5oYo2dqYYmUGmhpJTL64dxtTqlPVNsIdflGz0yRW
         mHeRo3IrQaVRPVpCBiWVNHbYkqBeN7ztBVTKefhLH6FAcy7BfNL4f+BqvZ6+DTohmraN
         wNoW+icgpqBJea8yce9wrUrjrU8l82/d5117LOQ081CLgVhGNu35cvFmplRnKa7NaqPb
         flrw==
X-Forwarded-Encrypted: i=1; AKwUvBxoP+4w4OSQHiwn/Wnb4QuHdwH2VzuTUMNIiRQeodzf/r+smlcj3odE30TOqpEvt1Urta6mwd3p8sobtHs=@vger.kernel.org
X-Gm-Message-State: AFuF++kFAeVkX4pOS3V3SN7LpLo5NghuChkBOUtu4dgIFe1qOQcEXq0/
	JEcYeYtQK8lfaf7EEzDRviEZ5u/+sWYZnRlSYLGOy5zYr3Yzcqonrvtj1VeIehJv8+P5ATfoBVp
	Q8wqwwnfOOZrNcCnM0F9LIUrjhMX6xB6JbLM7DWoz+VJ0zyq80mjXqO5+Vl+S0WtP5Q==
X-Gm-Gg: AYBFou1NWWl4rjPT9GXx+oFIG2WiY5Wt9qxKDPtx/q3b0w3cj3ubNvycRI/MLWXiGFw
	8ogesSOGjGM9xH3fO3iYBZzavSOKae9Z7CankJvS8JYz+izSRG3EFXSPu9znWFWpJK6omVajnyj
	7hLJUjxqoZSfGu3aZaGphjOXnHWwx9AjfY9MrOhx6y9QPApA6cumwxlVLvEmX+X/5cHKD9XbSzv
	YShlDSsxvDvfGPQDLheyBGM5xYbSoZydrzNhoVqdazph2wyn/nSJCloBYtcNwAXUBuIX5lGzuvO
	t8YVARqU/BqRRl64mjKyO5MEnIDyZCb4jV03Crkhl/NbBe2kgckRvooA3KsIlbgJOBQKRFavmJ3
	YZ3Y=
X-Received: by 2002:a05:620a:7119:b0:93c:6e7d:da68 with SMTP id af79cd13be357-93ce7a9d9e9mr1074797085a.3.1791039307578;
        Sat, 03 Oct 2026 07:55:07 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:93c:6e7d:da68 with SMTP id af79cd13be357-93ce7a9d9e9mr1074792885a.3.1791039307088;
        Sat, 03 Oct 2026 07:55:07 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a4312sm469801385a.10.2026.10.03.07.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 07:55:06 -0700 (PDT)
Message-ID: <12f22fd4-d137-4c7d-9ca4-38b0099f14f9@redhat.com>
Date: Sat, 3 Oct 2026 10:55:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/14] drivers: dax: use pgtable_has_pmd_leaves()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <700b622814a2b294083f9066631f655cf61c3070.1789695931.git.luizcap@redhat.com>
 <388b396c-2dca-492d-8873-c9c672ac30f2@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <388b396c-2dca-492d-8873-c9c672ac30f2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 3:15 PM, David Hildenbrand (Arm) wrote:
> On 9/18/26 03:45, Luiz Capitulino wrote:
>> dax_align_valid() uses has_transparent_hugepage() to check if PMD-sized
>> pages are supported, use pgtable_has_pmd_leaves() instead.
>>
>> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   drivers/dax/dax-private.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
>> index 607a53a91f58..18a6295aa766 100644
>> --- a/drivers/dax/dax-private.h
>> +++ b/drivers/dax/dax-private.h
>> @@ -121,7 +121,7 @@ static inline bool dax_align_valid(unsigned long align)
>>   {
>>   	if (align == PUD_SIZE && IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD))
>>   		return true;
>> -	if (align == PMD_SIZE && has_transparent_hugepage())
>> +	if (align == PMD_SIZE && pgtable_has_pmd_leaves())
>>   		return true;
>>   	if (align == PAGE_SIZE)
>>   		return true;
> 
> The main part why we don't see any change is that dax_align_valid() is wrapped
> in the #ifdef CONFIG_TRANSPARENT_HUGEPAGE today.
> 
> Might we worth spelling that out in the patch description.

OK, the new changelog reads:

"""
dax_align_valid() uses has_transparent_hugepage() to check if PMD-sized
pages are supported, use pgtable_has_pmd_leaves() instead.

No functional change intended since the call happens under the
CONFIG_TRANSPARENT_HUGEPAGE guard and when CONFIG_TRANSPARENT_HUGEPAGE=y
both functions return the same value.
"""


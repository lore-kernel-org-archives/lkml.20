Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F263369D64
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039360; cv=none; b=l6uDVFHfk15Vc/zlnYtzJs369RgUnHqIMwfcGutDmqh6wFvHGcXEiLf7WzfP81J5ctnjZHhs6SKfA9ZoPpv/s+czbQ4eBJrRW369TSNVaZ0Kt5UFfSeG/poqN5DfsJP0oE+pLcwk1y1BLEd9INzkG7emrC03b8oHrSpKc96c6PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039360; c=relaxed/simple;
	bh=iiq1yOvEgqw036N7/Kq2tzuG+oUtJ9zHzp3+n8iAJ/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxuPOFKvfjPHmDago0xfWQOFh8tTuy5Ex9sbOE4GjfLsyJXvOogQu0SHl4eVR0m/m0Zp6Tros3IRe2UWIn4oVC8KzGPrHsgigfpXMSzUWn0LQ3vUChYPMDBGgQLYmt1Y7WpN3KEKodo3y9rz8P1YHAIfvUGW156PfjVc/pz5IQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c7n5ggVK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c7n5ggVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791039357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ+CZ2ko8FayCrjASuAr19+3e2iBiy5YcdksjdcrxFA=;
	b=c7n5ggVKYX1YGfCGZSAV7qbX4yULZlju2DHncdqulXCKAI4NxW0JAks8nhLNBC+5JKkskL
	NLeIDLTQ4nB07VeleLJZ7daNYYKJyHZuGWnvUAoF/NRw3XIdH8iRYjSPkr6D8s0boHZKvT
	a+0peDj9ofXaBsPOn9OuGssgNz1zcEA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-OEF5G3eRNNaPSU3WLzSqaw-1; Sat, 03 Oct 2026 10:55:56 -0400
X-MC-Unique: OEF5G3eRNNaPSU3WLzSqaw-1
X-Mimecast-MFC-AGG-ID: OEF5G3eRNNaPSU3WLzSqaw_1791039356
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-532d420abc1so9972621cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791039356; x=1791644156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJ+CZ2ko8FayCrjASuAr19+3e2iBiy5YcdksjdcrxFA=;
        b=VyIL+o1pckhS7dL01o6Gh7TIZodYgOeybIdBcWFs5z6cfuyQMkayJZyb1XMCfB1XTt
         UgSS9Eh3GbuFTmx3CU5rtf5IxTONg2M79To23VWVLl8/GKWl9Ndj13NReoAuRE2JjgYK
         pQh9PbCb1B/qxQD75fT4Kpu0hMaLDewmwBKFujfDefz3hhCDvQwPEmDriFwgBxnCo3W2
         LJNTi1LcYYDCKorr+71WiGBL8x79FqaPEYtR6BQYNwr1Zxpl1TDvSCbK3HK0kYZHH8Rd
         rZsyZrMdtrOLGn6fA2IjkvDydNKniTS0P8waOHezKlmOlwHcj+u5vhhTycZouiQRlxKF
         zWcg==
X-Forwarded-Encrypted: i=1; AKwUvBx8Z4KmqcYDNpH8Z4M4e3WmO+FNDZFe7KTqPzPvrxzQrV+qbhFEoYCH5apC+Nkte1TqL55u2v9kbwMr5Vg=@vger.kernel.org
X-Gm-Message-State: AFuF++kPr17Xer7XU/6Xx6pYP8j+2Wc346WN0osq4lZxhggM5b+ja1lI
	mioa/n7qXeuwUGVptd4HhUcZmr1vmxHjg0FF4zoa/P/JXYHJSFA4qzsqg7lwd3zEMvAaBDuv2k3
	Xo89iQAyVAhcHTK2b05KN/9JZszloqFzb/ZrE57/UkNpEKfe7PLG6LXN6nTAl/boYtw==
X-Gm-Gg: AYBFou2ngZpRbF9B4wFCS9zViElnG/KTBsVGn1fLepIyYG4Nac6U8cOKxPOKhxjsoIj
	Rj/M4wfWQh2/DitFfWr8i6qzWtp15JL6ntiW8lWE1V65mwyQEPFE7O2utU59E2DsYEIsv1YsO1g
	ed97/FVZMcm4EBw1/ZnZVWC3zYrkejQFt220RAnxwO8jHbFmmG4FdkHKCNdlRlO7r8LEt3CuVc4
	V7OiHHucbMbN9L7GUMgjWnNdCuqyBOPrsGEFdzGsnlKDtGEbgZVKMTfzRJ87WYWFD67vz2FULCE
	xPjbNAwBPS1T8HIN2zYM5J+vMFufQLVuoP6RwDklo9afhqFvcTBicualhozvxcyiFGKdGlHLPOx
	giYI=
X-Received: by 2002:a05:622a:1482:b0:533:96b4:8dd1 with SMTP id d75a77b69052e-53511e4e1femr44616701cf.26.1791039355707;
        Sat, 03 Oct 2026 07:55:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1482:b0:533:96b4:8dd1 with SMTP id d75a77b69052e-53511e4e1femr44616411cf.26.1791039355289;
        Sat, 03 Oct 2026 07:55:55 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5b6d6sm52871341cf.9.2026.10.03.07.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 07:55:54 -0700 (PDT)
Message-ID: <4a52ea71-63f1-4b78-925a-233ccb4edc61@redhat.com>
Date: Sat, 3 Oct 2026 10:55:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] mm: debug_vm_pgtable: use
 pgtable_has_pmd_leaves()
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
 <e7edf7e42f88d361c177e1baa7e2138c193f0805.1789695931.git.luizcap@redhat.com>
 <fd486bd4-c166-4b46-8047-0a777b239d01@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <fd486bd4-c166-4b46-8047-0a777b239d01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 3:19 PM, David Hildenbrand (Arm) wrote:
> On 9/18/26 03:45, Luiz Capitulino wrote:
>> debug_vm_pgtable calls has_transparent_hugepage() in multiple places to
>> check if PMD-sized pages are supported, use pgtable_has_pmd_leaves()
>> instead.
>>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
> 
> Best to mention in the description that there is no effective change as all
> calls to has_transparent_hugepage() are predicated by CONFIG_TRANSPARENT_HUGEPAGE.

OK, the new changelog reads:

"""
debug_vm_pgtable calls has_transparent_hugepage() in multiple places to
check if PMD-sized pages are supported, use pgtable_has_pmd_leaves()
instead.

No functional change intended since the call happens under the
CONFIG_TRANSPARENT_HUGEPAGE guard and when CONFIG_TRANSPARENT_HUGEPAGE=y
both functions return the same value.
"""

> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>


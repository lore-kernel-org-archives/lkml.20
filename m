Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAE48EBE4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055817; cv=none; b=GNLR3nWOYi5FUTjy5aazEstP6fSwXCUwhc4ihWK/TrZi/gNnySMkU+BgJbCgNR4Ytj8f9Byt1bNpmbJhW0PWiYE7cXDS3V52Q+BGcJlZtpMjAfILFms3Js33eikBtXzEEUdWo9ebz4wsiecYNNhnfu43CD1iD6PN23RzKNSkvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055817; c=relaxed/simple;
	bh=EFTMWD82JgKUCWwLdj58naIj4BKPd1JftX3WLVKdO9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZMLVk1KyHUlZZfFFcdIK+iyUf78vILPyZYiNaNnUAjy8rdfqbLSZA9QwXqaIeMg8vWrB0nIGbPFq4ZiwHkvX0NKP/qxIhOwB3f7juOdtL1zPc+HL2fNbiCw6l1oU1ppKwGIQzA6b189/iyYAMn/EJA69IqbgadsX18hbnvseao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g6pHUuvR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTXOts0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g6pHUuvR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTXOts0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QV0FYbYtUBn0lNewuPlKQbMKVSurGDPtsklRfGOziW0=;
	b=g6pHUuvRcoLuydNn/EpYedT+Xu8IwhLuALm73Wb1JKqSSb7m3gM+ym7TqJr4ylYnfBkrUS
	nd+w9ah5v2nlZi80SPCW3Q2P8GkOdIBbeWyVbxcEjIcZT52F8PqLUA5uJjppdZYyCovqyJ
	UuSIvqwhsK8pEowCaCbSV4tfMe4qj3g=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-yP8GclprOH6Gsn1rug9lUg-1; Tue, 22 Sep 2026 01:43:32 -0400
X-MC-Unique: yP8GclprOH6Gsn1rug9lUg-1
X-Mimecast-MFC-AGG-ID: yP8GclprOH6Gsn1rug9lUg_1790055812
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-869b8d63e28so5320716b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055811; x=1790660611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV0FYbYtUBn0lNewuPlKQbMKVSurGDPtsklRfGOziW0=;
        b=ZTXOts0v+HFAZZNoIv5U7ByjjNYNyjiovmbDvZpT6F10n3srjIrp1LbYV6HfNhUOJH
         HeG4ho1xIpwKn0EZs+BfU4zTCGRHLi6j6yxb+4zOejWqR5uqJWVZrJJ4R5S+YPVIq04g
         Vz1LJdVkIR0dSvUDAld4zWHlYaE6VYWSZgZ1c175D/GBfjLUtQQ8LEyI45CyZ4XDiiHq
         xjQM89LaHkJoEGsuGJk3L4TCgH7eJ+d97fURY9q8+tR0T0Sicasgz1ZSHGiZ5PoEp6pE
         Ivnr17BL4aq/RITtz7BePF8pw3SPp1wFKv0ZJGpEsOAL73FvBbzBGLA1ZNHXJGAEzdhT
         fmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055811; x=1790660611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV0FYbYtUBn0lNewuPlKQbMKVSurGDPtsklRfGOziW0=;
        b=H2Fyk10eDkDYznS6QV/TEzNSA90ytawzfFr2HuGM1eG7L1BGctsAhJvOmL4zK77GIT
         7KvUG+zCaBs/ndgjl9s6jsP6LJ6ElzRmD8B580Pwwnq522o01Xu2y8qm17UNpcLJodrj
         LykfMt/kLNo0KBTi6ihvNgUTYcxXqwokdkcHsFy/DYWBMV0NnwsL80ZUa541EP7E+fq0
         7GkbamjyRwBLnSS/j50AY5Ce3VaRUNmkz+uxX+3zNUUR+BBe31LSfi8XFmquuciHqWXE
         ZCEThPT2GJeBAi2KCVopV2ra1MtAGkWAvtjOPxQ7jSZcjexFPCdwqrCK8Zvo1SQEbQXW
         huwA==
X-Forwarded-Encrypted: i=1; AKwUvBwrd8heTEEVIfzKCOnqLzfkeSvn6cpQSXfPVz4B75XklnUH2X3VXHcu1B49RQnRWeHvFfqz+7gyf0dFaqI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLR8oiIhxQ30eFcl8UbSVLlJXwKcWApsVO5mCFZnnsK5Y5iveq
	8ao21INdygfev5IyxyTdTD6a/H9jZbeRVFkDwIyb20wvmgNFsXba52xpcAbeSt/9MuIetHOtvnn
	fNZ+1SGjcSuYweeZYW4c7SrbDPOALFUOfWDCKPiGZDzOqlGuf5oCwMUzH3uRfYLOAag==
X-Gm-Gg: AYBFou0w/ISqBHwSptlczivYhbjTcZJ+tDR+6P+iBD1As+p6X7TInB9Br/c1hG3oKpe
	g5WjwOC8fYmSobqUDluQKIDxaKzz4ojZynbk7RZ+gHzutPb+MhY5Mlbah5JlFj7bi+rHv4eai3E
	AZHKBbyBAyQxQ080U48jF9rnI/GXaP+Gm5CwbaDV6acEfP+JMIYWlHbaBB/t6J6SaOytZYiewCL
	lHw5Wo6NAE1PHrfA13oZlTTbg9Y6tQxS8gHLNtNBDoPnv6QprvArf1Q430wWRVud+i6GX3nauzD
	BbBixsyU2QGZQ/91u7qEKX1hV4LGXDAImplZ4/kobQ6Eyrvvgqf3DYbx4EpG5mEJluoyEt/rwk1
	4r/EkbElYY5+LVnH8ywHFe7zKup6Y4RvlRgyusA+eww==
X-Received: by 2002:a05:6a00:3a19:b0:87c:79d8:fe7b with SMTP id d2e1a72fcca58-87c855f70b8mr49667b3a.59.1790055811588;
        Mon, 21 Sep 2026 22:43:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a19:b0:87c:79d8:fe7b with SMTP id d2e1a72fcca58-87c855f70b8mr49644b3a.59.1790055811123;
        Mon, 21 Sep 2026 22:43:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c32bba517sm277553b3a.40.2026.09.21.22.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:43:30 -0700 (PDT)
Message-ID: <46f77ab6-4f7a-4a40-b0e5-3ea92659d7a2@redhat.com>
Date: Tue, 22 Sep 2026 15:43:26 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm_mpam: resctrl: Correct check that existing
 class is L3
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-9-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-9-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> The class used to back mbm_total_bytes can be either at the L3 or the
> memory. If a platform had candidate classes at both the memory and the L3
> then, as the check for whether the existing class is L3 or not in
> counter_update_class() is broken, the class that will be chosen depends on
> which order the classes are considered and so the probe order.
> 
> Fix the check.
> 
> Fixes: 1458c4f05335 ("arm_mpam: resctrl: Add support for csu counters")
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


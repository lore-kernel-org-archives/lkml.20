Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED09C3EB7F4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055714; cv=none; b=RcKTWw5yWk5et3yubq9lgi6LMEW2dAOBpO0dCoSb33QZfC6CQsSrGCDdmN/ilExp+8HADSWC7qqtVm1MEh/JI3XkQePREPAksnx9iFhKDMalBQ63NSiicWeIO3FpRBVbSEqQ0oV1tlx3OiZP5+HiArB44sA7Juqj5BRK4bQMIog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055714; c=relaxed/simple;
	bh=pGo0r9n78rd9sxDXe6QCr4XdqCj9BzK4c3ptDUJfUFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioPrZ1syhkbmVPx0O/+DecA2B5nYEEh2YAlW4yH4exBN8+QBbDThdyb4SUjFpbBlLGSzERDoWC29v4GeVjs9JUKbLjFhJAlHPkl2dpz69XpYMcW24RQcglXjKnEf0NJqTpjkmO3b32uk13qb9ae/hv/6WwPIe76jYQ+HPiufQK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RelkgA5R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExQ++vRb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RelkgA5R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExQ++vRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4HC1mdDQibwZbY5oZNDaWXuRMJYw/6XZYpkXODzj58=;
	b=RelkgA5R5h/dJCtsTl1YKwVSgm2fAQvE9x8wDqihQ6aIZWCiI+MZ7wX/0ockuAPWzflZC+
	6PU9qhVNCuL3dwm3rJykMCAZWLZg2dSMn621n9Wr9PrN4tJ5bCb/SnFuU++NSSkL1uxZ0h
	NcfN/j5D7GRHyW6YEqspuT4xxvEJUlI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-IEF5ykvjNtiwWp_4Nj3yaQ-1; Tue, 22 Sep 2026 01:41:50 -0400
X-MC-Unique: IEF5ykvjNtiwWp_4Nj3yaQ-1
X-Mimecast-MFC-AGG-ID: IEF5ykvjNtiwWp_4Nj3yaQ_1790055709
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so30220115ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055709; x=1790660509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4HC1mdDQibwZbY5oZNDaWXuRMJYw/6XZYpkXODzj58=;
        b=ExQ++vRbuW83TZHtzBtlsIQYmwk6oWQf+DZqFUAQbLuj9UjeV/M8upqztBtafbCSom
         bKU/vrSfZS7nmWtbx938yvkt2iBz1PqMJftel72NrkrAUQoKuDuIJNZL1HDim3+Ak82u
         V3VOzAkWFuGppxE5Kx86p6ToHwqbaZCTJtTj0q7bloc7IpR75YMmpl2T00u7bmK4nclQ
         VmRxLW0cz3S3nEtqaf5Uuw68o7QKjbUq2/ZhDplAvJskTayIgE1nb6mVPjIL5B0YxHgH
         gMZLhFaFo0mykzqPwBVTpL1lR7Tro0zDCydXhMdZhbOwemLqkEodSae9Pi5tEN5hqUT3
         Cyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055709; x=1790660509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4HC1mdDQibwZbY5oZNDaWXuRMJYw/6XZYpkXODzj58=;
        b=J1FR87118qdudWKo91UHymKRqwLj2m0KoSLbB+A85mGh1H09QLj9slq88QlNVsMgaH
         xGgOnA/b6dMg1uYhGwWCoWOcbt6cvVMVaS3XTphKSYQUkIyK3o0DqJZPMVGlQs98MoOa
         4QIbJ2jFTcFVNeTiVPt3ggWSoJiHLV86cwLI4f5KBupdmOqDgKjcXIMlMCbPs8cSZ3a2
         oEUUTnYIr2Vi/V1Ecod1w05wSMVC/tn8NWMP/yD2wp4CTyDPNk9ouvYlD0+0VlHRIX6b
         gfQ80pt6O5yNoiiXANf1jTi45z0iof99G4e38tGnYl/ykJyHJIy1oEl4BtuEnuO+hBun
         +7Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwQazepvqQu1dM0W3mVIiTXNqh0l0JKQmpWiBhbYekPNPQ5EKbF1t3nhHnHmuyn0Lzb6bNWkqNfglkRcTg=@vger.kernel.org
X-Gm-Message-State: AFuF++nBLswVP5Ouk/HLXYIGcicCjF6knsMDTvASG0DA4AzD4rv0q8zd
	C8c9KChPpYBHEqIgdho2gjNCmgo/RHqxaHcrLTeCVL+kngsqhTYJ63hhJ23/s0a8AJr5l/LUANh
	ueVVG9AdiMgDsbDiQVf0WqYf1udwpbdVshkiriwSjipb1HB8W2jpROK8E/0pH8ePcBw==
X-Gm-Gg: AYBFou0UxGcBDcS225l+s0UEVXOKqpJaAUDsD8oaTvpLrDwYa9VW2BpjJL8mwM7cND7
	a+ln3OEqhEpV4o6NiSqBXEwimQusfLrsQYFe37d3tLoVTSuKD9u327zNWOZ/aWejZ41TTEs10tN
	4MDQ4skuXEy8g7v9ih8oZAtKP1Jl75rakpNMRB27utiGRQ4klIEXOmWSIVHwe6OiHC7Qnk5eD/1
	JlnxXqYEmCTyaXnLg9YEGf+XgCs2soNavL6573MwMVD1KppfO2RLtClIXezW8YOQo53NU991+Nv
	4dfh3d8iiArzFybROUVS616Xg4H9+tqqldMnMgYxSiJ3cri98TCKk6RL1JJcmitfZLc50AopUr1
	7gkuiKD5CY1cm5maVQ3sQduD6C76jojMl7KpnGCqaew==
X-Received: by 2002:a17:902:e951:b0:2dd:ad73:c989 with SMTP id d9443c01a7336-2df60add9e8mr1117015ad.33.1790055709378;
        Mon, 21 Sep 2026 22:41:49 -0700 (PDT)
X-Received: by 2002:a17:902:e951:b0:2dd:ad73:c989 with SMTP id d9443c01a7336-2df60add9e8mr1116715ad.33.1790055708974;
        Mon, 21 Sep 2026 22:41:48 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d019fb1sm3587565ad.17.2026.09.21.22.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:41:48 -0700 (PDT)
Message-ID: <beeefa59-f976-411d-96c8-2db5d2d13403@redhat.com>
Date: Tue, 22 Sep 2026 15:41:44 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] arm_mpam: Move MPAMF_ECR write helpers to allow
 reuse
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-2-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
> handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
> keep them together.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/resctrl/mpam_devices.c | 38 +++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


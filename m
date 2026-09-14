Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B2C38DC4A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366489; cv=none; b=KQhXRMSRW0YVA8KAEai3ghkyCTVJezDMV1zMIIrA58zHNmCA1l1ZL0gDa5T/pZkYwIP//8J85r9x/9iHOskA9fvIfjHZQEoYTGQk6sPRzScm8hTnUZ5wGGKXK9Or8yWOjJRX4KvvSnA8sMszl9E7h7wyn1aiPx4Y8j0pUgiQB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366489; c=relaxed/simple;
	bh=90G1Lk9o08R+G1qA1NS44oTM/7XjyUNDLJ6gtrcf/I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDJ2oGBoKNicJ8BdjFEZIUI7SEra8X5g1II2IuRLK0EnlY64UibdjHtUxLYM9OZJpwfNzS9o7vCnt4hYwvIQa3naPPKgB9Coje4nAuUf7ow7algqgErRGweqcIRfO7pWa0tMQYItEjFi2RJ1/40sw6wyh8KUyzeLNSorVDTNopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+U0hxkn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GFfkihUS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+U0hxkn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GFfkihUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789366486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd9pq4IajkU40OjK2aSbBzLMMvOXq0c4ILRQjYEobz4=;
	b=Q+U0hxknzk81zD962ixpY+1GoQUkTgODlIS8nfOPyTjZO49ivthEGhNiXW2+/cABgevKHh
	ZNfRuPoRnsdOvfgfRZ8SZiibq7udRs+GV1N6pChA4ZqJs2OyDkC47KBXVjtDspfbbkkR1c
	5qXGuvf377RrnFPabRLadd+zwTN1FNI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-NnK1R6rXPZ-tByB3xe_WIA-1; Mon, 14 Sep 2026 02:14:44 -0400
X-MC-Unique: NnK1R6rXPZ-tByB3xe_WIA-1
X-Mimecast-MFC-AGG-ID: NnK1R6rXPZ-tByB3xe_WIA_1789366483
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4063820a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789366483; x=1789971283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jd9pq4IajkU40OjK2aSbBzLMMvOXq0c4ILRQjYEobz4=;
        b=GFfkihUSnWsUiMWS2sRgSYGR9ONKAw9W+5ltANDKnmkcG7jO/9P3SCuSXJzOe5riWs
         cVH7g/g8IX/yUTIbUTb3Z/W2yKi0doGSYnnS33fDAe23f0Tjk01kqu0yred9D5GSxZWV
         DKDq8Tk90XEbrQD6+0JvIIovg69GmqIr7MBMB2Q9o1BRe86k6xiDj9C5HRfI4GEC8xO2
         ao/gbE7giNBEcwaV7x764TabgEJhoclCfO9ty/mkUqbVIbGDnuhATkFdw9b2WdQFgO60
         /klWSp12lNsKlwd+r/RXnzsVQrJHnFQ5X45+SJ2CaywJXOv8EkI3CShM3atPOhOnpLeW
         WBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366483; x=1789971283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jd9pq4IajkU40OjK2aSbBzLMMvOXq0c4ILRQjYEobz4=;
        b=m4yplkL6H4Vz4OJD/alifRdfwhcjWrCdxmLqixTc19NNHJKFzBvoC9m1P43LaSw1Nt
         Az820OeK6cF/rtuHGELQVBIdZM9KfKhMCq+D160zKi2o1zkLRqA1NYrKOyFtcW5limMn
         Ieb2G9spEjexnZ+Ubc74byObPpk0atrBwfDshsTwzlbVlwrIzBE9zRWxg0y49agIdhSt
         SKRfJZehs6yYrrxDb2z3UQQkh5RgdS90gxA9pCbT+5x/KOQQXcuKMDHGMyK6Dh7ApLYL
         aPA+XiEgc/qeM6InNcU3EV4PlvMx6WoEj0w4XEwDSSoRjP75d/n8ixAV0tKB8yvehxri
         fXwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmHMFlaeWi2QRWhq8rn1hGF3oCj+KZRvSeNfCniEbzNAlSjvfxGI4zKZWiPZiEgNgFWrrf5/JJwzl65Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++mgPSpvJAOrpu3EBcGORNynaJVxRdB/xN8W6EpKatJbvkNsunzs
	36526jZ60bflu1OEql4iAgVZYNOl93JK4XCN1FWiUiJ56alye+UI2O6ECcCfr8IKPFHYF1HF5HE
	ZCQp6c3YTUDAKJgR8cRuqraHws6H7vT+jRf6e9peW/X1/XPRSucu56F+i37RqHrW4gA==
X-Gm-Gg: AYBFou3u7JcxJL+xUXKqn9kOyMKqQn8+TcFKgdSrdc/KMryV7KToWqVgU7RzhW5EbsN
	4IhLHYlLSV+PBxs4cnBCxEFQBkAsagKnOpq9RAjiHhZoGGEmM+Dgn/W0duapZ8B+mA49W2pXFFb
	dZtLVDf+9BZtYUo7L2MJEM+sh4fclt/9p55W8wiZ0yNcXfusP06nK4ZKgZrsViJj2+2RIKuXQKy
	NIz7iux+kUjjX99+LvA09FIg+XdjAWEU6zFFeqXE/F8QCLhcLRCt21GY4HxPMflrOqlNtRP4tuR
	JRYWSxII1C9Am/c2UgUI4LffVctMpwawERzEAt1aHaMKbbiGEIJmqmMYk+MhgrgCcdEIhV7ZexO
	boHnpLJj6LbkelQhCjxrtn0azp9Num51BerS9MBZz2g==
X-Received: by 2002:a05:6a20:7283:b0:3da:d45b:3930 with SMTP id adf61e73a8af0-3db4047e387mr1757618637.3.1789366483430;
        Sun, 13 Sep 2026 23:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3da:d45b:3930 with SMTP id adf61e73a8af0-3db4047e387mr1757559637.3.1789366482958;
        Sun, 13 Sep 2026 23:14:42 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab0dsm4311139a12.6.2026.09.13.23.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:14:42 -0700 (PDT)
Message-ID: <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
Date: Mon, 14 Sep 2026 16:14:35 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 12:37 AM, Andre Przywara wrote:
> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
> error value.
> 
> Check the returned value for this error condition, before passing the
> value on to other code, which would hide the negative number in some high
> value in the unsigned type.
> 
> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953ab..a5e661eff86d7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>   /* Find the L3 cache that has affinity with this CPU */
>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>   {
> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	if (cache_id < 0)
> +		return -ENOENT;
>   
>   	lockdep_assert_cpus_held();
>   

find_l3_equivalent_bitmask() passes @cache_id to find_l3_equivalent_bitmask() as
a 'unsigned long' argument. Actually, it can be 'u32'. It's not directly related
to this patch though.

int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);

can be:

int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);

Thanks,
Gavin


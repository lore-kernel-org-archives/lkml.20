Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809393;
	b=2cj3M5iran6hQIVYksIYKTWahBhwODEXsOa3t4qami1CTBOBkUogVSoorTVBU2j3D5ep
	 BcbIGyHG6NEzSy5/qSGDVaMM5RxmbTYmY6JT5y7z7oMv78sMLIIG7RpG2P1DcWdsSFnMP
	 HQFbyHpWNtOTogpLWj0JU39R3D2nRWINEmpx/raDg3Q5hAhG9ldBxYZySN8wcPF1nSSGF
	 zaeULwNe2DtJZO88h/6ArTC+6JGWEczA/1TmRAEp+mmkiSuH6If4sKyBK6uGV09M59mNN
	 mgbqBMehoWIQd3zY7x/MXoCHKqKrlVyJz3c5riIO0670X0MeF4l2Xc6Hy5aFdT+UJXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vocGYEw/5tonadEsgL+tN2/v9RawaaHXU9Cku3rNbjM=;
	b=2brr5zistebOdmKleMcmptgQPh6lgko1rnwwgjAFDdMo/CQ60wAy/4ekuUJZR3hDK/gh
	 SZm60l6pO4O5chOzr/+eGl7n7GEvcqjmORvx2A8IqRQDAE9KzLWEnCXQXQ/Qqdlk7fILF
	 tAJpS6ANePvF+2vCl2bAtYKJRCYoYgEe0XUpqMlW4rrhu5H57+H6bbPimgTWzMtMsWWXp
	 QEVI+5ZdFo/5d5rDDftcCe2NXfWgRwAnj+6/pk8NhFGzAiiZup6P1id7Fy6J1uPYX/tiC
	 Ma9idiZgWSFk6vCD/P2IWhnMefCZsfuvGH9k1wcIyhqQ1o5QWDoSE+T7caxQ07TKWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OfBHQzq3;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B96606D80F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B96606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OfBHQzq3
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so12542835e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793809391; x=1794414191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vocGYEw/5tonadEsgL+tN2/v9RawaaHXU9Cku3rNbjM=;
        b=OfBHQzq3oKvaoOFRoHZC/AgPU6SHQTh8Tn5idn471YK/WW7khloYoayW8Miad1hh/R
         KTc7jor1qVubUrWQg5V/EQUqhjaIYEmOPlcmCvmduK0bPEG+qH0SofyMwQhX1qq/jLD9
         Ys6NJrQnAvEuV36Z1EOknH8puwbPth1kq5JCukPwMIFTDJZuDZM6V1lZmTauLqIOgglP
         ItOQhaGCEgY9eyhrxBcJh6mK5QNpkHYUjVc0vWfGL8qNUakZeutNp21/PAUmX/S7c025
         J3X4tZ3V3kfN+vE74GoZsRwqv2GdRW01AmrkMZ2nVZgQwm5fILOeSN3G7j8TlKScH5I7
         BYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809391; x=1794414191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vocGYEw/5tonadEsgL+tN2/v9RawaaHXU9Cku3rNbjM=;
        b=FB18ZkYvNE3psp3vv1gsGhCkiAPHGTeugJhvi4SXCBfGRVaEtasLc586kH9BNRliOY
         jz8SCwCXkWmjMgHqQwg4myT6Be9K6eOr5HL5D/d0WcWBpcCcXgABXS3MSaJP5y/23DzC
         t9urd+VNOdBJjAd/q8IjAbIJKJb3vfgMPFBdw+lSMjhojJsP4pNjyWONKGXEdjNPrc85
         zgQ8istXMjH0KS/LCBSWS4Y/w+oIOd8+LgrzUamKnb0+Yhpx2l2Jqc6b0Vm7BEGKQVKP
         5i4fuo3+F7njx4uqVg0tSKGqq3AQT33+feVM7+xpAMMEGe7UIKT4CxYRbWz2uXGCVjLx
         +4xw==
X-Forwarded-Encrypted: i=1; AKwUvByKWRyZewMg6+8EJGThT9nv43X8NS18o48WdhhNfjhO+YodG+Hpcsrf43uU9KjSNsBb2yj9sNv6Dc9Y6zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PAgWdUvrS74/ZL7hLqzzfmgS12F9A+zjC7fA7GgkeINVn8Jra
	cOpURk/RsvAcTgBEN5zShUaIr4cMH6LKGfd9v714oKRUGf/A3uBKD7I1i4uAZ8JuQvwj0QMJu8x
	EgdtXqHo=
X-Gm-Gg: AYBFou3CEqUcte56gRuBLL2SK/LXC78V/cGb7p3xBAtDPvNcophBUBhVEOgBZf8bc86
	y+8NEteifUdYPlfNfH4V+/Nx2EJI19th4twraOzcwYzWLQa2JJ/zh4Kr8yzHcwgC7+72cpqnDPF
	QZ15QyD2XeKujq4KAc2U8l7rFTFyIEc8azVzlT51GYFjnq+FtD7VU+wYOq11C38Rcz37+6D12Sk
	jSk/BskSMy8SIzPw+N4R1soWE/yMrCQHTPz5hwifOzSCb2UcWfIRHXKvXfr3NHpnIKakAWLliKF
	tTSmfKx6mws3ezw9n4J3QSLeic2h22sGUc29GntCEYmvGYb51bwJ6D/Ej32lJ7HXSPNGiO9vRP4
	B9Cb14V4pengN4Avk1XUQd9WfSQdeeCrwI2RZjc5M+I8cm/Pkw99ZwVy0643bphUfu0vCK6U6gp
	4qUp0xD07atCFPTOncE4hPh+b3jNZRXHozXxlzbQpDT+UmzkERHvmgCiNKxa+XFAamhEtxoLyUn
	F0pG2J7L49IVFErnoYA4Z0CO/LU9tC9pSBrlbRG081DTvPH3nYcqXq1TJcul4H8PxhFq+qig4VF
	UZbuCFQMZllan9n0b5RZJka/2jJczjxW0v7Cu4f+fw==
X-Received: by 2002:a05:600c:1907:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b55c8743d8mr75395e9.3.1793809391436;
        Wed, 04 Nov 2026 08:23:11 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm168477495e9.1.2026.11.04.08.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:23:10 -0800 (PST)
Message-ID: <f416b51a-0775-4834-9e1d-af8a72d9a1d8@linaro.org>
Date: Wed, 4 Nov 2026 16:23:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device
 node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
 <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2026 15:29, Vikash Garodia wrote:
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
>   	if (start == phys->start && end == phys->end)
>   		return IOMMU_RESV_DIRECT;
>   
> -	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
> -		 &start, &end);
> +	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
> +		&start, &end);
>   	return IOMMU_RESV_RESERVED;
>   }
>   

Same feedback as @ the last version of this.

I still think this behaviour change should have its own patch that 
preceds this patch so that the logical change is clearly explained and 
understood as a standalone change.

Supporting iommu-ranges != not mapping misaligned ranges.

Otherwise this change goes under the radar of the new functionality 
addition.

---
bod

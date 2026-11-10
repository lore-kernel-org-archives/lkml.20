Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324525;
	b=fUVKvbzj4UW13Zjm3UgdWP9RT4sSNAqGGVA0MtljjyFmJsYW6HzRVuWL/jlWCm5qpkJv
	 VFmQHePBlbbIWZMqJp+CH1EZCcV7kmC5P409VNZq8UJgYmsuWMO69g7Q+PbkeNP73uJmX
	 R7gujm7/ckamR0l1cGa1p9zAYCQphrB66kHq9a+aMz/D4CyFrv4MHIxL+0L0MRH+WG0Zf
	 DzWK//n7HZZjZIVaGOlkPuWmGw9stlQbByqYVfvjm3ef2znV0xT7IxlyaRJbboPTBLtwn
	 soJgBIwFdZgpMJYisenVGC/RdMBY3KcDKs0HrsF9gKAI87Mj+jFtE1aOR+j9lp7xYRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=m09xLtEnG0I/PYQsE4dhMAVWShcasniD6HSBtBOMuLY=;
	b=xubMSyOlaPuaWnKgKDMxiglkkJv28xRdvsMCEYO6E26h3gmQnPAfSxnW2KSOxsevGzY1
	 n5gZbyjIaCbatqJ9oGuQBjjo7DbhDevj0RFKtXbRa+B1jvg3th/YUiejL38sldqKDhUa/
	 HIvVof8HHXSC+UZLwAYpITRZHEAk4OodAwrznqQDLW9oaumnueCo1MCCwBChdgN8yVEQ5
	 TXz4RX12VPP6CD7wGrn0CvnEb9BR5vTy4rk1FvIp7wDKkNL1H+nojPFZvsiSredCb1YzO
	 PH/TOUwvf9+5dT51XWmcxBCp4AqJEfo28NNG8E5mDasZU09qNpeRme1rbBIr7yTqfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HKa9IK7R;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773D60A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2773D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HKa9IK7R
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so28780015e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324523; x=1794929323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m09xLtEnG0I/PYQsE4dhMAVWShcasniD6HSBtBOMuLY=;
        b=HKa9IK7RGo1gEt5OcGNhk8HYTDw/WjqOcjjZA1u1lpbA+fPecAmooC2mrDu4teRTfH
         FDx+glVdbEqC9D7RwHgGB+/28hvab0olVvqOmvdDhVyi26mSlxM+xdyiBEU1Y37+SOuc
         d+Bc08USvgv83yBCPh7sxZdWoqHArOfdDuysDzvdOrohCxo6tu0DGINxzzUKrBGSvouE
         fupRrBorJ612AUWdlLUeuxWH+MUwZl0j6dTOGyKR8sFRlrBaYHf8y+aHpspUX4yFHs31
         ZGs0/MVpHrT0beWJOkfA0BF5QIj5f1LnCv+rBZ60dbxOywVdr1DQ+v4rlC/SesRrVjDa
         3GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324523; x=1794929323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m09xLtEnG0I/PYQsE4dhMAVWShcasniD6HSBtBOMuLY=;
        b=rYxXyYYJq0EgCf6XYvqy2SmxvwNoybhf5jzzlQlq+x3H26TJwjMQxqWUyOEigB2+J9
         NJ+R1gm1hFd9yKiuXEqctToqcDnx10ePOXr4Pi40B7CxG1RUixsxPnhRTxdK+DwHcSo0
         xvTeFoqrAImOo9bQCDpVfxrftnDty1GC1LMvk7ysTIa2N3ahLIomgb3prokACHRjIiTe
         NBdt3ZQC4MAamX4p7woNzSRcl3Y2VfYP+SNc1RAR+gZvaQOeYbZbwlvwQ8Q7hBug8ECb
         h9ksQl7OCbRwpNs6qmyw+dMKriwlWnUiJLlDTHO+UMDXAo0+6tqkV55bGr8a0H+caMhY
         F8/Q==
X-Forwarded-Encrypted: i=1; AL+hErF9O4/TURe5Ce2xYQwh88Pv46lCDk+5YnoaeuybbY4RpQw/punu0wM6RvU3vc5IbnpTQOBIX885Cd/EQ3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vgu06zj9Hctd93Z6v/d68YK69P0akaVl/nPhlHWUoXhy9+jcj
	sMlwOfV9ax4OFrwMVADeql6xhPWZt5UkEQqOJY/7jiwwFhbcfDFCylJcT4QjQlkBaaw=
X-Gm-Gg: AYBFou2myGi2VbTecSvv6R/9F9QyGollmcd5MmZdnL9Ni/UeGpkd3eqgZl1L61sA0B1
	K35aWOl7QMKVMTG7GuYQs5/QT1e6I5psP+ZODmxB2Og2y+kta+AA/bTI7mqhAiJBnVL2i6Kk8qt
	j2vAoEvYJLS/wZpZ5xlYIU7f5i6io+lW6INeUNx3ykip9I49NqPWL9sppP9yhVbnXKJUm7qYs4e
	qlDuMAL1fKVxYMdzBk3GV+l+68gHb6+/nQaWCARTOGbxA1NGPM5OrXP7Wz4NWqnUeL/u85tvnrf
	4QhXof5Vy6Utr7FOthie8+4IYvlh3iDc4RwtGSRLjSQicl+DbAGyU09in9EqUEmDwpnDbzm20qa
	i+yfOzoHBlFBe0ng6lb2Oi/2KZ3BhckwbLHGcsQukR6l6AYUmyAefFLl7Ejcm4Q5pGtT0s0NL1T
	DvNjI65nB/SurofBwJ4WC7ER7JbMFG7VQNWEA6cozwhVO6QUM7ZVcFKZhHKnvAQngnthV2u3nS9
	ZgIZ3ThXz8R4p1llMJII3TP6G6QKM4TUz9nYXLcP0xXAvz18fDCn9IT+zqlgZchCesieWGjQ5Ja
	LuOBx7sh11RP8gHgA3/wkQVEtofGkAzYkw==
X-Received: by 2002:a05:6000:1788:b0:490:1881:80ec with SMTP id ffacd0b85a97d-4982f689f67mr5667739f8f.36.1794324522856;
        Tue, 10 Nov 2026 07:28:42 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5574512f8f.44.2026.11.10.07.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:28:42 -0800 (PST)
Message-ID: <806ba4f6-b021-4eb5-8841-430edc87dfb6@linaro.org>
Date: Tue, 10 Nov 2026 15:28:41 +0000
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
Subject: Re: [PATCH v2 02/23] coresight: trbe: Make watermark range check
 overflow safe in __trbe_normal_offset()
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> The current code checks whether the wakeup point lies before the current
> tail by comparing against handle->head + handle->size. That addition can
> overflow when the monotonically increasing perf AUX head is close to
> ULONG_MAX, causing a valid wakeup point in the current writable range to
> be missed.
> 
> Use unsigned subtraction to compare the distance from head to wakeup
> against the buffer size instead. This keeps the check correct across
> potential wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index eca8e13a97447b46a4b383049aacb3fa7ad3c329..02d12445763a86d58c79bdf5143f761827456bc3 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -526,7 +526,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
>   	 * +----|---------------|-------|-------+
>   	 * trbe_base		limit		trbe_base + nr_pages
>   	 */
> -	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
> +	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
>   		limit = min(limit, round_up(wakeup, PAGE_SIZE));
>   
>   	/*
> 

Reviewed-by: James Clark <james.clark@linaro.org>

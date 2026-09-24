Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3848095A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281347; cv=none; b=IUBjPBYeyI+AlxQI7TIta8vFLzMXnViZ40yVaYZYLfXMVYh65/oSD4BVpa79saM5Z8+o5l1UF5LD8dB50QggVlX30fp5n4fumQgoOVFr70Sgaa9ARpAkUVmTDyQhM0Qg6esRkoC3IgN4GfzWmaoEcb5M+L/gQ0zBoKBewgmORVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281347; c=relaxed/simple;
	bh=N2Z+HZuv6woGxKY6m2S5v9+oHAubeSHVW+LqkzilpMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpcRins/8Nh5zuLsDYdX73BHvKCisGIQyt8SVH1LcAL8KsJr1T/6Zwt3pqhwt2yU9BkkxPx8VzW6G521Qw7qym3Sal7PqCrukSvlCZBFQTaXao30Oom4nrIcgJxzmMc9olRUK7mhxV3gdoBSWzdWkbq+s5AFJkBLH63jjP3/N0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYgDD5st; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYgDD5st"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso1128055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281343; x=1790886143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=IYgDD5stHR+vrYlVg1GwyeD3UvjbXuBmKVOCUSmeRotQWwnO6vtmwCn7zTvhjAzAbO
         6a64ELioGpPBnumMZ6H9Pe+lu8ZKIKeY8hrWJsb1uPM9N342yQtTsGmzQ4JAp2c7cRXe
         RV+AZUzianNB2I7kuTmlu/C1BR2N/dAvzRxuUHZNMs+PHu3E2M47l5gQ7ruzTyGXmnKq
         0ov1zBsovDHAahD/PQXQLFYASZJEpfUKS/nU0OCNFEB9aXhAQUE5hfb4KPjTgpKkqMcL
         06Xy51g4QjYe/q/FWjL7Wf5ZqH1HPgPwcgXtzOuNkdPtGj4Lyn0uAHRh5tXkl2wbL9M2
         JNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281343; x=1790886143;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=12ZsRWd1k6xtXS5KHecVBvVXGYPs1JRTlPavK9rNXA06cydhSkzU6nCEEqi5NogR37
         SFhxl9SfXaqFeUblqaALIyGqx0TCac7UBMRviiCkhYR0gBaqK4RX5sNUTBShoi9pWSww
         mDJnLzoqna2sDJwNKDtjvJF1rfW8FTeqQWarDlKRUwNkRcX+sJpypaDxqFlt05BLBkhd
         opnIz3E1+FvrBlgC00/xz2R+e70ElLlHGVe4UIp1d4NSSe3Hz7dPx2N3PGuSC/s31uBa
         UYhcQnDP+miae9KPyDFpuOmBUMU64Ii30C9Ogo88ec/DrdHWOhjbFYWwSBZDjUsmGaTS
         Iq1Q==
X-Gm-Message-State: AFuF++mEsR/0emNIS+YUVBWxXZpwZtAki2UGJcjpODp10kIUtgkEsjEE
	j3xWOlj5hk2N+GzognI2034KF/+odrg+mUUBqvsijtk7H5HkyF++8ntC
X-Gm-Gg: AYBFou0xsFCM4TMu8zLUxOqlTRDiP47vZ9KvF/tbxFrUe5hwd9muVpyYGGlBFvGzoVB
	d/BKIT1Q9jfJmlTYqwYbvRaw15MJhIKV+BJWGvssPF/8bd/9MRRfqmLMrSUkHXXfcwYrzLtrgq0
	Dq89ZkV59R9ljA8BJd5u49+SGsTsry569GsrXrjv1cr084K6sDINd4gLizVYG1wzyDuHdkDOX+x
	0aL3odzfPhFml1uIdvjjMhb9Yc64LvN+y3f8Sy7T1bycXnw8vT1QnjvCu2zYDJd3q/AbXFJgOe+
	ypQefs8iMKfENnhBfD5qLJnVhC8J2Wb2Ejzixq41FT9uFKWHkXSCUZWe3BS3vIfNcMC8T3kz8DY
	cORwNeS2lexLHefZuZkz91mWucoRzgESSoQQFtlmxSOgsvVb0768zngxII11Jv1ULvAZh2m5JmY
	gwzyKnaRv0z0cS7074D7ZFHRlUhjhb3bnWp/eLNZ45UPdKXJrHXr3pMpqt5NlH03skY8RBLCi1a
	s+mFngNc2Uk+BcT6X1k808RCXNeh00uKQRY1Q==
X-Received: by 2002:a05:600d:486:20b0:49f:e941:e26 with SMTP id 5b1f17b1804b1-49ff06b2f01mr1636645e9.4.1790281342890;
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm3413815e9.8.2026.09.24.13.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Message-ID: <bebf5c3e-74c9-4355-b4da-294a87549d38@gmail.com>
Date: Thu, 24 Sep 2026 22:22:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Content-Language: hu
To: sashiko-reviews@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
 <20260924200931.6ED351F00893@smtp.kernel.org>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260924200931.6ED351F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 09. 24. 22:09 keltezéssel, sashiko-bot@kernel.org írta:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mtd: rawnand: qcom: mismatch between commit message and function prefix
> --
> 
> commit a83607e63ec53429dc425262093eef9dee3bfd4e
> Author: Gabor Juhos <j4g8y7@gmail.com>
> 
> mtd: rawnand: qcom: make check_flash_errors() more generic
> 
> The function gets a qcom_nand_host pointer as a parameter but it is
> only used to extract the nand controller's private structure from that.
> In order to make the function more generic, change the declaration to
> get a qcom_nandc_controller pointer directly, and update the callers
> accordingly.
> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index d7642db2e2df1..12bfb14cd9a37 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -449,10 +449,9 @@ struct read_stats {
>>  };
>>  
>>  /* reads back FLASH_STATUS register set by the controller */
>> -static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
>> +static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
>> +					 int cw_cnt)
>>  {
> 
> [Severity: Medium]
> This isn't a bug, but there is a mismatch between the commit message and
> the actual function renaming.
> 
> The commit message states the function will use the "qpic_nandc" prefix:
> "While at it, also change the function name to use a 'qpic_nandc' prefix."
> 
> However, the code changes the name to qcom_nandc_check_flash_errors, using
> the "qcom_nandc" prefix instead.
> 
> Could the commit message be updated to match the code, or should the
> function be named qpic_nandc_check_flash_errors?
> 

May bad, the commit message is wrong of course. I will fix it in the next
version, also in the the other patches.

-Gabor

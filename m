Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848727;
	b=U/YYrIYNT9ecTGlRGfpmNdkxnNu3YDjLfbGKGTR/pU80AWQkPa9lDuZ40bjujn/8BPM8
	 v+5AOtz4eykYhnqYLTK86YltiXMu1YsHGzjB+YUEn+TMok+IyViFyKgP0iifxPMQTi4YQ
	 TymCZ1AzhoeODoUIt9nTh7M3TcCdxUAikJ1wrqGAzUVR729ir0/MPReI5cuk5Oo5cI5mJ
	 QcC8EzzW2+N0oFUhyn43uiaSLvGkA9mIZ4Ss/han03kqWEXzBwsko/NEHStSfh80H2jyd
	 F8T6nJG8tsIz1gzWoaRl3XATiXEt9AqwbCjjFLhMdOCsAh+MkVCd94xL7eA+hHb93jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QIZ4XsgODrWcH8dTzvu/9qtSI703Qb2F/6/UXN9OBdo=;
	b=sR/RMO/FuYJPOJujnqcrtACC21S23t8QUOkR8pwe7/UaM+Pa2HYJksngQE+daBSr4Htq
	 ex2Uq9sMCnKu4RrTQa15ha3vCQozaWcR5Q8Bqd2hbDpx8geGKZ83QvVoNR9cmblv+MufT
	 El3/zUdoEkEVp9htHBRVdj+15YebquDK6eoV39KUPa4H/gFbZCZeEzHbxtk93fSNCLQ5E
	 mSlNNz3b3Em+52YtMyrC1cFXcXuoNKWWRjl2bUVA6p4oLcGqWC+NFu2pZDEF2hLBekwFG
	 iTb2YfUJJf5P5Pu0EsXG7xbtvXJa4tld7qqBg1yGOaOMBZh/58Yo2X/II5kL8ydMo5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KfskU73V;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142E606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A142E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KfskU73V
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4129413c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848726; x=1795453526; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIZ4XsgODrWcH8dTzvu/9qtSI703Qb2F/6/UXN9OBdo=;
        b=KfskU73V2nqL3XU7CsfJ+22H4pvOTCx6d/AP1PPNdOkEj1TRKCwdwBm40jV8fb0CWk
         /oa2bk1ZQzCet0Tia5pGeVWntYRU5P8uLywYuwwkp6VcJo9yA8/0D5b1AUSF5rkQ0gU1
         TozlZOAjI+JNjbNjsnWoWBA3Hq2MfKcvKKZ+LaiH7imLxbGxQEm9s5eqZjJmhftJFBOR
         Zxcg6Xh5yWqDRsJ4SYoQFhBgoUv1jf/DN1Sm2NYypwqIyZCaElsGNv/rQmXOqtINh8rD
         tBefkurKbbt0haBhwp+Rk7ccFJLlIlR2tAtHLKngWptdUzuOkgEtRtuAGRknK9HEP6tW
         YqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848726; x=1795453526;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIZ4XsgODrWcH8dTzvu/9qtSI703Qb2F/6/UXN9OBdo=;
        b=Qo+DmFRi+2tQ7ryOpOMZI9OQkVlipPqWhayUJPeo8P8xKDW0bDbEnrPTZebnJKaxo7
         v5ZQTOYT5DCdpIEzWKmWdVw8YgP31RwkRzKHJTYjTiiWMMix3GbfRFdjNATdkCBwahF1
         8I97lf16W8JssEquTnsJDvP8qiGpXWYCz7gx2vYxwDPcDSHM3NePlADRemwkBCyvr1O6
         7IRP7w/jCnsHjWybIO7UimMzEX4CM46lOMPZDOdTcj2z1iAvsTbgHu1umFER4c5HQKMJ
         DJvM8v/kIssw9kptASVt9Rd+TpIxw6ekCXQhYrvKercoLdgR9opWwefa6XmV7Dgk//Di
         +tsA==
X-Forwarded-Encrypted: i=1; AL+hErF9M2pp77fPkTR9Mvvp+k6TxqXNck6dz/FBvSqNMgk4URPxGRDErxt4nh17Jl1LxTHpWlIe14QuGMppvd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hs3Bp1gJMF/3kSJ8a5Vz4dBxN9J/nBXbSGbk3clg541AJVXK+
	4lRRw6qWH93yMjFvoOwRMCpjjg/ovVdRO/50P+7NMRpmLpYD2VubasE0xUBhnGdVOy4=
X-Gm-Gg: AYBFou1AbZmPMuNhjyV3EZDSwd9o/k/KkiWQMnzP3jqSueV/grPOjHIaJh78Bi9DR2T
	h+SrAvimxXBtw4y3a3GutbJ3HRpYzbZv7Z/CSfYcVns0jG1Fz+CTQbovRmSYhPA21zcwXEpQ5n3
	bkPPeF1deDzNEyG5wxjRrwUe7lwTMa8114EQTNyeYFRjNTI10PtpUfv0bEe7xIP3SUK9eXe4ssT
	QmvTq9PI9v4epc/ZUDo264jjnHCKGFOtN3Rp4hO+uMQRb5PJcoJsY7V1sHiXO/yXJMr/JOea8oa
	4jWrW+OfluHb9gOVwZh1m42psAS+iD/EAIQKjUU2mZcJy1tCE/I2HcgC2MwQjbtX0pxWxrD5bKH
	VU1tGPvQY2+Rw1uI/h9095k1A/W8Q7fZmIH/ehhqOAUTzV9ENNl0IodbnzETVarYMtW9xwbPjCJ
	KKHQ4WXx184L2UOBorENq0+Ve9AOxS3aF+m9M/bxttI/Mu6eX1f0Zyx02+HD8EDOaPOqSMPr62s
	P+lz+05sd1xlOBSKPIf9aZwAjsDxFigCZijwRVPCjiPcmBit1lxfjzx5VkJ3vpVn3oH2UraxalM
	GV0U/yjtZDh3b6ZU8l/Y43vuH9ywB/gYBbEs
X-Received: by 2002:a05:7022:29c:20b0:1b4:e533:ff50 with SMTP id a92af1059eb24-1b50313d871mr10447133c88.40.1794848725646;
        Mon, 16 Nov 2026 09:05:25 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:e2c9:cd5e:3a2c:ae0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm35331095eec.13.2026.11.16.09.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:05:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] scsi: be2iscsi: Fix NULL pointer dereference in memory
 cleanup
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: ketan.mukadam@broadcom.com, James.Bottomley@HansenPartnership.com, 
 mkp@kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107093611.42311-1-mdshahid03@gmail.com>
References: <20261107093611.42311-1-mdshahid03@gmail.com>
Date: Mon, 16 Nov 2026 22:35:09 +0530
Message-Id: <179484870918.18018.12288622784632288336.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi ,

could you please review and give your feedback, when time permits.

Thanks
Shahid.

On 2026-11-07 15:06 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> During memory allocation ,DMA memory may be allocated successfully
> before the descriptor array allocation fails.
> 
> In this case ,mem_descr->mem_array is NULL,but cleanup path tries
> to access it.
> 
> Use mem_arr_orig to free the DMA allocation of the current
> descriptor and handle previously allocated descriptors separately.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/scsi/be2iscsi/be_main.c | 34 ++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
> index fd18d4d3d219..95706b5db7be 100644
> --- a/drivers/scsi/be2iscsi/be_main.c
> +++ b/drivers/scsi/be2iscsi/be_main.c
> @@ -2549,22 +2549,30 @@ static int beiscsi_alloc_mem(struct beiscsi_hba *phba)
>  	kfree(mem_arr_orig);
>  	return 0;
>  free_mem:
> -	mem_descr->num_elements = j;
> -	while ((i) || (j)) {
> +	/* Free DMA allocations of the current descriptor */
> +	for (; j > 0; j--) {
> +		dma_free_coherent(&phba->pcidev->dev,
> +			mem_arr_orig[j - 1].size,
> +			mem_arr_orig[j - 1].virtual_address,
> +			(unsigned long)
> +			mem_arr_orig[j - 1].bus_address.u.a64.address);
> +	}
> +
> +	/* Free previously completed descriptors */
> +	while (i > 0) {
> +		i--;
> +		mem_descr--;
> +
>  		for (j = mem_descr->num_elements; j > 0; j--) {
>  			dma_free_coherent(&phba->pcidev->dev,
> -					    mem_descr->mem_array[j - 1].size,
> -					    mem_descr->mem_array[j - 1].
> -					    virtual_address,
> -					    (unsigned long)mem_descr->
> -					    mem_array[j - 1].
> -					    bus_address.u.a64.address);
> -		}
> -		if (i) {
> -			i--;
> -			kfree(mem_descr->mem_array);
> -			mem_descr--;
> +				mem_descr->mem_array[j - 1].size,
> +				mem_descr->mem_array[j - 1].virtual_address,
> +				(unsigned long)
> +				mem_descr->mem_array[j - 1].bus_address.u.a64.address);
>  		}
> +
> +		kfree(mem_descr->mem_array);
> +
>  	}
>  	kfree(mem_arr_orig);
>  	kfree(phba->init_mem);
> -- 
> 2.43.0
> 
> 



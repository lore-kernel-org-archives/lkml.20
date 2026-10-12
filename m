Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595B433041
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798320; cv=none; b=MG6UDuIvKsoV05mhQ7O/yhQ7HK4aBnx8JHIq1xEKzIsmlzTrjru1eh3IixmEjzjNN422m9zO6glwfvTeKc2lPhgiNYwbjt7rYBOaiJ8vySZt5V05pwCwIaW6sys+N3aFsiKY+qf+TibsCjtGKJl1nSdUjDjkiMHiOArwuxLIBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798320; c=relaxed/simple;
	bh=fBVkiEo0lmz4W4b+TPHdkvDruTk6CvZhhfO3wDZi8IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNyRd3HchjfCJSiOH1+tiaX9DCFVrnpI+Vp5QXRUn9VVSCZ6kb+QK/NWllniKKXEq3geqU+ftRz5U3XOGH98B9MnBmxY7x9WOKK3tHkTtFQX1yucUE5qkZusHJs2h+qVr7nl9xWEzG044wRcvFyEF58bqQ+mquvlVovhBerL7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+R1im6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aP8+0oAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+R1im6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aP8+0oAH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KBN71779288
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGtCNZ4UOOWqf7HnzftzRzSNN1uF1K70PGOPcNQI8Xg=; b=e+R1im6nSBfgZvwo
	gFVO9HSnJq3nv+S72lUMy8HKZHl6LIpmNiS3YK9x8eFPmm1MJ2W0Fv6RoPVVrxAh
	7RT4fNUiGl2xJpc4heOb7+hGfux8kP9wb5/q05Zy6p6+RE2UYq49BNL4vMfENtQi
	xm5Ml6CNaaDiPYG6kaSGYOnF41HtTcCk32wBBW845ynHwqEXPa08SmnbpJ2+qReo
	BTChexx0V4Qf6ysLW+b7xzgw+YH2YnpcCNf+iy+mCcoQXEsHQLj678cYfA/YPk7L
	AEDBDpIVh3S+5gjGGI5aWKOWDSUfbOReAlbfRtwB1YaMS4PIOafFNGM3U8jWZXQj
	8hVJiQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq0h60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:45:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so2150099a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798317; x=1792403117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hGtCNZ4UOOWqf7HnzftzRzSNN1uF1K70PGOPcNQI8Xg=;
        b=aP8+0oAHBp/oWMMrRsfviqWPL0JxRHqTG0iKg9rZ44+gUwtZs15oM1ft4K4O/K+OXS
         w73KSWLjhV1ol1jlkKlh4q6sGCmF+Yh6KE1iO0k75toxdIvSAh6yu8sAQ6vNzLMh5aE2
         VUxiGdG2DpeobROp2ULFW+OQ8pWFXBK2yVXRuGS2mwAHYYAWPGPUlkywJbC2vQQ/rtX5
         DHq2JRkv1A9BZkZ9C6QdYCgfPsRQGE3Mf63PSNA+y/dagRgZAwfwazludNSV+CBHyWaD
         hirfqVg6pkjPex6VX6gj7PHl64DJUOKyTlHGXpg9Qk+7GZNlbo6DLx5wbSMs04Te+LDY
         VWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798317; x=1792403117;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGtCNZ4UOOWqf7HnzftzRzSNN1uF1K70PGOPcNQI8Xg=;
        b=jt3VqJhNwmzLl4YAuQ8U+ErzvWBPU8EiimsrvL/4rhVB/Hf+8UVh1UI/U/o3F/5E2F
         TRCbj1SdtUXueiHYEUffgnnX6/h+zAzQRGcf6JPh3B3lukma78LjYcER877O7tx3uUVL
         yqkqEQ9Ycc+TrqCjRB5hryAsELUdRgUpdI90qRT4ZFYWsP01RKrWYfTe9uk+us+6Igsy
         Mw9Yb8AueWGfCgzIwoz3zIrD+QY3/RctKWNUI87udEIddRs6h4OWO/aphUucHbnzjean
         J/YnOmeltdNYKey/UqUtyOcpdsKN55dMC9puGu+xBqAHCmv6z/bvUvZoDdVHelgdOiwC
         k87Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaztWG3sMLZnRF6ISm/mn2Asy90X6ga37B5fk2/HRdimSUAKaaVy6T8eFAxRh4UVe+PYWzuGv1xHlkRFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9/0ZWBEw3GgGQfzd2Zip4/iieQEn2jgxP7VgUsnZPo/E9jZ4j
	E73EDDI8UJnfNutWeujS+DCuLlaT5ryNgZepv+nDzdREohkL6I/diyM+TNCm82zs18dvlURku1R
	fCNi88zdDemujZcnDMnkkjZSKENQnYjvDVyjdcSoGpcq1U/FZv6cNLZ/SJxHTBTHstHY=
X-Gm-Gg: AYBFou3NPEMc6MZVX434K5NZKuzGJZIGx3u7Vmeee09JGcXLW4mWGctwX3OqpuAl8D2
	WahmwMoSgF17vs4+12c85ijp7qfZpj2clhSkzSOWvnoP9M5cEtUURCl2KKsAl5dYBm3Pg0majzm
	O69drfM+T8rA2bUIEoYGzyl0QL5LsfOpD6LrMo6xAbXcz/nnmOJeKjBwtT8RoPsGScgsKI+RTOs
	Qh/22drOHmWXiuhHlJ9QLRhHZtftW3htWMbeRtskG6wUwuqL6+8mdu0BXaC605yR2PCq4EdzNgi
	t6OTfco9SLkQc+c2kctG7JbioAsoWEYsLiOqT53VZwDkC2D/Y1tu5LiqfmoStFZMCkYYg86WCfy
	eNCGWPbgye2upRthFYTvKIw93JfOhzA==
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr8087590a91.41.1791798317374;
        Mon, 12 Oct 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr8087568a91.41.1791798316854;
        Mon, 12 Oct 2026 02:45:16 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.155.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm15560286a91.11.2026.10.12.02.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:45:16 -0700 (PDT)
Message-ID: <447d71bd-b9fe-44c5-b4ac-375661bbbd92@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:15:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] tee: Export uuidv5 generation for TEE backends
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-4-bf1c8e2a64ab@oss.qualcomm.com>
 <4b5d8ee4-4927-4932-963c-19eb76a8f67d@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <4b5d8ee4-4927-4932-963c-19eb76a8f67d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accac2e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ivpbP8R7Mhpy7qfOLL/Q+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HvXYQvMWAyfQ06qojRcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfXynPQE0iftk+B
 Y8sF8d2o91qzE2eAVola64ecUavo7SGaL5laZkaGjZcBW0b+GlLCtjYhUTS1m1r+IgHaPY61fwe
 rAzUXR0V/97xIxOobCyOyoRCyVce8xw=
X-Proofpoint-GUID: 3Ohq0x7mrAZK99RBroyuMLB1a4j960jK
X-Proofpoint-ORIG-GUID: 3Ohq0x7mrAZK99RBroyuMLB1a4j960jK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX6Dzn0dryXwKC
 M66xhg3u4kxsbDsoKbLZNP1nywE2PaxwZh0V02gs/Df2Znt80zJKSkRN6u/W8zxngV+CBZZUffd
 pf7gyc2Buh/+ZMYFP3T2y9nAQSco1WUQHineAShnBqKYAUyO+TF7A3O/PH3oPNaRC/YFNUISWjo
 JJ6lCY3ZykurncJRwo6bUaQtk2myCA/fyu+wkXmDK18jbm9CGymjLazjjzxHJgnf48vdx7xPzkk
 cvPjFQNXUGi3bR7tmFaomq2+vDWHbhPT39Hqka9RjVQCPA4NqPXGbPNO0Vrz34fhgWGuxAJmw/C
 b+1StOJS5q6tyVUhg9qU/cAxdVCEYXbHSZt9scEu6H3BJKvK91GNfBbbhQTIKSepKCM8pr7PMzF
 O6eOTuqhpfWws5E9GROJy5AvLWBfFzUbH0VZjJDQuiNV14WvIAGUBpvot9QPR6sG9JaReJMtjGW
 ElRWNOMbJLIklrovDag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

Hi Amir,

On 09-10-2026 06:53 am, Amirreza Zarrabi wrote:
> 
> 
> On 10/6/2026 10:33 PM, Harshal Dev wrote:
>> Export the uuidv5() function defined in the TEE core to all TEE backends.
>> This enables the TEE backend drivers to generate a UUID for identifying
>> and registering their secure services on the TEE bus.
>>
>> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   |  9 +++++----
>>  include/linux/tee_core.h | 15 +++++++++++++++
>>  2 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index a03a3d645dd1..2cfd302d1393 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
>>  }
>>  
>>  /**
>> - * uuid_v5() - Calculate UUIDv5
>> + * tee_generate_uuid_v5() - Calculate UUIDv5
>>   * @uuid: Resulting UUID
>>   * @ns: Name space ID for UUIDv5 function
>>   * @name: Name for UUIDv5 function
>> @@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
>>   * This implements section (for SHA-1):
>>   * 4.3.  Algorithm for Creating a Name-Based UUID
>>   */
>> -static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>> -		    size_t size)
>> +void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>> +			  size_t size)
>>  {
>>  	unsigned char hash[SHA1_DIGEST_SIZE];
>>  	struct sha1_ctx ctx;
>> @@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>>  	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
>>  	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
>>  }
>> +EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
>>  
>>  int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>>  				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
>> @@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>>  		goto out_free_name;
>>  	}
>>  
>> -	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
>> +	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
>>  out_free_name:
>>  	kfree(name);
>>  
>> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
>> index bcb5418d6fdc..a3f4f88b8423 100644
>> --- a/include/linux/tee_core.h
>> +++ b/include/linux/tee_core.h
>> @@ -272,6 +272,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
>>  int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>>  				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
>>  
>> +/**
>> + * tee_generate_uuid_v5() - Calculate UUIDv5
>> + * @uuid: Resulting UUID
>> + * @ns: Name space ID for UUIDv5 function
>> + * @name: Name for UUIDv5 function
>> + * @size: Size of name
>> + *
>> + * UUIDv5 is specific in RFC 4122.
>> + *
>> + * This implements section (for SHA-1):
>> + * 4.3.  Algorithm for Creating a Name-Based UUID
>> + */
> 
> I think the functions in the header do not need to replicate the docs from c files.
> If you want you can remove it. Otherwise,
>

I can see that the exported function tee_session_calc_client_uuid() in the
.c file only provides the docs in the header file. Perhaps I can do the same
and remove the doc from the .c file and keep it here instead of replicating
it in both files. 
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>

Hope I can keep your tag with this. :)

Regards,
Harshal
 
> - Amir
> 
>> +void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>> +			  size_t size);
>> +
>>  /**
>>   * struct tee_shm_pool - shared memory pool
>>   * @ops:		operations
>>
> 


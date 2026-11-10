Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273833;
	b=xG/9gZ7dm655HvD+AxAUvHzlZGGzfPogeEnNQQ6TiM4bJ/8JrVp1szKdQ2QQfvvy98Ra
	 Kqv/m/oIWmnglJ0wDHs5jtX9OgImxlGKYu/apDtN5FFGaPUb/xVjZEBrg6+w/jHekoYcA
	 S8WCEOIZsVW5OOp0mtZ1L85pym7dxXZ3PWT86Cw8npoJahNJIyvupxbDNsrxAnI51dIEF
	 1ZGNWttwlt3DQtdav9fJbGuvLorNqg7teju4Eby6LhTFxMXbccirDQSsR1UkwbmWBxGnc
	 NJG60SQtwGY0tqEVPdwSm6IiiRyrtglABlHydeEaxNCELkZrxlXCb1fJoOl3GASC2FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=;
	b=qjvFlJBKS/LLpgY8ypoyQtsoCe5AGFLPhm/YjxX3VIIV2Se9c12tODJerYpORxM9qixy
	 mz7gxXbXdrEbZs8klqBSo1bWOh+X7IJPxFr7l91ptuDQ3x6VzVwZVrPOFLomGik1f54et
	 pPyBj/VA6V/EiJ3f4ZXn7jZbqpxMNjG1iTkBJhdPNSl4a5+38yamMAASEzF9zUqNjCwwT
	 Yy8xDbLlEoixOOkIIh3oF5qAUlGFlhFiXBcTxTmbgb4vRjCxh+qHF9Wnm3asz69jOQKQL
	 oWvNfHFpdKzL0FnFylzxicnOjpgzmcjmdfs8RjtJlF7mCw43WF2NKfYRWYxOnYIg3lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEZKlxit;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4N0euNq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E725606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E725606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEZKlxit;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4N0euNq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jGtK1829824
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=; b=oEZKlxitht0U08BJ
	PYs53sHPoZlY1z4NuVgVKUWuIs/F8uZSDQazzU8pmtaVdIwLqlZ+TBO9MN3Ai2Y8
	nr6AecaVSCAFJHBThw/SA3ql9ARBiYGQK1OBAyJJm4pnC/pk4P8E8F3lFQeoa6Vq
	gSgw645b+mZXqFEpqdSjvnOJHWhk7lwnTnyqhOC30jBK6FsL4Ww/e2NaXXjiN/Fg
	NCEVJ+bqbQNfNpoOTSqYe8yZknt9IRyUKyhaUEiJCpn7uaVHUEIdT2aMwueGi7Z7
	BQNZMW32xflCD+ojeTJlmbdHmQKhgodYQhMWBfW8M8dcA6GeLOjLmZhsabkmlS5x
	ohvsWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5at5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:23:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso2618046a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273831; x=1794878631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=;
        b=E4N0euNqK41DzrLM6C1P3Ee/pFj5E9Tn88xoMzEf4k74XR9B3RVe4Js0IVldHk6ryK
         qYHUZQlgo3H+nY8MGrxIbia1PIgY4YuFMdj3U0fqM0D94wlkv7IETtkzZsVfaNMY/vP9
         v9tRdFYBRA3ub+VcphB3CWA1T7VlGo9YkaejkiwRVmUjigQpULGxoLM7HsaP4OkaQSXs
         YxeC2a+oal2fQvtAV/F6J9HSMqlvDtGLw51l2kVaMyPdugoMp0Px/TP4hnrWmeHIgWSN
         9JAA9LDWUkK+KK00F+rGdOxh7pWCtiPq7iPCi3KBuTRrz5bHr8Tn2+ccCelhZE9UV2rt
         +kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273831; x=1794878631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rs64S9EZ5xre0uSyH+TcgmPL2yJaa6bDvpQYSfLsy+I=;
        b=vEDHQSm7VDO1T51119m93eDXbyMCHsjM+ymAUcDQqk2iCp04+Bunihg+MK0q5ZI8tC
         dULvjVintg74z2ypX9JEyHkuONmRz6G1870CU5FSWPi6W3G9oHwrPiR+6jQJfbdLnSqQ
         31HhUjkTCih9eYVWJ8fcdl5R5eyNZwiCsbXRtQSfK0MyVII2t16rUtUVmhOI7YsDdmSu
         RnUSq2gGiGK9eVTOvfPXHxDolD2PtsHJHNVygS2uTKQfsWthsa9+JEj4G767fyjakyb+
         TMwErnvVEj0fuZbwH+X56IFtmV1mPbHVGJFpw9RKaNBNZU/etG+Wx0I5uTQoYECm9OEN
         AwbQ==
X-Forwarded-Encrypted: i=1; AL+hErHvgnuuEvPLC8yGqxsgJaP/RbkkjSyYMwGZkLOb+ciGb1kADpGlisSKHtIdps0WtDMWyv8IOAfFffFoeDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sdYenLEdUD+ztpMXLehh9EBasxAyGc0s2T98gD9xk5/hgyrab
	xE+P8hS3u29vnE4Td7BUZ4N2wvb/1HpHS8zP9oDQtmhEUs1VvJXxeIfTmKc1hqYBwP8zTN8iD06
	MgEK9eQwIyB553jq6NdP7izWLXWyPRG1VseN2kOfHXZBo9uFqdTrlqxjsO+7yEsUJbkQ=
X-Gm-Gg: AYBFou2/xqeAUQwxa9uPy5YMoFCdJCk3prVlzTgr5Am8TNGJXMnbjkgZTJlDEThGqID
	lqeVzUNXoaeKAjFziMcmHDRRsK2JmN9PrJFWrJ9wbGIiD/50VSllsrw6q2Oea/XL2wcwOefxMus
	Zh3ncoFz1GB/gqk6upG/G4Gto6dzJRjjf6pdBEEj67ZMKkUZronoRSdcS2pSHQ8nkzoxRxytOoh
	rh3AUMjltEvfVsQJrqmZf9+pB/xFCPDZanEeECrqm2IiGi3T75o0m9ty+e1SYjXJRwH3l579mZH
	Mpbe1qzLfHrrc3Fgmz+EKXA2jcX2NiAuxt/BZIiZeJktfnEyd1L3kQp1cMmiujtBxCpBrgrJzHi
	Ce4fXwwPvsStNWrPO9CWnPtcA++OeeLdY7TCRgHlKO8pGIJkkGtU6//4eC09UNRJfln5btdLMzw
	Tm8yz++NtMqVQ4FV+f3FcSnlAw0A==
X-Received: by 2002:a17:90b:2810:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b16700e47bmr1354254a91.64.1794273830824;
        Mon, 09 Nov 2026 17:23:50 -0800 (PST)
X-Received: by 2002:a17:90b:2810:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b16700e47bmr1354228a91.64.1794273830289;
        Mon, 09 Nov 2026 17:23:50 -0800 (PST)
Received: from [10.133.33.198] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676db5b8sm1599108a91.8.2026.11.09.17.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:23:49 -0800 (PST)
Message-ID: <3a734370-6961-45da-9af2-0a5fffb1ee9f@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:23:45 +0800
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
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
 <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
 <a7a484d0-9458-4051-aad0-983341dfb0e6@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a7a484d0-9458-4051-aad0-983341dfb0e6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3-gBF6PEumsKMuezNb4aaqUdBBiph1cr
X-Proofpoint-GUID: 3-gBF6PEumsKMuezNb4aaqUdBBiph1cr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX2dOr7dZZLfqv
 S84tm92z+QeiHh2e0aQisKrJAZ8IwFLNldXMTGi8BdYT7fggPmzznI+GQpjEcwEe6i+zMhgGukK
 2W34wUhmNCxR9gcbZk42Xd5QaNgikSo=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af27227 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R4kogEE5nOyr4cp69VAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXyHZTLEaBxtAl
 WlVBQn7KvCGO0yQ5uOhT3rX+vuw8jok26pwRPMBusB4qgkWR+gbZAAv2os3ZXOZLuaNmWS6AKXf
 +MrDTaRV3pg134/easn68sZlC1xZlT8MDQmr8EoJ6yIdZDDcwDO8XQTKXJ1sqsJ4kLepLsmnuoE
 OTHQIj6G2tOTIdBOl0j3qsKnhjWPxyhwXfAhxdOEWGgeNCQcdKECPZfcqGeacegWXlrZtKqA65L
 CtLWfUWWN+ZlEtglgzcrnHrYVLfmHENaUpuLPk2rj3M8fcTewp1sbkBVmVcJRc5gwjgG0nJgUjs
 Q7jyvDypJylYa8uTL2V11MYIcn70QWtg4MfjuUD+24We9fBkw/CDDlbCZYbk9PBYNB/au+T3BoM
 HpoIPuItB6MH0Z8Won+ERDqOxCxgqdLqqi7LxiBopCCYAJYXdERVJ0HP2YBuIyXChoyKbYkII95
 WVEPuBciGqQow4cnPHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005



On 11/9/2026 7:46 PM, Suzuki K Poulose wrote:
> On 09/11/2026 10:34, James Clark wrote:
>>
>>
>> On 09/11/2026 01:24, Jie Gan wrote:
>>>
>>>
>>> On 5/13/2026 9:32 AM, Jie Gan wrote:
>>>> Two related leaks when _coresight_build_path() encounters an error 
>>>> after
>>>> coresight_grab_device() has already incremented the pm_runtime, module,
>>>> and device references for a node:
>>>>
>>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>>>     never called, permanently leaking all three references.
>>>>
>>>> 2. In coresight_build_path(), on failure the partial path was freed 
>>>> with
>>>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>>>     frees the coresight_path struct itself; it does not iterate 
>>>> path_list
>>>>     to call coresight_drop_device() and kfree() for each coresight_node
>>>>     already added by deeper recursive calls, leaking both the 
>>>> pm_runtime,
>>>>     module, and device references and the node memory for every element
>>>>     on the partial path.
>>>>
>>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>>> _coresight_build_path(), and replacing kfree(path) with
>>>> coresight_release_path(path) in coresight_build_path().
>>>>
>>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>>>> coresight_grab_device()")
>>>> Fixes: b3e94405941e ("coresight: associating path with session 
>>>> rather than tracer")
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>
>>> Gentle ping.
>>>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>>> hwtracing/coresight/coresight-core.c
>>>> index 46f247f73cf6..c1354ea8e11d 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>>>> coresight_device *csdev,
>>>>           return ret;
>>>>       node = kzalloc_obj(struct coresight_node);
>>>> -    if (!node)
>>>> +    if (!node) {
>>>> +        coresight_drop_device(csdev);
>>>>           return -ENOMEM;
>>>> +    }
>>>>       node->csdev = csdev;
>>>>       list_add(&node->link, &path->path_list);
>>>> @@ -851,7 +853,7 @@ struct coresight_path 
>>>> *coresight_build_path(struct coresight_device *source,
>>>>       rc = _coresight_build_path(source, source, sink, path);
>>>>       if (rc) {
>>>> -        kfree(path);
>>>> +        coresight_release_path(path);
>>
>> @Suzuki, there's a conflict here. This will need to be 
>> coresight_release_path_locked() if we also take "coresight: etm-perf: 
>> Serialize AUX topology access" from my Sashiko fixes.
> 
> The changes needed by the patch are already what your patches does.
> Apologies Jie Gan, I have merged Jamess series which solves everything.
> So, we can ignore this one.

Got it. Glad to hear the issue to be fixed.

Thanks,
Jie

> 
> Cheers
> Suzuki
> 


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47F4FC8D0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956918; cv=none; b=ImZ0oStaG99zNgRBJppML4l1JG7zE4gFQR47wrGrVG8lKzpr1A5OSyq9pmRkebm0+ZSPjffIzSqxgpg6sYDgI7xT0KO88gbNAGtqRQEa3AbcNMzGWme5PwmPZV4Vu0lq79IAT2otpriDlWWIbaT/ECx8r58TZhdh3AA3vfLdANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956918; c=relaxed/simple;
	bh=i3Ial06SZD+LdnFzuC3gciJjyB09On4bByjFrjm9JSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbH19pEbU1iYwiZr24mawuA97kKQrcM4oIaKlNaJjCPExqGhTY2R/LvBhBn5P0CBZLmSZwGSadEcqrAgdaBKm5aawR2u9EGewRKYFwh4fR6gYcsgcL5Z5clnBNqgurfpTBNZUi/1QjQ6bWpA7EcecJDU7Jl0AVbYKqk2buP+Nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inJhSTBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJssoaRS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inJhSTBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJssoaRS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU19h1809829
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=; b=inJhSTBEUkY1zVDm
	AflTwEiXrUlrlDONiLUPimYJTsY6te/FjpSTIl1et4br2T0DraEhm1zohNUEF/Z5
	8ZbmUMAENjxTS6b/1j/i2jWU9tIzx8qpDW4DI59cIJ6LoEiUkX1xcAQfMvFjDAfS
	zATn7VVlq97adXpOKn/YyjmKM/jfNDRB7a1yU5ExqsLn644QZEJUj9b7qiSEcgP2
	b1TXsHnjx2RhYcyy4QBkilZUOZ0n7Xr7Ze+YssV7vr3M2QkCokFKOB6cqSoe3w+m
	piO82ZnxB8YEFJ3Y/mpNq5ksGw3u40B/JjskGZwXV6yrcSbU7TE766dV9c3Qrp7b
	71awIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0mca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:28:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so7296530a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956915; x=1789561715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=;
        b=SJssoaRS9LNcQFDQaHlt8+B+RWq7WEWuW2UgceD92d68c7/PVXDNhNnLARQc0cDHyT
         p9N5S4p453cH97rRA9++JHAQJHj1iVBj8DfzaOA7e1dGzevek97snACtnGr6T2cR/tKq
         2YpGMxrWP9Rr9FoqH/IAEEoNoY8Drk0lho/WaZIgnzVamGgTkvvuDcZum37uQAx4RpAk
         P+cJSfMYT9cxxlnklsQPqlcr6Dl0PV3W+Ub0GGby1XDhPqEGWcnm880wXlBiSKvNa99Y
         XDq/cijd17+zwPyIqvsBHbf7WDz9uuB7b0YSMH7zvOmcX9GmsyN5A2NmT7BtXHHkMXlW
         6OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956915; x=1789561715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TQyTqiTCzTHhUmr+o4Td8dTYvn/uySA2VnJ/w3XDS8=;
        b=hz7S2/jNFfw1UBu5UXmEOmp/b7Tmp/dXgOWMDhb8O6hOLVT4VCjjBwJIigWao6QRtN
         77ue6FfdM9olhXbNwIjPctnIHwY267vZplXoUyY6/q516lrKphHcrEpTiwpOWAxKPZRd
         dz+xqBiX2x72YQ7YST8Y07wtnggVZ4VUjEcIejV2imXZ+rMQtQKD0wekYL30SsSv5n60
         kU6QA1iGvXxdgkWi7qWjOd1sX0gXrgXt8dYjpE/WjkklTurzhlJPOuHyL16P1dvAcIrB
         GoO0r4t2PIDKEiGoGI/6iRL4v/u/XZlvu/FzxSnjPzOTCa9X9Jt/Nlryz+rX7CZWcSFC
         Rs+g==
X-Forwarded-Encrypted: i=1; AKwUvBwzDyLMgYWu/nI/AqVFCv3wmPuSkX7NlwXJOlfBGvjsd1K9KQSBpnE9rXvFn/TG7Gy15lEDqPLopPymEAU=@vger.kernel.org
X-Gm-Message-State: AFuF++l6fMa/m+DEceWALGR+mxDZx1bh1DHNF18VyhMBU3ipESyFDuPc
	/rjpFb/EMc6dPYRrGlmycnnSSj7xuKASZCAxVWuW3bwbjTJGnLk4HKzGGQHORpa5393kyQNliso
	uAXqQzADdO3FMXmX6G5bqXTiOcZkmhQHyroTPMViJ16pA9C00CTPzYIPB13Wnk4UrQfY=
X-Gm-Gg: AYBFou0nEaJeSrf18KAds0pnc1O1nqFoWNep+Ge4nnhY3MqwR1C0h7ZJxR2KEfusau7
	IFdnQnRt2J8XwZ5HQNPevvUQycW3NqcQmdSfSiC9T25PI3bJcsFcMn8dOPUnCVmYjPJoUcS/Esh
	GFbbaCfrBeM9ZzfD4NRLfNZjpK8l+1rjL4HwGavEJuoWUaqtea8iYBIf2ZZ9Rg5z2zR9fYGhbye
	nsp8EU4B8aaI0s05tQAIAdnqsr/fKQgrYJx6+RFj934UGGPgWyP+wY4ys6H7O/oCDxUD2Bq19/f
	2C9v5P0OzqX6UlUj0+d4o+N7p/tPLxU4Lng/FSsqXRXVPm38RG4fh5dT2qtFQ2+e7StGu0Uzqs2
	r/sp0phggKpl6x/tAt7jbuLE3AKuinwb83OBsD3ZAdRky5BdGxKOkFw==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr48492420a91.3.1788956915187;
        Wed, 09 Sep 2026 05:28:35 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr48492376a91.3.1788956914697;
        Wed, 09 Sep 2026 05:28:34 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm32612857a91.15.2026.09.09.05.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:28:34 -0700 (PDT)
Message-ID: <627b88c8-4b36-40c6-b6f4-4ef291d985e9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 20:28:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix clock refcount imbalance on platform probe
 failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
 <20260909092817.GC200420@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260909092817.GC200420@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX9gpui2fkpFnj
 DVFed1TrOjSzk1x/xgLotVCQM69Cfei1nr0brm5XXRJn7+J3hpbQ0guf990fH9/kY+XDVgDzcvQ
 ouPRruanSWiOKeiogDE7hrm4cHjFpwQ=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa150f4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=LRGHgEY_j3VPEFJSYgMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: kMEa1HxUSFq6O9it9r7SzXlivzx8gkPj
X-Proofpoint-GUID: kMEa1HxUSFq6O9it9r7SzXlivzx8gkPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXwwEr/FRm8Z0Y
 LHLAnzSs6P6mGTq21rzN/hdU8BZKprZ2Fm/n35g3qR4RI8aXTK8AlLRAwjmGbaNevtAqRyXGi1W
 6iz4D6P4zkr/yPquggK+xlQHkONPdtnzo7eUcnO3PGzEY5FYixNmJPse43M/Tep0ArqONulJZsH
 zWE/SnvY4OIjHBga6LH+/zK59SsCSy+r3nOHTW76v9AspjV+LtQ3KUOkYz3LYM0iOGyfagGBITQ
 pQ8XkF6bjfc3hc9vWql1EdXynJO5qWb29fZdKhvrZqcsKoXhB9nBqy/d2yX6yIZdn0Gejer8kcN
 mxJVeFtOIe9MX8YGFHxHYoLMV+g3t4gALIq32Ngj3Mc8KjA0SfzTdR6kbFhg36vnIuvjP/M2mWq
 IEKsab3ZoqrR78nx9TY+/b+Fnj0tkD1kPhj2qUqZad5Bq+yrC+tg9r359zxG3+e7KnYxm78aSXH
 Lc3AHU9MwpTwLPptKKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138



On 9/9/2026 5:28 PM, Leo Yan wrote:
Hi Leo,

> Hi Jie,
> 
> Thanks for fixing! It is shame that my single patch caused issues both
> in driver's probe and remove - I have to admit that I don't understand
> runtime PM's state machine.
> 
> TBC, this patch only fixes probe. The driver's remove is fixed in:
> https://lore.kernel.org/linux-arm-kernel/20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com/
> 
> The series above and this patch should be picked up together so can
> have complete fix.
> 
>> The probe wrapper then unconditionally calls pm_runtime_put()
>> regardless of whether the inner probe succeeded, so on failure this
>> also fires runtime_suspend() and disables the same clocks a first
>> time.
> 
> pm_runtime_put() can be used for success case, but for the failure
> case, we should disable the runtime PM but not release reference:
> https://docs.kernel.org/power/runtime_pm.html#runtime-pm-initialization-device-probing-and-removal
> 
>> @@ -632,11 +632,14 @@ static int catu_platform_probe(struct platform_device *pdev)
>>   	pm_runtime_enable(&pdev->dev);
>>   
>>   	ret = __catu_probe(&pdev->dev, res);
>> -	pm_runtime_put(&pdev->dev);
>> -	if (ret)
>> +	if (ret) {
>> +		pm_runtime_put_noidle(&pdev->dev);
>>   		pm_runtime_disable(&pdev->dev);
> 
> Nitpick: please reverse the sequence between pm_runtime_put_noidle()
> and pm_runtime_disable(). As we need to first disable runtime PM for
> the device, then release usage reference.
> 
> Since the driver core will reset device's active state, AI told me that
> calling pm_runtime_set_suspended() is redundant. It is still good to
> explicitly call it for bookkeeping. This can be aligned with the change
> in driver remove.
> 
> Thus, please update the flow:
> 
>          pm_runtime_disable(&pdev->dev);
>          pm_runtime_set_suspended(dev);
>          pm_runtime_put_noidle(&pdev->dev);
> 
> With the update:

will update the flow in next version.
Thanks for reviewing.

Jie

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187461;
	b=e6wkYPZQvZLQiQPFY5vggB75zOdFJfer9D1oTFxwjEMlyRvHvixtuOqXTXvyuPUpx9Wx
	 uw5LzwB3bZmHEHAwwz9KsTbcNzPMsYBmtmSy6OF8Qj/SEcan5M1zTqdPPTpvhvj4QKrLL
	 i9Ly8+EE0E0B/tVoXL7LATeqslZ0REd1iDTXIbwm2+DXDgp9tddVUzxbSkbB4HRD8tMW7
	 HwnzG9Bldhru8+cRgZmjynRSyrhHmTnivB4F2SMy+HIFTn4IYN1T7APmW9bw0k1rqCRCG
	 5C0AE7v9ngx9mygjzpHraks0UM1wV6YUiuLqm8nsbHfTM3s0oAA/C4WYN9lpRXEpgPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=;
	b=BG/2VONARTUn6uQPGfXnWCwNw7aCMXza0lu/Rz485KTuafIX8Xmp5ex3O5Bh0K0luobw
	 iVUddijDNvOQBuH629Az8bQHl2HjDTJgaprSLl1Va5ntNVGZHgWxd97+KJwzE5xaIUCPb
	 ICTcxJNn+qv81Jsj9lY4nCKyqlNVlSagk+IczMvdCzLrZRZZBrSVUTkqy+HnRTMk1b9cp
	 rkenVx0pJ81d0clajtwULoA6QkcdBTAwK4Qemu9rr0EiAjSNJjCQSCGIvWp3Db0hiCgSQ
	 gRxcsZDW62H2Io/retnzrFu757QJ0Wf8JL/TkThkqcJNXVGgYp0Kkz6aHnWs/WaeVlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpXnbPrN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YNei2wpV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CB606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834CB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpXnbPrN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YNei2wpV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HKlu3850716
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=; b=KpXnbPrNVJl4QvjK
	rlGzMaWKm3CSKs196LRbnPDmc2qspCM67ktzROtfMR/mbwec/1QuIB9qiUsohtRo
	sbo3Vluy7VZh8T5rrUiBHzB73s/B9ZRhJO4uvogDZmmDSVZcdgz78jQF2oEaUYoB
	xryip/TdwRDdb9lRIwciS8qv2fIztRIm//jQPrmqxaOdSnHUoQ70U+Dl8jBb5Rff
	VSrGhpzeCwPevUPLmAOTRS/kKHb6WgKc0TCX8LvD9390z813BXUfANKErIQGnrar
	Bz56yOBKyZIdas9E7q9X5lMNvt7MZ5OC1h6yuFZeS9rB+xdANGPninYLhVqP3YvC
	jt7DNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf4fte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:24:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd48746a49so194325a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187459; x=1794792259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=;
        b=YNei2wpVQoFDtE2t+q9bbaDlOjo8oEDsPoTOPQlV2Ce4650lwZQ6THVYoJedstAbz3
         D4jppZQdu7EmfEie2sSOLC3q0+3kC4DxxLoWaW/l64mg9fxwAnymP3NYvefiiTrnrgeV
         dohlj623hOnsjuwUY9eIGTZGhTT9nHh7yGw9zhVRLWRPn+cX6+Vsc2dnoGx6iM+M62zc
         askDLiqiFfbMuB/oRc2Q6bu2Pb1ef3UCJebfVe1eNviKeHgEywrkrLjHOqUecMaYdxWs
         9xOeMWamniddZgRpNdvzSV9I/ivZZn7ixduyRTnkPAa1dXWtWzvMUcEAdoZS07VdGFbb
         xrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187459; x=1794792259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ILPUVvAEQQSiOWe9jx3J0bcp/Cobg7swKrB6drhfuU=;
        b=QVQFvwRGdoSyM99v9o6F6JRnGSxyvcmAeXiX5I8G55vvnzPF2tkglq/AfNmexjLUCH
         8/EJmHcfgHJvw+FdF72j5sGRji8TH3SRuuOgVIBWnCyyQdD42xk2sSpRVQXAJ4VzP3jv
         rRXXGyrVtCq9gTDIuBT6YHiKQ2YXSIrQprw4pilzOKPs4F20B6dl7qg3niKu7UX6cngx
         vjT5ThKGo+ev30TVwjVYWnVK4JYynStWSTOnFWS2CrAVv7imq8vuVrjFBP3YnmF7kR24
         Q6ckAW3N1MbWjTeOtvj+kinYkd/WIThd0zavUXijao4NZc5M2i4V8vrt1WOwrv9lAvgY
         n/Xg==
X-Forwarded-Encrypted: i=1; AL+hErE8PYjkRXkNty0BJL0yu6as0sOb2UYW65UWBZmnNxDXQBiAQ79k42XeUGlj6i6Xfv2nqAqGn2UM/1QIeGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nTZ64wYZE0lZOHpivfNVirGH9kbI2qQZ4KKCi2VQmK9Xh16hN
	aXfUJA7M9gviwGX7Q4cRxhl8RnD6vs3tk42Fc5JqJcEudCrc6XqmYX1287yIZQ7SOxRFOAPjbBk
	UXWGuL4Fvu08CPivvuDZZBizs+BN4ndN1uooerO4ZzYZ3jTk3g1feRchKfNRZk5B+sio=
X-Gm-Gg: AYBFou09O9ec43UXl0DeatH+Up/V2r9pLv4MiRmMJqeBNcMxBUWBcCgP1epH6gFi01e
	RxmpjP3pec/UhMU++6tMBe0AeNMz7YRypkYcan/QP8UiZuQ84c/MAO+M/o6Aeuz4yJ2Vc4pP9VV
	vy768SVTEBoKfoqwd0zieVnpqG9jFptN9PYbUl9GeLsYsosTDFQnBYpS1g/eI6yEyZbLwCZ6BPT
	avH6n9pe5Yo02hkZ5rf7iStYeRb5ECVFuSLyk+1QZrL1DZ8dFgwjc88ycYly5erP2dHKboU5ecA
	kdtKdPXUciWjKZ5VPkzjr1wDcvFNfxnI0Pq30k9s4qWmtlsWNKktLmtNUM47nxYaUV3PZFjAYbr
	F0anEJUrEafOYmIjxZVVh1rSUCJprpA6qjPDS3y2bWZjc3qc5QiRmD/WuqL6Rb2cGcR3R
X-Received: by 2002:a05:6a20:748b:b0:3e1:3178:8d62 with SMTP id adf61e73a8af0-3eecf984101mr2597302637.9.1794187459022;
        Sun, 08 Nov 2026 17:24:19 -0800 (PST)
X-Received: by 2002:a05:6a20:748b:b0:3e1:3178:8d62 with SMTP id adf61e73a8af0-3eecf984101mr2597285637.9.1794187458501;
        Sun, 08 Nov 2026 17:24:18 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96a73344sm1072893a12.30.2026.11.08.17.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:24:17 -0800 (PST)
Message-ID: <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:24:13 +0800
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
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX2bk0nRVfkk0+
 xpMZyrQPv8V6mBxQS2oMdgkcA/Thn+BwHZR35Bq/7SCkJjsw2HKnb8BT67Fr3vlPgDuDuMWJGj0
 4hF9Fll07BBqJBoykeCr99TRYXI6Izo=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af120c3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IIRFHugnNVJhAGNuPQwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2s8lfgsvHDrU75Mu5eYtbb_5eW2Fie7j
X-Proofpoint-ORIG-GUID: 2s8lfgsvHDrU75Mu5eYtbb_5eW2Fie7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX7cng/dDone3h
 X4PEPv0cAUS8cI72VDAlCijVLHhzkHcCow7J3iZwPMQQQd48hpKqwcYAIIgwrD+pONV8opmTiZd
 yOh0jppR4h+1d05G02nFVcav0xGvedpNg70WWeyd+yy+oYoH+Wax+eyNk1x7orb7LucYLrpDE9q
 gbHorJrx8a6O3JrBEPBYQbLxr7SgGLyMmZkkUEagtP2YJdAy+DUE60IBwMdfuvx4UPMVQToI5LO
 i785bfd4sWh9Cs/VPfsQcGyVxOfmNU4UM2Q4G8kLqDCP8bHUovJXNGJOcpcBxwe5jTTTP14RtlA
 oGdKPX4KWKAcaEXyyg53VcxMy89exxMx8O4sBNMS+NXIuVAK+tEeBJ262icw4d56621MvDux+7m
 oFCs7gSTE66VbVcEqCIhhINSp4rDG6Jupwa4abNyeKdsrNbr529FQQ011cgPxr7bfLHlUfGhz28
 LGLK7eLJJ5l8NoyfLxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090005



On 5/13/2026 9:32 AM, Jie Gan wrote:
> Two related leaks when _coresight_build_path() encounters an error after
> coresight_grab_device() has already incremented the pm_runtime, module,
> and device references for a node:
> 
> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>     after coresight_grab_device() succeeds, coresight_drop_device() was
>     never called, permanently leaking all three references.
> 
> 2. In coresight_build_path(), on failure the partial path was freed with
>     kfree(path) instead of coresight_release_path(path).  kfree() only
>     frees the coresight_path struct itself; it does not iterate path_list
>     to call coresight_drop_device() and kfree() for each coresight_node
>     already added by deeper recursive calls, leaking both the pm_runtime,
>     module, and device references and the node memory for every element
>     on the partial path.
> 
> Fix both by adding coresight_drop_device() in the OOM unwind of
> _coresight_build_path(), and replacing kfree(path) with
> coresight_release_path(path) in coresight_build_path().
> 
> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
> Fixes: b3e94405941e ("coresight: associating path with session rather than tracer")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Gentle ping.

> ---
>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf6..c1354ea8e11d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   		return ret;
>   
>   	node = kzalloc_obj(struct coresight_node);
> -	if (!node)
> +	if (!node) {
> +		coresight_drop_device(csdev);
>   		return -ENOMEM;
> +	}
>   
>   	node->csdev = csdev;
>   	list_add(&node->link, &path->path_list);
> @@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
>   
>   	rc = _coresight_build_path(source, source, sink, path);
>   	if (rc) {
> -		kfree(path);
> +		coresight_release_path(path);
>   		return ERR_PTR(rc);
>   	}
>   
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
> 
> Best regards,


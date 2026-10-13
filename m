Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B133937B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891105; cv=none; b=Q1vCu6UmwAm+W2uwohiIjksb9AirtxyH/n4v7L73U7igqPRnTIn8AwSA3THQqZkeEGir3bpns525X9ManY8wCRmyolSxK2kiZnvTN3MqoilcV0/grqtUJAtjiIvSou5FRYqzeRbyt2nDOXg6UEh1wQQusubMVUTsFooaeaRxosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891105; c=relaxed/simple;
	bh=qdiKT4pmaWhY8cndNRhuiVjoc5hyS/Nji++DpODZTw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVJrANUa3tub+U9AKgAT4x2EOgJQtWCsh4IIaMhYuURI2X5+2HfMm2kA3PH2l6UUOwgz1B+T1VY9BNnlZStOB5KLnn0hkRs/a6Stal691W2jDRTkzC7RX/r1Ln9V61EVl1L+b2P1iEkoFqRajhDoahKgphb262Wj3X45k9QmxJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOXrDDKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAHeWxy2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOXrDDKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAHeWxy2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8dq3i302843
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=; b=iOXrDDKvGjszz741
	c0L1h/prwDSdpeda1xijIxjPOy1L109J40TmW+JsGyyG59V2t0pXMv/eyvF9o7qJ
	QcsokoUjqPJA7BiCiaKqUNdG5Pcb4S8xzChg4NXZiECjUObta/vaA1JicgByd2z4
	FnfsLB40AM+nYwTt6Zbc+wshjFuWtKvZU+ZwZ5iAI2ZGLP0xGLQFYxKv9HU/SDAi
	vqSvi9U/GLLcU0gqRaEcJn1CtmSHsF6CC/qX2dBRfMB7SfY/6dFBSz2URQ5TaCJq
	zI8R363Iv8flZkVNdAaew6XkkbgW8yn0qE9pEXFKsJxs0H0wdfyIa/KhTII/iBo3
	wu6zSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqan6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:31:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5df0d59528dso690009e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891103; x=1792495903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=;
        b=LAHeWxy2ArNwu1kLqDN3VX06HlHtLWmDkqKI8J79VSAysp3TSUIjelXjthD4Uzi9dj
         clIdFFDpTnbiBGnzDUuI7w7S9C5JH+QDPmz88Z0wlAHz2cKuvf/gmRIQMfpqraz7Wfho
         OeFK/sjohdyyBWvuRPNUWsopDci4BLRNhTmep/Zc075DZm9E3ZMaxgpq2hb/lCHGX9oF
         BQJOEB63UB3+mEyt/i18AIU9V9s2ShaTfhhfJud8gYAbVcEs1VkBIu0ZDa6m5/IyUcE/
         Qdzdwk+Ps6oqTdMzoHu6K1CwuCGH6OG48CmZfn8fuE/ZqA21QbENVhtxbJKOibaKr4bX
         TZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891103; x=1792495903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=;
        b=MmGd9rHpCW+DIGgV6rXEoOXrYLwdwKanJt+ALyJw0SmqRAGH3T3PWldFjYdSP/Q8q8
         VOZxgNzp8E44cRU9LgDf1FozvW9rw+cn7L2OSlEWqCylLXwWtobr85F4ord2M/SPtotM
         wwwgxtbgEHDC8cIjlZzfOqM7fTCWMVDtXBVwZiPJt+0GJ2oWsqaMrZ6B7CG6CV1SWVr9
         4jj1uEr3seq1IwFI1ePtqVUql0v7RwM38btZIz1I2pYdqQw5EX6FTH1S0VHi0/Kv2kc9
         /dCaKwjDaumTep34nb2ZzryV3aZDEAHlyLBT56eCQTuJH8ew/JW9cFzpHjA/MwQXWYg8
         BtAA==
X-Forwarded-Encrypted: i=1; AKwUvBz4URoWbwUfw+DqhIc2k/JjyvGq6uDPAwxj/XmfeaRrS5aHY8HUhLqgTcqBVBh6PIr79U+m34UFLcr2VJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8l/qJjAmQqQfP7nbVlB3Z2AkYCjECCl6SyWqjRlGkS3jzChFJ
	gKnRU2/H1qsoYY8YvqA4rgVsoITrcIIluyNtlaaZl1ejA6ntUu67YdIr2zu3EIfOhRPIn5cLbG8
	yG6Lz5xCj9+shuBkPjDYY+0A/JEHSgWoKdqd6q1WJVebUafkhumtQEMt8SjpqcW9o83Q=
X-Gm-Gg: AYBFou3qpA8tLBwTx8kApy1qJrNaZexn85UL/4ArMU5GQDda/h3h6GSRXwIoFDDLNKU
	ThYr9aKUzTS4pgk87NsiIIs+sZQX6rjSgOrWHRoge5VyBG3bw5EIFyN/Pozf5BohUMiJnceC+g2
	bxikpvzX0CjLKm2e9brofUgrkasMlKMIpunQxjP/tqaJZ30t4kReEknAAlLMhyJfy41GK6C21HA
	jNC3hjskdfxJSl3+ErSja4qiYHaGfpWO+ycRrVQh47Q8uBZDFXxxBqHjFOSZB+/bzkLnxOVwVQy
	5OkCFppyCmyj4r92IR2WpciQ0XwafOioXE6opOgiFC5b2HF25wZqrDeevNr/602sgf5fIuvzn74
	TU14nPpAcJX0AOe8auDUHceNd68S1dd/3VhQLhWM=
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr3084627137.28.1791891102492;
        Tue, 13 Oct 2026 04:31:42 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr3084619137.28.1791891101934;
        Tue, 13 Oct 2026 04:31:41 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm132972505e9.3.2026.10.13.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:31:41 -0700 (PDT)
Message-ID: <e4da8a65-4743-4f39-9d31-2b9c5626b60b@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:31:38 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: qcom: camss: rebase fixes and SC7280
 enablement for the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
 <20261013094751.1503021-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261013094751.1503021-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX9ylzRydR7gio
 LCMFr6hlR+NziRIRvx0/SHAPdV/PuhHNilLyIL44YWhtuSiVStRoqClrGFZ14DfiFY45pIhc2uR
 md83HSro8E4/QW3QUNyyuhF6M4aQA/bbGhpCfgwl1LBAICR9qqgk/StfEF2b2Rwpd3ByWzMAmAp
 FOMBsKCpkac8D/I5ZVaugnRybfzfgtAZBC7vhJzafj/UndnlHg8QG5ZfYEOjuNL02gTcLCL/zHe
 ajJSfIbQp+aAL9MlDHKOJfVXUUtnD72bQ9uMAYEX6HbPfxwzcU6lj30O86JnNRZ7oFb+o0yFOOD
 hr5RXHL/nxSKBiirxecGnhIBRktdWMhBQhC9D+Zgt2WrBs2IoXJmU180VugXTdn4cUy+NOWovBj
 hz2kj7VvNiZ4Tih8QZoMOJQ9K3MHVLXFVbLgKXvoU0S8lZEe7SR7Vb7ct7aEVe6YyE50GJDPUPJ
 Y02JZfphZYaNlVOHGGQ==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace169f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=baXj_NEP-ELrwSMyPQUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX/bEDTrV5WSh5
 vDE+hlP4c/mhPIWZM1kcLnVpulYfJbJqOyRkSv5K1io390yiekZ+I5hy+R/m0wV0oiw+xKNLpFW
 yDw01W1Gj7q02u3VLDHrELtW2Db9IjU=
X-Proofpoint-ORIG-GUID: a6WdfGnUAHkm0pBmOnqFReFadwTN7c_J
X-Proofpoint-GUID: a6WdfGnUAHkm0pBmOnqFReFadwTN7c_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130045

Hi Hitesh,


On 10/13/2026 12:47 PM, Hitesh Patel wrote:
> The Media CI failure on this series is expected: it cannot apply to
> media-committers next, because it depends on a series that is not merged
> yet.
> 
>   [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
>   https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> 
> 1/4 changes csid_streams_set_format(), which only exists once patch 4/8
> of that series is applied, so the first patch fails and the rest follow.
> 
> My apologies for the noise - earlier revisions carried base-commit and
> prerequisite-patch-id trailers precisely so the CI would not try to build
> this standalone, and I dropped them when I reposted as a series. For the
> record the base is next-20261009 with Gjorgji's eight patches applied on
> top, with 1/8 rebased as described in my reply on that thread.
> 
> Gjorgji has asked to fold these four into his v2, so they will most
> likely reach the CI through that series rather than on their own. If a v6
> is wanted for any other reason I will restore the trailers.

Thank you for your series, most probably next week i will have some time
to post the v2. As discussed will need help for verification from your side.

Regards,
~Gjorgji

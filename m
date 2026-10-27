Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112261;
	b=H+Oy1DaocFswZHEyz/OfGt88EtB+pN+ABPpXZsruuygWX1X7UmfxPtETrOW99BlUMuFr
	 ANOh7/3hnlPQWT+wqD5H7BA+HaVGINTjmM3B62NuPMxQMD2b851fP15jW1jwLfhYhrcNl
	 x8vmyWDraC66jlGwV0S70YFn0gc5HK6pHNYTxxpMFflUREvQQ0TpkUU1J1qKcXl/D1stB
	 0hEsuWSCmmw+od8e1r15ZpyX+o6k6nagDOiFVwkiyw+AbdVwQa3xVdwM1C+m+U9iQkbP8
	 b9rXjBmX9KKI9IJrPLxI7JfFMndPMVnqlKZnpZZNFqwvP0hj/cLTTN+V5mTQztTcQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
	b=1dF/Y2rtmXs6iwTgM+LEdFRHDsz6Wk8wr8zpCDA1rI9EX+KK7sABKwhqvq0PBrFd7CZ8
	 HwfWpUWYJVdH53RfMj73ahmJSTNkm19MYDddmTj/lm7kLgHHgAKSNQGdd4NtL37bqLJp1
	 B1xb7cDKyxQ/Jbe/6Xd2QbJe/B6gFm3nBpHSRNDQbRDkEiRU/WjoHnYQ1C1oMiLA4HqfL
	 QVk2WPTnU6Mj6ZsQSqRrbqV5erXI7Fb2lDTpIQ0osFdsmiEzUyU0tmGk53DXW6YBnLLfX
	 HFXZJV76C6uKgEt53cy7v7MPQpEfLzGOa+P/4Jgm4ys63D5Nr0MoCey8GaPspxREnGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTYxZdG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkdu4xpS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEA606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CEA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTYxZdG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkdu4xpS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoZhl1850904
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=; b=OyTYxZdG5+M2clOm
	mpj2PFqC20PW5yT2WKOHbRjUQd4kjm1lHHI6h7rvY7k08UybYm5zCJcslMNG8Wdd
	6dSg3QSVjxaV5v67NV7UJlPFHifZsFihgctUVQ8TOibpdjPE8ex6jgcPiY999ZZF
	QLRo1Nt+B6xgDoJj9OGyEHhqTE2SLxQ2DhYJn0yHhKKkunbxCxJKKbRXTXILjfPO
	YiD8za+0ifXd+ziLHf5VtO/xKankz40QRfDl0FP0Vf1bRbVOR+qzzbWA3LYjv6bE
	aJYmbkhzGCRhyEB3sjS95d7yDnMnM3J/UFyBwtEHHmbC0loqY/DT984+SufrEM6h
	8H7Uvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmc5cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so513242485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112258; x=1793717058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
        b=Kkdu4xpSycubvYo2VxZEIvDxRi8LwhL9BdwTQxbJICH3Gna7MCt4YhYIVVN5XKW1vq
         MydGVrA+aI5kfZxCErCCablQfK8klS9a4bp1BEF1FyVoX0++q7NRlY8mkD05m/YHvLJ1
         rgxPsXeqzQ8DJuqPxs0d3tqwxoe9tCBGvKtcimMSLYrVpBTPHnZMVGA+n3h0bX55pB/6
         /s7fLJEpPBgwkXp+yhcTf1+cSzUACbRC/PDzYoej2R2kwcCTCqDvnLCMwY2XINLYYqgz
         oyCXKxS5gTxSVsYrAHfSscex7Ja0uCorYn/Du8kPS6kYUIlJpKvs4/mAoZC8tCImxzmC
         v2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112258; x=1793717058;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
        b=HeYNsUu/wgI37r2qUsU6oqBfxD+Zh0RIgBDJ//sCKKfjvh3HDo/zvvMRBGrldgu7Jw
         mSb3lLja0P1tPPyX6UwEaPuYs3ZsJ0JVoAdrSYUX8a2qzFs0vLtOEugZ4DJrrUhLKuI+
         ZOtsaG0rXwlRBbIy/hwYKJNTM4ZMTNO+KgejmjqsDrxhq9Pe4/vYA4FHTw6JutA2hUcR
         HCNfJsFSE+KalltrFvSJYzqeTiJtC7fAvTmFbOi9QSaIaX+7v4xAiK0gpfrBL50vBv1k
         rwh6+4qOCFB/xNRm6YivkihoJe45QspifZBopPx0S23fM/b2+0baiHI8rLTSPH6iOAF8
         BAGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDLLEvy1gcinnNbuF5eMUR8AaQYG1WA4k0OpmrzTyOXLLLEo4n8T2LXiW5kNvtv2cujhXrXNXjkcCI9zY=@vger.kernel.org
X-Gm-Message-State: AFq9FYItEGOZl1Kl1MXNRYfUTWbVQ6n3R5wYigDy2vFf+No4cYrDd1vV
	NsRkdtqBP1mSEngxe+GIYHer20swHqtQ2s5408sXGlabwlkpfPkx5jCW8Zrg27nrfcfcWRVVuTZ
	YzTYbrl3mi4EeLAL+m/tJm/UZL5zhqFPLq99bBtvh5s9Im/E46S5TgYmtjfGwMmUnjmY=
X-Gm-Gg: AYBFou3R1UQPYoB/8AF9JU6VuZSSu99fSCE9SU0EEj71yObaRSu/OPDeq5cT+8XkwPA
	7FwxP1jiJImIXzBphshh1SHSr04ag4B9PIB6VkKz0oLg+MU+AkRpxvHehAcjs05LwtoPH0pCjt5
	iZn7D2IjSCzLiTS4qunzs69ZYE82ofGxqY2KswS67wTndVx91SWP0z/BNDTpsWcc2GyolxgF2Jd
	+5cs/4yTRMsIPBQM7T0MMsu3LxYZ+ftW+c3qTT9HemNOhyBmO6zRrJMyNeeguuiSk02ow+O+v0b
	O7NERcWJTnXCqor8hQPrJK8WjW9o7PfhvbQgF3jmt+ai5mRio/kISQQ6gZq3Te+p0qQ67tDSVMJ
	7FUT1XJ4rUlEEMIKn+5dz4lzKxQ==
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr1645247885a.40.1793112258142;
        Tue, 27 Oct 2026 07:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr1645242885a.40.1793112257631;
        Tue, 27 Oct 2026 07:44:17 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm319234895e9.1.2026.10.27.07.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:44:16 -0700 (PDT)
Message-ID: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:44:15 +0000
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
Subject: Re: [PATCH] ASoC: qdsp6: q6routing: Fix memory leak on probe failure
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX13mRI3+fuQdA
 rlPPKXmXzX7HBmQX4woelLvULqRVogzKK5iHKo1PPw78iIJsURGfQBQ6PolUYO7NvY5ZiPRf1E0
 xgpLB0A1Mi022+OODVLd6HsqaS0CFow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX7mIvHcDdBCXI
 yD3dLuJJEY1fK+Q7sa6m47dYJWVcZFI/fI7TvboxwtjxuVSTk2TsHJwVbYQz5rFLKyndwT9ANRT
 few8I1yOaPp8FmJDdIwcE4zY3kO6LBTPjbh7LfIu3u/TkA0i0nMR1uWDbBAHAtesrD/u8InwB3l
 TAIzDbcHO5z3P2fgsmgqdwbSDNua1xb0rbU+MMXB9ntwcXbELwgaAVHkQnTRc3QcBhhNUuAsd1A
 BqAH2BTtOWuQT8Mk25SNdR1WeVZZDcU5tW7mO6zqtLXDOhpRRWA5dxzNvMj/ZbbXcHG8g4sgkN/
 FNz9KN48m91wuKge75G/6SYl2Q8sKjI5Oa6tjaDNQClAYDefNrcnDBb5rGAeYY++/I84Uh4SYYN
 N7guUVuNZAmbsPHZXND6oQWKnYm7mjAwa3fOgAPVEUjDIkWMJOKrtRHpB9ZkN50wXJXJ7jFLLFd
 aLKQ/t60HQTYv3vuyXg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0b8c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=R5C9hjxsAAAA:8 a=1_uBrm5jZOM9LsB7CMgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tHIf49oDDN7LwZNYfj6iEsY124LOwQZt
X-Proofpoint-GUID: tHIf49oDDN7LwZNYfj6iEsY124LOwQZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

On 10/25/26 8:02 AM, Tang Bin wrote:
> routing_data is allocated with kzalloc() (not devm_kzalloc) and stored
> in a global static pointer. If devm_snd_soc_register_component() fails,
> the probe function returns the error directly without freeing
> routing_data. Since the remove callback is not invoked on probe failure,
> the allocated memory is leaked.
> 
> On a probe retry, a new routing_data would be allocated, overwriting
> the global pointer and losing the reference to the previous allocation.
> 
> Fix this by checking the return value of
> devm_snd_soc_register_component() and freeing routing_data on failure.
> 
> Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/qcom/qdsp6/q6routing.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index d076c99f1..fb633efd8 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -1208,6 +1208,7 @@ static const struct snd_soc_component_driver msm_soc_routing_component = {
>  static int q6pcm_routing_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
>  	routing_data = kzalloc_obj(*routing_data);
>  	if (!routing_data)
> @@ -1218,8 +1219,13 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  	mutex_init(&routing_data->lock);
>  	dev_set_drvdata(dev, routing_data);
>  
> -	return devm_snd_soc_register_component(dev, &msm_soc_routing_component,
> +	ret = devm_snd_soc_register_component(dev, &msm_soc_routing_component,
>  					  NULL, 0);
> +	if (ret) {

how about something like this:

diff --git a/sound/soc/qcom/qdsp6/q6routing.c
b/sound/soc/qcom/qdsp6/q6routing.c
index d076c99f197f..4816d4b9a48c 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1209,7 +1209,7 @@ static int q6pcm_routing_probe(struct
platform_device *pdev)
 {
        struct device *dev = &pdev->dev;

-       routing_data = kzalloc_obj(*routing_data);
+       routing_data = devm_kzalloc_obj(dev, *routing_data);
        if (!routing_data)
                return -ENOMEM;

@@ -1224,7 +1224,6 @@ static int q6pcm_routing_probe(struct
platform_device *pdev)

 static void q6pcm_routing_remove(struct platform_device *pdev)
 {
-       kfree(routing_data);
        routing_data = NULL;
 }



> +		kfree(routing_data);
> +		routing_data = NULL;
> +	}
> +	return ret;
>  }
>  
>  static void q6pcm_routing_remove(struct platform_device *pdev)


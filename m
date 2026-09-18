Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5BA3CFF53
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724358; cv=none; b=qKWrm6xcujsOh9hKt08gxakAzYKM4B+34gnlHhsN+Pslj8hw8joaljZflM74ug4P8kmnh8Y8G99BpYQ0CA8AGcOQt+fDfLoySowbxLF+l8cR+zoW/clrbLVCD4IHNclXeGWYA7dwOVpNMwMAAJ4YQmup1gCrdagipVWov9twhI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724358; c=relaxed/simple;
	bh=9VZyRGE5AG6+PTN1ZQZs/f/CAnfSiRJXvH/4u5hljWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1cHqg6EpLaHw3HV59/k2iIe1PBIydF69Cw2JwSSpOolUsbLNMeuYEmUc92a1Z9NNtZKep8raUd4Ss/pV9H7oGYRltasi5NB/S9YnNYENJ3JNrZoZjhuqSG+CXjD4PMwvNl9OuUfkUVS38Ie7kkOZpO5AropHVJkwOmNMezlk8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYVGprWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRZwxNt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYVGprWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRZwxNt1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xw9q716997
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=; b=QYVGprWeihFbqW83
	aCIbanLQI2+Qhgi6/uwAWU5Yz4AJ4UPi5hKNOdN+twvSABG8nHRI7IH9TYa1EgJE
	Q3COLLkTvO2/1Lhl5bCxwqKNlbflhV8A1UKaAqkveV1lX2LxsOos2v+K/2ecS2Bf
	IazAqSrIeaR7z6vcguVMzWIxJlhsGA7Pz9LSUayAEtR6X2AvGP8VtpFyQChwL2H3
	Ssgkb5V6Ep3MT3FVCdGhIjp3YZc2gY5H652uIAD5LU/93rWorCqnwvSOk13aqWFo
	YxSIAYeXqmmvmdzxqvyiSVQ2hxxRLSPKK9EtqQ9kVaBXGpmiA87+KlSsqh7+ppdl
	K+E6Ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg42gq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:39:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9392788b3f8so13040885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789724355; x=1790329155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=;
        b=jRZwxNt1FrcAHwDzHQccnn2XfoGeUuir3TIGrLaQyrVvMV73PNfWtJWHytTFxHMAp1
         y8e65BEbOJ6qXpPkavfodMKIC/rsK6HdC/BVNnPvaAgY98zv9h3MZLa+hpwSz3RX9u9c
         UtRH8IfGe/coB5v81jFP7N42O7EMbZKQhMbWbDCpOAN+vYPlPd4K6005MycVXTPdH4VE
         GT4A4y+bzpQou3JKiHyYdU8OCQNp2O/nxyHrKHXnfYk6udf1WKRGtZqS8i1IP7gP77os
         XXps4ikWBuwYcHlg7btG/BDhlnz+2HSEHo3Ps7bvid9U09zjkEwiF1i0JptiIebTLmeE
         miwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724355; x=1790329155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=;
        b=X7bl8lTjdSSN5SZzkq5tbbbG538stXWbCgnrCXixpVSejj6N6CQoi4xw5sTgWn2vlq
         oOmjUfW+uu11Jy/zeQpotuqMslhS92uyYaqN74J7mwXpr1t8oGVc9/SJaYmLSW/H9jP2
         aw5QaOTb7U5tOzfuBX9yO91hoamvcqOKC9kS5MQ0oZw1hAk5kLCg/So5Vkr2HyFdpx1V
         pqT9GQ+iMDVWHHvHvJ3mI9uds8jPzpFEMMeknIdHqP6y7p05n1epqeQXL620Ng1Dy4XX
         UP+ynxAeFZp7nMzCEAXv2VqqKmo8oTcbZfJUD5WAD3bn2Br88qzXeIHxj1Y5dj/Osza7
         nCTg==
X-Forwarded-Encrypted: i=1; AKwUvBx/3CZvZCYHt+Itb/7NlmjvAGT5AuM35u0KCC3HgI34tZ+kVyalNY6PdjEdYFxqBf2kWEhFVrKGbfBqhic=@vger.kernel.org
X-Gm-Message-State: AFuF++lmgLmCGWSsSQVhnl8k7YAOiv6flWw8N9dsvAzzROGdPvgWMpfN
	Y83z7E2sRx6OvTApl4oGximN7mNopRSkSJawiEwZkX5NO/vV86JwuFUJxahOTVAy9dnW7bkutQp
	lcRLPEuqv7im3U8iFmSSkb6TgTaiUwgrcIT+66IYcIwr4O1t+jPFV8w1rY27X7eH0MXw=
X-Gm-Gg: AYBFou2uAuiqYWDWfqiF9zryn9fniQ4cq+jIEeL4qyRonGHw57TRpE7g8v8bQASLGlN
	ipAOyFXuw5jqCWZMEeZOi85eQb4qvFoaB7enO7LCLguZ8M5MQ5oIXDGfpTYPpBYcPGria8SqYS1
	zcirFdp8zFNSsdCULjYdpG4lzjl2UMn5dd7SJPhB8w4VoOyubfezAxAuRSSjSXcRHDq8gjV9M/H
	Mnlk9IA8mZv3bH9KGu8wa6sX82QmiGRIBP1BEXx64Q/FhWkrb0mV2hc2O3bSnc2bLumtD0WohgU
	cEzLJRixLa8ZFE+k3mjw9DPcn/kNa04UiiL3xx3JggfuzD0FktnBtKWrSC/QDx5P2i4zKQRBoG0
	8cS4MZ6PKuh8hodJ183LuFA==
X-Received: by 2002:a05:620a:bca:b0:93a:14c:329c with SMTP id af79cd13be357-93be04cd56amr164941885a.1.1789724354792;
        Fri, 18 Sep 2026 02:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:93a:14c:329c with SMTP id af79cd13be357-93be04cd56amr164939385a.1.1789724354375;
        Fri, 18 Sep 2026 02:39:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc68ffsm37355666b.57.2026.09.18.02.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:39:13 -0700 (PDT)
Message-ID: <66ed49d3-caf0-4513-9ef5-1f40b6a92ba3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/48] clk: qcom: gcc-sm8250: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
 <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PH89AqXzGpKzZQh7p6EqpROitdTszTjD
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad06c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9t_OtDgf2ifsZ5-kfxQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PH89AqXzGpKzZQh7p6EqpROitdTszTjD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfX9jZ3xPJDLF3t
 c33YFKqRLbQMD9iz0GDR7hlbSTj0eFkEtaEyhnjbNedQHsbl+lbbZ2uC9W5lTWkuxBfOQVsP6bZ
 GkZyEFYqNN4CYBYR2ggUZ5s0dbOsDrASwsFuUaGszLz3SjdjNEc97HerQJ0rNLz+WVlNLbTaTSe
 jy/bgsoo7Nrp0RmOz4w/bKRSvMI1BsYoeoXXj7+Lgn99RmGEovNC961NJ+v6RDQR3EY86Ory/Qi
 ORbXzkRGAWmzWbE9Pk5Fml1VpwxDxDaQZ0ZADWdErEJcLq4jKIRf2Qm2rvu5ivMclgbQu/UNZ9B
 29YpddutbzMYf8CQAMYcSKCQouZeP1s+g2pI1OWO0pen1gJGGGVGTHeXb71EByRCAzE1JIJKrBg
 GiapdnYqZaRfD9ZazmIBpyFifiwLwDeKHESWsBh8epCHhcuChcwKxJW7WQseXStfvk4km79LTug
 SjdL96FAQJS6GwuNuQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfX2XU55+2wH1S+
 Mk6ZkRNqrnvovECAdCx8tBzmiB2bzM7fnHys1W7B5lA3MaLa2dS6MX8XI42Krs2GXo+9YLfxuzi
 w4B9oYGEpwbNYLuOpb/QiBZ6QWCL1pE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180134

On 9/16/26 12:28 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array,
> describe the DFS RCGs through qcom_cc_driver_data and move the register
> programming into the clk_regs_configure callback.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static void gcc_sm8250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Disable the GPLL0 active input to NPU and GPU
> +	 * via MISC registers.
> +	 */
> +	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> +	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);

Tell the robot to do another pass, using regmap_set/clear_bits()
where it makes sense

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165703911D5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632128; cv=none; b=Uvp5jtfl7t1kGYUNmj9TsR3w3I3SDX5uARuM0hDaMCcc8p8+bfwTlkg24WJJ6lckW/6sLH1ACea6GqGSO1ftpPzAmO+WDdHwLzbdwB7QOzUJS8fNjKamnVmH6XyLu7laIFhoXtOQuKFy+Hz2ZcXEmLUazRTNwQNNbYbZH/WItYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632128; c=relaxed/simple;
	bh=O4McYQ43yAF3+S0C1n7WeGagveQomJ7h/JOsE63xDK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEctP3HaDUs8eIGmwJMt9Z0+EW0rO/KygnzEm2P0AHRfNptNcXNihKYIPdkyPwNyfYYRPHHIf70OtnCbCqsL1+KtsJp5Jg2oSSI7+SFYln9eNS0nEvZsJsuOVKRTADKydHChSzd7zukFTt0r/h3lCpsBCgZYjsRw//SsR0YuKZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sjj0mTgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY+cbo8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sjj0mTgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY+cbo8n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60ux71375673
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Z1Yk65M75ZMuhaO9XZ5nn/CYe56pjK6jrBHgZjNvt8=; b=Sjj0mTgVD9gTeH6F
	ga1mpK+Kwjpovj4ssnHA6scntUHLa829nowjeQNApH6QgZlrv1e6AM+hnw4Tf0vu
	29gJza8PBqOidjg4BR141JtuT/oHAiE+Z1H0En1Mo5WUCRgXxTawhGggmTQOVTl8
	OlRMwGxMqfOY3qNWjoTvSScpUZuWshS5/O474GZGPclFJ87wwhbmynJ6W8BjJODJ
	ypzajH4Z/+JUVIilW19dN4ezdlHvTAlkqQJ5+ej6jjQwhY4VJFxnZtRiHuBy9n5t
	Phm0oLUkVTknCNs+IuF8mcX+J1ejcmJ3I0cKTjSseDKSVR7uWFYUxy9O7Aqe/Oe/
	MHkafw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6au47x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:02:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9103db79014so1156656d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632125; x=1790236925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Z1Yk65M75ZMuhaO9XZ5nn/CYe56pjK6jrBHgZjNvt8=;
        b=kY+cbo8n98e0VSK22JY2TThPrZa4Vx4xCYLv1aHamEy4bmORZ0Wz4fQHcG5v+P+o16
         zIOBahGscfw+z6nyh44z8k8M3/AQDkO5xA6ZUhoem/tXXi2jV80bGCG5W1PBoA3vXWu3
         8XAl1xJMABNGFuHgTpDdo/Ab1+mKns6Yl6QvbOcMpX16Yx1gFFn/D2KZ1xKPZcCHh/0+
         UBXo6OYJqAvi7mitv/CNqC/6Wd/XIwBJj3CdiO6pxIp5TZsoZZUhItyRonzKTwS6nx1C
         pi6SgkoeQdzj5CvywSINAQ87rbHCwsyMSeTUFfPCXkbUnym0S9mJw//scmRRnqCZvxLh
         CG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632125; x=1790236925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Z1Yk65M75ZMuhaO9XZ5nn/CYe56pjK6jrBHgZjNvt8=;
        b=A1Ysn8UaWjz3FaSPA5Appi6nIvChbbip2gWOi3KVsn/SWvwaHm3IjsaXZSZOo9XcRD
         CsX/9+AvrqB0Z8TmZQEJiM8SoYe6Z5u6r4OsVFk6/DiSxfsWlRmHo1H3y5mxOHjIHUeV
         skppDYSZ4v8ZpmqiBhbI+vraESZwamc8CXOkfvE1f3J207GorchX0831w9kPl6mtaqzb
         /LUC9+YFCqjqmIGLP+OEbfSLWe3e55ht493Mvlyu/bmfWjikkr9wgYO/iawtldVW+vXS
         T89B1Yw8PL7PjPsNAnwIYaeFNNbPfVpcdYgkkbbR2HDWEtDZE1axG8P0rHQWf3h+Rsfs
         hBJw==
X-Forwarded-Encrypted: i=1; AKwUvBxUvDGSPe7Bby4AlhiflUo2t0fBWc7GMrilzZwmgc9v5D27fXfrfFe88o/W8OG85R8xD/XaIU+C5J8iQ3g=@vger.kernel.org
X-Gm-Message-State: AFuF++mOPMp7pGHqk1lHlJJGfqcwNArRSQrNoIFhkV9fEKKYRYgTStJ0
	2dp4i/fTeHlJSg2kFJps6F2Q2Fsdq2lalQqntRVOdYkX1hxVbhI0cQBJiJ0RPzaRay4Zp5+ml+m
	ceJXV3PWHOSfxTR3XT0pDC4huM+p7GCvTHBQc2dqngLUPszV32zyLtmSciZK9bNByd7I=
X-Gm-Gg: AYBFou0oEClyv91xqmlf32fjF/mPbwE9RmGvTGxL3qfmnmZJzHM1a5cTlKpcNmiYeGi
	QT2jEN6o04+8rDJMy9zNHP2m66XIAkivqn5EjzQ77MvsQfdgDpiz11Z4tkqTbAZHsxiTDzyuZcW
	gC25g9S4YfKYt1Ov7QyN4iMKOTXRrLXgpHX1bvKV9eXuP0meUaVLTp7nBR5j/l4B2vsXtSYyTR4
	Y96vWI/TsaJRQilJZv9/njBgxIPdV4z3Xuz3HVdrB1abfVZzsqzN3u1TYk67UAA4popXgJmasZ9
	P103wJrfE20z6FAwWjgVBi0X0ihm9wrQTGSSN+zDMCO1tenrvgz0AuaTMWP5SfFaGabMtZKG2Sx
	Og8MbmNfD7PCMy0JWp2r8uw==
X-Received: by 2002:a05:620a:4408:b0:93a:19cc:107a with SMTP id af79cd13be357-93bb7635c63mr857708485a.1.1789632124768;
        Thu, 17 Sep 2026 01:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93a:19cc:107a with SMTP id af79cd13be357-93bb7635c63mr857704285a.1.1789632124372;
        Thu, 17 Sep 2026 01:02:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3c34sm1578796e87.17.2026.09.17.01.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:02:03 -0700 (PDT)
Message-ID: <8ef3b02d-b682-4eac-b129-df341b230449@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:02:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register
 offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xDFrJZN6tCn9PwOSFeK-uK5h7vBCrztu
X-Proofpoint-ORIG-GUID: xDFrJZN6tCn9PwOSFeK-uK5h7vBCrztu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX2/Cvw8sEASOD
 DwhWJMjZuMqUgK20EnLHZunq1Z53131hPDEBSLp9mU+GGoY+rXavujpeOjkbemxpGKPnixxEJPs
 PZrSzxpR/yaS972LyL7+LcOE1CxnQggC75FQMHI/E2tANs+1ujc2WF40Ulva1KKLLQWN+gb/LLG
 k0759Z7kiSVWkjGg7HcGTMca2PKrO6yJyne5IKi9ETJuH9QciWBI6AXQFTuu3n9oy5r5lTvLAt2
 jr/hke6LvzNOOEHClbsx0oQj8cMMnE6BIUEkCM+wpc7S71llDMdoucqk5tOhai10bvXRcxRhutH
 2wBDcEe1JDXwF4Z6cP/7TrDjmKaD7oBvsGEC3KiO9VBTBvsZzYMFHAH1kA2+AaAfPmoujOD5NGu
 5BmdxKLeQbRtMCM82MrvXqkoiN9Q06oE49I9aWBmxXcJG+bnZb7EzcXmJvMHs+5XJx+ZTsQnW9+
 FapPtD+sWC+CM4tSt7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX6OgtuJ7xgQO3
 a2TTn4TGD/CPxX5QOf46+wMGFnvDAPeIeInWFllRU7VBHqyN9B5IJzfCEp86jALNvqaja05Rql7
 4OOcEqGaFW+YWrbB2KM5gclKvYiEB08=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab9e7d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VxEonCoOErEEB63zS2MA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170108

On 9/16/26 1:55 PM, Abel Vesa wrote:
> The MDSS AHB clock HWCG bit resides in the same register as the branch
> enable and halt status bits, at offset 0x2308. The current HWCG register
> offset of 0x8a004 exceeds the regmap maximum of 0x40000, so regmap rejects
> the read in clk_branch_in_hwcg_mode(). Since the read error is ignored,
> the helper uses an uninitialized value to decide whether to skip the
> halt status check.
> 
> Correct the HWCG register offset so the helper reads the actual hardware
> clock gating state.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

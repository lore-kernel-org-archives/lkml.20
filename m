Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787473C3F6F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520051; cv=none; b=GWvps6zR1rNxqu6BZXRRkdoIsvbB5LGgv1uDDEra0rv8nrlUFJNJjE1fxmOVBXAtNTkoMfeyWy9Il76MCZ29iK0/VIWpdHC8dfuyMSygU/J2XNyF4B+NHmxkan8ocOKF66egtKRuQ9E8gzCm1cpYuRhlhxEzpfSeSqb1mB5C3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520051; c=relaxed/simple;
	bh=ZeoLU89FpNQ5WWZSpQlolueyWpVsLFUHDkCpRd4SyIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEPqfbRs+YPjowMqRfmGkiRCIR2LPwHSO8ULBkwCnPZ7AJsrjvSdQle3m+GCU418knQOx02Ou5IcHD9nVuOrFjKZDz3M/xnRgD2vfDtCNmJqeL+FrIjB1pFJFtbNuKivERaVc2IOHcqNgXujmvDeHbFOVXB8RX//HPVp64M4Ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moIzNgYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCTShhPC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moIzNgYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCTShhPC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HMYo1089422
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqjPcnwdH7+ETjZMBxsavwMVoe0aje8ldA0u84RYFkc=; b=moIzNgYIlMRmnpNn
	tG2cdy+L/vF65olVEALzp41v+lVoQ0AsDRQUgQoKKuxKcwHVO1/vmU/JuJAZudo8
	zYAB0kglArK2XDoBEb/ExDWYyEcQD2lLEAYWVcr1MVBYwXapehEZg2BL3Vj6ct0E
	PojKkIMu/eQHrICmaXrvl2N26ffQpBqUWLEa2FqzuoFCl4DAMDVrhlNCPerz/uUN
	G7E2EJ3TO/1pWenm941nLOgDzwQONF4FqLg7sjmRrD94a3Qx8+wRdmOAmljBuXOi
	LZllH6akDhv81QAKUnrLE7X4/fmIKHyV+FLQXnN+neprlmuHMSTP/yTQj+FepSwI
	dcfTkg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekva660-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:27:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso10664321eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791520041; x=1792124841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqjPcnwdH7+ETjZMBxsavwMVoe0aje8ldA0u84RYFkc=;
        b=LCTShhPCRPDpvNxxhVXTidlm1dim4vTCCg1w1zEJh61u0lTesnCVla5Zrq7WBD+fSY
         L6At00BY7MS9m51Q9bFOsxa/JynOfbsNpSf/CfwAondXaJY6z7A8EqctD+qiZvpN1P2Y
         M7g53q5/eP4Iq/LSYfYBVdkE2IhrQW8QlsFYUDg8LsT2N+1pkD83qi19x3KJG0AVwMEr
         +N3ASSY93Ga6w22K0yl48WVMgL4XI2iHT/MV1/MKLzK+8BV9m4um8ytE/tx4xFIARPbX
         PuZ+yDbYa402sjgFmX7neJ+RKetemIqVY2mEOMyjE3bOBZdWmVY1Ru4cvWnpVxN5CE6T
         ZlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520041; x=1792124841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqjPcnwdH7+ETjZMBxsavwMVoe0aje8ldA0u84RYFkc=;
        b=fPu7aTOaiQf7OH72EIeK0ODBPM391tMO3hArcBmwhYGoTJJbt0FS+wHTGb/sVzUxmA
         Nl4qsS3t3ortJRMaLgG9iwhHgSmusMBInF8yPJpqCLFZiq41rL6XGnWNSULHM9h6Cv7x
         JtimLzpPpXkLQ1q3/Wf421X6wKH7jzWmKb0KhnbWpCfQfirjDJX+mEJxruqsw0KxRwNs
         o41ITcQHH1rtWJwzNDLDSTJI2f9yGYatcpC89Ov+Yqso9dzH82KRnBnYZQq7z4tcyJBE
         zeSIxPatIo+qKl7VAJ9t+3X4ke6NZvHLhNef7UKAwZBP1A2e0CRvlYT1zvzMWUqxSbO3
         XsVw==
X-Forwarded-Encrypted: i=1; AKwUvBxmlGYemZjIr8a3oVgwE/P8925yLuz1GFuZwQzP1OJgwy4ySPjhNzdh162CJiEPXixkF7misiN1rNZG6KY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRzLzfP1lxWbgjHsmJ4LyKrTpcYdbcXqQ5wb7VGqXKNwf6cOMZ
	9/CXLXXSKZy02U9aODs+123CxsXqzl6jwSGKb1msw6vk4W22XqSRV6Mwn0c4ZTMI3vz+23od1z6
	SkTMkRM3rAiGdFoFpuAdkyU5ZiqdW4e/GRQI7oxPwKK8ZFNWdD3bRYJiDSnYvuVBLpvg=
X-Gm-Gg: AYBFou1XEAlqZ68bxxXKWAVrfQliIwDhUnTxpvwNeHgOWRwFblWhtMYAoTBDpfj+Lf0
	fYSFhSYAMeyk4WoVGCzp/gz6Epi08EyDbyhN9Aej6cd3VIbeyCUsO3b4E5ZsnFt0u5PoYwNsWq/
	JGr0AJO8TxKw0dtCZZkXPjpVu2uW2XUda3QaEdKQCl/LX8b95fixTFFC+RAF2OQnYkKkX40RllT
	xKDrM5cnze9GEFIQ1av7K3M5R6YeZU0ktdQjeGFEc4EbmQNtv9UHQtYZeTOUOvGHAhNUyfi73C/
	eVXDv/9gTqVHDfDUHetnr4CqdpGXU8pHTqYumBF/6zBYIlY2GEJEcZpT5r4h70TOm0KsMkwMMa4
	T8MkmSplLEdahGH63pGBnFVamOd0=
X-Received: by 2002:a05:7301:8607:b0:351:595:739c with SMTP id 5a478bee46e88-3537e06febcmr1520507eec.35.1791520041158;
        Thu, 08 Oct 2026 21:27:21 -0700 (PDT)
X-Received: by 2002:a05:7301:8607:b0:351:595:739c with SMTP id 5a478bee46e88-3537e06febcmr1520457eec.35.1791520040421;
        Thu, 08 Oct 2026 21:27:20 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm2784797eec.28.2026.10.08.21.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 21:27:20 -0700 (PDT)
Message-ID: <5692798f-1347-46d2-8cda-eeec74b7a084@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:57:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
References: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d6CNgTrvJ696mN_zbgWRzGQkOJyxtbiq
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac86d2a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=o3hcfxW_DcXKSnDgckwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfX1a93iiF5vfdm
 tsbAodEqc+Ncp2EqgQjJa0+Fs5CRDzb3WPcPDDvQcRqW1qR0FuiqbOjpUlt8kfHsKloD1rOthHM
 81N0VjqBtHghcDmwVpfhCbIwH57f/Vm1eRbMM28CwuUKxaV8RG+vlu9MC3FaydUyrppEe9d2UED
 wNp8TjnlBm08s+td65UKrLHARVpXHYCS3uQ4EZP07zURjgcSEuB+KvkbrMbK570oY6IPpmdxmYl
 I+QcbDE8qAMeKhAOv1E1Js3xB6TEQWQLAJvTGQrG59m6VSkiaV+A83G46sbAac+7F5QW9G+mmPD
 RZHuqHtOpFDeLqQ5aZChXs8VMG6SS6mOtIhV5woXrq+eI78aEVxcML4Y5foq7tETjYqexYyhyPC
 KoRrmOnL9Ag+/F/+9ozAGrUa7wLqJ4K40OB1xKt5FWCdo3pLEFqRr0vlwIRuqfLCqffzjEJPreT
 npQ+S/gQmhqp50VwhcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfX4EC+PXimPmH/
 +GUj4wJVFsd/szdQLpl6wp+XLDX5S2x9CPlmq/BQbxxJb/Asw7pIg0wfCrGuyGzwwhSwGl0E1q4
 0EMXzJIo25dyYEERMJ+vwve2RfzCR1c=
X-Proofpoint-GUID: d6CNgTrvJ696mN_zbgWRzGQkOJyxtbiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090017



On 10/9/2026 9:45 AM, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278baa5888b277fb34a135d7e5beb789a..a72fce70de45ced4635e7091140e63b5148decfc 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
> +	F(144000, P_BI_TCXO, 16, 3, 25),
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 30, 0, 0),
> +	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 24, 0, 0),
>  	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
>  	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
>  	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E23EC81D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323097; cv=none; b=dloedbZZLF87nSbi8JOAj2ub/jj/z1PCIcmMDaTFM6unIv49bqFR7gqBBui6+f1qWJL1fF5f/lvEESd7UdwXwUQIdBGKB35Vb6DGMug8++Qn0yr9n9dEVU8pSLA/trXvGNZbo+9B+zMM4/T6M3Z0vlcDoS7RCBluW7n5vKKG1JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323097; c=relaxed/simple;
	bh=NMqQI2fFPz4/wUymU2gtoWMUD3H+Ph+gfCtmWeThmx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aofnan2SqcBhpi1F9aiH9wRfVggkDxhfC7MGtHl7Ow7j4sgGVRFbZ2MHrZbr7gC2T7qCxUQJ1oyWMVTSoR7gD7APsk2OsOweWh2Keg3EFbthP6S+g7/rJrLNpQumkEG57GYmUWzunH79oUTjuXauoKSJVG2JfMmbcWiGyrezReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y13wcTk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbLMkUAz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y13wcTk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbLMkUAz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI3Don3285712
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqk7llMzHnlTp34wqRR3zNeI3SLsJhQEKBTOlGEeIi0=; b=Y13wcTk+9OrRJ9of
	LPgRLx5jY1IMZEEXDeCsvF/nTL0LmMKpd+NUP225853rBgh7nRoNjVWVReLk/nKe
	6yiSlCWdj4Lufvf8y7+hfNZO6N0fF8fxisdnliWexiLaUpBuNfpV7rgsrfIYFv8/
	VVbhSs+fwff8+i1DL+dqhUJ4jVU+W0eHLdR6RzwqLRDYizOI/d8ZKHuD+Q+zSOuL
	vkQtxFn0QlmbYQXjmzPgASbw+87TGaIBnn185thOJShfx013LOmYQ7C2rpYvXLou
	mVsYahDHHhKC2vWzm/+ciLXOFvta/n5YaOwPlhgJ7+MNr74I6oKzc291nDI5MObp
	TzznzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbw0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1946504a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323082; x=1789927882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqk7llMzHnlTp34wqRR3zNeI3SLsJhQEKBTOlGEeIi0=;
        b=IbLMkUAzYWzgSQKp9Gl1G+gRf8FSaZIuT3ao75k+qMPQjHrZGHVcxXzKv5NiLOEEC/
         Za8g2Mo9GO0Upyv8N9ZTCD+irMKgC9eWS0K4GFaFh5ExKckkJAnyzT8Gw1ZZbA7u/+vk
         0zLdPS93NgkoUOVjbNElVniJCuWOUihwCZGxK4caf+u3BCD2pXvLkkzeOzmG+hfbGTvH
         cdcxNs1HZkSLoVnx8r0ddMe9If7yoEHOh3oq00wZnWSzbdn12hFXd8ikVx/1YwSMGExt
         FujTJL6B5XEUzgv4WCpSWBhnFThhyc+pAW6mRUJn5LOPGz27EEu3oSOGQ8D540DVcxKT
         2fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323082; x=1789927882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqk7llMzHnlTp34wqRR3zNeI3SLsJhQEKBTOlGEeIi0=;
        b=jw/RZwLc3v+iG7lHzkEIXUmZJcJ4uQag3UtD4RwReA07VWn1PfmdipXfkA2PxeH479
         bb4jY4yrbskppxtyQp7NxwRa+v6DHmT9YrvMXIzK1ZkxueUaqJ05y8WftoLUuvFYw91B
         nRPnb1C2HjrCuY+jefbLMsMYjCAXqC8bH1egm/Ds7LfqHTsW90ywOIWIvbE0OCKInmlp
         lhUYPM/W3lRbTEy3fudEtYSdH433wiSdH9DI3XWNshhDMIsenjME97ppO4PcbhnrwxcE
         jKsqqm7nEZppYkUvmp9S7oKCK2ueBFCkUTH5gVMouRDdvL53R4v7WUq89jlEikwKXg4l
         EZIA==
X-Forwarded-Encrypted: i=1; AKwUvByXwD6m0VVKuN2PzpBma7XsmLBImRg288wiIzoqChXugPzFraLY5tDtipyVlmEpJ008EcPO2cJVVMOJnLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kdYPw+mY3ZPHzvq0zvIn/oGrO4IFIVvoJTjVMbthhfp46MGCXe
	8mq699wKX1yEiASTLlGr/K76DGjSj61Tm+eB2N9WPmBA7Hu3imko7Fk8VBM6CD6EbNw1OjswGou
	rjWXOJeH11V5TjxalLwYh/gL72hpJQ5e0RNJn+13vPAOUAJcdzEDx+TXGtd2nqdM57WQ=
X-Gm-Gg: AYBFou1Ha6KRIcvaTfFm4TwK31O8rlzbuspN3MopWzzskKafNKTU8IW7nwhgCPfBVL9
	HzWP15ynGkzucyPMs/10zY/nnVSMhyYoAYiLBTIUbCk6cO8XBd82Blmw2DzaP/h5PrYdArDtSrX
	5V4uq9ItFPq5/K1W/+fhHPpqMmqX4J88NQzCR7B+pC3wDZiRarf18O/+Hs+bGaniy+HGRSrLcQJ
	dD9Q9e5fL4PESH+uAmFvWHOdLqukzlRJ8Hxatx/XgDMiRxXLi0eF/NPyfBFZt3860Qs/E+Miswf
	YrQGyUzRvtXFmUYi4suABhV9TyDmCxchbNAAZ3953ZVLa75k8FVrXI9KZesfL0FAFi00q1zhNF2
	DEoTgduh3y3Y4j9WNWWn0xQY9Ajsn48g=
X-Received: by 2002:a05:6a20:9f95:b0:3da:80a1:f2f with SMTP id adf61e73a8af0-3daed5d1801mr27526032637.14.1789323081683;
        Sun, 13 Sep 2026 11:11:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f95:b0:3da:80a1:f2f with SMTP id adf61e73a8af0-3daed5d1801mr27525967637.14.1789323081261;
        Sun, 13 Sep 2026 11:11:21 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm19430817eec.8.2026.09.13.11.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:11:20 -0700 (PDT)
Message-ID: <41b0842f-7625-4016-b863-ee4eb835dfe4@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:41:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX+kECY8T0DJ7S
 xKOe4QGwx7o1SWNZVdUSJ07++kvW9z4fK/zfQPlVC7fwblLD7+7thY3limYonQomVwLoirdazmA
 e+krNd8pmv/fVmrcPPdfMUQoWkCKWbM=
X-Proofpoint-GUID: hHSpDcbwaen-n2ek5IzBM0p-xDggJgV4
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6e74a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vw02Y3r-7rk9LANHpykA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: hHSpDcbwaen-n2ek5IzBM0p-xDggJgV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX4G/3Ak7fP0bk
 bb//linozFpBuZngUdp11ZgxzrLibjXPe6BNB89DlPPZ+SZ3fLcFMoYEDWj8visA/hu7HSevTqh
 ItNHGl/E6GMVcH1eSlXcCYaOptVrpVKHIAwwgZe1yy/Cq9U3VBB94kNvksTBLp7JUs5X8V/p7i+
 nQ+rhHLB6S/b1S9BXgBFET7Fj6gtFwNwWj9BthdoqRRKVMMywmxRAnzGRyJ6XxPsM+5wjgDEDyu
 PHUSKVfpWUCLPTFMV7KJsAi09ECqe8zfUfhmADiqnpo9P5gcOMe/MNB8wRFCApnzq6sUuV7F0PM
 4vhpKk3M3Bon2hzjDKjpm+BiEQWItbSallKnFq1PeAesfEaxReiw+AsSbt6ApznPeuTtToAsxWP
 eUnc2QR2a8Ej6F+fo0nBCGZ5SXa5skSnJF3VWuqYdUWAUKMUb+EGO9KE+YhBliY6GHgWjTaaCUA
 dQGncjjne898eDLBY1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
> present in SMEM for Shikra.
>
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
> used for subsystem LPM stats since those stats were populated in RPM
> MSGRAM.
>
> Here is a brief summary of previous targets and their stats configuration,
> along with the drivers used to display them.
>
> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem LPM stats        | SoC LPM stats             |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
>
> qcom_stats.c supports both the configurations for shikra, reading subsystem
> LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.
>
> A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
> and vlow. Add shikra rpm compatible and config to read subsystem LPM
> stats too along with SoC LPM stats.
>
> Below is an example showing LPM stats for "apss" subsystem with this
> change:
>
> cat /sys/kernel/debug/qcom_stats/apss
> Count: 2192
> Last Entered At: 5498618336
> Last Exited At: 5498708046
> Accumulated Duration: 2046572620.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

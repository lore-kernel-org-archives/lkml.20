Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B219F3BD224
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881865; cv=none; b=DzWv2mQU9eLDtrju17OFZfAqML7sL3wDqEpizHNLIsFx2d+fyixgLiYV1FLanQ1fMs1rhmYn2FrEWK0D8PCFWGcxU6Xa5Hj76bieUC85zXq5BOc31QQgLFusHj1+i/X604ut63vAL64h57d82Rlj+nx5u3S1JiY5Z5yj3EstLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881865; c=relaxed/simple;
	bh=QnXMdDj8LNbLkg/lz2HpZlfGCPVar7BxEAf5wydzd0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIE16tr1KoBvhHjjbrfbElnbZwGK8KfvRyY6aQJOM0h4skGb0CL2iNVUizu+PpXo/88ERGTR7LesUsFMFAa1dPU6bPXFT6W0wdeemb6xZtg/H5mxmPKX7B1EMr9vtS6ph1+MJQ+jjDQRCzu+qS4vdLCsgeXtkWD7bCvwuyEflu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqTICYrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp7kRU4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqTICYrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp7kRU4u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45sMi173322
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=; b=PqTICYrMjyfSv37G
	zNyPV7zmB5FKKpDnrpcJd3YWtlKcASmC+skV/SQKB+XXQnmpCaXKkJz9eQtECPIw
	+tufG27EN9ADrUHt8kDxwmleT+KoHnDKrEFrrIMOE8yeqM1gKtkIWTbJxDddhQAR
	TJxgHQfKigHndmm/t2oKxGKJUwSEK01qrhIs/uveCRacox4KF5VMo8ljg/p6GVPI
	LyaAX627F1/llVtzxR7++CM7fSq3+RoXJubjjwKVHHA/6BhxdMDYPQAhUMZjvNu9
	ZFdeFixIpOno+JLMDpJRBA8oVgIweRncV2APnNDU7iJQBR/F8ht44eS1loG95nTp
	FpMPwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs3ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:57:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so35221585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881863; x=1792486663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=;
        b=Fp7kRU4u8QHGoZBPqi8Uv9GWLS/WIwft+oF+K2NOjKShp7KMn7GXG4z3hfw4gff3DH
         cHnUTh5c3j6sNoA1yRS0TApQGK17woeWTmC1k7YmbyrJu30SRUoPWZSDnMrICbvzeHtN
         Lz/b0/V21t+yFlWn6/ZtXEaczLMpup+j0Z2QKFCWokDamAAjoaaN6jZpEbO40PvJ+xdu
         FuI/aVx4ikFWa5m0mseKgM0amZmGykxk/XtJ455mUGwYehJPE6jT+7hZoT68re3lObBJ
         9bc0ULrehyrxvybEDORv7vg/F0DsdqA4I6GGE6mJi80ci5Em94Ttn6Vq4mLzTXNID57j
         LWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881863; x=1792486663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=;
        b=usV9LxeuwXTK5eEJuVsSHwUEXXXXV5Q6DR2VZSCBviIWk+XfBMvxnm4BqRQRuNTxL7
         OgMHiWF2dCU7Y0dnVddPQ3UHOOzjYR6aGJYLqdrRI+7bn81oQxhJPz2GwyFCJIHaBCqK
         dAfjotQFlKl+JM6KI69P740l86loivGPRdYgOgkTA7Sao6CXNHSnyffDn1z1lMsMSiTj
         WbwVHQVdC/wg7t64/PgDEa19KLe3Svz3CEEoHdzM1uosNoeu7r15+kt5idFaatTPEuvu
         Mhb0p8a+8j9WNKKVFa1fZ35tIkFUPF3H+zswjFyukhf0wQZJQym3AIYjbmobvztsjQ39
         5sBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzWUgAgSTUkKa/xRe4H6wEx0jvjIzaXB1D+HQqa9wRtUQkz6euEBTkWYnffVXGpThd58E/vjT1Sxeovmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXsRfNFbzc0kvNSRdH2lI29C/BBeFjqV/GwedSkztffskyk7Lp
	hJ9ICGCKUiaf8dVbtGsarUdjsR5sknUp5Zwb1p5a6OeIIY1SPMaRLuSUrQd4j079m0XvjxNIZLD
	ANu7+ToSaYulM+YVb4W6/jpPni0EcWBdL6k70xF4jGXgV0aRsAG3IVsZOmXYPQWcAj08=
X-Gm-Gg: AYBFou2l1s9HW/AKYS04wAjULVHtMjaByLgG2tIWFfvvz278DGlKEjS/Ph2vCOsLQ7P
	mcqOR1USK3pFFmrrN8ohzKAjYSStyWZdlc8W8DjaFgp/911DfJ/lLQ2IVmkDO2JpD3p48VqBSW0
	EqRPBNooHyzwlOkLQp8rMQBSotEMrY4kKze24FBDHqHbpnKuc5oxtzk3gyQrmfGLdVN9KEDlwh4
	cUeoDRH8f7NEmPrjTq9JCnDgzsXCQoIww1PyhvQ/ox18RBwR3XRW3Z7pKFz34/wem7ODIITFDVK
	LJ9KVfooxqhh0IMqrbL3pSD1JeT+hutOSyCtZxOeqhonT8089TIMDGnC/VyDRDHX7bnYssALHAc
	w/6vFqSL7qgSO+ToCF6HTMA==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2009745385a.5.1791881862728;
        Tue, 13 Oct 2026 01:57:42 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2009743385a.5.1791881862288;
        Tue, 13 Oct 2026 01:57:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c1d9fc0esm2420488a12.4.2026.10.13.01.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:57:41 -0700 (PDT)
Message-ID: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XR1jJ8A0dqYtvo62cjAbhFZJpKGC78Pb
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdf287 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pQmoqa-UAMS7fspmYOgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX0jEFtn0hV4vb
 3hvKUyGsOYJBQss77WRXO12P9Q6CYJCUENhMl6YGCOOSDyKJ6zYqeHoKcnevzO5FQ7akqrXr/7u
 JqJZslioOx7OL6/EtBVn1P6w8GN1wu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfXxqadF4koghoa
 XZcBeqknAax7RZI1ml7ASaa+6hZsrqBVg2+HLtLTVHDsGg9nWA82wAOZuJzzsIkbdn8wmbjSFpb
 3RXNK9QS0mhxJbQxGLk7ph8Ct/14Qm8FSXzFYaQWn1Xff/HhQxfTh17TbpGdjx3HXq7RXVmEUNv
 Mmj5xBK9LzgEi8MIMCGDCGRE92asD0BWZ8i2NWUk2CLdBxDG/kxxawwGR5KltgNccxEsvh8HSUA
 jQ59s8zMHVa3uSOUut7L56Eq3mvG3mP7weYCBr5ELZ7q46viAHkbNw0YCeCsU/fnphjEAkQ61PY
 JFYDMIjxglijgv/axYQ5+ERLo2dzsWV3D/huNlbHRwukNVJr3k4nAbqx+2HHhIocQRchSacUoFn
 67KhsY2sx9wAmoGFmKyUtDQ+/+G2jPCj4Hw89XES/rlHcWNgiOfZG+l7ypkZELl5fyI6hzuPzeo
 mY/4A00zfVjBeWJRm3A==
X-Proofpoint-ORIG-GUID: XR1jJ8A0dqYtvo62cjAbhFZJpKGC78Pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 10/9/26 9:35 AM, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

But that's not what it does on this SoC.

> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
> platform
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..6fa958044218 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>  	.smem_host_id = 197,
>  };
>  
> +static const struct qcom_pas_data nord_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.pas_id = 51,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,

No DTB?

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9B45FFA4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982550; cv=none; b=ORa5K5JaoO/9POgVLKVSLl+kKtgXT+o81rAFNaK0TFx2FxTDwoISu0y5TtHuCNzKISakcgXEb9ZXbkFs9jboqXC+giE6PyI+86cv6pTSVBSkQ5fBpyNd3DvtHHlUL9KrVsS3Qe3tyqlzC21gnbyKoe+Q277UYC6AGq84TydQr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982550; c=relaxed/simple;
	bh=NvzLP7A9B3+X7vYalfNocRVOuYqpILUq2Mhg6LSnr+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIbahCIwq1WYii0exEQ5ZwvJfUqp//uSRRJ8cz9HUrmR5FAJEN1zuHRC+cp3wrUwP/ikT9wdFs5Df4naDLZTcZ1SQ5Nxe4sNkxOvO8vhKXOMAuEbDoNKDnaNYnox8UvGuOzm0/MmjEOmiIeOs6ZX/K4laow7kobzEWt+xWIZs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQSHSCi7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dtEI0qYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQSHSCi7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dtEI0qYP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L8aMsc4146503
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0e63eLfJ1h+G37EJuhukYaPWh9xzdJRzVCMuqVSeeWA=; b=GQSHSCi7sghy2scF
	oQ7fmep0hT5UD4R1VYHRPU7nOum1PC1FOGtGNF4N8udoFr0PJwnDayt7T+Ydsic3
	SbCge9+uAMM+r+v7AiD/Cmbji3gV2cUL7u3V2difYdeD1uF8TXGWj5pySnvEBCS0
	H30DocIYV4yGD3PG0e0701tcf5wCQ1JA2eeutkqbcv6ye6a6gwj2cvKjI1DWZGRY
	kN9zn8+yBTuxhlLNCI3cogbQJMT/HyCRwCJj3qHrf+3POipLRHKbDMxzt5CvEw7d
	F7jtltbopBJUGNC9WC5sPk7Zbe5VO2RrH1mIOT6SNOLa5bf8wgyGrNTdTAnZVWIV
	MDNXOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gr6pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:22:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so83165785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982547; x=1790587347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0e63eLfJ1h+G37EJuhukYaPWh9xzdJRzVCMuqVSeeWA=;
        b=dtEI0qYP55hmlDQlGs4sHP5FONd8cETPlw/x5pYQHQArKBvsmMthcHS+XlU4JsmSwm
         gci8ZKxKvcD5y9GRP0BeUanYqRFBNydqKZUTnN+gStoecHuSfLRgoJpojS8tWglUvxRT
         3ZfUVy8iE5FQkA/16OyFRmBxOq4lxEBB4DByx8AblPRKOZPeVlUA4MEyJuJW1klis54n
         hMDBjRwk4DpP7FCsWTcXvkZAXXwrcyNAzN6xGEzgzwL0uUAKV2KcX0e79v2k82+cBJGB
         EkJRi5njq1FpgrHwS+jMuB/zM/oirbSo8TfY7etPkJFfrs2isFJiik1JiYJy4yuqUOM5
         Jn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982547; x=1790587347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0e63eLfJ1h+G37EJuhukYaPWh9xzdJRzVCMuqVSeeWA=;
        b=n1YwSGY/86RioEB57kMniTzH7iLj/K3QjZPjvLZQSfIi8lJjLrNE7g3fck0kTuvosX
         GsHkuY5jPhISiyvC+QnhPiIyli8N0oakNh7TIFDHTIEc69GCsrZQ3ncUgOadopZKtP7J
         TxoT0povNdsJ6dl+or7j0V9y3uROG6apdj/EFuzsiY/5sYpjzbJ8Y+gItLOPonT9R5ot
         zjgJKNvQEfA7LVVHq4Me9FACIKGTS3CVJs3niH+HjiLH/8cM2qT8yhva6JsT8wWeTnMn
         5rZU1qbvuvH5UXN3kmsTiQlf1aP2gQjQOLNTFW0cbdQkBzuRg3CNsPxgOkMoot67YWx0
         CxSA==
X-Forwarded-Encrypted: i=1; AKwUvBzokeQpxTEB9z+Kori0cFvfTrkFf8sxPtxVTFpQDu4vsLkiWMmPq5G9UY8hlvloirm6ASsQ4XKOKUYerAI=@vger.kernel.org
X-Gm-Message-State: AFuF++mykYdMjwDdYRfoBGz5ruSwlsLuagFrNzVISUJ4Ib19bASIG7ED
	J7WcmrHU4/d0KLR8YAlugcJIiHiNajh6bxPKo258CpcLCg74xYU+PVnMYk5lUX/X1LOabDLmyNC
	mMlJNcAdExGxbzc0qdUlYBz99cGRbT54jQ7NxQYHJwABDBEK8U621aqjSoCMpuuXwCjjAWhD/1S
	U=
X-Gm-Gg: AYBFou0NfBaPDzhkPJVo9PzkB9K4pdxMsf4Uco3CGmWBaS5D//mL4eRKK5XnmrbMGkU
	RCBGrRSL4rACazhqAOWBk/T49lrj+9Ufq0vzPCGgdXtNdeJ5OGC24FGrNMXCxu8b3FxMsbL7wLr
	6YLObZ58OSfgqhGfQmu1zPkesT9nuoxyMo7owlpda9w9FUxRAlrGcINyVOBkhLHqgnw1csHQWHz
	7hTOQXnd66UEDlqIsTOp1aG0CcagQnhtpqfExqiy+2mB/282u/Q/E6xFCEOAIgTljQf2rCOObyJ
	K/KPVdNyUYuH/KPnT+JuPZYIlLISOmdqDFIETfnJ+TkzCOsv+WkJDRedhGfLSUVn+2JdWyoi2sW
	rqJ2DlHKH9yuGc/bpUKa1jA==
X-Received: by 2002:a05:6214:4686:b0:912:4680:c97f with SMTP id 6a1803df08f44-912b5089570mr101157066d6.4.1789982547101;
        Mon, 21 Sep 2026 02:22:27 -0700 (PDT)
X-Received: by 2002:a05:6214:4686:b0:912:4680:c97f with SMTP id 6a1803df08f44-912b5089570mr101156886d6.4.1789982546659;
        Mon, 21 Sep 2026 02:22:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67c71c59sm3960631a12.1.2026.09.21.02.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:22:25 -0700 (PDT)
Message-ID: <79c8c31a-b980-4f90-82ad-3807114e137f@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:22:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2S HUB
 Serial Engines
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mmHP6IWJswlaVodOwLDygqi4Lll8c3ts
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab0f754 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=U8wyIeYwd4xs6rStnZoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNCBTYWx0ZWRfX1gVSLU/EXoLy
 4LZaywynrnbMl4i0mQudU8Dc3UZct1Q51MSF3X4VpFPj8YMgS0ibIloj232NEjVLSAV2MAWU/UN
 CfLSQasXouB0OZ/pgyAi0nSvz6oTss7JHLnWmoty256UvdzQmEg2abqnJywUaPQeZXIr1Lc4Rja
 Ua7Nud29DbeoC8dYPRDUPpR1MwCc6AYB5FqSKK6v7/acn3Jd49en8zOp+VVrtbQwsIlHvz/GD1g
 hiqawxc6gmZwYcNqN2sbiv1Afe5OSJB80v9a0kEGmdQ+N5LM44buLVHnFPVmqZWP4AAx21snDgv
 Szy7Wt8w15pk5+iVJFuWto5bzMBXRkb4PejdV63Q2d1r2DySDDpoF9SA6ZsoT6gxkZkRBEVK4Xm
 fI3PPy2xN6ywP6Goke706D1x95zkPd8UPoXNOODhhGk64Ith9UI/s4nPAcNbsKimM04iR+lUHO3
 kG7rsCymWmDUI0E/4Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNCBTYWx0ZWRfX8cTyuZucjzW1
 +QdCNPAlz0twjExi87Lg4SuxjuoYkqx4Hwko9/OM8+SLceUeNJrW8b+w9D7w62g2+ZpXSXTaJni
 po/7QvRCIYE3aec/zxRDO/peq709WA8=
X-Proofpoint-ORIG-GUID: mmHP6IWJswlaVodOwLDygqi4Lll8c3ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210134

On 9/18/26 9:29 AM, Neil Armstrong wrote:
> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
> is in the DMA register space doesn't exist for those instances.
> 
> Provide the ram depth in the compatible data to be used instead
> of the reading the missing SE_HW_PARAM_2 register.
> 
> Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

It's 1020 on every SoC I could find

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

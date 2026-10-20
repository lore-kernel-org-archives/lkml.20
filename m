Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482849;
	b=ebhUD0OYV54pdQdiZuAa/Crdkte6QpsabZ/Pig/Xmv23RGY/qV4JIqrxaTOdRx/ePJ0c
	 3v1M0upHbkcjABiyUQma6pR6OkvvL5z78V6O7ImFUg76k0le0RifGwW6SIuWJ9dDW2stq
	 O8XbLfxBsvElP/pxuGlBXCqGdD3gaeLrad+qzUPna/qp6STlcB2nKhM5s2Al2wqq3PhAq
	 8dh0PXjjrEKi6j6AlHkr4PNTBOf7Xs/QTW2+2dl0+SW51LekcljSxkskJgKeliOGR/ESq
	 L/I2+vfV7aF2v8kHxxm2Q8MDqDXuV1LkRrPSSDC5HBwORC9Twzfw+wLFSDVw6RfddSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
	b=czj6c/fl1c4qdMY1XlbG2QaqeiXQrP43vEXcKin8+z9H562quQuh6Mu6B73yCIIVbLMk
	 M+Adr9poIVnWtZyvUy140Z+CCFjw+27Yf4Og2awnJ1sSP0GNJIoCB9j9Laq3GL8e/o6f/
	 1sE1hG6Dx2cv3919vhkS6ddGOx7e/rA9gk++zRbVkOX86nEckWwc8mzqujdzVbrnXTK5S
	 0WsXESflwzi94MvFtZDnhm/GOVNKHxXLiptOydQnekrbQYEcqup8lzpTpuPGU3oQ/oUgT
	 jey5Vn62q4fsP30gHBPL+BVn2Yw9t+aJK1nrjJY1GNBV/+y/PxspEIXWDpmsgeP0Qdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5Mspk6N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PY//PgIC";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D7606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77D7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5Mspk6N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY//PgIC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K4EbCX1134443
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=; b=g5Mspk6N/4GC7ZKW
	EtBg6svNTggQVEvZuGHEDBNb2OznT9IEy7/HD8dNI6gLC+4xYKc3fMq9ojwf5Ntf
	i1xJD2kJ9kwJo/vNfkViHVA84C1hLqXRE8BVhWB+LeAf1aT1BMtbHn3hPTcEoSO8
	hp350xhm+p3oCyryD18OSJZ762+UIpvawKNY3p+X33JyIR8siRl2ww0kycF8dUp/
	u4taSY6xmTSy7D+NIbSuDOHqd+ezT7Ofo7TPEAmQYWDcj9uJnzK19icBZ7ykgYT5
	8Tmfgf1SOhF6eoC5WzM3D34/8bD3NcmCut2gopS9evRFKmMoAG5o2MTg2owDYTPV
	mmIAOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phgnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:54:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so106474885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482847; x=1793087647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
        b=PY//PgICNWuYzyjJlEJVbKWFkaGrpiiP52kHMlXFgSOFuL5mRmtdn7VHL5lb14hN5z
         8KOwzWcQGIrDuH9dm/8GJrKpCUTPyPq1NV0nj5X3JmWksBMD3rf0Oh92Ncerywhuvtgo
         RRp5rHXVMRmNOx1r6UVTLfft6sOBtzOOvNNkM9ivfJQNFIaSVi/Abh8hJkYhpMU/nyYE
         uV+MuEMQtVsc9Nh6aODBaAJYh2Gb3HDfwirWF8lpEiwLA3mAzbKHkpVGI/8pmlGMbcR2
         HX/+QTucgdZ9WuF/LhMp4nOrjAtW2DKNImKY7uxx3OAckKr7+TTUHGrUwxbFuv/Zq+K/
         Z5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482847; x=1793087647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1zJJ4fGyYwiUZN4gA26Z8ebgEKXLwJ3LM/WjuTr6cI=;
        b=FgfwA2EYB3qg9n9pw3xjf17QSQzbR0/USY6NnWZCpf4zGj4aBT+QeH24Mc9DTPJOWL
         QeUvikFOq96Rs7vHTsbmNHatds2DrDuiPCoaalQBSobG59zL5Z9CU1Ce/JybdeaIsA4s
         Yqs0quIM+MwvCw0zNDvGsfQRoV9liBkdkNPZkb0cq7L0nk5Z1OqtdtSUASw3jgtS/vSD
         qq5+0Xhl5iOBT8KdTuu2SM0RI1MBZBHezyHOGqLhMkySz9MPWHtPL6Xsd2qSK9jiNMNp
         VzX/ygYH2dMF6db9FFVQK9jo3AwHyy4+2yOhPC32pEOR+vv+DJEdGL5iX61FZXEKkkHO
         KDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIPbvwrphpVmm1sJ7hl9hEJViJHwVEQ4odvCtBtUQ5MPqYWUTNB1Arjh9kA8yqJ89p1s6t3n8FE4N8Foc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLpxi3fcOrnY4RA85O3SfK5sR2Eytcf6Fo6lLo9PxyORe0A0Ts
	QDqCvmDpzn8sUr1CzeUSQGaSQY4VOBdAr56KX6C2sLsIYEe3W9Wo9Bt5fCpwDrUHZmv0TvllZ27
	ZznykHtOvqBCTSYl7fK4IN/jnwNc8Exx+A+PYM9O9qGswPrkRbQN0OFBjYb1C5NOgy3I=
X-Gm-Gg: AYBFou0HP+97odczeXrQ/UsDfQd1PYg8UE4ch+yQFAkSUQxgH3m0UiPTqgTafov2MyR
	DV4RlHL9ujLNgA7xpu4CCxB6vM/qxvsxXdXMQYJXBzokvx61KzJXAayFz3StnHN67/MdWu5vjQm
	YThqUxrj9a7oDOzPweKZibB9xDTAkyqUZ+K/pbrVVO+FMRJWL+Zn0aGF838LTMR07BIv/bPh06/
	3UVul3L2DUxTRcnx6/yEgVoiMbTrd0vRZ462Xei9ea1MX3OFc5GtXYPSXoseoWjIi28nROrMeyJ
	iT77wK8ARRd4Bxy/K/ALiqxo9rNh7blDEuqxfGRceHU4ZhArI96TFyAYd7hyv62ETJFOLu6YUUv
	Yykt2iBOk9NI37z5Ah4FePA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1887617585a.4.1792482847095;
        Tue, 20 Oct 2026 00:54:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1887615985a.4.1792482846657;
        Tue, 20 Oct 2026 00:54:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e3284e3sm442950566b.3.2026.10.20.00.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:54:05 -0700 (PDT)
Message-ID: <0675d408-874c-4ee0-b587-da8e6ce8d0f2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:54:02 +0200
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
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad71e1f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jr9c3DReKV2X8DuSQbUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: URQM46uvS5-ZUfy66eRnP4Aw1dDT5tNH
X-Proofpoint-GUID: URQM46uvS5-ZUfy66eRnP4Aw1dDT5tNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX+3WewXrLK4rT
 wW7GIOV0hy+EcWEZP/SzbmdLhRdM8q3JxSd83JwInwl0b2/ZgI5tPVbtRvNLQJP2TqxLjwOhFeS
 1mdDmJDWDHqpij/hn0UhT5Z8omIab1xlcc50ilXJuy4RI852CyqiARvC4VP0adnDQLAAu9B7FjJ
 uFc2oBat7Jor3TxVo1Mdvv1ycg8exXS9OQDgc/qwaOsjfJ2PAEQZ7QA4J8IAdLuYs1LxNw8JKT7
 QupzWlUPnoTC7rd1s563R+G3dg66KkVYuwyhj+d+MWrwwD51Vd1RQS9YpDxn6TMsS6bS6f3OZIM
 u5WE6NSN3qXuRWgr9DeahgAL7sT9AMSwm63q0jSSzf5D7ma+tBKKPUqoA4PBWUmQXBYm7Fh/9v6
 dcajwVPLH4+8ry85sIeUjOduVgSsfDWsc/b5gppX6C4GD95J8e48K5RwGj6TJWiosDRmfTloezY
 tGEUBbHPHw3/yZj2DWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX1fAkcdcM/LHg
 Arzb1d8pgWdHXtvGUSXo5RsPJ8XAMa1WGhx43dcXbCe3iGs9GuV5j2WDMlSSCwTBo9NYTp6ZWK5
 HboKl8q37zW79skwZeG+DCToIZtaATw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 10/9/26 3:50 PM, Kathiravan Thirumoorthy wrote:
> Add the system cache table and configuration for IPQ9650. The LLCC
> hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
> no broadcast region since there is only one LLCC instance.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h |  1 +
>  2 files changed, 77 insertions(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index d7a42a8040a1..7ffe6b9019d8 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
>  	},
>  };
>  
> +static const struct llcc_slice_config ipq9650_data[] = {
> +	{
> +		.usecase_id = LLCC_PPE_RXFILL,
> +		.slice_id = 1,
> +		.max_cap = 128,
> +		.priority = 1,
> +		.bonus_ways = 0x007F,

Please use lowercase hex consistently

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

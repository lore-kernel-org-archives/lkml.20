Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1563A8722
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507372; cv=none; b=V4tIyLcwjOWevvIrbRawbaHn2IQugRlKnLWQW15s03l77tLxtCwsKefnohSM1K43eu19COtHmG6aao/LEGK/rYd7ZVQYQfIOraB6QH67n7yTBQLqkXu6PRHLhO+05VyScdYxe9VQ1+iRiL+D7nVEdONbnLEaLP3FY1bJy4N3mnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507372; c=relaxed/simple;
	bh=xhlkm997eTBuansl/g5BSoTZBy/eq8gMxFuXKrI4/+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9zDe0P8RxCmdr2/ObDygRLzQtF0ew1p8tViU+vbp6oVLE4uuXkMnNP4wSH6NFzw86SEEDq9JdwnxdpOtmDBSIQpAbj3HmPJr0jH2tT6Aww2G8hR1bFDZvT/SJppYcJJsdB9nZHYs0wODxq4fKhT+tYxUqH/5VHWumn771qqQgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtOsyqsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp0er9aF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtOsyqsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp0er9aF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462QWG3882946
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 07:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	el9/GWun7bF9QXuvqr37ACTgJVtX0bMsJv7LmsaRm3E=; b=HtOsyqsxEw+hnDBy
	EZaLbTbqSbz6p0qdBQ6t2ehmmyGHnMIfcFlf+4Jr1mFoGC/MxtVObGoCAOp926gq
	45ONSPtQhBmnUyVRcZLP6uxkxZuFAREsnsjMDp+nu9YAAE3eiTWjZ/K4J7BxK6SJ
	d3T9DBekIbD5v7Q6OOEzSlV2gh228RVQsitTkEy0Y1viaSWboc4fZcYEDpdHcqVJ
	rzyfLPjutnGOqpr3MhZQ/anwp87exOc1Oex14vizp5rDUs/z0cDGAt+ZHBhCOFM/
	j8IyCJMn843YEzRTJT4t9PnDQaLulOSXkWnbmmtFegmt9lvBb1BEAA3xXL8oVcte
	QXjbyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1c57v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:36:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so1921631cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507369; x=1789112169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el9/GWun7bF9QXuvqr37ACTgJVtX0bMsJv7LmsaRm3E=;
        b=kp0er9aFCFZAJRS9UMGBObXEzxx8QLhRkLPrI2v3hsFFolIerKtq/KkRg/OepYl8Cg
         dYvx+FTw5gHT22gh+DdkzQtbFgSEu/0bQBvM9E4znxVCbkD2IUljFtYKxCruNfyB5DVi
         faClSy+9MtImiM8jB/Jvh+wAyXgtaaRRzqRzaPdq0WHbi+t3k0BsO9V2tzuG+GQgFE2b
         2uyKnSEPTqeu7DPA561G3V/82gAtIom4yLCYSDaIe3HtaMnm9SyY9HZIO7abuiPvcHUs
         w875+HYWpi71oY+hkG0ck05aOX2LMQ8iWHSosmoFBZ6izpRQbN8OohYAqSXYRKpNWplL
         XQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507369; x=1789112169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el9/GWun7bF9QXuvqr37ACTgJVtX0bMsJv7LmsaRm3E=;
        b=gLxGZqNq7sxe3KnNvtmH3zWUgzON5i+u245EpK6jmfEMflPRK928+YWlySNm89h05y
         Xyqu+SOMOTehXH1aqKIb0T+nqsPkL1sXV7NH3LBSns1U2/l42Du1Q+pne6LcCglOh+5S
         6MgeB6IG+wcW5sZrazRVJ+RQrPP9mZhQYjagS7PF/xH4/G0CnclVquTzw6YebPYbuLJz
         AK/WI3FY07iRihkCUvO2FB9az8MmrABRolt8jXwaAZjiqJvkoGP8cM3bQCmmnCAsk+WH
         50deGiBEbv1HJADiIF5vX69r/AKixezL0XXDLWQ0P7yjzTPyONmq0RWKyiAxpwBN4I4S
         2D5A==
X-Forwarded-Encrypted: i=1; AKwUvBzfOioVYdwqqKffJS1dwbbL/5qZY+rTZa7KaAE7BnTTgndtVqcKX5j9RjHW4QleAChJTwZc/58qhkHv33w=@vger.kernel.org
X-Gm-Message-State: AFuF++ldudukNNNzlg6two+ba6X4z1TWAOsZXmtTnTkSlsYVr0Xnx81V
	vi+VRaC9K9WPF6egSrY5Wy1z6h4Wck3rt/1cUCre8eR4iy1SfTl3ABzs3QQHNvj3Sj/01Db3nLB
	EKJgfrURCFEicoiTycAfQPqDba99YxN0JltowkUHBciapiOeY0w57/sTsnb/zOcLgUBs=
X-Gm-Gg: AYBFou2cFLmL9ev+7RjJ2Ulx4EVunUaoZrr1w1Sz5WMQwGLWfSJKqSHkuuG5ExjIvG9
	LhUvhHQz1TsT5pmJwduCPQpZVW50vJxJ1ujruThJltaQ7Ca8wS2DcDvd2DrIpA9XqUISVQvsejw
	XEh9gXmhz83OxUA62sVcMNZRj/3WqCvbG0NSCKMBSKCDRqaCxeT8F94dsoMJ/IVwNKDY1pqucPa
	ZGdnv1xiyijct7XIE+Gwifpbt5PHXcVJasuNIZz4g/aSS3mQe94YQfUi/oHU/FwoeVUlaVJeUuq
	zBzdzubYZ8QiGAzLuC406V4NRv3XRK3fPTE15tUEwYfEg34B4KcikJHB4LuRWNXmLx/eAII+l1t
	nvnZNvezwFzu7E+je7m26qw==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr24270491cf.1.1788507368680;
        Fri, 04 Sep 2026 00:36:08 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr24270211cf.1.1788507368196;
        Fri, 04 Sep 2026 00:36:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e66eb790sm858631a12.3.2026.09.04.00.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 00:36:07 -0700 (PDT)
Message-ID: <b326edbf-fe34-426b-af19-912edc18ba84@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>
 <iynrogny3didip7cui3ce3yq3woaqzrr7f4aqdzvls4j4mslfn@aww5qjpy3gdx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iynrogny3didip7cui3ce3yq3woaqzrr7f4aqdzvls4j4mslfn@aww5qjpy3gdx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1qo7W4rV6OV3DRoAcK8mWi6i7XYXJ8aL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2OCBTYWx0ZWRfX/pB0L/N8gFlp
 DmDeL6o3MR0JmOWIMOTt746czVQfp3m1d3jCHSSOjq5x5LT6pdmNcV3VWo9FF9N0d+DO61s9Zo5
 uajVh+aURnJZ3ufbOAlWIuPuX9L6mPQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2OCBTYWx0ZWRfXzy0pF7kTQTl3
 P1GR4U+5kTy/PVHstRqcxhpvTAioLTNc/dL7mmZ80fpfT6dgdq0O3+VHqhfAu0zGLhWx4zl2POK
 LGHFjXrjkOavgkL99vO+0Tu8hvTjM246C+T9qXM6I0P2S/B+PzvH4QSL93KC8eAxWrBALhpyp7u
 x81Lrx223xXKoGE2ZCW8ReaCJbtABAXNsFgSllSg4GEEeHa1FaylJKWVHkOErq4S+HpnqHBrOGY
 9fngM74+jURMONAt/ybLBpf2RsOo/JRmV1d8QvyAF3yDfjo5xxPidvwxUORnm2I54JMl0GpMZFZ
 TAoHOqYl8YZJpAo4nAPE5sVehjF+jDta6ELp5ba/W1AGDbhQ+YRByBjkhbEy7zm2nontpWhs45u
 +BhtAckVFT4jDSyY8VoA9P9vihv1iQqF2b/u9s+TaDFgB/wKkok0+DMcEYXhX9ksHYH0apJKXhI
 iMPcAmrouC9nV94Wg9A==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9a74e9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3yxzJo-rEr3QGlafRVMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1qo7W4rV6OV3DRoAcK8mWi6i7XYXJ8aL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040068

On 9/1/26 2:44 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 20, 2026 at 04:24:12PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>> and DP signal processing capabilities. In that architecture, USB3 and
>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>> The DP part is roughly the same as on the instances without USB4.

[...]

>> +	case QMPPHY_MODE_USB4:
>> +		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
>> +
>> +		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
>> +		/* TODO: disable DP PLL if there are no active tunnels after router setup */
> 
> 100 column width generally applies to code, not comments. Comments should still
> be wrapped to 80 columns.

I believe this isn't a real concern.. checkpatch certainly doesn't care:

# LONG_LINE_COMMENT     a comment starts before but extends beyond $max_line_length
# LONG_LINE_STRING      a string starts before but extends beyond $max_line_length
# LONG_LINE             all other lines longer than $max_line_length

(all take the same value, preset to 100 at the top of the file)

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFB41A3172
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706439; cv=none; b=YTacSxG6RweFYA0nWn1fhwse2SHF9t5OTfRMle3uZJPiquag2nuC+g/T0AB5cRAyNq/2Jr5xQk53J17AFt96Nyrf/SxlQ0dySgWCJy1moLo7N4TmFdZs7V+46emW6djQVBtUSdebTNIKg9IzpixcCj9LMa/U/OM6JN2FTu33vU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706439; c=relaxed/simple;
	bh=GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhKUEeeRm63MJnc8BSeQy571eRlvVvE9EOOuxptxSTyQYKwtY9Pino4c/VjlqTlo5EQgS6hHzuqk8eBbBir04Q+6dxs8xL0ZnLIYBj6/ginoCHlLjBvbqIfstQR3/wY+802r4rn/mSReJGELLWTw54gmuwqv5oIzIEgfUnBBJqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggcnYsdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnBOYQpz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggcnYsdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnBOYQpz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UfYH2851940
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=; b=ggcnYsdNZhkfVvU+
	9iG4KW0LuyTC+7SVgSdMRVjwIm1dyDGUTazZNW9r5aYL3TWKPxmkTj9skg1W4JsN
	6VsfF6itt/XgaAZ2MSr2Qj4DMGos3czDxGov3Wk7s4WghJRq7Yj+aAVMZK0y7QBL
	DIXA/75Ec4Sjy46i43u+felCoAaxduDcm7PnPPznUAisheo3wXSZKzTg+YyNFu9l
	+dhvPPZDZq24Yi0Zdqipwk3Gc3gH6iiJGeKLwYzeg4OChSNY0GZFYXZinoe0ruWm
	EBrj2iNAa5X+0QjBQOXRefSyIYJZ+odRCDDeuwNr/Vdm+HIjUmb1nESDxNqnJcMH
	m5C+Jg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ksrm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:40:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so422992a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789706435; x=1790311235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=;
        b=DnBOYQpz8I7zgcmDoeqDQSOAb1N/no47ZSQUZkcP9p/27FcXO9QsnvN8aWrnFYT8JU
         WcBPpNTmCTkwROl40yZXQrbqT6JMaWBqbkXP8xHLcdBurbBM7uQV9IBq0QSPc2RtJE3i
         ugnM5ND7ZQ+RhVfexZr/mFhDZrosPlBN2khY5+dvxHRr3I5oF5dIi4ujtfs9YgHMNRhw
         e5BOf1pAfdvFQTFbXo0gEUr/XZyTNEPDMUahWDrwEmGEmUVYTKg9e3fYdNz8CjoCg43+
         DutHWydq4GuDBK1SRId8K3f1OY900F7sbrD3S2PttLBPd9euV4wYAoTX0XlNC6/mGMyE
         NLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789706435; x=1790311235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=;
        b=eml3jeAys9LL0T0S81Lo5yjdz2SGAGuowReiM/o63yFES9eDZEpcalsWsMcV8uavxL
         Kw3IiHAUxvVsnBW1zYI0FqwsxUVYaF19DKgSri2vyTDYFoQgwtQ1ECZg7PLm04RC+5vm
         hBAGotcqTSe15nE/IDPXbEpEq+Mz9QSslhXRqAW5eTdC5HIADegUDmsbXEnmAsA35LtJ
         A5TYRUY99jB+qq9DwgnFkqE7KajD91W0r2AUOiDTm/2yssEtviz1ro44E/c0bC6P0fFW
         YjPFMmEHx5PCmfVdOlqvaubY063ts5HYhdadHF5bhLLlOFsbgQOZ3l69OAHnPaUqaaFk
         TKGw==
X-Forwarded-Encrypted: i=1; AKwUvBx8zY/rTx6xBK+EWojxTvDZRk6Y3czI41tsgDTuwE+Z0cwC/p3gplujrixmjxG13cBkthtLk1b9IApHIRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUjCKvsL57cMmsgTjcWWEhizM2/jjd4nGKUJmFiuJvBGMGmJ8k
	XuaoV5LDo7BnYcpeJmb/dpR5lTly2O40LAbUVnIgiMaF0yGamwrBqHJ27W2WEwst14PFsfLmuS6
	Xy3Ej5IYG4L3/h7MyPZQ/0d0fJEgmO4QXk/F+8X7vqOcQ9GIdOXKlat2MiHTPS6NW+cw=
X-Gm-Gg: AYBFou1o5uSbpcnG1h396hO+65n3q0Gi0RyL8P86pQpCeeD3WM/mksXoXG0nki79Z4K
	NmaoG6U9F0ufr95TtCmy9ePxn+kMCUu5AixvDWLaAddu5MIZYzZ3Zg9c14UrSqozXbujLGzETqq
	1gdrFtVa+7yg8z+bPb8XRctRXVYhwkk0JbCv2xqMh+IfimroNA/akcuY/e25gJTMpAXJkcYdx+P
	ThuPYHPpfbJnKqOVpy2gmBn6y6qSQG33qSl/66hnaFM3p8EaxVQwgN3sKA6/KUmcmWWtlvZGbuI
	+hpSF7Bx3vQALX0lRQIhtUL68pwa1uHXKZBCskKVoEyDMEtmw76jgrpxgrBfQsxp9nqqLilBVya
	xQbM0cZQBlifm5snN8PrQBuY3IT+tYMdQ3KLGpvVvT8aRPOn1vRoMNGe3JAE2Mw578Yzklw==
X-Received: by 2002:a05:6a20:258f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd8c44eb2amr2685975637.21.1789706435216;
        Thu, 17 Sep 2026 21:40:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd8c44eb2amr2685942637.21.1789706434812;
        Thu, 17 Sep 2026 21:40:34 -0700 (PDT)
Received: from ?IPV6:2406:b400:f14:c5fb:598d:4fca:aadc:2eb6? ([2406:b400:f14:c5fb:598d:4fca:aadc:2eb6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce065314sm1354633c88.14.2026.09.17.21.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 21:40:34 -0700 (PDT)
Message-ID: <3ddb920b-1d9f-4ec3-98a2-3477f845c145@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:10:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1OSBTYWx0ZWRfX/RV03gwjaQ8O
 mUroRH/BhSVS5m7yYNK1Uwgmmyb++n5zUwvpPHFl/GlxCNo+IZgLolYBQNOcG967KQPtV8LlgVx
 8Peu8cCEPVNm5ADUztt6gZ5YJl7TUNIsLh60D19n21+Fx9QwPispRYI6GgtByvVqWR2u8DUIYd+
 pCLk/nwAUJcQuRblr2TkGxJkpzrYHgdCHwF/o3GLGi1CvkMoGGLAZb2WYme8SaK1QFXiJlFTI3F
 /5yxfvuj//yw3VKm9cuL+2fKsajvG1SJ5E4EM0IeHIF7cuLqKNL3B0vYJLfUzXZvn9Z4zbvLoIE
 ZwJZFj7R1HUyw03sEYoAVZyrBWVoahVGG+qrYMOD4ii2BwFTw0pkqA1d+L1/8Cmcrslyl+VOIHd
 jceXnjwrmqdziJzKFTthZe3K5rr9qNtYMG3TtWIppsJSkpqGkLW1lp/Uj45P9OJP7llNhanlK/x
 C78ZiDBvaXRgQ/PUjug==
X-Proofpoint-GUID: 5HJssf_eXwIIUxojAUv7IakHSjupOAOC
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aacc0c4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Y4doX2lIe-IihnvZzhwA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1OSBTYWx0ZWRfXzfL0z1Jzkd0G
 6s+QYP/yGRhxaYSbZhcBL3q45YTD7MnBV1zD+ll+J8dxGQHgCMPV93CmNM0UZpOQr1MzNatRaO3
 qnpC8zSilJnMoQ7ZiuId9FMjhAljCF4=
X-Proofpoint-ORIG-GUID: 5HJssf_eXwIIUxojAUv7IakHSjupOAOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180059


On 9/17/2026 7:27 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
>
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
>
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
>
> Attach the DT vote clocks to runtime PM and resume the device before
> programming the rate generator registers, so register accesses happen
> only after the LPASS votes are active.
>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Validated on Hawi and Maili platforms for WCD-Headset playback.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad


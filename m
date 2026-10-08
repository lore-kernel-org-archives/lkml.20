Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB193BB131
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439021; cv=none; b=WPy7ti+sG2o4V03djPdrT/z1fSDwbUr50ZIgEDl+GkLz25rP9oyf9BafRetdXGQ930RuT2vuTi8UPy4uovMIyccwFriJs7EkBKolBlkHH/N35IapOY0c7+U3cdXaxkru+24aI1vs2R9XnKbEAGq8TgZQBCMGZIzCIIjbHiWFC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439021; c=relaxed/simple;
	bh=ceY6AYpjHs1ElPPIAmrcrxWtf7KZKURR1QziCbelGPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPoPv24BA7DehzwhqKAHf0zt1dLB3srJUgc2mf1s3FCvpHmqcFO4WO44k209JYoFDwBfP3Zg1DIRIPle/NaqhICO/ns5ya/m3quGwXd6qa2+vXPNmvD5pZypqe7jk6gmoQQizsTEsSj1uPbFihrpyZrsF/E3SamIHTWXa5j+Dhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOlsk5b+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDO7n1GM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOlsk5b+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDO7n1GM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BqB2928943
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 05:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=; b=NOlsk5b+qYWY9dte
	P5ZSXTdbOe975t+hPrnB4MthxaYR/6bW68yRNJLo0rfF9P5h0lqR512AigeOwJI/
	xOY5klJRK+CSyNB6s5sloWEXuYxCUQeuSZrDF756xdobjZrqDkCwe3WbL/YXmHBZ
	z+9/H2en8LP3Vs3iBP0nQ4bpqz57ttCLOanXMvobtCHvg9TTpN3aboaD6xy58d4p
	HY+D5NNibiHkZ9mLgoQRq25xirfrngjo90l8zox+AVx8nCXYPt3nS1N3kEWAO/4t
	Nf1/Trv9wt9ZdlkiRI/fVzDe/dudiNfPozCuMsOey7zw/AQKYeQlcKF89CkAGkWE
	4t+eGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sbnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:57:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46b4b700so829034685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439019; x=1792043819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=;
        b=XDO7n1GMISgsVB7rAEPRJoCAJWzFobaBEqtN75mb2MUVB38CUmrfRuQRcmL0HfvDMH
         kizjWRtfpPIQ2mziUdq3/Cevuf/UOLDUF1iYMjnlBrGVE+n+NbJZYJ4wYVfhHjK/XGzu
         t+wVWrVjcu5xbyGIMI+hCH8pxsx9e3FiyrAwjjy4q9k7jnH8MELXjPI6uvDLUPa+LVWu
         jISfKeS5C3VX6V88DN56d/BkIn1ybgJeSdCs8msUUaS0CPoAbuM9SUI8xNd+wGLV/usa
         A+odPfGKccxqXSrW0eBUrhOGdim9qXsTSV22I6lJmAxdKNyp2b2JYRur9kXTVjPW7Syv
         n8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439019; x=1792043819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=;
        b=O7F1nEWt0Fyrx5wZWR3j0TVNEkz9rm2c7Ra5Ok32ihY+KVT8gwkpgh8H3TsSkMZm4P
         lo1BdPPCZ41gHRWOWS7JafrW+MZ5kZbbq2IyOuAnVl+sDHdBUcHpkoSikH0PH8BXsQfS
         /lbEVuoSL3z/YVzAlNspKR5Y/bGY1MUy/sAh/RFCaP7c9jE5fuhXo1DTUrjry6ZqFPvc
         uCDTbYKGpWTiGoqgf1YkpB0HTI1Za4zFmDWC3YfNVJd7wsf+IFMGPcM+eXbHSX9q3ft6
         UzIO6SxF8tLzyV+qnxoEW55SgMMEtX3vDjGbRqgIhb8jdhq+f1LeLfWDhJVAilTxlZyQ
         LlBw==
X-Forwarded-Encrypted: i=1; AKwUvBwiR9mkGTLxfIy2LbJzOiSXuGJPUoX7Xp+BG/eudVJqPh4cnOBVp1WDzFO9vVKzJVslC5qt9KSJWZXB6XU=@vger.kernel.org
X-Gm-Message-State: AFuF++kuEos4jERQMZ+MaAjO8rLrMK76gA3LKzAq2QEmaOyFu3T6El0z
	ZeuoY7/Gyk5l6DeUp3aDKLjLH6rEGtUs9fKR54//20G9tpZMpRRWAK1xQ6mSZghC6EqPLIVZbgQ
	6+CH3RanuGxsoCdw+GhPG5rjIVOTP+Llsga7bYR5EBXOW7EY6mNDhuxUJvBjXtpCu5sI=
X-Gm-Gg: AYBFou3wDMUPuVdaUzF5rRN0jeLR2mnPBua2wQTMruppbE0xh1X8Tj3+S5OZVsDxJ3o
	sc6Z2US+xul8Pq89Zcn5y2CYz5o8gGD5GSSe7NBXm6WLqw8GHzwNoq6Kig8cy7yNos0sAoSXVbm
	5IRd/NeILW+UyORh3zBW3WVvRZKAgi+NgKt6O3OttQqK31m1BrfC+z/Mt3Pxm4XejHwRVe+OvRZ
	U8h0tJunN+NV0AXyGkvZO1PuFkN3m9cY8I7zSqY2PoFqxjpNGr7ZlIr8G7kGjJtYz4VttpivZUK
	KnhRakk7ZrJgWipYWt+S/j39XB8aw9yYri30jtNk6PukuWKRzvqdBQDkdqD0G3SayyTcQGS4gLs
	8qkotHd43y0l8AMFKVfedqElyPIFUkNaLWlxHR2w=
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916572285a.67.1791439019190;
        Wed, 07 Oct 2026 22:56:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916569985a.67.1791439018764;
        Wed, 07 Oct 2026 22:56:58 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71bd7983sm9461851f8f.6.2026.10.07.22.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:56:58 -0700 (PDT)
Message-ID: <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:56:55 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/74] media: qcom: camss: vfe: Add planes identifier to
 struct wm
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX2KiXXV1JdmH3
 ia0PKaACPhpV+nUBzukgEfOc3h2nKxNm7T74/fwZAlO+esG89SmbezFx1LjEsBk57yTW6m3+T1I
 4LTxXd/g4Gsdp8QxttQn66i/o2Pfhx4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfXy7hAyE5g8JXf
 iYn5SMgtYc0a3VhA7q4Q2M4uO2kVtTS6AikKBbrqqp0ZT3dtvwmImiRwmOHsO1Tn8qkAxhz6uc+
 t6RL7yMu7Q+ruywgCz7UJq+xLzQ6/492NXQWv8JB86ik266QaWG4UDQGuhg1NeBxslKXntzkWFQ
 6tsFKW23U+XCrRXN4Akx/tEbn23XHaCD4hAHhr7ubZKo3PZFaWeuEh0g9GY4985ruQl5A9clWRp
 0cZCSsNH7e4OgRLuNGtmcLMs2iwWkY/MZ2OPrmIhsowLF8varn2WRi68fZutneQBOl+B9dDnF2R
 Fcr3PlY85zqWPB2gbmpSAzki+7D/OGnFrxtTcpZ+YBKjpvoDgxjwAAR2f9pFAJRvSxLYZ1ff5E5
 G7tx7QQrfGGC0aatQov/7LmM4udrRNxH33WkjpNfSLGAfOCBFSskemoCT6NeBCM+sRgSMMMYkea
 M08mmpuGHsANIiBwvWQ==
X-Proofpoint-ORIG-GUID: L_KgHOMGQrrJnIcUy8ckhqMjAIs1MxPr
X-Proofpoint-GUID: L_KgHOMGQrrJnIcUy8ckhqMjAIs1MxPr
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac730ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=X4GJfOngNdAlU1NO0XIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Define the number of planes a given IFE write master will write as a
> data-field in the WM structure.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index bf8dccf4c901e..8bc07fe7798e1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -101,6 +101,7 @@ enum vfe_v3_comp_group {
>  
>  struct vfe_wm {
>  	u8 bus_client;
> +	u8 plane;

Can we change this to num_planes, plane is somehow not well descriptive for number of planes.

~Gjorgji

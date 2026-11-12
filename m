Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452546;
	b=3fyPS0g/YzswFASRmwA133tv0oEboM1XF+spgE3hJ4AR6K9ib/T3C/r8pfp2z4PKk6ML
	 9mhZjEUlCkYoKNRRA4U5OdT12TkHLZBtTz6dfw8//nsW86eLslgcINBs5yxY1mwmrazbw
	 JzRe5qDATs1cK6LtpZqU/wxSSrImKbvWnng9BANxvLkDz3miV+8+4VQL6/u6Um4yMoXcA
	 FIX+hgYIPRZCJ1LUMIBjecxWoXmp4UFSt0y/OaVRrpQ1pJPKbjjEie8XZrrWH90u/HCqy
	 65s9i0+qmsWjeVO7ONfgPaNEcxp1yCy4lI7eBqwxJFXdqiAPITmDjKD8FAKU+vgpHfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
	b=CTd0wjzAxMGoMSJBZL1dW7LdsyPxzT4231L8MkSBN4OUTZEdZGP9a7Yvg5F7hYzrO4qo
	 PQ7mevQALCizLwwCfkU2JeCfwJ9AdH2tAcbExuLjwzU7befO7Wfvi+ipVWS+hMNcLtKlC
	 gDZZswXh9PaLFtc0EXw+hJSCiCED6hpVLnyu2PY70kYTQVUeJLxllEhdkmdkR13OttP5T
	 8rYzsF272Q9swpGoWzaHOE7OPTJjtn1kC+IElrwmYQdlcBmsXmpeGn0aVaPLgHo6Dlcb3
	 NFCuyJmnGtAcALhuzYJdHZPnETkFqLLnbBrlGPq6vmO9WQg6ZdYhxKGdwhSj2O9Ll0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p2u9ssez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ND33GazY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E870606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E870606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p2u9ssez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ND33GazY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZXtj3061431
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=; b=p2u9ssezkjwxBO+Z
	aiJBc2ky2Mckvq5XcTchYc2/MHdO1bxeSt3uhFIxQuNhzj7O5ijPf2+nkxb+62dc
	wXyHdwp1QaPvLTflFmSurrS3vPN48/EV2OPtWR/gupkoe8GPZRS4UfqWUk4G//NT
	fJJLyBPNArdtf2Sty+R5PpthBlE9zhdeAxSOPRsilTK/o/I2cTLP1crBIJOw/KXq
	8U9DAhZy/BuomdZ06UGBTpvKG2FP20Ubl7wJdE7Q2SBo4w092IKZkgXZhH0UjlIR
	y/x1aAIZRfego7/q1AcICOqOdvVfy4haGUWl44sdSDEjQ49tL8ayR6lCzAZWrCyM
	0PtDbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m2yq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso93319585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794452544; x=1795057344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
        b=ND33GazYFxrZN+bHx3nQkTEHJHW6MVelBfTAe78leC/4juUJVPTd/Z40tYVL1gcGnz
         81a0hpc/ArfYWVCNeuoXhiXl8ni5g7KAaNbMunSZfXwi506OEkylZs4NC/XAvKZUo1tk
         D+744GyljGO+gB2/HKHsFLL8ueVylXe72e8BwGZRZEetxwSmX72gCQuKgf2gkM3IASnR
         xC0+O+kO7EIE06CF0cR3Rd57t7UBOpK7gk8BuRH518vadFYF3Tmapt/6gEZLSK3QZQaZ
         igaC/zKR099FiUnRbk4Tj9jCjK3n2iLkPefTFUljXSdObwFRQshlbqOJWdLIqpXCscH1
         OBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452544; x=1795057344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
        b=fLiSSFillei8kb1U1KKLv1fwcOggU0mzeBPWmIeb9NTyp8+dwZv0ZGNeuOLrcbUFq1
         oQyEhH/cV3HlIBTQv7KGMoY1e2MeInTtqFUJfeisMUObRX26mkjPTjJXj9rL2g3Ho2+C
         knYiLwwqIySvA2qHotplzDMZzOTUkNb9WAUDD12J5Ew/b09nqYw8p1EkaiR8ESsRpcm0
         QJp684XnMwMKXICsgzltCS9n4CoZ3uJOl2unR2NX40la3+lVzEdCdPsEDEXZulcjdsZy
         MWjhUDdcyzJYt7mlcrJwGcfFScKnwQjKE2h3GM4I8pkMhHB9Vmx0Bc+V0n89H93VHbNj
         KxKQ==
X-Forwarded-Encrypted: i=1; AL+hErFravr24kGAO0svmiyop/jeQvZZpet9xNuV4VsyBtmxKzbr0RAbOw+tB0DvZDETf/85vrkV0PU1I16qtFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MQYwLQgI81lTMrSQPBFddhweR7rqpNh55/BiSVEoVPaoWROMH
	9c+7+d5yNGmZRvxUsR9X/yYyL6DKEmF8xu3ky1pEY5XX0q1MU1SKk8X9v346wPGJXm1BkaHVRUK
	M1Z52igvx3FR9gqpQlKb1L2VAVTzgwnH78v0yp11ur1bHkNIgr2FC47OYrqTlWy5gWto=
X-Gm-Gg: AYBFou20LYNR7NqIfqzvlZeymw8wyE4HDju5QXWdhKp1p4Y6Moxm1ysJPV1Ee8ynvfU
	0lDoWrVH2SpIkz980RdtR2YX6stCJyhffGAXFPVUZUmAFss+oEtYc/L2uJR6/SAnqGttdQ4Zy/p
	9OsivtWYU9A18AYTH0NQziFV0cXOSdNjdtezPbgl8eWJtQPsHSSBupOz5QXYFkAUqTy+p88xB+Y
	T288dtwo+qpy/sYrhEGRePsgmLvTZaNs9zN+yENtDA4+R9+OtM2wHaHythr/bL+6R/vlOhTqmdh
	HDK8WRzt4jFE0p5NKB4b2KIX19nDSa+1XuUPAEJe0m2A/Vc+rpL9QaBkGSMumBXED/LiJaU170z
	+9z0uDtPCg6KblxX7KbD5POzfqqmqWLpQSJaR7et1xExrmsUEVq1FmHiadFFRYA9HC12g4ZF943
	3u+Y0RICi6U28tz04CBsASOOjRGvyNK8pT5xqcLxI=
X-Received: by 2002:a05:620a:4142:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-94932e1d17amr282170685a.31.1794452543834;
        Wed, 11 Nov 2026 19:02:23 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-94932e1d17amr282164085a.31.1794452543269;
        Wed, 11 Nov 2026 19:02:23 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm626765785a.36.2026.11.11.19.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 19:02:22 -0800 (PST)
Message-ID: <ae255a03-deba-48c0-a290-7cb0e50b10fd@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:02:12 +0800
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
Subject: Re: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-industrious-impetuous-slug-a8e4ce@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261109-industrious-impetuous-slug-a8e4ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bZt1m5Hlu_VhMzAt3gUrj1wfnxEUknS3
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af52c40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Exsngp9zyEbSqwYxnZQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bZt1m5Hlu_VhMzAt3gUrj1wfnxEUknS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX0ZEaVIrOzOHc
 5sNqFbVrMJZOETzbhRryPJwBmrIwuwFMBl7E0LXWpb/QtVUQJRlJalv19VV+G4foQoj40O4rrCF
 rwhjzTafm5osOHqJmEiWHOwQhIrsst19j+lGwxo9DAU0CAYKjGxpPH14K39s/aKpbFyj82ZJUgD
 HBBraDfKHysxnYzlU3w2FSYCTdeUap4hdhst2IshoIvaeRo8JZqTD+T6jjSz+9CYg/C/xcUarn4
 9fjnEmt5k9i/NrtQnzy8c59OVYQiiRY+Rv21a9483WR3Y/Fo6iN04dzRd3sKzVFKXyvYGxai8x9
 V/8qSg8fENESpQCaf9BlSPwLGZAmuK8J2DzMwHdBTTVUTUR4yhnZFA3maerVWtvbSQyFH8tjoyn
 MfNwH0JBxnypgbnjYim8ZBK2t5YyraZgYDv5oerob+r1AHkNsLh1mu2S096p9xQp8rSNRgLJjQL
 2gJk0Z58Bd3RQgkfUgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX/6e626j+Wgd3
 sYk4Z1SrXsyLP931jGYLYVxWfAjCtvlEZyidKQ7+RVy1EKV6hU5ruxqT9GyDQzj5Iu56VZaGRmR
 LXH2KHH49MIfuRqxg7vj5rGSgCG2Mxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120010



On 11/9/2026 8:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 04:36:36PM +0800, Yongxing Mou wrote:
>> Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
>> power-domain core only auto-attaches a single domain; with multiple
>> domains the device is left unattached, so both domains must be attached
>> explicitly.
>>
>> The DPU OPP table also needs to continue controlling the MMCX
>> performance state. Mark CORE as the required OPP domain so its vote is
>> propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
>> own and is attached as a regular runtime-PM supplier.
>>
>> Platforms with a single power domain remain unaffected and continue to
>> use the existing automatic attachment.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Joonhoe Kim <26rote@gmail.com>
> 
> Where? No tests were at v3 and v4.
> 
Thanks and sorry for this, will drop it.
> Best regards,
> Krzysztof
> 


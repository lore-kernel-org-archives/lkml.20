Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100446;
	b=Jbkk8c2oBYuERbyHoh+9hqbGe6uimG6cRrQ645cQufiOswVVMrzY1cusyBAfliuVyuDu
	 +Y+KRSVkh7fgcF0Y7gTPyXdSzRGTe64+9Dl7P8jFXC8Jc3QKW0tRD43WtstlnEfNhUCj0
	 h7szrDq3KnS29AP4D2Gvy3PrA0QwEzb8i+g240YpcbeSVcN2j5Dp1du+1uRPfUeA/PTOG
	 E+1WeGRELgKF4Rw/U7ECRvAzAXtMP9n8/KbBWHy0NwYn2qC9OuZt44MZOaTGf3taItINB
	 BkVfTH8+GEqlGKwbM7em5sHwjRrnYW82mGn/byw5wzgJlPIW1manuRo5LqW+BFxK9dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
	b=uL/3l9mjANuB2y99z3qxceeZ/iOYXY3Z3zjaV4vMALKlzPHMqfhNVLtpBhIQIlfhbo5n
	 eDPhkoDeQR/kq2qROKKPv5CGiJM/VSTzx2Bm8XJLaP4Gn7nfvNxD+yBgtTANsbAJ7pMWz
	 B6LF063sEtGjI1wXCGERQSmnAKWnNN/duNZ0raZv8RyBfE//iDoznOFw3PuZMJOJzZWwv
	 Qs0yjAhwzbvgFyfAqgkmbw+umDc9H3NJzpNLOCfZ3klDWnd77g48dNCRUJwGKQ3Kka8h7
	 PWgMti6dnec0LZP9boWNkEdYudyiP07D2KjqaDh4bKTVP/6lCxE+J+khTer7Ot8yTPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQUiwcNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsi00V0i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQUiwcNl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsi00V0i
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe35S2458384
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=; b=HQUiwcNlg3brz6ri
	CV15WQafTLx7qjzv19G0UAoz/qk2r/MrDavXXCnMxcAaO6l9GH68gIhEPU8Ariy4
	Kfm0SlIfx7UmWB0O1wT6NKRj6qeS6tjn7jplPrNtWU1sLINM0qZSuJD1SuUhcD+n
	qNSiiMEUqB7cwNBlIm9dV0tcS+aLWuyY/FCCH1gbwHL8L1HNhXT8YNSjRzFBMsdt
	Ve/QXtL7pEHxwP24JQnSi46obVFXcJV40d8N396wQakDynE1mlpe2gn9uIbsyy6w
	gqHlsNBvBdTNZaILenXEc3tkoDvmdCisPh+wboCxl44jWxWPLDIdr9gZ0etZZR5y
	H3YCfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta114-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:27:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so120055585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100444; x=1793705244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
        b=Tsi00V0inv16cHYyKsAxpXLniTD6HzgR3hWjUxk2/qPQXdln1BFzsygGArWN9DfM6x
         +3yI0sau2mlWbkhSLgcHmK2t8gHaqldcCe4kBHZGpZ23BondUZ/Kdz1L3CW9ZNKMTLVe
         YTmRXeiocUVFYKIDYdLbl9CNslnoeOsYGdXoPbAcEz/9Anoym8yrtD4eGz94yNguPb3P
         7l7gVwTCcy3D1YXTnlSnDkhTn/5lh3d/xnVVbOhp7SYEWAO5vcSbUd+tZWlvyO2GM+NK
         WmbXNJ8Q37b7+5bjbHZaUUkIvMOomoNetUTGALnIBMWtyNTfSiEG+FCYhfWrNqf32hLo
         XqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100444; x=1793705244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
        b=qE+3V38rCrFUqAidcrMILrVqiT+8e4SFfwoBvfJdYFLNAWpxYE4VNrvpbygVVFq3Lb
         /9UBviiAdTgjK8sAyVRchkvA+2ggsW2MXPkjw1YpdOTKz/gNcwEd6HzBYbc003z/Id3m
         rJIBcp8bWk22ZA6VBDyjfyL7FvfMCWImd9zY9BX1cekzyBcBy2HG6MWlQfFhq0quDP9Q
         7+fPmM2wgkRln3xmo2c16aFmDzG54mUaTKv5AAH4qDBgQJaj3M3BIOoXcAtkEk2boR+Q
         GN1tHMezpFctIhYYBd4syXm6JIlyEcgI0nP2WiLMv3YC+s7uUOMdwTKpYFjB+gKqdGpK
         M20Q==
X-Forwarded-Encrypted: i=1; AKwUvBzw83B4q0UEgMdTeP3WyneKVdqGS5u6oxtptnW3P0gt/O2Qol/CdulLAfi/4iwv9MUlbTUZeo3SczWrp6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2ePqB91B3zfwfiyScn2pfqPbQBWxT63t8d5gIgYW/SYRGqWQL
	JhpfFtxnXHjCircbsQloMjPXC4/7GTCsUb0p36A2pHyU7g2MXvQ0/Mx0ZBpn18mX3CpD5hS9sfI
	zaVUCMLiQT1Ost3TMqC7jVj8kUYVE32IqwjofcX3WsaeoroZpwGZu45VNHSQLMjIVAYR51UtgwW
	A=
X-Gm-Gg: AYBFou1Ff+dcInPMjFU1PNtZlShDJwgAGm6iPar7WSmoFErDiiOrOaqymD9l/xo+Pte
	0XlcsjLnosQhetei8vRkUDBkfQePbmMDpXLHC+mNS8FBOqfCmyXU9NRSlOG0EsQC8QHHkOge10n
	yXx2C+UVkj4L9ZpDr+cdDpHWyXk8unFjSVzXPjlc6sP9eN2imQtsnq0fllZMJzSNqPny0CLHE0x
	ie6AeXSduIjY5VL89o3vwzH0kqyG33kZkC8+943dP9GXKm8MlWtvrIECSPy32eMRoej2sYV5RiL
	YZjUzxZSSwGkaSXdVgW8eafl30gpTCxPxVgph+RqIpbA1kqKIKRF+cY4NCCysvRLOrKsdrzhTtQ
	ajWr8WnjUJSjna49JSCcZtg==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1762508685a.6.1793100444295;
        Tue, 27 Oct 2026 04:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1762502685a.6.1793100443839;
        Tue, 27 Oct 2026 04:27:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm4946374a12.16.2026.10.27.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:27:22 -0700 (PDT)
Message-ID: <7ce4f890-8850-4217-89e8-cbda80b2a5f6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:27:19 +0100
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
Subject: Re: [PATCH v4 5/5] drm/msm/a6xx: Protect the 0x1c800-0x1e7ff GMU
 range on A620 and A650
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzNzlkSYrFuzD
 JOC9FKr9izxMyuNh//lofQWGEuv7+wJRMe9y5hXcvNZzon7XE2nqdh5duCM0SfyZITaFJX7w2sG
 +wxEdlxt7L0LMmUwwDtC5xyivrU5Qkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX1GwD6fcx63Ii
 S9ZRmc1UuXHYoTlYGm4N4EbB5CDjidmiRqtK86B5ss5RcVdtHdknq+JGFK0uSQvyf2HW2RjwYvF
 5MzAvvhMcjBkk+HhSW23H9FBD4tLbThGslwNbM4eDMfGSznu7Uu+kR3a+MBjCagn/9ZydN0BYfh
 zOBR9Zv2ncfZP/9lwLUNBOkyGNbbpxGM44vOdJ3lk1uPGoOLatn3lh6rG6rEWSr27mSaFoDN81z
 OMrqLqdfHj0NRNlNF1TE1m+0H4M3sFt2qy4Iyq2Or/JksWDg6JLYn7Om9LRlJyplCs+v1/LjsDp
 W4SbHL9/T4JHyi4d5sjBJt+QA+tqFiUa9GYv9n2Vji0ejdurAfVjkmPvL80tBLfuvvpXt61MGq7
 bLM85GWpWrpYj3l56zUcNbxHhNW1M5R1bbKB5dqNGyhGqbanaKYBgJQoHpqR+4zbu7xVQZ72NnB
 gkZ2E7a9fscg6ggM+WQ==
X-Proofpoint-ORIG-GUID: zamkoocyN1PGmjRSBO14zqhkwweovgmO
X-Proofpoint-GUID: zamkoocyN1PGmjRSBO14zqhkwweovgmO
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08a9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=Tm8wa4UmF2Ix6aBE:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-zc-H5WaXjtm9W6SF9YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> No protect entry covers the range from 0x1c800 to 0x1e7ff: the entry
> at 0x1a800 ends at 0x1c7ff and the next one starts at 0x1f400. The range
> holds GMU registers, among them GMU_NMI_CONTROL_STATUS (0x1cbf0),
> GMU_BOOT_SLUMBER_OPTION (0x1cbf8), the GX and MX vote indexes (0x1cbf9,
> 0x1cbfa), the DCVS option, setting and return registers (0x1cbfc to
> 0x1cbff) and GMU_CORE_FW_VERSION (0x1d3f8), see a6xx_gmu.xml.
> 
> Add the range as no read/write to the A650 protect list, which A620 and
> A650 share, so that these registers are reserved as well. This follows
> Konrad Dybcio's suggestion; the downstream kgsl protect table of the
> OnePlus Nord (a620_protected_regs) has no entry for this range, so there
> is no downstream reference for it.
> 
> The list is also used by A621, A623, A702 and A704, which I could not
> test. Tested on A620 only (OnePlus Nord, a 7.3 based tree): a Vulkan
> workload ran across GPU frequency changes without protect, fault or GMU
> errors. A write into the range being rejected was not tested.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

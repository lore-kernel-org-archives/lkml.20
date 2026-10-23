Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749715;
	b=SrUJ/b9htEivC42KrDxy07DiTEHCgg2fj8paM70VXpXNXkRWlTP3PJeW1xHu+cp0rOYr
	 BZG2rszHjquSE043EKk+drdiKRu8mnvPve1XAVWDPKUCcyMDjj6a08dWB7bXSL0U3QRPl
	 3v+639H5t8TwkHrLpwq/FPlymIZUX26OKA4GgyG8B0XyCY3WVufoLk3WiLLx2aZ7TKNyv
	 rajERQHjdcsN27UaovpaJgjvrEb1D6+nZl00deYDhP6TBIrc/fyWOpxU2nfFy6IVCFq91
	 fbQDxdGRJKPfoMNsnGeh3ETuyG9ZnoQGh5hPF1djEzaOEBnBAabVUsE4eo8SAK34UCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P3vkGi9yXh1Hfl4jyyTeq/iWmAsjHdgA8DwWS7cx5pw=;
	b=S3gfKhAgJnC1DZtsn9fRn1Ez6rD4SbdCxb3E/+2jH1whu9SdZOogRsMSsy50QlhLDXgT
	 PjyokAi12yp8uKHILiczkl3Kn47he/cSUWFHGZMgct454l5vaznKVQHx28pDUOhawS891
	 zuKeGjFVEy/PJrBkKAXXg+rykdxVnUFhHAxDP+TCb/yeQLNZS+4Klh/D8DjfWNsZbNGse
	 KZUjq3i9Xlon79nVXQw1DVabhsUUpsEigncv8oVWYYLYtsLxZj5/ndWkLYeWSaTt1c9l2
	 EzMjEkntNB7vnSOA/SVeYOF3Hn04LlWBj3xyIlTifWvmnLNs418viyVIpFmUQ6sAuzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igw7C6kq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNHqmiiV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4A2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igw7C6kq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNHqmiiV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FWPm588310
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P3vkGi9yXh1Hfl4jyyTeq/iWmAsjHdgA8DwWS7cx5pw=; b=Igw7C6kqP0xyItZm
	Etw1IZcD9bspaQAgs5mNzvbWksWxoUXirU5ckGiAbJyL06M3wUp3nWO0H2nGNmdK
	MqoTiMW9o//JWohy34gDd3RKG0pe1DVED+SObNrJqfJEHb2P4FyvJRnICftRIy1B
	zLobDQOUljfcbiP26emQF55ZLkhR80LxqRnUHHriCMZ8Eo2QHduyttXKst4Ol4u+
	wIxig2g3a1AoobXnuaAnC02Rz2bsV1ynYWZ3bNLj/wzeySdCPESnYNu+TcDOHr+k
	MiX5BJ7pcExnDBASmo8wZ12tR5nAUkUGCcNSz0wvHtbgz7DcXRtUiRX2cxn/o8Vm
	IN255Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatk57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:01:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so1204373a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749713; x=1793354513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3vkGi9yXh1Hfl4jyyTeq/iWmAsjHdgA8DwWS7cx5pw=;
        b=NNHqmiiVmf3wgjtSHKKeXeuFHJpTx6rhiFVmxYaxf9tj/Qi5sRC9J7SQBflAuh0T0k
         yrRmAQy7PnIxmNZszfaCAECMGedSTbXo4aeZ5jWdrsInODWHPCd0YR6oqVP7iK7P6hhR
         ArylA2jqnCSOcGFIWuoCYAf+M7QlWKJAbftRHRXUweIvzEzq4ItO5732bULCE4bLr9Er
         9NWKJaX8p0AdPlsbzxuFaJVr9bDs22Ls8zld+syeA1gFbtDNIK5IKpmyXkua8e1Aoidv
         dFzKYSBhk125sxn1DubJjcSiEFhZEnZ4fLiWi6wvtRNTQjGfDqSwBkBSvR7eW2rvnd8M
         IBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749713; x=1793354513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3vkGi9yXh1Hfl4jyyTeq/iWmAsjHdgA8DwWS7cx5pw=;
        b=xOZDQR8/1/yD9fTxnSMSksz4dRfYso3dyoopWrj0vaUyBL7FQaWvWNs5bJrmfd29a4
         yTlKoC3fDPHFEJMyY114+iMYqTkCc/+uO60bNc+1R8gzJbQxDKKsaggCHiD5ib3QCkpF
         HWcvaEf2TW/6VWsL/ENhn7d2keVDdEpZmXyaY7CQeeEgBabcSXII74UPLBqeeIL3IaOf
         +wtFWxlUYHqaWrUpGZhfxIZcIkFDmgpcbo9UfmiTFnotA00GY1qZ1XozaxBRvHoxpT4X
         ZwtgqIJPZ5Wk9D1KhJvgYv+262Wkfi5HwPykK+uTsjqO7hptuXgR4sSBc05s14Ez1Jtk
         abQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvtBKETj3Woc5TAisqmH8hRoo/Q4rK1qBw9AJb11Y393p1uZz43uvPm07dxg+0SgwuCP3HiD+thtRVwvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs5FgmjyQAHRmMqcmKg9qDtZWZpFHLcHJYQhL5CFaAI76qd6sf
	2zMtP59QWtkuHJD4kudxwE3rQVWWaZR9BQLmpivacxpDV/y/vO04qSKpaRBTgrsLOiXr3LfddI2
	FRP8/bgnDY7p5cpKhkjKiBQAauSh66lDkJkdySl7oOlYCH/iEsOmdTflVeAKxxMHNOz4=
X-Gm-Gg: AYBFou05COBjj0GhMSgZ+tyl657JR3pzY1ArwkVsSGGfNXmn8rEK4S4dK0RjJO2kUrY
	ZqEBMiZOTSV2eKGzkcQkm3bTgPVlTlSsxpr8nyYf1f9X4KOzy6O0FAfD8Li+Kd1P2fNVacp1Rhm
	J2oCyAehg2g/591XyYN2sV3cyQYOAZC/pZBbl7HWjXzJBbOvTCrpPMGUWkk4UqfmQVcgdOIvopM
	P6pYMR6QEjtNDOIwnMNjFxompdxqyQjksvTBMrpFzH7orDBkT4//5B0ciEFT9po6uYmBsOryPuq
	oH7yPX4jSe5RYDl51PdbvKVOiqs8ytX7c4x+IZ8sqiIsElpoyJeKrahTjVNeZSTL5ZhCxI05wCX
	UZnzKnxmd8Pho8O3gVo31s0urdeQ6MQ==
X-Received: by 2002:a17:90b:5906:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3adce0073a2mr1437333a91.29.1792749712959;
        Fri, 23 Oct 2026 03:01:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5906:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3adce0073a2mr1437283a91.29.1792749712338;
        Fri, 23 Oct 2026 03:01:52 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed70dsm8098149a91.4.2026.10.23.03.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:01:51 -0700 (PDT)
Message-ID: <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:31:42 +0530
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb3091 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gzkphQoz22865OLWFksA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXydZ6vHKmamkW
 seeC7k7LyrQAGT3WHwgyY7cyRB1Gvh/w3HdmW7hJQF0TKIKXjMuH3wc68tt6dLt88oEFNGd6En1
 nPI2ndXwkN8h12LXTc3MRtRWF3rr6Gs=
X-Proofpoint-GUID: 3bkzYFlBwA7-kXkcJ6DfrnsMXDTF7M0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX7k57+IrkqRpF
 sIY4kEaN7gVm80mYplMWk2nE2neu20gyy1ZBRswoTktRsbgaFJ4xKhtdmCjmkCYqT+hLVeEtsb4
 SXjc0fIJu+GenbmDVxTC3TkWHqZ7Mz2pfhOnd4Sdqx58HSQ32P5fYKF9pNf9uq+ajeV/eIIsYXs
 8Kb7Nfo1/X38vJxwD/dbxLf3Hb5vsLV5Adg+zMhIopFrLIx0jXucTO//pm1QTmYocjeYaBT3rXq
 yBB0Sp/H87+4boie64fHUsPN+cjTuXe3QiBHycl7gW0XCrOrUPUnlYUaoHs4fZUQIv7R7sad+Sx
 48peagQacwsfBTxWY9RWM85euPeb/W8EyWQxSW3Dc6Bmw9t1oRxmKmCfOR2L16yw3QOmYxIxlhC
 L/e53UJASAlDR+Yob5MW23JZg5eytH7f+YsuayEgDi6xWveMQGPOVqO80sTTHSjnWFlJjnwIjj6
 ttXNzEq9+PA/KeBpZYA==
X-Proofpoint-ORIG-GUID: 3bkzYFlBwA7-kXkcJ6DfrnsMXDTF7M0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039



On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>> trip points by hardware version; wire tsens up to feed it.
> 
> [...]
> 
>> +	/* Hardware-bin values for thermal-hw-bin matching in DT. */
>> +	const u32 hw_bin_std = 0x1;
>> +	const u32 hw_bin_elevated = 0x2;
>> +
>> +	/* Higher thermal profile identification for qcm6490/sc7280 bins. */
>> +	const u32 tsens_chip_id0 = 0x197;
>> +	const u32 tsens_chip_id1 = 0x198;
>> +	const u32 tsens_chip_id2 = 0x20e;
>> +	const u32 tsens_chip_id3 = 0x20f;
>> +	const u8 tsens_feat_id2 = 0x2;
>> +	const u8 tsens_feat_id3 = 0x3;
>> +	const u8 tsens_feat_id4 = 0x4;
> 
> Isn't that (also) exposed over SMEM?

Thanks Konrad, for review.

SMEM has related socinfo data, but there is no exported helper for the
exact fields needed here, such as feat-id, which is also used as the bin
value.

This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
thermal-bin mapping needs both values. Other/future targets are expected
to use only the generic i-temp fuse bit, like Hamoa.

> 
> Konrad
> 
>> +
>> +	if (nfuse < 2)
>> +		return -EINVAL;
>> +
>> +	tsens_jtag = fuse[0] & GENMASK(19, 0);
>> +	tsens_feat_id = fuse[1] & GENMASK(7, 0);
>> +
>> +	elevate_trip =
>> +		(tsens_jtag == tsens_chip_id0 && tsens_feat_id == tsens_feat_id3) ||
>> +		(tsens_jtag == tsens_chip_id1 && tsens_feat_id == tsens_feat_id4) ||
>> +		(tsens_jtag == tsens_chip_id2 && tsens_feat_id == tsens_feat_id3) ||
>> +		(tsens_jtag == tsens_chip_id3 && tsens_feat_id == tsens_feat_id2);
>> +
>> +	hw[0] = elevate_trip ? hw_bin_elevated : hw_bin_std;
>> +	*count = 1;
>> +
>> +	dev_dbg(dev,
>> +		"qcm6490 hw-bin from jtag-id=0x%x feat-id=0x%x => 0x%x\n",
>> +		tsens_jtag, tsens_feat_id, hw[0]);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tsens_compute_hw_version_i_temp(struct device *dev,
>> +					   const u32 *fuse, unsigned int nfuse,
>> +					   u32 *hw, unsigned int *count)
>> +{
>> +	if (nfuse < 1)
>> +		return -EINVAL;
>> +
>> +	/* Single bit: set bit 1 for high-temp bin, bit 0 for standard bin */
>> +	hw[0]  = (fuse[0] & BIT(0)) ? 0x2u : 0x1u;
>> +	*count = 1;
>> +
>> +	dev_dbg(dev, "i-temp hw-bin from i-temp=0x%x => 0x%x\n",
>> +		fuse[0], hw[0]);
>> +
>> +	return 0;
>> +}
>> +
>> +static const char * const tsens_cells_qcm6490[] = { "jtag-id", "feat-id" };
>> +static const char * const tsens_cells_i_temp[]  = { "i-temp" };
>> +
>> +const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490 = {
>> +	.cell_names         = tsens_cells_qcm6490,
>> +	.ncells             = ARRAY_SIZE(tsens_cells_qcm6490),
>> +	.compute_hw_version = tsens_compute_hw_version_qcm6490,
>> +};
>> +
>> +const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp = {
>> +	.cell_names         = tsens_cells_i_temp,
>> +	.ncells             = ARRAY_SIZE(tsens_cells_i_temp),
>> +	.compute_hw_version = tsens_compute_hw_version_i_temp,
>> +};
>> +
>> +/**
>> + * tsens_populate_hw_bin_info - read fuse cells and populate priv->hw_bin_info
>> + * @priv: tsens private data
>> + * @data: platform data containing the optional hw_bin_desc pointer
>> + *
>> + * If data->hw_bin_desc is NULL, this is a no-op and returns 0.  Otherwise,
>> + * reads the nvmem cells named in hw_bin_desc->cell_names, calls the
>> + * compute_hw_version() callback, and stores the result in priv->hw_bin_info
>> + * for later use by tsens_register().
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +static int tsens_populate_hw_bin_info(struct tsens_priv *priv,
>> +				      const struct tsens_plat_data *data)
>> +{
>> +	const struct tsens_hw_bin_desc *desc;
>> +	u32 fuse_vals[TSENS_HW_BIN_MAX_CELLS];
>> +	u32 hw_versions[THERMAL_HW_BIN_MAX_LEVELS] = { 0 };
>> +	unsigned int hw_count = 0;
>> +	int i, ret;
>> +
>> +	if (!data->hw_bin_desc)
>> +		return 0;
>> +
>> +	desc = data->hw_bin_desc;
>> +
>> +	if (!desc->ncells || desc->ncells > TSENS_HW_BIN_MAX_CELLS) {
>> +		dev_err(priv->dev, "hw_bin_desc ncells %u out of range\n",
>> +			desc->ncells);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < (int)desc->ncells; i++) {
>> +		ret = nvmem_cell_read_variable_le_u32(priv->dev,
>> +						      desc->cell_names[i],
>> +						      &fuse_vals[i]);
>> +		if (ret < 0) {
>> +			dev_err(priv->dev,
>> +				"failed to read nvmem cell '%s': %d\n",
>> +				desc->cell_names[i], ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = desc->compute_hw_version(priv->dev, fuse_vals, desc->ncells,
>> +				       hw_versions, &hw_count);
>> +	if (ret) {
>> +		dev_err(priv->dev, "compute_hw_version failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!hw_count || hw_count > THERMAL_HW_BIN_MAX_LEVELS) {
>> +		dev_err(priv->dev,
>> +			"compute_hw_version returned invalid hw_count %u\n",
>> +			hw_count);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * Store a copy of the hw-version array in priv->hw_bin_info.  We can't
>> +	 * call thermal_zone_set_supported_hw_bin() here because the thermal zones
>> +	 * haven't been registered yet; tsens_register() will pass &priv->hw_bin_info
>> +	 * directly to devm_thermal_of_zone_register_with_bin() instead.
>> +	 *
>> +	 * Use devm_kmemdup so the copy is freed when the device is unbound.
>> +	 */
>> +	priv->hw_bin_info.supported_hw_bin = devm_kmemdup(priv->dev, hw_versions,
>> +							  hw_count * sizeof(u32),
>> +							  GFP_KERNEL);
>> +	if (!priv->hw_bin_info.supported_hw_bin)
>> +		return -ENOMEM;
>> +
>> +	priv->hw_bin_info.supported_hw_bin_count = hw_count;
>> +
>> +	return 0;
>> +}
>> +
>>   int tsens_read_calibration(struct tsens_priv *priv, int shift, u32 *p1, u32 *p2, bool backup)
>>   {
>>   	u32 mode;
>> @@ -1206,6 +1368,12 @@ static const struct of_device_id tsens_table[] = {
>>   	}, {
>>   		.compatible = "qcom,msm8996-tsens",
>>   		.data = &data_8996,
>> +	}, {
>> +		.compatible = "qcom,qcm6490-tsens",
>> +		.data = &data_sc7280,
>> +	}, {
>> +		.compatible = "qcom,sc7280-tsens",
>> +		.data = &data_sc7280,
>>   	}, {
>>   		.compatible = "qcom,tsens-v1",
>>   		.data = &data_tsens_v1,
>> @@ -1218,6 +1386,9 @@ static const struct of_device_id tsens_table[] = {
>>   	}, {
>>   		.compatible = "qcom,sa8255p-tsens",
>>   		.data = &data_automotive_v2,
>> +	}, {
>> +		.compatible = "qcom,x1e80100-tsens",
>> +		.data = &data_x1e80100,
>>   	},
>>   	{}
>>   };
>> @@ -1327,12 +1498,18 @@ static int tsens_register(struct tsens_priv *priv)
>>   {
>>   	int i, ret;
>>   	struct thermal_zone_device *tzd;
>> +	const struct thermal_hw_bin_info *bin_info;
>> +
>> +	bin_info = priv->hw_bin_info.supported_hw_bin_count ?
>> +		   &priv->hw_bin_info : NULL;
>>   
>>   	for (i = 0;  i < priv->num_sensors; i++) {
>>   		priv->sensor[i].priv = priv;
>> -		tzd = devm_thermal_of_zone_register(priv->dev, priv->sensor[i].hw_id,
>> -						    &priv->sensor[i],
>> -						    &tsens_of_ops);
>> +		tzd = devm_thermal_of_zone_register_with_bin(priv->dev,
>> +							     priv->sensor[i].hw_id,
>> +							     &priv->sensor[i],
>> +							     &tsens_of_ops,
>> +							     bin_info);
>>   		if (IS_ERR(tzd))
>>   			continue;
>>   		priv->sensor[i].tzd = tzd;
>> @@ -1425,6 +1602,12 @@ static int tsens_probe(struct platform_device *pdev)
>>   	priv->feat = data->feat;
>>   	priv->fields = data->fields;
>>   
>> +	ret = tsens_populate_hw_bin_info(priv, data);
>> +	if (ret)
>> +		dev_warn(&pdev->dev,
>> +			 "thermal-bin failed to read FUSE data (%d): trips with temperature-bin will use first entry\n",
>> +			 ret);
>> +
>>   	platform_set_drvdata(pdev, priv);
>>   
>>   	device_init_wakeup(dev, !data->no_irq_wake);
>> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
>> index e8376accdff3..496ae6572bb8 100644
>> --- a/drivers/thermal/qcom/tsens.h
>> +++ b/drivers/thermal/qcom/tsens.h
>> @@ -40,6 +40,29 @@ enum tsens_ver {
>>   	VER_2_X_NO_RPM,
>>   };
>>   
>> +/**
>> + * struct tsens_hw_bin_desc - per-SoC descriptor for hardware-bin fuse reading
>> + * @cell_names: NULL-terminated array of nvmem cell names to read
>> + * @ncells:     number of entries in @cell_names
>> + * @compute_hw_version: callback that converts raw fuse values to hw-version
>> + *                      bitfields suitable for thermal_zone_set_supported_hw_bin()
>> + *
>> + * Embed a pointer to this struct in tsens_plat_data.hw_bin_desc to enable
>> + * hardware-bin trip filtering for a given SoC.  Set to NULL to disable.
>> + */
>> +struct tsens_hw_bin_desc {
>> +	const char * const	*cell_names;
>> +	unsigned int		 ncells;
>> +	int (*compute_hw_version)(struct device *dev,
>> +				  const u32 *fuse, unsigned int nfuse,
>> +				  u32 *hw, unsigned int *count);
>> +};
>> +
>> +#define TSENS_HW_BIN_MAX_CELLS	8
>> +
>> +extern const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490;
>> +extern const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp;
>> +
>>   enum tsens_irq_type {
>>   	LOWER,
>>   	UPPER,
>> @@ -533,6 +556,7 @@ struct tsens_features {
>>    * @feat: features of the IP
>>    * @fields: bitfield locations
>>    * @no_irq_wake: if set, TSENS interrupts will not be configured as wakeup sources
>> + * @hw_bin_desc: optional hardware-bin fuse descriptor for trip filtering
>>    */
>>   struct tsens_plat_data {
>>   	const u32		num_sensors;
>> @@ -541,6 +565,7 @@ struct tsens_plat_data {
>>   	struct tsens_features	*feat;
>>   	const struct reg_field		*fields;
>>   	bool		no_irq_wake;
>> +	const struct tsens_hw_bin_desc	*hw_bin_desc;
>>   };
>>   
>>   /**
>> @@ -568,6 +593,7 @@ struct tsens_context {
>>    * @feat: features of the IP
>>    * @fields: bitfield locations
>>    * @ops: pointer to list of callbacks supported by this device
>> + * @hw_bin_info: hardware binning info read from SoC fuse (populated at probe)
>>    * @debug_root: pointer to debugfs dentry for all tsens
>>    * @debug: pointer to debugfs dentry for tsens controller
>>    * @uplow_irq: IRQ number for uplow (upper/lower) threshold interrupts
>> @@ -591,6 +617,8 @@ struct tsens_priv {
>>   	const struct reg_field		*fields;
>>   	const struct tsens_ops		*ops;
>>   
>> +	struct thermal_hw_bin_info		 hw_bin_info;
>> +
>>   	struct dentry			*debug_root;
>>   	struct dentry			*debug;
>>   
>> @@ -677,6 +705,7 @@ extern const struct tsens_plat_data data_ipq5018;
>>   /* TSENS v2 targets */
>>   extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
>>   extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
>> +extern const struct tsens_plat_data data_x1e80100, data_sc7280;
>>   
>>   /* TSENS automotive targets */
>>   extern struct tsens_plat_data data_automotive_v2;
>>


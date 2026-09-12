Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC5E393DC7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246265; cv=none; b=qgFhxzEPMzP/cQ3ZEOfo8R5v254riIMeCnC1R7YsP8Sld7AsP1kL1YgVm+86kfaa97qp3vd7NwmZwZwHdMBvtdSh6yxGQpFNsLx01R/4RZyr/lBFY0i+wInUwQiAF2pGa/LLGrMQXMJZQmoT8AUzuJZX/sYglQAMpqb2zuVARqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246265; c=relaxed/simple;
	bh=kttfSOKg/yQanFRXG3yh7u3S71n/ayBAbVoEgimZi1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ+AlJv6hQj7wKqHzKUEO4GJ8aDyIdXpqD36mEc+0qryTVO2eReW/z9SIxFMC7hWhWM9xl74SfR2BZO+aTV8TaHLRg8ZwHqozVctOPefSxVAsTSFhtNbVPLbGSkmHQBY8l/v8qUrOVl6zp2lh1gZNnFTRgzJinwNoy7oDg4/9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ay+SGGoT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHfo5IVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ay+SGGoT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHfo5IVD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI4lEC3728550
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KmMs3gRal1z49mHzxWm4Gkbi
	6oU8/Tm+5YR7zF+GVoc=; b=Ay+SGGoTAZSu1hitwSPfrGlcXjYxxexyI7ofZ3Y6
	S+tuVGB3y0mr7m67JyYXEJlJW7PlccZgEc5xvsTuQHApcViM4YazCNZjHozxlz3a
	vegeaylaaLj5z4zMPpM8bbowTD3CA66pMa/dI4PB7kfL1mgRKjr2ZksgcVuJWnPN
	NnKVR3DLLdPHXjfPqUQESfIWJfSuThchTAiISC/VjCGtXk1ZB8Spp3fz4xAOSkcd
	lwj/k/GWkDSyBs9IUSXv7nKyy1QD63t/UklqOTL2RJXXnxzXWR+DNLQ3o+OTIbPX
	+8jM/y+FVyLRp8lNvY6i37zAvtO9rlN5p60ncOWElO45wA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d1wa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:51:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939665a1ae6so500251785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246262; x=1789851062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=QHfo5IVDbnwy7WWSJ7UNh8Xt+uCVkFoeSNz8E1xvnEIrZAokXUGhZOOQlBSE0d6gZ5
         PDrdF6pVXYFIZjN5JyJiY2rvu1dMNSvIMDOoxhMgajDPNkSTDX0iyAEmlxpoV6cfDQBO
         /CCepZ6ZQ+vnrtBiJjoR+v+ld+pTn51ISOEnb5TgIa123pJiEwOrdguCaq5oPa9okqK7
         /g/GydH1Au2y7mzzNB9ohBgwE+XdpMrvnFuWJINcXi83uM6YaH0Y54qI2wV1sij6oEdF
         V9PRIhdYNNaBLnh5EFQUr2Vdfp71BnAVGpKhY219uZk2KNSlBCYLukGlhrBzNTQWWbEN
         Ypaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246262; x=1789851062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=BcrABMMCGUHOTsCW7RIBpBkDAydM/c1lMp8ruqRQiN4C8z/YnpNnS+m+r/FtiE026I
         GP1WR/PGZsBGBfTEAYsFvKtlOJnzCvmrrXsTniH90f+yz/tIkYkB5gSg70DcS4MC2z2u
         +vSMzsm6sD2z57+mHomiybZ4EGl4VVBXQadn3Y5+bmEu+pBbizzO0FxThYTzjP4OKyTb
         77A+AWV09cu8UKwEKN4EYm9bcFCcieAdpc0tERNjsoYBgP/h75+A2U0U35+wVY4QBYGj
         RtN9f3cWxAUvbgAqtR2ZO1GW232TeegyP1AJsRjL8Zze2ATOqi1RgjRC29inP0EspKW7
         mXtg==
X-Forwarded-Encrypted: i=1; AKwUvByjn+82znM+VSuXd+jrxpcojgK8MdO9Qjg9ox7nb5ydyVXR0VGJ22kPmdtXv7SuJ2f89ZIWy0OppUMhQus=@vger.kernel.org
X-Gm-Message-State: AFuF++lG988SsjF7OLIbLdpD56GYcD8gbnLwOZZfKDSRAsTKXelPvWoM
	Y6YWX7d83LNv5o0rYwJklj8ej6vR/4w87lKIM4G5Q0AMRjT9tb+gYaGtmzjMZJ1i+D9CvTbfFKb
	LKry680ZiQL/HZaEOk+QV5RzqEZhgvVHC7UkNW9YmDNKwr+gj6RXlvKlOz0jKdqiV11M=
X-Gm-Gg: AYBFou30CuKjXh0P2aEBwl0x9/m/Rb3JLTnEAlo2elJ1MR0pd6biKmyMmbJdOlxMbBG
	Ycg0aQx8dskRl9gakF8jSZ3S7w+djSaaZ/nyCrzpSvssUqU+Q2qnglHMiZR0Jw/1lyH6iv03pM0
	t7ToPp6hsjcMpIbsxyPDay/7C5KTkyDrde1rMJM1eRO610/cxkLxO6i8ZCFCzhPew42GGKyTidk
	qvO4kL5ur7At2COKpvssKnFQCdmD5nqwn3z+S05FGKHY6ZO4CvMEZuoBmGEku4kvrtgQIMNlzLa
	7j8Z2gnIbZUjHzaLF/Cx35fU46jFg1JMlfnTNRtAyMmKjRu/YISGPo7WO8ECRJf7nc8aI+ge7ny
	uZ02X3bk3M+2h5Q==
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670206985a.37.1789246261939;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670202885a.37.1789246261354;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm14093160f8f.16.2026.09.12.13.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:51:00 -0700 (PDT)
Date: Sat, 12 Sep 2026 23:50:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
Message-ID: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfX7TUAL/qNEGfw
 JTNi3SaIzxyg+134SyhUceqHsT83P06VRzG/23bMFEb6wkvTuesPduBrmO7cOGLJyWBrUQ2ypS2
 w5+N6h4h7AcOnALqtZw+2ZsYL+W7sqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfXyyVmfyI50QOf
 rA+imrhvfKUwzG7j9cSx8q5s+49nfpMGsHH3CbAlszh7XUVmNPpi1chiMsXFKy0/V/2vwK1IHlO
 EHsJbC0gk81PqTB0SAyPo8R48eUTIIdPlmoA9Fa7zigZNsD76RkIEQTc4nGIW0adr+i/SOCV3Ng
 hKHi4tAfODJw7YiWuyG64F+4ADaCid9I0sUnh210gwEb7CsftX+/5XGxBe/x7TxfxXM5SNUQ9YQ
 TGcoz/2s/FB8TYGTQe2xzCUcJZ5RYwSoY8kzHxIPKMSpdRiRyrInROUFBqinkD8KCPMGsKzKcoE
 i6wmihkNc14X4xr9aM3SvHEKFPZWI9Tz3NGVupy2UcOQjwzeFNP93x2nWrmIKtMYgEFPeE3mHka
 OYhEGuqcdB4nsY5O4iMFj5ds0LebPm/W6nyEByRPdjbThsticeZt96d3Fmu5FFJ2dMnB1ICfgzm
 QKt/66qhOWulVjQQgeA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa5bb37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yiJOAx8gJh0FWUIRsxYA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EM1CuF10i-259CGZpnhXPBCQFh0YSqXM
X-Proofpoint-GUID: EM1CuF10i-259CGZpnhXPBCQFh0YSqXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120304

On 26-09-11 17:23:27, Hans de Goede wrote:
> scmi_protocol_table_register() stops at the first failure to request
> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
> previously successfully requested device-ids in place.
> 
> Unrequest any successfully requested device-ids on error to fix this.
> 
> The code manually unrequests these rather then calling
> scmi_protocol_table_unregister() because one way this can fail is because
> of duplicate device-ids and in that case the original device-id must not
> be unrequested.
> 
> This also moves scmi_protocol_table_register() to below
> scmi_protocol_device_unrequest() since it now calls that local function.
> 
> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

This was already done by the commit:

2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")

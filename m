Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998D521889
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068252; cv=none; b=NWivZbFc9NFcgsP+kto8JzCmMeBoY526gD3N3eTgZuK43oCPE1WJWInU0mZeDT6Htrm0cuz4bpratmdoqlJudTqnlfEJbz8WTKznG+vyjGHOdgBkaOXcSpmVZCOC1y29PPyaWEjKarRu86GHDMmZdEHlxdLqEcEZs8Vp7AujA7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068252; c=relaxed/simple;
	bh=bBuC9lBWTxWLQj5mIQ9SBsHUy30hiWCjMGzrgom7hTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQpmER6C8VreJdvW++S88TAzMhMZ8VL8rhN/M3slLcO+GVuZUr77Bhxxps8ApDrAZD4otzILnD6GVIRjNoFyfbPUjA522lrVMxyiXW7IRoi4u2p27w8NzRmmc5dyDYnFBm3XQvKxWpPXECwsGkFZbcbI2rDGl+7Q48J6niKdP98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXErPWdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3CtDtv8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXErPWdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3CtDtv8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9joxx3408864
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AcenQf0MRD3oz1H9g3GahMZq
	2f6yOhJZTQ1+IPDT8hA=; b=nXErPWdVKZP+8I/3d/VaDe2bbfFjvwZEWb909h4I
	FyDmSepoK4YiJhfDKBHvDNWf5fqde9OFdsHr7Kp1opgPx5iBBLip8AEXuDihSWIE
	RWLVUso/Ts+WgJs2wAI3y6D79+WdlputflaaNIap/9peWSbv4MxvVcgzaHtsQ42B
	N+LA1eadtfd675RTDEOcCWIqR9Q+rjNRzxN7MJQvYfdOI+YzCX7MyVOFih6MqxQJ
	tcp8kuO1Usg+t/+XBm7qIKyJbz1UfZziGzfMPX5EPFWJQlSzKhLsm9+auewR3yJM
	JGmgasaXV7ilmF1UvyBumv9gnPFhYUZPSwIojDdVGP4XEQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2sk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:44:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso24310056d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068250; x=1792673050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AcenQf0MRD3oz1H9g3GahMZq2f6yOhJZTQ1+IPDT8hA=;
        b=C3CtDtv8CC4DQG5VqSBvtIcEuWl+KCmQpQ4N/TosAF1zwXg88jcCw9E89jvl8O8z37
         jMP1yaGX+Wk+7Em+rsMobVsr11e/HT/CS4D+qDc3o6lDYWIDAWug42Jqmr7Qq5/xs/hO
         RGlmPn2yUbMaNSnLXrce44BF5b7RxuaeHl4+Chm0i6OCN8yB2McYN9tEQKunjMsnMb90
         WOqBiDh541UPgIq9AxIbMISp/DMfY8b0PJiBq6gt+wbaGmgepfbZHy+f1d+oqLZ6Tz+h
         fT4/O/gotRQlS1IHLlaK5m291178lzx4h8ol5svRj06GiEKyjw2Q62HzXwnokaK5U46T
         JlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068250; x=1792673050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcenQf0MRD3oz1H9g3GahMZq2f6yOhJZTQ1+IPDT8hA=;
        b=wCt81ODaBpmbVP9qz+zXqlWNh8jcV1WdxIqXXs+/ISampCb9RfMQKRRGJdEw+JpVdk
         AcY6i0eavuViIkBTeU1dfA4IP6dRAU5py7xdOX1k3LmBAJDN/lid/XFtx0ZLKqXCIAu3
         yp4mOD0k4gUY3L/0SkDzU/kyvHsWN3mtPCR7upniv8+6lvUL3GM1ufadOmss9tQ646yy
         p9rBz2V3KUIUg/H9lsfXPVX7Js0xUi2R3twbn+fDvougNZYnJIZ488FEBhB1MeCv3e1C
         sK+dUkuVTrgHTgdZlsiVF9zPT0L2Rx1W8me7YMV9FrGrOTD6CJztv8cnzDwkKkWSQoXK
         DBcQ==
X-Forwarded-Encrypted: i=1; AKwUvByUIQVtDHP5p1fv6C7NnlUyYWTlx6B1iICY7FnkbqIyqscoXq1a8FPAtxAlcEAdACAYLnX+a36/BSeJGNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjni+FacGtWtQkht5JfsX4N/CZjhjR5mefOGoG3jBxQP2X90ff
	60H+aJpPp8s52QLyhGVn138MPrJiQfuIVLw8dNzDYhbfQWVJR0Vs5KB0VESRtE19o2MtVvk5htT
	kYgl4DDwUYEZF8Hyj101IOZEWlW2zsz0qMFz/55ueyKQB0RvzidBsI6uc3pDFkEvB+2g=
X-Gm-Gg: AYBFou2NHMY/yfofM50drC/hRIFETgrar2Cqv9CQp7M4kwl7M5q6FKc6Y2rzB96NWdH
	1ggkVhws4WgJmeJjg6WIkuM9qloWpJrc8tW5WflMIsfSOR5KqjpopUkZ1l5VNd0Y4CU/IY3gIij
	qcF2Q2y69ou9lWUijnxn4oQb07xuYWk9RHU7fWN/pt8gNMieBKrqUn1p/HPWBVj6MAM37ZZ/0qF
	2dddFIqTT0aiLDgvKtdrbkdFHMToLNKkfHG1y/uGHampCxTywMOrxG1MC0egXc9yUdyxqeP+pcp
	I8p6YYL/TFBEvTOqHXKWJZsm49hmsLfKF1HRaMwfp5D6A3+o48OgCotq1uCEeF2zJfolP5v03F4
	S8PO9fOu1cBLMChYu
X-Received: by 2002:a05:620a:17a9:b0:93e:7dfa:262c with SMTP id af79cd13be357-93ebd2499d5mr2972957385a.35.1792068249688;
        Thu, 15 Oct 2026 05:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:7dfa:262c with SMTP id af79cd13be357-93ebd2499d5mr2972951985a.35.1792068248959;
        Thu, 15 Oct 2026 05:44:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd7319c6sm79853555e9.0.2026.10.15.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:44:08 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:44:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kenneth Kabogo <kennethkabogo2@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mdt_loader: fix off-by-one heap overflow in
 segment name
Message-ID: <wcucyqrdhidmebrhwzzsxjzy6uli62ey7caueu2i6rorzsgetm@qulu5w4uagp3>
References: <20260912065651.59968-1-kennethkabogo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912065651.59968-1-kennethkabogo2@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX6fcDEvt4XCit
 +zMrqicklYffo/gyCMhzEmpIymfTpqNCTP2QBVv60ZKSAvaC84j5gSyoZCDmDdJMZiehl9HUNg3
 iiR/aLMFMrZOrWxHJdnE1UqzdVD2g0/XSl1stLLiAnG19vHIxPLhL/MLQOulQMAi0oGILnbw7S0
 i3RPkcW27dA7pzZnLvIhbED0Y62QgJllKMKHlniLFT3BjaKqcBs18gJBPParytMrC+Qxp8QytfL
 DXoxPUHI1RKCKrOtPTGHAKYiU5K2KZZCRnbxVkx32nUF4wVccpoObKEnSOrDa7dak3STE9fj9Nj
 Vf5mK+EOUjslWjlhQe6AuFxuLHNwzIKDL7xMbl2Il4UvongIibsqycqvR4EhrA/QT18WHYK9Q2p
 nfZ9/1HBRkSfOMIvwTbjikiKT1CrWfPDaob7v89HTXkJBOa+Xts/u7eHSqqJyS+ef80apdDoZHT
 CKlwWvHR07ujqyJwEOA==
X-Proofpoint-GUID: 1a2EgwyDNCELuF8F_MNAj3sr2IKNbfXQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfXxvJUjXrAHHPD
 jcvKqG70JSMFJkm5ZgYIxgbqMjxSpbBhy4ulNIPfSg3Hj/gYe/deerd4YNeHGhiMMVipPCioyWP
 s5Mco2QyjQCuQSuKVJPhloLAKWH59XE=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0ca9a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GfdbEUfwneyheCU63SoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1a2EgwyDNCELuF8F_MNAj3sr2IKNbfXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150050

On 26-09-12 09:56:51, Kenneth Kabogo wrote:
> mdt_load_split_segment() builds a segment firmware filename by
> overwriting the last three characters of a kstrdup'd copy of fw_name
> with "b%02d" formatted from segment. %02d is a minimum field width,
> not a cap: for segment in [0, 99] this produces exactly "bNN" + NUL,
> which fits the buffer, but for segment >= 100 it writes "b100" or
> wider, one or more bytes past the end of the kstrdup allocation.
> 
> segment is not bounded to [0, 99] anywhere before this point. It is a
> raw index into the firmware's ELF program header table, ultimately
> bounded only by e_phnum, a 16-bit ELF field (max 65535). The existing
> check in mdt_header_valid() only verifies that the program header
> table fits inside the firmware file, not that e_phnum itself is sane,
> so a small firmware file can supply e_phnum > 100 and reach this path
> with segment >= 100 from either qcom_mdt_read_metadata() (the hash
> segment scan) or the main loadable-segment loop in
> qcom_mdt_load_no_init(), whenever the image uses the split-firmware
> convention.
> 
> segment was never valid past 99 under this driver's own "bNN" naming
> scheme, so reject it outright instead of widening the buffer.
> 
> Found by code inspection while auditing the Qualcomm PIL/PAS
> firmware-authentication flow. No reproducer beyond code inspection is
> available; I don't have affected hardware to trigger it on.
> 
> Signed-off-by: Kenneth Kabogo <kennethkabogo2@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

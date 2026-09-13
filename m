Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88DF3D3314
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323123; cv=none; b=TnOOs2CDaOBnt5K57ITwqy8YNRMvQeFuofm6tl4vRtUgB2jMcFtmgakE/a9kjH+BwtYfSkdwIUzbGxbYwalGWMZR0/v4NFeOI/vLAPa6u2YVqxou8v0cPuy8naXLa9Sj3pAVacJ7Cv17m8PNIMnM3NMLOD9BZ50hG6GF1mW5GnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323123; c=relaxed/simple;
	bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESAdC10LgWVaUrWQTNgd2YM9vkKSL+VhVbICUYNndz84KjZMakwmL0TsneTS6qXrPQ9vJF8FE5LSoEvIhJGhtVTfhPT3y9e8dcXisdSdJblvHj1/Id0iOzxYllTC604iho4Lz3bwuFnfVW7JNiiHQcc6WKKdFyFAjaKkMxrjHiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXzsa0uU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKFLaQCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXzsa0uU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKFLaQCC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2hvC2979848
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=; b=OXzsa0uUzmnGTHWJ
	qBb/Z9En1hErNvPa27MbhBehPpd1chczwOEhGe9Cd09UhFLt7xgC4t7sKDdyD3ww
	L/vztegtDAyUGrocifthsRChiR6Yo88SAMe7ud6VzqFOJPEpI3p7CXeCgDUJPi0D
	t3dCxzukefTVi4fljz6/RHUoT/ztOmTvPFXDEBmS2OoqNRyH9ECDfm2m5SiIUvvS
	KEAkLJZqzAPEN1qa7zjWfGmCVrk9JYBlfJwxjLVmE4+lr7eGWaIUWVZFYlBQkwxa
	zZpQGuOou1MoKfLj5Gd202+bb6AAPGY4oqtTnNCvcd3Zz5xLf5cwv+AyLfmShENV
	S4ODTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkvaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:11:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-855315ccb64so2417853b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323111; x=1789927911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
        b=ZKFLaQCCE9aAgihJpxyRRvqXwJP0tROC+nLePw0pe8WBagAPKdZML8kWliWat1LAkv
         cKpbfJwRJ/AjirhcQml5yqOJ6nazAo3/tcUqukQ13gMx+vSOYRihpiSRh0RQ5DZDFt96
         ndB2/Oci3rjkS7jr1Z5ovPmj98GpCWmH051P/mymvB141pKmjmO0W3bseacLTWjW4Xad
         DHB1v85Pd++Bwohbc0tVZ83EBd2Ry1r7ApN25m356tDCQ34n6uncaCDTQcpwsoWzRuVb
         gfOcHsX3MxGGUV9eoSAiKCW8pXLOltIN2gh6RZ6LC6u+LYOd+dPeSVxIVMibigxPzaR2
         WuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323111; x=1789927911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
        b=WP+Qo0BLBuj1TXuv8B6Xik009QZ+6SfnKMtbnG7gENiXPZmoaK9CoyXYdVuqMPt+p5
         u5f0LHYPrjztg3SlVHWplQ/nj98u2SJk3Jm6jz9j7mcMe1Ry43E4HQLInUnkx9l6nYao
         X0X1PtHHP5l4vzO01EML9o2GexA+GBmjQGqUwoaNLu3boCOw3DuU+vjPV/dgMx6g3cHl
         ljMZ3wh1TSb1Z0TNXiF6ohnv46Esa/XVdqBzW1/UeDLrvu634STcyMOcVyESAKFMEnLf
         BPKVFdVcq8z26pM8Vpz8fFzjxEn+OFDBSJnYESAkxQVH4MCpGKvYghjqpn8R/g0nixuP
         o2fA==
X-Forwarded-Encrypted: i=1; AKwUvBzIcpP6SCM9j5BWoMmOEmMOwrr8XF15r2z9hVsJywD0zvqjJx2i6Qfrn7U6Pcqx3zPZXVQJtkA/XqqFllo=@vger.kernel.org
X-Gm-Message-State: AFuF++lTk+BX/nHriwaV0ErpgcBSWFKufGgiWhyJMe+apwZF8FEMiauI
	7xtPGx82L74fmddSCCKP86eILplNFTp2qq9iGagA3MNCC4xAbGxmsxRvwZiyOywBebyE2n6HmTw
	dfLL7/vpj5rZXGvwjHLf5u/UjcgsITbcCBgiVUsYbOeKR07K65l4nSuqGUsE7n1A4yaA=
X-Gm-Gg: AYBFou2H3w3mERDrS3Ok6YeAlz5FMkVvxvCjTM2Qp1f7RmK4cNuZ55vTLaHo+Fdawig
	Lbt5jmzhLfXU5GSb9QP4uoWLkLFwZWKlLLPphxn/AQpERWatNkSffnbQe8XKMU4GXjDMTQNr8rz
	FkNbfiQPusyGrwC4c+Zgr026aZhofyHaAa6QLD/Y/ZzV6xxbx0xKtgpQtuqRlCeaFKvF42jndkv
	455Mn0eu7IFoha78ZhvoCADtxdqTBNMUbRgCJXVCkQ7Xx1lGTp0tttYvdplDBdJyvwSH1h+hBM5
	jHA5etQIqtFey3S5ClVyP/Biw24c6c2zGTpzXetED/T42XdUL+kYK59b3NKXLAvgGEzzXH2UJ8c
	+mX0Zsmr1zmyUEwt4kacDlkXNT7Vkjfk=
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr25346668637.0.1789323111174;
        Sun, 13 Sep 2026 11:11:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr25346619637.0.1789323110768;
        Sun, 13 Sep 2026 11:11:50 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bac1c716csm20983985eec.2.2026.09.13.11.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:11:50 -0700 (PDT)
Message-ID: <831b7702-07ca-413a-b2e5-5be2b8401ba2@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:41:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F4WuS4uK-Mzn0uO8wLPO3UQl_b15INvN
X-Proofpoint-ORIG-GUID: F4WuS4uK-Mzn0uO8wLPO3UQl_b15INvN
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6e768 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX+J05iGphTYxi
 WUpFSZ8qkLUuXrFICzWH5xZvCSUYqNEbd82+DyNWTziNi/ici/xXCTbtQW1PWmGvV3CFIplfLy0
 ZlKz6/T0jWp9jpU4zioKL2G56gWirHQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX22chSr/tmzQE
 MZDxY4ADHlDRzsBiUUeGLWAMrKHRjBaorqUeYSzkWYcsItrogb/N6VMPc1joZV2sMVEgIljk+i1
 AvV+xsdDbv5ws9o5jrAHBaUMO84kGUI4+EBFMlYX1dCcz/IRdWDg0ifIzjsijwKzgPK/Aeq7mzc
 hla9qWGyj7LXnpxIFN+VlA2qyt94bItbNvgrL6F1C/N/UdsKYrPG75uRtLKDdtG9mSNZwsxxuSf
 pElTSgTOiT+Z6lTOZchyZqkai3TLS4G0q1+jWdgllrxr63pcaVV0xh7evUnIrA1mrW4dAZi3IAQ
 fQANuUurhUDd4kkK04KSfpcM9LHW+GhHgzcVcwqepr6DtCBecMXaZ1ztJRZ+J22ZAqmx35DywlO
 zpz5a+kXtfp2kLSubOLnohMRVxMFJR/IS03tyhx2VyqHvoHcBkgSCbO7PeZabKGHFbk1mCbJvbE
 YIM6Bwlz0rIXWRSoYYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
>
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
>
> Keep "qcom,rpm-stats" as fallback compatible.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

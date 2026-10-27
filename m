Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090166;
	b=WfBBwYO0LPqdRlz6B2J82b6byjT2ULW2eDU5nAINXMBfUjqWgB7jbQL87gUr0xRZpwze
	 6k29VxtkKlf1M9BMSkLHCPLYg8zpl1fDWNVOJiL2pMEnEjiZKz7bhqjTumtQqjY+z87K4
	 psYZufV95YXG+GySq6FyN2KF0sAubhFyfYYRZGV3kyvAUxEa97XfnaKbM1BkPGNRM6nDx
	 ZkRMyxb8+tJQdZkk4jpW106CzMa/cDdmPfe6rxtUwgjV5FrHjJIIumLVfTm5QzssZlW0X
	 Bzzyhgkhm/YwGBqU+qW2fF/SnuMiQpKPf0WEhL62glcT4PpC6gwmaTjpyDjFIlGTQAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=;
	b=a6SUWbbKx9XYCLoA8tLih8tYZtm2v1xiN6BZNGnRrNxvNaW6nijKXjLcp84xiHXloW1u
	 sO5lzfLL34/7fA8aYBTmDGtThC/zDXdXgDLjs1lUvhLfxqOIH4hTGQK3gNn82IQ/ezxOG
	 kyl6eazMmbs9A3bHkh2zbYpkwP9u29YgSuwuVZc/KAuYR+rfVLyoTr4DLi+T8LXXuVcED
	 88BwGpijSnV0uDaFTxyICCEdBo5lByqzGeBD9E+ITzuOjSIm6JaenzhVDAc+Gs7n6C/Sq
	 kKxhYbENtpIeR1rNFG2HZa9gcFNbGdLnR0zZzZ/mPr7IPnjfQFYln0Rxh49KPxB896g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZl00uNo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fsT48/+w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1991606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1991606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZl00uNo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fsT48/+w
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YvcA2349874
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=; b=WZl00uNoBQdnt2S0
	YB1m4Tf03HlEr6meEzoF81gMDGwApPhtgPSv3aF87ZFDmgbZ/mNQ2gzyLEiVHOEq
	bPfMm4Zh39MH5BUxtJXkMcGhB045stMayepIYGKzNHNW9Y3joAWMT6MGUQNamCcQ
	7qFD8zUYqfJOMcKLLo1vdpaO9H0ovTvduOPHdQxX8i6Vd3XL1BzNUaKcnq5oTfh+
	k/0/PbOefWy343XxdLWC2eGjn4z1cxZwfFW1vgrkFY5sOBV7olOPaytGmxyEhoqM
	3YVssJY0pTjEVsrFBhQ00voYV0SA3Gtqb236AckrNh9ggS0ToxSl3jEc9KnKssiV
	ivTpxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919hu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e61a48d5b7so5875305ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090164; x=1793694964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=;
        b=fsT48/+wTIlGb7Cz561NgUocbwZbnONnd3475+kaLvBiWzQlfeYx2C6Qb9kdx1omBO
         Rjf0VmLraMsmKVKgHk8vtP2rgzcOgNA29rDYlNOggqWxtm5m82hnskjz2sHOV0+Bhum9
         UJaRXEGy6PSp14ivyRFSVtLgt2tf0oEb8UWPuRoIAmlIqUCfYsCwfiFbKkNWBLq6Haqk
         qnQO7aJqT0zXMGo+fAnDaUaY0dgctoMY89x7+G38s/45Jpk965kYW5QTNgWjbIRVYczb
         7+xDN00u7n6BQ6d/kj/GjFt3ksfrIKWs2J76hE3IrFfK6V1/7HU5A01lWqbfCs2oDsnd
         7TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090164; x=1793694964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=;
        b=rlz3Yumbl0wBqKrSMyrFca7mLoGy1Lxpzq67qUTWZqVmueDLhzc4n7pg/IhVsHd0HT
         5kLo4gXk5NqejbUMahRKhZvOJ8+fHzOzY6G6Oef/5uCI5F5pOgozPSwB3D3iY1j83NP8
         M/9n1jGpwOUTlhZTjKbz0DnG5mUz72CJeQ5VYr2BWEy37pCqCW+Gu8yUvvc5bpw9nBIU
         eInLNIutqoHIqEs2/FuCvo0rv8i898upt9sfUpVLccZ0P9Qpi+Bjb62doec0e+uZLnHz
         TXqJYKkKTklMLcENsY/Kx9FOrXECveSafwPQOeHe+Mlim9m+w8UyuLN2k5Sgx8i0S/Gp
         bTvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJSBjlw7lU9v218W9tOMt9srFKQOLJCPH7pyNwVWFKLRTzxIlz1at3+AkAaT2WmtypinXexLs8YUkgCWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqEF6i1MrHiYp/CsHZnd7b5R2HcJmQpnNEux340giMNLkG3QzF
	oRunQiiitMcY5+SQ+lSif6e8BjtV9NJIPeLikfsOTBTW70uAcOleLEdoRRufbX5/VStrT2S6yaE
	JTcH0aYLDF+++12Ysj+l8iL3otUa6AKwwLqL0shOSzYrsoZX6MYz3jGhB8YM3UkXvrow=
X-Gm-Gg: AYBFou0ATNDB/hLwbih6tSl2aXSVI1lCgOiCMJZ8bCI8lPnh/CB4MnYEFlraS+4fJdL
	84jip6A2kxureLCt8Wsh5S+WoH64ikJTerlDDyR6De3A7/mCTlLaAyiLSV1CJ9jxUv/UR2xKOJD
	TZbQd1GrTF6/YSTNI343cXl7wUx6kXxGj5xaqBkm47TwB3MwhP9G14VqrhMvbGBBvjpY2izIoRK
	rBXLfrfT+1avb3PdahAuuGVaMQleCFO/S4nVwdThSvUyYSmDMqh/JfbaTLlZbtfUeLptAP2rDci
	zZVG+K/C9uYHxq57vY57VsYBzmK+23A/p/K2Y6/ro/Qh/HnCnzmusK7sJAzZXFNVPLXwNq7WXZU
	hDa/Cj9f7x3rcOF6zie4y+fg8HCTc
X-Received: by 2002:a17:903:2c04:b0:2e8:3a42:7edf with SMTP id d9443c01a7336-2eae3d18edcmr12346315ad.12.1793090164483;
        Tue, 27 Oct 2026 01:36:04 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2e8:3a42:7edf with SMTP id d9443c01a7336-2eae3d18edcmr12346095ad.12.1793090164009;
        Tue, 27 Oct 2026 01:36:04 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be65f1sm5508205ad.38.2026.10.27.01.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:36:03 -0700 (PDT)
Message-ID: <ce4edb33-72b6-44ab-82f6-0efbf7111617@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:05:57 +0530
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
Subject: Re: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
 <08503be4-d40f-45b2-9f78-27f49125909c@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <08503be4-d40f-45b2-9f78-27f49125909c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rITj5oVtUwZz4hWPJ_2G9nhtPEzdUb-x
X-Proofpoint-GUID: rITj5oVtUwZz4hWPJ_2G9nhtPEzdUb-x
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae06275 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fDIfHCVy3xMQvtPnWccA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX3GjJGLUEEKGl
 DlmJ8TqW7mf/ybEdnl+AI0TVNkVZqNOOOmhcUEBWVYZ/GEqCMEIvZ1G1qo13aksEOejyJZaKLdt
 tLVFNtD57LUFu9t3ASVutoWjGZQbvQuBEiOPyVxf6O2etEd2UXoH47fukgbZZ84uLA5+QhvN2du
 lg5PZlz0C+OfvfiJdQd+PD2puPfFitqL03BKFu0eV+7+sTxq+MlG1gLn8Aiu+ewTTGweQfHS2A3
 9G2kderjFA4Yr6AD5kbeHNEMB5kWAXS8302JtzozNSz8vQK9VV9iA5a5+WMxP4oG/nIKHD/gRn5
 9DeeUDuPZx3qqncRR4yjsMMXqvsbEMUDxl9mIdo1I3DtHdG62b0QqOeV6Sa6wlBb1P73mNZKygK
 RWyGLrflB/c/F/8Yq6wQFvm1O41GW9a+Xg7PtzFSXBNyOnavJ9ta/haGVZRFDhKSAd1AEVDdUwD
 NuJM0a+9sabSDaBOB2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX11PO6YHn18Oj
 uHAJC3dhKKaTuwEBOkSzc/d/Itq2eqXoD2Qy7SoHTl4XMictcKoHbH5nUFMDUm3CjBpo7W71aLq
 hk1wxMhDjxIMDcRavGymOETT6MPbsEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034


On 10/22/2026 4:10 PM, Konrad Dybcio wrote:
> On 10/1/26 11:34 AM, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
>> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
>> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
>> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>>   HBR/RBR
> [...]
>
>> +/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
> These comments are a bit superfluous
Ack, I will drop the comment in the next revision.
>
> [...]
>
>> +	/* PCS-level drive level tables (v8 / Glymur) */
>> +	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
>> +	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];
> Why can't we reuse the existing fields?

No other existing fields are matching these two tables. That's why I 
added a new field

Thanks,

Nabige

>
> Konrad

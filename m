Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E1357A25
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611311; cv=none; b=SbwSDJGs83la7XtMk3DqZ/FcKPpa2a6qNxHiTUqL21K/mxR26UfZC/RSiafdjsbVdYK6j1ckbo0/F21qRl6k8phBr0Ph2q5kW6XwWz+/KSSFnYkCPy9E29gy/QvRFkMU2M6D3LaARxfYYu67M3TJ6Ky4REmszEO42iHlnU6s5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611311; c=relaxed/simple;
	bh=m0lF0mWr0k8EZhKMpDz0CMkc8BxDMfGtvrJsWJiJ9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBAMNDUWmBT998BY2Ewd2cbhSEYpw1RvDP6q0pobJosepwPFfHZBYDu2NX3UDEuU9jKkbDPomgBUISv+G1MsX4/tsrKUe9YfDCZMdiZ1clud/WzDDEy0LoEVcl5GKsac+JLib8fHSOHyhf3cynvLsWLXaPli+0HHa3ufSahFGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNt7axBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx3six3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNt7axBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx3six3o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1ZmRF3559716
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0nkxLnWGJPKpLZVwfcJxb6ow
	WJd+MOMDPY4c/u0ORDU=; b=oNt7axBKVncjEHFcBh7gJPyYy0nDVJrzEWF2NHRO
	//10oKhbUh+MxVooNlTmJTI4FXkKAAZr94XsRInA0sks0QOa5kCSXEZGPLN6Cjr3
	F1w7lFS9dAABj1wPoRKUil2E6LDvFoUVh/6Co/rlRsLjiDlsOKkH7mXLbN9Xhk2h
	/CTjVTAH7cCjiVui2nSSLKEu4tIWFOwdrxuwtum7aOKdA57uBlUpnFS+yz4R4ib/
	hX1XgKVoxAhqmvVAZ5jwrDH483+tKTu9iPWcHQKygMHp3N5nDjUeHJow5/Rv2k7q
	nsbplCiHZLXTWaG2sFGnVy5H7/JoLGJgNS9gLu9LqrnqhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7h9w0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:15:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so618514a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611307; x=1790216107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nkxLnWGJPKpLZVwfcJxb6owWJd+MOMDPY4c/u0ORDU=;
        b=Dx3six3oc7C2fRBU8ceHPN6qEuVzQhv9UWzJh2pXMiTNgugTw9g2jAzFx3Jcjz/ukw
         YDcbK5ICCXYIGfCCGoQ0EcLUZTXP+d9nEb3eQzDYWAeG2HrREbmRMltKw6p/FuUuvr80
         0xk9h6T7iD12ojQRGcLBEXlbPuxfCvLkGXSdPRac+/MF6H3eTgu8oM+A+jrxKp32iMor
         YYodHLmo0ZDSX/eYhDSp0EQlilfWuxwn+3bcJoJS4TaksV3tor8fIIhpU47k5G3XiK5l
         2l/XZOASj5LUclRw9HADiwamVnV2pYao0FXoxEDcfZjWrGheWsUnwqSM5bsEHIhfk9Ff
         Wa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611307; x=1790216107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nkxLnWGJPKpLZVwfcJxb6owWJd+MOMDPY4c/u0ORDU=;
        b=v3MIlkcMamzFzG9aiaCdzTszlv7sFDK5qAOeBz9ujijMDYxYNwvH46W8KmeETOqPjb
         sAGoCwWI0b51Q93WjaW9P6j4+LE4MBbOmrQE5fOofowM56tb2gtem4NJcAnZ8elxK7Vg
         8GZOf7PKHDF+cfBkvybiGcrQrylF/wTf4w6VITgaPCEcd1+LFDtU2+2VBmfduQPlpzmk
         x9XnKJzjHEr8i6ZG0fHtitAYx5Emble45/LYQ4b1lDfuGf3AWljv1lR/ZoAxbZDwvDZ/
         v3+ke3EuLApeo8AEAbzXp4ZNMyFGK+Wchz81Lme6UIacm4MAXdryzn7GqrqJ+sBZHrt+
         Xx6w==
X-Forwarded-Encrypted: i=1; AKwUvBw3zXuh1JIQ8lm1Hi6wLMEPOD0SrlO+LgJY/lUaHeDc/ekVVNjoKppHeekC7mUzhrR3njCVdpOuMh7Lkzs=@vger.kernel.org
X-Gm-Message-State: AFuF++nG8AHumTEcy5vR8YRiX437iDHqfLL9j9F13gton/3iyniZfn46
	2BDxBTWfp41bQ/L0BdhmpTcdEi5Osrrc5az5QFDK7gtDGNStFDknmhTI6fX5qu03de57q7uHezR
	uB6oJzyfIffcYcLTil+EvI2fMKhe38BxPmCnF2UgCkTJM7PW+Ds7XoP1NLbFQnXOKj7s=
X-Gm-Gg: AYBFou1qgBdSeS/MBS9u21Z0nt1yK7EH7p3C5ciA69KWfYaHw7Hp+cOs4Vlic361CU5
	w8S5EWiX5fwYwJq5deuyE/TXOd3qUyOYnOeS3fKF1rcOXA2LOMZ6o/80cp1LurPZDdQGQhkNr4t
	oGt6yTvzknpVgrboPs1fEcS23pML9BPm/rtUL4nhbo1gWVzbS+EbJN42pU1PLB45ne0dcQoKu6L
	WlXDrI6Mo42U3IaFhQZc7GXCbH4Lr6zi1pUNxyLlEg61cJ77nFSkcudOjffAYeHZZXoLpm7XMb8
	6EK0f0ZcnEezQTkbp0sSr9MxHYZjigImv2KEHPR3BYn8wJfdSmwJdyOJRXjRPugeMa4LuwtczRg
	Ij3zQWf1Z4XiGNL1F6aazAEYLwC2/hvmNoMMNHh5OO34=
X-Received: by 2002:a17:90a:f09:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e218cd674mr8456844a91.9.1789611306701;
        Wed, 16 Sep 2026 19:15:06 -0700 (PDT)
X-Received: by 2002:a17:90a:f09:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e218cd674mr8456782a91.9.1789611306226;
        Wed, 16 Sep 2026 19:15:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14368985eec.2.2026.09.16.19.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:15:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:14:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 00/17] Add Qualcomm Nord display and eDP PHY support
Message-ID: <aqtNIFXY2OcL3SPB@QCOM-aGQu4IUr3Y>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX/0mKt92m8PoN
 xgOXTN812muE1WnL94s65v1T67tShRsaHpf72XUWiaDIpO791ZQC8+2v8f7U7VOKZI6yekUqkcZ
 z0WLMgaDAvG0NQp91rlS3XDl5bVJB/Wj3WScUs1/dXZtGBcKfEeVdfKAGdZN76Uy8pl+IE7US6V
 RPjm5eVTk7eIjFsX7Mb0oyDeAcGRZJ2lgvotc4uxI8gNKk60a01zc4ptjXXNLmTHx1jxK1+LmZ0
 x+BZu8OU/UyTt7y7reu7BTUWpoincBMJTvbZQy9xoSmDJTN6gvoBdxtgTc3KWyd1BWWRQYc5VLG
 FvTXj5rhr17przUrQtvM4UZ4BTk0Po8LBVKmA0IxFSrbr1Lr8+JbO4UY2HTZiGt2xfVU7gZb+8l
 i+RGckohz/5k3q/HQw9LxeBcx6yY3SMMYDSZEqkaGgT7uVi1E61PJmYoW3bnrt6GsZfn5d6Yp9Q
 JCohLIYGpd3u5afw/xQ==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab4d2b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NcJHP3AOhwWrRdeD_j4A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _j_75irTo9UVL0f-H1NJJSgDE8mFqgCz
X-Proofpoint-ORIG-GUID: _j_75irTo9UVL0f-H1NJJSgDE8mFqgCz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX3+OHODfpsr30
 q24LkyxkHwbbnMom7+3cpgfiE1tsJrigOR27TQQ5hUt4joezL7+DnKlSTNJSfw2RUWSNVGXEsxY
 FOnSB9gw2UXNYVJQGSKrulacaJDAl7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

On Fri, Sep 11, 2026 at 09:06:31PM +0530, Nabige Aala wrote:
> Nord is a Qualcomm SoC with a DP-only display subsystem
> (MDSS 12.1 / DPU 1499A) and two independent DP controllers
> backed by eDP PHY.  The PHY uses a different register layout,
> PLL/SSC coefficients and TX signal parameters compared to
> all existing SoCs supported by the qcom-edp driver.
> 
> This series enables the display pipeline on Nord by adding
> DT bindings for the MDSS, DP controller and eDP PHY, DPU
> catalog and driver entries for MDSS and DP, and full eDP
> PHY support.
> 
> Tested on Nord Ride SX board with one DPU. Both MDSS and
> DP controllers probe cleanly and panels render correctly.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Hi Nabige,

May I ask to be copied on Nord related patches? Thanks!

Shawn

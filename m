Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411776;
	b=QF3lWYttTMk4126ZFRVTOr6OHsYHBMimd9iZSZUvqtltljucd5Cutg0Vyv0maO07PlLL
	 XkYvgcJgu+SG4ZX9wncrNreGlQTDlfdHmH+faO2DsVWB1lvr/xGpTOnejWN5cJu/2glf6
	 WkVMUsdapBCrMrbDKArXmvqn+qHZbL/PyWVljj5gE9mt/U3S86iup/7Xm1Zz17K/AOal0
	 62Uc7NQkvvQ6JVgBTBjppqRLTC7WXlZtm+k5J76NpQI0gi0Heze9A5PaTsREZNxxBkzEO
	 1O2uMMzzWR9Ssasaq/qdNBs5+usCastu/Yb1n+vaChVySHsbOuuQgHww5MgoG7Inj9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
	b=pkF3USti8vJdx7y/wlYeJ42Jv3tmCQzDxvNVOSC/EuedGWzEsdhg3/X6iHrxMe2Oz5eT
	 dJ8y2ukx4w+6nPrm+J9UH2WxMU/IsU1V8c5y23EoZcDZAhgyIIAkSE512JTtepDhLJZMd
	 U+NLnukZomq0lxBE3ZXWd2x0628f/Sz2aAkQDC0X4bXkX2DFwZEsCrJWXaEM/RkInRgTR
	 T4ndDJ4RJuiCFQMe88TPP+1AalYzeQNzG4qdHArnDXXD5a7J07X5aclEL8JAMebzCRnEH
	 iDZOjSCiGucR9HPIZOaojnjEI2A8gmVIwEXRCkkAu40p5A004AreOik5F4Zh6M0I7hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fhsA4Yuf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOBDK3LG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E45606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E45606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fhsA4Yuf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOBDK3LG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04al3597137
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ka81IfeeRWUOIRXxY/Mzm37r
	R2+cA3vNQJzHgs09LJg=; b=fhsA4YufaIN+kkNmUeaJjEhXD+Ay2S74Gbn9zVTK
	CL+52LVeQ/1bp/2LFslDYc+04X2tLRxzv07I4P+zXc+39zxf57p5lzyev2ZIhlix
	+/6Mn/DfKG+mBN+cyE5YrV47TWwkbC/xXIOTESGtKSFElRM/Xv7Dbh+MjqQYMjX8
	ND2dQtH85W0vrQlyMkLCLnI9cTpeeoX3TCN2Mi+LfMHL9L3soCWXGC+W9gxjWgID
	PSP7heUFaGzTm/0qUlmXBt4iVwnj3ecINoeUwWKPNGJUvI2QzqaJypFL9a2SQ02i
	lbsDrcA80QUgYI6tkocFBjX5InTBX5JFLkN2bVX5YMhRPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8c70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so805013485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411774; x=1795016574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
        b=HOBDK3LGauY1QmsyfGncPeL9mUa8yG+nh/PyfJtlNeABYiOLM1goFjBu403O6ieAvz
         4rB8E872JlmwDz2WmgRNShmD7Bh+lJ6hTHUD+XeOingsyLyPnwGpBWjxEbM6eXDFTJ/R
         KZjp7A7tyUL3o7OYn8iCIWCJUJWpunEpxRCuYKNvAD6e50dwsE4dO65sjKOQqWZakUyZ
         SSIMeN9XfZtFmzPHK8EKnsSwRbSW08dVzJoTBDnjfI9pgAJruPXYP6rp3mF7WLRyyWFB
         gYnASl7kCsWfSUB6WK+N5/P0+kNDs37JLk3pFv70+O2GxUbQFVWmVPbwiP+PTG/omIGu
         QgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411774; x=1795016574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
        b=qIDKX8IXYKRqkTsXRga6tFWo0iay61b/2HP+vNLn+FqJoXYSZI6a0gZZ+iYHKW4cp1
         opBAgbLH4p0sXqniJb18MCFrx0BapAGi4Vl3Pc1OaUYcB1Qs800yXF3bYbJ6cpyBCy5n
         FAky8hrhpcW/uIuBJZHS1nw42z/e2D/qQ1KcW44FCjUeR4/lJEykS3x4uMNPxnevx5Bg
         yBu/D1vXuAStdMUzg+xPHQ1LHGgl63X+QTawtEGViBBqzyRPEpQzBhuFU9dIc9F6MC7I
         4qN/7uGOlsz5cmQGskgtUkVWoyHkj/bj1PWFUEPRmSscFRTv+ggl88wSw4xiemAIg4N6
         i0nA==
X-Forwarded-Encrypted: i=1; AL+hErGdTaH0sq7ZZCbSHDwh6hu1lqwBStlvhu60KQtoX41M8m4Tz2KKSEHvLnopL5fvVk0wiAMVUzcZK+fR3xE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bJpwojMQfYmlluhnX/Vbhgb0QmB7DO6/OcFfRFMwH+RrTQlmz
	EqaGE0Cv95UnHPkBBOlV8baB51OHK6Nsq2KNdO7/CmGLS7JBsVdWTrSCu8cBigpP4pAu08A9iy4
	JrjkezDJiXTq/2K3XuA4Dv2Ubd+Pt9UxZXPIflRjWT1+PKXJ9gWMkuYpqDlmW4rLTiew=
X-Gm-Gg: AYBFou0ZHJDvlo5hMaI084lSg8/Vuex9SnVSI5BERR6egmqj+fRxGGsbmQEy+6g3D+b
	pOUDYCH4Yl3xS56ArzjJCsef8yxKOTQ0gZ8jEkb3+lzgT+iQKldmIKfTKp55ub0f+VHktVwg/un
	D0WZfwdVV6kHCn9shNc1SVKax/NQeTgaVCRP/K+6m9o5fORSjcp5x+BGEBHYYo0daxTv85Vp8CB
	JKABLPg9xe7JI8zX+lBUIJRpzP+BeZqaIHEAc8C+X/ao5WMKL17kcHx5bRUOGdYqd1VAVbS/lPw
	zq4vF+D8Xs2pyihIqp6jVV83BwMBEbRLMR8qdDufjzMrFwKhSyQfkFj148znwlvwFTxiv0gDEL+
	GAKBKIbODf2WH6pU/41hdsbqStTreId3j5PkefEhFseljPAF10EtSPl8xLQoABlRxpdo2Gx5Skn
	HEDd6JTZvZQCnSKIQo0FpF9JAHlWu6C2Cne+Sf6TvAXAJtxniRX6LLcLJob3BZrw==
X-Received: by 2002:a05:620a:1b85:b0:937:6c0a:9b65 with SMTP id af79cd13be357-947afcd6309mr364200685a.7.1794411773333;
        Wed, 11 Nov 2026 07:42:53 -0800 (PST)
X-Received: by 2002:a05:620a:1b85:b0:937:6c0a:9b65 with SMTP id af79cd13be357-947afcd6309mr364193585a.7.1794411772617;
        Wed, 11 Nov 2026 07:42:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba565esm984546e87.19.2026.11.11.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:42:51 -0800 (PST)
Date: Wed, 11 Nov 2026 17:42:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <xih7e6366voj2awmlhdkmhtyn7qrcwsv4ejp7kz6vvszcxdrlt@fyn6e2wnwlkv>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX4NYqqIQHSJo0
 pDOtRzSyWkQI/Fymf0UTCQTp1MIRc3aQ0HkVpA7Yv6FHJAJpo+0V3PL4KxUTuHb2RMOFZf9Xnza
 C+rVeanFeasrpF2HR/BgigeI3GNOblQ=
X-Proofpoint-GUID: VmYzpECWXOfZWOEFZSh4SjRf19hBe2fT
X-Proofpoint-ORIG-GUID: VmYzpECWXOfZWOEFZSh4SjRf19hBe2fT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXwWXUVR30GfRh
 pTuDkdOvluVix++KvzqHzFEQKDcihBZfJle9zKHaUb1sJkk2Af5LG5U/0NGoPtbAhpQjI5Mx4az
 vrrVswbk3ZntYsWmjN+8S2Gp82wYbPMOtVXJkkqiK/3bO5u0hip55kgdGXkYGVSeV5UcqqLE+44
 B6jTOVxz0zLIfURGyvBKWDAe0d3DwOIBsa91fL/b37DLVKeki2pSAd/UBX9twAoYIXJQV1NwwyL
 X3W8BWnzjlVbXzpijFvcDgzOgPjKR8BgtohiM8yI5lkxsvD1/HS/U0j8M0ps1PotXRnl3XWZPAX
 dEKPKF1Xouok/upYCexN/SxE5OihFpJocsM39AhDgwpNIN1fs73B0jxCmN9K+Ch46rel2CcH61n
 /QV3PTHkLUVMrWS14r9eQkNR46HSbwpWc0gY0aw8iwmNrRH6N1+zmUZQofJViBRFY/qN/xu5oj9
 KcwHUccmEJlbeatEp6g==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af48cfe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=lIS-3JFwHiDYKImdvy0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Mon, Nov 09, 2026 at 04:36:37PM +0800, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
> source pipes. Without enabling it, these pipes remain inaccessible.
> 
> The DPU is supplied by both CORE and INT2, so describe both GDSCs as
> its power domains rather than attaching the DPU directly to their
> parent MMCX domain.
> 
> Keep CORE attached to the parent MDSS device because it also supplies
> shared MDSS hardware outside the DPU.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Joonhoe Kim <26rote@gmail.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

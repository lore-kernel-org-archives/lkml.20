Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201253;
	b=to+zXdpVpKmZGzYcbvNc3MeGbisKDzs46v3v4PUkvpFBdB+Dx4uXIVatug/S6UzRDEMT
	 6jlmcTSv/uGWhPY+ipjHBNPCO98NA/SVa2F8sGsxetYn+nKa4VRRfAfTl4req/B+lUYHM
	 BAVhBCBNnSd4FtpUkRynVwm4ct+Tj9Yxu7nTG3pdUFSuF3TO+Abcb192jepR+prW++Bpt
	 gpde88S/K5DjNhR/XdrYPz96Su1cKRldMZKaw9lYZNtRGbRj0TwsiVmzLKMYqfeGmTAvH
	 jXCaGhFDQa6sD05teofKdAl0TAq3sggIKuRR7DVhpjVG3H8RUlt0p+aTBs83iBdhdqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
	b=s6AIUr/3Ye/dc6AS3fjtIGe7YOgq36PdYR9tC9t1D/apzvbVtn0p1i+WrYSk3SjWMh0a
	 lf03pNP4oKXi6StNVdHv4r5oLVGn0Wzfqjk252XRHDUe+hHDr2hP3QkFiOEaW++4B+fXp
	 JM9v1LPb7B4rnVGUPvi6QjIO8llhpNonyI2a5UaAdJ/eP4QX2ad4rJYbJDRLf1MFjrLmI
	 dMKHJd6h6Blfng9lq3de41oZ7iYAQLmUExVm5djK9yf+P2FqzNPzqSbglANagWBXa7u0P
	 dYSPdoMyOy7u6oXv49TWmxPSTaP3ohmOrgqJXzFUFm9DejOv4u7TA5BGcUjoWglAVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wp6/APDX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963F606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8963F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp6/APDX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA18F2543023
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SgVHroHe26mmsC3+gKDh7ooh
	cL6PcbX2BsXPMljkV+w=; b=QWa4aQLQJ7t5Qu7+L+ovdgFII6i0DkdBnE8jX0jc
	EKTkBHl1iYmWClp38auy4HjJDN6ANj+baTwqQ//2CFwIEoHRqqVccJfShmhep7ho
	7xnRs5xyXLW9Y3oyYa6lYBVETCEBqNT/kwqV8yvh50pKrsL4XeyocCmaYRkAzObr
	Gq7wuhDAgW/a8Ss8zaoSoyVk+44duNUyY8+GRtbpoFDXFUSpkY0UtoPkKzi77Dvu
	XCFkhj6vdHA4lWYM0toq32Hv+FY9riEz+LODeH60Xd/7dD/cB7oeBKJkvMEDrqZx
	x/K5ED145SAULBltjUxVfsj0ApyBJ+6RzXj8YBT71VDPzQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr2vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c15deb3794so197695137.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201251; x=1793806051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=Wp6/APDXa0RqemUiErRdA90IyeB+vElS3ja/vmjbFHEnKEoFmsOE8qkyeaxfS5P6If
         B85CYKFaeGJPYa82OSUHx3i7shf9/uDTejfq+XkkGCo470XNqZtF7FKmWPyYqWjMDpv+
         F4SOtKrGNgQi8IHps/+LRYunPovg95uygIg2D/TbkK5i6n9bDcz/bTbFP5Fxj10HxpmI
         6oabE3y9AbuYVHcXohvXECm7XkjaL5PsDYtHfWaXoV/NopxCKtZtFQnCwUU6DZS7VEbe
         OTYesey0zVw5UiIMdBTPKnroWMKadG/Fi11mCxsxifhbR17uhgWM19pBm9A3yPEkUI5t
         nYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201251; x=1793806051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=Z8+o8sQYIbnL68Qy64hnPtzQqffl3V5h8RZ57NIgwpJSpdZwo86ZJv07es2Ks0IUmk
         oXeZxjOfnee+mV59NMhUcekt9aVHu/YOSVWoT2BUScCLyDsBQI1m+x06hnvnA1c+CVPB
         O0+50txzZVZPFZBiUfI62oLMSZTZnQxve5yvGg7SmEIoEfgWwYYSzpZ11SNSs1pxozAy
         dPRkEtupbjyZnb67hlYLeZ5i310WLEYNnGwWknDb3Zk4xVOIeef9Q0Mast4wKbxwtqnX
         T+zO7Pv6sFMVd6vvUF/n+iUTyBPDEFCMX6LonVxzO5k1zR/JRoSOqn7mr3i+hO5pPHun
         lmng==
X-Forwarded-Encrypted: i=1; AKwUvBz+Jdbch9w2FbNbod21vf/v6sY1yRf6QD0bJ2xgX8DS5xf6F7M4tcrfMCgxurj4HZPxDnESdxf1o7z33Mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyTWo5ViLifjBI89B9f6Z+FgDJTR5WUv8TQcS+iUZhVa708Vps
	pah3wkVw+8ERee/2jkZQKexT4tma+otCMjx7Ze997N29PXqPy9jkFZi6XcPt87iDzZreltaNGpK
	2z5wUb+h9yiaxbmg1jqmM0+vEbHNE+95KLGZgOuUBFt8wtF91pC7Oa1736bH9ymDVT9E=
X-Gm-Gg: AYBFou2aKb0bjX4zRqAHDcqfa2xpEmDJMM9X4LsGv5qq2NxVmutZRALydFUKvDtXt0d
	S2gNixkYrsLrFTp37PeNbESX0EF1O0LxvOmMNrrNjLtAbyvDN9fvEp2EKrzWal8DqDMXI7tqU+B
	m0gAVUXOp8OCtDuLAZpI0wzQfL9+nQVGxDCerJY/IOLKSeuePLhFmxwepAKhuVE9Yar1o5hTW3D
	m8n8gvWJvzmB5TjTUFDzZdNEu0NLlTRFAsjh1eQWaBS3ZFEKhR+vhnJu+MTIjpPMQWTjeaDWPLX
	znRePFFa/1+f3WtQt2o0oituZqNuW+84IvQzErQiWncN7+8b+l8F4/ApwpEko2OpehQAb2tTM21
	UFh1u4fIrWjIO+rQRxxWlYdQfJ6E6Ns0Wyytxbh91p/a1D5htYfH0ng9JJOknRXX5PQ==
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252778137.18.1793201251124;
        Wed, 28 Oct 2026 08:27:31 -0700 (PDT)
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252748137.18.1793201250182;
        Wed, 28 Oct 2026 08:27:30 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm35094685e9.2.2026.10.28.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:27:29 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:27:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Message-ID: <o5sj26cm4rwf5w7pxizqln3dvyjfbpgkvfbfqn2isn3bwsxvux@yurxx5ptr7gp>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NpBl21ISqS7qNxDobGxbMCInmHkus5eY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXyA9JuIw9anye
 cI/IjNQD1jbaj1WNMQ1aX5kASMyNPhSFF6YhEjG1BGLDcV6SP4Vpt1qySt+2TZag/CYrCSQ89Pp
 Lj4B7Lrt+DrZm/qJdCoMJ08ONmZv877iF1otBOWn4CJIJXm+7P5XaJBINpHDjyjlAe2bYRQLUCe
 mnMtl87xPQ6YzJkVn5bkJyyHpKD4LjRx5zLOxaRcAEneAlADbYc5v7UOb106O4trxattetGsa7K
 xweao1USsEPHUKv8ZgJjFxhWTcyvz6aaooHkb9x/Yas68GhWsbst6mO13vxicf/Tantnrx+hlcQ
 Z4LppiYYVOQO52HIcXmPlYiokYYIo34rGPAftevnqeZM2TCYoEJm/dmg9buBZ/Ueww5JRMRKP/R
 /CP5yO1yAcjyoE68+3oxnWnxFsBJZv1zIetVSR6qfI2kmgG4yQ2IUP8PxM/u6p+li+wPZNFS2Ce
 AqsQ1Dtyrj6H8pgmryQ==
X-Proofpoint-GUID: NpBl21ISqS7qNxDobGxbMCInmHkus5eY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXywZ8O6kX+Q91
 GYy5wtE0FFz2u1BTzHPGWU+hq7toOrNxmXajGrI0J5HI7dSV0vC54k2LCSx0SMHf39B/Z/qb/I8
 qqjn0WQ9byH4AhAtfAQZIrBNPwU2EsE=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae21464 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GCssnZSmVGVrPJfrQDAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:36, Hangxiang Ma wrote:
> The CSI2 PHY common status registers are not at a fixed offset from the
> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
> v2.4.0 parts differ.
> 
> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
> no-functional-change preparation for describing other SoC offsets.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654345208BE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687687; cv=none; b=aNWH5H6SoAjvnhTfynq/tVM69fL+z57qoCWy4xhG1vr5nz9gC/kWIF9s50F91I3889d0rNEGMO4A10KOqV9e5nIlHXNSAU2J2ajMRZ/32Pf+DnQJXbuyYV4E+9zeM6T0hel2ueUeyujB31eNq98n3Xgic3Og2RF2UsDSTwprlX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687687; c=relaxed/simple;
	bh=xdrO1myBWGBIv/hH1TwXt6OF+1tzWzncPVVGp8qnV40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDrPrXLV+jpBYLt+t3Mqbe7ki0y4lqNM3Vfx10P5K5vIRI97GH03uMWPt+KpK5mKED2BhJBXJFnI/1BTD5vnwIZqYFVOGpRNxkaWgFeaecl3uTSOeBSdWDjM5J4flHw/xDg9LEzLcfS/smLtyyXEb5lrbuPjZroguyq2saCAN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHsXHbbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eay6aZUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHsXHbbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eay6aZUj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqr3J351030
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRukBmST2VE0a/WBfTxx/trw
	PBrGDRklQ7X6L/zHtb0=; b=BHsXHbbvuAATzaS9L3KTerfR4xvWNig9hCnKemHR
	AP7OKjXHDxRL/ZmrAiK8/fYg89/fY68wNZP7vISfSPu2kZwW8RVfYfoP/zKyOfXN
	jFJMVs5vDgG5BL9V9PQmLbnqYercKeXptBhc8csaamFP2I3m8K0QVz/kMPXeVJCp
	v0pqeK3DjPioKtV/HwmRalGC/TVnxm0UKj2RhLY4iTPkpFZ2GSA/g/sc33+sUGL8
	unZ+wVMk63r0jstzkUR+RmiAWXDOaTfQTJl8FlsYRfp9vsONH7qxXyV6vkPTFOGi
	m709ffz0x/6oNBWh/anWlX2xuWQewl6VxwpGdsJGlu90zQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjy9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:14:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9832d9be02fso1625672241.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687683; x=1791292483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRukBmST2VE0a/WBfTxx/trwPBrGDRklQ7X6L/zHtb0=;
        b=eay6aZUj70j+hWV+OIVV46ZyxD6gPBHlB8+2PYPIQy98rYYX1iT/YYsVvjCH6aOof8
         70SDo8FN6oqHmMnZhI3Ib6SeTZQmG+5u2HD4LEgi2EwoxRDIWyK0AH9OKCarkAT7/fmR
         UE0XhzXJNx1iFzM3ufboxVapSKKNVGbFgEM2yZl37kc349QWR77K0bpciPFmcG8Z0ODl
         YjbF6QGWaHRi4vr2nEjAcRtsUICypiDd0IM9/bKDSl4X6ufWAdJY25Liv6rzoQ4RjQsk
         /Qh1ExG6CHkAjjn4tYu2z90ehmNB8AdWLixrLri78aVINmuu+H5Eiq7/FIRRD81prC2W
         7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687683; x=1791292483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRukBmST2VE0a/WBfTxx/trwPBrGDRklQ7X6L/zHtb0=;
        b=vrDnMTr31hBjA84lRguzIzDQfmBBUC5aTBXIfqU41J8L/iCDPjzC1uPd8nh4GjiMPS
         5CB9KjTsyXG/zZhNhZvzacW2HwP+eJXtac86pykhvcH3vPKCfGbwEZf9ZsDtMA6hvBuk
         tMsfpV6+BPeeXaEi/iiQlbrfBPXmQNIOhMtOSsSK19rC09qo92qqtc917f3gSjE0tFLY
         HBJTTPhaXQKLhdJtvBWArtr09El6uG5ZmFpAGcH70x325neTDANTnODGtYAOzGxBRiii
         AZWhtmLQgH43nH5bcsvZ33FoHGZRGRDFXlzuzG0Gvk5tEVtHatDCKbrRMYc8GUlCOagY
         ixyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb7i8ZzbX2wrDUwBsqKN9Fj0Sl7s0LvMSpYGmfimAGbVwHCS9tMobKAoqm4uoiikwBskpUr8l5V1jVTw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcq0XhaYLxL04NbWIq7xh/dgs8cfn36xoF9heRDlef4Rn6b7cb
	vJBLu6lNVgIl8yZwUKHOjNyMV6ZfvCGQMti88kbKeHgc2i4R+sT2YG8RKFycuC71zkPP74f4n+B
	i9A3B7qenj6yzbB3pSL9yoNy+aafbKImMTQriOCdvpNyukI5WLE3Qqev/X/oYVBOJBO/So9i200
	A=
X-Gm-Gg: AYBFou1C5FsRC10vPKMblZ8GXJLoNo1a8uf6IEAEmeuyCdehRLCxGoL54OJr0OsRWiE
	dnjWpXigu/jTklPoYl1S6wBgIf/1qVICREMeuZ9H+h0y7JSRYhfZTgQqxJAlNk5C1XVd104i6Za
	m3wbeYXRBxdu8IpfDsPFvcXfXVB91UreQEwTg/CXM3lkZ009JtjjCspVCdtKbjR+0Pktw4utpRR
	Sy+ANvhmZxLrIorVsYHW080XYZ4fmJ7DDeDIOqjtz8HvgsRJZqoNqIB57wLXI0w2leFg9HInH7T
	60INEZq8PMpOE+n5SO6nuloaJykW5iwJ3w3/rz92CrW9uQkQtf1kfw8mQyQZFLmtFwLKxAH1yfD
	ZGLTcYrGrYozlRaI=
X-Received: by 2002:a05:6102:2d04:b0:7a1:f7d2:e824 with SMTP id ada2fe7eead31-7af1edec5famr7288813137.29.1790687682068;
        Tue, 29 Sep 2026 06:14:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7a1:f7d2:e824 with SMTP id ada2fe7eead31-7af1edec5famr7288788137.29.1790687681384;
        Tue, 29 Sep 2026 06:14:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm3956094f8f.17.2026.09.29.06.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:14:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:14:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the
 front camera
Message-ID: <eo4lrod2xvxx45afrw6fawdgrd5rr6rdebcgx73rl7vr4etzy4@2sdtr2ehdecs>
References: <20260926122533.8200-1-lnicoara@thinkoid.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926122533.8200-1-lnicoara@thinkoid.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2+fqZCZfz5DW
 P9QdVgfYqWU4Zc22FM590hWn95V9Nzvzen3kd//658iUeh1WRhP1xLETbQWGpHaTFANXqBB/SZx
 X9Nf2IEWL2Nnkui6UHrFTHkERhhC6wpjnj5qpnf9jm50XNTWSMl8tfRyNCfIQBkcyizWJ98ylT8
 +jpOhZ6Jywyu+8vOSxHRqnjw9ro3UagaIbLSTm0vsZg9SLAk397MvPH/0S9lYhahJVmM4N1r8nX
 RT+gNCgYuZQTyEJuWuOzLNyysesnROf/SnfA6uT+Jf8UAliCSUg4JGfj7lxEm0gztQYBaDZygKg
 4TdUPmZGAoemZE7Mn0xb3NE84OLVPeLLDE2BeXvej7OtyTLFTeIWOZMEHKv2U7iJW+91f1kv3zt
 ucsbjwTHzIKFeVjZ0HVRdrXUEDvvVUQgJtDYIxfjAEPlNpdIIe0duXL2SmwJXun1XPJgFFvU3M/
 U/zxXsHXz6eTikIUDEQ==
X-Proofpoint-GUID: Dz7kir3NeYqU8kfUwXTbRnM86XbnObOW
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb9c4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KOsBq0R2AAAA:8 a=EUspDBNiAAAA:8 a=iu6A6uHwReXJ_BGCYJYA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-ORIG-GUID: Dz7kir3NeYqU8kfUwXTbRnM86XbnObOW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3mxl2dChN6/o
 +THOqYaaGLl81gNTDtsJAFRaHnO+lFFC1wax1ny/xBvs3IOzM6jqURUlDT6KWTD8ehtLbRoCQMr
 eGa9Du/XFJuu+tMpz7ToFLndkSV7wz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-26 08:25:33, Liviu Nicoara wrote:
> Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
> at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
> link frequency the ov02c10 driver offers.
> 
> The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
> switches a single rail, GPIO 91, before releasing reset on GPIO 237;
> GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
> rail enables. No camera resource file votes a PMIC rail for the
> sensor, so avdd and dvdd are left out and fall to dummy regulators.
> The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
> PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
> MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
> and tested streaming.
> 
> The module sits upside down in the lid: with both sensor flips on, the
> picture is upright and unmirrored, so rotation is 180.
> 
> The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
> so the V4L2 core lights it while the sensor streams and takes it away
> from sysfs; the comment waiting for a "camera on" trigger goes, and
> panic-indicator stays, as on the X13s.
> 
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5719278161
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226782; cv=none; b=ODW67rmP/rCsDd9aNA3MOjFQy8WY8cJx/kJ1Dc70BUc1aG3DCm7eSmCEdNVLepdGM62Vhq/V2niB9IJRR/s/IsagXM3YrXqt9bloYmAKnVKHvaXLXfiyUoKnwON0IxMK8E4Cm8gWVnvlUfxmMxasbAdmE0ZoAeOsEvqoxet1NKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226782; c=relaxed/simple;
	bh=MYukbETHNncH3WJQFb+38rqsiVSzKL7Zzr+SVjr1Bm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BITV8R09Rg6hqvMIZkPxBT4Fw1If24qeAVsQhjqXi+JFNneFpFtkd1Gq8VVVi4I5RsU7LSrt1pDIK41OKdy0I9RdCi7pIrXHJUrERZkY1ye7n0QPoEK3EjiA6JrsS1MeujkueYlAdg3iKifT+T2YHWDi4uoPJ9s0mtWZ516S+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/63Zd5p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeaZuBjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/63Zd5p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AeaZuBjR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdVJV3302396
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=srHph//xulGp8uORWTGBqDc+
	cQGY5KYFHIWcHFrXloI=; b=d/63Zd5p0JiOy0bbCnTmxzX4OLr8e9C5mYmupl5Q
	Lp/42oR3mlSfC1B+bZOGv448O9vKqqeuHBcwhCz6a6tS3RPcHnswaLw+DpFtgdGS
	o+JG2w46nDAIIn6n6yT9qEf/M0rVDvHrDA8p1RKkTBWmlfjYjMPUVVdKtTYX/8Io
	/NgSk9Hh0X3SYB5/aMh0nEPRaagZ9kPfSFHfAjFt9wgqJgg4ZejJpbRKTTJCPDQU
	uYz/9x6FngtNB2fumFTtSSvBDO5MPeiHOeUNGi4N2QaWMQxD4qHYg7oNo7jCkPOt
	6/KthuLb5098CeDlchBbjOAGkUUulkTxs9gMx8jI6IkQTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d18f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:26:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938153538caso333812185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226779; x=1789831579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=srHph//xulGp8uORWTGBqDc+cQGY5KYFHIWcHFrXloI=;
        b=AeaZuBjRDFWNDtMjpokpnWdgEiDZOggTXYccDTLitTeXU6WtMWw9fm1ud/Azb0FPyG
         k+sqSjeRGe3fII6ZfUvn632EBrbzjdEjzzgSa51qASjafgcsLN8Wnd+uPHXXwJp9PmgZ
         OkpFtAIh5HJf8gkc2FLIE0JBiohAyLbFtUnARWBoBIOsCZJI9UjvGIimevc2YzVBQwnq
         atNvvS65VPBbUq/9MeceJ+WOkk88+YVayAh1nybQ2N6kY+h9ccU0gwngQ6d+TaNQ7Zyx
         5ohuN3ZVCU1BYdyFQoJBIk/tyC1YM2yYHBTTcoFhGqCAh/6BS7K6R4DDVUiUCh5HXd2L
         J7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226779; x=1789831579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srHph//xulGp8uORWTGBqDc+cQGY5KYFHIWcHFrXloI=;
        b=mgXqwAGAisQ1mcjggNnDet8P6IqWmSfuIZyBJn65bFE7fsN7oD/iM0tFPn9S2gZzsg
         +RnwkTVCPv70Rxdk1dQwa4NBpoPoGfMrp2eyIV5BV5rg7MLK8lG1EJE8rlpHeRyy16Np
         DZZ74lHHueShFVrLYActdwcxpDh5kTIU7BDiqXGqfid88sUsdefcjUAuvsDmJlzkO8vo
         jmd4OgNWmKqexi8BYTfR4WdOt6yIqK8bfg9hAwep7NbOn/XdswaOD6apfOloKWaSl+Zx
         GBDg9NzGOHytn5bmWxZYZnwkvyC6W00rHkQhW2GEArrmU6Rr+ht6LuVa1NpHlQGlH4Mj
         /Igg==
X-Forwarded-Encrypted: i=1; AKwUvBw0+3MFZh3nYb2NgoUudnZguPGd5LOceiXw6leloj1e5lkY3GQO5DMN0Yji1snU11njY7fUDrZffVePqKk=@vger.kernel.org
X-Gm-Message-State: AFuF++mqgvyw2W8+FYTrnaksAlkJ8NISiyGeOYyA7Bv0FPPSgi562Rj1
	Ja8Uy+DfuQtYcUBhrvDn4p6v+9KVIgQiaFvoPhTWWxHzUVksgZGkmMPt1h+C1evtveQei+Jbu0z
	jDsbaZ3EIjPXWdE86itl/F75NLO49zA2BM81hUgHo/W+47kLYusj4zkt1Hclk4dM2Trk=
X-Gm-Gg: AYBFou1dJNZjK/8TwLEOhM1GM8uzAhoB/9RbsuhjfeOaRysfqLKc2psNO7bQL56pSDU
	HShVw28cZbldHDMoOfMBvbe13x46+/ehCVy1TK+tVnVmTQia7z8+5pXCw+mQdfTpZSRPjrvJbjR
	kPTs5VmKqgg424SCkX3QDM2tzNIwlWsFjmFcj/ySLMXV8n7cGcQ/i1TKkEGt5PIOqps2m/cD+LK
	V46/ACCJ15/r3Qqwj/HURkB5BFIPjK/tBi37LdYBkAInaSakEpXQae7Sk4IMOEBVNKxKnaVJO3O
	6vmXROM52U2w0ICPfU92SgGy3nr8nYHJjdJH0L60FuC224K+E/Lh0m9pGE5xw69LnKzCLtmidQe
	JAE5YU1bHcLIj2HY=
X-Received: by 2002:a05:620a:2253:20b0:939:f61c:c335 with SMTP id af79cd13be357-939f61cd191mr714593985a.26.1789226778891;
        Sat, 12 Sep 2026 08:26:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2253:20b0:939:f61c:c335 with SMTP id af79cd13be357-939f61cd191mr714588785a.26.1789226778328;
        Sat, 12 Sep 2026 08:26:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm74699455e9.14.2026.09.12.08.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:26:17 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:26:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
Message-ID: <vsot5fm2leyo774hj3b4mskigktxigklvw54naecg43y5rbuxu@q6wc42a5kb26>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX4fcPwdaMN7MV
 DGlvfaSLVzstV5X/Nz7oxCrrvgJobxi7qB8i5/JcObJtb0qK1bLx3eY70F+AVE9eTL/+K+KxiwT
 bq5J4RCfDPE5KCy+Xo6t8y/eI9u0brM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfXzeg6IAUgLUGN
 0Ruy9Pwf5IzlRAaMUCFCuzLnzYNJRNtrYI07gHH1KJm9C27b+4bJtmyQV8UIRezO2+zj6xecaru
 i6b29IyS7NYxSsb1ogaH77FmiITy2738QsLpp1gGFaHM64mNkHipt2iXVUGDsFaqbOXs4HFw+ZD
 mvMdNq2X1ZH+Te6w+Ko8Q1MyBOlmdbdqCf2XKHj9iGWJtF8MbrrTSA6O3kr+KqOm7T5X4S8sdvL
 3RqevfpxF8j13g+spqTRRdo03J1iDd3Oqv8WnkSGQ4sANmtQrFXuNTY782cl5VarjnyuFA+MR8r
 Fmve9ZFyQ5bzd+QUlm84Ov0dyLrmxv/Att81ts9LiM8Z+CFepO6o9WfTKjhYCc5m25uMnNmanr4
 70qArgntx+PLcCNmn/DdFKA5D2qzzDomv6Ha9C3fnYjXvsoO3W576NmfRnTMHWVjbcimfRNQkjP
 JYXkV4HTLu+c8DprUKA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa56f1b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iQrKqlqNRm4S_ViRXwQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1z1fPrCMqWgeFTlbBZiop6QAm-cjCLR5
X-Proofpoint-GUID: 1z1fPrCMqWgeFTlbBZiop6QAm-cjCLR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120223

On 26-09-11 22:20:39, Shawn Guo wrote:
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

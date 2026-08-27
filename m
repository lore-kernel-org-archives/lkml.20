Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EA9415F1F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830751; cv=none; b=RIu5UnlWZfuvyNnVNMDA99tvMs20nzsr/16TtK5XBlPexV/61lbRzwSYkHvCxQTpuMWFUbBjqDRDVpiFD40bePN2zqodXWPiaPh1PQq+0I1xZJuUTTa4iqijCQrHIJv8wUMK7EbeA6MDYQRszR4YSFuJ/jwggPzrbqTBiLemR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830751; c=relaxed/simple;
	bh=jwoWm3TgRVzSKcFItDvh5nfmhHbHsJv+vWqf+nJirq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9mAGYF5JdD/yeAeCa4M9d3/eLgie0diLdex1JfpUyu9/cu0ipnX7GUIoee+gIJT1nNlEXfk8NAVu0+L6XTN4/mTyQlHmQ8gDYJodIXmDEYZ6BDn3/sgRXsRtV8wFlYFVUqUOg5AfUyREj7vUWvKV8wfslS7KDXdherM++ysWn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOzfhQtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMNz773j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOzfhQtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMNz773j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HvXI3978036
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dN6Da+AraTnD64BnmuT/kJB2
	ZjkAMZ09+7U+VzYVeuU=; b=XOzfhQtvRY6O0X+UrQGVSQ98Rng4l1+kP2ldRhmZ
	txMIOjClRV6nnfBZBoofmQytUiMiUcEBAP+eBvZ473S+cbooh4NEgX/tpkd23f+m
	DfX28P23Jw2oI6Pw8FI3PC4GEK6DQCdpfUrYCHqfjQo0MTZWQMKeZN2Rl41Qsqf8
	4B2IIfhGmBKXGYZwVrASYSPA5zkdA0hnZkO0D0s7TkJDpi87ZX6CNXm/bVJ4HxBK
	p9VBRX2XAy9EHFRWjFFajQSdqR7hWyCMbm3LPG20amuemh242sa/4npEinaLu0TA
	hFw4r/gGd4euFY4Z6nyQXw+TgH2S5i6uDWLmHgNkLdRe4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egkj07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:39:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so383861cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830748; x=1788435548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dN6Da+AraTnD64BnmuT/kJB2ZjkAMZ09+7U+VzYVeuU=;
        b=IMNz773jpZJOaVtUHxNTV+VhHn4WhXNbWOuTo6bVPn9gYY8kExf2nXQVcAKHhO4YJD
         +nuQFuJzR5ZBI9sa6zqxIqW2ooEXa0QdQgk1DOJqk2NAc6QFA/NKvuPgiNhAnzxTkVCk
         /wGV5TZYO5iJd2QdgTb66RI94p5rSRCSCN/ZwU7W41UyGtW37bKKruvdST7s68WGQEYx
         tAL+xSaV6Nuwv6bUllBx9YhgOQsoLZxmBdPAsxVzRAjGQ4NSam80lYGy+Qhj2msK9P6x
         4GqeM3iOKxjpXt3Zml3P8a4Uc6EzaFkHaHsHybCtQazuyunMMvQhgFQpU8jL1CR4p9oV
         j+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830748; x=1788435548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dN6Da+AraTnD64BnmuT/kJB2ZjkAMZ09+7U+VzYVeuU=;
        b=RlpAgNXxFtaJT5SporKgG7ZNE+a5Svrp3/+j4kp1DoCxVb04mKHLLhoWwGfRZ/ntEO
         72Ddt5Xr8L2GiALtQ072SsQjyLZk/AmjJKJdKX9Eo2zzGilwTXuD2EC1MBG2yBolLauE
         fJsZGUDumtNKgloKAy0uyG052/gGXiLIzST8bb68X4WmowMCoA6P6dmgncw3hj7ajQ3U
         lzbVjWuWllsjt5Crh1dNDeXT1kX9XqolQuE93I8ovt2RhudTyzk9p3LutPzAlyFzs4YP
         ydnFRKCiUCOR6tLckDcwhm6wsjx/6gdW0KrkN+hM6z6zKvQTEADE7IMGx9CQ8IJfNWyR
         DD4g==
X-Forwarded-Encrypted: i=1; AHgh+RrDFgRN7pPltFWSbo6EpsrrqxI2TNYsA0WC4C5rKuEkkLx9YVw5/glQ30plMLG4/zIayUmcKXMKYsA00kM=@vger.kernel.org
X-Gm-Message-State: AFuF++kQTcsRwwAfc2ict13oaRRfdx3WcQNZ2MEzOq1baZa9ZMwNNGb9
	T7infyLblqBID5mOO9dN2UDaTjSMp8hQ0uoyoJH5DLGKXOz5lc3xuqBZh6w0/i1PIyqHfyRPtDK
	N+BA+rszYFyjQcOSIp89gESagrMBhZgMIMPMszt6jWRRvLlOR7v4zPsjQFseDP64/kDY=
X-Gm-Gg: AR+sD12oaC1RnitSszPVmV8cZ3vj1I5lnIgDM9GiyIanchgchsiiFA9EeCUC7MoWknr
	YN2GLl3wYnISuCSJ9hTlthDt5zuI6RaTqgI9MgLOvywtHGjnKQnaSjzdWZUcYWfu9uu0ZaNupMl
	AIW+gUdU1AFDlhNekq4R0D0tRcS+QPvq6y2Dw851EiLY/JrOyKf59S68fEFOHxjikcgrUSo5aq4
	l8KGNyxyiqGPXYJz47HzfpsjP/yZAVjvYIrqJEy2b6PgCEDQxUo9SevcCFrZPxP9J57uCm/+eUJ
	UqRHKQCP79VcGlM8tO5XvzcjhLSvryoFdhu7ly+7Rpmlh5T3eMCPIVgD4ZU+sOuUPU/UjjZ6Puu
	ceoYPMksOCY84
X-Received: by 2002:a05:622a:1108:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52e4235cbe2mr147377251cf.33.1787830748291;
        Thu, 27 Aug 2026 04:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52e4235cbe2mr147376601cf.33.1787830747714;
        Thu, 27 Aug 2026 04:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm69152135e9.2.2026.08.27.04.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:39:06 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:39:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
Message-ID: <vkspzqyss22gyus37upq6hd73tfotjpdrgmhstcvexi4bgfswk@mndm24aug54n>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
X-Proofpoint-GUID: _i2-3q5spPNn1MgV0UqkJjFLJhevTA7r
X-Proofpoint-ORIG-GUID: _i2-3q5spPNn1MgV0UqkJjFLJhevTA7r
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a9021dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=EAEWhcUvtLHaY9PztCYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfXwbEYsV9jBCVn
 M5ixnik2FstMeGcXPX1wSm9ttn3epmQ3LvL46x/GG8deP3M9Bgghmdw4CfghyVdb/HQsoHvdPQd
 EvVPW6HTx3sImvKSxSJw+gdtJSu0S6sqOx1KpBVT9WfHExXNRfQtaDkF2B8HWwIoEUFx0GtKcGx
 jKZHzp979EpjaMlP+jtJuaLTYWWGRyDbjtFJEADtvw2dTmM51x0vEbyW4d6PGMEy4D5XPIfVg59
 UHnYat6TCpQYoszYynvFHOPicmci0Zby5QGhzD4y681tmQsCpYDVB1dywArJ7KdwnSlGvOkRIKL
 x6H8zBLG0/dv1QsB8R7N1pV1NtFhozL7dRifMEjuk8K5HZVI4aBK8D740mLB777bVGlZsSJAcZJ
 vtlIKcVKh978EHkhSJ5VCBNSc2Yn4QG+DykjuOkraoa4M3qd3P83xfpGxwHL14zzKt0N7VBVU0P
 6UMgF1XNTxHwOCHnX2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfXzA/5iCXPDd4e
 giqFYndczg4kNAc1EwhzJlvwB4jxvpGYPMSL0woC6aN4xirUl1KbUWOQn+AwqrBZN0ndp7vAcPP
 nczBHEBJl6YdUmwgKqTjcwrbUn0Wl1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

On 26-08-27 09:52:49, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The X13s sound card has no DAI links for the Type-C DisplayPort
> controllers, so those playback paths never show up. Add DP0 and DP1
> links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

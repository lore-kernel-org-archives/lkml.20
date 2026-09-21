Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5895945FFAD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992066; cv=none; b=je1WlcxtuirOTxJ/aNCd/ywE4rd+KGwX8DwvNVDxixalzMGuUPUvI0RTMMvhkpKV0JfPpaidaEHSEPNxj02GVjos4eO8pJZaBMennUeW8lz4DaHkH+n9QB6akzaBLJkOP6xcdhwtRMJmxzYmstYbBong4YTXhtgstCHARmAcFrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992066; c=relaxed/simple;
	bh=xJYmpMkdOypN7Sj/n2yeRBJRaKDrZu1gaBC/xhMqLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SX5ZwpIBu1K85gpj9sSAtZ/bLSXTXWdz3SJmnJqpjUWbFlSHka20am3mKPK2KB6y2gZzFP3z2LfUmGOiHNbS2Cp50ZhhZitM/u3TdrvEepknbkfv42TTXUdh5EcjTkej3ySpKIRIogjZxKC72dw1+Bh4Z9qX6kigX+B2jWv4gRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm8eWGDr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENLTbdcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm8eWGDr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENLTbdcG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe0q01414001
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WexGBER5d9uASCyOQRs0xONS
	Wi6CvrW7lSCk7SoMFoM=; b=Mm8eWGDrXAz/5Yap6kZWHCr5gxSUsrfrn5x9THLd
	UzuW5g1/WwNetvQ1yQzJJVrR7mPFt603Vmoo+KcNMqq1YimWb/7CEjDhvYSBIFO1
	FmKg6duF8mCLcCpmmsXb3xH+VPzwGqdMKJRe7YJ3PpGJUP0KoRLu2vVOea4qpPJh
	ZIGI6Ml75kN2dwemHjZscrRJ5FitfkmXtbtJ61Th0MW7MS8e6bGdlYi0lit4uVVA
	6nVLtzQtgqCUoWNt2wGlTmCiufffMM07ACKhCz/1RG5e3iDlZXNtuM45M6vSgfHg
	RbEi47seoqH0Ub41gyQm6qi6s75ORAFg9pJQlgi3i5tG5Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d13m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c93c294214so977370e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992063; x=1790596863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=ENLTbdcGhonsAyKvL8pKbVV/S3M2bAtjCj8ysg1x7VO/Cagz5Kj6E/Px6W/PecB56z
         Wg5juPQFV4C0U03jArTP08jEsx2IxF/F5ppXR0rF8YTmqitPrz1Jr2SMrWDupMm7sp4b
         OMO/rgs5FzzFezivZSp5an11F77A/p3EldLMcejNk47dMZUCorrqdjYz7LP4HKisL4wQ
         Sy+P6yvRe9eAqYPsVEv1pGGN8q3pyNjQwYF/okk7duxW1UW38tYqxsfMbkmvMWGcwh3P
         j4NdZ6OyiRW1AcMWfuqIsZsCyHfATYc027Mc6MdLScFHD3AdsLaMp6C63730EJ1FA038
         8hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992063; x=1790596863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=sCjelLyNTYe9+aMukN4btdq2DQwovu8H6x5wDCsjHZOHQERNh2RLA4cote25MvDMLK
         hlVUYD+obsz36QczjLtq0Tl0gujNVTiG/Z4yK5SnBvgBiPyPN4ra/+CG7biBgFjtvo1T
         wsJz1+OCHlUi8zBrd5FBaBoFRucrDsAa088KfIrhmynZ+CTxL01T01VZngNMaW2BTTJw
         ouqyQREx2uoAhLAL9dtueHNe8/ZTCz/Q2WGdBpdqnDxWxDnNknS+f/ziULr7aBJBb/D3
         hbR44Lb01JdpnRxNDTGpe40waKFEyQ0X7baqn8Gju45GOAltfKPjlOs6c80m/ZSVQSot
         hj6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxKnUGUKqI/TJiEaQNxPKCyvsP90eZcHluQhHgBEgr1ZFfrZpAVhdhcnLI8pqgbBbpaHqOsvRpd7tfYVg=@vger.kernel.org
X-Gm-Message-State: AFuF++nVoyxip0RNTVjSA3Tnmbs8CKT+AaorvB7SCxA24BWSpsMG+CZp
	tNBuWK+WoXSC3ZA1b5z2HeWro0L9duzeDMz8t66vkne05b+xxI/rTvGbckUtjE8gSAmgXgQ1Tqs
	q1lDFUXmXhWhIlJuB49uRkjLLSD6Oe1z1qe+n+aoMoQABqWeSUR6+ne5N+4R9qeundGw=
X-Gm-Gg: AYBFou2TJ8VgOBB2Tu7w2ne1cDCmE58Kae9jbk46sqTEuvwfNzL3j8SMa82INg/fvnT
	rqAySQSsFvIjc3DYfGzSGUmoHW6jPKUYehfImBZ+FXnNt8ZYTwGAkXDkTYwbZU/fHVRomxJCVdh
	Z7IMwyw1MOS8Kz3g9+iGqdbGNCyCYxB3CQP2nzaY67BIvyX9frN2kNbrOub9E8geG9zlnuOXy0N
	jDAPxWBUzhCp1d3IlOqpjlqlJYMFQ8n4+rGddkdfQlSnxgCIgnnn7vFRCECTYhCIPOjDpv3rKXr
	XskaX1EvPqiyxCB5MtDzlfayJEvkbXnu6oyqa+u2ANC7mGsmNIKBSqGUbCkXOIBWb/yQQP3LrDP
	cYEUoKqUXyF+v6gg=
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760498137.26.1789992063337;
        Mon, 21 Sep 2026 05:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760444137.26.1789992062795;
        Mon, 21 Sep 2026 05:01:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm294306075e9.3.2026.09.21.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:01:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:01:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Message-ID: <dqlby3gbrub5x6rdwd655wu437xonhlxhvrhxaojupi4wzvbff@3vgdyj7sxmw2>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
 <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
X-Proofpoint-ORIG-GUID: sjrbsS86RbF60jNY4RStpA53e5LuarVE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX1QBFBTP4LTmM
 IjY3yx/uAznNdwGuLlupTlazuicmNpyILYVE4vanOjoO3dplfzf+bQZDNH4LPZIOcKnlM21/ObT
 z/fJ+6MzFOF1N8g1/xYHoxjScBXjjuk=
X-Proofpoint-GUID: sjrbsS86RbF60jNY4RStpA53e5LuarVE
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab11c80 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HVTXq6jCC7j2OmNmFLcA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXzy2aPhf1pxmc
 CyjEcKlzJh9kUQxoQQpNleDyx4NGkWvdimsci9tfhguzgegh/6boHnRP7T9U1w/4jfGVDOxkZOn
 cRDgYdCsOeYJahR1fU+QKKkeY1wE51vJvs6aiQjFJc5OT2i/2vBVVGmBYIaU30LZmaiOurLE4Em
 lF1iMYvJ6wuHUd98257JGjvpTcUJu7aLhMmPrDtAwumx/u+WW4whm/KVTlWGL/AXrFMmVzB+GpP
 8RGUzZPJJOXnS2QMqRG6Ek9j0jUbLA0rB6ANwMFLJF4aDGvXWGTYMSeBp1DuhpmkEK5dcH/l94R
 e2+h21IfGG+t4tHliN46cCgSAnNvb0kb/acEle0VwZToJQk57ZttMhH6PVIcRaef+QCGgSPa5ct
 Z2Xhrgm46MzCkg5AhuHmUG8jSIlaf3/Dn8xhPAMPfBaTihGDJXrJ/D/ff+xogMtggOAz1oQDua3
 0VtLiHUDY+UqAQfcSNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210174

On 26-09-18 09:29:54, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

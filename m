Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAF47AF63
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465914; cv=none; b=gKdOqISeje3rxIjT66xuyupFEygDfPP1vefHO1R0dcyMgTmpxEwFghJvycD8Qfws5LgOiFWB08vZLbBLe2DIebfvELXFCimol5HxoZeeFmZwU+zDnHzQilGeaLaMnfcYVADF7SgzuaXTwR64UKd20Zehq+KQ0LTflg63vz27Vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465914; c=relaxed/simple;
	bh=fsv5FuQjdenUC/MA7KEcDcRD5qJ+JKikKx3HzE58Udg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEbJBCRb9UWdEthWm0pVPM0e7s0dJHCL1E7eVgRiZl6XLcbe+q21bq0Eh6b/8NAotxPP2BeqX3t69qk+gmKPNiOSh7nYz235EI0eylDgTeoem5AC0U5vjT53d5ljRLaI381Po3NYMvLtd5nP9jOSKgXSBVNGZ2H9Mq46LHGw76k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI8gvr/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4WOQpur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI8gvr/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4WOQpur"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gxMS3415569
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m1XFciMC/FLa8VakPPfRy3mt
	kacc3Afj+FPNQf0K3uE=; b=CI8gvr/1w5ZXZRm38i+8BGRL88LIfWTnN0MqNM8e
	L+61VU2lXgzj8J7GVB6+g5+zLW1gJxbmQWVmvYRDteXttBIHoLWOHVmlUEPu29/A
	Y+taWVgNqPwHl8KW6fcDSrUUgOl9FAWMfk0c92p00UWd5a+2cNHLE4wuvYP2H4H4
	hP9rm3BslPj98pVC4i8qek5qWxRbNGgYN+jU2NOGruhzl5l5jy6ZVPLnhn4mB4ep
	FH+QsCovJGjapiJnqpChffwKXZkdK7Ra6JN8IXFlzghDAbHIzKgRgFQ8pFGdpUj8
	J+7L+v4HBvMXUHLGlfCLD6vybnqAcIypHxGNtS69f0A1Qg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc02ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:51:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7de22fddso97127056d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465911; x=1790070711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1XFciMC/FLa8VakPPfRy3mtkacc3Afj+FPNQf0K3uE=;
        b=J4WOQpurp+mf9x/5w5gLPAISGQKfi0n7igrYiAY7krP37VwafWB27g2h12CsRvwAxq
         3phoUbODRqKyo26AWKUS8v8HHFS9xQ1+1sYNtdIDKp1GF18Fg3uLPcx9hfwa3UyTlNJD
         gjbTabUfUNynoKFxDVHVUGs7m0Phc6F9xpG+Cq2JAXyLEb954z4PTaQKXaKNPJlcBQMv
         SPP4zew4maTuOmfUJkf/+OxNvPHbbpsOA/dAkY3dZahL+famxpHPfS/y6TESk5EQ59zI
         7UD9BlL5TlHL61aSpJHuHSqLfpF3HeunH7FI2UbLuhEvEPVC4ARIdqLR9HWIwlU5Tbb/
         CQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465911; x=1790070711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1XFciMC/FLa8VakPPfRy3mtkacc3Afj+FPNQf0K3uE=;
        b=hRjAhNIA2NbadwGm8qIdl91mdJYlVuDuZmMbSY+5kcYL3YkeHoOUeXcyQpWA01uXPv
         O9GTCZ7bKhJjfsitNFwJw7MSTl4D7Bos9YNsO61WhQM3UQwNKufIfpLcBaJZTPBW2wHI
         5d3bsyEPRtfZCttw8kgb6Ledmxct/piZXKVZAsoXzwhlZfER6unQuHboJTvibVPuC0Ge
         eCWQGehrDSu2wmUpQSpEYLHhTig2G1F/YtXuf9m99mOEoI21ZYO1mm2UBgwU2y4IvXpd
         UtaSxUlAQAmsdCVQFN6ZW8xyGCAjKis2HeNU5Y74my0zn6N3F4s/cvOa+NAfQBce8GFj
         mjAA==
X-Forwarded-Encrypted: i=1; AKwUvByTi9eftGuKUZnQtcQlTNvVdO+MvX+gYKg7gTUpD+Xgg6xTtCF5SowFlPA92yd5gCbzJVv8pUKfdtuKkfg=@vger.kernel.org
X-Gm-Message-State: AFuF++nViUvnfOubi+WRE8ZowoeXjlywBuwfxDJxRlyq4vOFow2qbE+k
	yPk0hHIrXkhILSsVoIGzgl3LLTGT56ZUx5fFmcBhKHMiuYTQ2hPYJuUElWFlP9N2OI4Nqy55MOb
	MIUmBQstsEtk4gP0tf+pKC0+WKJ+tMYt98yvVjAOYG9YozzkQKTneCisRUxg7pWV7vA7pPbnhPF
	c=
X-Gm-Gg: AYBFou3zO+bU+y5wVxJWEYK4wx8UUla9vKsTvD2FPOhl4HGR6AcmOoJiLPq9ZuJ2c9H
	CQDXgB9QUW3Dni0QTjS1m7xSdC4q99juXgP/CpGoM+dGDaCdSQTgG42aiVIWu3/5TebZH95vr7c
	SAQY+x/6m6y4SXrCngvsEOkIY9sLrWqENNfmmtAMIb11EeZ2MtP6ZJuFIpQLv9q1j6Tr/qDiGA0
	+hE4u7EJHUGwkl+Als0NwIh0HDiALnI2yvL1yGijEgVxvNyEL07Qd0mOpL0ZtBwVhs3vTYAmr9u
	YdEL8FCbndcbhPAwDyEsIC1z9J13iEhmkmV4MVb5Kvbyv+D1wJArLfM6bXicYSgIfwR70UdxRVB
	Wpx9jT9Crxnkl5UY=
X-Received: by 2002:a05:620a:601c:b0:939:c555:efb6 with SMTP id af79cd13be357-93a29838e3dmr882760885a.12.1789465906057;
        Tue, 15 Sep 2026 02:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:601c:b0:939:c555:efb6 with SMTP id af79cd13be357-93a29838e3dmr882757585a.12.1789465905439;
        Tue, 15 Sep 2026 02:51:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm32642467f8f.35.2026.09.15.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:51:44 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:51:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <nu5u3hr7erxzd5l5g4xnktdnnl2w43tjt75la4tkq4ddv5mfbx@npts3dwmx6wp>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LiFAh0dixHdLsiV_zoi_6e6J47Md3L-k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX0O8IDRtumRut
 Tz/lhlM/dSkR+6i2s5Tv0Spq3VMojmFha1JCsUeJlijoUzMputkzrfen4VW403JbiYqUhJ26sUB
 gNpMFg/HaHYpLdBNO8cH34tDs0AW1Ac=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91538 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX5vxa/Qrk8O78
 F95yOyGcxBKzRk29k+a1Y3JoqKiKaXXmlqA3p5p1tjim2VJ4cxT1DLjr8PL+PoEN7Jx3sJRKXMw
 ymTdFvXFdXTNlnX/NGZwRmaS6ePuFtpO/GllUSGUaGgtNupb4/Db8UxF6+0IVcmIKmHotZ+UwzN
 GwF5qWpG5z22jwiJJDLC5thMmNMMPRyMg0ooAGdaoTW4kkzQBsKmzKw4ctiXc3GMJnP2Rf6kKmr
 PUpNNhg9jUD5gtozIpFTL/am2eM02wdcg907McZiTZixQAGJlwKMDvhkG03WIp4ks6MSgjwsU6D
 QeOpxa+zEhCTgcO5G4Pki54tazSNyakP8MSHjFc+3Jdm6z3sE9VXeN6jefrKWlZdpBSP589MGQB
 jhSeehyPlkrB6N4hLjXfPDiSujE5mIEIxKMq8wZP3G4vNnjYoBWW9ke91YxYZpH/gi+8Yr13lNW
 nxLlcBqYqi6kP4QSgNA==
X-Proofpoint-GUID: LiFAh0dixHdLsiV_zoi_6e6J47Md3L-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141

On 26-09-15 10:11:11, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

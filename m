Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809B3E7145
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371359; cv=none; b=Q1ss7t6mNsGym/bz57khFTSHfOXB/Jvx5+waIIqxEJfMcRRnYzzfZRXeLzJYMFXv/A9CNsjbIj6JhidMjNiMOm1lUv0xKlxW7p+cA5FAVCO1VrbYj+KsVqGwtwGFuJEv1Y+u+vpXSf4WD39eoIPsNINMl4h/+KIYy00UieGboqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371359; c=relaxed/simple;
	bh=PCOVoo9qBYPHfalZRTlYMlOVlx9GrN2uo9QeEj/nyfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOuel7b1grV/fF2ZtH4wdtEBOKbMaKzizGOE6WDQUMNN2Y1/JNhi/rfhp2FCdU2Z08/gYMuG0LHquXyd1mlyD/yTZ4YSzHMDaNtSTAuUjA2W/yHwCu2+WInts5pTlVY8hgVXf0NfMRWNC+yA4QXm3+9fI4OtnfFbvPes5E5xJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDeM9Wkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2zlkxvK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDeM9Wkm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2zlkxvK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j27S3902237
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X0OiAYD97Wxb3yCfopmraxq2
	9lWmspdRXWzh4AfWM7g=; b=bDeM9WkmAXwRSHnvk7OVTjGGLRTnq+YGbfhMXtyZ
	3xtjMruju+riYpu6lsASmbLq5Hb7gbWy6UEGI8SwS6IlD4i6eouFv6m5MDcxf8Mi
	e3tOIq08VNKjycp9QZBy3ewbAAOJRGgNAiRcido2nhQBjLeceXF1YGW2+ePf56ML
	tsWVowPM65WnpdldVSpAyo0YE6yZTXJXI4prKkp+pwqyLr981vVwg8riVfTayFjE
	138wQz43flX+FOJga/IU08FUDG3D+CDAa9twSqunJE3Ufb3cQJzlpv2bAd0SdFe6
	wK2WTo8V/GNcnCvBA/ZIH82U/7XeK+zdqB/+tg2beLJOzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5h60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:35:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so183118285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371356; x=1789976156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0OiAYD97Wxb3yCfopmraxq29lWmspdRXWzh4AfWM7g=;
        b=R2zlkxvKszroZjAv7TpBy4xDqasLvUKngT6FWuy/nOPcYQcX7Ahq+hFeuxiZlzu/fY
         u8dwSnEjB3SDrdfKFJu9WH4xSt/dcax+sYwvbpZUKEc3tDm4FSoQGiIrKF5nrUS8DntF
         l9C/SZlQRTSvb/QZvyseO625AOQ3WVCwrW83yWhUvwKDFMqFOnHlliLL/fiUui+77+W3
         m6WLO/WPGEAzDk2WWqUW6lQKOh1xj4MUNyNe927MpZBhSiLu71x41JcDJc7U6lcEiY9G
         HQYGIkOQVb5jTHxv7yNMPt8wWipHUxJ5c3/X3pyUbfMjRSpi0wUwQVRyU5yT6PzdqEHC
         84Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371356; x=1789976156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0OiAYD97Wxb3yCfopmraxq29lWmspdRXWzh4AfWM7g=;
        b=VIbKyduBPS8WyTnZ8mkPC2VQh49/Dh9KzPf6smIAz8Q/1O+14YHLY0f3ui559p8T+5
         lfCVw3zhD1SkwIf3Ar5sAS9OimKBIdT4iT02dgO+onI3XjiafUgosJniwEICLyl0hkvg
         LS92w/sV8TW2u6kHeCUm0pJlNQPKwgWf+o72Ltnn+Dia/SAm6bX+lOSooFyx3LBsttYD
         XhWZpXRG36NHpP1a4V80eU5E9cdYTGao/qep//ErbZxsILA2aqfo8KeZYCoj4YbYM42u
         WAY8QG3MpmK3MomNtJ8CRiECdRLNtBNyximMJD3cg8FE0kTPNHYN8xlbf6rxqBiJZRHs
         0/2g==
X-Forwarded-Encrypted: i=1; AKwUvBw1VWMzw1MVTCymL8D3NnwmL92uNDc6ZmIrK+y0VCmixV03168XH0Di3sgK0HsboRNfaUNIpcELnliCLJw=@vger.kernel.org
X-Gm-Message-State: AFuF++mAlO+Llhw3pwGhSAX8L249NbMYYIX4xBw60jdnuuLt05uG8jlb
	m5fF8Fu97QAKlKC0LGp3ki2x2F8PUXhONHHTHr/HmhI/54AIz2fYGG4SUlBKdk09jdJXO9FeOBr
	onfqR8d7IwJuYmhaSvPT+yLikN6OKebW3zwsSzgASFE8h4uCVwJTreo4j4TD5l6Iqyx4=
X-Gm-Gg: AYBFou2P1JCZ0URlbsXf5tSds7J1NbVairs/+bDwQHTF/BmrVGK6Yuy0pAu2DaAAoqE
	fp3R7lJQNh0Sd51FjVpSAYskBOD2JANvmY3vi7/GFCMSnkl4DhqfWFDo87k4evOR4ACVjNAqPBO
	2KEiGgLfTVgYmuR6v+con5epfYG5KH/B23lbATiVvd6m3tfm054LEiHS7a7iuUcvxBgC2gmHU4v
	G0GpCk6z6YsB+BtLQECNWhmCkMrNSgIMOW4WBiqNDDRrI5oPLv225eEtjWGnKRP8h/uw6ZMgERA
	98Q2v1aYpvO7tZRPpHB0Cb86XY85ZfRF5uG3Mj0RA+DDTDycz+sARoaPVrbRhBTCInhaGQjqIid
	HEsn8D/ftneMhkw==
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr189819985a.24.1789371356394;
        Mon, 14 Sep 2026 00:35:56 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr189816985a.24.1789371355861;
        Mon, 14 Sep 2026 00:35:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6ca584f8sm193953345e9.6.2026.09.14.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:35:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:35:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/31] arm64: dts: qcom: kaanapali: Add domain idle state
 names
Message-ID: <s6ooiniexuf2qnrjqj6ub6uxhecpaxsnqpoddny64jsu2w6nug@jr6mzuv2tl5n>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX5LBEs1byUkF+
 Z7zFNnG+gTylmWacQrTqA3l5Tgnz8h7Yw5ATADhBqz/JphVOxWnmR/YJI/Jg2mgBRXrQeOmlxnL
 WA5/e1l0bGGGWIholOXP3KBqzcg0PFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX8vw6pp5T7fRU
 ICqxFJgHK6zoMxHC6nopSarBvHXUeSGtGl/jYLM2EWBOMyBXj7v9XFOuOMv7WPH6f23jf2FQyTP
 8n5EFOs1sJRWLklppqg2CtooTbWNaek14zEeb5S8qV2umey5mq7llU+yxZgD+aetPNGk5KlOWFD
 pBEqImmV+RuFRYc0rZsx5c8ncWtZ48b3zOL7D9uSAwV0AQ5iOcb0gJhB/n1tYlMyZx/NuL3r4KZ
 rUm/sp5JeOf3E6S7MWVWNknwyjYPlhXoi3bA5bncMQlJCIBkTGMebpgUWVF4FNEKK4mutkT+QFk
 y9HRVgI2I6om/B/FIJP1MLPjm1XiMtjBzg9J0SaCy/+iAuQeTteMMtE4JmsVKUE1qOGpqMO/TS5
 TRc4pA6+3ykMQyjeEY8TzOYmIrT7DF6rTviZXBJ9/xbw3nfaWLqE3pZLgV41R/zezI/lXG0Gack
 L2mZT31/KogOjhy/52A==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a3dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: reto8e94DwMLVPSQmPHi7sSIB3yUs_Rf
X-Proofpoint-GUID: reto8e94DwMLVPSQmPHi7sSIB3yUs_Rf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:35, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930740;
	b=mfeo5KxVQg+/Id02rkN8zIxkkblEueGsVUWImIIKEwPgIGjwqR29jZG2I2tX99TB7bIL
	 hxnAO8yAizif6faA36y7jKsYFUbGqY7b2pmr1uEF9iRuT8xMjTcUytmwbqc0SRQ4t2Jm4
	 vuc03wYsCuzH2wnC8cvtmdkyOeQikx7eCEgzIC7HyqToNjioxl8TQKVFqqCrYHH5wolBO
	 lkOtLMcl93vuHVbRWJE0DcLpp+8HSc/HG7pNz8QW2grJ9hnUnB8itlcU9VZ0NRTiZPxVQ
	 zsrI0lAVEFZfkIlTycxEHXR4D2YsuQuaxrarCk29sPcZXilAlP3kza8LN2N1JL29PPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
	b=cQoPFyBriJlKeq6En9HjrO4zJ9G5q/XJF5S6NCoHJhvh3tAHazXdtO/IaVE+8A7yztb3
	 VYYq0pMbkMcid24j1+isFOTN5zgEO8UoA59gYtwWP0lKmmsTPNaDil8OnOQSC7E6ZvLNM
	 pU/Z5GqXPrczeSmWPWKgCDEGl1fVLxKBubfcpebbBcOFXidirU9MXlZjPrPBP4X2lpOGq
	 z8VC6Xz2SuJ4I0Lpc8H6TKzCQNT7WABRcNl0mNh5ijJqjMVoM7nQ1KzjtCW4KK84Z56Ue
	 eyJEXdrMBHKaNjkplRg2oJMlOh1eyS2PISBRB7SK/yxM1T8KawhAKX1iHTpZG1qnvFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ff2/wjmY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F52606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F52606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff2/wjmY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQXVs4169474
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FmGrMIbX3U/GmFll4bp4B4R9
	IonCrAbCABRwgK+nqKg=; b=LCJy97CKcfTS8s7rGAMfk7tN762TIevSlxFaIfrK
	0kSHf/kxSmhdDdZZTSArEA6HsJDigvKdLDhk/QhLwLeoPy+yvUh36qCdQR1QV4o/
	p/sWxIrR9Pi6Mp6gFsuHwe9u25AxRpRrlAhFA5y4H7nBZnGAPKmd0k+aqirvSAjH
	MYEgQU1V7HEBByT+6agp84N1MVrRXssFbtwW/SF0GwFJcQvF8g32N52ZGwb5uEkQ
	K/MnfrFuhJ4Ydm2lFbZU1UIoMn4rNva3BX5EzYqYmGKsIIWlkW+tHf0DxpSr+MsU
	WPc5t8Oqyn2WjO2YAZ1QPBlkhNrkGrw8ouWpYlLXigb8Fg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve29na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:52:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so7681358a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930738; x=1795535538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=Ff2/wjmY7nbtXRCYKKjVD+UReHwpw5C/ZDgnqbX60guWJgvZf+fOKaSZRiJS2NIpXm
         Sff0sKMrrqnzX3rUkS2pzlLQF6MZM1Hqg5B3NmXgaJUMrdk+KNj/lV77uk0oYktxpua7
         yeTSvtLOkI8RzIdN+zSZoY3uctv2pU4OwZH1wmkGb6XSojrpF9WI38K1h+5zwID7UDu/
         NIHX1H6DZKCoLzQ7WvVdnJ17diNc1F4P7fxzhFfMt6NSms+uqOYOwLIDTomMuDlmQ9kQ
         MH0IjLhtAKNVyxQT/d3YBBwLGVqr6/tl/mZpPVbB3iYpHA5S0bwdiX3hKGKbQHvR+JuV
         O7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930738; x=1795535538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=x4vOBrmS7ZP2nPq9d4IWTxXv0TnRxF5NilCvGE6YCVmoN3sE8DsUenRQPHXIOKdL85
         HOhbEzl0zCL6e/XOdACyrk67jYr2RfhVQ4rz2vkdUypHeayTdrtKvELkPqH/Z+ZCw/6Q
         VyOv14QxfSVLsADiSXYadWgkG1Sx/w3FOaZnq/eUEOBKECGeeQzXMN209Dew5du9nnNI
         Gwh8luw6zE5hLSNgZeOOABHA/hG77F6XEWGCjEzdFz0bBuNxaUdtBpgylh8/48MI4NTN
         EEzi9yfG9879giYvnYUWRZlaKmzsRU/F59C3DlyRnGsfTFvBUR8EQfarY4Qq9QrhwSnW
         3UtA==
X-Forwarded-Encrypted: i=1; AL+hErF7m28h9fJcO9FSBUQMyYpFfwkGZFgKasRcyL5LPH4uxjNv2STPSz39UZsPwfIQbx94gCHI9+wgxtEdkGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LHiBivgXFDlcYpK239Wy+q71/Zv+CvnELRC4xH0iJmtqEelU8
	EpBnEnwsGsRbr5xNd2Gk/Yp058uA/0RiyuIgZCWMFOi8ZMQjgb4RQJHjsWS+tQ79SH34/pEPizk
	EfjxNUZagUulb40wQ+nMugOigJHzB+ZQ2UKgoH7vJI9g5LKXHW4Fh4f2yqZDTYn2qs3w=
X-Gm-Gg: AZFdTZccRfg6XHfqbsVj9Vv1XWVXIkgdemCOAFIBFBuFS/AOwGNFImuUuu0+v4PH82t
	MLSi+q/BX/nPrGNqLYFva7USzPaFfTKGisH6L3NQFMB5rYq/uRNEJXOwpx9lO8PtluEY6FKSNCW
	nqeH3q1K9pg6Q/0FM+B1Pwl3NLt3fCBLWsfDf+SCtVBnQ/Lg+wMwS5pt3QCxbr5skFh6mugKu4d
	mo8Ar8kAfQWVkFIRXJoYObblpwA9j6Fb+z/KNN+/uikAkJOChIpmi/3cKmraGpHW85VFVZ7p/tj
	s98ioTInOlnOOtHb1XLK+p9G5OBM582IYKn26qSaHy9cMuvXgw1W0+zheUTzs3LznayRDyocYyz
	kmsqGGcQnaUcxtA/Ku2iDG6Au+eFH4g7YHJ9jq10y+5/5G5zY3WHE12eBj7ZfPGbuBZSTwdJ2ww
	Xd
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710834a91.34.1794930738170;
        Tue, 17 Nov 2026 07:52:18 -0800 (PST)
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710809a91.34.1794930737651;
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac292c53sm4601441a91.7.2026.11.17.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Date: Tue, 17 Nov 2026 21:22:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
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
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfXwAeOIPOpFDxX
 bFYoU3PDHEO2tBoJYSE1eN4GdLRdLBuweWUjzNs+F6Utd/LWCOmVA+C8ED45sMa5FxrGI2PVvDC
 OBAMapCjAYezIz0dXWsJRJLTo4IeBh8=
X-Proofpoint-GUID: 5JW7x4fwk_t7ypO8MTE4UlqENpj4fjLf
X-Proofpoint-ORIG-GUID: 5JW7x4fwk_t7ypO8MTE4UlqENpj4fjLf
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc7832 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mipXywydoeeVaK3_k7YA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX2qxS3V2e5LMb
 N76plTTtZmCR+Ucr8LboXiITkZN6BaVHryPm2OqG6kZPyffS6HuUDN2H4Bl92Mv3PwCyF2joDDG
 3a5I0V6zwW/nJB7nUrQ0HVe9qXw2NUS0fECGkHWt7d6SEZ0T7UiepVCzC1YbkvRtC3W6zf/I0J8
 h65W01aP2wO7zfRzmJSPmdmfIU1HPv8y9CUOSSHVBinjooaQ3kymoFhVDutPvx8ifu4y/JN/O+5
 qx8pTRalm5gXAVKjYLC8tcTQpDJa/p0luedcH7lkYQEdLyrtSM4ErPmw7mXN4rWOiyrSnlsKfhk
 ZS6s7lWtzJ20VbZk8FU1RWqH+3f5fPi2f05HFr2v7ZZ+XosgISXbxousYPh6+ONfj3KKaPwJUxh
 yy3sMVu+v2jScMtl9KNQkO0RqAnYyGBgMDLy/T8MW/vcvyAJKsh1ZmlmNgYmh6+W+HBK2eRj7up
 AD5oremfX3SBrPV8yLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063

On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
> > qcom,pas-common.yaml limits iommus to a single entry for every PAS
> > remoteproc, which is too restrictive for SoCs whose firmware uses
> > multiple IOMMU streams.
> > 
> > Drop iommus from common binding and let each SoC-specific binding declare
> > it with its own limits. These bindings set unevaluatedProperties: false,
> > so a compatible that does not declare iommus rejects it. Declare it for
> 
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

@Komal,

Yeah, this patch should prepare for the 2nd patch, so ideally this should
be a no functional change patch. Any constraints change should be a
separate change. So, ideally, this should be removing from the common PAS
and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.


-Mukesh

-- 
-Mukesh Ojha

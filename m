Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3B03AF66E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978472; cv=none; b=qc5U0/7Wtpw5N9lSsuzfLODgaQx4lfZvRq26HbAbMHUdWqDUqMenkoaQMwE+n1YVs3S+eId+rRQ0N97NH3mBVAE2SrgRf6B6QUqAfTYQZi3GGBx8O/tWcS3jvePDtgEg8E3+i6UHDUSgPbg877PFzhkFeegehxzzA889UpPX3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978472; c=relaxed/simple;
	bh=cvH+3WuyEr47wv0KGVgUlCmeKmek7sC8jywD80CvJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCi/5ApSGIQMGcJkCJUrW9Q3vxD/TYw58mfubqFaVZLnTGNOzOTn5bUN+ehFP1J0jms5dZ9oNOqAf4P7OGYM0qgDejuZ9WTy9/eWsm6aV/e48inLJ+y68E5YC3Qno7eiWp4odLM3lviDlsANRaFFDEizmf7B4J4sn6BQlgjH05k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1/2pkcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTdSAW/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1/2pkcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTdSAW/l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A3Dc1458726
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/XiM1eC4dLtplLQwP0/XNULh
	NoHo+cmbZwnS6s14+1s=; b=R1/2pkcEdFJGNqDx1lYarEAxY6sVthU547XrDWWk
	RDPJJgwyk494ayoml09u/siMx4VdzTEjvj5It7Z/M75HOXMuISRVEWJQhV7UIZu2
	NHZzDYhnzszHD/19AGX5T/iYUuU8rKUj/jTrDOZD502DsulKxe+JWS+WVq1yd79H
	QcbXSVfZoD5sEdIYYnczNzcDVHbAKQXME9RsZ78MkPnnzmCNWoVpPUeSBrFFCCXD
	2Z/Dk9WpfpHLPgmzsNg9/xsZJOzZHkpQiJcR08ymHbejbB5fVmcelAT9ZNWauEaH
	3E+Su1axT86dDF6xvVL0S7KTgOJQrE+H9RJ6NOX2PdO3UQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v9ck4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:14:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79cdabf7d89so2982478137.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978469; x=1790583269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=QTdSAW/lWOYyiQ9oLq8fFxbEps7GcGzxLwaOFoZ19wrV6SSFM5uMMAgPW9uszxuW1P
         WHJTqSy2kdGqurpFjwsC1s8MS2pXgcz5SIulyS5hZbZiqTy2rOiWq8iOeFEVDmm9AccO
         RV6r7+/aIVJtOnIfiIIO724l5RpLFX8cWUL0CxWAPCcCMD1nd4dWFYbna5aDUWgchI4h
         Jddh2pbUUBcW0H/W61NFqddGR9Bwj03VOwHozysqbsuRC6yF2CD1zI/1x8RdEmGJ7Jk8
         yfbGOmIkGFp1KFmwKFADftX1HSTwi/4ZVkW5UePmYZ+91+oNMM4SvYFBGmyfv2AsJ9Ua
         zgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978469; x=1790583269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=XblqapoAiWVqC99VfwwRbxllv4QFm/5FdvheRYBCs2ccbmXWrozTRaFJ7ISAc669YP
         mD4QYgEPjfmlFrklyna46lRnZU+dA+vxMTLLplhQYKHr/V/X8XL0vly9QK6dpqfSer6B
         NcMSLCPOCZvNENadSj65soNpfhub0DC5lUttoNO0lgfvwT7syHYtzAgCDdhRNcjIadS5
         N4RXf39H+GIhTu7tGuE35io4K3CHFi9rFLIWe/uhdt/kZlOC4uj8kMkqwwOwZZlsRWKc
         NXCpZqUnMVOl6KIU47YkUFYToT/nEPDqmvEJg92LUiWtYJOcd+/YkqQ4ll2CQfWSFgHJ
         nWRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLhLkssLqXlZjxpL+PydjJsouHsapcUuZDCoqcLm74UYqn8j+pIYnxk4JXekNHK6Cw3kDAFv0JY/tPPD0=@vger.kernel.org
X-Gm-Message-State: AFuF++mQNFeUO/uwAOPGq0Pb5k44HulTBd+kKZi8MD7fPAMDE9n8Yv6D
	gzf3tdP3t2u9WMqxGkVtzRbo64s16jK17wTruvm9spCRMNFLtEG2CuxAn2DHWfpCOtTJAPPNQsY
	Fae+ht9RxvyaqT8/fEhdVF7/sevVrl7AL+RYGagiQBCToFY916RQ3Vgori3zse9Rz28qdCWGPAs
	E=
X-Gm-Gg: AYBFou06Z44ByVA657f432FY8+vJ1FSY5hylmqe9CzUhzL4aSTUmMKx6y53pPqpKTNw
	tx0JVvGE6st/Id3hNgIvheFNoGrQ9RNn4lxvxxzhI84uIhfakYjg9ILBj7CkNljKijprhppQsPC
	7MuPdLIib+30ilqyD6ncfwzGUDgLJhFc7pP50ZSe14Bro/N4Gw+aWZmt5NQE2Rbi7L47xaeCMDV
	C4q3+9tJ/JFFQw4GqXx4OVsYUzcLFvpsofUH1tQEG4uuFrBAyMC1wkhJNm/2RPJZK/3c00sobl0
	AvI/+ffXH0Sk3NuqB6Hf7DKufP4d4AcBiNZXUY9qzFO4tYVVse6cqVgHeOD+yqAkHypivOrtR+m
	f7IzMJFt8J0RCm0o=
X-Received: by 2002:a05:6102:3e96:b0:7a6:cd3d:49ad with SMTP id ada2fe7eead31-7a6cd3d506amr2175049137.7.1789978469179;
        Mon, 21 Sep 2026 01:14:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978149685a.48.1789978073021;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm199397265e9.2.2026.09.21.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Message-ID: <th6om2dcxrm2a5kjn64ufunlm4zoubghdcnyvw6ll5xrszegqo@veekszeed2bo>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0e766 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: _pd4ubKprp-JzE1GZbSpEokJBMuFeRXo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfX83hBfamSTRlX
 nDzJ38dHflY2/FLPxCRRcvpduMfjyDZJS2ClvpvxEMhL4jMX3+NLUngbmcOEcqZ7aCg2L/zlUu7
 Jt2eDHA/DHcd5BxyMCP7kDsFO2MO0GE=
X-Proofpoint-GUID: _pd4ubKprp-JzE1GZbSpEokJBMuFeRXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfX2/yGH4AA8PQE
 wOMs6uBurYIZqgzkA4QLJigBs8Jq6zoVswYKA2IFxHLIcxlT/WUlzT/EnMJOZXWg8kOUG18TGJR
 VJWyp4vY9UfPg4v9FczRhoMs+kpyS3HVmhCyEMGe4vOD3E6IKOFkGwv7LswaPV+GWTslC5Gd3UC
 +THAC7hzd/I/og/X5RUae0RAxS4sDoEltyVjxh1GRcfeUuZZBNEI/rI8hnvuWTj05cNhSM2MK/M
 6+RP6+6F+hGKj3hz0/AewF5mhYuar4GcC5YHO9A5vCJiggFY9FoQZyMA7Xtsj58SpAqQvtuB3m4
 KX0xOCCt/l5a9XNOQJogT3NJNlMLmwUGrtRuwOILnr4kNcX3s9eaFTEk0a+I8vZMUDAmgxRJZhL
 08OfAMzbTy720l6VVV47jC61EEzbVHOEAd69wOnlS/klx12K8XeqgvDQrFSJbhGBnzxE8iJlpyF
 1gDHkVejGCn8SAX3nzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210118

On 26-09-19 10:14:57, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

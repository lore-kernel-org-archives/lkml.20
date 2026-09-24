Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56347AF5C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252486; cv=none; b=XWLU5GnFYRR4IPSxsufGVNz5SMfdEPWoy67iqMCC9ak/F/YBVfWsgKs6LdfUim/5sPu6OrsF/Ft+RvTIO5nxKMlXuZZQBJXnglC2fxAmbjt9nWMk0yDAEluDNWWRBKjHX02zw17eghu6YBjbU0py3wY+99YKmcer2Ee5KWk6A60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252486; c=relaxed/simple;
	bh=/oZU2iXNo+CbzykkqU059B60grjKuzDMZZXc8K1zOLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTi8RNvRMTcDmA9IZs7NP8nXmRKSEAy7etjY1FDeUQ/ECqq+8ab2gcjmIblE6OUdVesEXEW5Oms+UwDSabzdpOTK5ciXOZyENWkGHhXWayNQZHGGjW2eNyf1gG/QdWFJPmdLm8uvzrNNwjpEeisr8poGWZvA9kL89H2b5GyQB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DwIDURAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoGwP84m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DwIDURAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoGwP84m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Wum3134054
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zu8lIQBQAtkKDY5ZOhEFQeqE
	h8xnZLBa80Wnc032cXA=; b=DwIDURAf3JwI4tyvVuY6QUrW/mZl9y0NIGJk/eEL
	Rb5yiftOILdAVYji7/lCyt8liyn3bAgOvI08jlRsTczxjTW4jhL1FEWwSjnkDYuv
	6hEktigVqMM/FDP2qXdHuqD3ddtBlObxxtHuxrV3B2QJEUc+oaSj/8X7R09bX1ib
	zWYEFKXE4cVYPNrR3K+yo26GV+OctG9VHazB2lH3P4Cfbg4Uixl/H0r/+nDQr5xZ
	dtyiwaYgjeMtGgWKJK1J2ai30B2OiGHvgnjgT6bftWaqqicXbRhUvVPi3aUQJQCf
	Cy5gFesTwQ1ugzgI8fj7/osxqUihltNhPB22mWYe9kZOCA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragk3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7961a79fcd8so599132137.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790252482; x=1790857282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zu8lIQBQAtkKDY5ZOhEFQeqEh8xnZLBa80Wnc032cXA=;
        b=PoGwP84m9d6004RywTkznlOvfAAkhP9Fhyj2XMg6I24bZITyYO9gkObUcGE9zSIXGE
         fb53IwwQJGVMZiKNPbSf1C44HNKS70UPTESWQqgA+ZHyHfWWkSgO9gPSw/3Ule9aN6ub
         l+BY13ImaH8vL/2l3qqAHZcfJskyNqXX//fZE/Yc5Wmpe3e/iuXz7MGRb04thhDOVlk6
         898zEfPpmpxaMAn1c55agpkFsHoD6085KyWMkVLFoSIWUaORz1oqnzDOcT6kOzhCbQcC
         G9fIiO7D6AzDcH8RQvEwJkpxdLXzMdHQbsFoNmxG4k3D1Sc5pXcrwtRdSzxlYlcnsaCX
         Fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252482; x=1790857282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zu8lIQBQAtkKDY5ZOhEFQeqEh8xnZLBa80Wnc032cXA=;
        b=TkIbempiqLPEPKnDVGRwsB6OqWQ7ByE+7REp8k/e58OXPjFzeh+Lh/AqEJdZOhh9Lv
         UGGgx0JjnNFQiZmgjC1A56G+h7zx2U7KwsTgrM537Z9egYdPcO5yMC5LNGdV0LYZ2Oyh
         AmntDLOpPxmD3jJorFeBc52J3Ab2c4CnN5jlo5nKnymj20aTFfiwo2s8MbIJ36qJymVg
         cUlOALkfhlMV7UkqXplGqv7kkHvtnKIB1T4ViPXj5o4avJ9ZeCpxEtEZTAw3IoxOIQWM
         ZscePAz3XRtbwPlb72yCIf0cGZRL/Y9kFO402awj+vvuVpokxrC7QQaffc/abBzgDBpv
         bLAw==
X-Forwarded-Encrypted: i=1; AKwUvBx55cKcsNWYUwlP9cl6pnpMuWX9CjwurMTNWk6pCJF3g8CIdICfUkqA4BF7P0ngDsQm0mYFi/ItlJvdAK8=@vger.kernel.org
X-Gm-Message-State: AFuF++muJ8r6CurK8TegAVkHKGBAVcYZ72fcOCrut+moY0Nu4adDbBnr
	6IxwLoSIBVg7x1+CLjI6FGtvTpPf+KOk/Q5NyGIf3Zy8Q8Z0Zr1u21d4+YMfkF7Tb7PwJejc7LV
	2ufv2NryOP9vX0H8GWVfA8W3rR3cvfM6mxAj4hXjR3Cq5wQah9xhQYbwh8l9OLJ/DBoQ=
X-Gm-Gg: AYBFou3yPRNPf3ZNrP5DxbMRqvZwkgkzcbg6OmLvNI24tJjpNIyDZhlEbiV0th4K03/
	sYDrHB/fuuKskEQDBH9uHq02C0uPXuk/Il2LWbk3+vit0X9R0akiDf0IiFunFCe82phS0MJO31B
	mS6haKRhftkcusnRhNExyMHnz45PJZG32J35owaZazEnd7Gnp7LnCkxmY+vmihBmnFg8NRTTakx
	CbTuJth7NnY3ozQ/mRLxxbLOh4cU7MHOePY9mMF2uTF4vpOrXjmc0otgEoLBxKSgAB6TE7vvorA
	oj6HT89nGxKq3bXXlaumH9YcgHdfwo1BAcWSA155tsYdmuPpujAsMJrm9HKGcyCbehFl0cJ2Y/D
	QljDBCyZLgNq6QxQ=
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1088308137.33.1790252482089;
        Thu, 24 Sep 2026 05:21:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1088279137.33.1790252481364;
        Thu, 24 Sep 2026 05:21:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm16655704f8f.14.2026.09.24.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:21:15 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Message-ID: <nv5stigwlyrwgpdwo3d6ctmqfopy7tgdrnrhvfvwxxvz5yxwtd@4kis7hnqw4bv>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX0TMuOjX9JJNP
 Utgp4WmxpT3N9aP+Rt+J7MFNnf/aetXoK00u1mNRu1EMERXUobmBDms3IwaagtWV82t8h7fByL2
 xnjr7t7V/rN5mb/HdVJ5BNtn/Mtnm8CtGRB2FtO51iBTMzsUNOXot7xswu7LtiIgzmnS/yifn0Z
 5KEnODFdyvMJPTanechEiHfYA8io3f0PNez/RxWgEPD9Xs1bLmtr8O9CXy16K3ayPC6WZzZHeC7
 6jjXF3LnQanji5q6VlchPlst3DnQn4ZW2DeDeyzcWVgZuHO9RknnWFCRI3QJz1ztJ9h7x54NFnR
 b30MpzlQ9ZlbPdDMkB5m9wUXH6IXzn75s3rbRDesO+e0CH7F7d8gU0z89FVaTCEPZRwK585es8V
 muB84YxVtdof5ZQANHhbMmd/xfIeWoFM3UgREoNFHAntxDuQ7J0uTbtAEeuYmmzRGmRXFqdIotd
 4t0yTf0gQE7IIerHHfQ==
X-Proofpoint-ORIG-GUID: TcKDtHSJnyAE1Ah7Htg3LAgpW6EsVRcZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX/zD+7fCbpAH/
 tLzhZX0/xXd0UQWF7H3TiXPV4nAwMB2WNrrTPUcDtKMxWjVduqCOIAo7LIcGxYmNM5tPfn9BHi1
 3y92plc7k3SYiRDU1uAEaZruoRn+ppg=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab515c3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: TcKDtHSJnyAE1Ah7Htg3LAgpW6EsVRcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240051

On 26-09-24 14:10:03, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

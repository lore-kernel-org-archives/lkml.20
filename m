Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153683B1ED0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164167; cv=none; b=cIlxN+Hbb4edZhckLQykHbQSmmiIzoqyqgM6xiKF8wXcmVMKmOAbfQKwzDF76fjDXT165Y9QSMybHE6w23ByW1WE3VJwUSSi/6nPVtMle8KTq2dD+IEy0xh8arV0XZxw8B8odj9BfnIxJfeqA+TDcgF2j7mNIWkDmxY+N+ad6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164167; c=relaxed/simple;
	bh=QBU8DfkTa6n4YbEvZzxLevyquP+Ka5QRnZiV3dhNKJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDAzh58IdBFyGaHm3FeveWwZwlWIwiE25Cp4dsQQVcQwl7s84/BVHCVQtJ4KCGZ47hMppTAn0G5n8LXvYQutaPcuVZHfKVRMq7xLsrQEmT8bLi6dGLFruHO9DVO76QN5qCJ/8cmOBVxTslUU9x1TvjJTy1TtQ6wIrw866pEbvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1BM63yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tm6saH1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1BM63yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tm6saH1D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xZkV3427259
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LyTcuGUL0Z/mag6M9SZrK5m
	2t3i0XS2stCBvD8t0aM=; b=J1BM63yKhY+4AC4sF6IWQ3XqowqXqAO3d8Rto/Cv
	y2WbTXXMTttJhaC5i7pH+8vYxasqVQAUDB6mQAviLlOc5FqCS3x0r7NjbJgN3+yB
	cMd4oQQYJR39mGpnf5Z5px/QpVQd2vBkRbYuNtIpbgBELf5VsdW2rwWYWBAPeO9i
	SiqOgZwpeKJfqvMvJQ+rcbsMnzddZFlSrU7zEzRzEc7dP3ZEnIFAfaf+EltDBEC0
	QhrvH94GOvLgw+rj7lbXlpfD8RLLGxR0fNqKG8iPVga5W9F+3SnnuMPZqW3nvAIV
	hID/ztustt8Gdux8ro9dGDmhLsrWcNIPwdd+NlPxdgBWxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8bdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so415919285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164164; x=1788768964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LyTcuGUL0Z/mag6M9SZrK5m2t3i0XS2stCBvD8t0aM=;
        b=Tm6saH1DtfzQzTgTXCl53TIlFkf6Vh0bDskV+n1Aj++bYlDU9J4ne5LGJyeZtBMoQs
         LUX8uJ8E40sOmL8pai0jghfq/JtME4AxZidCbtEnahXns2t56MfD52Skv4cQnVpMAu5h
         QcZyfT9Ff6PgEBmfF03TUtBz16XSH1eP3CFLgTLJaexI9xy5eBQWqOUnKNlM5orvt0f3
         OrkDn6OvDgUWpbT7gIMWtpX4ekiLthzanrIi0qi+jKVn9lA6Hy/9PF+iByD5ysrHMdeF
         d8VJgJAjeoH/lfW5kOb7eo0HtRM/kkjp5HNfbmJ9suZdDv4QL01wle/bjh/Y3jOpkjyS
         RUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164164; x=1788768964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LyTcuGUL0Z/mag6M9SZrK5m2t3i0XS2stCBvD8t0aM=;
        b=s+23seKeN/BDuoFEzVhqHd53rkI6oPP2e/FN/7gr6ajtMpXYtHktthQpVtLYbwcye5
         PVmP8g/sx+BAwe3KWF19TQAJKG4rD6LoISUlP+mzgBmI7zsBJP4TfG2nRUSOrSof1FTi
         tZmcPKyye/buDkuH9U9pDLlNK/+HeWRP4Ee6fcmzIK0v0RdHEoAYp8yQtpuVZXLjAhRY
         GYO+gTgyu7o1k36fUEqLLjZoivOohfTX1ZY2nLYs0mm0H/caTFpDLay68IL2CkVzViti
         q4zVqiyZWNfFQb6qDU6GJOsrhesOVH+KmzH3r7ICBhjrAKNMkPKt6sSVm8mGqJep9TVV
         LgAw==
X-Forwarded-Encrypted: i=1; AHgh+RpmJoUZ48G51ri0isCV64pd+xaUxMBcdYh9g5kdogsio3fqww3RXGPWoviwt1bPIzJlBODDFAVdI7NR/50=@vger.kernel.org
X-Gm-Message-State: AFuF++n26OnNHJQFqIP19FWmmJp6PnS7CR6PY60i/o/kbIL/JbnTKf6v
	+Rg3bESwWeu/V+WRlMqx58Xyp7pSrmYOOrVgxL172Nockoz+4542143EgAkqQuJM24G63Pvp55H
	QGAG914J6wFXXZk50xNyB4AO/BwC1hpTJ5bmqlmnpU1zMY8yo9+4NrlAZvhHW2NTQs6A=
X-Gm-Gg: AR+sD13s1jxFPuRYmNj8ZomsOyBue7hpKPhMzFoGf0bovUvEDm0qpff44vjMFyGq3Rs
	9gBaZQiSli45eMP4Rt4qW8t40EtwnZS1SKbeFTfeekEuXBHPJaHMC6bGjEY3Sejn0VR5rRVk82V
	6SYYGm0kplLc9oxiImwMTxQVbY/hRF+WSpryKzWupeYFvn5PhpkvPfSOYv0E4efiQztFto2eW8y
	vHHo0c44iZ+3+RrZw2w1U/5nEk89MwPwZqvp034KepwnevtA0o7qaynJq/9WtEVBrt0hPUl4Tr1
	qgAez8ev2zFFu5Lw74WXQNe9e2xmkMb336Djo1VbU8zIDS05qtgRdIOl0NXMrN+r16Z30t4soYG
	G1YWYioqb7b7RmQ==
X-Received: by 2002:a05:620a:8811:b0:936:9525:e952 with SMTP id af79cd13be357-9391398ca1bmr2730073885a.41.1788164164201;
        Mon, 31 Aug 2026 01:16:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:936:9525:e952 with SMTP id af79cd13be357-9391398ca1bmr2730068785a.41.1788164163630;
        Mon, 31 Aug 2026 01:16:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20713sm20302271f8f.21.2026.08.31.01.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:16:02 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:16:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
Message-ID: <o5fxldighgmm6djxauuyzv3p42yj3q74e37msw5ephzlgnql62@ptghyorawgzr>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SPw6gguSYIeAus_nwaGGkEB5egcXHU_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2OSBTYWx0ZWRfXxppeJ11JHDhR
 2HCjQsd3ZRE0y0rH6pHE8bhFQn/DJ+xb/zOb2ZCroPakDjhgR5+MmB1vnoUMWrZrDzRI+Cr7BHq
 fiQg7XQkzjuBoQWsBuAhnf+cMuwV6QSIM9n3tL53Ptdnb5LC0wkpParHBi2vZ77zglJlZleUH/y
 o+GePRuhy4ZJuof/h2ZAzJpPQRasEmHSZ6R7aPbcn8rnMfBB1Sv5Z0HzALhFkR9eN8Ky3EqNxDH
 B7L+pOGxUqK4uKLE+x8HQF06FgbY40paLsO4OaNvGtmV85oykrUFa7t6lSquGKHYGnfiAb1ayp9
 IbhGU6QikAO/DTbO9KGleQij7BJNnmFMCk3v/8mk3APdweFQ165SM7a9wKvWC0+dkCvwkldiwTy
 Dvz6gmZT8ixExdjnfyw+u1K8fXgMbkdVVowf3WTKiEcI68rQunJEhWMxz/cpDqmIYWgaVNABgGn
 SBzzUhmfb0eIBCd1alg==
X-Proofpoint-GUID: SPw6gguSYIeAus_nwaGGkEB5egcXHU_m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2OSBTYWx0ZWRfX0hSzFNBG1xTK
 m8oz0OApiQrDTXjsuDo1MuUCZdxUgFzP4f4AWkNrU9897b5nUQD/ASWgaVnDRGNzddIDLEUlqNI
 /fYakW/eM8aJNzzz+Zl6+oKUsy3WdkU=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a953844 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GNrPpmwhwOQ7cWpVhzUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310069

On 26-08-31 11:21:03, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.
> 
> Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
> and describe the board regulators supplied by the on-board PMICs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

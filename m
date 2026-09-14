Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F33E7631
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371385; cv=none; b=EiBh3yl39dFrtRMmRAuah94vc1PO6e3zgwHaOW78fESK06/v4On0lM3tdzmoXXr3ver3rCEXY6OZDYNcmvRMF0TR/u08e6n4J5k/NIrsPV3sgSV6gLvDrcIu12YvObIJuQwKP1c5CXunTkq2MLyWscOVeDA/267yBvx3ZI85cAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371385; c=relaxed/simple;
	bh=B7MHtkv6/yD6oTv/xPRXmsrHOkvhWkionP1EqQHyp/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4sl7NDVOOeNtyMTzr/Qhk9HrWb67JIijOwjk0/S2EobsrltDOkKJb7FjiuGqW6x4t9zAo2lLixjyCRmDPofWV4C9zXE9b2SfekBx/ZjoR4bSnVma8VlaQ3Y8zTxdxXH8qE4HB7gqOFGSzUmxtMKQk0w0M3nMtfKG0r8VsMJ1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2xu3dz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL9zeUvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2xu3dz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iL9zeUvK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5imZA4057530
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tFKWBAFx8JXV/7PZgw552re+
	8TzKSIPCxGywk3k8Ucs=; b=g2xu3dz7cebbLfMA6pxBnlkEhqSkknPIoV4MWKuV
	qvx9n8w6uG2HZuWn18X1ZH99EWGSXtYdW1aHLIDRkrqSox7r0kIEQY07Lwv/HnE2
	ziC6W8TAIJEBcgdLiUPtsXGU4MTES0DkdoJxg8UZwXibvsGyxGMmIlOzvOEMeiN6
	PPKyksspKEnDnVNr3CUmB++t6vNlVvHkXMYT3u8S8HBHVNacpmezS+ULfNMz2vHz
	8+egV6i0Hx7kJsPclgd7Q+N4/Op69xh+Us/dh8jswyzhE2WPHxD2mrsdJJDbBf4J
	pF84FTCAXRHKHt+MSd/o17S92Ah5u3frXTA9TnEsZw/HSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssc8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so462809485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371382; x=1789976182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tFKWBAFx8JXV/7PZgw552re+8TzKSIPCxGywk3k8Ucs=;
        b=iL9zeUvKJgPQGu3KBVce57H76XgHj11IaI8zpIR7kOMSAG5O4EvKKqluSgQbBKFGc/
         00sMGxSaZW9w3f+AwRGm6r5bc+UJXw0foSSRFPtAtiNnb5Lr938lukPX/J0R05B695ew
         nkK5K+PDMAuvo1IKwi0hPov2dG7sQLVQPZNVkB5NtsvUgwcxgdLuemKcUqODVNcEkl/x
         878xaU4lqWusOMGsdRO68OQ7KXbkpxuO8PEGvMxlHSQ7Oe6cmsOA/3p9U4oPs7N5YZPp
         8GuQ41GNiqHqRwDOJPfCetsBGYOUPQI4GGDYRy8WYFPheR4u4wkbDIXef1mpPDQdz8nU
         6vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371382; x=1789976182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFKWBAFx8JXV/7PZgw552re+8TzKSIPCxGywk3k8Ucs=;
        b=geJlDL0FeuGnxeRRinCZ6BQf/o7GBxBnI/yC2eDa/4nRzK2P+iYl8uJYMNj9S52szA
         bwMVO48Y+XquT+CXxua78Xz3Ep3iHB6S/QmUQj2hQu2wDewFqQDnB5sUqfYDod+avkLf
         qbRw+YJSe2TRpshMv85LRizMmtLvEuqVPHlkZ3qHVmqlsl/4GgWumxSgetfzaW1uccPB
         keQgl0vy3ll5+vFVSXIAz8xeyZCUD/ZueItwN5f10whzLSvR2c7+CwgNWTJRZMM5km3P
         DyYxvxnjHTrXFdEMGCY77cWjYYryKd8fPU6PFxDvHPtA1jdzyqRNd2w4v7IYcZ3Tprma
         /Q0g==
X-Forwarded-Encrypted: i=1; AKwUvBxOEz5NlYOJicAlxtzZPvL6GKCCxoEpvvdFAYefKtrxgsK0aijDRrzkJ8qdcznIPZKEqFC6qJg9qyr51mk=@vger.kernel.org
X-Gm-Message-State: AFuF++nhLx6rnAUgJHeAsneZTlbf8XUNRjNchB47V7TFFtxJwu1H+ULY
	PBbMH3EZlwi4Xz+yZAqvizoZCPlSc2xZjhKl0OuY8a80cOjzwE0yVE+/SlQXQLnMt0n5OQJkZ10
	5vCSAw5S5ABNKaczjCc9Zn70ajvUiFom/6/CCqMLKYdRxzYQmfoeUa0Jzn+EQ7aEko+Q=
X-Gm-Gg: AYBFou1GXUMabc5zZNUkzmx3KLGWvjoCL6hzathdqK1Q1qdi84blhQiGzZWd7nbUo1t
	dJroa+CLuFMuru7aYhKuWJNBNaYyIjjwoH/fbkYtMw2Ha5ydg+VQxMx7a0RZoFbkHwSGGN5GR/M
	2WoIXjitza7xFRKCEk+rLJ84fLaaa/3v3LM3mfIACIxdGqkyGwSbT+bLckyMflg4yCZWpJhpJQ1
	+7VnFUJbumfnlBLSwJjnA61QkSn2Mss8sNxVQ48J98JMJAS2vwBhaNdV5jSozVonKvRFGZPgfJH
	13Rn2GlqhRBA5JrTBWX+fQ74+zcb+7gHfJyYcCpdkfyjcsQXU+li1FnLyhE+xWiPUtPwnmcb+gN
	1RGqnPjuY3Cxf5A==
X-Received: by 2002:a05:620a:6f01:b0:939:a45b:76ee with SMTP id af79cd13be357-93a2985d12bmr206229785a.23.1789371382336;
        Mon, 14 Sep 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:939:a45b:76ee with SMTP id af79cd13be357-93a2985d12bmr206225085a.23.1789371381764;
        Mon, 14 Sep 2026 00:36:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm168052815e9.4.2026.09.14.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:19 +0300
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
Subject: Re: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
 names
Message-ID: <fxziap2amutjmlvqpsne3k3iwwszh64z335nymbpmh2o5vbw6o@oa32rit7odgw>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX6ygYsYBgqh2c
 Ahvaa1w3XYRaUoFDU0onLi8D6fskXBmGt12vYj5yyZ0siNfFbZbpsa+W0touA7x0VIbNvhXBrBH
 RvSWQMGXKLi2H5VyKM4uQ2fq4kkJy01LukOXmHWP4HW2kcJ1Axc0pk44IYbrZeKOYJ9kVIfFaXc
 w/MHS4h84eJo6fExIe/nR/UmqfxB9CV+6fdGc5IZlzW4uSFv25gAMPAQgPRCFK4R/D0zZ//K4pU
 91QV4F/bO2GLLQaIRZAn1ry1Pl7/sbwR4b+EIjGHM9a1asvLoxMvY2ZXs55E7QsIFEzw4Z7VaXn
 ctYCYQjtqSRQH7rd/c9O9FXaB/szPycwX0aDsIbywJmTfsEoRXUttP2+6ZKzbFX1DXaSBRgeaUX
 bmyYa7mKB6U1HIQfm84S6rGuWXRTeFccKg6jTs8B4QZhtVDuuioUIp3Zwt27IHeApJyzbapPJoR
 HL+WWK+wsBdVs0II8hA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a3f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XIfsIMTjn6j_flfXfjmdoypNk_nm2gqn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXz17ohlebKG2/
 1reMnfaClT3Sgxl9Gcr4Y9WskvPIZAl6nce6uQk0HpEBjuYn+mnEB0YR4WkvlePe5Y0nVCiAWOs
 RMURjD3XqvYmp5iVlsSdnDFQ8zIz3SA=
X-Proofpoint-ORIG-GUID: XIfsIMTjn6j_flfXfjmdoypNk_nm2gqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:37, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

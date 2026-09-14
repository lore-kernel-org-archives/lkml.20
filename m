Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314F3EFD15
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371549; cv=none; b=UQLY8gnTuzjnjGdlTlpwW/Scv0cT33KQLjMloAWPxPU6VfOXI99O9fjFUGBdy4GLAOwqCFM38zaOm+fj++xBYk2zrfAVNM+pcklK79/V5w0M1pa10ZZqwgI2uHIo4f+w/3iH3Iu2R25CsYKcZYYPpglznF3rMOWlZ8ikMwbgEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371549; c=relaxed/simple;
	bh=lPSKOLF4HEIse9WLPJPgQBawOJu8EfJdJjYwQwdsMOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCYElPvvHZUb/jJ+UtYD4Qe1dpHhVsF5TDD4xZXBk7PTpP9m2HBrLy5yiqO/hUp9+5KK9/kf6UUkY6PBoNBTjO1B1yMhmT06SauPrNCa7gXmNe8pqjYfpdxS8OhGDq+aPMd+O3CjvatsCiO4FceKT7cST2DSu/zNDEiTd+9ok8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHFKCBM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrTKHtEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHFKCBM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrTKHtEn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ildO3901090
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMOipzmvJTy8aZrG+SejtUux
	PskCA0+RbWPXbMYi0MQ=; b=nHFKCBM5bztJvOS1cIRinlPY4oqCTDHAwkrDPwK0
	bSCamQ7H7j4ESPxESDwuS8JAf0qGi8HSKdkDQP/n7lUmAz1hsxRyCbYMW4OKwFgJ
	/HcFqed+SLEJfhalQtuu7Ms4oKQ/PDvH7Xw6rt3Y3C/s1p8qOiOSg7YbO5/aZHSY
	5c2kmNhBeukNSZbmPgrCI2iCaQqVpyEP3Zd2qOSzN4K28rNQ668zyEVP2BJiKW2Y
	NRklVcl5W064oDm7//c33TEPSfbf9k6B/LkpmJlCSc0oBlE9JVYrvJfPX8+bHo2w
	5L/lluQzg2gSXy7TJ5S3vjXFaXd+436jQnyQVRSufpqGHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so555622485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371546; x=1789976346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMOipzmvJTy8aZrG+SejtUuxPskCA0+RbWPXbMYi0MQ=;
        b=HrTKHtEnUWunppApeSSloO+utSIQOELwpGaL/XLMtyieFRdgU712TOkiWSyv7+xy3P
         6tO59OXJLFtyQUY6NbQ6F76SOYp19lm6p0jH3XMykUk3XNu1cr8HJWtV/n1pgMFNNT7h
         dfpV1J1+mI7AD291XajjIPvuKK6C432u3AEL1xRBQm0iVLK5hVtflUTTNzyG499tA1ZO
         XY2tW55rg26D2FLuzL55tL4Xt5dkfMP2hDBkW+4bpigi1z5yQqSk9Q9nZJSJKzSVVOFU
         pupLpCZklyDLsIhW/a8uUy6Xn6brStwSN1zFFfmOeLRKWWA/DfvwgS1qRuCDQYQ3GdVW
         emOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371546; x=1789976346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMOipzmvJTy8aZrG+SejtUuxPskCA0+RbWPXbMYi0MQ=;
        b=XuoAbkaTqCkhUWvnenSZVQojbLLYYZnaS2ebIqjkgK3F7Yi9geW+6HA6VYz9oYvkVU
         Bahs5LpB6f8zC+/dFLinuxyiMeQeS4zogtUxQcnF6y4x9GE26LpSwY9NiqUUYm2vRiIL
         BQPcEeWjGzqCvLW/zJtuda3EWEqaETylFqAfxeXXY5vfjIkwWTbv+kjVD1YNNAYPY1wv
         yaI+s1/erHx8+jj6++bSy4fh1jxPA9+Yd2NbFK8D+TY4OFkzahEz+UsMLtaGQUDlbFuy
         2k9jV2pYPvL3W15nd44lx+sxi+kCCQSNzubuNMOAJzeUVOwrWsKPA19E8AZ60lIQM+c7
         CEow==
X-Forwarded-Encrypted: i=1; AKwUvBwTWb9dYUZjrSyPa1htTAmDsVXt1Gu82EtBTXwIfnQ/d6MPcjfnrbcYrZdb645Z2g4u2SJCIj5lQDUaTbs=@vger.kernel.org
X-Gm-Message-State: AFuF++nkLtpeeoHdzynKiRYUWWNVBMKrwlDs2coU0LEzil/XI691N11T
	7vX60S1jSUzrf8pxTWciQ7VdjKr00nDabz/JE7M6wZ0eC20WhSl2qXTxzh2mZCDLb5TMuHGuHD5
	Pe3knbiBErpT+5wq2sp3Thkd+JSfW3uU+zwKMgPCWDmuLCcn/r1tnAsv31lI/qfW2w3Y=
X-Gm-Gg: AYBFou3jombU8ziXfIND9iFfNqxxaTOaG17S/9lxIyN9Paq8Q+pyGcvyEie3Qlk3FVN
	J7N/BPY1KCiCF6/wpvUuAy1XFv7RJ8wziBHGyKesxCEU9sLMzxt+VLINEUg/ldCol2kyywX/zxo
	Lg/AfZ+Y/2pWqHjVwG8m+fooHgV+iD13dJ38fn7+zbcJGeHfxtdye+dRI+PNm3JnE8UF7jI5cfF
	tgYz8XD5yQjvEkbjyhIVyZeUOWbI8CHvONnnOi4HBF45Tz5hNvZMqV0Vfo5Zs3OhHk1TQ9avpOW
	ptebfmWsVzdKApELUU9Tc5s5my8jy16wLwPn47AV7T5/ys1+4YyZkN22/nxi2YBxIfJeFXz2XT1
	MfMoweTOqIQMbb50=
X-Received: by 2002:a05:620a:4556:b0:912:1206:ddd1 with SMTP id af79cd13be357-93a2970976bmr207450185a.1.1789371546191;
        Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:912:1206:ddd1 with SMTP id af79cd13be357-93a2970976bmr207445985a.1.1789371545682;
        Mon, 14 Sep 2026 00:39:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm168282475e9.4.2026.09.14.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:02 +0300
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
Subject: Re: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state
 names
Message-ID: <eqvy6im4sah2nlull5w6qab4llvdhtjpduhz3ujdqrswkj57ui@s2odjdj25q5v>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXwvuxNIjkqmJ1
 kz/luensrqnrX4yJGfjY6ZhcS9QgGBxxVIj/n72NjQc8beoLMdD48GbkPcf5l0O+YtutC48Fv+i
 AckFQSIi2oyNfXvlBabjm0Qt6VcguM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3Y1Ijn4QUYI3
 tGBm8xt5kjv9LC9TQ+tanaro8mSyw6H1uG70/1662YIfhOK2MDjP8fYycrsYnADizg2hi/bPhC4
 Q6Ap81/CGaaNnTftEjTykilyv+lOpw5ZbCmtdCf53HH2nvzoVF/U/KM7vkeXgLuPw7BY1CpFczk
 XvWtYfoJ1a/ugYmhpfR5srqeW08WAdxlhJ+Wscrd8NRNOQ5Vhx3RsfXbWJ3HiYgnaRVfETjyjWc
 605FTF+T4fRcMNtrmOeoTVMLZoNKe0jWXT5f613NJwsBYyJQOUK5kgjBnaGWobg8wi5x54u4PBH
 3xIPzFVQMlb77xsPkBLeF+eLWY+8OoidZrg1jG6vIUR+ZaJxB7p1hxFdK2oExkcjm5YD8BBiCop
 mOnUd5jIEdYNaUYixOL/z4q1r1GkxmD13sca4NEolkHOnwqHjOTwQv7VD2Fid9cAmzl1Th6gnXW
 ngZo2hzBu+znAKfGYSA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a49b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GNvS1LY31NQmy-MxjZHT3VYt_gixj6X4
X-Proofpoint-GUID: GNvS1LY31NQmy-MxjZHT3VYt_gixj6X4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:45, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

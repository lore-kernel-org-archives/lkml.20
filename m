Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1923F58E0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371421; cv=none; b=DVFEH5PoUjQzamOr+Zn5YDBVO5TTeooT5izfa31xrKgvQxE8bl3jsli8iyE/OU8FEpR13BfJqxUzHp4pzMfPYmvglDUkIr4o9hTswIJM7VHZbb3JEJdn8mhT2qA10XOuYrFOUz/Uff+HfBS0v+j0BYbyQxdcuZfgSnF1YkgpQ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371421; c=relaxed/simple;
	bh=aSsL7rH+5SD4ws07ph4c6ndDoV5PwOr9X6Do/Fjxf8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2nRLZa+R3evOuv8ccC5fNpqJAac94yc25yoGyRU4q6NhBVe0VYTp06Z3+2g8QvUvl66NI6Wr6WDgFSsyT2/FfNoSQLH5kcDKEANlBlgKvkg6Qy++ym+7WAtiFnBBPnHTqfbPikw3YIhm6r+/NpX0r3Zrzg35M+D/YKXqXPHUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyaQNs4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWJv4YRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyaQNs4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWJv4YRv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ipq6793595
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr1yzaJs+rjZLZHda9IeRhrD
	ixH5hc7r7hGKmk257AI=; b=hyaQNs4+KTzwP5CIMJJlRtLzjQmC1VvZ8uNPGjMG
	D0RckwXCbSfglMXCRPU/oFXInBoYlsVbuhGDoYlSKix0phOAgUDC4HbopvV6fCq5
	t8MVEc17yrdEUXRAYCjQ0z5SqHJY3dKhBGIDxdwnoB29M2TgxdkrMnzVVnahoANp
	jsBaj3oKAQR3Ou3rk072daU9Iy02JpVzexLJ89O4FdGIOe0l/9089OA6kc4yBC1k
	Yfj5hZO7ujoRyF4iq6LkJUKmWO8vOSp59rY7Z4avnjKm7qQEZvYuL0agFUCa2VL7
	tYr2phRlUDtZ86RjRAaBlD27drJoklHDlDTiD40VuOUSmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnh1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so308431185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371414; x=1789976214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr1yzaJs+rjZLZHda9IeRhrDixH5hc7r7hGKmk257AI=;
        b=aWJv4YRvIvDrMCPIq1gL0LRA6hmJjKstkDdixDAx/3xIboaCr0vbSf4CPO0nd8LhJ6
         GnYcbtZ1smEu2UKc3+3ccYLGxJ0njSheLfBSO3nyqcc3R6Jiypd8bxBBusWmyYC+75TN
         P6g0Mio53hfai1RbgdEZWlVrr71Kl6Xu/ke+6H1JbD/3edCjACOUHMon0bsw7Au4Vj1q
         wxrs91C8lOqldt39lQI5e966xEz1BDR86sTMFB1YxSp9aib0mxTS0XUovi2ytYm61QC4
         1e4UzPctZa9hKM+hN/rR2qN8Lq5rMN2xeWXQn0L9BkV7xdj4arkMAMFj1ei3JgMcLRyC
         yveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371414; x=1789976214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr1yzaJs+rjZLZHda9IeRhrDixH5hc7r7hGKmk257AI=;
        b=KtBN2pw2r6wpODsJn6/VPxoqQOiTnZibr1/CEaHrL5GrPm7Fbk9mCcFdOmv8EMx8Ef
         hpJkrn3cWWJSmWZMcbfm1ehEQ2iKjDEpDNE6kf5a8yvlJLcB58S4KsUH8M5OyhjjE/UG
         iI809MgfvBza7UuKxNpw5RxtLtbcy7hXnCOgt0OwWVvgcpNPv6dgKGVXCm6w1NUbF1OV
         loZMQGLjzcP8gMPBipRh9FmG2/nZHS47woJL/a28/ic9M3ijdvlXOXRg6m2D1SV8T0Uw
         bRs8m1DF+jGkPm5xmaAraRbRGGggDV09B8GHN03wbtb2iSHWUfKqG26tVRS14VRatKoO
         iesw==
X-Forwarded-Encrypted: i=1; AKwUvByMWPz3HPuEuGACdW05bEEOUntRiHGLLwnG6VwLG+GkR7neSwu/NNeMIrs0kQlkDY9ZbRpZyfFyzOr+p3g=@vger.kernel.org
X-Gm-Message-State: AFuF++k4YKrcHiqRGQKFfCeLNnzJrqibL+v7cvWyDfT80B8MM1f7XATG
	Ql1sV3/Io4L1JvdYjFkHJhcCXdSKY36OB3eeoa4fkFM8gqT0m4G3iCjLCkCITYEytRSCndDJgFw
	JSz7vst9nz7sDjdfPNwDaplMfyMtQ8bBeKeQxXSrE/mdwJUQrZl6sOjPPBZDm7vl6BHc=
X-Gm-Gg: AYBFou1df+5z9qPHl4fVeYmOZicTFf/r/cz8hFe0RGIxCarRRMxKZzNrAJaU//SlfD8
	5ARC3mS00cDcBSbL0oXXpS24PiohnhvHdPCYdhacv3jCMNpGqyygOMw1Cde2UvbI0aQKS4k5gQ8
	4mVm6Pz/7Tq09OwSxGoUqQancuG6PLW7i7KuO1KzST2L9BrPQi9hSeu7d8WMLlhacRc8ZrH+dTa
	jLdQesRfgieiYWjtSU5fTcy3UUrgJbmwEGhNWpNtAmDHKiiP3Qcn/kWWR7wA9xDBwd/WDJHUTVw
	cJgsaov8NkQYWer4EQB1VXgswHkgqksGxrPOy18Yk3aX6vNaGEx5ErZf0S3jE0Wu218V90ecNie
	QF9n/7wefiIcDrA==
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr182575685a.47.1789371409208;
        Mon, 14 Sep 2026 00:36:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr182573285a.47.1789371408699;
        Mon, 14 Sep 2026 00:36:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a803c5sm186263595e9.1.2026.09.14.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:44 +0300
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
Subject: Re: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
Message-ID: <xckqlfn2kld23qsslwypherdgznlyf5xmsuojv3oh3djymllpw@v5cryhdebc7w>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX7F2uya2VU5hs
 mRrEGk4B3A7zk3w9U4PYeONUfQ18PDoyTxe1CIPvEQ2t+ffq011CzYjIScHCGir/1CC91kg2CC7
 21Yg2o/2FbOrISsXoU3/6Gxfw4yDqpgkoqY6WdVbgaU+wriCCDpxfy+MFNlrEJzzFtJx2fv114W
 fmXis1Zy1f3/u1Dogijjg1aT7M2C9nJ1oe4epS08QQoFhsgyS1X+k7Y0R6o5/MK3hP090qrNplF
 eOn3o8uYBCOVskzt33MRgPppMBhljQ0wks8tBwZa49iJbrUaMxM1HEb1LZsBhOAXGw/ZDe2ydIa
 mejrUnZRUlwOKdRV3w3k7J++v4drFGSZN1J8ABsjAz1vG4K7u7oeyyUOgrbrO+rFEtHHMYBSNmR
 U6j+G053v1HzQrvYpqYsw6poE4CweJuwrBsIrHR/nSC4HdlmXRran4lvGDIDNkF9QTbw0lr34Zl
 8mn0nRHgAAaQeZqzf0w==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a417 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/Jz5QCPiAQA3
 IcBdJpFFp+hkcnS+1bbcros2rzhGRYrBuu0tCZL9PhWHgd8jA75BJ987xZxYbedDYbdEdHxxtwe
 yGq6aW9hqiH0bThg6xdbubNuoX4ugFc=
X-Proofpoint-GUID: 3iHWvsNsbdODIKZii6etYR1CMwT3k06-
X-Proofpoint-ORIG-GUID: 3iHWvsNsbdODIKZii6etYR1CMwT3k06-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:38, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

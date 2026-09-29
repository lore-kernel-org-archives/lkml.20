Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714F3C2B8F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650759; cv=none; b=ORo4iagygSO79lIfQss3ONiLUxkL44IuLo+/oPgaW/0WcWkMTNF6U3R/HPWs7oqolFm7x7WEPOJnVLfl77Lagv9aQdWRHhWlws7KmuKH0L9/pIwNZiLRTH4RNSJDYSG/zRDPjLPILrUXC0v9mbvtK58aY9lVPwE4Dwkl09giQPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650759; c=relaxed/simple;
	bh=bZjqHPq+kKtEvRUgcS5nYdowvDTyVzF0bY4PH2YQgsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHvvjmt+rWk35cBoTGijnR+QmFtL3KN5HC9ulmyUuLMvCCK5zTVgD4MRzksmi7BqlRC7Z2bBpTEw/ORZPl3ecGA2H2E6kcGcxFtFxtvZxWmuHgiyIqpdzcgtd4JZu+Yul2m+iAGUyibCbbCvqjbZ/Emzlz8IWHuENsnElTWcAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4qhfT3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwqU3OZS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4qhfT3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwqU3OZS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jAjp3210848
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGL4i0Vh34TvmnFiOz4aEaIZ
	+3T3CWRBcD11HAYc8YU=; b=E4qhfT3C/xxxrGd59AOf9r7IbhKCgG04e2npbO99
	TjB9lnwp+RSuOdOEq3xNM2gWpYiYGQotHfVvQug8kxamM1Sn5X14C/5Oqfsy6Vv4
	L63EW0fZMJgPNU2DPvxM+l1CQO5vNiKonsM+q4RxIaPJursf/mXTcRjaktnJEufQ
	pCS3RSUZZ1zzBvQfcFalQcci2TS8rD4oZMpVEkCIaipUExNrUacR+epyQWM94WVK
	HmxJMFZ7pF1bF4hCgGYlD2x2VA/oamT09OqrWquqb9MF0UGcXu4PQ015MoG7BUzo
	eFWiMQBYZhpL5vSJuJ6u5ryY8TiFkbxpZmhLmhNv92LRPg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4rtnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:59:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso835384eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790650752; x=1791255552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGL4i0Vh34TvmnFiOz4aEaIZ+3T3CWRBcD11HAYc8YU=;
        b=TwqU3OZSjb77s/u0xxsIetujl1PfX0NO8kDm3rsk6gT90XnBQk8eGbPHmlCyu45A/r
         4EszBQGbIfQ5+yxx8s4upwtHpceyIRZOA6Gx0tKGzYIfw4hTIv/qd9q5zA95GV2FQ3Fx
         ra7RV116yDdfnjgBkcDqC3rapcaY6Bf3KRbXJ2JCsDCRPjZ5rTHcqhOFQ+z1pvNG9Xkj
         EH/tc1RkoFmjilgNRTPJkCoB0NY6Z6EJUcBPlh/YJe95W8uof2MgExtCE1ttDCZsyTRE
         z8TdnTZavUzEgW4/0O7GXJITUMH1RPsMEXmJO7Cy8zFrzUYUqxfDRuPGLqM6tXecLNT8
         kc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790650752; x=1791255552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGL4i0Vh34TvmnFiOz4aEaIZ+3T3CWRBcD11HAYc8YU=;
        b=gAn99Mpfp1hjlcQjMf5FZ/m47hGf43YL0UOsrbFQ/IK/hA9j4XWWRhw8fdw2bHlPQ8
         76mHtIE1mheAQUc4sK5WaCTAe1CufPaYyeyGqpBgdJaSPAGcgPDOCgxYrX6ZL+ze4Dob
         G2N0yWz1S1uJg9kvfcUzThGjqZb3ZmMuHMmb+MOlAHSTuQA+3X4rNUvMIGMxUFB4aBTJ
         7XN5BhgWXF4uRuPVmQa59HflmiqWwW1tx0taX0la0qGJFSRog0QjbF5n+D6nOxZW/zx7
         fbNZO8AH0tGEBSMGkLvE4Re5tPBwFMTQoq+Zqr9rhiBYiu3Eog0G5474vfucaDJR0xPv
         vkRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2kaR7ClnCVwxPI0hDQRgYZCJyOmm6kha7Wp8j98fWsHN1ToQLaExOT0X3xJD7+xY+k/wD2PeFddPVnkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaABL7tpuNxJfLTRrbcLjodXA66evZ2sj6fvCDoczYSqhEkEvX
	5LsTvvQC0J1Qlkrzb3WrhiRxrf4Fq5Sh7kWFgxH4RRfzNWzU8/tp9pKtQDMW7XiAP83PXLPGaWd
	3FaF8py0oe95HDnr9pzull5vsliuNAhS+T/e7T0nlalICROuiP+qa3XueW4/s4zfgBWU=
X-Gm-Gg: AYBFou3aT0CPtKVwJjf94S5qnHP/D/VEsOBANyQH8qmJqNNoTbAr2+lSVtNtPxTnb/J
	7siGAsAOraDHyBUIg4Y01w9hA//5NNcsZ2jQEKEeGpdScOCN7LZcbfknOix1QX3ahCQMEjTdmwO
	6vyijBM7XacfGn06S9Y70RXHXTChn3a6Rl7WtB4yIuCPIMH4Jbq47ZDcP2UoOKj/04CasJpUofU
	xqk9PHTVT0csSknnJwJvUXEAb4rYc1PXMOrRDZvoFa7yefP43SmCs0j8r2AiwnbYr53TpFqAOjb
	QhgILliP++IxXWmqdcJa5elVy5q5Wo6T6gyzvVjjEznX0y5Zwi8K9X3MlidHr+FqtRXH1iEjhA/
	SE9t+QhutY5zyQXp6D1yX06KxGQYLQE5fljbnDZA33Q==
X-Received: by 2002:a05:693c:6219:b0:341:2c6b:8c97 with SMTP id 5a478bee46e88-34af8240040mr1632464eec.12.1790650752301;
        Mon, 28 Sep 2026 19:59:12 -0700 (PDT)
X-Received: by 2002:a05:693c:6219:b0:341:2c6b:8c97 with SMTP id 5a478bee46e88-34af8240040mr1632430eec.12.1790650751743;
        Mon, 28 Sep 2026 19:59:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm40861471eec.22.2026.09.28.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:59:11 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:59:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: Add initial support for Nord
 Ride Embedded board
Message-ID: <arspeToktu1dTN-0@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-7-shengchao.guo@oss.qualcomm.com>
 <arrnd5wzif1ALS_z@zenbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arrnd5wzif1ALS_z@zenbook>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMSBTYWx0ZWRfXxI34KZlB/bK2
 PUPAcH7VIbHlX2wqQ49kz9jyIVCDCueAiV1EJmiHMCkf546eCFwlf3+lxGxoGBUGeEdCWBVM4OA
 avUPEAlbh+9aLTBq/C+cE8V2DLFrZWk=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb2981 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Q5kkgCCaI_byO3yvwtkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMSBTYWx0ZWRfXzzW7cbycrK19
 3KBduQx+pJF+7RwqeqKIVPnptfHZyNO1Ks4O2Asc4GG+AIgLoiKyiaJwUJQik5EnA8fI8mb/ELO
 8qkfAmQRzusrwryj2aAb/OTGDb1ZIk/c6kH4ZiKlGsV53sKeNGOvvlHiNSRuXdFnFukxXCSbJ2c
 DoDNeXxRBjUZ8W8bpSnySCrtYMV4VuS4aCicvQdijdDfWlBnqJwidyFTz4vbxwYlHVjDh79IZ1v
 jNICG5VTBXkIu9xWSfXAQc5jzw0Xs7qOIOYhiZOHAZCPrGaTY9wFW/dGk/nCAhwZ3oRwUTc0FTk
 1934Uxb90q3U+4CAvfMRtM+Y/eqOiBng6xVuZnJpGwpvzoL8j8LQmlIyHgGwszDA11XvYumx0xM
 ZSCESSaJ3Nt5UmoQsn3BULsl5oOXyVymyBulP9X42Blseg4e0NqkOXcWBRntmDPb0dJbqYjySGC
 UUqyeKO+P8KaGafL/Bw==
X-Proofpoint-GUID: vVYpi_7K7jJpbxhFmSpx3AYRdvt7uojT
X-Proofpoint-ORIG-GUID: vVYpi_7K7jJpbxhFmSpx3AYRdvt7uojT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290011

On Mon, Sep 28, 2026 at 05:18:04PM -0500, Bjorn Andersson wrote:
> On Sun, Sep 20, 2026 at 04:49:20PM +0800, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > new file mode 100644
> > index 000000000000..09ee525764ef
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > @@ -0,0 +1,442 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "nord-embedded.dtsi"
> > +#include "pmau0102-nord.dtsi"
> > +#include "pmm8650au-nord.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. SA8797P Ride Embedded";
> 
> What is the actual name of this board?

Ah, I can see that "Embedded" is indeed not part of the board name.
I will drop it, so that we have the same "model" description as
nord-ride.dts.

Shawn

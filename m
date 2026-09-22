Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77562222CC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081148; cv=none; b=kFy1PqSDSkKRd1KyBeTvoNuDIlbTuDmnEm3EIPWpvnR8t3iQvrwQhVRruBj71rTgLBIIxFRK3WldouT2Kin8tn840+44c1fYF2F2XsI5jEdzNmInNctRKSPaCPQBCDvjUhqhQJP+dx28sWNC+Lkm2jeEZf2R/PdfCb5RD5Wfsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081148; c=relaxed/simple;
	bh=teH5ei3MBK+NMl4BXDarhxXz1RAQj80oEkiGD43HreU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwq2gC3VLVchSXZdynkRDDiQ7E1STsD+80BOS4jOiDOuliq12SWm2r23YS/JYN5YXITyairFePt5h7N9ZcDxr6ulMwBSCbZ1iWQoaxz+uKoAs88HE32Tco8fB1Gco4WlNizTvzbg25GVAk8fGxRmY1qKedhcfkuWzJ1B5aqvtkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBeoOfbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ut66vD0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBeoOfbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ut66vD0P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPMov4077881
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2oXXnZSchD/J/9BfqsyDFGm
	NEvGeY7Is7L4w+xWaQk=; b=GBeoOfbfqUnEl6W4jGX6cfFGk31pY9sW9+sYL8HU
	1UZeijE3YYgWODKmIfFkoYD5arlMe5XkMx3i85xvlTemN3PNEgQnC/xKMcwaMUvQ
	t+HbZzQSIHlavc8y74o8tocgQiZweVeGKL+dUKMYCWLN1Jp73IPsLw/5dZVIWfIH
	tVzHPx6fipIh4kDy0X6Br/aDgwQnxJ/YNm4wSxPFp3eFTzqpu2UTvkBHAP8MPpI+
	m/8CTY6ysvjBe/XCExRLJdT8m1FGgHGuYKTKxQ0y6RtKPt3ECo4nTrWbSYkuBLUG
	0OCp0t5zzJcFaQe5dtR+kfTnviJ2neYOYjZhinb2OH0V3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgxnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso7130100a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081144; x=1790685944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=Ut66vD0Pz2e9UJsuEBemmgA5mgiwZp1eXCpBJo9kImHL7qTYyWip5KyzK5x4+x4Uir
         obaLJsfE9zatxvMtEMwC3ED0C2ufo0d9BJpUZ0Tun6Ln8If4vdIGyZwE/+8aGeegJS9v
         1Oh9dgDsgr+XPj+VG3Mq2Q9UNd8o4WMpawChtGlwjWYKKdBR/1zMRuzIRBnqXMbVgwpE
         1hmiZuWaVgcTdIDwWp8jEA1CqHx3elGD64q7hSlpr8vLPyj2mYpgoG31bxOODpqBtUEa
         HiD/LTKlE6uMieSrVl4vmDIBc2hbfWki5gcujm2Gmdq5s8/v7OQq3UxWA2HQZ4gvDxhD
         UKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081144; x=1790685944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=KkRdD7SinyicYjcefQMzadODGj5LoH3TXF71xj50a16y7pks/WwdgWGgQuXhvQaueQ
         gTAUGGokbfnhhgPkW9r8gScaKj6VxaSEu0YjAHhck25bW2/OEjxL+oEoKXzrFbDZQ3jX
         ECJORMeon1NGickLl2xIg3uxTsYlKGUdeco+S9Kmj/39bB2GVLsDAubgQzGqAXIFzeJ4
         5ViOL2O9rc0aFcG60dz76qmF5a00MHUUDFZNIvClwiYEiUHyxZISc3dhBPZPi/xGiVj8
         ZiFkvYypZx+PZDPToTTZmr75/sZ27hzEQmLN6v5p4rCseW/9GmLEp2x/JeQLmBbyzbio
         gjkw==
X-Forwarded-Encrypted: i=1; AKwUvBxRV0nPEhzPGioa67nsKOd7jX5/0tbdiW8IeQast7bCI6USlcCC+y0MDHg+SeQ/e7BDl2FMT6JrpB4ImRs=@vger.kernel.org
X-Gm-Message-State: AFuF++nmVIwd0gy46FFZvg1kGsg7NHjKXYs1wkiI2ruJwfWZ8TVQQ9+a
	9UeStTirjWZU98Zt5PHxG9CM9gkaCxRMi6OcqUC+qYTvtcR4APaocPVoBuZ5Kg96jrEtAJjojYe
	Cql4bATMm51q1pHPBs/M/0SK5v9fkYSqBN6xmP36e2PRbwZa2n+CZRyeevHp+eWAke0k=
X-Gm-Gg: AYBFou3v2CdjT6CFp+fpnmVO8sSd6EMHcVj3Iu53zuuoR38YS3Oz230H1Hkf3TE8WNt
	estcqSPP2qsavSpP33cwOGYsZUy+InmJQxBwziitUuIFORkKAEjsUu4Mi7V2/prV/C6RzwNaDd/
	vEBi0VcgNw+34gxL3ShxWP30mc6PxfbThQv3NeCRMF3FFkBZHa4T2xzo0rxbkII9T1uhi1PEPLB
	1mKpcy9FSZndoF7n9ttJFSbV3DXCE665Gj10Vsfotnky8ggsS5cfidx0tpN6BDdc2SGlj4b+Uq1
	2dFR93SPlIcmI4TLRD4b2ZQp7fNJQz1cTTu0/ASN/1U4HwRBrORuljNu38/u/jFDUQvbMz15+Z4
	Wmx0CLtJe3iLAq2Co/HYDvb3OrCJjf0NHHHgcNJw6ww==
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852100a91.44.1790081144021;
        Tue, 22 Sep 2026 05:45:44 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852079a91.44.1790081143453;
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574b5esm3204533a91.7.2026.09.22.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:45:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/9] media: iris: Add support for glymur platform
Message-ID: <arJ4bUn7ZG5y51DA@QCOM-aGQu4IUr3Y>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-dangerous-illegal-honeybee-cf479a@quoll>
 <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfXy7NOSKULXI/Q
 vyZtMBTreD/7PqjFlzGA14e5C9y9OQIW1lTGu4UIvOGWrpSPKgeb9yYUEljL9CiTx1ER/nUF3rU
 eCR7QF0PDgLPdJ3HE8F5JMzZm6ogqguH54jc5OHi50lXJ6jIaBmi8bSJnBhjQVwRtUPRxI/AY0R
 TFEodhPa/aCo2hVjDg67vghkU0YUDkQG0LrjqK8vJXySmBE1vXrHelhyeRRRnRMc4TN/qUP6ytk
 DFcwquBm6mVo4IG22z3waiXTeH7T6aG6nF773C9rQK5Bt8DYmJRBfDRDGtxmfrYu9DPZyVT62wD
 WzuhnKPRJ/o9KYlOBoOUzcBXjBFQk4feQB+woVHudOEuF8QhN55UK/PrnExIoHES6MznoCNLLP9
 S5NjfhW1KVNYjjL9B8UdrlLJmeXmsTQE3iGkLnbBeKpp57bTwZxgiNQNEnlibrR4wWPISz9BLNg
 OyEXOQZUJkIea6lehMQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab27879 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8oyx3DkIhJI7QqzJRcA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1ukKkdEy_CeLBfALzOJeVz3_ZvYErn4d
X-Proofpoint-GUID: 1ukKkdEy_CeLBfALzOJeVz3_ZvYErn4d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfX1WAIcpvx2Hpb
 dy3+jHpj6buoI4ABR+y6WDP96otpG49umOQBhB9Q2lxThNai0AjOzaEbu3iuH4Zw1NAArUpyAiV
 P2HWvNN9F3xITNqlAzK6PlrfrF/HWZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220185

On Thu, Sep 17, 2026 at 09:11:50AM +0200, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:09, Krzysztof Kozlowski wrote:
> > On Thu, Sep 17, 2026 at 10:30:19AM +0530, Vishnu Reddy wrote:
[...]
> >> ---
> >> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
> >> change-id: 20260917-glymur-627d049900e0
> > 
> > Look here:
> > https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com/
> > change-id: 20260601-glymur-4fcd4d832ecc
> > 
> > so now does this work?
> > 	b4 diff '20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com'
> > 
> > No, it does not. You are sending bigger work, multi-version one, part of
> > even bigger work, so please get the process working correct to make
> > reviews easier.
> > 
> 
> And it is getting even better:
> v6 change id was:
> 	change-id: 20260515-glymur-6e69bc258fb0

It's funny that b4 processes the change-id in your replies like review/ack
tag, and so they appear in commit log of every patch that b4 shazam
applies to my branch :) Something like this:

[ commit log ]
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
change-id: 20260601-glymur-4fcd4d832ecc
change-id: 20260515-glymur-6e69bc258fb0

Shawn

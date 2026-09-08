Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DC39E9AD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853164; cv=none; b=p8nfCFRugSMossowGt+ghJ1h3Qtj9h8b1EO/3PrsR2FQ+Gn8zIs9ELLh3mhq2/Bh0XZuN0hvZkZ+PjzV0Mdi6ZhQckFdT2G6narwByFoAgw1avvNlgoMIDAgDh3ZedNacoM9dP3AVPPUvB5exdTYHRHQJtVBs641nlvdIyQvAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853164; c=relaxed/simple;
	bh=ndiQlkOabMvz2xRfex4FJpIVycP1b2hV2Ntdbd/KTmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIQc5nL6HiSl2pnapSHE9DfKrwhSdu81obqZ6bFK9re1PjY5T3bM+fiw0U0161Qa5+4dibYu2YNq3MF8wwWZ7ORn4315qD8BBMz7OaEybOdQ2jhdbMvabfUi1xkhLkOARmIGZG9dbN6gt6LBbsfqQQkSfrW7EViYUzoExg+OAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWkQPERk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC8unHgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWkQPERk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZC8unHgk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LdHY1477255
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jnh6/unQ/9XWBJ9cydh2x/HD
	zEEBeHRIBD4szcO5/UU=; b=XWkQPERk/SJnvY1Kg6J4/nK3lXG04D+vm2X2Pu51
	nmZFWvjP17uighXN/Kc3CFy2U3G3h+ADg0xwexAID9uv368cqi3CGsBuqLylQBaV
	WDX/iS+owaGTSb5586+8OLJHxPmRHN5JU8LsXM4RvguUuOaZvJyNqz1gXJwgXHWe
	F555Nm21UAp0gpPRBqTbe/ze5h37HIoipbMPSXO4//uf6NVpd66CRmsNLYevgKVf
	mTV19pvzFTi5P9XOrXeDZzRnv73P19X4K7Kz6zsZ4IujA9ycHMdXM7Q1QeMiyOv6
	JxVbZmPU23wDlwM0gOHg/7SiBxzJ/ni9zELIVBDMsykVIA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgsvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:39:22 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-464fb819ac5so3955966fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853161; x=1789457961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jnh6/unQ/9XWBJ9cydh2x/HDzEEBeHRIBD4szcO5/UU=;
        b=ZC8unHgko+pySsAR1fyMQq4hCjIiGOLLRoY3wzbL/iFXbT1zPZmL2xcG45rcp+dPJx
         /CaPjSBVqbaXEhoRyiA4/H+y8JUwq4/d/1ZyeUW/c2FHwPDIWYljfLpcNe/F1LJv8cT1
         UJkOK9OeH7n1yBkuDhuenlrbv3YHQQpF1uaG4z//DQhSffJwgAW8zrSKXVYopHqomxHG
         CkaWpY/Z9tQchGjZambqiR3RVG1nGLv1wSw4kXZMMiW2FT3ovn1pbEtmG7vPDVEFhZwY
         qUsZ3K4YgAorelXAzxclP9luQtmbxkuHkWSont5TFhnpybpy+jFaw4F9BWiPiTH5jknI
         tueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853161; x=1789457961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnh6/unQ/9XWBJ9cydh2x/HDzEEBeHRIBD4szcO5/UU=;
        b=C4eEVl3qyx8OEenX9MG/VY4r7+YXZS3SOGI6C7dwNz4j3ys/SJ/9V1ZDxnmA6AfTiB
         6zf/qypFjp0a4YnuYfJTzZIBcY1xR4bSy24F0ssBBl1mxk0ML6KZuGAAoR7ZxpFLMORZ
         +IztNEeER2j4gMyr9IsHDZTIpNV3YP/aO0KXaN/vk4psRh7A5m7ouS/fX2R4elGOMN9W
         CwQfm99j5aCQG1yXEYRjyR2OpFufefb06PcpwLRckcUfqXEgMNezG44QdwKd8SmYaHFg
         qUIqUTTHIuNt+k1f8+R6MHE/sDsfgKBqFHeXZr3oKFnD5J1poj7EJ0foRDb2oYFo/sF3
         eiAA==
X-Forwarded-Encrypted: i=1; AKwUvBw9/CRdQhT50WRJFnbrxxy8k7MygevOArQiow8XncY36avZbB8k8IAa7FlkjyMTyH9873mVkMGRJEiCbPU=@vger.kernel.org
X-Gm-Message-State: AFuF++lhizPk216QQT+k9Ujd9kEpmBUE41shrpFtLbOPycaIrGdadJvC
	SKt/eIGO3u/sr4aZTk53w0po+QJmzHrYvWNHhRsOhZB2S0mlFdXhdmi2YepW+QfpF3RHgPp8/i1
	r8Lc9AHOiq7s802ywqZPMl14OBCtG2F/prNJWK29fZgCsvloMhyVNZaRmINBGcu1A3IE=
X-Gm-Gg: AYBFou3rL5fzBFO6q+VEpyAPLTNiOpGoqY0n1Wd06nmQcTVOEExKjO3fuAXpjxTG1Dg
	HZbcoyeT95OdR39WHfp/JryBPYDygRKHhsRMpB3Z6Nw5/gJY2GHue9gkMxiuG1eA2qd2EFusNN2
	DlTgO9s309uBL16R8YUO0cKgQiIn+fqiKCW0E95LRX2II+w9A5lReB/QAFtM3MiY6KMkWCouxgl
	DejbvnRAWHP1lAVpS1aZA9WdbGRLOO4K/LjaZ0Tap/Sr9Ak/3sY3VbGXd+3bfNAUtNJJpzQ3zMH
	OnSfSw0zzRdQtFzInl++bD2TXBsOaZ7C5Q5iKBzaCfoc2gP2fCfu8bMiWlyLVbnld07Wk8sCygc
	F23+UIvtyAR8PLQ==
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr14489635eaf.53.1788853161240;
        Tue, 08 Sep 2026 00:39:21 -0700 (PDT)
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr14489613eaf.53.1788853160705;
        Tue, 08 Sep 2026 00:39:20 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm29571562c88.3.2026.09.08.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:39:20 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:09:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+7oEcW6GONVdEk@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
 <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX+TmdAsgLlptW
 FSBjX7vhadldGMP0QaBtdXyHY0DhB67JFedv9FmlwPo/genE6aIaD9mNNDxz0GoBg9t03SqWrlg
 iVnsa1ZfzsDFpvxL1/+XttEh2kucGpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX+p+iH8F/QhzD
 WLbs20uX4/9bc4GZk2mbbTT7JPkruCkjlabV7NLeslvqtVsIAwpP/Ie5h/0ovHRwnZfVDLzQ5j6
 74YNgcP5cnrjN3UWrFJ7WcDAbIFgxtX/naA/FO1nZyyXjteigJbuVoi6HGhI7ICHODCRuCzpamz
 bm4V+a2Ctf4rxY25js64f4mMZyWy30yN5jiG4NYpcmPkIVX+kgrOmtsFhCEkDxkmysLBXhj72BA
 QGQZ/ThgxW2rrSFQu2WO3UCq4itmCgQkSmRSR0+ZxaXNpYCEDYUrcpv1XvBBCLbvX6DEpHnKdyZ
 u+Mnkc9h9SlQje0UtTMqRJoPaxoJNsLue3Q8GT4ve5bESX1veTryXI93TgY+Gm1o506Zv/E5c4V
 Zb25xwhdRCKppkJiITj4IWeY9QqbSQ4mIinDksLcBDIM8aHXCUkih/Ujj7fybDsjXq1qljY/zvD
 NNwR3a6sqhOj5o4bPzw==
X-Proofpoint-ORIG-GUID: nJkCl0BvXYxj6k5zTo8CLQ6pxe3-F6oC
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fbbaa cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fpx1x3OIhUlXpLwz0nAA:9 a=CjuIK1q_8ugA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: nJkCl0BvXYxj6k5zTo8CLQ6pxe3-F6oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078

On Tue, Sep 08, 2026 at 12:53:46PM +0530, Mohd Ayaan Anwar wrote:
> On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> > On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> > > The only reason I added a PRELIMINARY tag was because these DTS changes
> > > should go in after the driver changes and dt-bindings.
> > > 
> > 
> > DTS cannot go after the driver changes. If that is your requirement,
> > then original work is broken and needs to be fixed.
> > 
> 
> I should have worded it better. I am only worried about the dt-bindings
> going in before this DTS. The driver changes just add support for
> whatever we are desribing in this series, they can go in after
> dt-bindings and DTS without any issues.
> 

...would it be preferable to instead have the split like this?

  - This series + dt-bindings (on top of linux-next)
  - Only driver changes from [1] (for net-next)

	Ayaan

[1] https://lore.kernel.org/netdev/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com/


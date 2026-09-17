Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DA4B7A32
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658347; cv=none; b=PFlBznc/ky/i7buybFBwze7UpFwjDah74RB48Z80GZfA2WLX/x14PGO6XN3cczTN9T+5/fwwJL+HOnLAJj9RvXDxXaDIiwfXJmy41eZdYRGqlNWq3DuXfLjQkb4DtZU4bK9aEEMuw6VTCgkB+tF4jkYDRERGFjrGPAh/VcDSUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658347; c=relaxed/simple;
	bh=kELmudUjcgsQ8KhsRQraj2ps1KtN9s+Jx499XU/pG1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+OSCGJhrvk7B7zWV+Z13mL5ekKTQE+dmCxvebAvbvu7PH6XJMJzCWcDN+f7eV9zcd8ccp4c6CUGR4S9/ZbDIUO3Cuj+TRiw+dw1L06fnOKzC/Ptut6SFi7Ynw1a1pFflQQpILdNC7G5mI9AXg5qVB1+t1CizO+GInqqLR/UFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFy3zPLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBUUNZLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFy3zPLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBUUNZLm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj0vD550032
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eDFZ7vk2von69CQmhrGnntWS
	hCc8tgxQSOHrgI2CZEc=; b=PFy3zPLplKzeUn+Bh8E88upjXttjqBAYfGL3d872
	3mJ3wXCCUxfrP9Y6Jg9YADGoOzH5zEvvobCbiy0kHzX186nAq5jjCk7moIDB6N/H
	GE273ffyG8UeBrh3/2IqXWZvY7Heev3u1F7HcaeAmkfvP+A86zQcFCMpo5e3fOSm
	l2OB1uq5OJNnKrif/M8SiXmkuPUsZmEEgj4c6BCYfwRAPc1TVs4kOjjdRIDNC4Mp
	6PjQ0MBpvU+g6nQne+PKEu0pmqxgplS1W5PWSgUsD2mXlCQsbu17bAx8V8+jM6Or
	oJ4QTB2WzeXurpHFv7ZZneiGwb0g2yGfKenGC6u3/Twvgg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7ucb2nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:18:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9124b265371so16185786d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658328; x=1790263128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDFZ7vk2von69CQmhrGnntWShCc8tgxQSOHrgI2CZEc=;
        b=iBUUNZLmYelzNhgtTFd3g0gE4pe5apmCtJ7ViBmcSwi4SokA+J1F3IACcr9Ff1zegI
         8g6R+hog2MaNMPUqzSo4NeeXyYNNKR63EurrmI7a9sKSpknxByLk3FRh1qdfiLwpwWlv
         +8mTyonFqaSYv2n3086xHtiMKi0fs3t9iSWY23eBeANvzR1ntVlSIv8VCcRd2sA0r2Ms
         GnVZUCECg6oafNRPBs1naxl53wtboKcQfcamMqM3VQxEkjIfdaV89WT0gZIe5h5ySH1t
         NsVONigO/11pA022z/BU3i85Yfn5A3bMFSMK9wNOhWxZ/cofe1lqyBXGsK1G8yOlpqcu
         vWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658328; x=1790263128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDFZ7vk2von69CQmhrGnntWShCc8tgxQSOHrgI2CZEc=;
        b=mEjB1+muyr0pqnS15oDZtkgAwLDjGxRwB4PFvud76e5v4AFWsDaj+Tq/x5RncEwGne
         SkClBGUNc2blAszixSbV/5oqoUzeSfhXy9AZ9vZSP6sCRUDZulBrBlL9jQe9cwt3+I/T
         NfSLZl15LfwXZkLvh2PCS+uMn90gVN4K86uatpROrYCskIyggomoDB8tD+rIQncEy5l8
         9zwMWNwhx1keOlHc1SOpNhJr6uYy6He1PgTnPaiKQAJqOwTQBn0n8CVJ/zmKJtZcSEGA
         5gzh6xi2rchsTNpTYRVtrRqBoKg+N5CukbIUXDydKHAaah4cqstWERDOhEFMcMvk8GxH
         zWBw==
X-Forwarded-Encrypted: i=1; AKwUvBxSNatbpFjTJc2XYQigKI6xvGzjDvdXK+ELQC8mFBMfxC2jDwgbS8Ri3PG/Pc9iL41IUvgFO/6aIdhIhKY=@vger.kernel.org
X-Gm-Message-State: AFuF++n30MgUN5Bbn2kJ4NTj73yw8KGaFUs0Lf5XJcmVmWBAQE47Vn+9
	rofca4xNGg/2gMOSFARs0BLQAzXSZn1brnAP0snrUlmcKGbq4dY6+bJ6osfypaCnJziYEpZ4nfD
	oUBhf9qczqQpn/sJdfShWLsZ7gJKIYI8yeQk+w5PmCNLZ2wsTnD/8kwgRICkWAXa18iM=
X-Gm-Gg: AYBFou1BG/WcNBDGmdHmPzPEtLXP5qqsym/6gyygxMnLXDSzZWOvPsf83N/urnu1TrE
	BN/FCJqNrj5lnX8rZYGsMvh8NklaZ5eROn2qn1OFkZ/oO1Ywxm19JNH5zl1Bf7+EY72Kr5YJeXO
	4U7JtdEWrAGDne/2lkPDxRrbEOv1HthCad2SZOLhHuv64tPMpk0/n9KsrQccV5PTjGUyvyVzh/H
	ylwxEaNfCbGGxi2Nok59IJ9Mqc23rH2KzLytzf2IA+xVWa5qhhNHiVc57HZs+pPFjWCnowUfwxd
	5Ixzm8OuNz0dYaMXxu7NU4GUCRXX6Np2dASFnuM8oVrFumHyn2X9mMT4dfz2hQSm16YmM4seTiv
	e9Kbhfimu9j7vyhA=
X-Received: by 2002:a05:6214:262b:b0:90c:e389:a627 with SMTP id 6a1803df08f44-9123d62a6e0mr132215596d6.0.1789658327585;
        Thu, 17 Sep 2026 08:18:47 -0700 (PDT)
X-Received: by 2002:a05:6214:262b:b0:90c:e389:a627 with SMTP id 6a1803df08f44-9123d62a6e0mr132214906d6.0.1789658327001;
        Thu, 17 Sep 2026 08:18:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bcc7d1esm16166920f8f.0.2026.09.17.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:46 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:18:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and
 GPIOs to root port node
Message-ID: <7ly7dy2uqil3ysjw2jomjoh73cmzi72alsgsqhugikzdwj2sib@ktjg566sylkl>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX4GrQ08p0Lhbp
 Pyx3bMYAToEhwkHTIxBUNCeKhHc/NtfhVbds9Yl1lkcvK5r4nx4FoCWPJjHaQttsfr5Rq9pMfPe
 NQucD9tPM0sU7mzC4p3IPUx0mEC2Y74PMD6D6eaGVFTxRrGjdxDpPPRxwOj/zFihNnUUe1r5foJ
 W3BElVbKOx/qKQeP4j24vNpS7+4t4WAjMIfoJz5uNJ2gWoawD73uU9P0Z+awN4QCAQsa2JjRhcY
 TKKKV4J7K0FPdaIJSxEO2W+zPch6UxbsTqUI+XlhHCPN6w9kwZJn9cVqlsINVuqVIzJ4XRl2YYc
 ORM1zjvIBKF7mmJZxvaredn/T971n+aORw3UG3pUSLPf1E/tRpQPPM4NHQHy6uDBBBRwYjwOgDf
 jVZY4GurBIv0vzdyM2UBZKDVECSE8ZjoFzQ5BJeybHvtrC6aRnGUCB/wVxCBsZcJaHktx4wf58G
 nADZ11552TnF7ff8aSw==
X-Proofpoint-GUID: 2PEllIv6X8MmN-VV-gPoItSFi1e42WO5
X-Proofpoint-ORIG-GUID: 2PEllIv6X8MmN-VV-gPoItSFi1e42WO5
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aac04d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX6g0JgKRIagHz
 uGKxEjkWE7s1dL+GwakYtj0kAOChfefqoJ4AXkAvto5YIX6e3iPaxxGXNwe6fXNFkcVJ8rQxuyY
 i2G0qN90VNW+83Eo43cZuYgrd0IyRKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:23, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board file,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

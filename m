Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F43DCDB1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113110; cv=none; b=m0JYyQOsPO0BiYdgPLuSg/RfxHkBlT+I9pzUIFb03Nh7qku9t/qpJ8HpcUovfr7pYCBxNNWzbhVbTZPJ9NBgOGIJs0GlD6mRrPOFCb5gaxklcyuvQDF8fZRL6hKx3KTrlk+iQhrqY6SSMfNCWrJCR3Yx+p+dVUbafbgJYG7ylPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113110; c=relaxed/simple;
	bh=cJAfgN1KYWp1m6GWysztFt7BByetTfE4jM7/Dt25tf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXq6zNr/EcpxQvDj/3mU5ECvYhgV8MpfAWNYEeKTIdd9c2PDCttuLOJYO9/gpuTL+GZ8yNSpPbyLqH3UX8g6QBc4ZjJA3QD6n0VDDb48ZcER0KaOp/kIyypZ9LGxM4tm+ntc+S9vaYMhiW5bIYx5FiQrwW6qgFltbsLySdyT74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDGckt9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktoOAnj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDGckt9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktoOAnj0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7lFq02803663
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rmmrZM6VbrQRpI5MPJAL2YcY
	UInPqlbd0sBOxYA4Ai8=; b=kDGckt9oOH+uSG8JKJXVo6Y0ygPy0pRNaQtXRKjZ
	+G5v66yJ4kE5GbTDITagLUdwv8H4LAUmrAfqjF6A/sH/FDKQVy/gAnYTB5zDW7XM
	PRzWhbmo5e7d16vRA6UNsRn3V6DwjkvdivgCOJI+eb4k/V/OFRqSS+rAFhcXa92r
	1mSXWOh43Bu0OtOCFriLuHLmaVjC7896HO40lJ2APfC0OxgKbzu+jySWtgprRIna
	jugK4Fn6n9+gNgyy2H+uk+PV7Den5Jm1LJbpGwAjuXU1S/ITBdoVsQVjTMK0HiIW
	/X05ikGvRkhJ2h6p88uPIExHHVp8QIMHXoGJSq2pXd/DXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729hg9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:51:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so88900385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113108; x=1789717908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmmrZM6VbrQRpI5MPJAL2YcYUInPqlbd0sBOxYA4Ai8=;
        b=ktoOAnj0iC6CJQ8cuVk9YxKLj0GlR3tf0YGXVaCCn3ZvgcOSQOmjHBwQcGdW+0jSu3
         s0CXFAlGul3Z9xvheGo2UWqubEdtRFY1t685bveq146ouM+Ps1FgXM8o4nDM4hZuC106
         Jw8/t0CpjJgxaiv5fiYyTCI/IHNy4fI1hTbn+GbxyKZso/Hdqz+vZHvVKU8DIUcJstLt
         7LqnwxfWdMXI18KFzQhSQ/VepV4Fz6D5U4flkY+9EseNEYrpOvFyfegFImzDw+MgJTK5
         oemV4ud7tigERCmuNFAkJGuDrST2/4cWXQttndrVYtFCYakzg/whORURAO/duIE8setk
         09eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113108; x=1789717908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmmrZM6VbrQRpI5MPJAL2YcYUInPqlbd0sBOxYA4Ai8=;
        b=mCSb2X88VAConr7CqfJb1RSsusez77q02D2vgc259HpJrrXWL+5qD6bNmERtoaMETx
         vJN3aZOKD3mylQ0J+Ao7byjanYaaIiXxljkzlBQ8GrK6d1/ihTFt7PYAGFhMn5spBZum
         Rx463S4mcl2gHbBrqgupsbXlD4ieAREXWiYlkIObKuydhKJcxGiTJk0xHx/DKsHVLXrc
         RRCY59D5GV2+Xtue/aBjAF5cn6zb7SAUrYlGOOWajNxKBxS7dirvUYNT4g+dPlVpoPwf
         0QJMOPQ/CNIFXSK7Q/h6Uaw5zQdjEWY9IL0gsl2bK2nuJ5VFn8PBmUw2WqK4TzPO5qTo
         jiJw==
X-Forwarded-Encrypted: i=1; AKwUvByWDXh+YS39d0Kz7NUzxLGj36soCGX27JkdXdeN8dJfzFI+gkJZJmyRNCluJNjiv7Jvi0Z62H0RHBDjep0=@vger.kernel.org
X-Gm-Message-State: AFuF++lVdajTxY5N0OvHdmh79CwHmUgqAlpHNqHo4VQfJ+1yt8ZngHYs
	uxilgQFELBCzlZ0FyY2Pv1j4wttO1bKKwC+vC2nCSONQYuogMX7tN1S08n9DnGlYPcCtDGYtRw4
	cVQ2VnQaKSsuzhEBu3RaEULpY1rSo0cOYBsB7aQnb4waJ0UsGEv84OvKWiKuEkfd2toY=
X-Gm-Gg: AYBFou0Gi0wAFFN2SiMl6bHl9HahbnGRzqyPytRKNr/XRl6B1bKam+BY1WQldSGrMbv
	MDIQ8kAaf+2NS5OZ7pnxVnp+nclXKHus2LQrZpg7MbncCkwEaosbdQ5wfsaB4iO4a7rGVNeoy8m
	bOAQixMC0ZfXMknd6vqYOBDZgjmVA5wZdQePNY2dmO7hASRMnycyFaWQGCgsSgpARXpekySd5iW
	TPgTfZMe8ulyOR5RlYkPJXJHTapgFlUm2mQ6lmlKv3zYM12JsLzTGyTJXDXIToDVXnd+g2yqmkS
	Iyl14/JwCMnFvbqnUfRWYWO5ujyJfVGwA80T/MEKIJGV33H45cwxuiB1skbBHVi7HWru7rD+k9/
	/ZQusCS9CtaFMhzo=
X-Received: by 2002:a05:620a:26a9:b0:939:7162:911b with SMTP id af79cd13be357-939ea21332bmr406986385a.32.1789113106988;
        Fri, 11 Sep 2026 00:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:26a9:b0:939:7162:911b with SMTP id af79cd13be357-939ea21332bmr406982985a.32.1789113106412;
        Fri, 11 Sep 2026 00:51:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm34366775e9.15.2026.09.11.00.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:51:45 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:51:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Message-ID: <2ar2mbwsbhmsdodo24mlckgj4fz2au35c6w4zcqorwhiomux3u@3uthjwyommcm>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX8X4vDyyRDA9p
 +DkwIRtC0EYG9KF/VMHN2cfSnNQc75ARKrqiGHApjBQFuQ10WIJm1aTZgr8VtVnMswhIqG+iJeg
 H4iSJ/J/AEGxCoRIn7/nLuTyL9cLaAc=
X-Proofpoint-GUID: iBLcFbBath19md9a4orez1baEk5mCAlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX5iQRteFLuHRs
 A3UUmJLAqo6/zsS9VLrQE0tPvD/kAwNe1hA8+6xgNwFZb3fVm+5FMy0S4PLv04z7kt/nekoKsxX
 QPZd/ODUpQeZTQcqtchhbMM0q8piR5rXPuzEu6ck2uVOk1vAf6qMP771NjeKIDDfGdWTtzTt+s9
 Dtc48j76WZpNf8SoYxAmmvHeYGln+ZZiYHASlVx4jAKwPliSe4WMOtkMSUuu/k0n3637c9zVRLg
 JABeDPKtgeksqsfRfmWhYw78otOmQlxubEk9EVDtNxTtlzy0vTL2ZDMPhluYgte/Ef7sbjBQe1g
 M7vqzRrxgGm0jwQVqGJVhagk/0sGEfkoyQ2gEzes5f+7GpgLiTIi5F9m6uAVECSRsPSZxreN06U
 Do/AowUeNwrMLW71HTHgI0iHXAUjHSTVgLvtXYdnr8Y+HyPjG+asBSdocdEXzkAwbbMFA6nyzeU
 3vAINZwlzt7dBk+IxIg==
X-Proofpoint-ORIG-GUID: iBLcFbBath19md9a4orez1baEk5mCAlb
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3b314 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110109

On 26-09-10 18:30:44, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

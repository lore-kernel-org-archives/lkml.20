Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9783D091C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273559; cv=none; b=o1JUgwkT0b3+LqLnfOsmrcruxCfTNfhKp3YI+5netNkk36E8+s8EB7tL/HGounDbY6IUnywborgyvh8T/gOrg+hW8DFfUTDg1SkX+mcteTwO0GB5zOjdGgZ64asRJZ3UKjyfmSQ+r0rIWrl5Olatz5bNw+IVZiNhmHLOr1yiBfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273559; c=relaxed/simple;
	bh=8Dl2fx50tBCCW/Z6siNyrOzFG80MjNxpL5r7YPLF1Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHyiWXvoCoBuVzEBd42rezNsBSbM7W6SRKxE4DNo/njkkyyI+WpHyg3NtKgJyik8EX0ZuvulaqgQKaSM+nmJLbQ9JrG5iGPHfn+Tr6+FO6qpMN8G2ueVxxEkBcTruPdm5duL+abvfkaH7gO9GuBKuxeBgXQdHQKYp17QG7iNLWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqXsfw/e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MY72e8rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqXsfw/e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MY72e8rg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9cKK2748157
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fV9PRxEUNiN84sI9N6/IsE9F
	UGfoQAhpy34kXAt1Nk4=; b=WqXsfw/e//gIC1Re6XF1fhw4aUFv2lryP5UNewhq
	p9Ys2DlsGUh9gcW+73JHYSrUJ9xfOE57/qVxmVmDLU3nt2fykE9EW8cMDBhgxyGM
	RZ0M3XlJ9j59taRBRUGTXA7kzmDvSTWkKoMvQQhOGl6ChwAULBfI1PexjaxXuSHZ
	FiIxKvO9a/8aNdQGItebxCnnPuJ4745u5/sJVNJJnoD+AyZph3Ju0+F7qqymM3/0
	KSTQ5nZrZmR9sjq6Q6y0Lvt/q+a/ZHnibMG/kYOHUaw84lk6MSK1FV4rW5CQVVCs
	TrmQhb90/HH3F5ikb8j08bPhlWGY5SJVh6LNppQ7nvcKPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm14np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:39:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1793462a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273552; x=1788878352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=;
        b=MY72e8rgB+RxH8ZQvwIha7ZliFWggyzsS+4mMuOshDT4NbRty8q9t1/XJ5cXskdtZM
         X/ejfVUlcIP7FSdcJO+LwlMvZ4OjsHz5m5UmEMdPcbyRYdNpoYfjAlvN2yNzzKui5CiS
         CWjyOrASRHVAXQVlk1JqzNELKctC7/bJC4+Stq6S9/wjwxHCfoW2KNx5/zz+0ES1ZuTM
         6PvwjsR5hY8SKvShDtz6NNI0kYzr/hD8CaCRiOiWalO7S3mJ8nWy9uQoLJqQizBznv7g
         pMQiUBHNcBq+9Vp6QsSzH9QzJdL5pVAK7OCMVcNMjGCnaQYtmZIMLVImK0rvB4uLghUf
         ajsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273552; x=1788878352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fV9PRxEUNiN84sI9N6/IsE9FUGfoQAhpy34kXAt1Nk4=;
        b=ISBkQYhulAZdjBPNXn2Yj4fFFaO5yYev746j8viN7NjnBtpQgsZ35Qbo7N2/bSciqw
         GzHm9bt1E5gCEuO4nTrpAAJ2qNUJEQ5TfQSJipVwbIEl229UNAPef4JQQMQKGy17coGt
         VxYhFr2Otth8963cf0FVm+yZx/hJByWCxgvMsJhm4MKJph/K5ApNYQaGrfUhgore1SAL
         e0vcOVqfQcWuylbINhFLbtmCPiUwT/zaTmnEchALgYBRk7BfGHkrzFCuUfM6nbxqsYn8
         rL0FIZBlUoOWERW28Ke9c3O1YglFiUjqfu0oYe/2r/h2a7t7b2y540fbXlnLZFVFKobM
         u4tw==
X-Forwarded-Encrypted: i=1; AKwUvBx5GdSNPnz4JE7byfKDVqeGzQcTuPT1/bab6oPgZgwc1YeqlmEw+gXbLNfSPH4caK81tovbUcH5VhcdU0A=@vger.kernel.org
X-Gm-Message-State: AFuF++lEuIHeJ9eNaaua30TM6mOabmb81kVbW3Tnz7BidK3zPRF0iC+m
	G7Y9BQl2ZPLuEuR3MJ+LyCeBMSNCN4+EIOvapLZQ/4R+jWIYEG+PXLFkjgM47WsFxC7VG/+wyx4
	ILfVhGyiBPVmtE/MiY+ttTPQohVhUZXvifYT3/17xW77JHckDO9PW+epzeLwpSHnvmvs=
X-Gm-Gg: AYBFou2hxrggtUk+3OtrI8ryKOKG3j4UmE8FjvSAXLCcYQeayqTktkRBK3Fu3LAisGJ
	dXNTpgZ/hYxtnxb+PzqeATYRiytNRKNbPbW/y+QEp/KfJYMY09JVMY6NGCPiYzdrZhXpJof/iTs
	20Uo52yNDQPYa6RlRDZs6HuYlVl98AN1gbnBNN5v11U5LuEa8uiyIfstu7x88hCftbb6gu+9hdk
	wJICs/wjXi0AmAJ7nQhNk39gh+AT6L46U/09QNqRdjuutu983N0ajUJ+MQnSFTa9lbzF5b11G41
	yIefg14J124AFPuXQm5nZ1tAADMRob3Pj0DedlNhGoR28TfLBYux44KBmLTjYLawZTykzeRn5eD
	ekoxBPxaBPe+9M577Q7GAks+jQdH8AjQfinVkiL1LCTY=
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6035581a91.16.1788273551770;
        Tue, 01 Sep 2026 07:39:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3990f890861mr6035528a91.16.1788273551258;
        Tue, 01 Sep 2026 07:39:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm59617569c88.4.2026.09.01.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:39:10 -0700 (PDT)
Date: Tue, 1 Sep 2026 22:39:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Message-ID: <apbjid_n68ySR3ji@QCOM-aGQu4IUr3Y>
References: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dMD9nLZgsa2kLBe7as7qKyhyG1kniyD8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMCBTYWx0ZWRfX7FTTNzHgF6U/
 I62eU+BvfU7rU18x36vcsNweOkP/JyMU/vrTmLrmW1fSR3jhld2ZJRf7qnZlL06ggaFeTNPMWrc
 vXa/44XgG5JnW+YEt5uw8q7oi3r2xlw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMCBTYWx0ZWRfX3xiF4Fc8xbFr
 L+SB1xFialp6bKlQ4RXdGIcYhqowieBu4IIdUq/EH2CNhOAOvGoi8b4e9zM+vPoDu3w1945LCju
 aGBXVqPqm65G0BtS6O7vvq2Z/Z0LmeWnOeC+zN2/dOGn8H8OC9P/dGtrTuQ9/nizG1zKpCtVl/w
 rdHVo0uce3MdYM+TYSFVzooGummTcAThPhUFSMpRGBgsw547XbplVx04dvXVT22gLFNrYez3p3o
 Z7THDi5H4k4E8bJA/SIculw0nIfMlfEtvKwcDT/3dOTFbuFlRMinfp/+N3zCAgA6FfKBmGLBiUS
 AvkVO7NtQ/GCPBeTqcRX98bz+B8xgdBxFAOzxVQhfhVvx49E9CHMimPbsgMg1xwgE7TwBYs+06B
 qYd8dFhTqoI3WW3U3K396HL97YwxhKOv3NzhLFz3HzfIhQvCWPwkYKyQ8FMKz1RhpZGwqNc12Jr
 tBXeAyJQ+Dxh11S33fQ==
X-Proofpoint-GUID: dMD9nLZgsa2kLBe7as7qKyhyG1kniyD8
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96e390 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gVtPwv5BqHs-4ipWp5EA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010130

On Tue, Sep 01, 2026 at 10:08:16PM +0800, Shawn Guo wrote:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..ea338d313c05 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500

Ah, Sashiko is right! Nord GPU SMMU also has a vote clock, so it
should be added to the clock constraint list as well. Will update.

Shawn

>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> -- 
> 2.43.0
> 

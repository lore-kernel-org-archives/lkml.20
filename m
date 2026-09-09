Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33172485931
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989579; cv=none; b=Nq4TJ+Opa9tlxZnT+XSOr0SBydTIdndvau3QM2vw7F/ddsKW7FQggOKPzXbQ7EnwYBoO+XaNY9IiU6zDn2u/NfhVepIGttb5mnJ10oLuBs20U5oUyAcTT65xbICqkXXEdCV82jzh56wGgkt/fojoqvAXErSmm9Z81lsAnW8EkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989579; c=relaxed/simple;
	bh=P9Q/Sk2LRR5jiHqUFrMFj46jAeGuhH3O/yPbygJswb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2WgH+yOd42QC9NniXt63fU3E3AcaBKSYfKue9AHYtcCXQ+84KUxKBzSnkSKCGlRyB2e3vdr1yIzK/+WyAfvhOh8eQBnM30fgORiC2cURGJY79Qy7R/xMGKRlbGIN7Vt/q/a4ZwC4shLRU+Hh51u6jjpvy8XRsE6Mx06Quk7AUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtzgKzxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9Kz673o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtzgKzxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9Kz673o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JJ0UG3221118
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 21:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u30C1GcZOHikC8CRum1iTKpX
	ibaQx/p5h+oGQUzFnVk=; b=mtzgKzxUbr58vw0U/M8FqZn1YrWMIGm4nRC+D+FN
	mPo1CDV+N3zEUP2NEw6cpOynIvqpghXChijVC+7KsmszZtM/6l16hWJqKGFOg+kH
	udYs9D9C/SqnZfYWirU0Cd/vj92qeYt9vYNH2TDajdU7C4Zhb/L5wNapQ/q0toPY
	mlNbr7YBF67ZKhEGdSXyEVHF8h10sB26a2qDu8ZYVON1Y2iQ+pZcUBNsFRGgyL2S
	mZ6pUt6Twhw9fAxWoJPM+w7lZIvn3JyQZNKQCYhW/85DkCup1DlMqLZ37QPpwRoT
	4ho3gCtzEi1wkLQ8ZcLsRQkvgtttGkkZgPjDg5lvw3ZK5w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg0p0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:32:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso273640241.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788989555; x=1789594355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u30C1GcZOHikC8CRum1iTKpXibaQx/p5h+oGQUzFnVk=;
        b=P9Kz673omglBncte1UK3SHdDUS5OA7ZjfT+U758RAAxa0PVPr+kBhrA/r+mdUaQTr9
         pzp3LuTMmF3KiApH+G/IWxYUXpsEn/3jegCH/grcsmd49SUdhokvGtVWQp2d3HoWrrYY
         EOFX64ze7qB8IdErnPjF/SFj17E0OkQm5yBqMkF/yZ2RZtaRx2RsXINMZtLI5jMkozWd
         rW4X5rUvxuiFf/y8CkMfTf597y5nrOkio2S2pCg5D8GwEUkag8hIm3iNreoYerObVfPf
         1YeZMyOsSopD3Hbdi2rvNjgmaDhDK3dHKLc/xME3R+xH665O313ZBUnlFy0V3v5FBjbA
         ToUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989555; x=1789594355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u30C1GcZOHikC8CRum1iTKpXibaQx/p5h+oGQUzFnVk=;
        b=qsfVmZpQ226vb+Rc7ZVWEOpgK7mqg5tM+TauWo1vo7n44yvacB7ixzmLVCib3jK/Mu
         gf8qALiqG6Z6LRh6rt/6b5GWnT4C7Y4s1/Arxgx6FvqEQI+9BOclYoH0gQnPsP7L+ra3
         hFoZBaIsa1BXtM0FxJ5MlL7Ou3L91LSB7e+1GgPkOKBB4qNWCER7uT/HD65jGRDcL770
         FJvGQwu609foboiuxq71JKwJYIklFF9DsnxCecaMqHUoeQAFynnxoxPxJFMMkR6d4izg
         KCC4GBeNu+8JT6flcbgMBfMTC3EK2y/Lln/kUv/6ZXRdrZVRlbw8oCHkvbmmwbepFJRW
         0Dbg==
X-Forwarded-Encrypted: i=1; AKwUvBzLXjKHLq+RtfPzQ3UuClEDDgCc8Q+9FaHB+iKw9pYsWvczEB80ll+0dJmSfmQzHO+0SmJOIPrE6yzhKts=@vger.kernel.org
X-Gm-Message-State: AFuF++mTxI/UqUcGiJV67f5DHrL3kn1/erbozFvuwogdXr+k5ZQ/29rv
	VLeWpDX9ROhFUv70kxAlOGr79DJQx1mnNVEwHybF4w05V2WdbJxHB4wsKV1nJ5j6XsEapXH9YoI
	4tVHdhF9AjUcvN1r22b755tFQXZmHcQoylNMU2BPCaOacQ2+bBOkqYEe+/6wBRDhFpPU=
X-Gm-Gg: AYBFou0zn0QZ5MgCmDoErlTp12vLX3KczCN4bRW4UDDY5JqeaRB4K3pjq5r1SQmqRSS
	T4xoEUQu3XvaZEGsomTMP5SPDHgfU6WwNckaLpkMEAjbmHBukrdqTmbmungVdQDmiUllf1ASaER
	63btmPv/r3quKVcWaV8egP3wO6hqR+a6YnRVc6TmHYSgEGubr88XUiqLdmFhLo7jPPIOLF+aLXm
	KcE97qH+2/CTK7VyF4+fMNiC6yZ18MFVPAFxPzQx3KzB2Kfch2EIetcG57M3sSSoxoXe6q+fHUj
	VQo+bJV6k8ijBdMKQmSqTc3yZFqVkGNHvh2NFRInlDXKuWhF5427VwDZRbFE3qzqc07vjyPEENp
	CkRgseM79gclWe8ys9m/xcv1IEg6HYuzOOSb3hV+lww5Xag0r7nC3AxMQGGOix5GVGjBofqxCVN
	kCe0mLPe4n0pL6
X-Received: by 2002:a05:6102:838a:10b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-790d8a0f189mr416310137.6.1788989554985;
        Wed, 09 Sep 2026 14:32:34 -0700 (PDT)
X-Received: by 2002:a05:6102:838a:10b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-790d8a0f189mr416280137.6.1788989554514;
        Wed, 09 Sep 2026 14:32:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b75a0ef296sm2122050e87.38.2026.09.09.14.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:32:33 -0700 (PDT)
Date: Thu, 10 Sep 2026 00:32:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/13] dt-bindings: media: qcom,sm8750-iris: Add
 context bank subnodes
Message-ID: <p2rjkda4jecjd7lfaskz3s4e53a2p4zgqvnlm77kb3haqglrbk@qq47tbxlnuck>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-3-2fe43ae45495@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-3-2fe43ae45495@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa1d073 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0MSBTYWx0ZWRfX9fYpqp1eVnpK
 KSrH59eUwcRCmHzO+nvAiJnzVREiNq9uKBnf4FUfM4WDKIp2+ZkL2RSAeTFJRwd156AOWvPhr/u
 EhmlNfI66cPKWwos2SQy5GvKSI69pzY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0MSBTYWx0ZWRfX1M5348bAeIRB
 BcKluUOSB7RhSc8Bmo27qWt/uuEmqAryShpvc4ElMJXK15fkdYV+e3gMWFuDL0yFHe6v9sCk6T5
 3Omh16RTpztDmkfZasCqPN3GvvMYKaU92GLqCAZrkbswBmsUqPRnoHXUdgc3CqQK4ta4pMtFV/7
 1IGtKBtQv8KUDTUar1ZRY0vpowmt7MiM2gn20fOleSwYNN30GWdHw3p6n/idp9SrOldZ5k7ZSYT
 bk3HHIXdX//fpEd6/8XGWjrYQG6EOAF/oEel0l/cwRYc1mMpr2XYyI4wt9a+ktpAnq1j7hmsyaW
 QV2G920AJYNp1FQsr++3lofz8nF0aM/5uwnWxGRliFE21E//+lovJqDF1fvjFAXpduqRLUCx+tl
 TqhTQUMAw6if7vfvIYYUpkjEo4xVDfvtaB08OSYhURomarPNIzM+bPNs5W34KaLCNTwTiM/MOfO
 Pk0xAotRFqwzzzKiXtg==
X-Proofpoint-GUID: Vh_p_wkmV081Q4Iiy8eqk7SXdPp-qBxz
X-Proofpoint-ORIG-GUID: Vh_p_wkmV081Q4Iiy8eqk7SXdPp-qBxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090241

On Wed, Sep 09, 2026 at 08:27:10PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> Update example to the subnode form. Doing so, it picks up the supporting
> properties needed on the video-codec node, address-cells, size-cells and
> dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
> with address-cells and size-cells as 2, update the video-codec "reg"
> accordingly.
> 
> This patch depends-on:
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8750-iris.yaml           | 187 +++++++++++----------
>  1 file changed, 101 insertions(+), 86 deletions(-)
> 
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Again, drop the soc node and adapt the _example_ to use 32-bit
addresses.

> +
> +        video-codec@aa00000 {
> +            compatible = "qcom,sm8750-iris";
> +            reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +

-- 
With best wishes
Dmitry

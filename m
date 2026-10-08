Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345BA47C10B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454737; cv=none; b=G1wwhTRok/7RHqCBXmmdRRM8BftQRnGb55BLMSTIe9j7oKWe5QoMueNhwIPfJZRe7UAJgVVEs/aysXktsl6a/CeGpUHPxq5cvsswYiMx8+XPVheT56hHmJGC6EwAKhTIXJAa7yKmgeOwYT3zU8aaifOp6wJ4uFuF6aPss+uNJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454737; c=relaxed/simple;
	bh=rXosPsvLDE0N35+gKeSxYiKPn1SY6RoHqsdmuKH+qLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaVie6XucFrlaM3PzhN6OOUZljDKoDPVc+q3zXThoMceoic1xXEeZSwIrfsJT/yAJykV8uSn6ocmPTy85JBEVDIgYsNL1OnEG9RRgRiTl2C993HruW4IPmzZwR3xuXdhkGpuAOP4+I/0mITBBOOWKUVI1c7ErL1hQcLE2J/m4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9q/Bm01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9SSDRON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9q/Bm01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9SSDRON"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KMXo1845663
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ub/oN9RUcaedJsIYdTUvMbto
	dFd68Ql1j6KDWzLpyvs=; b=P9q/Bm01oa9Tp1APTOssvYVdT0kssicmV1Nl/aaZ
	Si9VY1s8pcm5Esq3/xr2GzIUsiiEfWcJQ9W/R/kxj7IulyOaDSh8oESNDHGQThiR
	A6eWX0nn/YnZEaxq6IRAF3IPHuegsJkC4n9gaErZc9NUfpuFFMqTCNa6GRJfgNGq
	oIeboudX1hHY5kLR6ryq4OvViLX4crF0pC32WAkIPAdHLxBIDAuObijV3gJAMcOG
	SZVIZLMDMPyWgHgKEMDE4lrsBq8DPp0ja5sn7ggSO64Fgs0be5yNXR8Oqm4Bwjbo
	mTaXFrUwehZ5812BTmVXD+8sGbrmKfw+PCiUIaNCyS8pYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jgtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:18:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b4bf686ceso1393576d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454734; x=1792059534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ub/oN9RUcaedJsIYdTUvMbtodFd68Ql1j6KDWzLpyvs=;
        b=i9SSDRONWhBxiTpcCMmrmA0R8rGJE0xE59VFiGjnckwhaNNvREP+/zIfjcq0/5sman
         0MrjEjLHRiMo99oEdwhsHh+8qqeRPQl0qsnqqVv6/ZlXDdFLGsS80J6HRa2AMqGEah2D
         rZZDvb74gjis6h0eIo8cDtE+YvggT83bU82tYRl6oFg3C5cujkvP2T66nYI8erlAkZf9
         wBHWVk3wPKAc+mUMwInZ0fjOeMlgSu0CsJr6HeZHNOuiSS4HvDtpv84GOmCL+sAyzB4I
         hVv8HMFE2DTNfLkttrAWcCJXUwQsdyGnhX6nKqbnHsMCtUX9t06Or/uFsJ1j4/LPGuhT
         ihHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454734; x=1792059534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ub/oN9RUcaedJsIYdTUvMbtodFd68Ql1j6KDWzLpyvs=;
        b=CJcdDHuuxwQfBQAUAn/FkUNAP3E/Zto/o7AeSi9TmS78rVkFpFZXp9DFDzOnYN6zaF
         kX4UGhc8XMPTbBKyHdlP7eldxue8362HC2U6i6nU0YkcIa3HGGKX9jRaYSNbedFkerB/
         av7nyo+X7q6A7xwNbETf8epTHcjbgChJiQJz6C0rd5B4AXPFyYdGFmOCEViz+tdlV0zN
         ZHFazOw792LIifkzOLix79/SKSu6iNfh4k2wJo0A2hKOzLvN0X1MLpA/SSzT8XUYMk0m
         nJE0z6E+GNzXuD9IKlR4oXr/Q98I89id57NUE8rXSF1PHf/fwNDBnIdWQFzRo3t+Wj3z
         hFqg==
X-Forwarded-Encrypted: i=1; AKwUvBwqh+tNxm/KhEb0cv4BfZtDQdp+lXUWlqFefjMGp2E9knU+tJt7cwXHcDv/k8VP07bixzVZc2/ZG6fvdvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/NXffPGoSm/zAkIK1q+Gq9vnHy5JGAbwcZGUXIc8sv4nDwKpk
	6gQHOi6reByiE4XjOWMYSzLgen+3WNV2rfqr6PLZ1hBU+rGSbcxPwF9cwpjxqqLqLVhFUPg1Qoo
	IUEbjOg4bRxuGe9cz9yXA2kOILfNDfWhqVbbF8NfUHaC0EtRJWHl+PNREAUKueeRijkE=
X-Gm-Gg: AYBFou2ZMdKWzC3E756hELDLeV8osAa3+VDDUM9PGBGLnZbZbyxS1VK1qz9DnA5ItdL
	5KEPzUR6VzDg3ZxKiNWJWvMcqZDnng1nqwOkZ1JEVtqNTcrecFz3c2mV7opAn+YLmyjZLrDaAcp
	7Vc8IejisKwfcildiVP8lhwN4B8sp5988B9jeb3o6Ga/halZoEA/vkUpih6ODAre7nOS74lFmJ7
	sebfQYpA1TduglnVuYcGdeOkypyxCr923bzV/6TQhfjjnVgCiqXKYqea120winzZWhiQ7Mpp92M
	4NH4D6Fw/Ek14i/08Xv/aJ1NWyW1kOgz2iInXM3+iPrpsNBlneFkDSfVlJ0rlSirX742Z4uJwbl
	Kk2ptwMQvpgvdAc5BuimZvxQjFhsvDhVHjxzr2s2A53IWSuqmjskahC052Ch1AZrSOlUuYm7gyh
	+KmN437Ilr/D3K
X-Received: by 2002:a05:6214:c25:b0:917:848a:43de with SMTP id 6a1803df08f44-919976ff4e9mr93260076d6.8.1791454734349;
        Thu, 08 Oct 2026 03:18:54 -0700 (PDT)
X-Received: by 2002:a05:6214:c25:b0:917:848a:43de with SMTP id 6a1803df08f44-919976ff4e9mr93259596d6.8.1791454733894;
        Thu, 08 Oct 2026 03:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d32e99sm14950571fa.10.2026.10.08.03.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:18:52 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:18:50 +0300
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
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
Message-ID: <zxeidjkxjz6ylwn24maajzn43oneiglzuwyn46rk67bgovfj3n@lg6lk4xuzsag>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX94y6QNj9Rtnv
 B90p5mjm57gq0VnXdNN+W3vW1e9Qj8DwNlj7EpWyDstWGmTkl0NJxv9lczA4NW1b0DWRpMfhx6g
 dGHkcZNd05IvDNaFn0/RfAUFHuJtqPA=
X-Proofpoint-ORIG-GUID: oly_AD3ov3woiT_FHNi1lnqmPkIMKped
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX8hYztNHLg0Ik
 euv6eCxuSTdv1u9Vg8XjGjrteH+CWwh+fBWSswrw+oUAeEjDNC0co6ZmC2SnbbFQQS9Vs/joRNH
 xsKSzRuCG8ErflliLwmhpvRKNrgzAzM13A+8jZkZ8bxexgHnKVAxhMU8gvYa0RlG8EDtxpjUMUq
 RUpHhkZ+CLcnaua7efVSZlZFlkH9cwI/JmBPUTpAzbylpEp0ThPSUcXoeyAxZgDY3YaFepOWAnR
 2IripRqnSp9GqW9CI5plFoB/4LSqBgUFjrVI9JoOb6g4+pl1xz8D94agLtH/9M2Dscu3SIMfnqQ
 tGiXXnQjamATuxXKPJ6daJzc7WMdYKPlnE6ieCTOWrk8HWbzGT8ZqDsLv2Ui0oANZexffkMTorR
 1ZUcby04vNHFEFFHEQTgTeZ/oHQR9N56QQidUSOP8b3bwuqVyBV0ffLqULHTN3vu36F5cpme8wl
 /GCjx/NxJDm0zkcs1Pg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76e0e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: oly_AD3ov3woiT_FHNi1lnqmPkIMKped
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:07PM +0530, Vikash Garodia wrote:
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
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

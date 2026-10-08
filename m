Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808CF48FF6B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454759; cv=none; b=H4HgdZgm+x83WlZtO8qKZroVPsRqLQCdPCQhMb4wwfILImY78F9apk6LavebopSbBT6+zW/Ae90z5kPOpCxm6pBZDlhqEcg5LtxJXn4IRAQOUok53Ay7/J84jOIqS8ycL7bE9R4yduOky+FRMSVb8LdwVKH29PsVJTeouvLCj68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454759; c=relaxed/simple;
	bh=S03LwFerT/ooRJg62vlbHpT5llQgKvhDDZxiJuNZIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/xP3KuB99CVju73aQq9ZbT+FUHx9p5jMrqevAhc1uqCU5jJ6O174DuIYIraaLauaC3d5ecl74B1PJTx/+lc5j9HOmozEaq6WhV7MNpHFIrbfmTcjmtVIOtBLbD5a7ZIROO/eirs10Ft2u+KMKl3eTUe771wqcrrXruKX06GA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+3VWlVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hibD6EP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+3VWlVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hibD6EP7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPLB2167108
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g4FJlDdpi5DxKcM79pJauxat
	KMVB0hxE7B8PqzHViqg=; b=C+3VWlVKU8pC8aZKI2i/yFCj6wao/v7/U1raJzw3
	R2mf3ukU29ZVVludR0ZAtvmWK7u8YiV6vuZKoz30dMu0QbpwZ69jUFOBSXs2CI1s
	lZ+51hWpfOgiSeGLmY+Ie8mVP3AlB351/ozRiOTOeV1dx0P4tCSyeDH+rsuRF6vk
	YQz8XIg1CyAV8HPkHSr9L8IUISWfSq2asL2es3cXxg5pW2t6+dUouijLHDymk2AH
	5M3sZSz/Ww0Ja13znYoDX+BmNkcp2jSppLh82NDNS0lBY1wDdGlfFuiQc9YaPh4K
	tgF6JJriwAJw0n09SkhwdPiflZHPHhsxuJKHIwX3VYp4yw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2thf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:19:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c124d17880so884304137.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454757; x=1792059557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=hibD6EP75Bt9l1p2vNVRnWBbNde2un5e8tHdr7KZL95iVtNi+G8en5OAkKIvwjk1ds
         myByIRZnD6FqUgrCEusRRNQJ/bm1HeOVTFslL2tPpHjf6K3hM4PimdXA/6R2MwwetSwR
         QKt3iOkkWrQ89WDwj2RAwKTKefhwv15LOQiFnm8E8VF+Z3wvf9M77rq2j+adJeERIRkj
         FfxMw/5OY3OoQQeYySECplCzyle2+jibtMsT36/y4AuyjuHvX/eYO/DDoia5VNNOHD43
         Fxjmu+pAHSiC9NmobSGzpUbrWMEzlfOzfR9AXWbGqncUj9YnR5LrEq/8LfBMjMES/pA6
         vGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454757; x=1792059557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4FJlDdpi5DxKcM79pJauxatKMVB0hxE7B8PqzHViqg=;
        b=jN73dszSWjvOP0JQ5afsofm1YnJ2nGfUug41JHe++8LmP97qFoqbybJcSU2uNKeQdR
         6RuABPqpndC+KirQbWm5Iq6jW+5gM16mlZyMVvQ7OMxjAiK64vf1eUBM87vZgcsR1x+n
         +lu9pdLnSbNh94LTi/ZjNxySuxHKG/bKBhvnxnkovW6MVqhwmYOfpvG1eXGqV4THMmpu
         S/c53RESlqVW8lC+B/qrPjFQFz8twVwBNWvZA5+B8D+rl5CrK9pTxCEWP5R2h4iec24w
         eZMZ7DwEQCnjYTpAameUeh3oW7uPCvKNcbudcfcXNfzgFONJCNSGC6YiWnEJxvOOvQQ+
         Rzkw==
X-Forwarded-Encrypted: i=1; AKwUvBwFzBnWimuqo0eqE+MTkCh00+ZlfJJgON0OZ+jfDD7EiNfpCU60qF4n2N/fw7rj+2Dm2CygS08/pAl/VmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsGBO+goh3CqHc8/XAZUuhUoqdD+xJ4jAYzYVHqcD6Ex4RqZyD
	ALn83knIM6Pwew8DvFuU6KdfPZ/jBfrfHPIJaKfKTKstXettIFhE7v8z++ssTf2ACRZIeriX3dl
	UeNUoB0cKcJRuSTabG76Bslr1jNTJiQMWe2rtoJ6gwPxk/O0tJbOiddrujO+w8csSVnw=
X-Gm-Gg: AYBFou1akm4YHJ2p+HGskpA6e17N4twTO0rOUvPpYr6eLsxfce2pcmFCngSOofxxa4R
	9JcqvR9Vrn56Evc7K0ds0AU5agTyoKqj78EwgUUkxUS1BwPxQRz2gM2CqQ3LJcHe9BptgAFSJd9
	wjkyfZ2/9P4AnPQ3tOsllZ8Z41ezhl1ZnA6dR6E8tjeF9M97BH7DQNJCt28N7WhYTPI7NuvSlc2
	gvzFq/aK7nZ3ruF2jPgrJRYbTsjVXLmJq4HETq47AAAGrjoF3DUeOsmhE25Wtr5sFyhCsk9ybJJ
	TJE9vMkvpmAp11aYmWi01hqvRGM2o/TKYPipaO8hZQeZhIuGNVOW2zxIkAdSMDHstC2mBOk6UVv
	qJ7TAjd7m+Ptx288NrDNWdtkSpXtRPjnOGJXIXI/ft/mVZtOyDqq0714RqWG5mcRkIaSxxMWHhO
	+QyMIK3A6dPSO3
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135555137.17.1791454756422;
        Thu, 08 Oct 2026 03:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2a5a:b0:7ca:e2c1:9a0f with SMTP id ada2fe7eead31-7cae2c1a9demr135521137.17.1791454755764;
        Thu, 08 Oct 2026 03:19:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d65daesm15254111fa.20.2026.10.08.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:12 +0300
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
Subject: Re: [PATCH v5 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Message-ID: <4l4rq6uz5f5tfdajn6k2rhbbrnkj34rjezxbhgyttvs6yqeqiu@ok7s5hzitxnl>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac76e25 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: HiqEH2zAtn9aPVaeYRcoAjA8mc11FwXL
X-Proofpoint-ORIG-GUID: HiqEH2zAtn9aPVaeYRcoAjA8mc11FwXL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfXxtjuTsQr9M84
 Kn4e1D+PsflijfDYLs3jjjX3TMYB2gfBxr71RBQ/RMcthDk/5Rz1RPdU0GG0jn+O2qUq6ZIAKrN
 6B4xfexI9gyo4bHdwauiAQux7ie1yAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX6C4zR1/UaXQB
 uCCsaioA8V8WMhJs2g4KBQhVkh0BdMBaSPBY4GrDwhbFc5YJno/plM7agttkXDdWAI2KpWtkBJ/
 /QbNEIhh8uJWpKbLkQpsJwNdauqiSuWYs/zXy1SPnjaq4NeTLNA5gfU8H+0AEbHPoHelPuWf2a/
 ONkt8O3VcDQNLYbDcjEt9d5g/XYm7T+l4j0is5akl5gVMUywdkw28jonNmg616XUAHzTOQ4LQVQ
 LT9/8XMGp+AXpHQK5RQ1Ys7FZOgFKMEtNo5qH2FoI4J/HJNqs+H8OqpRPDfhv+z1Xw+gHs169Qz
 7dWdGugj0l0QSe6o84WdEEWpi3j91XIceDWWRd9qcIz+tq6Y2S8vzm4xtxdUftKIGRKpK4LY3ON
 ho2YlbUTxnF253gjz69YNQN9Efr1qff3VaiRMv07XcKASr1Y210etqoLZx/UQDB6KZLKid0l/oB
 dlRGq2eSV1AG4sXc6lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:09PM +0530, Vikash Garodia wrote:
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
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

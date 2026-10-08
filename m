Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD14915B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454782; cv=none; b=qAO/ax3/CNbQg8xX8ZZ3POZ7Kmf1kC7hJ1/kj8CaX94bKePJWCxeo4FmP7QBsabbHtryraWOajZKSunqJ0LTeCH1fNC17dvd724/PNi0Xe6WRTeyjiBBDc85QCzTY93powBnG4TKTUbL+3hEbFLyrxwxYPB+NGOL6qEaGre8F7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454782; c=relaxed/simple;
	bh=9JUQwRHtrh6LmF50Qf3hpplRunW+nkMCw2EY1xv1FJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSYwlLz7mFvyx9NVtRS7clVHhFoZGGJjhyj/y9MGBl3UtmOFVivASFXm9nEAYU6UfETLtRUtriqpf6gYJf/1YE+ZacTKCsV7mkzZ8K9jL/fDqzND5YxBMGU0Gai/lcgr/yQEPOvt9/0IofIsnmdjWalvxrmXZa9O8xigoLBr8RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKUASdn3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfn9jVDO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKUASdn3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfn9jVDO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KXtk1169984
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6H0T5U2oCXzXTsGFtUQLvc/D
	2nAGb9ZZvKdVkWJRxzg=; b=FKUASdn3Eirs3A8B94DY7bYvm62UlnXIqh0r3GUP
	JOE8B77vnW3ORkvmFUHEIwmE/RwrkCsAvsP/AjlUN0kQwy553S/mVydYU5FRA8G9
	5nqBG6gPQdJlKCb43/S9LpMb7u2kiHQUwz6BBea+fH+ahYVpdJ5c8hRwGShfEfZr
	EuZQN5oOvFyEpOm363uWS7d3K7CBiYEWMUrVcdBahRf0WuC3jyu2PPq1tebZ/85d
	LF2ZCCmeWpoWwuwJpegT8bbVk2l2AX5KCpRv0X8l16QJPWPRszpYFgkHa+iHEPaq
	crBY0LOmd93zSKzL0q6NF1KbieDbVy/AlDRG0TenWu2e/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3acyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:19:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso1099941585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454779; x=1792059579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6H0T5U2oCXzXTsGFtUQLvc/D2nAGb9ZZvKdVkWJRxzg=;
        b=kfn9jVDO6OgggzDqD3AD2zSSLk5II8AzMjpZhLrE5Xb5wGowgB6iEMxuojN8LOjXsa
         WV73fuQCP750Yoxi5qgaB+0WGefTuEaelAHNZny0dsIJFUAQ8Wtq754aGXpU72KGZBwP
         oQ0ygzhWQquBjSMg8Bu8enB6suFetPlBoXrakV7kx8qo2Zk2tYP93MLbaLc4ROz6vDXn
         XSRydDf9VBw7R4RLf+/VEvjRBraIZ4h0OBfGbhVCT3iRker5AIKuuA+sZ3rC7qTVwNv9
         hfjoiAu//+KtXUvEZylpZLet8Khfi+nYmHPWQU2si66j0ATbvLRwHM+pyTpgToeNf0Cm
         F2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454779; x=1792059579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6H0T5U2oCXzXTsGFtUQLvc/D2nAGb9ZZvKdVkWJRxzg=;
        b=IEH6o10TpZRES0JuKujTXGdHOQY6RMmBz0RYgqxipAtRvtatfqdg0sd+Mt3ZEQSSrJ
         qgb6gOC8YZTuMF2U5sljkjJhj7q4BItUDrlYMGF8UwwAsmdzN3qBYwx3en8TExPMVxIn
         xapw/DeFGF4EGJCsTIAV3h8ktj2I4pPPJjn2/Q+lKqq67WvCXO2z/1B9gvZK6FdSPU2v
         t6ldDg8KJVYER1ZH6K0xM2LI61FzsTZHP0/GaVa+J7IUkEuNybx63A5oTt4xYl9zfxEk
         RH2povRkODcq6sc5VeU8aNUrRAo1JOEVY9gKsgs7HNTIMclL8mrQ3SLWpWXg81zYeEyL
         hp0A==
X-Forwarded-Encrypted: i=1; AKwUvBzGpzCqL4CYPfyQJYU2AfR8UHDCJPQehgV38VlammwchSmStl7rf2jF0sC52lBEDR+vznQ7Ch72c3yfvds=@vger.kernel.org
X-Gm-Message-State: AFuF++k0VzjnYpusyNUhQTlU9uTx0oJapEyW8+ih+uJMI5Cciw4dId1o
	ocHCml5H6I13ncVomPPTv42+nB0jnmhuTk5+Q+QUGW9sEV+qXfCzS09vzK4v9HK17lCoNmmBY9D
	hPxIgQ042C6Mu6iuJiANdvDub5/Xu9drJOtFKKvoWIwpxkqB/IVCk5PnRlkHdtoIite4=
X-Gm-Gg: AYBFou0a8bsbUwH4YKhTKiN5WqCoWYAOojdNFCID0M/UTDa+4Y3ocm7jo5Icdun/m4k
	A/ko8Im0I0sga6IfdBZWJs8ZmeVX7wKMz1ugyi2jMHLb+viDcIvjd9Mk4LFsSQ0iA2mEHAsurmb
	2n23McuWHtZS8j4ADNzXKGfMPqUyycUAP+rWcWkcLW4uwvN+buTTW8NiV/uCbM2sxRyl79BcPCD
	gFijtJKXjUJPIQ9TwTGJC3clOMZK6kRH/jV/ht/jnWqdM/ipAEpRR5+A5xiro6uEqygOFHm/XQ2
	oyJ+evBUsX9ckMfFX2i6BJ3oWXe8pDMNPyrk0htZIi2fxH8FEgh/kU0RoCE8HSQskQe+rNwaABy
	2bywcOgtgX1eBju32WhK2WEMNRQOrHEP4DpYOL4dzAuHPBSM0FGIyKfaFCDdazXzcKtw4/RY547
	gObWMvRIwgX7og
X-Received: by 2002:a05:620a:2b42:b0:93e:980a:88c0 with SMTP id af79cd13be357-93e9b8bd28fmr863821685a.79.1791454779248;
        Thu, 08 Oct 2026 03:19:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2b42:b0:93e:980a:88c0 with SMTP id af79cd13be357-93e9b8bd28fmr863817085a.79.1791454778768;
        Thu, 08 Oct 2026 03:19:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd309c569sm1064326e87.64.2026.10.08.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:37 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:35 +0300
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
Subject: Re: [PATCH v5 12/13] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
Message-ID: <p4b57fqad6dbwrk25v3p57ksvbhxujrggixy2tvbzfx2xbthlr@bnbw5ysnycry>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-GUID: u6M3evw_IKtypvqfimU48IHHVL4vQOUj
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac76e3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfXydhi7DxWF5B1
 /IdtoqhKTm9EvXWfQhUTsSzfojFDEcsPPPmeH6UPPbcu6zWAunirw9hvfBnEo5DKGR/oXvDN91t
 q0iviQNmygumt/L45alQo/LhcGM6ajA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX2PBeyL/HOnU9
 p3OBb0UoMi5eHZ3pIbJjI1AwEX9nK3zSe5UXvoUojmayYnL5hnrpfnNAVIxT+GWS9ZJugBbCFau
 UIcFxbLVYznCSuXIK/pDNMYdlgzqU2mWLpKje0MITWUIFSD70IbkQwKFtYrOFn3shKVY9god/z3
 GqCQkeJNtE6w5jTvX5YBLZTLUc2GQ2XcTbFhzOWqitBDdGhdMpojeic1zWQ085ygaZuuyXJaF6H
 1DqikMcxGYsI2qWJlOgpCUowoTdkJysi7NkVtWgHad2FEvcJjw+6SRGGnFAw0kwz28HaxzXLCvD
 vkrt1LquHg9WZgFb2AhRvDEMWzXoNYTN+7meNCfClSyYpUv4ky1QSTrwa2vK4KbmLUfcJqfI/4H
 izjO0zb8Aqb7TmaY0dy9yfh4AKN40XIeJ5GZJtN+LKHtM9gzE73Ere6Kx/cLbDHpcpntgGZcmus
 8nq6FbJ/ftLzN0ivq+Q==
X-Proofpoint-ORIG-GUID: u6M3evw_IKtypvqfimU48IHHVL4vQOUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:11PM +0530, Vikash Garodia wrote:
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
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

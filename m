Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0355D89B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874090; cv=none; b=dnx6ksz/DiFCQ523+vifplDEwNlNTaxiBL6kticuG2YwXJatXBDjcjYVb/fl3ucmVH5Vs0Vk0cMjSfeFWe/8oeAc30nrzsYN1nCw0qhiBwK6kc4ifbSLfoOowczfXKtuyUZqzeso3hh2BfdHA0gQIEKBljA2a6MZ8VS/vB8QH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874090; c=relaxed/simple;
	bh=e8BuZAhC+MLAr3dIChDONBH6Nn9xUIL3CVxsjkAI9pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrdSGkZmUO9jK0UP302ZLLMSDWS4m2xmcFdto93AsUS1oepevZdaDKA2+nhbA/R4hWJ2bsedknNLRsotzvcLHeZ5rnukhkJ6EHeTKxsRqyb84LC3Tru3TAAuV5jfPSffvR1eiOOOLeC0AAD/hD9X2N5/pZRUjUTIJU64rfgx2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHktZt23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgsC+tkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHktZt23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgsC+tkl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CknV13573819
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 13:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xVBfE4bB6UBnPqaf4fcSGOt+
	V0oC9kKvBZySwiRwwVs=; b=KHktZt23Nu/EUKMhStOdFK/SatUoUuxEpdqpXY5e
	4UmrF5lo/Z2FvxKvsbUjbPstOQcuAv13/9v1KxWUAPxt6pD0nAcChhOPzfDisAKo
	lOfOMqKhyz6bv8YYbYChggjfN3Ri1/HwXhoCWAIji3FHwwyikwKlJILMHVLQksfn
	AIOFywXG3OK7+yDirBlNOA5YIUUInadxAlgUmRP+C1VEfFfCeY+2uVJMEO/aKjUF
	zgNnKfBCrKW3xEivxg/W3vRQ09TUCA3sJDycWc+25erxNkMsVYVaQ3S3VaiPH7jt
	HsLoF90GzWry+XB4WtkT8tVFt4PiNuUmZgeEdjHOeTpUcw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp48wf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:27:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78d25a8ff32so253833137.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874076; x=1789478876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=;
        b=dgsC+tklxaOovxqcRSWihGHf6DBEG9AO+XFLHw7Rs+Q8AMzq4wSJ77GUW9lfZRhwk5
         sSHHizrNJiMmAGQfyH8QUj7UYqm6fA/oFw3rSx2Exd655wy5WlPY/83ftpgWycQx8zt7
         ERyjajksIw8le/A6qfcegc5BsDlx04GUWhzUwPq12NFz37wrdSIW8KLDKryKOSBy+rEx
         EwK9IJwcHr4Pty1mbC+3KEB522LIMhdaTLEAuRsNu4R3R8A35HbhT9Xnx2gWTCOiLp1F
         qGIZSK+yX9yjDL9ns/arS3unIG8++5ABCmz9sUG1ZTlUxSeyIE3wCfxpBTTGJzx00Xur
         F/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874076; x=1789478876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=;
        b=SEGaTW/nIGSUVzs/BMnoJ9ZIMqySSHSzWsXdGZKfCirr11KDFgG6IJPtbTem1bQci8
         tLLnuvyqj+vhZn5oy4RHEXuecOEbjmYbIUNw2qIAKlvpyY4zVUW934LY3wycv7VZ90Kb
         AdlJydRZBVjBy/3OmBTzq5zk7IzS7M9xiEBnTtcZTCsUiAWUmiR3Xb1kRDP1osc/FHBQ
         JK8gNhVBgjf298Y8EiHZWkWJrxMyqD5Y536YUS4BszP17Rl5lPbK9W4fbYN1kT2zbLE4
         w4KtFChmoFWmFsq5kaKmBMb5ShSr5n6siwBm15jJug+vynshdTKeqrKRhjqr7H7dw6Ep
         n8Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwc6Z5k1kfk7z3+V2ThEXEUeYh5tlB2NW9OWAfY47FkiWnQFTXaEW76C4IIo3y7o0nVm1PP0XfPqhcmZFA=@vger.kernel.org
X-Gm-Message-State: AFuF++le0wdfEZl9lDa5H3OB4p3s9yqQXcK51iwxY5T0RJE1I4RVuMD8
	EXKYIcbC6fHCo/H9sEJtFZKLOUTURRAZXCEdLEZr9PFmeRfpFeJCpB1LNQBXluR8JvV/6iYMGKZ
	o4Z/hSKQqBaf24wldetQ+lILYy6GKYwCEK4K1DyeEYG4u3CNHz56F8DoyM1J3uQUFvQ4=
X-Gm-Gg: AYBFou2rqL8t1ZvBX2bTjj86VRV8uWMy7T5s3YNmq09ua0kROzej0U4fBmW5AEXTRrd
	RhZLRribQ3IuNIxrf4K0ynvx4efTXEJjTvYSqjzjOSr16Ub2voTHqAhCK1uAmE6wE0pytNqJqkT
	HOk8sGvkZ3qXxXoi71QTZzsltYISzLYM0bHDbVzBrthfLudwLUAoKukgZLPLFyDavYTsrq8PJl3
	8x+CXDIBHQuy0zQ3ZqpgPN/bhgeNw9kPBwjYcxYnZA9Twc/2vPNH1Z/3j5pd2SnhbnDhu023q0N
	WfQIVTC4nW8leblq+R7Jn+iq0wv90rAVL3YU+UF0AzePryIU/RzLtWgUuBJi0Hnz8qI+8q2gE/Y
	jKWKQvwrsploJUxeIaoMZmTFDKi3JQQHkKSPTy692tA+GqCUIlaF8/aY6wpu1K/wW/D0PaNYavP
	9IfyahfGq5uGd5
X-Received: by 2002:a05:6102:554a:b0:780:5605:743f with SMTP id ada2fe7eead31-78a4a8bb311mr10294377137.3.1788874075892;
        Tue, 08 Sep 2026 06:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:554a:b0:780:5605:743f with SMTP id ada2fe7eead31-78a4a8bb311mr10294352137.3.1788874075438;
        Tue, 08 Sep 2026 06:27:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cbfdfd7sm2572414e87.75.2026.09.08.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:27:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:27:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
Message-ID: <a2fy6smhao73nr4od6wo443622ym5exlj6qp4nb6wdfzgx7nkb@35a3nyftkhur>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
 <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa00d5c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JrPXT6BsTxOl0o4Vz8AA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: BDBG59R0p3o7ELo_sRNHKub8cUyTTZG4
X-Proofpoint-GUID: BDBG59R0p3o7ELo_sRNHKub8cUyTTZG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX9zWE0vgV3iFx
 9/1LhzkIGJJwYZ+4SYaCekFS+eJgEfVCzydutS9P4JnB4ak4PsbHeI7gIBeVQxEaQs/a3DDtzp8
 PctTKkOhfs7SzG+riWsAwllKCst+cQOeoJhZVsD/TbqnYFwp8hj0i9GNXF4U0o2E9oMYk/FiF17
 mD2dMKw49Z6C/AyucxkujTUVQ1TdBV/JSYN+q78tlOveRbEbsfAPnrxA+ocNj4n7q0PYyGWXN0R
 9ja4XbX+hZ2Be/oZA9cjvtQWJKNS7caTS2TxURz/GQanG7hgelII5W/5n0+QX2PQWmxbRuVS9wM
 +eC6qVunpvFR8ViwgAlQQm7NA6XzzukxLtlM6P27nNLfI0lFVFY1KaXbXSZHLYFrHbRH1M+21/A
 7F/UE9Tj1dMFa4eT+McLS6ULQIkIamMPF0/1muJNoJB+3dfIr7ir7C7KRHt5WZ8/kzHffEK0zCX
 Ea0EzlmldT4ErWUVGLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX6fq7/iOjQcSi
 Io3D7Uj8oVfVT0Vzx1FOlQ39tsK+s6XOd2HGbqhw0risL80rLWGjdirNRM+RsVJ+s8KvBqUF1dB
 iUlvqDTVTxuUVAX5uEliQiM9HgCb530=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080144

On Mon, Aug 17, 2026 at 01:40:43PM +0200, Konrad Dybcio wrote:
> On 8/9/26 10:15 PM, Dmitry Baryshkov wrote:
> > The GPU on MSM8974 has never been usable upstream because its IOMMU
> > cannot be driven: unlike the MSM8916-style instances this driver
> > supports, where the secure world owns the SMMU global register space
> > and the OS programs just the context banks after a restore_sec_cfg SCM
> > call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
> > up its stream mapping, so attaching a domain leaves every transaction
> > unmatched and the GPU faults on its first memory access. Verified on
> > the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
> > secured instances, while the GPU instance exposes its ID registers to
> > the OS (IDR0 0x78034404 / IDR1 0x10000003).
> > 
> > Add a non-secure programming mode, derived from the downstream
> > msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
> > program the global space at runtime resume instead of calling into TZ:
> > clear sACR/sCR2 and the global fault state, invalidate the TLB and all
> > SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
> > downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
> > fault reporting enabled and stalling disabled (sCR0.STALLD, matching
> > the downstream terminate model). The stream ID map is per-instance
> > configuration data since it is not discoverable from the hardware; the
> > SMR index allocation keeps ASID == context bank index, which this
> > hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
> > msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
> > requests to the L2 slave port, as the downstream driver does for every
> > context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
> > driver never needed to touch it before.
> 
> At this point, would it make more sense to retrofit this atop
> arm-smmu-qcom.c given all of the differences vs 8916?

I'll take a look.

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6D41D124
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359331; cv=none; b=sJigVZ2rcHDuaqb1+cgaCWD31vbM6fGiqhP2hh37yHe8gY4c6nyQVWemb2EzhuJWLyp+EvEiRiwrT/12bEngA1TPBuNR56FKYV/yVtIlYbVwJH0Z/VHEyHm0tfaqzAwKYjh4VTmJjIvI1GxtVKHDGGdIXWdSMtw9fSRWXQNj1VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359331; c=relaxed/simple;
	bh=6utujesN3gBDkB6EXPDDR5CLOd6jQ6lyXe/vePhF3yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9IKlU+AATWnZuizBZVle0ZjUFKVnNtwGQWe5bnFQHwerEtbxkBVjDlnM7qCTatpeFWYCVGGWwR+AXMR2OOXckCqKXeCBOMUcBJoMvrv9uPcOuozuLEu3+QaV6RQw7dP8+bka3rT8mS5ORsKc5bSSttKkFLIOxsHDcsRPP3d9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSZMAxOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0Q6awI4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSZMAxOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0Q6awI4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977js562312960
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oKC0olzQ/PU2CfzdnylEFRaa
	rNGXMHbrSZbNQIRuiC0=; b=PSZMAxOgGEQEhm89sbEvTLpFWOb5QWK00OPBYrc2
	A+zE3XSaPZ1e2Duxm4SodKC91gIMcqojDtj9ItSOuB7D3UP5YGEYXzVRsiGINVyu
	mDFobZS0Ia+VVYR5Lbr/1YHMoOhcQG7woLFKK4hMHgzqv5UvFf6L7tq25ZU8AmKN
	biQ4yfs3GDusTtpcyBfi2g3Kpos5aoIXqp4QsObFzcIlXOsCdX4REqyyIv4u88bm
	KKurEAfa58ivg8ucxHkbkKFmY+8o2L5hxcPSTlY8D/iyl9lItBNoWZv2yOUKCZGy
	JxmBUDrhKcLKmeFx6OYYjvGPgYRBfR511/d+eFVtbD0Upw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askdsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso652949685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359327; x=1791964127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKC0olzQ/PU2CfzdnylEFRaarNGXMHbrSZbNQIRuiC0=;
        b=Z0Q6awI4yU1MaMn3yz4JCIODiWk2t6s4mBeCT0jBeAUHBSYjfvhSerg7hINi/8mQ8t
         JDuwTWLRAsGLldxkrqEjNaJThF1Ss1bcvZ4TcOa0o4xjFoyjuqI7k2o3vwPJKtOi5thL
         nSs0OCt+PDFlasBFP4DbtS5BdJF8Tj8A2NcEdmBXP69kEqhEQwViFLsSWSVOPf5vaFaf
         QQmK6X+6xZvW7iw5oCTIap15UmBW2NJfNwU3RtrOv1loAXDVc1hbHux+zOb4wCtWhM4C
         zLTCT2N8pEThc3by49bq2X0VqU4TRSf0edNuilGYyiCzrg8Ef2CP+C/8xBTyHOKJ5Jgn
         Y+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359327; x=1791964127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKC0olzQ/PU2CfzdnylEFRaarNGXMHbrSZbNQIRuiC0=;
        b=VmpK4BpvivKausRakC6jTsCWwhXv/16V8OoVJ0h3i8M4m/R2AwP2frSwYC7wRzqLuD
         RWCvGU57PsZZZJZ4yM6b47n7Z+1ZPdCwRmTgxBrFKwolLSctwn+WNq/rEHsoMOhEkmTS
         5EmJHb0fJ25HmivYondxGrCBNK5K2NZ+XeqVeeT9eCc6eRA6zd8qx2A6prR2nZzKqWS4
         jcljz8GloeDvZfqZvw93z/iUBxhsKhGB9MtTcPMm/o0jlPV42B9JODctFTBU4WjCtJOK
         2YD67i3nRHQVa199Bs/AgCGLlBOUUkC6OimHRm63iBFHEZCkxxgUWLc4AveQqJAW1Pz7
         lTaw==
X-Forwarded-Encrypted: i=1; AKwUvBzBhrba76INPN3ysVrN7YYtsgvY5Q8d1opwou9qXqihjX/Fmup+Lc0cLMk48S5nXudZGvGS2PNtg3wKgzo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIycrEhGf1uenLmlANM2TYtFmHvYpZ2AFwN9J1RBh+zCrEoUX4
	vKp72bE98+wMsleWg7sPK8GixzuaCYnxyxv371hwAfiLVZT9HxnMH8AAtTWJXjm4q7j201uU0f6
	8h70BoeMnSJzefoNUxVc2gsJPU8Tmhct23pN4ovvRrpHcRxC6WDa4TU0/AD8xNQCJMAQ=
X-Gm-Gg: AYBFou3RNqEW/oaRRhNpqQjIlGRI7AETZXR6yc+WeircO4yt4z/r2BnRSqA9eddW5+i
	/rW/5/qtgrpI5cAutcxQqR9v3VgsQLyoy+enEPeVZbDQYkx4fQguWwI/8kRNTLr/KtLU8Xzxd5G
	P2v0UjVN/Udmmp9fA6YAy9Wnl3bH09YbapKRdEmWvJinj8TjLRqAUOLWSZkJ4iEVFPjXf27QF2y
	LoJgY/sUERFvWUQ56+ZMWP8uSFc743lsvy2Y8zEbt43WxavgdL4Htco/YSLhrKH5ec4X/2j3ugo
	NuDZ8rOGvMDCXodj0t4bU3diZYu1yZ1ulUvWvOMJSlZAHw3wljW2ln2fNzIp+3nUZ6e6o4+3jE5
	Kfh+ZykgrgEx3zsDs4x8H1HHPgy7dId8yGkNxgGhkI/ktgvdOIhLrXbmzqZaHnVwR+iPx0RfXMY
	g3nbG6qlFjWUEG
X-Received: by 2002:a05:620a:4802:b0:93e:9834:3863 with SMTP id af79cd13be357-93e9b775f0bmr271075685a.15.1791359327205;
        Wed, 07 Oct 2026 00:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:93e:9834:3863 with SMTP id af79cd13be357-93e9b775f0bmr271070585a.15.1791359326627;
        Wed, 07 Oct 2026 00:48:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bccfe9c6e5sm448023e87.55.2026.10.07.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:48:44 -0700 (PDT)
Date: Wed, 7 Oct 2026 10:48:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
Message-ID: <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CFJ7At1UbOVMByVH2EPZTbx_PrACek6Y
X-Proofpoint-GUID: CFJ7At1UbOVMByVH2EPZTbx_PrACek6Y
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac5f960 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BBNwevgwxSeHGHzN-EcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfX3nHnS7FHQg1T
 zZ0bIIveJXPeztfFjZ0LnomEAlymcKVRaFsii7sgwU/0I/2ziBjGVJN8RDwK8+QfHiNjVeX476F
 Y1Ym0PKQXdG01fZbQbHtPc1a+9CFf422lc+N0qz49KrqR4HL8MTICtFigc5S/z/8PVIVxWHTcI/
 MBlG2iSPporasl5YnmKTwnrUZAr0L7SJS3ZAr+6yrXJp1qgGxvFmTgOrtjTOet/0QpOfr28u0bl
 qeBv8ADPc5pMlSwqXKvB1SuSpT6RYa8TXPc2HuWcHHs3NQBmE/76O6j2L2noK/Ah6gU5BCOEEyn
 dn4LnPQUh7vgm51Haw7B2JjMrN9RYz+nvpFby7+RBcA2n5Tr0IkXVuJviKNwtglfQ9x4RWoF7JD
 4b3tkhrAbAgGLXkbRO10tVHjjUdv6z+3xFmqOCus8F2zlDuCKs9FtY785HsdTFUZ8LrX6ODZdJy
 VeT3N5E74LVqwmUnMGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfXw9NRqLheru9S
 sRSn0eZgv7+KpnTwaYMQRyCU0Kv/vu2dnxmlXT3SBT2OkfqyVLWcU31QocZNXSRF/lO63XZ1H0q
 TZ/5F1p2Fz5j3k21GhFFV2L97nBCzE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070030

On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> +	.offsets		= &qmp_ufs_offsets_v6,

So, is it a PHY using v6 offsets, but v7 registers inside?

> +	.max_supported_gear	= UFS_HS_G5,
> +
> +	.vreg_list		= glymur_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
> +	.regs			= ufsphy_v6_regs_layout,

v7

> +};
> +
>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>  	.lanes			= 2,
>  

-- 
With best wishes
Dmitry

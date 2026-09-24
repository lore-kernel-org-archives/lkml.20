Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D623D7C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238908; cv=none; b=cEvg9lVzAYm/N46bHaRvBjqDxORYLdGzF1OQiv06VG/SXEcn+wYs3ChrlSRP1cGK9KFubaBJPrbWVS0XbFDybw7otU9ZLcFcqDhfukfav4oA5EVvCWSbdtk8/zmio6TdqoHYiaPVRJ5cPR/7CDT91GHg/M4sBpmtSa3qec3zaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238908; c=relaxed/simple;
	bh=VCea4C6LXiOaZFCLAYLlRoTq4wvPccpuGXBEWLukmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDhIjxqGs9VWhEe12U87O3LHBgWg98o9sPQZ8Ij5X32jZ65F5LNHAeXV6w1eQ2X8lFFyTgnaQbLNmZpyCYMvorjCx0M5PYDrWOsLS6mlxeCORDPJKJHxRMMme7nijB/f8LErVmRvg6BG0hR2H04hHmzAa2M9606K7fcDEI73tN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1TR9Yqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ki6vNr2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1TR9Yqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ki6vNr2G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eHOg1147884
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiusfjr3UFxgxhx4glhL1gbP
	6UTag67/VUw+fyZmqmY=; b=L1TR9YqkktSYGkF8AQGCFauiFuQr9PIF+59y1pND
	QQIOakQToFGK4orxDX8B+TtYZBCVP3tHMuS4bnyS2hRXEwDOHKDhKqdQ0GSM98bc
	78BIKq8DsoTX/3qMhq0MjQenWALBsn0CDexQ3Fe3dZ9zKK7aDlMhWtHasiM8RvoW
	A17aOSoLq7mRiD/Kko29v13r0u+HghObOGUrKcSz/nm8bYyMJnqwq7Sd5zP/j55A
	IpoSatvHV1Cb56xURILgBZlUrJ/xmQwXeuUwkqqp5h51WseHL2/zzx7j6xgMiE+P
	NnHnPzVj29KFk+wXtUpX8QsRvvgAA9mt7MfogtaINeUtiA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrajbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:35:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14318be7d79so2141963c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790238902; x=1790843702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiusfjr3UFxgxhx4glhL1gbP6UTag67/VUw+fyZmqmY=;
        b=ki6vNr2Goed2VrJ6+XWR9jcPIepKn8Hkf3P1t8v7EJqUVMxsBMmwIbk8qwf1rc0v+O
         YAhK7zwXz/r54hznnDRBgDz9hZaj2aEydp4hHXPbbO3FMNSFHNOAG8W8lT4uQFpBuc3w
         fY1RklcfAA/BWXDQFJoyRJoltvEFVHAPbSSVQgbe97+N0jxOrf7pPLB4sMOCbgsBvG28
         ekTtzW9LqKf/ajAcPBcprwP/KDEn0LORxc7SLrxs4oeUQwpiwDUKJClvzbxQAJwpcZ+i
         9b/cTY+XTlIMVAg56JJ0j2gFOf3I4GUGx2nvB9SlUa8+HrDA3XwTGD5JkeG9bRlCsb6b
         RhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238902; x=1790843702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiusfjr3UFxgxhx4glhL1gbP6UTag67/VUw+fyZmqmY=;
        b=MqFw3yuKYFAs6DWukwHeiUDRHzA5tMZZGRIkUyNTCTzjUJyg/QTba3ai7t3w3wnA1z
         XJ4EwE1Ief9sjXh/aYgxFnCh8d5g8QexmK3ikPqa1JqG+IaRo0SjYd0F60/vtyGVDsk8
         kUnQ0J/lQm3ykWJun6h9eqWMWrNLYwu/SaQ/0z2Eb007YQbbWefz7XADMYplvRG+VWxN
         l0o4sGZB008liX0k4h/o0l+TS7eRGEdhKDZhkgceB03uDerUmMHyrqefqAek9XWz82cS
         /9avPD2QqSD2oL+3GRSr7FesWSqEv82z7gBNKQebvTzUpA5GkvaIPjkVrzvxnN2G4eQy
         hMzA==
X-Forwarded-Encrypted: i=1; AKwUvByhCMwu9pRVkiU17qpc9xD/J+tDaEr4q1Fj052l2AMN8SUVBP7eQBR7NquMTrrdk1xYbXvXZnPQY+nRWQo=@vger.kernel.org
X-Gm-Message-State: AFuF++mtUmz2DwAj+T0Sn4QDXMVoWI3+sl6X45xfdH8ZSgt/L0uSe8/F
	MsUVd8V5p5gyzqh40rONLOlXrN1C8sqEf3OJt22960XVzGeOqw1vuUMrS0In5mdjZAf6zqSIdnJ
	j2uvsp39G9N8250aZMYqrIcaFPJr1MP1Eqgsu+A7EFyW9FXkJjvI8N0P35DMfHNkgG5Y=
X-Gm-Gg: AYBFou0vYzYaWPkl8CXCjn1cLIoisMkLVjque3zmXGKsKtl9F5RBtKoGRHKOXCBs1Yq
	pIu9V1HeacUZw0sNMban1FLHR1NFFyZdsS9IaC4vXsj85hlvP9oUprZvzvSe6sv0uTlc2orau60
	QylcxU2J0Ujh3REedNFG4/hP4M67VA90q38I24hpgTeuLAGUyYDi/nxdqCo03mOxVKqBqsttpm1
	gEkYJhv3io3l4TCPMZB3ZJ2eZIeMQO4PiXJOtGwLudBFZQg+8kAn11nqKTqCl9tq50qC6G2KD2q
	u2nED4fqVNkggKaUDgsqheC/eiyN3IAnwd4E0q22o/F2wUG2RGi8qlhd6jz/1wg5GhjgH5WK+jQ
	2rX9oRiWlRceqTsHXszIEetmoBZEC8N0hVSjzfiiUmg==
X-Received: by 2002:a05:701b:205b:20b0:143:34d4:c3e0 with SMTP id a92af1059eb24-145040388cemr1139194c88.7.1790238901533;
        Thu, 24 Sep 2026 01:35:01 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:20b0:143:34d4:c3e0 with SMTP id a92af1059eb24-145040388cemr1139175c88.7.1790238900948;
        Thu, 24 Sep 2026 01:35:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e60dsm10612441c88.2.2026.09.24.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:35:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:34:54 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <arTgrn0qyd1oay_A@QCOM-aGQu4IUr3Y>
References: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
 <7a3d3902-c557-4058-b806-d24b3888ffa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3d3902-c557-4058-b806-d24b3888ffa6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX8BnTPx1r4pOP
 2maP/YDw1efVlT/4751Xr5orFi0bDTv1erFlLI+5H5rVD6lGdFj/gBrPM3enhU7zxQGZ5mlVzwC
 W7fT1rAVLaKHBi/5siNLSn0fsYMb635WRLky2bkEk3YI63Bsh831MrRDHPc5WNzf9VD2Zv3v1uN
 rpOO8NDW2EUoRyDii6YEeYeYaQFKAN3w93e3uIlk41Ft6qOhr+rvKn9E+8e6Qzg+4Y/9BPv0Mxy
 D+YpnNoNjvq1RKxkY6kZGjyK+p9EkDIbUbGozlVWtFA+lqAr9Ow5AGrEU27D1c0buBJ9oo+RGGV
 Um0puWJa3CA1IKS6i8lX7HzFzmZCso7zOtwnWhuvikSncLI2PdVD1xSx17XVd/CXIjPiSepC1Rr
 NQT0Gn23mQs84CkhuPqtNnO25LjZ9BKrh0UJqqwXwyDrdB0JVMahW31lXLQVP7uOqWIqNxnd6GO
 1/ws3KCev7cGTPHuoXQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4e0b6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EtGqZHvEnjToqAua8RgA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX7WC61eD822zQ
 x3p7PnOasggTPKBGaK7VY2a+oDUvXjfMQJO79mJH+Q+ryXXJNBl96KrUj/3r35V0qlJhlMvckmH
 UiN1BV6RBNbsRHFV7WTF0MwlO5jBTMg=
X-Proofpoint-GUID: CXK5BCvs2oWNQ9gCj0ISryQz86URQgPD
X-Proofpoint-ORIG-GUID: CXK5BCvs2oWNQ9gCj0ISryQz86URQgPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036

On Wed, Sep 23, 2026 at 02:37:18PM +0200, Konrad Dybcio wrote:
> On 9/22/26 1:13 PM, Shawn Guo wrote:
> > From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > 
> > Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> > 
> > Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> > nord-embedded.dtsi for embedded Nord variants where gpucc is available.
> > 
> > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Dependencies:
> > - SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengchao.guo@oss.qualcomm.com/
> > 
> >  arch/arm64/boot/dts/qcom/nord.dtsi | 74 ++++++++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > index e0496fd40c30..6c53246d5ad0 100644
> > --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> > @@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
> >  			reg = <0x0 0x01f60000 0x0 0xa0000>;
> >  		};
> >  
> > +		adreno_smmu_0: iommu@3da0000 {
> > +			compatible = "qcom,nord-smmu-500",
> > +				     "qcom,adreno-smmu",
> > +				     "qcom,smmu-500",
> > +				     "arm,mmu-500";
> > +			reg = <0x0 0x03da0000 0x0 0x40000>;
> > +			#iommu-cells = <2>;
> > +			#global-interrupts = <1>;
> > +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> 
> 674

I wonder why you are always able to spot such errors. Thank you, Konrad!

Shawn

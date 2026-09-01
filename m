Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E8542F707
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247639; cv=none; b=gWLPXFIyTGFzn+fcCb7XEVZGohdytJeRQTN1A9PCM8bxVQVmd3IMMs9fGaiEG9gv0M9aQl6VTmWr+SR39KO47jPaxql8hPEuYA88rPLkLawgbsO62qjQQBWSH/cgbR186l7qacgPzZ4Embv9AuCcp3L3joNbX7Zg8vucWd1rUsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247639; c=relaxed/simple;
	bh=EZuKdIv8VZa2alHRDBtB94I4whj8cxV2Qt8WI0D4W4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq1+S4cbXbTg3NOjLKnMaAH9yiODCyJ3nZbuH03SACl5M6efR4qfJkxyXhkIiH6W/MVJG0/odKNbyQ4z6nz3Ea6+4IfhV8RyQG3m+A2+zodp78qcb+8SM8/PeMs4WXd3JWqNzkiKH9RBD2XaMxoApibOwXnn65pH6F7pgXtomPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMTpAOy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmqcidnL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMTpAOy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmqcidnL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179MLC1335516
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RlNTgorqFdWbb9sh7PwevW1a
	EEs2BxXD9JC5uiMMwrY=; b=fMTpAOy3l+hvUMdMiRR9suAv4wTCHf4Eb+roGKsE
	UmaitHSfwawolzy2Y8mY0EwlTKlQbXuWZl2nJy86LT0F+7dt5FX8/m4Uhwor/S1C
	JZB+vwum/d3IlcJue+mdgsEajtWJa6l16jMRBLjdPgDxhpGJDYAOqwFB1qJEuJLk
	dP6/CzcFtc14t+d3f/dDk6VtQcLTj0QQV0mVmCLClyDwOh8x4vhFHwZ0EaPJha0L
	+3Q7yYN8+oU4Mx/82eC2BPEz05jC6iLroY/1tPRRxjKOdzDLKWuFYDaiFFIwPDf9
	I9snk8Z9lyat0FzhRdYW+oqc9jk+vi3S8PkE65vYbZZQ/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx1v91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:27:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso912222085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247636; x=1788852436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RlNTgorqFdWbb9sh7PwevW1aEEs2BxXD9JC5uiMMwrY=;
        b=FmqcidnL0WgryklaV/+hpMlLAmCcYE5FKRB/8NcCWoZmo6Npt+xcQ/VFh6HnnmRxDu
         pYufJivMElXWXn52U44ARBgKUMGOQJa3Rgqhti5KZWrYlxXR1C3G3ZlKv4qXK6U1/JwW
         8BNpfDObmFBu1WedVZLTvS5DL+gJ/fNAuIXZ1m9pjXIBm40cK10mw8AOKOiD4Ec25YCe
         uf+qdUmxcgHEw0PzOCpPvIdYU14eRu97vnIBs3gtwr5xUBvdvTMsDBYnJq5PK+u1DN46
         B77QdX84PdcOJLmvanrsFpE4GMSynRUMq/Wr2ODpf0UU8mmnu6RDt9UftbmSjyr4Ekkv
         EACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247636; x=1788852436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlNTgorqFdWbb9sh7PwevW1aEEs2BxXD9JC5uiMMwrY=;
        b=Cfi5oNA6Ep5x67L4mA/zYilR2WJUxA0jjUjhOO2yBPaXCQMGK3hRl3nQgg5shX2k5m
         6hyK8WT0ISKObejKIV8RHM+U7TrkmgKUMbzpeBdNL7lstyrQN9hDduUqVKXGrp8sK/f5
         RycTFt93BVUqGlyUgkVKRI16hvaO6TKxEB1e7bSlFi5cf2zK88dfrlDhB/28A2kZGpbg
         MUdR8p/ZqXHF0ZZE54EFNwINBDfdXjhIfKmWyo6/TltY4sgjS2KyO1+TBK6v7HSKNpcL
         gqexX1R4iV/OHxUO8atMM8hRsaIbjCbyeNKxpKq2Dso1331FGh8UaklXwf/2giKNm9W1
         1zxA==
X-Forwarded-Encrypted: i=1; AHgh+RqqhcgOqqYzEgglPxH7SSFoRM3OL71GdXtvD//XEPlTcJ1R80I65SjVN+aEVBkkRW3TL6JTlfxk0i+su3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mkOn1jsfcF68GhBKetWDA2qsdVIpSDlIuQplcY7jHk929LkN6m
	JbZOgccq0lIsOFSHCtwUrAYHXXSjrPhINt4ezkF/8j9E9RHV9RFGqtiDp1m71vXevejXbLzsF6t
	bz9x0f+vB9UXjxgb9DUMkUC4W+zqoaHBfgbtUWnv08QvGXZUqQYmGetrNwaduwFoVWjs=
X-Gm-Gg: AR+sD10j1aFSwBG0l1900/2nESr5MkYsdXxTSPeyLsVKYjTIEcEQrOBozyUlbsaBMSG
	88G8z0AuAwyc11sN22mhTlBD2eaxosmhVekDJGpI9fGPfgzGwNOcQqEjnlyKhvaJkiB9wFi+xJF
	VPPBLe6bbQp+u76pAq42fKrApf2KG+N0moHKNHMJFi3ftQs3HR9UOzqiVWa3/pkwaEJkHo77v4e
	BRVpCreKRSDrI9VWWS4JOzkOt7dn77YYKceqBO0mNtTt67DToez/Y0FKVd9IZvegNg5ttlaT4jP
	tlPiSwzOrIiDV3c6jw3kn12P/HTLaL6dazeiuf+m1nxh+oagNtEUCwliJ7FSECY2t19EVigiiil
	6ezBsLk20wirc510=
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id af79cd13be357-939137d2438mr3130845885a.15.1788247635905;
        Tue, 01 Sep 2026 00:27:15 -0700 (PDT)
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id af79cd13be357-939137d2438mr3130840385a.15.1788247635296;
        Tue, 01 Sep 2026 00:27:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42492sm3509382f8f.1.2026.09.01.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:27:14 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:27:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean
 up PCI function nodes
Message-ID: <4rua6wavrugknrou3zshg2atjo4iyqrtbhztgtk3de7pu233gd@i36uhg7p2snn>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-5-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a967e55 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=lCP5n1hGJ6oGlG14cqkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX0TV8/BoSTyIg
 UtUHuGl1r+LkAhgkmZNJ/JXbjO7pBt16PIlNe6MzP8O7RMiO8He/EyAyl6W1EZ0GVNT2rEbQMpF
 DAg8do+fojIy6WjYGC4t5ORBxiqMWNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX2Ro5vSuPuaIV
 vMPHHIb+YOi4uYkOjfXicxL98fCpYlA8dA5j9/fCBqbSHIt1W6MtF7ju0XuAD43HtEK0parHUPD
 Ts5yq6byuxUTWFqGYQ0ZYH9FxbaFtNAIneipM98uqeMgP9B15bsMO+H2CyaeYJPq1eiAmkA6n4a
 2Z0+QU20GlS00iNPuoSNQKOfLSjuG/sXnNoA9U6vetp41ERWHW5jqxbQvaFVPdPrblPaKHKc/Rc
 r0HA08/wfT3XcJdfAhGXCV0PY7S9fHNpXcUBD9X7pCnn8J4AEbN9MAA9eq6BWfX/3q9L49fRYjt
 98p+70wNy4NQ1KoCIoZ0FRKKQ8mr1WlyoMvDyd/+yJfw5nEX6jb5w1gBj5pTg4ifSPS9yl96JN9
 CyAc/GkuxmAPrKddf+Q9GEW0TYLSvx7SYdZEeoAK30UpGy6zFb2Ud9Y4ae5420uJCmdQ7pAtep0
 kkM3IHw8sVUkN1oUcPA==
X-Proofpoint-GUID: S_6aiRZPOK61fY8gDv7WyVEwdkIinYJQ
X-Proofpoint-ORIG-GUID: S_6aiRZPOK61fY8gDv7WyVEwdkIinYJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

On 26-08-31 20:36:51, Alex Elder wrote:
> The monaco-evk-ifp-mezzanine overlay defines a node representing a
> TC956x chip which contains a PCIe switch and an embedded endpoint
> that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

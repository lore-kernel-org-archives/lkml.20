Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263020;
	b=KCl02Pz0xhU0SrxgJw1RckMqNku4F9aKErXYLZUfHzq89STkt0vpdVO8IWwtefMSvBiO
	 v3liRDg44z+XmWCHWO5AAYZlGYQjS2Bz5aMaVXVZURiBeohz9vxyADF9ttm1HcaED5raT
	 fc/3sTIN61Em9aczFugxTnEMKmPKl4qnsUg2npmX+whJtlf4q7Sx1rnvDkxccr6szWF1v
	 nLwSSB+y5M8wAlxGLkuNS9gC0HdHMOakZPUECKABfVk6ndVUzu655umlXyrH4CEZHxyw5
	 RKuctHXJJcufx/VZ4500oVqZ9Ex53k3tkRdqosdOR2rz2F12WW9mXQnsSEBqLPdo55Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
	b=sitPfSvC2U00xIoqcN9x9+/i8HGHmvxg3Fq2lIXypBtMT24wYtvcBSxHFqVj6ld7b90O
	 11jGfjJD8i6GAQIfNvzMmPuIdc9jl7EUl8+pxj6p3c245w+v4oR15Eys9RfbezvuupjUI
	 p42VXu3IoO3pUlBtpvXfA81UV4wCGoRIuZBS9yTyOW88y2p33KosVaa4vG4q8U+s3c2pY
	 /nITEkFrBeXMN8fjNMe7yIlnf+5VXQCF8oajB0j9FglEX8sfynta+T/f+2dzwhwqcSPNE
	 squFdsKrHqdvaFrpP1bCWUVVQZkyZ7WZriSPWb4+94GMxhxu1XqYo4U8J6N9hgK2/zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqnKv148;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pid5b/xg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqnKv148;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pid5b/xg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Guw03341089
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vujVPiEFr/2gWrI6pDf7goaX
	pBUcQ4bvbSz+Nt72RLM=; b=dqnKv148nup2qvAaDjk8osg/dUi/AcftsIbH7dTW
	aumvlI4Eghetc2/dgAsncGOrvJ3+i8/RJAj7a/exhj3Lyc80t0XBg0luZEORSLoM
	85CcGKlYQ2H7fFhOR89T3W/PprKH73NiQzDrgLPEKny6M8lof4tyLCpld76Mpgap
	qqgqH+anDuldtgvELfxk7cdr5lcz3K5uatabW+xMZGboyx7JG7NTQWEMH28mlELP
	u20nTDz1sKostSKQBoW45W4RaS3Q4maU7Kl4RaFkRQEGkQ2FPGDtMzsZej3OSyhk
	t5qOX0IO045wuMdnuFRIMYFEHBt5//5aos5Pgq/xCiABFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hfyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so33901721cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263018; x=1793867818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
        b=Pid5b/xgS46IKCInNIevRl9mfkLrxUaU9eH+1GmodeDW6JpOtjiSpGh/IOLSwnWNi3
         Zm3usjkc9RSNy/6Hm2PUtiJb781qwRDc/74PQ00qwbpt8fAX17GT0gzMlz9tS7H4GIjP
         /VGd5nxh1UTig2KBanmxohzd92N1W428lvaz6rAeyKikcQqCWgB0FgA90LdlT/xbPBGx
         l4rHQ75XeUDt/zlnhncQshdXz6WzW/MBju0NOELHP/vJjxklt+cTSu+If1zUyqGlVuFE
         wZ2Rt2i/AIGfrY4/4W6gMMt9YtxcmEXz6BoMSNo4SPOBpg2So/WYY9BEoqyHSC0eMsae
         96FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263018; x=1793867818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
        b=AJSZwpfAtm8SCiqb863Px0EAq/Ml3Eov61OL2WrwYsofZaBaeqNvtFcpRhopxwf58M
         0KH5othiNkXgsMEi/2c4rc6gByn3WJcBm0au8q1eTd3kb8CzjTbK1xEii9nRuNoCuPPj
         B6kBxM1UwUYARUqIGs2SO9Vxd5OQRN+qzt+jebS4pXIfvNxmKUvyfhd9PTt/5GjqQ03w
         sH0yGiFoaTorNwYM7/8IRYF5+xYDta9rmAA5x54YUmIDSYYZrPpMiD444GUtpGexpVM5
         kG2iCOnpwOfXFwgbz3ds0pM/qsiE9bE9Mk9/jwq0gHwkuYW+/RtcmwKTFIAbUfar0UXX
         LNdA==
X-Forwarded-Encrypted: i=1; AKwUvByc9yQ+LxuLSLd4n5lR25kaNeTI1o0Bc1qk9LeffGpHCIzJfTZ/gdON2dapBLf4auvbKVGzvCPYTSdS18Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWBbxKhqgLUl/KKFCDkxypznHK3Oc1yA6Lq+xX24TJkEB2A/G1
	tW7bHztMZlW1fQLn60iJrJ0UbnzYXbU2V3MORUskwHv22puK+byZhGdZI5YIJVvMkGZ5l8YcXzo
	3rEW9nDqYRecLDrDQYWlxa501BiC1aQwCazBDnktldNkGy2p1E9fV7gonL1Zgc8niY0M=
X-Gm-Gg: AYBFou0mbVQUgoOle9vi/TBGDsQvtYlljb/bNKYYU0sYC0aVt7oBB2R4rqz0ISRjKG2
	jv1i+VEn02AByN8QHUGwNBaHYWx7cwAuF30WT9Q9lciTAdkiCC2pAdFfp6fJtA04KcqX4sxW/35
	12gZytVy0WP9IKrdlo5RT/YOFzotlIpf6azwteJV8nyMlcFChIC9jlKQyYVWY+/rL0BwFvNbhpk
	fOYjuUThLSZ4wdRvt566CpFeDVIAq4Aqvprnkwt46kJI3bilQyfSRTn8OJeFjVAXFEDiIYK/ldA
	j1aAo8IIXAtDt2p0y2BWrgW3bROdcReVbOnXZWEqH1CfLw8pO/3ecmBLLDajLRBEaoTb25rDPnX
	h1Cu/Rw/fSZbPqsWjjM+thZHE6NPd2Dy5R1Omyk8gtEN4d3Yas8vcZM7z51DkCUnm
X-Received: by 2002:a05:622a:40c:b0:536:7669:7eed with SMTP id d75a77b69052e-53fcb20d45fmr76937851cf.21.1793263018127;
        Thu, 29 Oct 2026 01:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:40c:b0:536:7669:7eed with SMTP id d75a77b69052e-53fcb20d45fmr76937721cf.21.1793263017581;
        Thu, 29 Oct 2026 01:36:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm32868551f8f.1.2026.10.29.01.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:36:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:36:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Unify Glymur/Mahua regulator
 handles
Message-ID: <227eu3obyadpuhtbvz6o6memq37rahvv4qw5gohff3gibo6lhd@fz53zt3kz7jw>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-1-80ab6704aca3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-topic-sip_cob-v1-1-80ab6704aca3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfXyBHrZOYcph1Y
 TB221jrs43hp1K43QABSN25GnK1eAnhnKBq6iUDtIhUiloHEtErhBT3yog8ilJIK12gPs5YgK9K
 ABILQhfOHm+IyQE9WTH2L7h0lkRLcWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1V8b9hfR0ukY
 IuqBz7kXG7LEgum7/meXfJ626A8veHpP21J622WHN9BRON4DFz+GZjVVgfXwS4grXCLQpD9SduZ
 9zLHXCO4/UZzvVdCrw6/dPhVgXEX6N8KMn0khpiIReAblqv28V34mWVGBmTc/YGcZ0Qk/Ew52Lr
 FsAm3yiSZ4Q3iAnVKottfo1egRfUlgKwErOu61xP22fk+vYSCxPqbYUQ741/81YjPG34+j/6CLn
 sFiwTpV7pjI9tJZz8e9Tiq79R8DdIaW7uIEDCdRnGimNBkjHW0ySbRqfmAP1LdW2gwLvAS4lGsL
 J3NTPpWxclChO6+jzt4IHWCUtJsXrkWQYP3L9kS0pSUwgJ2MKAMe+bVz5swwZT6/ceykL8Kx/LI
 37fabNUVuNm7vtaQjkMS1FoEN7tAQwB0VXLgo2mbCkFaJoO2Rn8UErW5F26FJQr4cDuH7P2Ojvo
 XLXqQkcNe1awFWBxOvg==
X-Proofpoint-ORIG-GUID: -BbIN3qhY8YL73FJNSmS_1rT4sTsnTz7
X-Proofpoint-GUID: -BbIN3qhY8YL73FJNSmS_1rT4sTsnTz7
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae305ab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=E1C38_a1jRb_IkRbqHkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 26-10-28 21:04:24, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation for removing on-SoC invariants from each device's DT,
> start with aligning the regulator names and phandles to the format that
> appears on schematics.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

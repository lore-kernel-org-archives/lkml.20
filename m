Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AEE4A1387
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819747; cv=none; b=ihsiaUJQw9HNFBd2khLRy4WKjBb6pbsJ8jDWWxFIuC6coj2r+hLSwPzVzAdwcCGRrZA4htUrTBu+v4Og8u5aFL211EXIoza/t91cg2AiSxQi0miQ2imWm/AQ1BVrJ3X4EMCMy1G4aoTh7PkQlVcfOrGxRzdgojcvETDbqupTb3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819747; c=relaxed/simple;
	bh=v4u1w5XZwsxePjN89WZQvo59fsNee+Jy0VORGbI77Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSt72S1gcXmzDLcTETKEkdiH6JLc93aV9mtbsx8/pCtqce4/yFtM2Yh0CHQy6qQXepGp2B/TQVA6UADJf9UgIYQBwD4BDsL7TttFQ4MaqUffrXAzrn2aBryohnxVQumT5PGO0k/J1OvCWQbklG5Yb9gtbBeagt0Fx/IR/A0hgNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hals3LLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4zpM/SO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hals3LLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4zpM/SO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFesQn3272314
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CLm6P2VrMK/N1mjpSHX62Oh6
	XCm/2AdtfUkOUj1Mujs=; b=hals3LLb0WgYXI5Iy4z8trvdoLrYBTSFOJbsavZ6
	irkruxNftWCuW4Dp+zbnfIn+VCU11DbpIVeqZ9mMGzBfqQx8Gn1X6fJF7BF278VO
	XBIPMfHkhTNPfa3i/hI10QMXpC5ti7ZeqMYKkmZ/qaiwrz9j2F5Ntes7idzT4uDr
	DNJClu5DJ9DwyIYabkg4VUC/pMTvawaZivHIcjrTOkY0gUjn1ivYOugLw8aVEQDt
	0CIFDrQvExv/WQedgFMtzvK/wv/98PU0cZU6nFf/4oqMOWJw+5VwgK4AEVrMhNGo
	JsNLrzUasEatGsgKtAi4oSSKG9W0UiMyycpH5cWOuOE/uw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhemu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:42:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso4338979eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819744; x=1792424544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLm6P2VrMK/N1mjpSHX62Oh6XCm/2AdtfUkOUj1Mujs=;
        b=C4zpM/SOYf65S/rRujYajD4mNPp17RHPUaeY6P0e0dnN8IpSYa9cITQQwZwGWkZU2q
         xxtLlACPdngEAQ5I5nBEsNylX95GJh8gen2sCDFHxdRyOo8gtieH3kAWIzZqQKY9xaV1
         UBekienoUvIfZLK4Q0wWj6Cdi5pn5iw82A9coBockCqFIhszga5gCFRNZP6OX+2rvHOD
         hCnVGh+3+Qh6m1/Nb/9qbCY3ZVI+fUu8C41svVMQmmB3t/XV9QjTIL9avUfgy9v2I4jK
         +bcGcFcnGlAeJZWMyAN6WwYhTP+FBMdBkQ1kuustwrPN30TYr9/X+D16lVWIQm1jwZKC
         CgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819744; x=1792424544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLm6P2VrMK/N1mjpSHX62Oh6XCm/2AdtfUkOUj1Mujs=;
        b=AuyhY9B/WQcVEXocJeuelgUHDTbFwJMWSGYkB4f0TaH0gQUiUSstZYrGPU7thibKc6
         qvtWRZIUhZ48gfbxk/Fo3uw0/IWqdGpzB0Ksf4XsVrJcUYCUEcmJZRa38h5R0Lb2e/nR
         obzgAcCRtNIljrFiyAg0HHPs/d+r3x/4NNuhCRDFDaVOigUu6wzkBoS+rl3Q/TbyN+kn
         i7j4+bPPEzcafBXiv9fjYTfkoxDkbDV3OPkXQLoIJOxczDrdH8C4666tdATUerc4dnL4
         58GjEXONCWJ50G8peXcCGfBhR+nFr+ng9eKevL2BHfM2RBfMJngeICtxI03R7VlverXm
         Ox7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA+z6bV3UpkmeOgCgFTzDeI6wQ3Wrxq05zSBByJvWqWmBMfhbiQG0mZYxCrsDuBGrk7EHOYN6C6jBa0kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdhMpwgw5s3UCfSJN+0pRNtmnHpb2MoA+3olaWpBT47M4LTYcI
	OYqzNJq0toJvKW2dRQxL87tSG8z6gQ6k/4/D6lf4ydCO3FUd6JSRpap+ZcHO2atEqNBMt9qACGS
	mN2GMljV2bYb06USg4lDgssavUNSdi5OtA0LnQ5UL+XItQOHlO3shv3SZkMuVa+QyQnk=
X-Gm-Gg: AYBFou0aCMMkBtuX8jd19kPF5/hu/wP78V/U8DS/WsOEiw8WZtO91uzP0Ng0mWeuOtv
	XswpYuXQ3mmcUdwhm10Kos/E57kO+bkiRFUUXSseZwbz552/l+doCNzYjp8n9QaoWkEOBY0FoJb
	R67l+sXlYojB+G4ORlKqaGRYDg9StQYBZsLM8BqjvwduPn8hIABxDBN6OgXf6ISTGhP/v9Z84xV
	XhPvxBZDDYzM5EcsvMFNwpnEBVjekgp1ayxZGVE5ruMgJw6dW6UzFPQ4XfBUSUyrl9BcGrRSy+A
	c15SEp9valbVb2rItVkQ3OkqEXSRiNEw4pR16JoSDygsj9my99xalu+dWT6xHO0zMqUEnoOkNs5
	/cpb7R+AwlohJkX9PtipWLlJMMQ==
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr13758673eec.5.1791819743884;
        Mon, 12 Oct 2026 08:42:23 -0700 (PDT)
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr13758644eec.5.1791819743243;
        Mon, 12 Oct 2026 08:42:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm21928392eec.31.2026.10.12.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:42:22 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:12:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Message-ID: <20261012154216.v5kxojvmn6exevih@hu-mojha-hyd.qualcomm.com>
References: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfXyH45z9yXaLgk
 HdusO1xy7RUA28A7Jh7Shbs4WwuHlt2wBD6E/66aBAPHY2Ynok8cL+jGm2g/OoHjFg1d0vKyyRa
 M8vB5s+F7JVcMhIMC1O0L5sOTAKLcFQxAwSlAPEWPPBGxDBx5JaoeFSwrY//BLQgpW1xg8uTJFX
 TWST5O0xJFNiLbooAHi5GfGt9rGFurB3ZKwtxiGWVX3jcDZYV1gsdToWnF00gJ+nw82x5f4hGTi
 gv3UwOt30bUg1B9i1J9hkeXetE0yDaCQKdAaHtIUZTO60XBfezxEXLT+5zpvIWoxZy/rVJRJwme
 bvwUe+sPUn8K+jFO59AOuQBUibQfTr71daYDSgtcXhuSNqhbgJRUxJfD24Hd1mDJM+cIRUl+A3d
 B0ZyYHMEwXTmhsyTi5qvZP+kF+roT8DRPmThAzQNYpJKNFvB22UXb5HxQRjkuHlFov6ja8caMq8
 alT8w68Otr+ayhhcBDg==
X-Proofpoint-GUID: KN7R16AXzzG3OU7wzknNB0FihjGQkfaE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfX796GHKrsTl18
 tMcOyvQwoCemYpyMEYmlr1O3n3oKuVdhqvBUzY5Vfu9AUpEBcGmDnTutmEiaLXBG8Bm5yADujPf
 9v/k+x/elyyvr6yW6k+9GfinmkbygfY=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accffe1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pP68ExRZSLElUsFVznMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: KN7R16AXzzG3OU7wzknNB0FihjGQkfaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120062

On Wed, Oct 07, 2026 at 03:35:49PM +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

I am not sure if we are still picking patches for 7.4. If there is a
chance, please pick this as without this Hawi SoC would not boot
with upstream kernel.

-- 
-Mukesh Ojha

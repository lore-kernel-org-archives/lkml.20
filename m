Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498460;
	b=KImYHWTltxHi03oe6sPXFz3g6DkwdmEyFqAanaZXWy+7dTRAvt+hFJVu9fw8Ue3PQ97u
	 flR5OjMeXCcjxeHxMq0Hx7nkkVCm7qygku54c9aGlsDVUva9UONhz/SM3RGWIpMfqkdIh
	 GwSu58z261S3YsYMjS1Oo00LonBWlC9iqsWYz8khJJ1CuLKNTxh0s8K15b0cZ5/BKBM38
	 JLPi54ljJXwrlzcfYswF7gm7/tg+4lPxD8NDqooZyE9LvzByWowq1Cx2S5/Sp3NybixzA
	 X2rGHJGwgjj6LelUucHxwKYKJIox2eryxuvpoW63ph8F0LROmKmHSgIJCc6quC2TkUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
	b=mka680XsAU3CXiXKRabK0wKk+FfUytvMLt6PxsFpCoOTT3lSlxOtooeBszo20zOenggb
	 zfTEm9GiIocS/TlxX+0Wra446iNVXkFNMHvg8YbQgs3nvh9KGQcu1ZDECF8ctMeAbTJti
	 UrlqseCh4mmoHLrj8OuyMr5CI2dvJyUgVpMaBjcgCrKYipVPZ4/nlqWI4B6848oPm3qrm
	 N9YVCt2vi4xEXUI/nJw1hweoJROc8qdHGBzjD8NfW/7Wwe6pRGyap1xwYrRJJmHeEyVxb
	 SQs2qZNPA53PWSAqHwqUXTOE5+IqbClgoN7YBOV0QiRYsy1oegFV/IAnvMfreutMmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGu6Bczz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9wdRHBH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E89E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGu6Bczz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9wdRHBH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx9xd419896
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C0eviU1uGxv+q5EB5b5AtlE4
	8Vr0zFo3hsfKbgALgk0=; b=iGu6BczzOTY2xNJPwZigSiZSGn3BCjxbfsdu92lP
	cMWbENJvRcgCDg/prItIPIg7euHBJEHMSEwBGtYrbYhiqSyBwKIRykc6KRE9P4Bf
	DThSBNvuuKg0shyJATKxrPA8PzpExo1vdCIy1cmvA211b2DKgy8GUkTYbRohKW/N
	22/5oNC/sf+TG2bJFpiOKiqKTLMPs0zzadF/R1SlRPlmAleFSgG+UsN4yNK5NRWY
	JpfkHYPcNMOmKM5Bnx7hJdtSVcqINYSugjJZHXQPuFX+gloYSCK2inRR/EBO96xr
	gHaQB4vEKuKBib2zfz+D6HEH3xxb8o66nLKlw6e2NaXXrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stbu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:14:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso828421985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498459; x=1793103259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
        b=A9wdRHBH/QD9rHrl3SuikD47q5dN9D4chCAF6YAnCriPeuyyQKUbxqjwDhrg/TengU
         Ae0Jgiw4XeGmItFrjEiS+aVStpyNp++q/zt+KsURtKmK0HhWy0M6dNsdG/pKEvyOoExy
         +2pZkdsh1tjj6+rSMZTl0R+MxSc4kFQkKIRFW+TCBeekvwaRD0EBo0pHSGmmQR2VpHYD
         W4Vr4PyJtUlbJcSNi4s6gMqJErGjOUlEnLRkegmEK8q5B/A5dChp/UgqF+DJRtQS6qeq
         oefFPlMc0Uw52CvPqz9qXJZKRQv7BNi68eIPSezS4doeDZMN9uHx7SudgxV9jtnx634r
         fjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498459; x=1793103259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0eviU1uGxv+q5EB5b5AtlE48Vr0zFo3hsfKbgALgk0=;
        b=p55cXBd91svdiZ958zAfqp/hUWGrV/j8og0FgtrqXxJiRZa2xxmJyLeT+O/ovVWat/
         IIqPmS5UocSlIgavLXeInSkkvN3oaObCEzbHj1tRvc+RE0aa/IYqn9t4pukh6+bMxaUb
         aM2ntGzzF06mvOlfVPc8b381Jl4AMUlkZrSdEUAhFG9zJzCT1teUcVkxdYbuKl42lwT/
         M7Cj7y3o/CQRixbTgwQMS2CmWqBLFjioGUX/1jS8duvZbgsqOdlKhrsaWjxgoBWYHzct
         OIMy0KphYfNJ6rIx+U4fITI5NrlEQWw1BlPPw1lVVrb3UOtXMyI3Xo1l49jT/262cw0i
         /FHg==
X-Forwarded-Encrypted: i=1; AKwUvBwQjNqhbucYc4cENU+Dctgv8G3Z9OjmIDKHRGWTeu1XFruUe6FReOnetds0XwDaLKvfBGS4T356A3l6Mps=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6YGpQzaU+v23zuee6D6k2ldee4xYdFLNoNaCRAQV+xPbnPLKM
	Ct/Xt71sG6JWTTXsjquE73ROa1C9fYtrqF6ckMHG6XMNc+F2RTVtDECCf71YXSVPGFhThlhODXc
	vPejo5kKE3s7Cfpe48V2s0I9dkseIgyYdKm6wcijLAVj4gKDbhJ/Zfc0h9QhXGItxZ6g=
X-Gm-Gg: AYBFou3MS7mGg3CKpHl2mY0e00xhsrNxoE5456IoK6DTGF7YQP9K5k7xMWQkgbtZVRM
	3NfoMhufHZjxqh4tGIxjeTncIojMeC97pJkV3sZGhkOUZpccoUwyEopyaDohBq8NCPOCzSvl5zx
	AR5HMkzKN83P55NMduzIx14xxND9aSL9TjVOjZpgH4eqeKrGRAW6Dmy7omfw84RskLW2SMGiuV9
	6Ay6DFx+3ygWkvbFzhf80uAgS8VgiNmFxgL/zcJ7PYWoXPMmDupMAdLBuATI/tYB2b+untlEIr6
	vtW9CGQvctPONr0bRn14TVnDXF0Cz6tQD2lgduWj/eVAYi77PIT7yhBoim7jLNsObJB0vAa8Uco
	rah28DyTY32Ip35uW
X-Received: by 2002:a05:620a:2782:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93f29d1ed76mr1701107785a.53.1792498458567;
        Tue, 20 Oct 2026 05:14:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2782:b0:93c:5f3c:f485 with SMTP id af79cd13be357-93f29d1ed76mr1701101985a.53.1792498457878;
        Tue, 20 Oct 2026 05:14:17 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1e0632fcsm5034185f8f.0.2026.10.20.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:14:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:14:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi
 as a placeholder
Message-ID: <k24rvwpj6lrapnph223rsff6ju2rchsmksegdbm6exofjs3ngd@6um3rrqod2le>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX6ViWafvjk1bq
 jFgVa+0uihl0DtxL2mpRRCpNVSBSJVKW2+BuOPys+58Sg51QdADsMZlrnCzjGrbStOjEzQfw5xR
 uUN7nha6HMSxtAPtIVhkPxdSO9uDDyfE7T4P9mosUwCa4jEwvT8SWCeeu45jmKlLJPdtxiqpxYd
 a+DOV95q717fsWJxk1gZsx54yntNzsFN1vdmsUH+VKmz08luu0Kn857sd+c5ogOnjQd/UPrJoZT
 wg9KvAK7Ncsu55Evx7pjNpK7nTBT/9JGM9YpN/kvxwlDOeAMP5hePgtrBUJk6FUd7Tn9/mx+/Uu
 rgI5wSYZwklKg/5jJywhvhgngXxl0Za5gvaW+Z0TeiSjJ/j9jM9d2LIWAlgfzbVeC4k/a4A8AFj
 i/ir9qY2ypR43Nr7lq6u4IHYgouc2lSj+xhUHf7bOk2rjrdWid43jKCXS+TCC1UhqBeuBwPnG7D
 lZKs1qs2DzmRKrNy4Kg==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad75b1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uVEy52KOV2DfC4Ai_b8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ohOTNb8nMGbVJXaYGSBtiOn8HfCzdc_Q
X-Proofpoint-ORIG-GUID: ohOTNb8nMGbVJXaYGSBtiOn8HfCzdc_Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX2gyA485NZ2pu
 PQkD7qc4PJ2Cw1TMy0uX+SUwk80YL63wnoj2ZHYs6mni3sBhngf6s668riX0pW7D5CuRay4iigy
 XdDyhqQGKMODdkvVsp/QNHV0pwa1bpI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 26-10-15 10:37:05, Shawn Guo wrote:
> Lemans is a Qualcomm SoC family that includes not only the Embedded
> variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
> also the GearVM variant (SA8255P) where resources are managed by a VM
> as SCMI server. The current lemans.dtsi covers the former variant only.
> Introduce lemans-embedded.dtsi as a placeholder for now, while later
> changes will move Embedded variant settings in there and introduce
> GearVM variant support.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

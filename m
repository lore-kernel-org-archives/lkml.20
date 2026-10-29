Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263047;
	b=Y9lCBHjCC5ZXh/i2mA9wczg9IRFJz/6yX2AvHJyEhDrza7Uizz9N7rByKs+YEBIirCdX
	 5o1dsRp4BOIotxvb/hqhB428P31NUauPtlXmHj21XUhhMQTLvBPJdtDzrSl8ByETIXx+H
	 Xoux1MptcqhjoV/Sba16CoTtyvZftKDwjvvkS12PgcbbEaebZ/PFAB+be1kmAKq1onMZj
	 bbK3lyqTxFzprLs9V+WOSZdGwa+2FeOzTLPlXSI4cnzu/mOsmCF6wurtL1+ym2Dfwndeg
	 A9WnLwpuaBgTBSs/+SDxTWIAxsiwmkVqqWK3DOwXmtys2zllL6JjBmqzVnuX2P0csWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
	b=OhVAQxPjK01ZdX046YP/p7UNcWfuNG4pD9vKBjXqwlOHVWmYzz7RZUjodrhri7aZlVqj
	 N86eAq4Jo1NIdKmr7bQ2Y9ShZaMVMWkZDd8TteEZ7T/q8jfeJf7XVRxHqwAIH4BEiYWDU
	 pryVnZM6TeBa/WCvVarnxPWqg1UyQaX4OFQlWfA/8ApG4RUga02KC2+AYgNZ5qQzTniul
	 ijrJnLQkzb2Of/T4XT562SCpPPGSyrdtfCUA6GpSRl9Z2N4mverk3HQ16FWV/K5sbMKG+
	 /CbpWuz5iLlIZhHIY8yscqwuvjMZ7BULHXhYLeFkAuqv/XCgNK2J6xUB0d4nezoC9Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G76ACjgX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyYmv8h4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F0E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G76ACjgX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyYmv8h4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H55a2428104
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVa/mvUfwBbO40HIIbPEdimn
	S4j323pWkTjt0VcUg4c=; b=G76ACjgXP/uXzaO4MxiTtGYBkSKqGy3Izb6p3o3p
	mGzza3fRsWQ4CdCCdapWpfmjbKtQeVrnDVglQdbhOYNmGCnhXfY+EcOn8TM9/zEO
	Qzby97a3wvajxI7IojFE3q/UFDWeHHgt2KQE3sZTeC+aGpDjCn+ca1U05WivBNcU
	nuRo3bOfKbr1R0ftOs0bVIJIAVrO7mb6DYSTAF75bNDPEzLYDV8xPlUDiwuNPvc0
	Ea5oUeoG8GHMTVF2SjU+KaxWYJn5aj0e3htrHoE85VGc3K8Moi9gFPVDJS1dPYVi
	d7WQZ2HzWtk/X4WBsTil/3ljF28uYGfWpK9Mk9cZDBzW9w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b32v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:37:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-534f3fe0236so33908601cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263045; x=1793867845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
        b=ZyYmv8h4eHFljzuFGrQgwUIr47K2hfDQkP4jGkxQyCvFqd5vEsB01ea9Dqcxep46pQ
         vCUxdY/65D2JvNLiDXeNqxftMg8rKugnt/Tb+efWm0Y4Uu1o8h5B921qYIJBN04JDhJk
         llHvF9LYhDxDeBRf7L43Y1AYvJryewSKuhuLrRupTsOA2HtNnoSwDMNhPcqR/yl9MFUM
         ef9RYTyH4RXF8nbMTf+2Gdm1LGmf+Tir+FMzMdS8hPUkkQ0Sk7XPQa7a7XwA68ZQnksO
         TObSU+verXgIctKFwxgSjjY5p1UsXPzqF+CwNku4ELg4CmQU8KDlZjC2UHI5C0goCEji
         e6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263045; x=1793867845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
        b=RodPFq651KDUPLgv97+R/M1hR5UUrsavbHbk7+eh0ayH71Ra11eXSW2kde+xNEVmoU
         LQicEUYCpLzzjVAV9eROc+EbJnz1p1dkqeGYLxHHp+if8HFwfwtLuo+BfpacVgrKl3zx
         J/e0Ap9na/POfj+XSxMNeBgysNgNow15UejXNNnd922ygCiDWKMelmwqU0HkZFfAbQ5e
         XFg+6gzqZM3Nx1zukGFfC0CfnQaL4wnRoHLpFlowIvpSSmM+1Ht+XqGfeAB9TSfdZjCP
         oUJpWYw9eXrXllIxpi3DyQDW2JaQSUuTo9ptVCbw4DBc9nDlJHpU2n6qV3N+T7BGQAjC
         bQJA==
X-Forwarded-Encrypted: i=1; AKwUvBwUZcVSdqAgQFLjR4zoGV8xHX8cCEkpgpx3gSsLhvnbAQwuqFkmPkMhy+fCfhKMc0OWmrPZu9necezbjv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI69AiKMKWvgrj1Xd4d5vXazwQZBzdZTJS9DbB5xrL37PPGeA6Q
	B3I0tmMLkKYPDSbCGFok3oTJL5o+aaPVDAGhKMpJIkyupu6rT0tR/+ExZaCw+9g6H2TDo5GVndw
	sPe+E4A51VtxFaghzYkjJtAZoZ83yJMP6Xie+TR5XYvnhOqqjYF2tX0OZz1QDRo1CSZGfC245o6
	Y=
X-Gm-Gg: AYBFou25SoZ74c8uIT+jtSvfB3Qc7WorUjb4gqt+DW7H0pPIDDZdP+iJXdT/4sJEiLF
	MaUDeKcBrd1usnocLTV+uooSnaDYCJJB3QTIMUC327sClXJD7BBnjSrVTAvkx75XvzWBSWJhOdx
	x+H/uHQAhuYQUaMvr4DYtHQ3EmYokfIgolUUc33Q9uaCQMTTDQP4w6reCpo89CoQ5ftA0vD4ZDL
	bpL90rVgNXsxwLoSXhWxBpuW2O8C1C29Y7Ei+YulvRaQcRIl5msrMGHM3Oq5RgQRZxW4E5ERtS5
	I2R7jYDNS49neei3kluIHb2wMaS55ZbQN2c5UsMKQDsmFkR+/ahAxBy5POY9IuLh9tHjuyhoYia
	Rl9hfTAXnRrI6qUXyuFZNNdNurSwvXcCzEPhLRQ7Ci3C7scy6QqMXZYaJcYX5Qk4U
X-Received: by 2002:ac8:59cd:0:b0:535:1f7a:e29c with SMTP id d75a77b69052e-53fcb7fd72amr73061541cf.37.1793263044593;
        Thu, 29 Oct 2026 01:37:24 -0700 (PDT)
X-Received: by 2002:ac8:59cd:0:b0:535:1f7a:e29c with SMTP id d75a77b69052e-53fcb7fd72amr73061161cf.37.1793263044021;
        Thu, 29 Oct 2026 01:37:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm31506527f8f.43.2026.10.29.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:37:23 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:37:21 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Drop L4F0
Message-ID: <mor4cxzv3iozz6tyjl62ib4dyndlxp6uluhzebardpgswujkkl@oi5tzh5vvafn>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
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
In-Reply-To: <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae305c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2GcbamvMf4vLJYqmZ1cA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: VGoeUKsq-XjGHj-0xtDJbfe4VYYCAvcN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX14fqN8v+BMKf
 7DQs97PMJB2Bvxr44OkyBLErjEKk53CEo8G+QNJHRYV3183dV+jKN3Wdq8TYcx4oJMCVstpRU+c
 B6wGrznjWKIM40zNi58NUH8iXjL2n6A=
X-Proofpoint-GUID: VGoeUKsq-XjGHj-0xtDJbfe4VYYCAvcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX4iqt8Yz/yObM
 vk47lUGV2q13ANPPFOV5HMv8owCFpP95MLjCGbkJF1rUEwHLCGeficAopsp2DPFSWjdrlSWgBdS
 YxSee/SIHGh/jUY6D/VEoNDu3BX43qHSE/BDcwcxt2ArLg65tG5Meia/+upUVVpy9vZsDqXdJq5
 xJUYpgrjeD0cXAbmuV7TYPdRuzTjAgIK05+c19uvPA2m1eEwZSa8mrdVpxcBrZn7ht3XifLEplx
 3wFGKGjyxejjXlheXrBiIgeMHAIlLmhvwwYpOxmNERYXdfgvwtZcuBYdz01OS4njxkxx891rZa9
 l79tfI12U/X1JA90vS0K/pWQZmI0QgYr98VmL7lVEQ9UzYA7hO5sH3fPL4UFM4YZbEnqPJfbjPn
 q3X1fRvqbWAsovQBW40VCYlP1tvZxlY8rCHkTuwciVp5avLopODJZAnYYuiiC5L70IpKp/kpmeJ
 cWloeLdxEYeyxXcLgtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290033

On 26-10-28 21:04:26, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is VDD_LPI_MX, already controlled by RPMH as an ARC/RPMHPD.
> Drop it.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493348;
	b=N0WdqC0LOhDstkRjddYyoISxaaX1reTibbZ6aYk0eXaS4wqTWsrOQ66S+gSrpVLVfBkS
	 Rh46K37KXhre60cVTMZX8K48lPsvYZVQLOQ2G3MfHmAhvHrfPQ3rSP4omOc7ay6EiFgza
	 +zMU1mBH5/ENbPoqMrY7r9w1U+JiOmSb72KgmAv5PAxp8xH4TP2gUvq55tPINAL36ysK1
	 +L9jRihcfJe4HeqQu/iDz8dLYg4/xvyTEEIRajZxwl6J/XmExAiGlbrXGBWxQ5AdmWeE8
	 Tdt9tB/Ly1VMWGL7jz5LRrdSiOSOnTQxTCuB9MzJep4NrqXq/7I8csR1NEs9lBRJ9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493348;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
	b=MvjJu/9xBQ5BY8Pp/hfEIUU61CGJL2hNlO6K4apV7Dc5GytCzSV34OeSBq9krOGmBneS
	 NfaEFt+9qwnEwb+EhkodDnhFQnHaKnjdYb6WMHAZiNz8GXM4k4SpkEoBd9muiFEZtTCet
	 06RfGU7NaKLzzHnyaKdBZQCmzmc59wusoUDqF2rMaDkmU9JV1nS6ou9cjGoQk3+BSBz6X
	 D1HTKUo/8ZYjj01aXklIHxRvU+Ber7BSiiVzeVYyilijQ4tjIkqlRshmwqccGfwu83Ad7
	 dpMPO9YPwBPk4h4TuPkxTLzZPb+tpjs6aJirPxxlgfC6RG3CirKq9BULRRX2MCOzfNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AprRcdk4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KnF/8cI+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4118460A2604
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4118460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AprRcdk4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnF/8cI+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8U3FN4178366
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=; b=AprRcdk4LR1jWCUu
	ikTATDCUXNBzvj4py/NyCVz0Y08DJJQrwXULba6OSy/LnqcWRfd8m4zT8pyBYBYI
	pRW0JACZOhkLwLkOaEpLqonPtNHEdcL3Wf/hwgBkVkXkHsNS9+cCf/5X56VpVv/H
	FyYzaIHy95DvineVyNXf44lSFPoYZW9hT3c5Hw5Xy02jTkpB09VyZFwY3kdgF6sR
	415q6sxraurE0DwtR4oJ6PCZ4b4xJOqIES0rWVzl3sjIC1LuBqcOMeHg1SWKVb93
	DBHjZu6V2rIJEGXtqueCLC+c4fy3mwYvTsHt7KPAECmEn2AbVJ7O1Q6yPpE8iN6S
	xv+igw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n24e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:49:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso32378385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493347; x=1793098147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
        b=KnF/8cI+xuhttzsVE6aNOzwEdcDcSSJDCl45iRsBdYZuB7TwSpl+R1pwqFs24SE6RB
         Ut49GZprbm/ZnULHvYX/cI7rF/HZYrLO9JV/Uh8DruwXCANL7kVROmxq1yJWfYBvrSCq
         2RccJxvZESYaFJkS4b+qkfxKUNwyg4z5ExaaTP2zQ6fG54OXuVYideYMoevwJnWtVU64
         EN8yQcGlBTKCXcwfuuT1Y8dK7Ttth3uahKEatYpVyA+DQ4nBFLq+5wBdPBVDrK3aOEs5
         2LFwBvVrCRNU3oA68IvhKViRQo/F9zP7vO032zxkV/i2GRWi56doYU51bEhVilgNayo8
         c8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493347; x=1793098147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
        b=UNttRMrguFUgiUH1CGpN+GZIDthq360C/vEnJBKllphUf3LrJ8ZjlotscF6vT/amNc
         yv3MaUpujonktXLHG9Ya7zzos7m6GQKkQDKfDiF/eVtibxk/Yveq9lm2HKsBeux0waeo
         2mUKmYD1pahifcUesxKgMT4JdySLmkUqs8T0qq2sEAiaeNSNpsgTVvtRhcXwvg2GITd2
         6lGlV9TcgxMb0GwaXSWqct7BUkLzso6UKxobw2oxEYS3GhLAfnfDbuNlMj++oetnuVyx
         MELhWtu8YVcP1frnUB+1DC13mETMpdt5O4/mReCgzaTTELMgDd1wf5eE2BF40zQtzalk
         3NJg==
X-Forwarded-Encrypted: i=1; AKwUvBwUkCs9m3kZTWDlJaCGE69pm47m9h94TN/Ib5X4svCrYzJmALTSqf8GaxLnp13dgiRtRf1+Tc1R13AESBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYISM8thXRHLuVxhKKXKrVkwuQpk0Dwt2YkCqlrjEtn6NszJID5S
	eSWmxJUON1BCjepON6lg1sUTmcL1oFlFh9QBSr0wc7pvy5tN8m9G3hhk7S1Qxk07bZ5KzUePgp6
	KH5wuWSTN5MRzzLlN8j0abWTfLClsI6gyEqiO4COJ+SYooJdyuXpJAlePR36D7iW4aaQ=
X-Gm-Gg: AYBFou2UQ4l9LT9CBjspauD5WoCaEIgehqnGqUmrEF0P4G+W+W5BR44H9/0cgJWtnI2
	yTna+HgjadyyCEcI1ENDQaZ22owqI75vyJMFbRzoLE4rr/+v7tWgJdhgBmUpHwrQz7L9A8jc7bU
	8zCrxO/aZpH5XbYa1PwVJy7aTqA+QhYMsd0FrHBuXcqMRLyngHxoyPyINJvTLYSXWBhNOxPEITs
	3X5FTRy31pcEbGNNp1nCY5E3iBk/nzPz1j5BtoJJI2R6Wi/DMUd3OPvP5CMn7oVFBE5svkE1LnZ
	8Ks3GohrlwQe5BJ7EIX3Y5e+mNrLE3E+/h17qqE5isP8fSITxndCJzE9zBz2+Z75QiDBvQ67bqh
	d2CJ9xqa/YYI3fIEDP/mywA==
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1974421285a.1.1792493346590;
        Tue, 20 Oct 2026 03:49:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1974417485a.1.1792493346081;
        Tue, 20 Oct 2026 03:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c416a4be585sm407740466b.68.2026.10.20.03.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:49:05 -0700 (PDT)
Message-ID: <d2719210-26a4-4f9d-82bc-e6aa5ff3f2b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:49:02 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] phy: qcom: snps-femto-v2: Fix order of arguments
 to qcom_snps_hsphy_write_mask
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HQNOb6qDWP7fKzeuIZY_4dn00PxRmU59
X-Proofpoint-ORIG-GUID: HQNOb6qDWP7fKzeuIZY_4dn00PxRmU59
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad74723 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Iap0342ROmGHmkRQeUEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfX+kctoSvpdT8I
 ynORzmWyIwWzpG4QILnwzgp8O0lkq05G7qdn6mtZ0q19QZ16OT9Im7Kervoj/IAyFvY0tFjvBm7
 +J+X4y/LOFABYr2H4CoBaYg4TCwTlr++a471JL5ZXJL550yFbV3EMD6/7L5aTQkw4IRGatufC1I
 zRC76S/TQD8pQIC2GsM4q3BcsJkoTrJPEhS5yBaszqbklRLk4acR75ZHqOa0lZlgUU+eel6d4rl
 TYtQPTpNsNSPm4469ljIl98krd/uZBUnOFgCQgbsyd124LLpPl8SFmlBYS3Ag7hj1jQWM3mlGrt
 LHSuQqlgSHYD9LZgwWIMu1zKUd407+mgEjBNJvAfAv1g3LxZCs30i7TBmrMoRZwV2K696d0zLwT
 nDEv7kH0DDIVPuhwAL2XL2nP6/MU7nLxSx1fhbI4RUjFyINSXTdJHG64YIrLUmhKHMJgZ7z2oWw
 wVgYppTm06fVHC8Lj3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfX26EPfrVI7i2a
 qekhyLaXMeXRudou0e1IwwdIsjA44i7M+vKSE/pGHKAO/tUBjsZyE4+gIvsZvwdUDn+je80uUBj
 igt2i3Op0V8UV0FrGzIKTKi+/urqiXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200042

On 10/9/26 6:49 AM, Varadarajan Narayanan wrote:
> Fix the register bit field mask & value argument order while programming
> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().
> 
> Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

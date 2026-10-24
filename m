Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873608;
	b=GeLlFpiOw9AnfAfCfo8mD/k3VVZ4RDIbM8fI7ZcrlA8KU4DoLIwrj3LZq2A8PBeumWsr
	 +qthxITmGvW6594b2u5HRXHHUseWVn1nkYMcNwglGcGuvfFTH3RlYb9gHl5draZ80mk0c
	 6ghARSGd2XvLX4fSpFMNESnvdYBBxIbnZYB4LH958Wivtog+ixPcHLM33sQZiyLI2fvMc
	 9io+BW5oY0ESbtM1G7g1t3JIdi/70jbudnYVa3acVXKqG5LNkwg8qFSITpWqLrpABN474
	 lJ/Dwcz+0iJrMaZXHDj9gVtMlf271DXzjCkVNmtgd28lpGB+R9TB20hBLaQr56a8Znw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
	b=QOyIMy1DkMluJBINdxLtfFVdBbE9YGF+x5jsELYqIdXP4KSF9z9v0dW+IA+Lp3JWI5E1
	 8D8zVaLxVtIrGgOB8k2+vFnm/j+iMrWRA02gB25yx/mIvwpPmwA11T6btSZEYao+CPNhJ
	 CuByXF2EnJA2YOE+OHy/E3hK5jzVM8JTxPxq+jxmyWRrRhWJQ78PNqiWf6wZIleiM+FVm
	 0/V0Ps4Wahmn8ajQWr82sUi2oOO7saNi5EJ/E+FkFXgxLPtQX30GpGONksdD6W383kkyh
	 9D19Y8lW2EolH996dqV7kxGKbdnNItBNpTx71uZFIIpj87iXWbN95wlxm628AR8sGbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzuY0UTP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XB0HEluk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F12606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F12606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzuY0UTP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XB0HEluk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITvGE1776824
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=II4oMIZXIZseKoWFPBpiiKbY
	u/bQ3hfax0bZOTdZzAY=; b=BzuY0UTPsXpIcDYUIWFB7cqZKWoCnVYCEgZeImyM
	PzYCB2tb0FwkIFcn+ypuT9LoV0IDzPU2o0EP1keZuWoeS9Msv0qxtHYosBrnnK8W
	NpLaU8DTAu5FZBWI9SimCCeBGiLfVA1CpAJ4lpy5EzzZhslAXWInCPtkf7QAS/JX
	eMKEAD4sQ9RbYnoWN/W1PY7nYKvpaB6lAkWLnYVKJt/MCKc7kdZ7oJKiAP6aZDGI
	Un0e4el8SaKlV9z91HlvedzWYDBenr54tHQQ/RIz0AyKEyeAaqJtJHun7vKaUq9r
	6/HAC1tSjWn2x9a5vhsapKJ/QonThOsUBCCUwHbhIQEXwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehhn19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:26:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so320704885a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873606; x=1793478406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
        b=XB0HElukSAQb9I453tWYCko6V1s2cEh0j0dbRQ5drhyBPWCIL/QlrVTMl2OrUmgIGO
         OO0si73+q301F25Cvu1juekWiH9C65bkzd67hCTWqiktITV3RvhLp6S8NbhyXcC1ncMv
         2VLZ1nuH2UtJJafi8oO98MOQawtV2pDkvsP2ZjyQ5+C/zBMjecMf8JeS6UML5Jlmk9by
         Rlh30pg4WKd82G1OCO8jzOnnORrkHmLBv4OzEFwRzJsGx2hpwQXmitD1wrEQVGn56Ck5
         2j4/1auYf98CbEsJM+wI368zCag6JHiwPgNkrjKTQiKitcYkqZdy06qgDmqQPtldMkEi
         n63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873606; x=1793478406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=II4oMIZXIZseKoWFPBpiiKbYu/bQ3hfax0bZOTdZzAY=;
        b=o938re4v/PSHffiCkbLme1WSGKtwFhLLgBKmnkxjvdH2G3+7XbEDlMx55G7cgwsje0
         0CUwof/nOUWEK9kj8NGFZ5LuZLqqd4Hy2Bqzntot+jozi34VfGOGltS1EQHbJVWmpInk
         fju19+H7O5PtBv8w8ySQebStfeO/F7FkGF73pDiBs0HZEmeuLkyd1zLmjALwFZjFstvQ
         xhPh7qzd5rafbT1i6xeb5nAMPiauoTCF11tdTJR1LbhFdny1TXKrizcDnboeQsxzjc4X
         Jn41XpAcnUIL31tKOewWJbHA983FmQqKq/4MVimAfajnMR82VuFYvoSEUNyHZKdw8Qjg
         hgCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU5QwM/rNjDBwLNRE+hLSvvJBwNHPK9oGAaCpng6r1Rz5HAtPCtRp3lJaQAymPUl9LH1eg8+qUui4gkEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQz6mjeqEgT1q06yyccvZW+DCQb+0zS7HeGhepgxGxTT04eL7A
	WlRdvj4Sm42hFwCn1+p2B+LUOs4GBhZiCHHxur6RLb5rVXXyx5XKFmzjvtpoRBPs0mbEooSyviy
	JJxHRPT3744oP/6CG8OO9IEEfugDiNz49bxpSmYBwfK8xxb9Ji8Zxd2I4x+NYX1V3/eE=
X-Gm-Gg: AYBFou2df4cOoLJKIMlmxFFbzANr1vXkmhhMLTi/+j0VBXWx4AUXaPcCK+aDdxbtZnn
	qlK+VvrQoOdoDKxm+kVLkihgH8DclTovoL5IFEadruXp87dIk/dvKGJPHXgxs5spVqGOwkeisp6
	ZFKfxSbWp26RAUQoL+3+krPWyy0OICRNUAam2TICiJg2y9kN0ARsvwHHRQ3nmIpOSZJ19OKWIx/
	4oAXBqNVIeUDcKpsbbDU7u6fyNBPim4248YZP8t3WPz4SUKG3qqEboM0tl3MoTLWIUrMfu8mzuZ
	JM8fxbNHkd/PAbXWWOSYDVqy8Lm0TkdrClaryRAAHMjLACakA28BIMglJyTRqyR8Vmf6KsYVnZZ
	EkRcNYHL9BF9gfTmi
X-Received: by 2002:a05:620a:370d:b0:93e:95ce:53c7 with SMTP id af79cd13be357-940ef79f0ebmr406266185a.4.1792873606131;
        Sat, 24 Oct 2026 13:26:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93e:95ce:53c7 with SMTP id af79cd13be357-940ef79f0ebmr406263385a.4.1792873605562;
        Sat, 24 Oct 2026 13:26:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm205760225e9.1.2026.10.24.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:26:44 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:26:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
 playback support
Message-ID: <5ayekw74yegk5upaj7d6v2va6p4koy4yljlqje5cfgrhh7ovmi@akurrock3aed>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX2QBoZNAd3WI1
 LFS3ERW3Wdc2PeFEZRWdIaFz9PkqjagFpfLB6UiWoLfj6BWfV2NY1ZXCEc4Xtck95822DXBHV/Y
 qVeIWy4WfWTKSWVNOr8qZ50rUOFLw3c=
X-Proofpoint-ORIG-GUID: YZvxH3sB0vCgVjZMVhici8Aj9yK05-_o
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6add1487 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX4y0YUC3BEze8
 j+SRQSlds+lBYMIq1Rvon6xniAdEOFjQtm8+6x/qlOuJDLx8fINqj0nWja1dnN/1hJQ/rfgM5BJ
 bTDFfXaidy+xEzicn7BjpD6Jngin4xGqBQ8t46h4o8RvFixaSE0BIHwKXLSeweQ3z69FhHyRMkL
 wRnOV2e/j6vSRxwC2kDfZaA0SwkZrSA07kUxs2ApfXoUTIpBDf9GgtwtMif3xdnJX4xYFFMl3Jr
 VuXAB+S1ctoBGqymkzVSPYUgSQu4iEQszW1Oo+3pSlKwgA4XXVZ7oBxnRbIGHtWUcp8I5C5oQfw
 1igfYNmUTo1+0C0TEO5yHfHaawxIoN3KHZYdb2CebN4sT6Xyj0ipeSNfKgrz2vScm462naIAPso
 hG8MsshvB5tbg8ghToIcsfKZRao7nB4VlUGpTpOPtNKRQ3nUuqATzdiKyKDVRoieGi1lupC7G7n
 CuSlTZ2zNnkR4p3vCkw==
X-Proofpoint-GUID: YZvxH3sB0vCgVjZMVhici8Aj9yK05-_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:25, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501207;
	b=X6oXNeq43pKrhPsja/FiKqblpC90OFZeJ0sZd2ttFHiNjAEljRiAsQnAPasmEouR3zv0
	 YYHGpptaZO0zvN4Nym7vfNfMwILaU4Os9fusw6rvkBCZgZ/6XZjPBAmRKtCbBXmTSQtkn
	 sjcFn+JkuQoQe7vbu/wgaI9DtiJXl4Q/sk7KZkof0xkiJhfw2PV4h5+u0eN3CA0v3ZAdJ
	 /diHGXpE/MvmOiHqaysGDDvqFjq3pEz/tq0bUjyc9hQ0wmK//vZ9Y5FuOFq2L/vEGNo6f
	 Q5fptMtRWeYOMZx0HFuJ5srB11gaUkWw9z/1PHSwVUi8z+AiJFAz4sEcBs6LEQTqb6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
	b=jcGSnYMOBjrGIqMIBr9KqmLZaKIDVgNbG8S1CQKZwhcFVmyu+Y9SI5Idcltirj6ZJohz
	 S8rY659Sg2OxvKebXbQnBte1WNOnh8Ddx6yVBKRlXIi5JPx/Q3atVcRdy+pMd+T+E3APw
	 TlxOfQOi1QM6coiiVv/85NKugD1/Fv3ftGjmW3tdnvfEUfGTz+noNf69ceOz4oNRz221g
	 +U5Xur/gA2yQ5zauISqJm05ZyIy+475vEFOwoovWGAHvwlZrVaUHqfL1nGjzWM1mbW0tv
	 daoegldaeuo8kKd6SxS5wZyHmQyVHEG4oQl986nyhMMPXmQheM0GdUhDV43fm3+2YvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Di2gINIR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13051606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13051606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Di2gINIR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxajb927041
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YA9sqWUQC5W+VQQaSJzAueT
	T7pF0UiI4Jt00f8SsOs=; b=nBata8Ao4VnQ0BieJol34j6v3+8RBs32VD7eaZhp
	wXp9zyryFdPapgD3yxOU2W3hDf5JiYjP88Ek9vXfcuOTmpdyNSxfoBJe8FPwG06e
	HFJYU6HG9XkXi77mdk21dStht0pSLtgXgiW5zMVJWu97Xf52mrC2xyeNv7JTnMgm
	mTEyxSpXc82kgha5oxOYCqhQAO0D+zoKPptIjk4NtdfP6jo35Qx7IwESX7SP+B0/
	AbLNThkdI5J6Zfup3pl/sOU+/oOR8yIs5nmnZ6TmFeT8IT7l/TTX2hX/LUlDFoQq
	aIf7n6cVLxDjNRi7xaa45QG9c2pMkXett3AUJJOBnZ7KDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5paj9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5367e512db0so12847601cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501205; x=1793106005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=Di2gINIRkpvGYOKLUel8EAsnQd3B2/+SIigSZiLuf0ACgbLvoPNRBC8ASunmLwvL5Q
         FmAk86Ged56QzGXZZs1Dkm6+hlvXmLbXgsqMjUQUb9r6aMQpEduFwDxE1b4K1IO/FNmK
         KV0LmB/c/fFAFjM/Ed/IEr625N7Yy0/V1u0HPcmLgyD0Wz0yvEZrt4AUNaK/oA431jIs
         8BM7sFbz6r4KYmzGufsXUlm5aFKXCeUms6mUlEo7CMyPwO0wZYGU8LurnWrq6E4vjits
         2+7AfByosvn8bASA7pOhPevnXRDupE4k/qh53wboD2h0x6S7uZElrM7FA5B1Ir0+Z4Ry
         Cc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501205; x=1793106005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=BYNX5rQCqRxkAlXwxQ1s4pLck1uh/ZAARcpydlguFP4y7sPBBE3IadLtg3dZsMCGOw
         igcDlnJCVcZOWERX9gxg94dIdaZM2q2f8v4zDe3pDjloxUnrK081aiOxO0f1zj2TzAjc
         bJTHaW+qYEyPUnLIMybBrLhUVa29WtJxI7TyxzUKOn6/N9KAupZUotXZyVuoKxTC6Et4
         tQM1/ATtGoHl7lYSslBpTodPb+LqY5+4EgjkBO2ES1kcIqAWPjF457s3iyYsTE3ipl51
         YeycPGGW73HeDknXpi9P6cqXN1k9anBbGaCLBwRlYXetjXfCiX3Vzgl8W4uyfechJnmB
         2eeA==
X-Forwarded-Encrypted: i=1; AKwUvByDkWVcdWAQ4i8ddz41Ah626h3VjFoPiXKathwuwTMp7IJu89gxS9h73itzHTtL1hsxKBoZg5zy0rt3km8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA++5dkWQUWfSBX5KhnFjjYQe3taODGRMhoK0yjH5iPFJXHZj1
	t8SY5u4OvlkMBz5TZUEVjgryo8NPnWJbIIdYbBKSHLpd8VOBoc+zfX+dzCTUZR9Y6bHxXQ0UjUD
	yjuXJJhFUIGmg+rYJoMQqJ72FDB2WMrvozB/jGwhIo1LBu8WDtpxaLzLGayDA6LQ7szs=
X-Gm-Gg: AYBFou041SAFZ/K5yrqosHge8s+0JEM5Hn9Y+WV31WlMQYZp7bW5+xkTT3a1KRKeFMu
	1vNYBp+notaZClAOXw9MvvDNrGRmlepmLuMhDF82h0WNFehveQ555IR11qh7O4tDeN0ucluLZlu
	Q4w/7Wnpf11I4d3+lufGkCBqX2gond8DSwvXid41k+pc0fqBAxa+W+POHzmAEam/MI/84MdwoIY
	tycRbIaeEnzJuYDcgQ2ODQ2ZM45XYsiMCyOEuv/ci655QxsBgrk8vC4Z74XKOP9LsxxfdbU7evo
	nsp+lSywL5AQz3YUogNmdxoS7MEdrqzFz4CoDdYpptCxBAi03KY+dMnxD1Kf3HHPpwfaO3U5MjF
	rQ+VW0DQIEEms4dBM
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311664785a.19.1792501205268;
        Tue, 20 Oct 2026 06:00:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311648685a.19.1792501203724;
        Tue, 20 Oct 2026 06:00:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm83132575e9.0.2026.10.20.06.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:00:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
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
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: Ps-W3mBLFn-kARnYlYx-HFZIH4oAvIx1
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad765d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EzgOzLDDTgUawJARWFgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXwXawaPkPr4rH
 Lf+5PderQ2shdAwV+egvB2ktrdkz4WyjPqlKaObzEsEjNdn/vF7j22JYPSKwppgc7f2xl4uAJ1X
 2kGL/7fY+GRqSdA+sUOkMkPALedCyTKio+uQzl5gLb+5bw0y+cvKxN/9/yWJZ0C6gLCeoUZBcDg
 2SxM/yOgVfoi1sfVvrPGjbMt515pLGuX3YvU/gMFGk+o/pDgl7eWvZHtatkQyt8eW0Ycky20TKg
 N5/TFV/r3gY/n+GwOMxczh2o29ce1rN5MlMlkmhIhZg7XhYLBFtdil4p+udx1j+KKLbcf7GtSn3
 KeuZYu6DHP2c4cXB5hO26XfnGgKTdWga2rTrtXgZK+qWatoREiQ8sCCmIdPhnKp0tnGWHW/0+7+
 iqsOBiwjEeTiP3f1XnwacD23toVciVrsUof6f73cPG4zshAOVEnqKOMg07W07vdOGdvkv9ZkhQ+
 VwmHQcrMawVcV0NRG4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXxXbZ7x1N2o13
 M9yO9pJbXBm5Fs3MWu0v8Qox503P9rbbuC5TdY9p9sij4Qxuy8Qob5VzhrbL+cOKQjWbwHmrkH5
 VCietQYnRVNE59PxGs19YLk0TOgWUys=
X-Proofpoint-ORIG-GUID: Ps-W3mBLFn-kARnYlYx-HFZIH4oAvIx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-15 15:25:22, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.

Can you elaborate a bit on how the two phrases above are related?

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585055;
	b=gaH648Qzko5y4SiAAvZpkx7FVkpkNrIsQqD7DuW6TzZD4OfiR1LnK3GCE6Waunemd4A4
	 FilWkCrSnPCXdY56dHwFKuMNrC9lngZY3dWcwMusbW9aLaBWfR8pRN+Echx34Q73ZsJOL
	 DRMXNav1ojSveBqT0MOG6I0rOogwdR5mKMbFK2HemH5AwOtaNQ6kgelTm2/wi1VZy4N+G
	 OmBX6tjdHYRgaRwmqmLuBpMDfx427l3DlzGdrOlPgiAHGwiNT2mJntTt70WffYZb/0kYn
	 WZa7wDU5BUFiarF/dMbgchTvwVMLqY9VH7BY459AYvtf3QFKu5Aw9o/MNXz7jq95gyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
	b=fkZI8BZvj3jnCtV9VRiEIryAJ3Zl6CmfQLj3T7WLvjDZcvFRk6YRcLCaeAww9BJqRs+0
	 Dgk5Qzls0kK03CFCvZKbbkOpI6o7x9UP/ooE8DbfZNHPQktHjyW1CM6yvLguAmFtyhZ31
	 3OmrVGnR1vj8w90EPGn3ZRVxrvW8tEMDpi2/1Xs5LbP3bdP+EbWdYYcaIhiBLIZmqjPTX
	 q57VE1khcgWNAl7sM/Ee1O5u9IwntS+X5B/9/ptYX9FuI+YsoduM/t/+Goyvn9mE3iPKY
	 rsLvSr2DX5OE3aTWraag9HqzVBE3diMure380xKb9N5wGfrDeIbYaehPKF2cfr4kwTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03917606A339
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03917606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq106wdr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKkrU0u6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7AC3225045
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=; b=hq106wdrCvnaZp0/
	BDLD2cDahdCUmhRWtZjpB+7YCshF6VxeNFrTXtBUIvGmxn8HfZUQBQtFWdETR5vq
	aYsCTkQ2WCNu0HvEYe+8sKcEXmkAKQ6+wxJsvtFiFQPQGE39zUTmrvtj0/GVRT5T
	bAai/mO/sam/re1hV/u/G7r9+KNmOpzi4qG2FEEyEX7L9zIo/QklZBferOfvRFjH
	JDO+ZG3pcHZtz4eeQTsjPvBqlg8PGlKrMZ3hV8rM6QPf3JNprzpU6Wjh+u5LZyLw
	Vob4+9lHqLmibwB1StTXcUvs+Xhf3V0ORWrzQNNcAtVDBEvjfhAIvBJiPHwI/oFd
	JLmlmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78xwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:17:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so18548285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585053; x=1793189853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=fKkrU0u6A9fBdR3M++1pZHdvYPfCEB95kmPNClgzKscG2EiXw3swQIZIFBG3xKuMGf
         BcfCcqU9eCvXcTd77EChyxcgqzn9qVEJdcXu2bcvtpSD9/IjDc87zlDO4fZgjT62AfZf
         8HNk2bu44xeCv31uNynYyID3P1J2xLxUfpzC3pPD7jcdUrrarLcOv5ISm7Nc9L7Eij8X
         sxu8JrAPfcQS+uwqWS5RJpURa02cnYkHjTJdZDh1U+bF/g8kaqM8qvjlR8RAdpIs6UvZ
         DvaFQTF7JdSy4xwvABCAHj8+PMscWhjNqfZF8F1kbmZ3tJoMxpqFt906pgh5uv/hktNl
         TGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585053; x=1793189853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZU6PoNWZ5NCCd4q+Ok+vNmLM5ByE8F5bCoJ7jkP5aB4=;
        b=ZTCKn+mpUG5mz/h6z/hqjxr4ffkgdhpHUEnYbqr/t899UxVt3HF8xj9jKYtHUklLbT
         j1EqjYZn7zsE3I5e4az5CjQ2UQhVqfRafCR7RXICNmEzCN3ZWzFj595IOU/Yqd6YmLf/
         GzzwWmefDTNP1TjAELcdcN+0R4KIc3ssLCez8+sqTsVMYzvthiuHiVylfmP56z8046sP
         yqDpOEQHDP4LayYlEMVq+oxLjts/5dC6cd8/nsvULuHJlwvK7aQMvq4x/UyHyZf1Lwe2
         VgEe2sGrSbwuEur+PsB/V55zQyM7mewNrb8hiM9lftPrHrbsNR7jMo0Wfz042vLp4cuV
         ijig==
X-Forwarded-Encrypted: i=1; AKwUvBxYSWLAKbGgRbZR1TRp+4JN8q3zMv7QS62xT/71z95ouwbDh1zhKeWq8nUudclh46kuaeSNiuQVNtdQF+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoEfzInot5QZelzZMNc56Yq42vs44S2SZnGsJUj2DZBUPmSzxO
	2Q0Wt9RYByLP840WJVrbzORHS3efIsK26nXf4tHnlSj2jnPnTMH2l0kYfJjXczu8EUn8W2MK7Wx
	QdIDvoM+LbvUKPlQs4NPrrU5pyiPUVPeolUOABjJgSdxyaGzu5akSpkORS9chpA3xsBQ=
X-Gm-Gg: AYBFou14uu4CCgJyVy3o58ghfFE4hHC9E+CBCAvDKrSMpfy+ly4J8PVDUyycxfXmskb
	UxG3GOkisD2zXqzhrrRIDMLp7knq1nou9AKWCXiQUB5EWGvk5dZp3wnLAdGyRobcH2W08oXXJRC
	OMPlx6tAX9YYtRGrAqlnLJLuLnzcPVNYUXLp7yuwboG9cw73EFXbuyKHcirJT6T2vKtyOmN3Z4x
	XnK1c1GbGsy/KJHmiT5dtWAaA4QErLJs29KyvHvWK7NpOXYTGC+1Ux2zDf6zQLijHRw1Pqu7GdJ
	GuPfUcQsD3xceKqZRb7tVHCaiiJhVYKbvzLadfuipUTChHVVGpq9fVRzCHkZW/JTG6zyX3e3eei
	zgA8pqm5qCul66O05kVu0zQ==
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436658385a.6.1792585053121;
        Wed, 21 Oct 2026 05:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f57ff1ff9mr436652385a.6.1792585052487;
        Wed, 21 Oct 2026 05:17:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7c55asm71894466b.20.2026.10.21.05.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:31 -0700 (PDT)
Message-ID: <eb5a2294-2e1e-4449-827d-eccea61198d8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:28 +0200
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
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w5kdgn656bQshGuJ-3sE3c8Nog1oDvly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX36aOAl/SewTf
 IGGVGPz/HbzzO0Zr3mhmHQa7ggZxucTrd1wtWjtOhGYGoqr81e57WAE6/xrxioPdIfdaGiurSGE
 RJ82rcpw1uHeD2tp9IxTntF5AgXX4wltwS0ARAGfkkZ6nl8nQca678ETONgT6t5ih6LLJ+BvxbS
 6UT50xIMpHfsXVbnfwohfqSx2BeeFAutbMYBYk6x4tN2fKtdpOcDlYQwNGqqXORa17cxGSLCQhz
 8vrKolxUG34b6gdnrN3gSX/0MHLt+BxAW5E9ms0QVakooGVRVfS7oKaKsNqjHs/gyWCXT44r8GK
 ySiEsXCY36O1XQR/qkZjgjfYVN8myQ1+yZ9aMZhTlopZfTwZsHZqg3l6pQ6Aqi+MLnsGAVMspxV
 nEhhc6v3GaHk7aTdKRj5kKOFC0EinaNerNo+C9Nlediazi3qhpMQzIToMmORlkyQQFoPsqQEUWb
 5rbs7tQxf+99t6ENYng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX341U+Pnc5pIg
 BiV+mgNlAmLwVF0ttudsChx3qzIhneRgFgiBpgRFcdVJmVsO1+okYS9NZXbmIRb4v8UK4QtLJeY
 FVO8sMFM+uHyM4u0yH+mHV0YpPn/P6M=
X-Proofpoint-ORIG-GUID: w5kdgn656bQshGuJ-3sE3c8Nog1oDvly
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8ad5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 9/21/26 11:51 AM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

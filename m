Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479366;
	b=bB5yjTzrBec3mC04HD6M1a/9P0qhJBvxSxMCdRf4o2IXc7BJlag8k1rqp0hcS92hkPdu
	 8KJPDg80fqDE8ko2IbXqdIddnbT8CEOA0CnsKV3GW8NW466sFA1u/1Lr/f5iEJRBcNa3V
	 vfnyytXYfRiMaRUHLbi2ZOlvNWqMDOvTcJeCs8dgItOaetuR+G5SacY+71wTsdPdS9n9N
	 YYq6lydJ6dd/uf7DykIvkef0wEp57o/O4ec0IEDgjnEYLxsxuXj7M34/e9Ui5jxYfIj7N
	 hDlO7Bmt1m2gSAN6Qz4aI7VN6b7YqBKeJR9x002zlXiuVXvRkRsnzLOafmSZnBMNYBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
	b=4Pjq5XhNwKbYu6HCuml1LKPHp/uiZSq/7H1MUU/tq9n13CCa4tVEySHhzUgsA3eHgbKn
	 ffNYgksrtAZP31/ynM5i04pcIXMBRw2PppWOnsdzmzTjVJKQWxSOpknJipjvQ702U8kJ+
	 ZoL+h6OMtW82jnOthhoQ3XfJi2WlAnv4e33pZBX/EhTIqNi6CHellCd+e1yyjKSud4SQg
	 WZxqSgec+1l7XiJNGnnZrpJgtmesjOaDUDkiXZdsM9Q5q+M/KV6MJHkVlre+yRjSGfvNF
	 xJYdQEUc5zdmqVFjxtD1Q0SKuMvjGD8tvb0hYZrrYWC9FAkJ3t90YiFjkJVkMSBc6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A8E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LJqv1MbG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCkAyclT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIbP4031740
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=; b=LJqv1MbGFeFQx84y
	Zqz6oUMNyzFnRgq3tErABOkJutRq6QiG7S1B96fBnQbvKSYwkFSsNmq0xHBAic4/
	24NuWOg+E5S8SXFNqGl82RkeqAdgBRsErkHtfMKScdvg+xUtojufSzxRjak9bvS6
	YIyH9Z9gtg2qgzYpA8nif12JKlvgWRCBowca1GTXkdBWLxFULNbrRh0bYWcGDcH+
	BDm4BvITu4Zwja+2tZWginft2Yh4I+ppxfff+IJRdxJZbYZbQjB+OZ2hHendatC3
	aIAauvR6vd76HhDex17SrBakF+DDlfWSZjKgxm8dId5F0L6KhTvGrzEjOZdQr+J8
	0Y1joA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q97kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:56:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so71688585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479364; x=1793084164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=OCkAyclT39dKe8WemJMWfwadm7h+/S4s/bqHNztCjcxHtsO2XssNlMymmq9oNB0i2j
         2jXeEG8mQWFius+7z4o/izPe6iwG9qE5PneEGwkFCwbVmQEBlqpurPO4gakTBe41pEg/
         aSx6PKaUBUqu1piXwUuYvaK4GPJu79w/PYefmdgohisspjEntddyIPrDozL6RU7gvyzm
         3/RAHJdv3/Gf0Az7t0ZrNvsciQB0FgMYxEwoXZueAmGlb1kAiDOjVAVz1B1t6Yuuw23g
         BbQK/a/n8nTWZYqJ7OUCC8zrU4AI16jc3cf91E2CkVKAbs+eJL2kE6jeO/zQvvF+cBby
         /JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479364; x=1793084164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PKRwCOfxjZMSxgjGLWE+hxoZkaAa2a8erHRAipSTCQ=;
        b=lfEWVY/nHIktLkqK7p1KeSUQsDM12DF9lxznV7klCg+6bZn5zWwG3hKYWoMNuy14G9
         V04qEBng20ErI1DwdB8VY095dainsggs277douYFqH82En1qENphwdTHmTdoKQautuOA
         q6X/c0aL/WBES6wK2q6OezZ5XIVH6uLAWHd7mJwhBpELFhqwBoeoH9F5f84zMP5Oxl08
         6dBlI+n7uzA4sUye9GJffijyDuD89jZ60Ar4rd0XZ+0WfKsx0CjuR/SV4GRse5MdVRCo
         UtBaMLzuIS6ZgHpblbFq37WoBUBCZd1McVTZynLg/Vwm6t6KOUYU2zQJC2cV6xL6hq5a
         mbCA==
X-Forwarded-Encrypted: i=1; AKwUvBz5jX6h6VgHh4caeyBaA8c9HvxDW4onDDT+cGwa05kxPjW7prsVq5K+q/ZxxtZFHsLi5sCCDeZD5C8olMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7lXvplY989tyK11ZlevPmuuBZRSCGqPqGKkcNA6iwSMoC2OYq
	qSH252weTLdhjFq7TZ6VygymircBDooXqGzNdjJ+TJGxVzHTfqZIg7WJohCjPTz2Sqq6JKd6aAA
	BAH5hP3Zwo+cAAhwfXGM1nxvK832Sb9eFf5DU36p0EgEU+AQRMZ4FsvgZ6RvCw113eYc=
X-Gm-Gg: AYBFou1V8VbWtxCgPr84tSov8Bb6uC4F0Lu7VZmWrS0kh8Y/S6P+/jQE6kwSRDpnU94
	70gjWM30UBp+1Fvv/A2OfMieIr58tWjlzg1Gpfy/LVUKhl6/DgsgN7764rIX6TANSDfF68p/dQ1
	9zlEwD+KSlz5jg43kPoQV1oho0wT+LF8RqJqUhxA3jGiHpR6WXFjiJUNjMmLnbUT/nPaVCyP7mm
	MIVL5b4ZOkoThrmmOTRIUrrXmAusTmca8T0or9dNOIe0fg/k09xwJsPpj1NDlugqPoG1axrH7t7
	3MYYNiw0Mr3niW6sIaxb0QBgZGEdo2DoAwVyyaJyHK06ryMcueB7ZXSc9g2fD7NxM37NjS0nUDt
	92IRnyTjVZTgyjEZfV72T5g==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922700985a.3.1792479364037;
        Mon, 19 Oct 2026 23:56:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1922698285a.3.1792479363583;
        Mon, 19 Oct 2026 23:56:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3dd83d3fasm1305197a12.5.2026.10.19.23.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:56:02 -0700 (PDT)
Message-ID: <e043f9d7-fc32-4631-9012-f0dee835fff0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:57 +0200
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
Subject: Re: [PATCH 09/10] clk: qcom: cpu-8996: program the MSM8996 Pro droop
 code register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-9-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0j0WSvkKa2jHnE8D9uTPyZM6-SrgS01V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX9VErFMBhofFX
 tWwVT+MKjiZfwsV9mmLQBQro+cRVvO2M9P05KNXX+vr7zoSavm75BzqTdVMFnOYMX36m/SjGFAG
 OTsFgJHbgXp5lgYAaageCTlERe9pkVw3dR3/YU00qjtN8Zh1YmjNOAM9kw6kAxG99cr5hp7lbbh
 Okp/+6nI4WTVFDfpZpPXbZixXE9EZELa9l759cRBngWUnKA/GjwflJ1JE8qGbDQSu9nii2Gkt0o
 Fkojz6vs37m7wnk8e4RONET/MXHOtxuh9fLk7j84+Dst9h/AImzAoKnP3vhvWucD6qPzLuGc+Bw
 ImSi75zNH7ciYOAnzCYGZSKP6+XICUJAZeOqpHBkROQg9AIbV0heKLUURBPXasm0zfLj5VB4frU
 KrmW8QTv484ryaSKgQ+3Y595BiAEAzRpRcSLpKmBv3wISorFPziXxWy+i02grwZbQITJLMUDqsz
 Elvlj1+gCbbJkgGeDkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX4nm295pnFTlK
 geY2ltQGTxsF7XRHn/D/txbWQcsgMZn91UGxeuB5xFCnXwHfI9/w8HswJS86Rp5TGFtmtWxoK0i
 aTDgYVZHfMnFgnLyMnTB2XAQv92ZkEA=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71084 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CHr2jc4OuQYqXGn8qmQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0j0WSvkKa2jHnE8D9uTPyZM6-SrgS01V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> When the vendor kernel enables ACD on MSM8996 Pro, it also programs the
> MDD droop code register of both clusters, so that they switch to the
> always-on clock source when entering the D2-D5 low power states and
> gate the limits management clock while asleep. This driver enables ACD
> on MSM8996 Pro as well, but leaves the register at its reset value.
> 
> Program it on MSM8996 Pro before the clusters switch to the ACD leg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

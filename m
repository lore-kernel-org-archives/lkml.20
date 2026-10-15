Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEB351476C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059665; cv=none; b=cz/45Q1wcw9b3Vp+VKLK2jGNaGjjKvzYhNeFJ4/lLnxMrk0wvhoF6GVJAIcj7YSfIlaME4l/FsnOToaH94kry154+m4J/6pIxHRRi4KPMoDxpX/T3DhBDZSiaRzQUCGybGWYjX6Vn20eeVUtLuRM6DfOp8jBgNppbxcIsRZxa1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059665; c=relaxed/simple;
	bh=u5tlsWRinm9tCneuBQHtmvAy2x7uMN4jqyTkfs7VmyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F66+2G5Iq+fyy08b8M6w9RUI09NuDFH7e0YmcZnR1Gy9hKBKNH6Yoe7Nzleaqa+/poNOCL95KDrjlyNSgx4ZFw715uas4OqYsw6qU4gPfNa3jLHORkCoBHtU++3GWFYIA5lfBh9hVjcUf4CHeSAMMug06yyF5xHX4eY4qx4SPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXwPD6H9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLJtSuGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXwPD6H9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLJtSuGC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpFU4011468
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=; b=PXwPD6H9VVWAPlpm
	7e64/gahPRzF03ivU0ke3Tro/pwygWZG4HHz/Q1f02i2TNYa1FbWmc6YWhhs6zJA
	WBvr3r9A12RcT4cqpmuZl1XpCTUNyxL8nCdFyQ/KSm9cw6DOlI37Voz1g9oF0RRG
	Pww5TMpaykPDJlt6boMjRlO5IhQwo4WxHDPepaudsgyIutUptE8Xmn43EDbjzspp
	Th9BcXQ3PIWKEuLSBfHhF9uo0a4VVpGR4Ff9K+hW654DzNNd3ejPGOAqV62XoB4n
	nITbNg4KhiyjXVzT6ya9FePZLUAwjC+BLrfRvPiinIlka3bXhyEBxXqPq8RkvARB
	eKI/kA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbx65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179ef12a03so17326856d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059662; x=1792664462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=GLJtSuGCnp2kCwnyCQzxHvTH/k7snfa0wi5SVyWgJgdi4sxYim1fMsL+flIqokQ8/e
         xzX1n6SNbTjSEjz/LALdITIY7q9qEhojMIOSN5Y1kU+SjpBevFktwMZAoIAxVWgdk/Kb
         p3hRydXRLiPjbhliERQP3Smo14b0yMKPj/oI0ZoJg18SbtFZreCvsw0r/5OlnmQnJshg
         fww7xR9KSeJEoMM9wujQBAivpuNP2S1K7vAg2/U2OI713FNeajMwE8gVvnG+jlBN54SE
         QH5/l5GO11aKZoWLZnow2yQ4aGNRDFvgvXRtg0VF5M6lPtz+sTZnGIf+caYw6dIh64D2
         Dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059662; x=1792664462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=jDj5Ojao8GPvknk2MJXfrGbk16YhXhRGcCjPwSCdVbTxooFeLeXNZ5RwWQq586nyqh
         lfXYp2Hm11bjQIa6wWeQoTVJglioa1TFzRVOCmnQkPZo7WoVOrt8NRywjFP7WuhLEBeN
         6b+laAET8b0/jzoV29d5lMvB94f7WIp+6andhFHrLaLlPOBm7VHOmI82qYnJ1AVopk4o
         A8A7a22elKUpYOcSYDF5SirIGJn8fv7ZOZxeEDNcyXC2E5JjNFJsXj9QvFmFd5qQiwCB
         bJeDfQffVJQtY2+DjMu1gfZpRo81BDeec5yKOEUg4uw8UDWekmgyznY/z40ayvA9v6ah
         +MEg==
X-Forwarded-Encrypted: i=1; AKwUvBwCIuO2yMcD/pra+8cHJ+KaYlXIOZ4zy6VPGHXtJVndVqzNKaj2ff0bzcaYAvuxjmVdPSEUR+Pzg22fNHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW2EkT2jR7xM6jxHDOINYarqyEhL4TOxK2qsEs2H7L9G10ICOj
	QMs51PYLw2LKF3dY6zMerSy6s5kP4Va7S3B/iFU8EzZmEYMkVX/sxNqzg2PVlBKVu4vY/huLR9C
	KsEzqfwtaKb+hs7RujFO9tcPdBTTECdSDwEha9xt1Yu8VBWZVzeHogKZvH9inwrcmNYs=
X-Gm-Gg: AYBFou3x3iyqe89xVgD/9XUQhW8rzteI+VArIr8T/bqA1g9pirkmEtLC9zdZgeYXHBn
	Wq7jnqoaG03UWnFgwit5iTdrG9MFGVY6Vhh8Y3oXNw1AY+Xol+FfYCtJlU8JotFeiUoIRoAaZGM
	5DZ1zeQeYFsx2kuSnX+bmV28n2apuG/jKb1q6m8YAeU8CtLxr55ZCit6wIryGPZpBe8l8/EpjtX
	HtsLd6DWcMc/Z5rGUuXmTo3DP17S8FuNoW9scS/qT4MLRijIIIh27yLy5Ditbd1ftj14IqrsZLr
	aZR5JWdZAYJ+dp/6f2GYSICuB3Vm8h4+1ZTEwu90kVhc/fNAs4qp9LbpHsqbLPd2TlkSUbWc8F6
	G7LWftJMmaw7Oir8+7pj2hQ==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302250585a.4.1792059661881;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302246985a.4.1792059661402;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:00 -0700 (PDT)
Message-ID: <9d752fbf-8b8a-49ab-8e8f-5c11963cec71@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mH5Vdg9aUhKlGSFnVp7Dr97CWBGT7HlP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX+zjF5TuSQAN+
 T8J9Mcn7x0N6YhRrynQPgsmRh/jSxCTS8l5c1yav+1jH0Qh3gieQcxk78xGkzDqFVjCkqGo6Sj1
 PoWC3Rkoyu6dLeCYLjZH1aX1nv35F34=
X-Proofpoint-GUID: mH5Vdg9aUhKlGSFnVp7Dr97CWBGT7HlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX1sQE4DFIQpS4
 CHPZZpvp1lNLAWpXTAdVsJMZsYfFEuU2xFxMObtGFqjAfwSp+4tSoe7YzFfvdUKcTYySo/j/2dY
 lXNFWskF88j2QE3qi/+YrWEfg1oR5sXFjgraj3Yr/dqWDFEKrVm7vmBeCH+2kI4sVSzXhOlYm7G
 6sAQeaIqpKIwqlcpCQ6+l2v5ABO+DhaGzEaJRgrzAqmlnKwOIIurvNlSeuCfugkuMQH1HPc4NGD
 LhSMiI3+JeCKo93ALx2akfCk/hv31yduqETOB5bqQdo3b72DoGtQbWeH4OWWJ+pFpXMvL1TSwft
 5NHl0lvqJ6yCXSEztWMX7Hc3WW54Ue5EJqNqzJ7UqyUBppZdIs5WtVVC4VakOsii/zGxJAftIKw
 7liWtj4VakmJpLzO0WjyAB0QRfmZ5oZJMgzq1kaaSf6evxIMS9Yp5kbgk4PMI0NkWCTgVS6uZf+
 xonYMn6E4NAZqJzMAXg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad0a90f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

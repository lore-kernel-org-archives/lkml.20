Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FAA40910F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338489; cv=none; b=Z2Y/ChBGNjLibJaDVeP1c6TM/3McOsIgDZPIa/2umTxGK5N70r2wRokVD6o96saPNoL8NAAnq4kqyl+go0MF4MX4zB+I7f9a/dO3kWc1RB69keabhch45oXHhyy/v1QIGfZPYnC1JlVlLH0k42/U2BGERZrLHAiIzkGQ0aLLu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338489; c=relaxed/simple;
	bh=N+lMSqrne8YcHlQdG7dHU4OhnhlOtuA99v4OizC6/1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcoVVUGBAzaYNTsaLbOgkKuLMhuwZdSS2Wdd2pu3or+2Z5adjdi4nBxD59BKsDwjOXTuDuthe8DWCwUb4ik9IbBgxUNkIVfN/xjGuwd2+eIKJfYWqvdCRQEhkaskhSlI/rMu5RO9/UyucQHsW6joKxHr+WtxhnxkzpE25jtUDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khH8loOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgkqRsPl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khH8loOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgkqRsPl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YqmT1056150
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzG6uuL68Zj8ROKNtvSAaqvO5/7l2+ckCdOn5Shxuuc=; b=khH8loOadnvvsfi2
	FtgV12L38IpsV6WZ2PYqQj2dlzO1c0W6P/CP0y1Ahdaj2Fx3J7j0KeAY76X/o+KB
	Cedaj/LihCHcugMEusgBYGq/q94XGynNUPx8RP0mpCGHee2hubmTzC6PeOn6DgsM
	7/0dFRNkr+mCnHgBtMa49OExPFOp3imWAdQrgxfVk0Mww3Tmy8PTETnF8lHRViki
	pXIszoU05W9H/2b+jq6IWZHTiQb+iKWd6S/Zw5lR8eI9m5kQjKO0uFJWe9pfY19C
	BgrNWwlmBzF15TmZFEUP4qRU9tOP1IIqS2pbLodcHJ2gXZIybtKZvHOw6TLYPekT
	w1N8Rw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7aax1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:14:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914324f9c0aso1824986d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338486; x=1790943286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzG6uuL68Zj8ROKNtvSAaqvO5/7l2+ckCdOn5Shxuuc=;
        b=PgkqRsPlPysKp917jN9qzEVlDfQa4Su07e+kycmWgLeg7twli/6Sa0gdKWMqD7PK1d
         deNeeiD2Tkvaiov+sRQ3OY9UcE/t4O20tGE/rHnGvfTCoFXz2Vc3OQ1tbHwX/3/Yt46p
         ZJ5Id0efKAx8JpDuoey7LugO3RQg9P3/3gBZZWtHgJJ0lTaG+xal6Dg6WRstvg5YLXiM
         7Yfy+qSDkTDV7lZ6Xv/y2koH23V27t5PxoNgfYlkwXLGBAa7THL83coOGZr1m3HKjU8m
         9GiP25fTQB1tV+xMwQtgQKdntXYdXETozeUv+kmKm6larlc4c781dPO1+gorc2TiS46S
         pCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338486; x=1790943286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzG6uuL68Zj8ROKNtvSAaqvO5/7l2+ckCdOn5Shxuuc=;
        b=uD3GEQmr9Fr9MHzKyiSdvamVh1/mWzSLdAdccw7toLhnIgXtn6fpjOzxvLz/60yDT8
         ICj22FoBPyAU14/Lty6su6MPBexvl9OAeFD1f02ls5CvV7mKfuPGmqYuOknF/940ptRP
         Cm27OkeIqpT3n+WU40V+dcVhTZDwis5a11gHrxYWuM4oBGEn/9ZMntOoqIrXL+FnUUil
         G+mppNzcjM53ipfGH4d/XscmcQ4CF6V66dGE+cEpmzxbwwFyoCN8r7h2xHeM1/DSr+Oi
         v/4ukFW7/o8AC9jK5W3LaPM3Ox9bFGmRXjmqMn3AfCBACqB06L5yRWr4bWrsOVEXP4lP
         LkFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiWR8R0AI3G4yVE3WZVC93lhdQhUq/3aLPq3V5lMYJIMW8AzakO5ovcNiiLRG7Gju4GkqT7p3BGyOurps=@vger.kernel.org
X-Gm-Message-State: AFuF++n1j19pusMDFmcnQYdF4vko5mrIn/5/UtXBHi03up5KCEF4Mqen
	rdPxRHVM1j3BRUOId5Zsq95j/0mSB51UbjVGfCiwKHktIE46EVROdEQyDEpAsmlHPkIOajEIK/w
	eEuZkzB9ALrVd59S6vWIVTe0204jZ96u4fVjFesk6nvNp6hsUgav5jelHPjRsqoI0mYw=
X-Gm-Gg: AYBFou1TrS1158ftCV80Xggcl/WTtbe06Jqy91le/OJkKl1LUy0GK9BmYLEeHN+O0C2
	759FpiWAz4hbjHLmdrazz7L4RLcmSIBhQ+4SWUw+NAw0gamJvpOS4BolX1gUPfpbauIelssDDcn
	IvjZvE0F2v7d8EZfwBnQFWLCTNW6FcWnwbr0sCLWaMucy0+jb3ac4My1FFoyJd47RKRv4nBZ/7c
	KsftQm84G/YdhyidoM4JW/uNnHJIZX6KIBs4bAX2UmDjRF+K0TcMW9FRBy1SC3vn0wfzXPzp9In
	5aDg/SGMRgSx0zN12bUc5xnJ0f9E6gsC2AChWBrGfiDdYFqL13G5lRknFucbUSUCUn9Jf6wwkOr
	EK5LFRQW8QtB2JIs3dg5r7g==
X-Received: by 2002:a05:6214:5408:b0:912:311:12b6 with SMTP id 6a1803df08f44-9142f8bf1eemr38107896d6.3.1790338486475;
        Fri, 25 Sep 2026 05:14:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5408:b0:912:311:12b6 with SMTP id 6a1803df08f44-9142f8bf1eemr38107296d6.3.1790338485959;
        Fri, 25 Sep 2026 05:14:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9b0asm957336a12.9.2026.09.25.05.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:14:45 -0700 (PDT)
Message-ID: <ba1c6614-5dac-410d-9889-9c6720ad1e0a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hs6AeicBiZ0zcFN1LIWF3HURE4s1RpPS
X-Proofpoint-ORIG-GUID: Hs6AeicBiZ0zcFN1LIWF3HURE4s1RpPS
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab665b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zdnQAcmOsowbSLqG7IQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX3/lsxu5Ll1r3
 pgLHzzfNiISX69YoftcC/oLLfbRNxi5DPb3wG/GP3ozK8CiWspjC2/p09S1IUSnz1moDoZXDZVf
 3czkc6QYs4LeTReod1pZWW2ADc3Q0ws4PeVQFC+1bForjTSXC1cjm2TRGqYU1pfJ7GvCWOrGJ9O
 C/07UUfR2E9nJ7TEtk0tS3GyrQblb+adplsiNlEug5cFrLiK13dQodzuMghb02IJoCes/7Vdh+c
 64SMIzsNWJ7zEra+ebr4wDd8ot5vMZUB2LaqvItcB2B1dxajwumvEwlyjjX1EK72Jy8pZ99OVYa
 92hzPsEV61Gk2P9EJerRhgbXPosM9akQBWheyFWNaZXDWrmYchkDaTrwQ/BL7k4nHtnVOqf7TZa
 InhcWAx7lMsK6oA4eA9YMmtc6eHgKZXn3zN9sVggoTayH+HN2H2bz7KC4dQsEqdSyta59MKr3S2
 mGr+vZ877GmWPAJ0ZUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfXwiAw6zFYPaQq
 1mlyGVTK39/p0Lxb9v8MQyFKRAoo4/cQtisjcT2cL+OmNZ4kA0z+FfY071Appm/sSsvaRRZUHDr
 VtNgVkMiYQ2jOqOwRDU+stj2Y1h7nks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250048

On 9/22/26 11:17 AM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

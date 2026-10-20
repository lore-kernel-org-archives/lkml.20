Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477937;
	b=Et5fSdmZLu+gOMnWjZ0Rt/L8QBaocTqlmeVDx+foqEM34ygvTFfAuf19tp6Z+wzF8Akc
	 k5iSVuDbaC6ynft4LqipG8xPlVDI0Ya9GOUB0bFc1tNaotaebq1fWuT5QqI1F1Cf09OqL
	 oCrHIaV8NlA7uLILDrltx3sD5/aPqCwQyLAnx0/beONH6Vt9Aq2rnKVFFmV7pqxtsFbRa
	 4F4uJ6HHWnm7FV1oK0IcGRU3TI/au/7jvkexaPdwCZ9SEe35OyhjQxYbe7/MKmRBe268x
	 ytTf1KYqEgmq2xvVMs1F8nAXFR3m50qnBCUksUg2X9X+v0GhRsj8b8HT+STNlWLBuwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
	b=PGJYrhdGeFRyAbjP9+c+O6bHGp/mfNkw94SCY2FNV0Dh6O4d0w4uPAW0G1B/mnCgQUjy
	 mSShMP4eRD7WMkUWzimzP+7tsznFQ7oDWwIXgNqTvGVnh+TqSoatZzxJthutp2IpCaYwL
	 NdLg7wC3ABLEJbt9tP1Cvl9CHOjCx/VE73pSe2HU3lnV4C57c831irp4/gtib92fbr46o
	 vNoYFzJdo8+5fElhcIKepIUHcOiYAkVM698s3UsIhMT3uRwIbKcwBStByDxNbCsEWKWA+
	 ogSszR8O0K5JbhQg7jAGBVEf2Na9jwzKA8/3316INMBWv42AFT0g1qLMbp1Q6wYSRpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C123606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C123606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tKOd4178122
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=; b=iAKdP7Q6l9EwQ+FD
	k1vMbc0KJs1sjjcBfe89BztPzmJH9eXvzHLjXTCa6yOTNp1/9lrM2dZWD23/NLTr
	7GAVfv0/rgOEB+x0LLpPCx/omrDuCsBC1i5KlhtnugDmOX+lEce/WFb/oFPugeos
	8QG3BMNPJl27ntPV9bHX0kBe/m11TXGWzfU4DbZpSFf500nDskx0SX44jzqEwBXE
	vxp5Xfz6lIQH7HYBSzWzDHYdhcBChKBCUcbz0D/B9W9lFLWaPd3EehHF1rL0Xnkr
	pXH2dqbvHJPkNTFShtvOPUigaPFpVVugDQ/STAdo5wb1yAQPvpSWceqQmR3Bn4pP
	2OKAmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n15f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53635fe2335so4358111cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477936; x=1793082736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=YjemuhTKYgxZyoW0gTQqAe5YWqmsDPEvVx24+nzApkPUwvbCI3af9SRbSIEYjcw7LR
         1cixsj0o1VsClq0KdzuciKwlZYMNJWLMEkbX68VpBK1SEHXNZZ4iTnBeOkPtZWLhEq3Q
         w59cuXPOKPCVvvwKDTeHBRP+uAQ1C0rPT+OemTwjCbZ0v5Q4dG2DO2Ls/tY4X6mIeiC1
         yH/dyLkETlRIYzV4L4PZ8yOLYzrEa6Sf1H49ACCXhoWzmH8TfPrmTJMOerSQiBIeSdq8
         m7FX2vO1LL5nQlsQwsW8dElRbO6HYR1QqoKCNd+bTXghBDKBQcBuwo65MQJ+2FL3lfge
         jPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477936; x=1793082736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=GSPbft5N/ASi7wYDpdZkG7BFEP8VKwh5/VAMdX07auzyiQeGN6PrukPmfJXmHCVfr2
         0h7C6w27jtYZt9DdSwG2DcmCJD3kizPxkjWOefFd+Tb5Gt0G/0FzTVMC87Pc/uOhYX5F
         HXdj71EgR3fsdxOZz6qbD82PXIH1u4ZqVk58FZm3e5Z5kucsYfRAqrOTJdp+/j+zwxSv
         w/2Ibg/2xe17JWIyq82vPwNQ1KL0ow9LtCTrG0zc6HaK9WK5MtuHooAlZVl7Wx3HBxdh
         TyHpeKu0OCcRGKX1jmp84VnP2ga9S1w9/9d5fjPT3G1Ba7kzBm4/8H2MJiPxWYFNYVeA
         X+/A==
X-Forwarded-Encrypted: i=1; AKwUvBwbFbSSRAI4SqMGQbNrJJx6LUximKVL3OIajJAeWyglHa7xv+cnP695Gz+znEPkfWDeRdhm1T9EkMtXcA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKCekszaUxcUvcmKNA2wdKo33X1Avu/TzeJAPZ3dBtnuDzFvWx
	e5OOFpZi69aZF7/tRLPXjo5INW6JCtL5Z1mUnIoI0KI8q40jgOrN3VVL06c2zP+iRExWuZOMbca
	wYgvxJeP/HE8Do7xGNXUG4NohaNlIDLzf9cBkYTNahh+jFoblDNODgh9lapWtP5SPmvg=
X-Gm-Gg: AYBFou3I7on3b8JUNp6O9H8/172vpZrnYk6PKh0W3k0AwRLKBb5FR2e5WrvQvhOh83s
	0Qga9YeP7hzi+dK5IBbCu/DEzETsl5gmEMxWiEcGNj3yB4hJr2vo++eKbEq//Mg9cpaOPo4Rjfl
	y3d/SzGeOUb7Uno1DZN/dyypotjzjnENiayddjRFyF6h0LcVzG1q12IbpCGHvUsb1rs4Q6cfXUN
	YpNpGP/9sar7GL14RrGb7YGSUi6vl9qeWftV+D5gyYbn/tsdiVBgN0si+l4wejnb+KCnSXWGA6q
	NcQNCb9CzN46+5IThgIP+V37u/V/gHcnUqrZW2WUh7Ri2ZplZTL7m2uevHEsWXNyzadm+jA/pXr
	OTPMwyd7+YL4+63V7B/rFqg==
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775571cf.1.1792477935613;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775201cf.1.1792477935127;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm446762566b.42.2026.10.19.23.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:32:14 -0700 (PDT)
Message-ID: <d01450d9-94ad-441e-855f-540f45aefc82@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:32:10 +0200
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
Subject: Re: [PATCH 03/10] clk: qcom: gpucc-msm8998: set the droop detector
 bit in the right register
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
 <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iTgUQmFD0HIbUD91SYgEXPBHslnOSeNx
X-Proofpoint-ORIG-GUID: iTgUQmFD0HIbUD91SYgEXPBHslnOSeNx
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad70af0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d4jy3kBXdueBcoqUgmMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX99OO31qZa4Ch
 GIMbgTIqd541zeKiWCyKL/8uwH6Ykwz5/Mai2dkXRNoyT0YdSeB9r+dly08Y/83HVFUEQiH7qzT
 jt2Z2KMJGrdgNtbwNUN8PQMCMR9KEEPYc6xzvwsMsbVmbtHZ7CdXfvSrx7kLyZOUKlX5+qgR+wh
 KWO7BpUK2xy7ayRhVoloukLK3PXi5Y3JjwKntX+VnMeMqlNAdQEVtELGCbOSUgdT2luTsds3CPM
 o1S3ZFU+J1Hk3DHfbuMLrtG0CsfCR2mk640cye00CLtBX4HKEDW7KQzhbHTP2e41pS01qqlMhUY
 jhE8PWF/eHeHTc5oRwDAf7/9L8+p+IEnrFL7NIIV7h+efGCxsgMAJ90et38BE7uX6P5RyBtxAWB
 pBR7f3f6prd8Uz6HK8QnG+LBd4L5QxDr3/OWg8bUALN0kv7WDXJGrWe79fajI+hhrv1fdsiZh4A
 J4wn9G6q3rlWOpLrtZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX2ZIBl8GJA0ac
 1sF4Z+mXkVvnQxPwcVDnBUipFZx1+hgC2PwU6Z7jUXC0/cF93dKByqbRAKk/du3INd3nMVj5yDT
 2Oa8lab5BndQRGidCPuO6hDS9UGfoFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The probe means to power down the GPU droop detector to cut the leakage
> between the graphics and CX rails, but it sets bit 0 of the GFX3D branch
> register instead of GPUCC_GPU_DD_WRAP_CTRL. That force-enables the GFX3D
> clock and leaves the droop detector alone.
> 
> Write the bit to GPUCC_GPU_DD_WRAP_CTRL, as the vendor driver does.
> 
> Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-msm8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> index 066793e47f79..8da10027f1f2 100644
> --- a/drivers/clk/qcom/gpucc-msm8998.c
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> @@ -330,7 +330,7 @@ static int gpucc_msm8998_probe(struct platform_device *pdev)
>  	/* force periph logic on to avoid perf counter corruption */
>  	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
>  	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> -	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> +	regmap_write_bits(regmap, 0x430, BIT(0), BIT(0));

regmap_set_bits(), would also be nice if this was moved to the new
driver_data. with or without that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

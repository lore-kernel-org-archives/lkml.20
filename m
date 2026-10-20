Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477822;
	b=HUMmBp5jOuOn/X/zR3FI2T6hXlYYgJJB+lephctOtiFguhR/4MlGngYIKkwgwUzyfddi
	 mP5CyaXHfF3ltLUnXh+8qjuz+5ETQ+4lRFPed8rt77dYdK7xyfa+2oKymef5J3/Bqyidh
	 eGGQYbMDL0rXRixQTtkBTt+3EVeCV9SaNXWmT3oWv6GQqi2FZSn8VPhTQHkEYWByK/URd
	 RVPGMkOCqaZnicW8TE3Z8Z1/f5xuc44mSRYx7WvB9s67+id9bsig59z9pGbIZaN0cAyQn
	 FwHets9MO/K07OJHqaXsOCNQw3BRKkKsIFk3IbTEo7Lx2qnmxuwIOg8RsUW4bNXBemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
	b=R3XnTSefs9Hk/9zFZifcpuYrSyltrUzlMMe0Hg3JnqDJfQYi4ftskhfCBi52KunAU3IR
	 h/71NN8jcNNtE2rtf43sQJIZtbq82s4k6J3tilb/i+RAr9LKFvIp2Bl/yp13yUrpgQbkV
	 69+cS1FTOZE9O5mcwuHSI1R6dqKUGzLQoLGjxVvomYAJsGmKRjU5gxox9fy946SBCW7Rs
	 4rayohJoBDyUqI5D+/AM2//pmf1iDL0I98eDjWE05emEIpO0WtqHBni5Yf39Ol+9MtPhO
	 PlHDdg9tmNF4xF8ckrF5cMTGYBa9FvtLTv3g1H6Ae2FVXjEgXs+gq0ql16zWSrNM96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmmpDTzX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OrpnJa/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E6606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmmpDTzX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OrpnJa/1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tCeL3485875
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=; b=BmmpDTzXNc+YX4st
	bfe/NK2/6gFZ4vdG1tyysppxiH7aai6xMjWcsJrYj7qGW3tmsHtp4wC7y2cg7EfT
	i90zz/I9Oj1mq5SA3QsTBGdRMutye2yOnUXVBNWpqr/X7QujmY1+hygCKkVS6nPs
	1aqRNYQwXNVM5Psv2l/yDvpqBw52Ucr74WakHHhfxfLfMiCMTfzRYFd7Qs8SANQy
	8pC5f+COiz5ScmO/Lo3xQqo8NPIKLfX3F0v8Xf2nLNOSTKrQy6MdwhdVurjWafTo
	JM3UTDMxJED4vimMW1OOJm4nL9LUiKbvau3ddjQJfuWmWLhKj9HyjsULIalrPcv3
	F/htkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n15y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:30:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso94099585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477820; x=1793082620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
        b=OrpnJa/1RfQTQWtVKVd+9K+TeDF77K3v5UngTSzUdHZLCn45jbYaFRDRxQZq9y9yQG
         zubdwksfx+KwJmrg/EbXJnv9W/OZ5dLTfZomfyc+ldWt/W0BATsFFACgYQKNcUex1+EM
         rgyysjmXU/+pF1ZxQdE9J0DaSgFsO2uA+Tg/43Wp3VVbU+MYTth2doQyhd0EpBmMIWok
         xw1VVAqPAoOdt5Pmw2SxC8tVWTptE5BMVLGE3+ThjrmRV1hU58FukMQfq2tB9J37uk2g
         q/W0ivLz1XWPC3mSZbUctf242nQLaTpdogHf6CXxnLIhREMiBOL9MRXIQqg+m1nRQgXn
         aRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477820; x=1793082620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
        b=QplVRem+/iZ78MHYSynpI1NxETQdQ1j2EC2vf5pjBpQuyKRYdTK6Bg/3WT8Cn5QVpe
         AcLUpwtodn/2JRu490IJ6ijCjl9l+iYgLHq/VbB2BXi4yBXp+nnNB6sGBgm2vNz6Nwy3
         9Gm1/4Ltk/8vfxgJRQ0GOb7hFZShOu/stJWmmQlTdKsWu42bqaUj60aX58Ynvtt5rU1z
         92MsyJsBFdhrTbXa5S04aeIkIaXk56VFDuLBviiPZ20QjuYe5/woTa0N7GnfIdwMD1lx
         m6eXCX4xGVqMUIc1jZ/5e/xrekl5jbRAqVQi/u3SxzJJ7gZVK1KhISAIr+hL1AnD4wAf
         AlbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1vKFhd9aRsl9jxGz9NfY1Wq0Hz+tDgHC+ELy4tojbGO6zI+auPdGjBbrB8MEZPREIqPKiqS5J2tGSr1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqYZ3Dejd1FDN3gzgql9xneH0FDF9cBq8tKKOPBSH0IzRuNh1X
	ntbfE0X8aRs9pxhwri1JqrO15jwf4FqR/1JA/mESw54Ge17hAh7y/FvG7cT+Adukfyf0QFFLGNV
	hx19j9IRsHCo8jSxgxzufhFYnv5oV8B3hrpzGaYfH8MN94OFAFG/W9ExSjN8rVcH6yEQ=
X-Gm-Gg: AYBFou3b3diD0UEsseweptByWBLgG0r8qgpCOz4WlIXp5/N3KHRJwALU/11W3POS5z6
	2wVJ06mhMNsFoCK+M3zPOprIjrHTm27tJqDZgvxqeFDptioqMl76nFkFuYrOMWozj52LOELd39K
	QteXn6YABQP96uDD2S/2y00aHZJ6akpSoTvFEajfAiFRTMFblsANwhv9BJsOEyci7ynHwIiPnmZ
	cFlLgf/jsHj2iSdUybx5EMMnQPEeNrSlO3kLhkPlkUJhD+wyrgpbIW5ULB+2EZySm3ZFDTgtZgu
	8Pm5w0AbCmIc+4jT5JHrOcM37zAMurjVGjcWjRmmluGzplaMUUVtOgYO+eo/9efKzyTj4tDoe86
	eo7/b0RRCQxdoYktMlB8wqQ==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1908558185a.6.1792477820450;
        Mon, 19 Oct 2026 23:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1908553885a.6.1792477819882;
        Mon, 19 Oct 2026 23:30:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm458746566b.18.2026.10.19.23.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:30:18 -0700 (PDT)
Message-ID: <ffdcdf4f-2c96-4c8c-97e2-808f94b59aa4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:30:15 +0200
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
Subject: Re: [PATCH 01/10] clk: qcom: gcc-msm8998: leave the GPU BIMC source
 and SNOC DVM clocks on
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
 <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad70a7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uh-2cw-LvnS1HXWvbVoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX3chYK7NjsxOZ
 XqDP5Kxxw6zARRL+ADAeztUFaB6W7wiUHm6PPRxF2BEQaHjiT0RuGEyeVHG93YFNCTq/ltLj/j7
 SCTAQAUHqEZ4B4D+2zIQpUZ8iLshWFM=
X-Proofpoint-GUID: gIuqxvXEtH7keXKXQIWF_jT7nRBudZRN
X-Proofpoint-ORIG-GUID: gIuqxvXEtH7keXKXQIWF_jT7nRBudZRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX85/oLEPD/GAQ
 HCEyb6/VOt5i50qwE11GH/NyPlFGRO4ell6qVJjYZJuUmfEo1kpg5Hu5uXGJA8rSmNYF4NmTDnF
 kLz/KwNpVV7AtRMSbn5E7D3l2gFyoEJWDlvHfsMrPuHt5bZ7ac22o72PW7fz4fzs0CIQ6+wh9df
 Ke4I5LwqAOqq8y4y7CWIl19Pud5omUgBIMSjEkouGtihck44CJej1YTgA4fOkmZz506w+OLQrUS
 +hgkjFfOl8LzMwACwsg0iqdzJkxM3I0113BfeMvWbGxm05R8rcDNVP/T1THYTfn/qYj2L3r/Fox
 a9mu6q1HIkBpn0l8BYJisuYqxbS74yoQy0Ak9aSmYwj4j3M1MK1MFn4cvtnSIzqm9ruhJe9f+l0
 T7rJdfZ6pfzCsg7JZ0BteknrDpPqyYPAkXp//EjrxwBwI1ta3kDMFkHV2w/9TygFC2WRjH0xWXR
 bTqqfwbWcV8cc64EHrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused resets the SoC shortly after
> the unused clocks are turned off. Nothing references
> gcc_gpu_bimc_gfx_src_clk, so it gets gated, and the SoC goes down
> within a fraction of a second, with the GPU idle and with or without
> Venus. Listing it as a GPU SMMU clock does not help: the SoC then
> resets after the SMMU first runtime-suspends.
> 
> Downstream registered this clock and gcc_gpu_snoc_dvm_gfx_clk at
> first, then dropped both because they need to be left at their default
> ON state ("clk: msm: clock: Remove controlling some graphics clocks in
> Linux"). SDM660 got the same treatment, and the upstream SDM660 driver
> never registered them.
> 
> Do the same: stop registering both clocks and enable them at probe.

FWIW downstream just leaves them at reset state so it's not exactly
the same but writing shouldn't hurt either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

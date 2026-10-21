Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572014;
	b=EX8IDWWvQnHfxVnOE7R3Eub6e1EG68tqiBvbpChIasIKH290rl/ZfNGeG3ueHK29dq7l
	 avZam5I5PzyqX2p14KjrxPogZmwV4cz1Qhd/U8P3Cskzj4UETZe0eV7iY1cEdwIX5lH74
	 o6h6waElyIQGH9lcUOkGTvO8w3re8xSYExPEEjRY7FIxznGahGt5oQzEnlYHx9KWvrMWO
	 gyAXWoI0YghKgzmehOyV/VCUkUhyqeS56khNGMQAnak0FYjpf2v04xLY7qhSMIFD2VEIY
	 UKtJXNYseRAWHaHTPlyHcOtx3XR643uXw5cXf547+/1ToG/z7BBYmuV1Eav+crvz4aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
	b=qFmYipfZkXUYIeNYmP+q12Y/9/BxIpQFHAkZke00xnaNZd8FQXPdu6Qdsavbgk5MMCDc
	 GcmLFpzR/2pgBGtEvZ6CYOAc++59WBRds3ZyJpFRS2gKHxAmg8uDQjm1rJ2juu0T+peol
	 /rFCfvvZuIHy9UGaO2fw0zBNrUhIgv+wU3SUHiBR6TnGdZYpW4hvkiKNobgLPjWlGwlSV
	 Wk3hcglroL7tsuJCTASOuU0kFKhdzJCfY5gXO5uYtsCFPU4RreO7DoukI0IzZtQ4X3SFj
	 p/t2hS0Hb0gh/w7XNgjVB9c5jdHq5Dd32KJDNMUNqvFrUA0nXeEA87TZneQzmOY5kAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RT3DAxHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BX7/cPsp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB160A5BC8
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFB160A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RT3DAxHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX7/cPsp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jaAk3573438
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/bsu92Px2Xzs3mzwAmuQ4TO9
	HLtINGRv6UJpIugcPNo=; b=RT3DAxHsBuN15IMm0uOKOO6VloQUq5kLeZzhVcfV
	N6PTAxKu0uwP2EnKT/eb8iP19wxCD/ie69QtegI3Cu5wmKqxP2p2m6gx9fMERCwX
	I+QZFCsaN+U9bfJG7j046x2ro3ZDTE+hlz1rgVK0qA8MrvkqTDFDezV+QyR0IHoE
	p6VdGdRWWFbtHDTbCUHmeFIZlDQeRuuXtV+TIzv4vItdYGGLBZjvq/yvj7Bd9o6G
	KxKXUSI9Sg4HLCeosyKAHy7yIPTd1A2k7MpArJX2zUPFF4Nz/NtoPZHH/v9o/0Ex
	rsK3GAonS5zSQU7FWXqp+cboZHetaxuxQqHGES3Xzq1BwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htxrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so2020699eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572011; x=1793176811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
        b=BX7/cPsp6cjMuIqkRn5wHuROkTbTjD/z0i2jUH+Jt8aqEvBcK62tXb8UGaj3c5DjoI
         ewjnAeWprpvUMWeFpjuYDcLryDkyCyf2CgoPbwVg+hMxLWkEhd4ZEf6wkG17RifHFmhJ
         KClfiv4b9qVtD7lz++hxeziYFmJYOM72PXVnAHbDKRv1mLeRGM6K04tjkYNjo9yzEZrk
         2B1lX0uyEdpMwbCLFVyNuiasMn50Ri1qGSlhRwsiCRO0L7RighnWmSlOkMeLbeU1csz2
         7SKw07sCRPVIPz4vc3ctotoPxR7SvvukQRdO90KSKR9sIJgJecS8G5k3DbZtzfKLrpK6
         jM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572011; x=1793176811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
        b=X38oVcUFv92R59QBt5yxPq+G/MhP+Bkf78gqwDKZvduNiPDYfJGksigUSuecPgWr10
         MMrzpkFvB4VFvxTecMWexHjjOxyhfN4xAFZaPiS0DGzhXfcXPiwxPM18bKoYVNY/Vl8w
         MhuGVXknFL6UXW8kIx7wupaLl9SMW2q9xtnnPwjPGpNrXjZH/W1PiRIOOjDZpzYejuzz
         eec6/EF/IJyePCWOyQmDwzxNmra20g3KE4JMxUUAGcETKSMGz6qS6mtzPt7qzMaDL3VN
         lUsN0J0Mly+0hoAoKlhiy8f9EX+t4b6jTNU4unhAecvbKaRbtSrvvfkW7nr0V73UHbsE
         M6nw==
X-Forwarded-Encrypted: i=1; AKwUvBxjMCdMHRm3FEfX7xiUKedWAx1s+FWK/LgHnPuC5rWzfEOXE7MGixP0xJPkXVrD2Djq9CvaMC5cQAY5Xjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4G3E/g4h40OtPQbFV5N9GtruSs3upXlyyI2Cl79ibAM5fiF4G
	F3VQkKqEbLhxv+ZKGk9wrs0CyCqg8De9Dqp9rf7CYzLwq1pRLQLRx18I7o1XB2PS1BqNKyprQSo
	pE0yivOICQgOXqU0tHABVjbfQ6AS7lTM8okeqFPkerVf8pg74tOiwNdq1Fetq7ah/cs4=
X-Gm-Gg: AYBFou0+CJEWzjVh+w4CGJPBWi/yd6lLZd3HI8yiFzfLGTQLAnCa3Jxha8xzztI0Pr6
	IuOzfwYmEHlGTPB+vvCpULlOZwIYAi+/X0OKI9y1mFJXZ3kA0WJu/M+4POg1tWvt7xCxcy8L+Kh
	yWMiwb5JSvXHxrgKDMrQ0EDBFZR0EBTR6A6stTdtPPe9jfpQ4gwe4Cz67JUDt4bENpE/Gl3aXCI
	UI+LdgH59ayu2BoMJ/eLUlJMogFhD/RCiWJQMEmZYx5KTh3Hf8gJrHAhxo0ITtj/x7rjpaj//9s
	MzW6BmHt4TjqRGilRaBYHygHyHd24e9hdG4LMCo866nJcPWL/SpTtwzQqiTy3s8q6p7R/0fjhqk
	hlL5WB3o+nAILfvliNqEdh1QmZMS7B0+wnL4WbOxfek4mqjFipRHvI1VJa5pwHtljQErYbRlghY
	SuVwp69Jjb2XyoilkXmgYgyGI/lg2m
X-Received: by 2002:a05:7022:ec07:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-18dc065e242mr6244528c88.20.1792572011204;
        Wed, 21 Oct 2026 01:40:11 -0700 (PDT)
X-Received: by 2002:a05:7022:ec07:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-18dc065e242mr6244485c88.20.1792572010671;
        Wed, 21 Oct 2026 01:40:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198e2d6sm4749009eec.22.2026.10.21.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:10:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <ath6Yrtq4HSGU5R6@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
 <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
 <ecc66886-1989-4e61-86e7-fba6555c870a@kernel.org>
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
In-Reply-To: <ecc66886-1989-4e61-86e7-fba6555c870a@kernel.org>
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad87a6c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g1hkF5I6mjiIX44rm_4A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX2ABuI8XK0CJP
 IlkSTnoG2RtaBMT1zsAqTga+PRYJbcoDd7a15VRXeAHC9yeLl9P+A8IYqDqIEo7ij+ll7tTU+EK
 ib5y7q2f5CCWDLljWbwBzeBkCnPTCfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX5a8MueXpRwtf
 AvLyihHnbFk3oI3HtuXAteWWU2g8uB/qou3eFsja1BzULW/MAX7GN/KwYBC7LQ4nrDMDG3jBJx6
 p+4JjSgqbMrVr4xqGjAqtFQZa6uJihOx65tgfUUMIrZU0FGHx+siedH0Sdpo/Dw/pgoNii461m5
 dq39RmhHA1HosQcJp39RS4BqaLeU4Fvae082wK90I1ofOBMXY9gId5ap+odGNY+O1x11XTzAdhF
 iogV/Pq6x2V0CR3oSvaIlVpzgzwRcC5mLdzneq1qJoM8Vc9ioNwITCBs4BdxETEkjr9GomkSMj/
 cbjPXWIoP+NCqw3po8Rcd5RklmojvNM0XbC67wwVHHxYqP6UCHVLdInqeX/vpWq9iEPhNV7xm9e
 VDPcZPwfaEFnOkx7wxEmVWLbiGX+xKZT+Df9w8XLUQ5F92Om1X1ZghBav5E63Bzi64F72gAFIlV
 wwf7ujWPVLu7LpRZm9w==
X-Proofpoint-GUID: 5hDdolg5ceiHcJEpJpnTzVGjkLssAQwu
X-Proofpoint-ORIG-GUID: 5hDdolg5ceiHcJEpJpnTzVGjkLssAQwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On Wed, Oct 21, 2026 at 08:17:36AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 07:38, Varadarajan Narayanan wrote:
> > On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> >>> The OPP table node-name pattern also matches peripheral OPP tables on
> >>> supported SoCs. However, it only handles Qualcomm CPU and level OPP
> >>> compatibles, causing unevaluatedProperties errors for generic
> >>> operating-points-v2 tables.
> >>
> >> But the select should not select them. How can I reproduce the issue?
> >
> > Sorry for the delay, it was a long weekend here.
> >
> > With the attached patch, I get the following error.
> >
> Does not apply,

Sorry. Have rebased to next-20261020 and attached, please see.

> but exactly that sort of opp-table is already all over the tree. Just
> check yourself.

From what I see, SoCs that don't use operating-points-v2-kryo-cpu for the
CPU's opp table don't face an issue. Since ipq5210's CPU opp table's
compatible is operating-points-v2-kryo-cpu, it is facing this unevaluated
properties error.

The qcom-cpufreq-nvmem.yaml change is approved in [1]. And the change to
ipq5210.dtsi is to address the feedback in [2].

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260703-lively-intelligent-raptor-5edfbf@quoll/
2 - https://lore.kernel.org/linux-arm-msm/06e6868a-c106-40b1-85fb-5ebbc01eff16@oss.qualcomm.com/

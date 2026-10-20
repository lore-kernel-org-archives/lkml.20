Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497112;
	b=3v24bk1YX86LRwsKsHhjbYROTRDAy1fJidLp309qI3z3BDY2Omdodh2idX1AbqDA0xI7
	 wTaxf+ufe8psHxPUuDkG++Nd0BruV3SFN2ZKXk9V2LAy7+A3V6idaZkN/VqGEy39lxvOo
	 nxcA3cTVZeHiB6OADA3beSwL8u88q38Vu5LoaVQj7uwtv1Tnk1IGr/RZ7azabhOorPSx3
	 z8EBqaL6VaEHGRYbB/iv43TfWi2dRLR/5Bb00Y9fQk4Wvrt6JAg3R0YuAJPiybblj/nph
	 eITj0frWhFmMp/tIByMy7dRK4UQuG/hO4eE5c9FJ2o7n78MJ3bIFI/ofFFOERnTQlRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
	b=JxF9NaMNwVphf0nWcPSs6k88jfgoMrSYDvqpzpc+HNP+D/BxGGx5Z5v2SQzJLAMsA9bj
	 hhm/Ijx68y/XUMQ3h1DXBh922kM95CGW/U/mJMpSluraJOsaDi+3Y3NCJCuqDSbwOh24x
	 Hc2xo01QJREPdvSzwxSvKO9HbIlnCUCosleDbNo4pRh1FgGKkZ/Gor4xEwihWubCFBttG
	 9GpsPOUy36olhTTx7Ra4Sg/CQbyTbgtnsRlZtHJHd37VeOinOh2rn1BOJceS3PDhT8804
	 Ji2vEFLwfCI4/nQHGBEeWZjxui9Ov7fxAJOUxVD6mF6/aEIM7YK/40gGtXrQlFwVrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXBI4RDV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1CfymQj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91380606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91380606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXBI4RDV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1CfymQj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx6Zb2013803
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=; b=OXBI4RDVrMIHXvsv
	UER2PYbOqCXNRRkkNoJEkFVWQp/oA+UcFK0H4qVFv22FG7ECbZKiJGWibfdRUh8f
	vh0v6TBM8sic6kqWNiWTtJ3mp6SSEb8a/jTKwc+uuZHeET/y7sFSFJ3FCfzNMJJ/
	wjyGdtsUCDmmO2Qp+070aCX52rWdPa9S0K9nVBo0xHZhzHUyJDGC1V0WyO08W2gq
	VXAwKR4pY5G05lporJzV5KHVAA/imLqO4V88he+vdzByvnXVHZiIHY/1f7Yl69F5
	CzM5RTCv+Rg/G2v49UZgQtECaewTgLv9t6M3y+7UTeW2PbfICFEDXZlD+AO0tykS
	FydWHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjaw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:51:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so63893285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497110; x=1793101910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
        b=j1CfymQjJMTU2zsjSk2+ozhq9e16+313e5JQHYpV1iEfMMW0FMeB+ItuexTIxkYuiF
         thwwBlnIsF5Pf0ZDvDZ3H8m5feW+lg0xiu8ZQRTrCL3xkT6Rdh0VCBa+xCZV65PALDVz
         bqTJ5XJb+s0i3ELmGE+FHRILBDa3h8AeRi6+8eaKEMZwOoxHb4xyxLf5nybnXn5pJEWR
         afX2akrNtTesYUjmOX0Obf9DXl1jpxR21V0CB9evWLt5qMsSalj+7qMOnWmonYfoAAYj
         h+lEuCOnS1Bnuqc138KUjDq9dP8sGueUmfj4W1/tSt0rHECg8vVpdUnRj3TWoMhWlv5c
         Jpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497110; x=1793101910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
        b=fJVYwGx3zifP9DrZguTxHtSjUGIUjhp5KeoCVkzNB772DobCK8LwrxDObeDt25FAhY
         qNohBwqyew7bqiio8DMY7q4uxds+bGRWWcjo/EnBaOk2ISeZ3L4aCQDIvMlQOPK6TSAK
         TfIvplxkGrfPzurcqUfrAAjYzjprLj47pFUs7G1hjkvNNGJsOgMp+hKYzeNeQ8ON/Gdt
         uCXow5ZZJQlzQ9JwL8zkENZAIh7wRRx8YGvunH7Z7UbX4Y82PiSmQNJHLVbxRTUppcNZ
         nvqbp8seE44B6XLcC5q86edaar+arcCuC6NJ4kEFiLG6QLxiQRzHPe/DUiycKGmrDRGf
         jakw==
X-Forwarded-Encrypted: i=1; AKwUvBzXxkwEwBSZ1WyxGQevkVaJsTDJqQLd+EMInQBCleJeyQodGUEWYxHvU0BLb9uxuMqbPL3CEY7F25WIurA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsIuk+9gs0XuNAg61qIbv2Wx3SKslp2VmL17ElGeH3ZI5Vg6jv
	VBPQ5MH8+lkmgftuq0/GRWYYwXrPrdxZ9twGOP98nVzcAAKW0hGYy67YO3FqfazoMEb55+kh6h+
	H5TLqKeBBWf8db02It/ZyIdNFg6MWrRItBUnfhumVuO6VaQniLoJiyMiBZVbR0ISLW/E=
X-Gm-Gg: AYBFou04vRy6XwQt/9v+K9B2hsKeovs0l7uNF9Ri5G7+ViSlFtpRutTMjqD84W0bMKW
	jktz1QRnp/NyGNy14zHDdGPKEGIVW/0TLco0UWZ1eKw4V8x1j9OvXtYR8OE1sMItloS+JMsTUgU
	GKgGV0xax+O6hxD4HXrOtlV2ezFSd73fVr8debyMudjlmjlnigzdUkJpf2FxVtSyFNAiEE5jhgG
	hQ/0GzHWFAT25RYU8ib4T7ZFZauigJvIcs/f+oujcCqCbOo8kmhCUm88RDONr0ygkE5X4n1v84Y
	9EIbvDCw6VxmqO/5gM2Owyirm/tOTgOmVnT32wzmffO3j+xUlAWdwqGHbD+Lwt3FEQjxg/uHNzo
	m6CxVcHv3e6PVoDDrAGfgtA==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1863474185a.0.1792497109895;
        Tue, 20 Oct 2026 04:51:49 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1863468685a.0.1792497109274;
        Tue, 20 Oct 2026 04:51:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm5439285a12.31.2026.10.20.04.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:51:47 -0700 (PDT)
Message-ID: <0ae678fe-716a-4d1b-9809-f106f9fe6199@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:51:43 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad755d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X5NsFxh-qW33anU7_OQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FTeXUlJBefBdgdNUUTtuToPpuqCA3HBa
X-Proofpoint-GUID: FTeXUlJBefBdgdNUUTtuToPpuqCA3HBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX/2Bt0TB2o6uy
 NZSwNi1YMbF2d4LmSYNM7MyEf9whzRZmV0+PQj4XyY3SO4b3c3Hn9KtxXh5m1NnC6Je56hMPMmw
 p1avsiArdH3eKtbXp/aVs2/j26gjyd62zqVmmfd3Re6b2g9XqO+SoHT1uwe9i85qOK3S3/AV+Ms
 yBY3THYsYo4rgVwoKRVmbjMQhdeeRCumXsBeRQMYKa9D+ffNOn+cbwRtzd2p66zSsqjkfipQhD6
 efcaxvlGx6qlOFrafdMX0dSXDv/EoC6+6cUfEc8+IBqWfNKOcg855aeQCmMNZN9BXQZ77OHPzdu
 RAvOsdEVYI6tBcyxEYNYb9Lu9v4Zhfbj4hZuh2NIl13W8sY8qNgnB9dxIBKbFHYOyO/lLGQ7lng
 bmjBP8oAADJBxaTdtXSTDFUxEZG5ne2LADSVQTmpuLayHioVbhdvuLsArws4f0uNF83mzL3MS01
 dPEedCiXxrbUJ4bh2zQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX8SzQDBsK7qRT
 ikP5afQpayxP3g68k6JTObN4GCS0CBoi7ydWmDcCuTSl8YLy3HL1QWSeHFvC/ldXkpGYguddlG1
 KQ+7um1FQc/4XrwUyw8fCAGq/NEs3Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/1/26 3:49 PM, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad> 
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20260924-shikra-gpio-expander-25ff4a29c848
> 
> Best regards,

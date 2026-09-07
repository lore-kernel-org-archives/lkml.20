Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F354466B1B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777748; cv=none; b=LLm9KVptgLi/NgNFhwfVWab6u187HoGMDNFwig5MorkkD01eej+98Uuma7Tsv4v5bcBCrJTZCG9zbI+CQHtPad5kX3qAVB29yo3Zxqe/4NKY03K0rqw4iuAMNuixzBPD5Gz2nbGS3G2rk3L963k/2UbPxb1Vg0mtovk4oUZIh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777748; c=relaxed/simple;
	bh=ozR+N+I1Bjiuz4/cQVCEFoCWZJrPMxo1R/fIuMpKg8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOKA+AJH27R3oEfOTH5u+7oStmD1CKV1EeXCW8SSB9kdQLip9uamW8phizDzQblC8rAMZ8lxdTBmP5xQtwhPH/ZLB2nxxs8UGNz2aUxdykR0RWfU3H8lTCAoGIfy4XQIJ54ab2xSPW7PXqdKUw/0bdHPNK0QR5BW9Om9sJYj/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFoXXChX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za1+GuET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFoXXChX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za1+GuET"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bWhu3713211
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=; b=OFoXXChXRPt+8y1t
	rCu9cL1pFGKGkTKvKxdZBRV246LUlczAHolkAGwlz1CLhkvfmPJBwd7cKR8xCal1
	tyQaGXQ3sJBf2SQLq/nHMv51KLJxDmpBvRyqKp03MyCQ82PCVb8UguX2V+r/iIwU
	uT1H2WjsrGqudOP9JCXb4sZg0xSJtyTK60AAmkTD4brzfbiCwxL06IQg5OO/aLtm
	Dd/Qrqbwymo22eh/Z20F6GNI6hK6KlOHYyQKZPVxnff8xP5dqXVrT2YnQaD6KUf7
	8DPCVZHqJeHXccoKfoYJhTjdSWHOCvt0Fi/dWKOnALyESzp+pqKKLq1DYCCa14Tw
	PjMpGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1mn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:42:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so5443474a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777742; x=1789382542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=;
        b=Za1+GuET/7w169YgFjs85iDogrw/DCRC4s5K/pRg5Fq7bVpTwpriJxIIajRQrPaAmb
         YhmRZbC+sPAnv6qo9GtQbURfmlz3ZaDRkMHjyB9RR7TUTaYkWZAh9f6q0nftL+AVZh5D
         apEVA/D/fsuaewXDFFNIFO9nDzr3xzbwyOF2vgkOc/SlxLjDhTN4DcjVks6LHzygygLb
         3oGXXqyBw6glBDdO21XQXkVmpKg35xb6wcLf2AkOoNYe/M5++cBRLE0XLjo+0pT68pAO
         n/+a3aRTk/TQSiEoExBoiIg/gmITr5wmli/k/oZPgB4yhgItGd2folLn72S6sODy2sOh
         zHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777742; x=1789382542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpyEpJBVtSyYB59cPODVufFyZlVpTWQhTeLIXPfAKSE=;
        b=SYE3NqOAdXKyccCYTwtarGKz0ypjw35UYOEs8D9ZpHUEEgoq4T3sGG2DeR/utouZeP
         oWfJAXy5TqsSP0sg1qPDEuKEksCVjaDnobxmf+MjzTtadiVyINoSODV7ZNqsReaNn1RY
         QlwmQyNw+wXCe8vYA9cK/jZ+gZ5HIXpE9dEUh0BWf7aj865LV/qcbqs2iFyENRR2+Il8
         6K2+qQjymUmXNvcjLEmwpX0T+79jcnDXYzw/ENCTtrf4mLdBGvZRDhAkqSIbT2wKN8RL
         VYxiZPW1cArgw56IEftEGztVCn1qwAH8GJE5KfTyNm7thlU2LpKjY/nVSUzwTTpSAF85
         rFEg==
X-Forwarded-Encrypted: i=1; AKwUvBzRa6tSeb3rA7kQlvjhyC9E1XAWy6XEOB7tv6P2rsbCZH3Sw6t2CE1PNBo/CgAqT3aQfVamNyEa3JDkgEA=@vger.kernel.org
X-Gm-Message-State: AFuF++nzDbeD0TWH0rJgTh+29e/E/RtB2tg7dLMOnQ+pILo7PabfA5t1
	3apXTmrbLck0+XfAmvDwBEqlRpEmF5UPJAw0qtoYYE7y97s8pI0mJ8vI+ile2+HffA7g23LjIFp
	wikl8tK2UQ95O4XXytSU3wIbYBCHBUB51e1ZeQnXi6lrJuvGDpLCAiQGWG0WBZW5NTeQ=
X-Gm-Gg: AYBFou0Ro1JEBK6SXHh6VEF1B4gBOymZ5iLM//FAKX2xSf5kJioukapoFL4NgqmMeEL
	4WxQvFGuNh3XAzkFiq/XV1WAvO0uyuW5OlYpsyZ4+EdeTK7yTfUh3bH4ioxdOcod9vtZ8hkPbIi
	WyxffmNaIwQGQLTbPdJWjFI+FHlI4g2CTFQcCpJcZ0otrV0/an5SqctRVZOJk7afgnB0Iq4CTE7
	hVxlGgOWTq8PdgdAxXOdvFEnrCROKcDHx4pCKowIVwnQ9zUQVD2KpeRCUIfFvX8buHDROOA5rBV
	I9fGpOgFEmHrc4g0d/FDnCjVa0j20QZZxOtalDa+c4VnZ5CC4ShnaSOFzz2BCdU1dXa9vt2L3oa
	aiV8i0BcdkFYYFsxj1YvPvoDP9k0V
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr31098722a91.13.1788777741846;
        Mon, 07 Sep 2026 03:42:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr31098665a91.13.1788777741381;
        Mon, 07 Sep 2026 03:42:21 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm35559357c88.2.2026.09.07.03.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:42:20 -0700 (PDT)
Message-ID: <9ebc94f1-3ed8-4a21-a84e-ccd46f044927@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:12:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <iIEI9RqdlqSAwrBGxsv48s_r9QoTRP_IPoifu8PCol261xGqyCULXGQaaMYndhNAFA7YAzraXTr-UzZhguWz3g==@protonmail.internalid>
 <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
 <3e619085-3311-4acd-9493-e849875563d7@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3e619085-3311-4acd-9493-e849875563d7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX5RIEmBgUf4Ce
 Hsak92IA0UGcKGFWSSf07i8MktznIr6q9EEhnYjJ5FHwgEH5OMP7Czv0251VALcqVJpvH0oZQy5
 6RM8nG47/lmMVHlwKDr1NmT5LjUDFLB/ZAmw+nisEmlFZTWv7Jar+fR3njUK7P64eWAj5hiXxfx
 lPOsHTVRTi/qch4dWaWGoP3bImURai81CRtE26jgueHdPoD6j+m5rTXOo+W2EiknnS5GMjQo9F4
 ptshfBUe3Lx2bka9d3cJR+kjQ5p0igR014Hbj5axiOu+jwEBnij28tuVNB5unIWLc3kq+PGcgDz
 l9ByAyqgMv+2/xmmGmV24CTZIfR/MEPslH7IB+huUqCNGJBp11TQTxWFVtJNvm/xYxGWTTY0vT1
 pVvniFFOzVrprEvW8AzkA12O9TsH9XOBHmgjWWLOJBJG+3DqKmKJiROhk2yoMW2sDZAbGBMJw/u
 fY3AfWpqN+Xn8YC3mYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfXzim8IYB1ty0D
 fd6+hcV1XVZQfrf/+LK5nYDGQnmiMGvgrPfibfmS8Ss4bPtpY7Pna8BTwwZE9pW6oGM9jOx/LFQ
 5mzTky7hmAC5tBM/Vh/HjCI6wYCMt2Y=
X-Proofpoint-ORIG-GUID: xcbRjVK65Q47O4HwRMndwJGcEMy90MYi
X-Proofpoint-GUID: xcbRjVK65Q47O4HwRMndwJGcEMy90MYi
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e950e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=trIvJVA2E7aHKB3H3pMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070117



On 07-09-2026 14:59, Bryan O'Donoghue wrote:
>> X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
>> Glymur uses only the new PHY API via standalone phy@ child nodes,
>> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> What's up with the commit log here ? There is no legacy CSIPHY in this.. ?
> 
Right, Glymur has none — that's the point. X1E80100 supports both;
camss_detect_legacy_phy() picks the path at runtime by checking if
the remote endpoint is a phy@ node. Glymur is new-path only, hence
a dedicated binding without those legacy properties.

The example shows port@0/1/3 → csiphy0/1/4_out; port@2 is absent
as CSIPHY2 does not exist on Glymur silicon.
>>
>> X1E80100 has four CSIPHY instances while Glymur has three
>> (CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.


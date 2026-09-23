Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7383ACA40
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179595; cv=none; b=r8ST2/7y07nZTA9OY6/3CMwqi42h9XCKbmg5BzWg/Z7I9nCkHv0UL72QYCW26h4z95Ck7ZMv3PeOb6Cj4CZmk8SUVUfw6JLxqtVpdG+HWrVcbe8rPTpsQAEsU1GeVqDESqrJu0LBBagFXlI1aotOu7Jjuji6Qh6RNKS638xZRfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179595; c=relaxed/simple;
	bh=7RgeHwPYtMaSqi/p1KuO9xl5tU58oXts3DwvC8M1/GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4AONNPLfvchhK2wOldx0dloILR7GGdQq3nCSvMllcCK/n/yn9QKvsLLuI3W8EFTxszqmS3SH/Y3K72qvpmirQ4xrqiuT5h76T+ZzKjUwIARrwTdGB5lPMN6QJzHW2a/mK/8uHvO5mcRPllk8ERLbVKBLXgRphHABVHzZuJrurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNjJZzh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdLIWrCY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjJZzh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdLIWrCY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVB33772094
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=; b=jNjJZzh04fJERPl+
	tRbkqSodlHUB41rjwFfkJyTZXPmBULgi6MBWQXIzCRGQY7ZRyc/1hbZBxchE9AM9
	COclNPuL7tk7b+9N8UP/7Y19X/UcLx1JkQTGvmPnTtWyrkOuH/5/yZCu3nOcVqv0
	Mdp73GrnCud/66qF/DG26T2LuU34Nh8GRSWEc/SxIZxwast8WNhGq0/irskxeYXr
	oJ4MDx5VVWv6GYGhvaH0N7mYaQKrV2NcPibcbGarIgPwRRBg1H4yXIgHy0x2yiUn
	e+SZGbCZNEeMQlI3pcyeiefRRWhdBCRxwW3dylDF0WgSPsJLjd8N58ve1rVKVLmN
	bLKHSA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb61aqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:06:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9827fde53f3so11439241.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179592; x=1790784392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=;
        b=cdLIWrCYGerfLU74IoY3SC6q/yC+KyOVVR5QQuNmiAgbP3qi3/bgLzmk/H025E+tdh
         bFsINYS3s4esl5cCJpV5ZWLOL/Hnle4SfKwpKM51CAN1+buN/b876JuHoaD27K/n/PWw
         bNEdYse4BofLxPPdGXtpJfY+5Koo+3eTpHnch1VCsquW4iH9alnNyqJQXIG96xabcx7R
         zaqWaD2LXRCiZpzEODKc+sgKuC0R8U82va+G30DFvH5n3ywvDqUSpumNcLOG1Z/F6aMo
         /MWzUDfN4Zx3c1PExN9Qx8YeJPS9DPqegOcimmZA+dQL+80696pqzQQj+vPa763TEU0h
         WT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179592; x=1790784392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/yCfoa8mb4CzHVcBi7sX7PexllZZB5Dkv2WxLFeVoY=;
        b=1un3AZS6WGZbaYN56A6fffw79Swk7B6/nONURyzgdi/dbD3wPnyNHO/Y0BIYageULr
         F+wkdfllQYLBN8dNnha3BUoQ3YkhO1LopK4CblIDqLln8RGHiQEVOQnY8RuIu/6f7tBc
         GY6bL9DRxUoAnMxcnTuGWLNGVJGAXUCILozKllrTL6kbm9GbhJHtWnblaToU+Iy3z0Hi
         7Ay5ru8HVcDqc1pZ8faTIG4pD9MTPIDZuZFd+Bb4W0tASXq3dsbu67somzk9Pd6nIJ3w
         iH6SaWpZZtIF3kSJM3U1jehWhDd9Gx15inj0ib/CkcbrN9b80I9Vua3xeyMMt0U4yg68
         cdVg==
X-Forwarded-Encrypted: i=1; AKwUvBzYZuPl2emYdJcxoIE7fQGZPT50YgreWkhj28pEIPVtC/fMrnEejOCzlAGNYSyynWvUBBPNsOfDy5AjxCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ka394L4K1V4+251RM5/NWy9OPwFtkRJuIFh71x9Poq2R9d07xr
	kvEXBRhBjJ20Bv7lYmWOLUUHaXnO8h1j81QxITqzQe764J25OWJ55zX29eMmkXWsAaEGQcBRZJ7
	KP+eS74cnMaXQ3MHe1nPVRmJoux6vTddjRNxoWZMGx0JKVLXbrHE5VWLzCc7daz65JCA=
X-Gm-Gg: AYBFou2hLkPYcDCMD44txQHJOIUJAXnchA8vMRCEvQO2PCxOYWi/cgeg9V1oIqgcoeg
	H4DYWEtBgR6TOSBXiAzI1qZLhbobukulQB3G6EFndEIihn+A8zfc7SvCFSIdcKN0YDBkCFs5rrL
	MaTGBzGifridvX415IOShy2o5wLf6itigWkUEB4tvFbPQKcaL2z2NW4fgnZ0jY+Vng+3FBX/dS4
	91w5pP9TFZpPSsO3+mh+NrBPdIRzHu/bTk7Wu4tmuqyI1iVOWkhVx62hE2iBcdVfCGVQkZMF8lS
	SU5TFD4w0SknSfF6CaQNxD8L74P8K3NisYsfhpxRb9Yo1fVWXxqwo9LNN9KZErR4CBkrRU8DNBn
	pKuMER9tb0jHDRFbEDSmE/g==
X-Received: by 2002:a05:6102:3c8d:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7ae544dcb90mr1032917137.3.1790179591869;
        Wed, 23 Sep 2026 09:06:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8d:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7ae544dcb90mr1032853137.3.1790179591382;
        Wed, 23 Sep 2026 09:06:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6dcf0dsm154081966b.61.2026.09.23.09.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:06:30 -0700 (PDT)
Message-ID: <4f7bea21-1fb2-4c10-9ec3-33f920cbe180@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:06:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Add initial Valve
 Deckard devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
 <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-topic-sm8650-deckard-initial-dt-v2-2-8361c4548efa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gkqkzC3mng20iyWIfCd6hF1_v7bMLWBL
X-Proofpoint-ORIG-GUID: gkqkzC3mng20iyWIfCd6hF1_v7bMLWBL
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3f908 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XKDLSxsrZXX4fVXGSQYA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX9Lqzsrra+zxh
 F76i88rx/Mk1H+BwehtJX23sxlOORMQUxsFyIj0Z6BSlyAQXsYxz+MFv68/sb5uo/3UZQyvDa4R
 7T/oGAVIUsNDUvU2rYJiFV2P0GGSpnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX8v6mb5N2HzaZ
 esVkCLAzpNx+ZFHAtfv3Gk1cwIAW3355uD//jO2vFCyZ50peDzOVH5sV5qxn0gsIb2dwSeiHExn
 KDIwkzRUGOQmj2abnvvKictibrEaPdT9Eq9C38q4+0T7TBQVytljbJpwcUqwYitl/dgDrJWU8OT
 uLuhs+uUpwFuMNB236U+NJY//LTfNB1Dv5ADlicUj3rRl8D9WUilHyEGk07hiJpMnqqCeaYBwXV
 vxTP68axsqo2UWTq1zjRIeyEqkS6Ma7ZsB0w8Q0qGJfagBsr3b8cHZ4Pp5rVRxMJDF6XYLMHSV/
 6sBXHRTx1RTN7EkUXbmaV35uf+eqccyLZlL7Ixweynq0RYwfNaDtkD7SqDlvFCHNasc65aqX45R
 PeVjbhRq3WNWvlvs1j8o6QM2X/COT+/gPO7KLWxyNqj6lIN0lpm/7u7LqgEvGufEldKbSTXddkz
 zV+xtqYXJeKXkTHoawA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230064

On 9/23/26 2:16 PM, Neil Armstrong wrote:
> Add an initial DeviceTree for the Valve "Steam Frame"
> codename Deckard. The Steam Frame is a virtual reality headset
> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

[...]

> +/ {
> +	model = "Valve Deckard";
> +	compatible = "valve,deckard", "qcom,sm8650";

Sorry I missed this before, but you likely want

chassis-type = "spectacles";

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

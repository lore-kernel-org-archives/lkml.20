Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4193EAC8D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819104; cv=none; b=Ejy6n4wL8ysF+L2Lp+az3ZLMB5yHPGpXppX3xvAzoJJVbgoHdlhnRj6s6PyT/NNAikEtrZ3wjpwFUjDuPzzgWH4v7wKbuFshzLV+DkMYnuJG4MR2oMw2bVsdO/uyTeru/KVUke0/fNDgTzRGeiCrfI5qZZuGDo8bkaWGdWckJvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819104; c=relaxed/simple;
	bh=NII8/DvpqZvskuTyC2R0uY1SUxGgGLheGvOiAEFExD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEXyz7zcIVKMKUCk11LbPvdn3An061qqBiqkrdMy+3lzs5IoUeTt+yvN8t9Dyp79JsRt58oG+jkmpV6uyoDQb/M475ePB2QSmdp9RaZc9izsAUjqYamHBsZ/+5UlZbr0EOTfQzud3dTw54AAvHiurUn1U2v3RdAn+GndH1+U6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YgChnls1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlzzrtFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YgChnls1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlzzrtFT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0aom2679915
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=; b=YgChnls1v6APMnOz
	CfpwMi4/W8O1NyM5mDb1nmrHRVOlUyMwOzIQlHp2tAPYtoB0UX6CQ1cMLengXVH9
	LKIl97FTOhfscwGK8nbUFFjmW9mF+VDQkNCFt4yyQraKGLQzDsY1x43RYdii5bD5
	qphBZlnwu71kgwqyxesItpIiXtrJ3JgWEJOjf6FldAG1/HFOFK8AK22/8HKrxONk
	Lz8njybC6RbpmVeC9+keKvZEVvSO255QC40crcNY6thDluRJGOC1CAI/83XWY2Rv
	Tg0FzkwBAduCguvqOEqNfrhbLoP3CGJ57N1W1FFryVil4KQJZC1lQeaCAs8QHHWj
	tHk3MA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tn7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:31:40 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e53d86f8ffso16719e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819100; x=1792423900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=AlzzrtFTgoHk7dR8z4KGCP7nOZYLpWKB6BEgU+9A5YjxBHuCvYZOCOq6I5CjTAUXBl
         LwqBiOB80JAs5y+1aJVbAGDtJpdv+PnyP7mhsUpPUdBdL+nAq+tZ9bu16kXapOT7gWfp
         uZy7mMDqISxS4QgA+mNlw8bAXe+U5AUqMamuSFZR3pIq3lHJG1WjSTRUvdZhlDDoITht
         RpqjqeWCzKUDK1GBEReZia5mHDTa5kJTjE2/oLhPFkO5hzFxZ9BwaQc1FXkiYw4BRh4I
         OenrT2g36NgjvjiMwgpY4waOshzXeMY6hWzHpaQkfuhZcWAOXKXwxQH5NQMe/MmMUSPv
         bjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819100; x=1792423900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=Hmuvt79BRrNVz/k04J6VxLAWPZu5imjTgJDIOtgDNEukA14tB7pa+pyt4UiK4i640w
         ZfwuBr2qdg7kkuDp9l1W6yBGIcbAjLfdpFqOwewdPbOi9bIRVY1U4JbBuIF+m45GoqTY
         UBzdJrbxLQQegiwkO7ZJLjWbO7AcDLZ0J+ZBHp1URXERwrFDHAR8nLdeZ0cwIXN/yu+K
         s06QL82XQAr9w0RS0lbpbk8NZzIIxeKygcNQvTM93vWnF+GrdoQFpias1d7HBOMWOKw9
         pSJx3XKahsxMsjn3w/mIgS8c0GXtUW+2k/tQaQ8c3H8KFnjKCzr3kR6BuPnKRqRKm7mv
         WJ5Q==
X-Forwarded-Encrypted: i=1; AKwUvByY6Pm9klD7Rf6TN3N6Jh2P2rYAsSuSTcF34vAoaJonvwI652WArb8ZHXG6NENuw0NZsoxrSUU1/wMV0F4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYpAeUC6fUKbAlUhGZxD15WKm1D1TQC4fYsoKBPpM8vjgqKlZn
	3Y0ARysgF8yGnKdug8t3yplFvW68fp6pE9J0FJz+yPjlVcJntujwRaHMMjPUz8EHdM+9n4PdsGX
	IL4DFYjUiqFdtc5IznCrlLbakEPNYTk3TJtpnNzy2wtLpicuzxSu43uELaKyKmFku2jo=
X-Gm-Gg: AYBFou31kjvRpExCeW+C5X498ITsdsY5tyVeIPNMSkJ/seXscOib9iBA7UlnDc9sdvP
	3m5TZEHaZk0UtdbY/tqYyHmhweG2OEGmfrWjl3sgGGkuxD4ELzhyqtKqbPfIgGz/IHoBLY42Xv0
	YZT5u3ojakSC6k59FxnlchT6Ww6Ds2oL/J6vmkR086gSdu8WL8itrcmlTuVAbwW94rQT9iqsHXy
	2M19o4H2p73sVS/pey5/i9ktuA2AXiihm52UDsWM0PoUaAi1sXeBp56JjhPuDM2tEHPDn4Ggqel
	C+Z0bHBRuaRxJEUspPB0QW4AA2JGZHfROb01/JhZ4e3LCg32rku3ibXiTor1gfKN+y9FcWrwSr/
	YxRPIzC6s+XA3/kw6BRvMOQ==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1470224e0c.3.1791819100157;
        Mon, 12 Oct 2026 08:31:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1470181e0c.3.1791819099635;
        Mon, 12 Oct 2026 08:31:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:35 -0700 (PDT)
Message-ID: <0ad55730-8ce2-4cff-a84f-689ec5716d7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/38] arm: dts: qcom: msm8660: Remove empty line at end
 of node
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <737de4712f52d1ba198f9201cd2581ccac7b938b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NRXWHRWzrmw2pp9LhuVb0KwUtc-RjWDQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzqXeLVBll9JG
 cO9dmBKsgOHU3kq2KqpFuHhQ5A2XWmjvQueMcg4j2eEAaMhTgmIL9eUtc4+1wA2oqotepKGLpbN
 qAzkOdAQdQsuhBsX7ZozsoP1wIUy7lM=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accfd5c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=cfbp-VlG0RD5cB8OVJAA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: NRXWHRWzrmw2pp9LhuVb0KwUtc-RjWDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXyI6q3U1uaQI2
 RfWwahn96QppXM2rJfOJJ7y3A3th5ztIiBLk55xCxOXOqqIW6q0ck2e4NTYEqGNNbY1qtvgnxgS
 NvFlRaneSE2eyVz29McBJH5vQ3YGdHwh79Hc5w88POU14FgXEDbC38rXRyOujHruTWOXChY2kcF
 tjbMcOfkCEBHxqpmKwg6AArWxY9sV6lThe01t0eophixTzuYu6lpuTCFDuM8WOC/UbcRnAOcWjI
 nnENclsh0WE3KWzxj1p564Je0Zg4bdF7a5odhJfTVXj4nTCZ+but0xnQMsHKATlHwHrgMYRC132
 u3gBUMD+DvNJipG+N/7eyhyd6p/NT6M/qI3lpO1n2/T7v89xI52B/BENBSREmzr8Mp1roMkVBvd
 TTbrWlv5kwjN2Z3iz4nfn0AOhSTpDbEa3G7HaelFA2T166izBNcBhANRokxvzwGnyHNlX1PfCwc
 iPcb3pfJdCLnVudU5Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be an empty line at end of node definition. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

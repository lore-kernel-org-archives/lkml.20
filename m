Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047FA48F832
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810216; cv=none; b=IT4XkpEo7xhTqmz0UbBXdRj/omH+ajMtVIX0Tqi4bNZslGUshTyJz5LUlLVaywuhyd8EBxg3KSmH9e4zJKl6VaDkXPBVk2qiJ1ll+enj44dkmDm1ujCIuvhhBSH9Za/UA4vGjDkU10Mln5Pt/mzIUDS/+LrPeioO6s0kE/sI8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810216; c=relaxed/simple;
	bh=GfpGHxUnYZzyUwIu1z1KCFtH5RS06L2Mp71RQg6jZc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwLTqsLjXxLushjb8rzyINBBXwjOL3b6G8LEuIzJTEVcsFU7VeyiZxW0DCDqXGRt3ZMtQFb0Kpf9hKa7rUPKhjKiucm0d0yDN1bTNLDaAzhlfoe/W66s5xPGQDERnWo7XL0CZeGeY2g8SPOoDRVydZ61dy+UG55bTdysxQ92738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsuTBb3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Htwx+6j4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsuTBb3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Htwx+6j4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BEK2275903
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=; b=NsuTBb3tlEpbtwnm
	i3sAMaRSnVD1YaEWyP06EiT9xdvlyDWWe0HcaFYxt01UUg52DDg6HQh9B+17nl5M
	3B05fe2qvYfz+Ni+l/pNuDixudtdeq0uLn+YHz1u5tt9idmb1UD0o2A8xHVAjxnk
	wQPAMIRhStJdhgR9oiosZKls2oPWLkmOywzqOAl82cpUeGOaV7RZxpU6AfIuULhj
	1SLP+YQ22hqjBBEsCJL9WBKux1YhRRA9dFNOqUp9qYrSw4QmGdjJ4UrVmiDkzLGj
	G390hqsZfHyrtBaNKqvjSc7+a9mpscyN8H6zpmsikEOGxrS4ap8tRWVOFOijRMog
	jyD1Kg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1dvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c101b7f863so36314137.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810212; x=1792415012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=;
        b=Htwx+6j4ZN9kk8mULyGUwWyjuE+MZupTJn+CRRnK3a4ZxshHLMBVS8+rAKDqZyf9RE
         GtUqcAg9HnBQldUFs6kt0HX5EIX82//N63mmn6WzQBrkiaGfJIb8Q15dsqY67sUIVeYL
         rty/wW83TOFiJkBQkV9jKfa1z6/m73TFKLnAbMO/blAVe9EIuxaIo2D2t8sx/dG5F5mc
         WEqyyxvaV4Yoi84i8JZ9atywt5Yxk3Qm1VuA+HWcvot2zNSGZyWapcdwuvrQU3oxzHv6
         lwddRYfGVoxRp1JPaLPNZ+1OFRaiURlZqLyH1Il0sL8WH3SRB7NXiRHdZPkDsXVBa5Cx
         E9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810212; x=1792415012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=;
        b=AXgLq1qs05Ix2ofUM8d41w7KaaXHv7N0PD7mmbWSGN6rUzIsc2w6Wbymt0nStVx5vC
         bQxbbP5rta9TUM9UjmWsS7OaWlSgZVc2O1yorI2zMYj5TaD+7EvtS4lgG+Fr7q23+zma
         1PdUazSK9cnHwiVFQpTRAgS4W9c54BlNXS93viSH1gXUPpN/4zMG5F/++XNEH63cbSDP
         PIowB4pIxwefdDGegb1Z9FTAR/v1NosUc7+gf8XsdhD7jKwh69ppxnwUPlKA0oXoRFhj
         RZNEiG/jKtdkuBR0urPx4C6tunk7n4Uf3QYaOHYhjPJ/cKKlVmUDYqPpJjXjfR+uNrfP
         ODMw==
X-Forwarded-Encrypted: i=1; AKwUvBzbRThL8CdLEsNdmpZXxSF2YdJtwK7/CD4rbquo5leEo8oerTZbZlzk+NGGO2kA6c8LQAMk3f8GNeWL1pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBfKHDftHT8sd1Ckxks7fHM/fCUlDcKe/is1x/Z3uWlBpGzcG9
	OTKanNrermrqOm5uShAwAE+eXbO1SrSvsVPWqs8RXX1zf1acZu2snqnFjDd39WwCXizoGqrpNRV
	adpwKt6HFY7jNmXTG6EAs0rPhV9mfZtG7RyFEG5kiVxMvTayYbo6gJD35rgUcDLvMYO8=
X-Gm-Gg: AYBFou3EbQCA/11bNnoFD9Log+FtYx1eHv8DnvvVChc5EVTZCC6/XXFwVudsAhw8lnK
	d3ydDTtiDS703toiMSKYjw5oPGn2WcDPydOewQ0o8KxzIkO+s2iy0EF8F39LB/oT1RTDRO7Cf4U
	JcJL8nvdq96W6mCAy4CpJmpmxG+5yEQr7pYdjOPgQi6cAzS20L2E7f2mrLMDerGMMPG5Vvjb+3P
	CAPA+QDMmitFW1Y5tJIZ2GWtCvx/n+B6Nm68f9zDpriXG7Z4wvVXM4AMrvFaOHB51znlff9llQu
	9lvRPg/HjMlMcJa4EDTnR/fIPkM9e5tm6wF65Mus6DTlVFGZm4zgseAceg5fSgHNHFHcTul42qH
	+8tX7qyRMhS7sB8cjXrDuRg==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1278944e0c.3.1791810206894;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1278916e0c.3.1791810206283;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3382b8953asm232387266b.21.2026.10.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:03:25 -0700 (PDT)
Message-ID: <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add CDSP FastRPC extended context
 bank
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accdaa5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Q05WB-lhHploSVLRvUAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX5uHYLKPPnk6E
 EP5qLqHbCJp/OoNV5kHkhW8ioI5BpdR622EmCOE7hxiA6gOUbGtUxo9Y9+DgmE8wma7o7f2EG4V
 Ql6zYZ4IKiSWaKxPobDMnKOhaSHgrj0=
X-Proofpoint-GUID: b87McnHHHOPXE-TJFxvj59DdbQxvV4z6
X-Proofpoint-ORIG-GUID: b87McnHHHOPXE-TJFxvj59DdbQxvV4z6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX59q9SRkBTDld
 BumKA+hSg1Y8PKbTIQPibWMwzOP7el2ys6ysc6dz6NucEmB1u39D4uz8dLtjtaoRwLU5El1jwxL
 fMvMzCIzoQQRWJ19BNu9FeoODF3o8zK4/69cP4W6Vhe/BqbX1r2MmI3wDsB0BvO4u4Tm72zCmDL
 IFtL5G02v1o1RK+zHOJEvC0AGy4KczZOunJk8kBk3lR1ZWe3D23H9t6FAnJWYapuiQgtddSkNiv
 ptAQWVTIMKDuqorrtbeGQFYvwkxahRUQQbD2iqsCJAbZ0UmsQ73DrzTT5kPSisbIE76dKCFqSKM
 d4EOG0zhTva1RdRl9QtFzRjm30fD7n7g/nUq4eDjp088wZBscDlPYb+ZgTZio2BUuiYKl/8WAgU
 5VxK12aJ9+aXB8TGPz1jLY1fBvLJV6aGnI2ppaFkTK8DEHmTvbsFvVB60G54E6qTlk9zIgn8Zdd
 GeAhiJaAeVyEmItHnHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120051

On 10/7/26 5:54 PM, Vinayak Katoch wrote:
> Wire up the dedicated CDSP extended context bank on kaanapali and
> glymur, enabling buffer mappings beyond the standard 34-bit IOVA limit.
> 
> The FastRPC driver identifies an extended context bank by the presence
> of iommu-ranges on the compute-cb node. Each patch adds
> iommu-ranges = <0x4 0x0 0xfc 0x0> on the designated compute-cb,
> restricting IOVA allocations to the [16 GiB, ~1 TiB) window. The
> fastrpc and glink ancestor nodes are bumped to #address-cells = <2>
> and #size-cells = <2> to accommodate 64-bit iommu-ranges values, and
> all existing compute-cb reg entries are updated to the four-cell format.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Vinayak Katoch (2):
>       arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank
>       arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank
> 
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 31 ++++++++++++++++++-------------
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
>  2 files changed, 35 insertions(+), 25 deletions(-)
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20261006-extended-mapping-dts-f60dbc6221aa
> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
> prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
> prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
> prerequisite-change-id: 20260826-extended-mapping-9b08b0c3108d:v2
> prerequisite-patch-id: 7fe093060212472237ebfaf12413fa38d662e5b7
> prerequisite-patch-id: 86acb1e79d10600734d07152dbbc3010977b85f8
> prerequisite-patch-id: 08da00c4dcbf2e77ba217676bf93daee78c20e79
> prerequisite-patch-id: f6a649d7e73501312402b084adee4b5fb3d83a44

When you send a series claiming it has hundreds of prerequisites,
it can not be picked up

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C1377A8A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579991; cv=none; b=vA0t559QhnPQ99uynFwKUsjn4OlBb01u+5aFJ1DMAdotD6ayrhWb7kg/znFiaNWgXxm8dWBcibct4HljFjKb5b5rb+hNz/pHBBuCVZ9e8hEFe3Gdo8OVfdDguZMX3+Rk4Sn+kblGR1ng2EskKU3q52kXZVs3b5c7mh5LnEjHyqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579991; c=relaxed/simple;
	bh=Oc81tFYiQYxi/JREaRgWDxPfwdCz4yFGAgIplo85qqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfYVqyOrC5N8g6zJoqGPzm8tOYP+OffI/A5ToRdZWOJxg3eG0U88jPNC6XdL140k8YaBeBTdOahMiRz6qaOPCDC4UY7OAl0vauqfxvHC2GtuofabSXt8j8roaPLcjg4lQ/O3B1Nz6CGCe5SZLD+kZ+K5oFFSBBAAwjJh++hLX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKeEsUHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpYLJxVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKeEsUHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpYLJxVM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLIZnD3218438
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmnJtVtthIqX9DUYl2s3EI3XPV85YmtC5OAaXBbwo8g=; b=mKeEsUHz/eAUttQj
	JpHtat5a9VUaJslw+1MsDc0Xf0/eJXhpVMHxkU5QJQAdO1q9DKbTI6wwTwFwCh5Q
	ViTO2qhAUjg+KsKyl4ZLWV0fC/RcVuYnypO3Djy3AsxjIGqrqGRHf6EhIMkGP/jQ
	nFJWfi9YD72y8Y0wyL0DHPIK3LHLRuk4BivIT4KucM5aiec62RGXcPQDPWhFYwug
	CR2f/9O1vrq14PiLzs7Nc0b3ZtyI2wxOO41hC/oXAhpz6eiNgXVVr/HmIgo7vgf0
	y6Z5Ei/uLfweB9if1L0oYtiMRZqYjpUWxsG86Vun+vLCPeuNPxdO0bva+f4a8x4W
	bDwDcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav499ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:19:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0bce9739bso3855164a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790579988; x=1791184788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmnJtVtthIqX9DUYl2s3EI3XPV85YmtC5OAaXBbwo8g=;
        b=fpYLJxVMAT3Pgo5wQ0JcSA1OyGtbD8vUm74pqvlFxdsb25Zajabm0PXYtB94QMD+Vz
         h18QhlOcq6LicuMzgOYvwR5PbDQbvJ8ZBoeGmQ1X7hmAQls9PXgADK75+TYFpb4SzonM
         chJdtDR2Hy0i0Xzp3RBTbj5neU6Ivm6MXXGHGDAmDq8vvOo25q7LGVfgWKpw8PlAC06w
         vEjuFZPOYmNVtuJqsuLUj/7in0VPsQIerbHIFjIqq0cJ8kBNh6Fxs8Vaw5M/l7PUTxSV
         oKExMHL86cK8vhibsPPRG63tWZItGKQT+miPc1NWURwIPiPTPCETA6HFm3BSV3/Gdrt3
         EUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579988; x=1791184788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmnJtVtthIqX9DUYl2s3EI3XPV85YmtC5OAaXBbwo8g=;
        b=CB7jC5AEkeDOyRYtM8u3Trz/CX67pjAE2adToArVj+DocxC7d7gubBQ9diZLUIOO3N
         hP+b36bt4Vm9G0BI9Sg3BFTgeDf4cBQwuWvY6HasflH9Z0ByjkXBrY6lRRd2fzpUgeQX
         91vxEhieKkDQdMft4svVetU7QAYvKDPn9wKkXjBHCce/byx5skxKsESCuqjqTYHVXOyM
         Aolp33r3SZXxGUT911o8/7mhjz1l2KLjaSSLLLWtPbo312W1wkFuRQtKOrfHyQ8Cbsc0
         kiK884cZplwwgCXH7T8POUL+3DesIM5NM9GEUKbhQ4Ebc3nCwuE3zgPDS35HnbmyLDWc
         fjjg==
X-Forwarded-Encrypted: i=1; AKwUvBzE2dLxY7cLczBgaWk3KsqapIuFPrriRm6gHx6Pvvvx22medRMFxXQ/9TNzH7XPLfWtNJK5YLKgQVz0FxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzN8i07rb41LjMCRfPm4I2YZKL1y3ac1AS1ZWFEeSinTJ3r4JY
	yazUIkod43maw4GKT51SoaBOWg2G4d5iqa6HM8HWPBRzbC/nn9pbj3Br7Ydfo64ZYUzBmLAnrnz
	+w7o43wZzAG8Mnm3RTxcKSBKS9HJjo2LBJMnCuGFq9wP6/X8MVYUUHw+ItfKJV6ycNik=
X-Gm-Gg: AYBFou25o1pYgorx2Vh45zO6UORkQe/vKHrtIFtMbtQ76CT3qpYvi/cbwTDN1wk0mEL
	wqRav3/j9wMmuowmTwbFJfkp1i/zz8m0kjAGvmTTiJDB1gCBAF8i4iB4tshrDRmRP725v/EU6j0
	bmOv74OyVMJz29APa1ty/43G8H2HFD08+Wwdkvefvs0du0Ag1DCeqRSRHcdUBAgOw6Trv8wUODa
	mYbtbN8L4uCJJCKPLaacSwxuzKlZYoDEx/4shAJghHxSDz6JZF1tcKlJMvInifUZ/ecGr5NFGRE
	fHLyql0x8yQ76ojzuqOq8j2TQhUlwJS432gWU/7rrCQ9WoieqRcFI8OGpmHWiQrw4cJJ9+Cvz1h
	ivcf7VBrLqy0q8QTvrfKcqF+thUM5G9pd+l4UaQTr7XGKIpLizspC8dg6Xaejm2Sw31RJpg==
X-Received: by 2002:a17:90b:3a08:b0:3a0:7d5b:8d56 with SMTP id 98e67ed59e1d1-3a0bb599f07mr6886898a91.28.1790579988210;
        Mon, 28 Sep 2026 00:19:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3a08:b0:3a0:7d5b:8d56 with SMTP id 98e67ed59e1d1-3a0bb599f07mr6886875a91.28.1790579987658;
        Mon, 28 Sep 2026 00:19:47 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm27648298a91.4.2026.09.28.00.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:19:47 -0700 (PDT)
Message-ID: <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:19:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lrlg9OGuULoKoHIvS13eV2rmqyvGhgCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyOSBTYWx0ZWRfXzoeKH5uE++Os
 xZDPE9zdjlkk2e4F9IFSsm/ogYBKBnnbI/KUlorQaKA/aiSAdoS2BhLetf1vcMY9V3Lkad00myE
 GppJJnEoTao+PSBcpJHOfJGaL8CMtyrx1t7jGyMOVDJhuZ+99BVYxIptr1Rds3D+070Iu2f2P4q
 TxdDyvvXXhIC/SFRCC3nJOisys0iUJnfFKzyqf/1TjF4lVXNvzmBd254fLtFhFL/nm6H5gpDo8u
 /c2S/95QrSs1GWAfhvTrK8q0D7yw3U4Ci3S9GeYX4hC2x53prgCywp6T1cEnGevcShSXvkcWcln
 09dhDnshdXVmq8bolZJl9l1PSB0Zsah8evFqsTV/F0TK07iNCkoGqrrB9xVPqE5lUeT4fVFHOW1
 j1CAQ+Uq0vB6zNW9Y9kvePbbzKj/ZKhTbLPDV/0K62Bc6BWswRtXWQ2ufimlV5ksiGvDxrZD4cy
 /8mn0TfFC82QNexeq+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyOSBTYWx0ZWRfX24SumNwISppz
 I9QwUR0DLkxWT9M//uyEgdMHXN95CIZAES+BW01HUdNG0m7DMnVAD72i4YZwX7nfZh/bAbhn39y
 1fshS48zsV8P95gFA/V4kFoVntvl7/0=
X-Proofpoint-ORIG-GUID: Lrlg9OGuULoKoHIvS13eV2rmqyvGhgCo
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba1514 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=B1sFI_uKEMQSKxwX0JYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280029

Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

This patch applies cleanly on the lasted linux-next tag.

Thanks,
Jingyi

On 9/1/2026 11:53 AM, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Added trailers
> - Link to v1: https://patch.msgid.link/20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> index 1593a1183a36..44c864fd5fc7 100644
> --- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> +++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - qcom,hawi-spmi-pmic-arb
>                 - qcom,kaanapali-spmi-pmic-arb
> +              - qcom,maili-spmi-pmic-arb
>             - const: qcom,glymur-spmi-pmic-arb
>         - enum:
>             - qcom,glymur-spmi-pmic-arb
> 
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260609-maili-spmi-binding-dbecf60b498e
> 
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>


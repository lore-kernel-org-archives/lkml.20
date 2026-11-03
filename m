Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699577;
	b=XIW09glwcEV61BdZytvGjv6og0yu1CKma1IfV4XX68XxrNbu2/TvyPfbgchjoxszByhJ
	 Nd6nGfBllYnq828OYwBDV99v203kcfAAk2d4fqUCdtnUoW7x/XPCtgqMym/pbAD9KBDYe
	 Vp2TBK0cZLSyIhq3j7jZXJldsBHwdNBSsAKnne7eE7S76xwm6QA4z4a8j040zfXDgrvMN
	 +Gsbr7upejb2+Q8G1ybrZUK3tU0Tjmugu203R2jF+W6kE6fMkI5ydZ2L8j7/rGj/YEbJp
	 06XgoQxy8tB4RNOPamZgEAoOnj31/2MRsq6pdeJp/tBClCwQ+l7PMVkHB2zeBEtRr3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
	b=SMFZn1RF7H0FVbmoPuK3Ao2izPWEt8Yij3kfQaPaTv0ZlAc5wkBCfB2MfrBuIVa9hp9X
	 aCCktYu9Ihub8DA0+SkjfLKNHnXvxDFZDdM0mhRqF1WORD0uu4dMQ7ko2qLjjwOMia57d
	 zrpB8WiwQLseQhumrvsy9pF4jBR7AufUVPBl0EzblevLcVCPHnXoIiWT3QI21tCs+jg29
	 lGTum3/OYH6cJHs4W285CwgqI0UNxtE/c+H9CSs4sF1Bv08B49vi/FmeT7obiQcN+IFHA
	 VA6KiAlDMEWqs2XvHnFJ165zn+24zmu5D5aHWDfdxUmhmKbuDVYKZAGhJD0jj0j1YPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQiqC8J0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgfpZNjn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8909606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8909606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQiqC8J0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgfpZNjn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38bPq12106752
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=; b=SQiqC8J02pCozqhU
	iqF0eV572zDi8yFJatFb89kEKJrM8W3qbmf8Gj5FceM+xmt9lZr+71yZe/Dy0Gi2
	WfoF/BGPW1LEgoUKK/b8WzkhNIL9eIgB9Xho65imx6vqTHX8BIqfjpgGsWBGJQCT
	zdSEmLukpei9MUT1XEo4ox3zhNOa1vxjv1R3NrYdplRjncDU/orqVSE128hQPpHq
	QLhL+K3VHdjSrgcEMst04EQujdPlxauTRHXUN88qAsN5uPMnns7UfBLU7gtuosGU
	dxdZ2CH4Zx1AAVFkagXDmOWitCi5MGt94irBh0+dEmaUJBVtGCZz26mmLRAxJ69w
	nszajA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99mqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:52:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc4149b885so3138942137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699575; x=1794304375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
        b=kgfpZNjnzwEG43J1phEbY+v/tfQD8Ps+LfgRRPAHGKoAI9yCXg6DFy3FaQYDPHqXvZ
         0B6GW0sLlrspS8FeezFz2yxfucIUAs0UvdwMPFVAVo1YznPYPQ7H2ty1kR60tg594Vfk
         bYrfjd2p1/wHFYfDtgVxcMcRM/k9Mv7pO6bq1ozqY9kPXtW45hZzLk1upl1on4/Xumd7
         fUu1x3ydJrC76X5uAgjjtr9qxvdG4nKMV8g00ynyskpeU0Gt5iJuqR1xQla+cScbKhfk
         M2pjRXYJP69VhTnDnYr6AwJH0rXLHSzunGC2z1OM6lkQMpl1FG9MKIDCyL1lR0tS69zY
         dAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699575; x=1794304375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V2vKLAbaSmHgptJneH1h5y6dZZy9cK7QL+l/UJYqCHM=;
        b=1Yr3BDQvh03FjzLUU5nC0Ql3vpu7gd2rdkdnRXtr7edPwKmqidLqo05YbV0WijoYPD
         94BEv60vQUFFv4rXvRbDCzblbtLuSZg546ZehmiOcxdtyjiuENjr0VinvhBFvnRmY9Pv
         QuIhofElYlHoDEKYTySRXwU0XVtqgBgKMY8thPL2Ys1yeQpvjPq5vWWOBIuVXKr513dq
         tMNxGG+7QB3kv1FJeX2j8R14PFRv2DdadAGT7W2VQ1SPT0KxtLknAS+NJs18RzbftjVY
         J9ng+dm5vkAP6yWlzDseBtahac0bRK0DycwKG7u9mGsNvRk0KgQUlLV4tyzvTY1Q6TVw
         bFog==
X-Forwarded-Encrypted: i=1; AKwUvBxYW8pTnfV+m0BURnjq5yn67I1xiaKW9pLNxBN1vgfuaHvjCDyJ5OYTkoBesSjF4i/yWeDL7gGCSB/M/6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kBzMk26irw/bbcnl2GDgConVYLVgdYLW+t85Gh0PMuy2u5AK6
	cGZuyomN47FYieMu9Xg/f0kfC1AY3Oz+njd6o9qRvJTyiItjLFIvVeplizfvvE0F9VWS0JsVnlO
	n+0S+afBwPbljQ6OVb0oNAgJnQLWVdYPE8LvLabahLORIz8USHrm/YSYlzLLrH5rpmyM=
X-Gm-Gg: AYBFou2UsAMe+N+x/IhUdexivXb75LnJqgpkLanW64hQL31/F1Uo5c1Q06/q9Hpp1wU
	Ft7tk4Nqrmk/bJOF5wqbu8IyrdHnJq2sYZIzxB6Sb2Gw18z72aVRbm/vIjd2Yh9Bw+KFboZQOvl
	X4eHtX9gHqiDAfM94/keIhufNw6rG2sV6mOZ2HljQwBc1D6ybomd0ATjUxBRGiF3nvZlK54rx5a
	ZkPe0KQu97w/tOdpVk++cZSAyjIoln4EjrXGT2hdH6b2UveytkMC0M9fLsNMjUfNYMsGaZZnHBR
	Bs6JnKmu4UGni4cTV4+WlW9xbnA7N0ELHt20HKKwMv+2lN1hSFUU2T2P+hDiyA2rnlSvcdHLnHw
	5E/p8ts2ep8dFDOzc8ODRV8GdLlNum3AXmKBvkrGj+1rwd7hPlNAxdaBrgX6e6yU=
X-Received: by 2002:a05:6102:5093:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d07261536amr5055172137.8.1793699574815;
        Tue, 03 Nov 2026 01:52:54 -0800 (PST)
X-Received: by 2002:a05:6102:5093:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d07261536amr5055154137.8.1793699574067;
        Tue, 03 Nov 2026 01:52:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21429736f8f.58.2026.11.03.01.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:52:53 -0800 (PST)
Date: Tue, 3 Nov 2026 11:52:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lukas =?utf-8?Q?M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Message-ID: <73wofgp2y2f5gwpdqg7rlqolidb6kwxbjay66qo3dbabjw3w2s@doxzoh6vj67n>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Proofpoint-GUID: K2l4tLmNoeupOyq0XQ1gwmOS7dTjhK32
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3xdFHRkkRtLF
 QPQCaaTrSgs3DuK2VtGSEbf3Kwa6c3qb2CoDzg6Gq+MvoSr2qEcwN+Ky63qKE+9OyirXid/pnkM
 6UilbNpuTh+gnw/bZUvzhEkz+VPekVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXz6smlTLKG+t/
 t2+j8cM+1jw1A10uzkjxJE9J88gN+Ro5HwNX4mUgSVLfBUYPTGd3BYAoHMAIqXC8O1+Q7/2QiEB
 7lhTxaQqm83pCE68tjiKoaM9pr7NxuKH18tljsxoWh2GpwP6a0IROitJJJR+WSpC4Q9z+GXm/9d
 AJQeJDxOLno+OcpUaIncuBLk2iNye0Xs6945rPaMzVNI7qOFtOIExjfFO0ODcQXX3BVickchNR8
 bHIg+HUuNOuL1114ziFkxPcHFIL/wGWZGONQsoItct93JI9scXF5VjyMuiLTw7CT5kkdbkpUM3m
 WS2cZJkLDrpFmF6EkV1ZsNH+/I4MToR1qWtUDxpfZUGHaTHl2WROvP/X/av5UKp5QktRo6LRb2l
 qkWB6GeysZAdIDvAtLI4Oz1qOnAlJpOEVg3i+gwYeaHz2ZGqAsbTg4c+zMFlTbDAJnckNcnE2/9
 oYVte860qRoKc2okbtw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9aef7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Bn5j7JmbtJmb3Q6V_lIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: K2l4tLmNoeupOyq0XQ1gwmOS7dTjhK32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 15:28:12, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

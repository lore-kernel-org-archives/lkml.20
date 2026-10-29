Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263651;
	b=vJBAFhqfSGWTX+DKMF6TIiU/7621WDNstw9IWItYTB46RwEpuQ3K8AEcP8CMUjW61k0D
	 mBcx3jkl7F5RVaZRmJ9+pInCEqSmWVzY1N57PCpkmHXIyFnEgwjH+0Kfp3XIMAknGN7Lf
	 OPJk+eAb7JmaaCD7b6+hBt4XvisT2xYgg0Sv5crDHVG0tJbQyKIHyDL+WdmThRlaVA5sS
	 /FZOx5GOVldA8yde05NpRw4KcnJhMg9H1TKZgtlCVE/s3BiM7GntjBvtKSzOlfs0rQ0Nq
	 BlRN5ixl0NJIWPC2dcv2uNhEMNrlLRH1U564M+Z8B7XMCjKeXqvU2ZY3nO8+VCtgThQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
	b=G2Guj3XF8vlkj6MuwGJ9m8d0N2aT2ubghbKXYg8wLMvqCi4lyPf0ZYeibiM0KWm+lN4e
	 k/t2veG/BADZtAA58m7xKEIayW7BHy4MDqBBHN1/Y6Iy6eW9cEyHAeowZ4OJ6jDAf7DV9
	 Lz5U+ot9xcfTqv+Hk/HRmMQysj2csvVZF+ltinqSB2Z3b5F9S7qi3G7Xarvo4BX3IKtRV
	 7lO83jd5gcspUGOnmLR28/6sr12CV2MF744VuTb8C3gwWU5lex3CQfUGmo3DNrUum++Cg
	 5M3Gtz5AJGXgS9JINsIGSG1QZ3C1Drvyy71Zw+Cq9OUr/7wO8oJ6oOU1WliR6/P9hPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPcqZhJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU8VKrtK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90971606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90971606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPcqZhJT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU8VKrtK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6LL3282389
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=; b=CPcqZhJT2wwmPp0O
	gvuEwkBP0PFNw8EYWeesy203Iy+BXKkxUBVpqIfS1ANsAcAjqsor8CrpTve9dOGp
	NLKnct3f3ma5i6K5BPfdT8isxE4kVvjvS1fE2WprBRcTvXI/zYhtU1eGq5gCJ37F
	VH4k/n/dRfhcXtS+ke+S7k52aJhGQwVCuGw5No40ihIke0GS3ytF2+fS4VAsRwI1
	tXcrBgu9tlowR36RkyTkG/qMRI//cfMnpUejm70Fq1A9U5U5NyhcDOkb/MUm/TzY
	4rNQO1u/f+u8jN8aC3mbn0iGxGHP+yZqFBfETEpE0cia0T3Ls7EAwjSWXRkOC1Fb
	Tges2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptqw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530cd3dff25so4059291cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263649; x=1793868449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
        b=DU8VKrtKKYdUSwlhPozH2skTy3uAZvPuQ+W1V4ThT9o2TEHSNYgTIHM1jzlcvE6O1n
         xPpYNoo+ghjUjic7OFXxLFFh2juk7qjNmUB7OJuP+9Eoa2+DjTvgLHVY/5HVDkxxOnNa
         au16Qbrfd8S5+rnbn2BvsGyX/xNeUVVQzCDMXknUjaLgaSovPXWH++SMm8BLEumIEh/0
         yssgqDYg+3TOhVMQIvF1h7fOMU+ceEWPV1Of/Ip0LeaQOyKZZ/hcEiGK6ntawi6wnllB
         frdlE7RTB/QAnwo496L7X6j/7920dDRGWkWBw7Ae0GxjXzBLOae3P92HOXwLnNVxJX6b
         NL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263649; x=1793868449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
        b=iQEQFrK5R5vTIaHlSfEIhTvZwelCu0lrSbidTDaj4tD5QvNNGIeCjMWNU6nhDLwAxU
         9hnOgpHyJVKwed+DiziKEbaCHUZZqIj8Jtsha1pliGkvfgnp48y2ZsaKzqH5Ea5guBmI
         AYqHTbE5wadaCNE9ERwHa3ZZGnybDjvUEaLH9xVi5jLkKNxBEfEpw1BKqGyJsaVqHIv1
         l+6TA47PlJd7M6BGlOzQqKUc8e1RmL2F8ixpuvE7chxMY7V0xPtUFZWgCv17N+rOBDkH
         rP97OIwURFrYX4Wa1mOtP+CtuS6A2mNBFIK89MwB3DH7PIIHCTM5ClfXeoEddRoRwvEE
         tR5w==
X-Forwarded-Encrypted: i=1; AKwUvBxHsAhs1Oh5ZtFX75710o/oOOl41Eo2UdvISs2vyNo1Dt7Ww+dNPesFyMxlXSteVH/7FzJ0M2XC+ogh7DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaUPj0Yj0CMTo10VdSfVlsvBqs8emyo1ZGY/kUJg/YZgKm5qPi
	He6fxD3bnnGqWg+4VGpO2VYDEeUpEZ12boIBQpClBogJr25aCvJapQrza3+7iP6x2JvAty1BPDW
	edW9iBeznf2aaOAjZ8jSIUA9n1gEkUqvn6FAGgAs8bmjB/J9+MilybSLLsRDL5h/fhCs=
X-Gm-Gg: AYBFou2RWljy8L0ZKuimkOrJWKjFj9RtrM68PG+OiaNTxb9fWjH3we8Kr92cPQP6TYA
	K1DvtBY+UP5DNB3I940vLZjypStOErkWhMm6+DRJhWWoYTzCrJz5LAqEtkNvJrc4F6pv+qOjl9A
	kDgVGkR29SisInQMmbhw1AOxBQud6JWPOfpc1mdyAp1q0Xtw9P2Y5Zn1fS89/DR8MTVs4HQ1uZ+
	OV8BqaEic0sm0BAV7fwhlVkTp3jzSUoey2UlDUFicL/VaUdI38JwEgJZqV0K2zYyPzAFkOAG5Sr
	QyehnJq13PajOdEyb180bZ9/nJf0DMPvZLlZQ3/4hTH5EcoRnRJ0SKi7LnB9x5OZd2lYAZr5D+X
	IS563UEPS47bojWUTbMUXJ3Z2E5IURRvWTLTdgwcbUDGtm6K0zYO+Cc9QNbLJj+4idaUIw3s=
X-Received: by 2002:a05:622a:7a8c:b0:536:662:3776 with SMTP id d75a77b69052e-53fcc0d944emr91974201cf.3.1793263648853;
        Thu, 29 Oct 2026 01:47:28 -0700 (PDT)
X-Received: by 2002:a05:622a:7a8c:b0:536:662:3776 with SMTP id d75a77b69052e-53fcc0d944emr91973901cf.3.1793263648171;
        Thu, 29 Oct 2026 01:47:28 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496459f10sm2495969a12.36.2026.10.29.01.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:47:26 -0700 (PDT)
Message-ID: <6eeacfab-95a0-4352-9c89-51a374408091@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:47:23 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1ZlHoJDHtUz/
 cRbM7I2bLAAaz3j31lILXmuo37/WnvNe1V0QfaV5ezcGRyq0bg6O3wlU6f5pRRRHR2zHNTmOkIE
 6W8CjuUQWvLV8X+62tG+tHcJoGu3Oj4K8UE6+X7JgMqYGZGIr0ZoPHvfpvJtE69UQzIzFcmlkPq
 DuNe177sZZuQssVjfZ6OX08lr1nZ3o1msacyO9ZaNCvXHcb8q9k0SXJu36Uogzg4Ahpy40Wou7G
 QV8YjQsDaTsptt3F7jITaLeP7hV1/QojPktjDKjZBKOUvkr2jttd8FEVoOSSD/Mn4o3hveW+ImK
 omJ+jV02Ou9/628V9D1rsfng78iron5oHno0Cru88Y38wikpBQHcCIVy1VvUeHGnLmp3kTaQJ5F
 ymXpEJ9KhgNKGRNRq/6P1GQYJR5fwSRvfvFrqB9w6tYeh/XtVQl2/eBeS4pGjfRqThslOhcAcPo
 xpjWoswxYntHdYSKq1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX8eQ5p2E2Xork
 n9CXv2GtnlpEOfJ1t3KOL7VsyGZ563bJhzlZd0zyHP1RMER8dOEg15446j+FGn0jYnUU6SEzXeP
 m1NVROA66vwEEqmhuFoxCAgVUudn560=
X-Proofpoint-ORIG-GUID: byOcayByK5vCZ6CaoPsXVGfrpzGyPxGB
X-Proofpoint-GUID: byOcayByK5vCZ6CaoPsXVGfrpzGyPxGB
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30821 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A8FiRQsTqyrrzY21g8QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 10/29/26 9:42 AM, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
> ---

Fixes: 073c6a891eb3 ("arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector")

Konrad


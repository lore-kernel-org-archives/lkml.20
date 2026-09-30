Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5A4B8298
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766309; cv=none; b=Pq5Ybm0w6u96pKMk+HpYbUqTplHF1GpAiNBFr8uX8jg569sB+VSspBXeidqV4TDWZEWk18h0Kyg63X9rKJR1eBvx0U2ACq/zGUpxobGBj25zi3x70amoYH08eImJJg0Tx9qXOzcZl0kWQZA275AifJ1OE076MmDxAUTAbHKuzLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766309; c=relaxed/simple;
	bh=PknkWi6bFhwMmqL8I8ZmnWoNz4EVuxRbnexTR4caDrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aF9hOFrpolyC3sE5luVz2R9TlwQAt7bL453c8hdurjuFxYHrQGkeDPf6HXS0DidESG8ZOP0D6Ffhe/Jzzn9W+zdn+1Qdx8O5Nk9YdNpfT84lXt9AUb/+F4CaNIOpuq/MxeZecYM+141uPT9zmmGGXpNhbYOVLPDfNy9m9rwcaZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHeFITAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkFMj+wP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHeFITAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkFMj+wP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UA42443414728
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=; b=dHeFITAhIHTObKce
	Xg7F+2RFwKge0dwaq72OL/lufzBzlUlWrTMVlUydLRi8Lb9/nyMcoPkW/RU6LhLd
	V4Gwl2v224CsOwTQxHejRXDbvzuPK/2mEw4C2Ni+/8RGBmsOP0TiHGzhEsGHWCot
	E0VyxGJ7xw5hpptjCWezroEa+xZ1qgVDvS+iaXU0WFcvVKP3kur41KuJ614KVZvZ
	XkjttkJOEPBSmgmKxuNsepYCZTIWN/DeWWCmGTLQfiHokMdzz3CeQsoSNwXr+3Cx
	KNSaBjjwXmetibIFcg46XBe6OcmRMk4qwRs4HU1xRczYr+1NybwpeCRCr8PYV2pN
	enSoyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk88kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53320ebbaeaso8135671cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766296; x=1791371096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=jkFMj+wPAuClE0i+btfCk+hasVTs6cUnOsTZJdEvu29+T3K/Pbm1Q7LQwHaiDFfpPA
         hXyPLcKtCwosKJQXuwrb1q4YNHBmj3SWmOLFiubrg2rK6i/ypaap0iPZJr2MXynjPewp
         SG0V+J5dI0BxCPHaQ9htEVgaaCo7obHJm7GwGMnjR6Gp5c6MEI/TgVJGbMJd4yLFonhg
         lEXIAzCxgA4+LW7JswqR/7xaLhEy/QJCHa24pPJWKqMx1uZT7ABt3V+3E/dJRjqHie3k
         BbpNDNPVRkUEwIgtSueCOq5DGuBEA2pQytceD0VEJV7K26TiGY3Ea2+Yn5VGKGuoZE4+
         eglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766296; x=1791371096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=f9yHCY5kfW7K76k+KDhJESl9t/nqc1M2XAeGU/p1zDt1Ux2EyhlBJGpqXhLvNLzelY
         vlXQM6bwaWY62r4wqzW6S94OcPeLKMKz8s7xlCAK1cMcgFz0OU1ig3TGX0pYfhq0sIt8
         sEOHxle8rTZhVvW/Z+ATxcIzbw0inqZIuDFF0hyWFqMH4zzCjA4w3xkiCkfXcIRhsrX2
         RKj9K6FgGvVaVWRBC/suynw9rAkSNyMeMyMEQHUirPFASYm7uHoNdj7THO2Zbi1FRM6i
         zvGKIOnwq0Du2jYI8shypYhGW80akN4Nepy10njvhI+exRvgSz/VSaIwitGzF2O+NDzE
         Wwjw==
X-Forwarded-Encrypted: i=1; AKwUvBzh1lPuiNp8afjnWCivkhHugna7MgQ1xw6hAjf1YjEexrcx3I4OOs7Hggz973qY/k+wQtlzzvKbUB8klqo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGDHMORk0ZjgJW8H/JR5b/TO75pupaBVcR73X7whp9LjDG9qYK
	7XwxkMLJDxgzbIa29wo2u0hAFmmhDxnIY4EtoVGyIbiS2pJMvIo9IICyBH5MP3iedvQutnt23lL
	8HnASRX16h7OiUlpRZZwzoTbNsyMMlWkhgbv0rcDKYBtHPku5PH4SAABsK/A+rV/lwuc=
X-Gm-Gg: AYBFou3Sk5295VYDEDNUgkh84DsaDEbfiQ1UQYvjTqxpYNNpOUWDHIw978qTMSwqhq0
	DTpI7jVAosiZx2X2UqAiD2qsXf4/LQ517UipTiD+iK3sdKk1IwzT0TfJnLuMU1dnw7feV7yuVGM
	0dNwvNMWZBTE0l9CuBwDyferTSVxPg1BJcqF67nW3w9wpq8PFrW52Zxsz0mUsJrC+HNZDjw+QD9
	PWnurTgVh+CqZ1blu7yNMhGbjQcQFIN2/LgbnLFKHdCeGdw4zeoFCpPVFgIknNmjkwVX4IRrKMr
	v3qi2B16X4y1Z0VQW3tt7PGpIMESSwVXX/wQOmW6cP8w0jXa7TDcb64Fb2JEQOv4C0ZPcdSgi+7
	4gQadsQAKqetSOYrP+Tsyzw==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146824185a.6.1790766296355;
        Wed, 30 Sep 2026 04:04:56 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146815785a.6.1790766295693;
        Wed, 30 Sep 2026 04:04:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15395755sm604092a12.11.2026.09.30.04.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:54 -0700 (PDT)
Message-ID: <87ec94fa-d692-42ef-bc80-9ca485312c88@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jw697Fjm1AXE4EiSlhCR2zEGEMnXo-G-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX+VBWiznnFuTy
 1C4OOQN3Oj5RiDji1JhRZdCFDeWu0AWl9YoS4X6Xb6MaLKssBSQYgq6MNZsRV9SJ55iM5xRapTe
 c/FYrK8K1qviEn4jXJXkuVXj6L7rQfebJZfyDkhIyJ8jgH4ozwJC9FPD1r4mvtVy6mh7fG6pCBF
 ddYjCIMqlv7J0rfrQ4TjOVHL//l3Fi18F06BenIr9X3ClnZwy4mrWx8+8eXHdcDirXdt7JEUW7k
 4RSP6bPnTlV1rHvUpzAFEPKdFSPAgG+psO6mR0zBEe1OXrOGEWCx2uiOXteZnzVFDOKduiCaWpv
 w/b9A3kU5ZCj2yMMhYbus9bhGt3PSY+gYalrQJ6Zd7FhA8/aFMPhr552WUDtGmIoHcEx4FgrMPJ
 ncD9ZS+0LoyB9jMK/duo1L3NGsQAT9O0IzLTH3BffxCyh8eFAIdDZIAdiYpwXVbJMIsMQ+YsNh1
 uz2BVRvzf8+pJiFFXhw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abcecd9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=APqY-0NjVA1trQotmb0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX+LkQuQIbA94i
 RNO7PLc9MOFEK9mArNRN7sZAUrySGuhqGPUB8PHJ/vEJkBDXwhMX70V8sfjB6GgMODNOqfYlWXZ
 BkJi9tX1yKq+X2wOE1zJJP0JC18f+P8=
X-Proofpoint-ORIG-GUID: jw697Fjm1AXE4EiSlhCR2zEGEMnXo-G-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
> connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
> sensor reset pin states on the TLMM GPIOs.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

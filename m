Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579022;
	b=S7DxFN7Zgt8MWQn2LHa3u3VB79VbGAiZfq/FTKKWbZLUbnVbWjsboV6msw81KqB0tIlD
	 Cz0nZKlS3cYNTXXg6vZ5gS9Wa7YP1F1AG9vLUuEob8bvqujQH0wdwkzWrlCkF1M0bmFqc
	 GFc2vqEa5sfcYj7TMhYNpvh31JqKUbMu0OoSTcWhgoiwsRwZeE7qx00xY+iDE0/mC95eH
	 B09mhKyy+q99GlUGYWSGLogoKykN0XbLD3pDyzSUW5mGakRcTEL1OSjPKJj8dFCEGfCS8
	 mdSxt1JMTlo3d9jGvnosUkb4aEWw00ioiKa+SaCrRm2fupoJplvv6LzOrxtgT70Hiaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
	b=cahI05aaMZOQPf1MFxaSsPN6VfnK4PrIt632GDFmZw/JBlujFdMDeV12h8kNzmNYzWx3
	 ZMxTiAQTzhHkfsXZvfQ3sRstvwPJQpn6KYvijr540GKrfUF+c36aDtggLRucll5f/Mnvk
	 u/LoUzEm1K1NmHRmuhj+D4O33W3JPB2F/KiETiHGGxwcAJogVcevqJO2Seg5DcMvtEJIh
	 k2idNFbbLtNIOsxlDgKTFu9q2ILD9tRcpx0isXhfQ24JddIEqAPCdzvjZfUXtoTwHGSEl
	 jWeBC963YrqgIDPhZURQ0tGahIT/3QjnF83zPYsQSEUhCaAYXkLQ+GmBJYFYWPUKkjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FB606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5jPJ335274
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=; b=lYvByqasiZYQc+Mw
	9/c0oEbK5E/s858jw6UQLLt5Vxr2aH6UxMfnu5Jx7lJFoQWeVWsbSIwveHZ+lSl9
	BWBY8ScKgyXvQKN7gEW6k6Zbs3JfdemxEcmy8N3PkShAfpI2MfD5ODL3X1w6GLgc
	9hOKQ0ybQDCHAXCu4Urc19lmx2RWHh5Oo+QH5jEudEH0WBbHmu25KygHnESqQQqa
	qA6H3+EhZWQKX1PZ9HAsicRBZvkgmQD5b532sluXsh26oYKyb7qRk3l/xhnTAUv+
	pQGiKyPAsobOXzTYG6NIzoHfKFyrVBVMwtQVShHhHaMnwCcH6RRQnlTMhuW9yM15
	43dK3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48a72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:37:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso5459785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579021; x=1793183821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=B3AhXMHEF/HDQ81BnijAdjSTKZMV9rz7FhK2ZdDoNjtLGQ+CyOr7nyLzXN2/76NaEx
         G7soBe9KLY8Vk9gdg9JWA1hvl8Hi4QV2RpR5bRTOnYc6//AZkgM/2dxrJYfyjTDrz6/3
         Vy+3/yxYElgQIKlnUbDuo3dHxfedBJ4Gp0Zdj5aCvT8tcNrBRt+xIDfclMe6kJ3xKiut
         DZG5wnTNtZeiv7yGCVNZ6TU+3zBoyynylSL70nuAoWqaB8VAQaNow9QBvLlUZZ86DGLN
         0HED3V4oMHUnNiXwF5vXBwrV2YlAGp8D5/LdZ0qml/H5wEckG37aJ9oNgvTpzMNKRDxO
         zxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579021; x=1793183821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=tyKqPemq3NjmETOGEWRSG73huOvIO3cZl3Qy1OkREaZPppSA2jmc7kweNnXj0EkL2a
         Dr/IYA6guCgHlMEF5RfqcJ36jY4+cmY2pXwGs7bxuz1RZkMyoTTRV1XQj/88h0iuIfLJ
         sp7pY29QN5XC3NF4spo6pJjUPXBg0lvMZJp43WvL/PZg9QOf/ozteFGdhs8DQGedDIAb
         FyIgEp9gBjXG4yvSxJKltsZYu3ihxLusIgPDhHV60Foneob0hsOfLG9Kg9dzl2m8FipV
         Z7CKAGXjgC/8EvdMAerpegOpY2i15L6hi6/Cnm0s9U1k1Za96umkk/Knqh2ZAw+K/l6A
         PY1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzp7Rj+KKi8c83k55yVPfmP8elQmi7Z6XUXNlTMfKdyb1kKQWJEEkELe/VojgACdUNW+q3Id00ldtL1UTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZssdW+49to25dssJDWCQHkbWywGUGojJFbc6R2ofswF4eZlHi
	Atjvka4lgfO0cGUR/0NTCtHLispHh9zDmeWTSRJ61mLA6u9rv0zdvBWKCgeSNhJwMe+LBUEMLVj
	6qnuMaFt/34E8TwL80eFAqfiuLaX8AF4lK1tJnzWt0b9lYP9j2pX5eyOqtqu5sZ4Z/VI=
X-Gm-Gg: AYBFou2x2ltfsgQH8VqSMwFObkn2ia0N6ZuMOiwJPrtQmtM2tfkDyd3pVFtJPdegugf
	qkI9vffD7qRnkhpFj8wE1BAJyC7NColYXtYZ0gGwL214d/9/04De9FM+vRWiSjFDiXYM6VVL04M
	HSrNLCcFc01T/9mo0Wy2LD4qfRkI2AvYSPMA8TmauR5L4eumuGzTxTh8Jxxe6rvkMnRtIMfrT9u
	Z2RsgSRVCZKeeARHUAxDJy3fJEqyIYeTafMWPOkdaltVsh6SBYPrYhxx2qfddOjMHJTiKxtdT5a
	gojJ14bkLvSgf7GnK+YjInSMM3jyMQ3A2VRlLlH164EmuM/u180rQEnxl2Qe8RKsfEh/XPDFIWz
	xPTWRgEFuot2Pu312u5a7FA==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417907585a.1.1792579020730;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417904585a.1.1792579020322;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dadecsm673656a12.11.2026.10.21.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:36:59 -0700 (PDT)
Message-ID: <14992ec8-cd5d-4245-997d-4b5ac93d0c46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:36:56 +0200
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card with
 aw88261 speakers
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016073157.611956-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W11ZEVUV_6QTHhjiJpb-aYNTD-HkCtYW
X-Proofpoint-GUID: W11ZEVUV_6QTHhjiJpb-aYNTD-HkCtYW
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad895cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Uo9H-UCNI7IvtxD39T0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXxJgpYOl7IUpB
 B/ySGpc6qYw0of/TIuExI/76UbZTPQQGJ+FduDgAR8jONkICJsA29xvHREtezKjuqpbDxYsvDZ7
 XlySnUTipuAk3uI9IWGK10qHrLyEUVXbS3K3lQ8QeIrfnCTeGtymg34bGCaSz5YKGw9a5xLJvu4
 DMRWVgrA09YmdaAZQdFlbbzS3CiKLKHaWKQeTSUkXymbkuMwDb3UKgujToDRv8OTAnYkp4VU/Sy
 v33x/ZY8bvTSNd/Sw/YMBQfc6bkIhaLz4q28ilhdLZ6KDFDwoo8BzJlCCbp+RMgRR6/21n5KKUP
 ciIwqwS71Rhnh8ww5xLZFX3neDQKgq3hX4QhJRlpkossBKeS4nvt99cC3VauliAtz5ljqELznUc
 uxA6NwhoSIvRBrfa9CR4v505UlYkny/M5QV5HarpqhjI+GAj7vknVBOgh8UjbdS4bw1viJePk0c
 0iuGU3WD+YbLyINhGMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX2wJyiOFgpW/f
 BjZUl1KXwuzL2s0nqpwtMeaXETiaPSFXOK5mc862TmHQ81h53yrPDgVq/zjCmZmRGTKiTZyAxCM
 y91OmNr0z8JU6ksWljNJ03RHSN/qo3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 9:31 AM, Val Packett wrote:
> Enable the sndcard node with three MultiMedia frontends, a USB offload
> RX link, and two Awinic AW88261 speaker amps on senary MI2S.
> 
> While here, use the correct compatible for audiocc for this phone,
> and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

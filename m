Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116532;
	b=2vf0bdZMJF8VpCGRkXDtC99TPcckxjVeJG/7xQ7oAQvwireDOQHoS4e5yNqXSJwDbzxx
	 DrNyn99bEEGsYDKGXm8A6UHUm2Rngl4tQwUePByBXjEu1gy7+Fv9Bt+LyOvVw2KAL+c51
	 /yORCZtbPb6wJ+BgyhRibZZmnwJ2o1mPwSOv+/rXKZ89PGw8N1uyjsIMoQARSWoG8vlrh
	 jLD915V6xbEl6JBKplKsUGw1Fj3GrgdCor9RsmLtHn61NGWSRB+x63lQp98tHJhNDGXIb
	 jpL/yl5WI+9/DLJr0hSK2Qqevid9mA6HVRDi2NdaV6g3QtgTNOl9QUFf9Kc4mlDwdMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
	b=PZ5171IlCqjDE3ydahfL6xEsyUbH9w9BNbx6jVUyX5zhZNwULAGv9tYIOtbS9/r2LO/6
	 q9fOWg8pvxjRKdCcO+V2yaVJJrS8x7aAvW37i21PFx0BHDDBsMxNnSX9Au3P+4Tf+tF6g
	 nnxlnyA5OsQz/SXELeLMuTQfjkIgAkKuVEhptPquA3H03myrgOqqj2iF2/JnPQpWwtMus
	 8EQLkJBvPeGUjHiBQr31AMQZJJg4WORVtVoWY0sg/EaXSn5b2/pgpqfvygqR9tlAtfqr9
	 k6AS2TpBjUbp62rA7y5kNuu6uAmk+SGYNy8xADUyHohOnnnb7cV2jdfu3+zFdnpximA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ifyqD/Jz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoP5WzMn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CC5606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08CC5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ifyqD/Jz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoP5WzMn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFLCbF3086314
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=; b=ifyqD/Jz5Qg878rG
	wDdiMTJvQFZT5tsyzXWQsUoM2yM+9QbW1sU+klAmkdNTv1Dh8hvM8//OaUaVDDxV
	AZpAAz/jKyqluTrdcbkmWbhk/p95n+dsa5huSrAZv5IESjTVJTt11dLmJ4TxmVBp
	ZZGVJvhPwp+zRGdVYISB8C+RwWSp0bEoIwcnZ7PtTNTd1//M/cD0BYFe9iKt5kAu
	GHQ+n+d0GOmRwuxVsy8kCCiAQo+FZcbdzS2vJPSCWxj0t51jq2H4AMKLWwy5hZjW
	nwpEfmOEfuWVlmvEjYE+7mdfWUZeZcJK1iDzRHPLkP8b42eSCn3S7WjALEq5jbRH
	0Nds/A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtb59x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9833e1390beso6863241.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116530; x=1793721330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
        b=JoP5WzMn+6B8L3Pg6e8dFIxaC7tyE1nz2unP7C511FtHiJY0Qb8rlMAaEaHLc7wk+t
         lvB3Av51KHg7/mMJ4FfLCK9KKS8OHseD4kdTEr6kZqnVA9vmxyqMOGwYRipRrN2y1znX
         BSYCDGKojWR8cJlRX34tSwCQLO1bmHCuPX9UekwCEKtUSVKX50i/GY77lEseZIRtfPeg
         YYdGBpTxG7ticANCBbTPOQk5Q5zEWSFjdVfTDhDuItp5p8I9IoRdcs2ohs0iiWNqtuTm
         ag65U0OTFn7jR07feUf/hGi/I7SuIyV5ocGGZmaOBtnF3YkvFtz2lai+EvGbuFptiBNw
         kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116530; x=1793721330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
        b=wWjXXn8cPAP2GGNoHzJfDUwImVjmJ8mRqhxIRPsWEV3IT7kY3Nx7bhOQ9Y1QUv8Btc
         76hnIZD0mrzrj66KZ+znIsKNdMEo1WFKXxopZfds7bL1k6YdOswrNDDYsQRp45ztS4ED
         qM0CI62bUB2DCcjR6g/f46TJQ88AvLhsd51u+gXABQF9KoajIS+iKd1LTY8sJweOR9IP
         Jz2o0e/3nvvGV5GQImAsFcuDaLA+iTpyvGtNbbGXXfHhsrUzo2ZB+SXIC7i4eFrkef1C
         u1JxczJSH6PFYtwWchkEv3j7ojTPnHnvge7hF4qQKe4ou0abD8mGlNC+ea/L1Kvi/LAV
         /R5g==
X-Forwarded-Encrypted: i=1; AKwUvBxZBj5QetSNO3vDElpuIY8vebieP/2PZciDksgoJrbUy1zsiwI5K9vJ4C3GzJ9PAeaMXRrKE6/Eg3TPcik=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/PGaSMqGEcPL2M58iJljRMrL2TXmgGP1xINlE9f9g+5PyV9U6
	5A2Mwnd8oFdnNDmt++muL8MVv7jgFjc+C178vebfGHDMhnne8w6bpvlD5cqCsFW6JvfqCCarB6a
	qWcbrLgHJIOxsjcDdRd5cOsjOfXNWEDu62If9glji81lk1/6fmaggg7ouB8+g7mX27KQ=
X-Gm-Gg: AYBFou0go+IkdM0Ily1LIn5yv73106V4w5/9VQt9+S2/6ihipukEjQsHT9g+5RnfAHw
	E8dRwZc9li5m6qm1+xkKlN96b4sDvztBDBU0mG0/bby7ux750EYzPGtbGbLSWc/r63+ce1NG9sz
	H8A4xBPG3R48v3H5i9+81SP6EILXLa1pGurpu0OVtu9Ms86YlcJj6EzrDKKidvjDKPH4C3F5P4p
	RW5hPDDSdm0QRTn3N8LLOvXohDhHI7BUZSg6AhrwtWptY2IbJTl3P305ZbsFqQ/KnVqUet9pCAm
	8Y+tDSyozdr1/FvsToWD+mS0vDDCMzxR5kGNeZr6QRbbo5y3DBvE5elyYBxyNmH7dFmsWCa/cCu
	ClVOXonURfCcQlt6vTRKmxw==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr4623219e0c.3.1793116530143;
        Tue, 27 Oct 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr4623179e0c.3.1793116529658;
        Tue, 27 Oct 2026 08:55:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66ca8asm483938666b.57.2026.10.27.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:55:28 -0700 (PDT)
Message-ID: <f165e4aa-e6d8-413d-abb0-c2e5045109f4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:55:26 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX6XKwRMkgbyja
 H4zN8wPVjwncz0XgaFA5yRFDqj9CmQ6Lu05Pka5UUA+gGNPohV1aCIp2pnM6aAsfuuBlvbqUAYa
 3mVzgQ/RrUoQZ70Kf3HJhRBVu4UjbBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX0UvkSyfi31KZ
 EZ+5H6Q+4UdoKEYrrtXGSEzr9b7i4NlBOhyoAX74OcDs5Y6I5A61kIUMkUvmfEpRiuCxn4S1cuK
 T3lkw1sYN2ULEmziWBG3wo211n4GGbBjPLgRrE1ewsfIF0VQQo383GL6T0CS9yRzebz7IT4IxtI
 vIwJNSlRpdVK5YhwA5YWj11b62SlFNvU+JLYrYJVwRiVaRn16eqFD64dYPpDYtTMrFdr9Y1ITCe
 hm421XCFZS7hlDBjzKlrRnKX5bYdQOLR8OeHZA/axFTJGOmbXLF+x+7wd4PCCt92j/7Mo1us/jY
 W+yo+sJtqF0d309+/KJQ3PJJyw2kL+OcawyVhBR4Tt8hBDBg6zr9azOdkbP51TsmOZca7vOnu03
 7euqzy+4ZgjvWbOyyJy5poVVZPZsrw42ne9/HGeR+EqcinzqS/wMsQ+wNxZyPt0Mu3Nu/wW267L
 xbhdcW3OiwV5ymfEt3A==
X-Proofpoint-ORIG-GUID: Tk5e8NQ2SadXR49RvOV7Hgg55JnuNKl8
X-Proofpoint-GUID: Tk5e8NQ2SadXR49RvOV7Hgg55JnuNKl8
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0c972 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=q8tHnqZ0nZ31iGzolrYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 12:49 PM, Sivansh Gupta wrote:
> Add initial device tree support for Mahua QCB. Mahua QCB is a variant
> of Glymur QCB but using Mahua SoC instead of Glymur SoC.
> Mahua is a 12 core derivative of Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads, power
> measurements and oscilloscope-based hardware validation.
> 
> Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
> adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
> nodes.
> 
> Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

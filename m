Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620769;
	b=LohIvQpgO3TTKkNHqJJhZd/zqYNcRnMwX84u8jvT/Ud/EqP5aaUb+HWvKPSaSm9GJw/S
	 lxMxYltSV7urc5G5lX9ZAtnCYOWDUldfc3uSBI8TafXK7D1mjmx2AHGFUDc8VSE7exP6m
	 0To2El1XuIwAeklzv9G53vsOfrOnqU3vgQ/Rigw+wgD9swoTu92TChUArDfzulCTKbsVS
	 2xEsdSRa9r1TuHjtbLODG8/j/hdjl216NwMBSoWqoY5HRFsAbHreWlwV+d4QYP1Ou4yJ3
	 v6YsmFaLEQlS28YyL5ewpZId1p5CfO+csGUcxvk/g8nSka4AlaKwDmUHeFZ6H180URg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
	b=n0jYezU8vyA1XghaR6I56H4asI8iX9zlttwPD5FOTNnzRcXNdSUu0mtAQLFdhrbgHPeo
	 1Z4/mWw02SDEzjNHa7IYMjKli5eKtfC17q34uHLa89i39Adhjoi8CTMLe0ntcAOQpyUca
	 6ix0DDOZjwT0c7RZPGxSGSDLi2o8SfbkP8nyKN9+qvt/Umz819qv2jBAcz8Y7uxVKjE07
	 0SV5fluHC5wB0XX/jMUqF/fZGhIP6fAhRNp2EC610GOGC1rXCQ1lIYkCalIColyjRUeWC
	 YdBkdNhtwPdYLYIwBIbnF/9eCIa0Tq67oIxQyP+j1yKQ8lHMbVB2av8TTtTmEtuFQvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RK2HHeBj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZksFjal9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079CB60A2615
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079CB60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RK2HHeBj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZksFjal9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2vPD077082
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=; b=RK2HHeBjVeFnidnU
	oFUwn1G0rZsfbDoIOe1mDEJvDU6WhYabIXrOIvTTN3R43DuyYCZlTATTzJu0SiS6
	ynVHCuAa+dM+NZEwSt2Hf948QH2vcvU2OZma8qirKGKo+vrdU89NuzdpF9o6fkyf
	uHsre8dliUieMfKhh9aIBZX6QfAb1ioWU5Uey32f+40HX3kw18Y+xc3awFjLnBf8
	kR8rxv+9y8z8bFmREfbNZq0TG26DM0s2udi9mh/0yYMXukXRBXqeYE+M8iRoWNWV
	eA/GNeyP5qGN2Ry+kg4OFlkQqU8BVhvseC7L507JppsaenXY9J4v0H0Y2QKJZUhm
	LzqRIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r5ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:59:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c82e9d68fso8447576d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620767; x=1794225567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
        b=ZksFjal98DY9yV0Lt7N4y8WWqPO7SWiJ3/U0g32R6LF1LXzEcq2DFXG4Hi6tc2lcwp
         YeoKB01JuRGilqs5y0DXtfB1A6eTe8FYRkrnH2SwUnojSMErexHVzcx5Svhs7NfAmZoO
         o9jJdTfotYYfRjqtZiCVkrNXRHj39WzkfB4nT7kUY6hiqauKjOjw4ZBhKQwd5YdTPKld
         Xs9+0QBztamzYvX7AplN/SdxALJc5aZzPgCxbNTY+NCwYQ3CIRLC76FMGY0MhtnAIhRA
         6GdYOqkWNV0+JkwoDXhQ4Db8ECucEdJESmUsweVvo1F3DI4lIpHN3cF/KZXmNHjulkPX
         RYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620767; x=1794225567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
        b=dGIa6b5bQ8wWOYT3ezok+A4v/C/GTilXyyfKf4nSqJ30XcuyhpXjHpMNbkM2FDA5rd
         6P5+kTy0QAdp4na87dygt1n3Sm54cCno0dGweFLGW++CDUbnPfc2sn0YZros2RX4E9W3
         q55AJg81h9r3ibf5HZwIX/jpBLKH2wtjt7Qi/nryMFFUJewN8scCAc8XPmbb5dN3qBHK
         9TnSdXu134tXCTvm8WnVadDyt3xxhrkk4Jc7zZ1dGxFxXAb5Bv78eVw7vNqo8gl48/rb
         YvFkGKBiy3UDaUYNv6BYhB6Q2fvYPzmm7ZtfK0TWz1PrgT3dPz0yYRHn5OUWO9X2jKas
         3jkw==
X-Gm-Message-State: AFq9FYIEQgGRXnV6hH8ibLa3WplOPJQDu4C4bI9usJMAKg/SHfhTofkb
	18dJho4zPEcO9z1gcJxsldbY4BkI4iYNm+LHnLn6uaBMJVFcuMNB6zNYJ4agzq7P854OwTO7qWQ
	sH/kmMXckbaHICPLm0PZkxRahjsA6P/Yydbd+uNBIlYh1A6zAfLRUEEHEBn4O9hygDMM=
X-Gm-Gg: AYBFou2eKeWAgEg4Im/zzan6VvO0kzZAkHj2Zlp/4FJieKk8xQ8uIsvJdZj28THoJeX
	ploz/opwMFvO2MCbsV5OkO0PoASm42O5EiUA840X0r+ROUkXsVN2eyqRydWFrZnfBkZpGUWdmjD
	/dqnxQs9bdAljTPO+LfXMxD4USj5xJ660LqQhPySea+b9hd4Q09TUNNACS4pjgwd1QLozwGm/65
	yYRvhHDt5ulKwhXnKhxaIh4CYNjFmYcsnuthdv1wBMSxduWdWeQO8qtIjqqxYjTX8VM/I+g3J3j
	ixp8HQ/xA1CL+uTwn+olQD1JszW3tx7J03/JQYwFBCsRG7dgiUO2BV3nSofQ1ZTtUsmj6dKYUL9
	nM6IuUWijMo/5HUYM3zq4g9aeX/4OktIDEVMjePbU28K80WCWhkK9m5ZWcItFYaZfdbiK6AM=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1517090685a.3.1793620767269;
        Mon, 02 Nov 2026 03:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1517088585a.3.1793620766638;
        Mon, 02 Nov 2026 03:59:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm377913466b.7.2026.11.02.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:59:25 -0800 (PST)
Message-ID: <44ac4c60-d89a-42f3-82aa-ef3fb0f54636@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:59:23 +0100
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
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX1jOWogflRPOJ
 VMj1UZ3JLzof4jTNaPBVoMkw048Zh60KcsQetbJR2iSFwPUCewr8OnS/FYQbZs0TfAPklr1uNHD
 7OumwGbwfLji0JKYQj9evMgYP1JyE1kf5jvzkdFOP2xh2S11lT2qPh2eeIbZLo38gk0tSAEbHhs
 BXFVaoLeWv272Y7oY+CmIPXzLT+tdAlQFqdxzkzB+gnQHmFlCPB9XEqnv379LmY2wPLcYva4PI5
 V8+lRbTqG45g1r0ShU/MwavgxurlMVg3N1vpfoPbB9I0eLqOggswMsdbRQaZXViHJDo4iQxwvdB
 g1yB0t7yb8IbERrwZ7+WUDIvpsL39VDXOAuex7loEAruchZP88LLOanixzFqUBUJtMXnZatKq57
 TwvyGihT+UHokFBlWERBtVCUnOj7kErVQ1BrN0Cka4SbLLU/MqzElfEhHiiiMouc+AmB9L8/I0H
 MQbMC5K6HgGrBu84ZAw==
X-Proofpoint-GUID: Ez8pestJOQDYwh6DSiPT6Nq6UaZs7e1D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX0n26WJvjvMx4
 cRXMwsRGOW5528Z3RWtV7aqgJXX8vto0bvABgjONwCDd6tJKuzQctk/QT5FcPUV1tx/lN7eoyXW
 yrT9OVgvPoMhfbQHTFDHI3wtJPd/8Pk=
X-Proofpoint-ORIG-GUID: Ez8pestJOQDYwh6DSiPT6Nq6UaZs7e1D
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae87b1f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=dNZ_EX_IlpB_z2sQReYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99162576ED4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097629; cv=none; b=FCsQBwasIHDhw/Lso6VfoIe62ZIOPXSarm6vxY9Lxqp1Sk8JE3MkMgtw2Sw9RvZixt+rshrabL9ny7qbor0GXa4nf86l3YxaL/zk18NEswc3w9f7JEuUcUiFCVcDlG6R7FZ+5E4frG9fRPsQwZ8d9Bc9/pbagCSZxehC7pPDPp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097629; c=relaxed/simple;
	bh=ZgSvG6kKG9iSmJMEuAW3BWVeHh9wVylo4E2yoG96D7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxYumpZsMbriTGTZFKEz7R8o9RqUJnfB1ssQw3bZwPjBb7qFpir3mxZHzDH0utaREQ8LT3YRJkLJHxMrWBb2S9l2TGIINuC2jQf0fPAN0/intWE3ChrnSG2lm0yy9CsaSgeDyBCOgXSsGjl/0MYiVWYV1oRk7MXdRXxRml+UZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLH/+QUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btmye8Ng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLH/+QUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btmye8Ng"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjL0P318103
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=; b=aLH/+QUrcKEdduB1
	g8hbwD/QG3Lz6Kv7wEz87IGYoHZhTkAbB+/26So2s4RjiWefqzBQ8ViVSPuVHA+X
	D96kFcu/jpSnnrhxwl37TbM/ebJsDd0HVHzNDafxcwS7wFd95Q2LRCOYzYr6pcro
	6ECt0jJZZSIf+t2R2J8+tJY6jJB2Sqly0Zycd2EFNzVbKhsqdy/oy+TL++8Gluev
	fedAW/8OoClqepQgz5usalXYgcRRulEOLllXxid86JjbG0rmHNsllFjzMQ9R1IsR
	6NK0wU4G1Px7lqTyZjqH96UXE1vMloDa5dcNEK3v131c79bjfkiXemDUqbKjbio1
	2dsWIw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqjc9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:20:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7348bd56fso190655a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097625; x=1790702425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=btmye8NgKa5uy9RvFU6Y+kq9WYU/wrOXXzITZ0fXLq4P0GWfZfsVfvxyBTb2d4olb4
         WVkhH5wBky+Na1FluOeAzpd22yV5BNCUdj7i3z1Qu822+gwfIspxbjxC+fIaTndvxlhJ
         e+quch9fAuQwApx/Y1F7+XNzoRz8SBbeCdL7TJR0rMC/ZuNLgdAaDBBENK2LIIPdROs9
         Y+dEyjoKfBLoH0FeyYRyCRahT0GhBa6jen/JkG4mvFF54xIJDi0nT1UVrreypxuruNXb
         HIubUJcU8NjjhymdBBcsFXGmVLdx4ptYAeIGF3JlVYewywJkqwvfTZBizDZOWvBufFpi
         2jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097625; x=1790702425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=SD0ffR1+yJ47G5xuFSSBqjzf/8KKhy8mbE1G42dAWW1EVNwfjFVX+T1U5L2eidJqvd
         756pIkgQbpOkRoOsbCgL1CSDt0OQXuutb2UsZWf1uqr/Mk5rifvnIUCxGAIZId1MuOIk
         htK9/8rMqwRgGhafBATI1jncPwElhDz4S6wQTLoAJEmpEgGT7W3mRCy1UMxI1be/rt2G
         pr1oWtkl306Qg5XG85mNTS+bmOU2x+wxIQE56NpfZnjwt/5PAPtjnmio+qcjRWt9rwky
         Ox+HuGFwGUEG9tiShhWcKtWhMzNmA6v7rsvYYO6Dpan7f61mL0x/Xpk8lg13UhC398vB
         ZzZw==
X-Forwarded-Encrypted: i=1; AKwUvByy6mxB2DaZYn+A2qml77h9zp4J8bbV7I89+j/PvBvXfNnpCEaPZ3EAEQeTrpyVQSLemF7uB31tFxB44cI=@vger.kernel.org
X-Gm-Message-State: AFuF++k2oK5ysxifsjNp/pPzbQCIzaIHciOES2pZb6PRkra+5qwfiwqb
	cZIG6q0pcYbGb87pP7K5bgtetvNF8Emd+l2EK0r6SqQTVnb8g43Y7Wf8u+gMvrLMI3Ed80yZEKx
	sv+DtEoKDfG4ZiVbvVVcNbTH1gxiLbBmilbYo5sLi0w4KYs0ee2dynsLMLeM5RxaFs6E=
X-Gm-Gg: AYBFou1t/YhJkWk+y70ia1UBe257g1GMOIlkVFtdlaSveox1UeNOq/cBmMBpUaxAL/+
	V0VWc07FZWoczIWTrCUC3JcpWvpAWD9zvfy1PjVyAldPrC8d+Y1s0NHa8ogtNaKkwv2oB7lQx+j
	v2nSz/lqLJEVxYc74c3DQcvCCaPiIMQaqmlnTLGUigkckhyCytKI/Yj4ESKElSX09puQ7kcURm4
	cRs/bekNna0zVUa5rjRcza9eF/Tf4LnGcB44jXRU6N9WygU7PA2GV+1NSwpSNJZ8q7kbKUlQG3X
	CYBmZ52D1+nc0x8FTRSI5w3O+DrlY1fNVRN6QjWNi437HIIwvZ3DADHaRbzlw4vxGg8SryykG+z
	u0/DHdmHwxFSruCDRzRKsuGzy+srIDw==
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129804637.38.1790097625359;
        Tue, 22 Sep 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129761637.38.1790097624786;
        Tue, 22 Sep 2026 10:20:24 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a1d386sm1295837a12.10.2026.09.22.10.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:20:23 -0700 (PDT)
Message-ID: <39ac1f45-057f-418f-bfce-917d968eb495@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:50:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
 <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX0KXmo+T/aucl
 PM2z40yrD7SDor7aMjGdGgwRxjumZwLOpZEXhZIn1PL4p8kgnSijk/IarrzvOemsxHLcZfua/53
 BbTIigWC2vDO7xZGcN/xHFa90dLj1N1QRt4+JUV9Wu95n6vt1Tt6jGfgQT7XAOI5L7uCWA5kehM
 JUChyvkhlpJSYLoDqr8q7+WT6bgM1kyu3etqi4l1I47l9ac2jhpD3wDCf0+1ck94rCcwISRgEcj
 6amduimxweYzxquwMDpJJcoIV4P+XjbZGdgB8KYDGZbBylFXhgPL47JvNQ6bDS+5ny1WqqBfuNQ
 uXNmHZRjC2l58zFGN2F/5v8jsmP6oW5mqKYFDfzcFbDZWUlbecQByYzFX7MY5g9fjXljSWeZkef
 yTnnXHz1coUp8kLR71e3QlySCjE7c+8rDaL7llYA4Cm8D27u9zeqzi26y9gbo0Yz3HvcPY0b5QU
 w3Zf86Rik7/Qj9zbEZg==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2b8da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sGt-zapad3vFaLHLuqkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kNWc-xQ8VcD4ZGvBhAgTfNM7oENCeetP
X-Proofpoint-GUID: kNWc-xQ8VcD4ZGvBhAgTfNM7oENCeetP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX2V1J5AgeOgrY
 kahgKjyo9ox9McgCsFzN5iaL7p0TwHI/lIB0GsAMHDUDod2q4jKC4xDxYsRrc1MfI5UFn8CgcRU
 5am5lNf9RIgaReB9YtJ5w609VBbvvHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220254



On 22-09-2026 21:23, Konrad Dybcio wrote:
>> <&imx577_ep1>;
>> +			};
> Please realign this vs the hamoa series - define a port in the SoC
> DTSI and reference it here
> 
> https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/
ACK

---
Regards,
Nihal Kumar Gupta

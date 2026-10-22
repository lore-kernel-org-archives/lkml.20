Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656423;
	b=2dHp/jia0YPximNXYZoUOtVUcuZ1rEeNaXr6bRq+24mOZkT6UwUR9LNwzyuOLeaVy2MP
	 XwlcCsv4ligYnw4/B3w4JFYlgCmFWe9Yjf+1G36t93tzT0Wkx1j8Wo8YSk4BTlDFIxP0g
	 JWuDj2t1YxQtA8E20g0P04hIXTsxT8J7RDamgs44e/18QYE0ljE9TcJQ6t/yXDuPIPO+z
	 P43imW02uIJ+OcorYjyriVHhFfgu/4tkEGxxmbNWG5XNxmFoYdCsM0+tPFpFrZh0W8EgX
	 ewE5TiO6J7iRkC5WZVi9IqtWbw2BeBExfim+m4XJsLXnusGurh0qtumERXDN/vnokdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
	b=lP/o2aEZwoq9T0e9ABpaeJlOt2E75G+mOhexIdeHUQ98qf5IOTPMVNA848mBJsZ/Outf
	 pVK1fqZQzDb/bgbmigYXRGiDTN4YUZI4ysTIus2g90OkPQ2f6DZRwdni+aGFhKkVCLpV5
	 SoYIyZt3OjTFF9kdXSOgB+ujLY6ilaE+Qh/gaverG3DK16DlfMYLouVRUFbYpkQnOsl36
	 vOXT9T80PwyWBTPt+qry50nRWGCv/OUl30rjN6aqsCfrQzDnO+3vi6Nft1z2jNv4BAk0i
	 jStv5AtEtgF6d20On3t1SayJj6fMzcR/XuDIFUUdBGwtKGn1K/H5ZJuuWpUOv4njp6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KSoBzz/v";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVQNk9ic;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78326606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78326606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KSoBzz/v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVQNk9ic
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7a09P3105160
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=; b=KSoBzz/vOnEAcmUR
	NE6MOuz4yfbn8o0Cg0oqrDxDbFHNIf47o9B19dlfrRAtxJF0Cj2afROVAAlXLC3Q
	Edl+nwOeTVEm+h+0YuZgEk+TnJVp/jSthZwtSR+VRHbw2l7/MRJEMg3YC59U2nlC
	9xLyJ68E0sLepg7YeeIggd3O9+zQeFEqLu1sytKEwW5nGw7p5/Bqwub9MHynFBvT
	yjczSTOAvx5krExocE4+DjrOS42RRJOpZpr63xMCGS6dB11mSid32pLt2bNgg0Ag
	UGP82t2ubSDBY/gGGnXp/sWuznB4vn2n2AS7rKs7j5yDOCCcmaGmMd0oing/kaIG
	QVzd9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asap7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:07:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso40913585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656421; x=1793261221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=DVQNk9ic6Flw/hmULVWsSbjiJqhBL3zTrNt8pJnrM4pqWJb5JcfPbIxkdWGx/AyxIB
         X+zaEOWTpESuZnaA42a6or79U3OQMTRI74xYnR0eDxhWixFvgRbC4Zl50y3YZU0odiNl
         VhNM5CxNp8ldKe/Gw9XzNyyjSFWo/AqA6Renj1p50s10SfLvtyxWwUX4eeNogHqRTP28
         69MKKStFWNqgr80Hx1Yzamrt2vAtvi/QhJr+F28u4Zgbq0X5KAqBYy8EQuIjR6QhaZeD
         jKSR73KSOKGHR+Z9eEUPOUBmtTgmDFOUaK7bFIQUWMCXjf3qSpQOnL80cy5ee/Tu877r
         fvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656421; x=1793261221;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=L6m0jvsCIgpSZ5HsaTXvwcRSJ7md26eaRQUEYjjd8FzgqP720eQ0pbm+qRMjZVOHZY
         ilXB2qYRt+ynjT9k8dv3HAyz2tX29xvew0Xf/LC/UMgAcf4N44Wlow7J70TvGO3gi5rH
         sU7D6lwmQobRsDT+TJWxl19ViGH1qi/7arSyMj4mcr8SZ5tHp3IsHh6cQ+EtiwsL07vP
         kIvlCRB/+TteeyjQaTwnEZm6JlO6XXqIbbpNN6JnC6u+Jg5Xrlup2VIcfWsFMUIIjync
         h1tgxZLPmR47uz8BCbZlHXne1/6HJOxilowQosnJjMwVA4mvMo42nzL1leZPvh+uWj7q
         9YKA==
X-Forwarded-Encrypted: i=1; AKwUvByRy/wq/qi8ebV9/frulH+K+qNstzMNNetPGz/LVwRSGW81HAPgHGxuqSFky50JFNHSxOTIS0oRv1H+Zbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhBXgDviASm5qKO9jSm16vRSIA5Y57rldDvlYgg7qcFOJaFjiA
	j1ALw2Nd5xDNA0ZUAd2+8GrnvdkDOwIZ9//8+veDkhckcz4s27kIe9WSCcYse/6xUB+B6QNh7mZ
	Z/BKjwVLVLpC0hy7wJySmn+FtwMwurUv1BrQb87enA7tBAdtIGLeT/SzNlOcoYFDoFcU=
X-Gm-Gg: AYBFou1TW0EpxFB6jmdx/EA2TtOA1yVzM2Tiqcgp3UXHE9GPfdZ7LR0t3AELKgsNYzs
	KWCsQ1PIiKsL/N9girC7Y47ral2GSxNchUdACW4WZMxdv9AyQ66f4ikKh5fDnQwIuv8Ug+tRYM2
	R5Madsy+TlCnOfBiO3hP1r4kzhuiVflYsCcROGf1sgVv/KKQr7pTKFrkFmRdafjGL4Af1MApO9d
	/RoZkP5B7ldl7NK/ALNy+60kCfHZ5Rdtipc0bdYSdfpVXOAqLJjE3Ws1gUF9IKlvqlmfg8RlFYk
	F+37aoNohmEZxzF2GiqEeCobdYEO5pVHHahjxYSFS2DLiEhqvy7P4kOAiofeviIGa2N8Ux1eJC4
	rnIKNRq51nMWJlNWlyePYEg==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969073985a.2.1792656420675;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969070485a.2.1792656420159;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd13sm77789966b.20.2026.10.22.01.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:58 -0700 (PDT)
Message-ID: <1064a495-cec7-4a0e-a007-3b434576ebe0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:56 +0200
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
Subject: Re: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXwYgZLD4LRx/g
 wzECWiOl4wGE4GO15Em1YO29fi/m5IjnxRtvpX7f4RRsQvnqXNp66ldhKZNagbTZtbD80zmwi+1
 T8o499/s3sIfjQa67CsC5hw1r19UpubpusnbiJmeNfdD5p7ah1xXVvKPmemD26A070hQ0c0Zzus
 Kq8MJ25w3Chn1PxHWtShuCISkKB03x8+h9giS9VCNB9Ochd1afjgzLwCPfiY8hiKxN7CewOEmpF
 FXDE2DcV4qn2+qUDeQmPi3+f77PHS7Q9DCAcnqyj8R+TSOo1YpHAawE+hWpaT7QKYGUGj5IXV0X
 ssNPko6ygRKbzbdMOjYvGaLME85MkVkTe7jLmL/W9VObtrfP4nsPNNUn60ppuJl7EbC/alKcDtf
 dBC+bdvugL1ytQwGkNNV5GatfrXeymNpO67wKdetbGl/AAxucZ4b9X1xEEvnJEwxTdEv1N8uns2
 HACBhJM9Mi5dN1rjkLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX7vbsXKdQJDTo
 iq+A39wA8s98LWeU82L4b5tDDNm0YfVyoNZzdl+IztJVZndDKFe+8aE6ACE4e2vyVA9SQ/ePB/7
 RGOy/VMAd4+K/y1lJXvItLN6udhau9U=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9c425 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HG7NN9rGKGwOBDi2bZEQ3XTl966nIw1S
X-Proofpoint-ORIG-GUID: HG7NN9rGKGwOBDi2bZEQ3XTl966nIw1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
> DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON, for enabling this 22pin connector.
> 
> Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
> panel power, reset and backlight, and the Goodix GT9271 touch
> controller.
> 
> Disable the default HDMI bridge and connector in favour of the
> Waveshare DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

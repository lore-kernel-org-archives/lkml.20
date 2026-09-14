Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFE442FAB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388723; cv=none; b=CcrfNgkH8C3z3URj5wcBKvrGXgczcN6npzemmVj3issWODFGZxOGqJOFKLeg38gZ6HEnYvpxCtVbcM89mgSQJRI2vqRA5dbXHUd7yVSnEQFdktlbzaUdCg2JFBUjh469ef8SPI0WKFQ79LZ0ntneI9BfXO0+FcTXWxTQeVK9ML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388723; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHo7XVRSlkSML3hBO19dJKaa279aEsKhaTscN4B75rG+faDhJqvBIy0+F54yjk25AQhW+cbh189/C/f4K2jTAuZpD9g1Wh1pzUxCa8RPVAiY4tJDxAXdrkRCp/7R2pmEGs4Jdzx0Dt6UBwdc+9vOm+olADX12BGs8gCVdutevRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2zGUWx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq8RKuV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2zGUWx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq8RKuV2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmE5E531222
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=e2zGUWx82zMgo6Oy
	YYz8LezhLHZVD8F4TN6D83L2SIiCPTIzAkr7lbBu6Nr4NXpiS3j+Fis4Ynxp0044
	NBbpwjO8QV6Wt72rGGxzWtIBy0xPMAm0nW8ZQvTIgeWolNbJuvYTBeuvqf7tALHd
	wYPJFfhICCNCdRrNim52kD0t8/kL8zd3tN3DE97Tgj7+3ECcleh+u9yRouPrLyS6
	lDkfptHxrIJWZhLOOIjhO/5KazuxRCzV9mM2Gga+Vr/+yIsRlPVGndHLnhTTy01f
	YoeL3O2CK0SpREmxKIQ7HfBiqdmX6qw6UUrTcp9wLZrA6zUl6mnDFLvafsokNA7D
	JIRoYg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstd2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-791265014f7so59372137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388720; x=1789993520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Jq8RKuV2amWD+Dw5+MbU4m6lKi1wC+6WrsFqExYoX2RIrrl/+UpwFRWq5kCtQtoDlq
         j57gIo0lfNy3guvFZFIKI/OkkdVQWmD7q+v0A5uyCNoKBuaZhcURRfHjJUQwwQwHcPnA
         QGC2lPKxBjO4dzQloA9CjVVmo0vCBcM5UdrE8ezskzx5eQ1D4q2icGE7EWjwyS+g93Mr
         wy4+UEvwd7BqrxwK595gE86nLXGI2mNZdcB/KEPwQ+HgdXfII1Q5QPnzq1vpNjDaE7fR
         WuxO0nx5myfjN9iQYA9Z1Fj/8JKj2E2BNeu1w/BRgxo9YMxOymYijanNScaFjpxeTRnf
         glSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388720; x=1789993520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=m24lU019V4vZLMo5oSyr5UxG52zaSpAhy9M8hQJX4yDX0CXQ3mGFklG0yEg+4cjfHD
         7UV/gw2AUo04hkyCzBHT1erymhFGofOKV6m5dEiRaauCvAGAs6imFKXc40EkRtEaW+lT
         qqP6KNi0Vggsl8+J3+baYZ7od3xrvbxDQ+eW49xcmCP8toCSDMRzBQLN7vjKEl/M7duF
         a54FPe4oW0RqJ7e7Gc/aYRGEG0lSlcmS86iGVm/cBnnsPeL43X08B/3sddGfspY2Vv3o
         2uo5+CGk087LWvHublQtl0sQjo9RQxGgNa6ZsOkBrHoXFTaN6E4YFr5FsFNhv08zyVg4
         uOUw==
X-Forwarded-Encrypted: i=1; AKwUvBwNy7CBRlkSVXPIaU2lcJqsK8sU7Pp/Uw4C9jrSELPOyOi0b7+xUfQgq80Y1DCIiYq6w51QMawxuJwgr84=@vger.kernel.org
X-Gm-Message-State: AFuF++lXcitNecRoEpp2+W10zPoSuQiWtI8kLbQQ+iWQFsjnT0dUKeDj
	auCZaWnMVJ+Myw0vNGkjkkWDLd7ZHsiF3tD7mFMyqOMtPHvI2wM+J5zl4qsILgAHkWvFJhyv2tU
	RAYwU2+fHTRkMmdZ60lEO3UVXcgDLmHa261mw7OOl9qWDhFweHGO5DLdJO8Nc72EzVB0=
X-Gm-Gg: AYBFou1D7AhZFvP3+sSGtWQpdEMgrqP20e2gVJD64aEsEaDJz5clvvkoKYwv0gVMPs2
	Ndo166BypzTzofGlCFPAmdF+XM0airJ8W5Lqf3dyRUV0dT+d2D5dQZXQXGzoP9saWMzaBnBtnF8
	fUB5/IHXurxuGcIZTlrSy5OGOhOlJwg88BmfuBXHO3p0BQ7369XJk3xd3nJr3i/dLcXki1Q+vRa
	Fy0y0UNP/riNywMye0ZyNN0AbMTrcMVOxFGaPabXuASCd7qASVKNMBs0cLrKrdHZpx4AVjkQo1s
	X9p2mQJxUoYq4q1iaydhiR/xMwOK4QLJfD6I91xogVhFzkwP+Anaa/Fc+gE0gYYo1grsBlT5liM
	LBFJb9B6T7llUhTgohHj+4g==
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219906137.2.1789388720652;
        Mon, 14 Sep 2026 05:25:20 -0700 (PDT)
X-Received: by 2002:a05:6102:61cf:20b0:79b:b389:d6dc with SMTP id ada2fe7eead31-79bb3a86286mr219885137.2.1789388719658;
        Mon, 14 Sep 2026 05:25:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2440450e87.42.2026.09.14.05.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:18 -0700 (PDT)
Message-ID: <0b78a330-b2bf-4dc3-99f5-86850405a4f5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/31] arm64: dts: qcom: sm8250: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-14-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX97ec9ISoZlpu
 RJT6dpXW1SjX1esYg1lXcWFKyL+pc7FDUXWh01RQrGLW6QXt3fpEqvtcDoZFWFXYykTGuoCLV1v
 kVBwr4tgU5zaRbLG8VdZEZsS/lxzbeLYzpd6jNgt3aiDmrWaNMUvg7tBguG1njvpuQPE3OygS2Y
 gUc9n4/5pwRyuXdZS2r9kf2ASZAHlB7dh/qa5IEB8+4OOanb+RjUkceFNjdWdARoYJFTloYBLUt
 hGJ7dmLWvJB9o8iVM61YeBBA/jwJSH3HIGmSUGBBRlldsrrIYt6DfpsTojUWsIhGzKkUnUo/woL
 SGYk2iXmh6Zfsn/PnqAYAho8uym2ihWwVolzC1Adfm6+tdVt4PW+hSI7yx5dqVo1wEdGCqo2ZJe
 wbkD0JWkSWKa5mX7XBTCkAnBQVWSz4mSoSo8jPeCjgVVx/htLHDT6Qo96UWXpYCmOxSwwgdYywe
 K+JkpB3JW1DK9ytuzjQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e7b1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 03EzmlKzHUsNzAgu2j7XOd2lyuO47PQg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX2RWlYj+LZiw1
 CcOBMh77WctExpwo0xz/zDcb1ZRYjHX3NP0xmu1m6NLSW/y+l6pQIx4iCs1nJzW7blPyaHY+p64
 I53N2pktFSocqTNGnu320MKUKjbT9AE=
X-Proofpoint-ORIG-GUID: 03EzmlKzHUsNzAgu2j7XOd2lyuO47PQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

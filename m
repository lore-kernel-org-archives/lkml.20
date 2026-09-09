Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3515632BE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965474; cv=none; b=qlWLps/4smClUrNd8U5utWw7ZQvNMH7TIwAHfcd9WVlFcUO9bVRgA6Bt3pDuxliCb/3TIGewp5KK1kotvRPvPyQUdFIGXPPsRKASnZBrd74z51/m5erMrs6r473SRTC/iD9AydOTbeurJ3LFE6P3E3fueqYG6jfOfkrDYZIkM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965474; c=relaxed/simple;
	bh=A3aGdYOvmr1JhLTN/6uBZKFzci+zAci/MMqkgkoBZYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSYmLfFo9kw8mQgh+eeKtuJm3f9MHp9leulSp6Or+iQUq0nAVNgKI76VI1u/BFb7jj1d+c3jd8Q1JZnZQnfEFz74h+NBZ+0uTPMQuKHdhaqgfp2Lh30cySPvhn3NGxQi4xvn3JaufR/7QYUpIu/7zGGHcW/e86LsIyaYP8mWAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB6w3mjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z96XIjtp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB6w3mjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z96XIjtp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1281722978
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=; b=VB6w3mjUHata70mq
	zzqgp30JtxapAP7Ax3glTlIsVT4xa4wNLV3UvA2ZDJEzihZE0jJP9smVBj2Wxs+A
	tYHIFt1uhA41APAsazF5Hmp5iZzPq9c93P8B+A8b32xp10w1RpfMh7c2HAbVyD5i
	ukPgGbABheRyLnett8Gm6Ph5xOFXMB3kEKTrwxLkmuH7DnSqD1XVU2qtL3Eq73Az
	yjxfhF2iAr42vs2Eh+UCO3QnOQpNvCG4rYRiSuBsNI005WTCoj/LW9puav1fhuU3
	ayfgbFPOyvSaeRJ8yAWbb3bZ1vmF5qGOnJCJGwlrC+54/cg92QaSCy/eYjPPF7BX
	hvIe5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns600-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:51:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9103db79014so16901526d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965471; x=1789570271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=Z96XIjtp6hxnbm98MqPmUED7p8JpVxrv/KHswh2EFbH4/bC7/cKmdyxoJCFqJuFsTz
         f8DjprMG+ht7jj8b0Y+aEOsjND92tlBO94I2BU43I6VAoghJaXpmF4ZxmxhWKiD3C9XA
         CkasJHecGB1k8YoS0KiH8cHJtJW0mkxg/6bf+FYOigYSw+GKbZNBBU+a4f7sxPIf83wD
         tTKlgQKj7vAr4nX5rpPRfjcrUcrBc0wQ1YD13zhFyATIQpAAK2HvBm8xzj5ccjWjjr7b
         D3VmAmmecXcmWuKKoEEUYyievORJ3bJG6eJZnNY/6u3CFAI2iVkf2YhUYoNAfDbb8xlu
         oduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965471; x=1789570271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGdEBxYhm3Dk5n49dTlwPF9ujc0BQehUrl1y3/Jv5qg=;
        b=crmAp1OlxP4wTg9cJWvxo3zfbE8C66a8dzkp3Bw/a2C3afVcTEG6oJagob07LHGloP
         pjgd2BqbPPbwUtcd5GYRwRRmveRcQE2lvdK7M8zBzsu8MODeeIujVMxQmgCnYuQyzI2k
         lYCBzBsWxgtteKklio6Gn7wsozpgHirRhn69S7bsR9ONgIlkF+wQcyXdUu5xv+fiy612
         4FEJVQXr3eBEEztRBD3/V2Ltgv8eeN0qHGhs5BFVjBEgIu1N6oEiaa8DuhzWkXCdOecM
         pe9SZOtN8hF1W6IaPIl4QeZ95hhAvaxRvyWT9JeGkjyWj6VTVWKNbgQvZCBjNNx5Eqyq
         zw/g==
X-Forwarded-Encrypted: i=1; AKwUvBwDMG3LDuDOdZmA0M14fIaRPlQwil2gEIghRsu4ZEV9JohEhOjRyGyt4hPNda1lbLFVlxAb4xxKweN7SIE=@vger.kernel.org
X-Gm-Message-State: AFuF++ljHbfKlud7nB0AshKb68JnB1+nsfNa5NDqk9de2nKOesolmQb+
	v1+22TzW2qk5S08WeBbDyyv547MdnuEziDVd4EdrGKcAFfSlhW3YWJnaHXjIwvv2wVJBkEPc8Ov
	W/sMhxdEoBRsnxS4CHqryag15mLPJPVlRP+8slpvFS2+o2DWQRHZpsxSwcabfRyrXPlk=
X-Gm-Gg: AYBFou2oqQxspATX07XXZheYS8KKDrNJxYxvZWXibqky8ynaNtoz1HSWOXHPg62Z3Yb
	bNMqAUxPZYBPad6rwIYFiJHJU7EbzMVX6s1Ne8J8/W6QATlkSrBjGwp3CoOrUN8mHeXCIg/X1mn
	+cnOFxG9lAnwSC+2L2aTzI00dskaS6MCtJ55/tV9dJIZqICg2vA7pGVczwOYuuHDelPkb69L+2M
	C5jKo9uXU+ufYNYhz09XYdmzpHXUtfvr/SM9F4FQ9iBWa0X0j/a8qsQkJ6LgD56V1Gvquz0z3hH
	avrZZ3w/ZypbQ6i00K9Y3OtYNthj3aym6sp2C23jaDRT9h3L6JjUdG/pI7G7g2SFdi7GOTsm2y8
	RETWExklnRIBbEFiPJNjuyA==
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74583346d6.3.1788965471165;
        Wed, 09 Sep 2026 07:51:11 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr74579016d6.3.1788965465810;
        Wed, 09 Sep 2026 07:51:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm630980566b.18.2026.09.09.07.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:51:04 -0700 (PDT)
Message-ID: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:51:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cEEY2RxkoQtH2k0Qq2aUA3kqqR7V9mqX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX4fhRw4PLiViO
 lb7jJbQvg1qqqW/urIhBxYuL+3XOhtmXapW7H84xnr67Y1rCcuQPaaxE0/c61XC5rMAYWNz0DM4
 F3dzE7k/1ewyEPKUjA3Cu0opKis+sT0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXxXqnR0e4H9B2
 dFK23ZjQ0NFb2L9FVyRyqEi3GUiy98caAz44J0K0lvZG8nw/ZlBVhq18em/s1SZ2Siqv84vZuRu
 bMClDLLNKau+hQuZdBe4WFE3Q22zx2PvYVXclccUfnJu9kizvoQDbsalqv7w9qeCVqp17Lg+A0H
 MzeI38W0sSnT7TAkEJN6g0wz9CCwRDWv8AfzUBki01GKvmMsp+2wg8cong1ZLLKTCqTXi8uFhk1
 N87u3QWDjCopCjVC9uTx1KRwUNx230iPOJC+vaNxLEd7cYRPaceHP46PelbuIwaxszvdHQPN2I2
 VcZFGZx946gcWbb7AaZ8C5u7ZvCh0GTWHwjNtY1jbXVbDDC4scATjNaD1Ga3eqjuzKMoblHB5f7
 VesolZxectqORQBJMxcXwZgJ/TbncxrqJpybgKF8PhrULusq7EYtSZwvOtegOrHwhUWJhW+6QXc
 n/t9X2qm3qbMFBYN17Q==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1725f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hExI_PBlCTJWeLBofxcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: cEEY2RxkoQtH2k0Qq2aUA3kqqR7V9mqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +	reg_dsi_touch: regulator-touch {
> +		compatible = "regulator-fixed";
> +		regulator-name = "rpi-touch";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;
> +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Does this need to be always-on? There's clearly a consumer for it

Konrad

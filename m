Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BDD52CCD1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690068; cv=none; b=cdYsBAtd1yRuooVHlbvmZoOW1dtqV5El2plyIOaX/ikufu1vT7B0MGf59z8O69pBBR+3D5MwLXOVyqKLG1UjrxwR4OVTLrT+Wphb5X4s4fzc3rLQJjvI+up88YfgGFy+1A3uuR9GvqVRQJ6nlVMbr2TpPXTGVQRcjPs8TSOO8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690068; c=relaxed/simple;
	bh=2kkUUFp0qagaU/gKBiglRLEWrZQHJpp5922EOC53ExQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4PCkol5FRirv8JqobhfLJlL5egUJ4JftEoSBAvVz+6yKjWFq/3+YOEPPKDOnArOts5aT/dGpzfhVFoJmnm+5e9yrEKLr8E2bg5ZEJXiTjP8a2cvjsQiRt3j5g6FJwTdil37uSBStvMs1kF7RKgX1LAjpF+8+Iu9LUkEEdk9nDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxtttK78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzlNcmzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxtttK78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzlNcmzq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCvsaW3300547
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvd7lu4mno/Z990JhVXgfPPLfxZWBbM2OSjnR4iGsbs=; b=ZxtttK78tsI17zTa
	oEMJjOXzY8l8UNNCrtK0HnDa3Ic7phPrwafncq7VjFwgEK5geFUzG1IrrLtE2KWR
	52NUIha3IJNOjid4b8nAmxUwQDsJxJ9fM8TXXUCf3++3MQVeaDOQrXsQqHUafRqr
	PLG7XAwvtFXEHHCKlZkQi6kEWDI2kc3dn+phUkoiN6io7AtJ6rC2E7Sq8rRJ8KJq
	yIcrYdP32yZAN/maK/ULIYicqJ/RJsUnPyHE/kGGDtcw7AICqkqMD6xKpr9/k4Qt
	EV65Sx/dU/OdvsWbzc/RxRQfIQ00ECAN9BJQAKYIXJn9FpPuk8NReg9pNlKw0yvn
	rmsMzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx08wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:54:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c6049cd16so25069885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690065; x=1791294865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvd7lu4mno/Z990JhVXgfPPLfxZWBbM2OSjnR4iGsbs=;
        b=OzlNcmzq3Skx+AeVpBPSJETB1DaqzV7Tn3r3Kd8GcVw3c1tPSuLFdZjtFDjzHFc9z4
         MnHABAUIfVCnkee0EroYZXIsdFthra69y2ATPp8SH/Ilt+8ur+4mMsjP2BZA2Yv+q4g7
         urgZty//o7qepoGM0pRBVxpqNyFDVI9Tem2qB2cjV/F4ZdGmB/0zuyLpYBi4PGPM2Wgi
         txzNUS942G2MOIRXgrFNvnMgrkExqeVjN0Q3DiSOlOkptTzt5sGWuFmDwcR5uT0hWn3P
         hidUMAphNlSmFjB8r3/+IunuXdEvCPI/1qAIq9O5pT5WvIxx8PyHRtUrlj+YyLD62eNH
         YuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690065; x=1791294865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvd7lu4mno/Z990JhVXgfPPLfxZWBbM2OSjnR4iGsbs=;
        b=Pkkx0iPEYYkUthRT9eiHa24vVax3oJgTUZPvHUm56wnXhI5L2iRzcB7BJDoe+ITH8t
         yYJcWVtCH339X8SH8V73oTMxGjMd0JXHE1U2ylT6mm9xN2C96yvAqoIFPLvU0NC4E7pi
         SX5uvwF8UtxrImkvy0dwrKrKPFh5L9SGzoLRGrVhxQL7nasQ8gsOd/TWY8mFBE+XS2X/
         4mNZJPPuT+815viXBQJa0h3gVjzldhIAZjEMN+Q5QL9XoamzOW3zP+40T0mV2IFv0Ohn
         0hv6cpgk/F+2Nc7A7MIAqqQnXBj30Xp/BQQBBXMD9/itVzFqs6OV87p4UdVKHUwDRoru
         Uscg==
X-Forwarded-Encrypted: i=1; AKwUvBzCZLYZFDSS1F++vMxuR+EYxAaed1MMYgP03NUaxAHNNkqENcRQKfWn6sclkO+oBQP80+DAE0Kpz07h9CM=@vger.kernel.org
X-Gm-Message-State: AFuF++nxTD5osbcot8OwqTrJVBzXWqE0YCBS8TMGO5/odZJAJTVbBElc
	78lkEAS8pRx4AAqhGL7g0CHKvhfP+zgK/XAT5Uv/HsS4/64013DcDnc+haPjAR/3UwGThcypwbM
	qhpzUKHj5icEp57uYn6Vfce6OwHdc7LHPsDfcBWLF6a0AN0z/+j2ihr/iolQKWv0iocvfC7Dw4W
	s=
X-Gm-Gg: AYBFou0v/5YkO05jHr2GTzvOfDvBor4/rsKDcPP4yzqtKt4T5t3puX3eO/X8BRr6Fa+
	yw44+T+ehl2nQi+3Wq0tMWLrWYpBLKOPhg8FHigWC2Xlg+LPxgF70MwO4PqPHyoJ6IAIFGm+Cs1
	xOcg0zobP1nbvmFTrhEahJLXUjHDRaW16jC2jSdcjbwK4SEKh+7bu6TkbttPrbiSB47BWIa4BHr
	V1ZmHcrPJ+T0O+bR4375Qh45aPE7Ct3iupKk6NYM6dMUoAAOJ3IimdX1XLQ3c/vsuYpsBUGlAXZ
	I+TJYHOETpKkdBrnNGikDEC3X98TKtrNoui1XkH98nYmlidobCq9KBdvnr5v206t5suoZPgKE12
	TVhG6HdcV+0InyQuSSgqxuw==
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr2603509485a.3.1790690065168;
        Tue, 29 Sep 2026 06:54:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr2603504885a.3.1790690064613;
        Tue, 29 Sep 2026 06:54:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9e873f45esm1414207e87.82.2026.09.29.06.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:54:23 -0700 (PDT)
Message-ID: <3aa4a96f-76b4-4961-8c9f-4eb099016a01@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded
 controller
To: Alex Robinson <alex@ironrobin.net>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steev Klimaszewski <threeway@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928222056.10044-1-alex@ironrobin.net>
 <20260928222056.10044-4-alex@ironrobin.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928222056.10044-4-alex@ironrobin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX9DoomrubZiTN
 D2xLqocDXTVv7NM9bGsmh/E8LcT4fFHKXmgMzbgZ39OuDjVJFPde8EkQ4QvRkPKVwhmtHphL6xb
 WjgnpHoJ1+msW7dAW2NVg5RBlMpsL7CPtZcbqrl3tiMvhD2t7e/uD5nTgGlashvrSBbPoOQOL/3
 Fffx9VAvWNfKEmZrS2LD3Z5bdAukqNy0szWqHcX7Rp2Gsre8FXaBORpfweix/ikgt/uIiKfjXqh
 m1Yz3f1/ucy25bNhmfRuDn5OiZGR0dva3uhuc7Txjdt25/T34WKM7p0lAELRkPzzHbyxaZAgZMo
 e2WT5tolY5DZWVQEc+muE59jq67e3kqErGWWuSrr4xkPwZS5Kq//JWd2oAqgFr1qpHRyrM+Rqk6
 JcctrBI/8JoqXxgJciorV+biucVv9q1apf7gzcsjNgwzlRts4Cv7TWbfrZBWnMxu29QwkR4V3yH
 t4CE+bo30unL0JsKOnw==
X-Proofpoint-ORIG-GUID: wSINxQ7gScaaI144DD7jjWUchabpMert
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX8ME9nadzZN6a
 0rhs8lr6W4oYbYawAxDJCPtj8Ql4ls0GQ9eRJ8SutDGyyi1GwbHdwVaXz434SUhz08X5Hgsv4RY
 JKgZwd8LXuzEdC819OIOh1q8z+4cEP8=
X-Proofpoint-GUID: wSINxQ7gScaaI144DD7jjWUchabpMert
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbc312 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=USHUXImS27okXdFuVjEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290055

On 9/29/26 12:21 AM, Alex Robinson wrote:
> Enable the embedded controller at address 0x28 on i2c8, with GPIO103 as
> its falling-edge, wake-capable event interrupt.
> 
> Configure the QUP8 bus on GPIO43 and GPIO44 with 2 mA drive strength and
> pull-ups, matching the working firmware-established pin configuration.
> 
> Configure GPIO103 as an input without overriding its existing pull
> configuration. Describe GPIO176 as the separate active-high power-state
> output and configure it initially high with bias disabled.

Most of this commit message is unnecessary and repeats the contents
of the diff, please direct the clanker to:

Documentation/process/submitting-patches.rst

[...]

> +	ec_int_n: ec-int-n-state {
> +		pins = "gpio103";
> +		function = "gpio";
> +		input-enable;
> +		/* Preserve firmware pull configuration; no bias override. */

Please find that value (read it back at boot) and place it here

> +	};
> +
> +	ec_power_state: ec-power-state {
> +		pins = "gpio176";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

Drop this line and assert the state in the driver as necessary

Konrad

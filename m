Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233576;
	b=OcIxO1qZO/WqcB1ofebqR2nWyC/trIviHan0jR/K/wzAI9D0aUttz9rW8YNPhS2vKzTR
	 sgg6fM+D11JDkDcyHY+UW1eHp9VQvwbzjLPchpWxz86GQsiVqOBO1jk8Y5ldvvU1+kfLo
	 QPS0IhKklcqlHWjocH8lQvZycK6uVCFxwnfxzhxf7qJggqi9t3bNkruMqlhuzv/adhcAZ
	 hOGLF5dW0xDUFn1jV9Xy5r8ddusHrZlssygTnraS6EHeKMxIP4nqreOnKGFlcmluWbp3Z
	 t/uBvnMSCMFbl35r3dNHTnhpqfn/qr4NcYpzD9rCEtIXWTBUeQ7t3C9O9lIeJR+0VMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
	b=41RjTOZPCe5qFNvhUyX3ZxXDIghpEPxqFbs8PbacyR7UwnkLL4fOIz/FGQ/7Gxuql1AB
	 Q7G4HMG740DQymIWl2/CjP9vfGzO+ZS71uJ5Vsscw7VzvatK6OoUTJSmZamN6gn/WHZBF
	 ExXRTbyMWM8SmKUSWBrkVWi/9/oUS44QjXIXXp2+c6QmyyC0D6Ep8Tmwmhv6yuDU8/fh+
	 dkWRA2i/ykiicFsVJNtVrrVfMHC3teWSVvZzIsqx6z9wRcI2L7wG9IPJ8NdT56Rwx2cM0
	 oDyt5AdKXRFXJZVsaq60pu8QqdLqgKbYjih+bT3ks3XwyBVGunm4o+tzlh8smjpsLgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIj4n5n1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5D7606D80B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5D7606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIj4n5n1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFHuT985140
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=; b=b7bf1Oh7IQsoIVX6
	A9bTlRfFlN9+11ut6kbR4bLZ+BEtSBQC3OSJAQfj9nm2dB2OUIo77CYvyRPW1KSo
	8/JG2XtlngOsTyqDAX9UQAHSoNSr3gz0i20O5d1+iBHYN6POSI1CBtVt2JPEh6E8
	vwrnnHFribo92Td0weaceLKPykVdboLdEku5RxJVlNSsGIqctv5e8RNEWKFZNtwj
	M5y5ytR9Z9ES+FmEaHz1wb/1x5xjSg5v9nRUIkDBxBlt+1kOGmKTBor9WdblJHnE
	kc9sa27v3xN4SL8p9UHqrpjHOtUxanaX5fW7YHlYmddU7GuJG58u2128nXwJTHr9
	g4Kdbw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxeqau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:12:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso28105137.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233574; x=1794838374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=aIj4n5n17YGmIldUWt0Yx6INE98pNRj8L1bQsSJJzU0hGSgcFIIsGgBaab9i/BbcG4
         PB3XEdpYqAZm7g8QeD9CSM/fph72qy4DOPxfuOa12BIzTvzNw+LY7zwFaAYOSLK4lmjL
         bs1gZyfbOMxlgCEpeThJK5Py+uSROyCYqlqhHVFBFbxKAftU5SGxM09GwJXLdGfbDNRM
         3re1j11rw3JAKu2zIjp7o0NQvPwc18q8sHWs0O3D4PhaiXAdMEmv7Dv99xumKmOgMfFC
         DjV9VewoRFdeHVc8chqbrF5T8vLj+9sJthNkhfM5ejvgY6UK+oU8yyjYScKUsDY82JAd
         +tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233574; x=1794838374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=wHaA17OAc4U1dtcMEiSRvu9ZvREIeZIDiKt+KH9thuI3m3Zj3b8KxzhGztKZny3qVo
         QEG7n+sY+V5K+AOfZRugxaiFaSe4iMtPVggOKKGmb4sylpu5O2XwBKLerKtgFhKwfmcE
         sT5ucKJa7DV4ajOrGanlES3HYI2z5SI8+r4Y0SxWOsZ8FWX3F/EV+PxZ27iX5WR+nPo9
         q3Ktpf9txKOzrvD8J4YS1jv7Rxdzf/yvuDsHc5Lpg2Xk11UKFDp3XKP+v7vJ1jsvRi7+
         Ywe6H0Yjped0ThTfy/okxtLIvqtsWclLZNQtcblKabE4hFKJnTfqXP9A+lq3HSXfY4y4
         zfrA==
X-Forwarded-Encrypted: i=1; AL+hErEGafSgcjkiQsyUVRgEv1MPe7ZFaCBMKLsEilLRyGIXeNCC3KXX0ehIopArApUXAB2pUiB+VLQ5Ic/zwrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z98UVUHB4Qe1YbDi1fkOJQE8bX8YMMNBsuKJqn67vb18k2x9gq9
	JYQg9hlst8bmvRJ0Dd50nag2w/JNmfHrQIdIZPQaqKY4SZbm/8RIEQRhztJZ2zU380aV0rYrjE1
	n1dBYmU7FErHyaOLZpbWCWzqsNIJB0tLf9LSQUNP5sf5pg1vR4dRKcFrUnUSOcI5Tsj8=
X-Gm-Gg: AYBFou0lnhsBr+um1AvWXS1iFJ+g2QtzWg1fA/7evKEsyC45v+37SwFRl8YwPYBT8QJ
	GHlY5vAHmBWEzWt7rTRhnbTOlVmGMYQ7NtKkNotviYvJHV5B0JGM+wVsr3SX4m2yJzMdkwiHoBC
	/FR6JUTOJpBDT4EhFuWoW1uHlSb3Xf+UwpJo2oP7b63IlLPoOb2sSt1gsmARrJ89ve7SCcFL6A5
	B+x+VmED2F7VyQRh2vrTVUKz7bmruEFjkifUV0cThU/XYJ3ZZn7rUVC/L+6sTYJeATY8rEi9XJF
	OKaK4h7i4CZE4vK3itWm0W0OhX6wWdLv3uKrhMfnmWAh2lTSr5sdWtIosI026GDVbQ1G3n5nbM/
	+dzjcbYM2iSYLhTRSZT7GE0udURutlYzUj5v3UrDygX/fvlUeJG5UjnXb3fmcoUaH2Lqu2w==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982144137.3.1794233573652;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982104137.3.1794233573125;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm1736102a12.8.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Message-ID: <08a43e54-6f54-489d-9ba7-6cfc6eb173c4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:12:49 +0100
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
Subject: Re: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded
 controller driver
To: Rahul Pon <theflyingrahul@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
 <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PH67goaPRbtqW7txUQyPNaMMQpC8uPFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX5IxVHool9Bko
 JaWT57dH97seIQXbli/9SwEUYdwKehZctqhHQjIEkSF6GEEyMD4jqV9SrHs7GZcz8QXgocZu87V
 uu3DqcdzUVVL8tj16X94X9eC4HooLjzfKB8xEReyzQZ4ON2Qa56f0LfQCgKpMiuMb0n/n+H9yGt
 BpR4R9JPZLRN34xRdd8LGXINpWbOrM4oyInp5v5nKxY+vBh2HWx0Zf44iS7GNMSip6ZRN/5FlPv
 ExlAGLcuX1xK9j3PcRWQGIWJh6prUE32N3tKfNWf1b69GD4WLvN6jY2oe0QnlsI6TfmwtGPPRTZ
 MipGclMLNJcGatrg4gmrdbH/QcHU4tcmavz1Uo8qJrBWZw2pEB1TktY7B27kilynKLe8BnAsG1V
 Rc82rfa4PWZzE8jyqchtWzq4YE64ExYPm3K99ZGmVXBTJ/L3090cpRD9PyRmlZzhk9f3lTE3Wua
 W/PwsAeJaatYLwVrcWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX9geT0KvQbNXT
 cpAhxi5jeFoN0J9BXqkPcTMfi1GAGSim0v94aM9j2rQJ5oefa4fshrJyWdVbkqELdbvwJdSDgQG
 zpV1+f+LildOZ/NaIrsjggAaCbpP678=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1d4e6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=0yDvZPlJ0jkY2xphDlwA:9 a=QEXdDO2ut3YA:10 a=KfD-mh6vjfoA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: PH67goaPRbtqW7txUQyPNaMMQpC8uPFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 11/9/26 11:49 AM, Rahul Pon wrote:
> The embedded controller of the HP OmniBook 5 16 (Snapdragon X2) sits on
> I2C at address 0x76 and takes commands through a mailbox: wait for an
> idle status (0xef), write the command and sub-command (0xed), wait for
> completion, then read the 32-byte reply (0xee). Its interrupt line
> signals events, read from register 0x00 and acknowledged by writing 0
> back, as HP's ACPI does.

[...]

> +What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_level
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Rahul Pon <theflyingrahul@gmail.com>
> +Description:
> +		(RO) The keyboard backlight level of the HP OmniBook 5 16:
> +		0 (off), 1 or 2. Only the backlight key changes it, inside the
> +		embedded controller. The attribute is notified when the EC
> +		reports a change.

That's already reported in <led_subdevice_path>/brightness

[...]


> +static enum led_brightness hpec_led_get(struct led_classdev *cdev)
> +{
> +	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
> +	u8 reply[HPEC_REPLY_LEN];
> +
> +	if (hpec_command(led->ec, HPEC_LED, HPEC_LED_GET, reply))
> +		return LED_OFF;
> +
> +	return (reply[1] >> (led->index - hpec_leds[0].index)) & 1;

"& 1" -> "& BIT(0)"

Konrad

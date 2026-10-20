Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479684;
	b=4SiRZhdL6p2QdwTCpC0zZ9qgAQfSTqK8upEoMdon5F6UNQleXAHnl7SxZuRqqj7nOxsW
	 0DX0gVqUtpGH6UwDBawVjYTkjT78sOBcOoRuWecCwWg3KGzcqTsYuRL7DiZyhceILWpZs
	 O2+uUnyBTGDYS0Y7pMKKP26V4r99o6X7UeZI1Mqf7UUqMmuZzQ8VwIm5PusIDwuy8QVNu
	 gtppkwKTFH0FANeKaHpP5wL+vIkNO6Cp40I3rwlA/JtbO9OWBRZcRSVxEGX59G8bzsVDJ
	 ZKG8kGq+0X5LRX+X3stH7Rs/VpfsePcDnDPHcWlSmrrCtedKr9jvBV5Kx/AQSPHt2Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
	b=gjMTj/TZ1w+7clM8GUhl3uv5aOSfCDAmMkKe9+ZKzWEEhqi33tlYmMP2bU54oFJ42l/x
	 45hmzxoOfaGZqFD1sQbHYliI2HN+4GUcnHhue3ioaogL3qj7/xdlPyhfIvw/lAQRfOPfn
	 u19qVn+Z1SF6HJYEfMmdNoS68gu9R4CMPXdduq0N08WDUb2hYkiIMZya0jXa+TSZ8fgnJ
	 gcmo+9Wie9Fy3yUV8MrGH4pOIYSdn9cjyM7jKFobuHJPz4SH6IXCilv5mFk/Y5RWSRGjb
	 UlEk8oKvXptPljLwJ6qwhUJv8LxfwChVRmgyHNU+HTVzB5nIKZ3PkdwrbK4iGFogtTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTpukbxN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0189606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0189606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTpukbxN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t35K1253890
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=; b=BuLAlDlfzU/52Ipj
	vud1Do+m+MWPCF6KOAKryai1uJDwWpOaacr1VwelR76jsOIR+Ci0sJ8Sb4dECQxi
	4wZqTMqwrfZoeMQ+PcoUbiBCMhkgBS0w7iXbPWZGB0Vii3p1t+3Lt6Buy+9rUgcA
	/xcDv08qSMmUPF98ue1hHB2ezAYf/+n7YE6T1pFWVt+GxaJZwZhfE9Wtir0jafS/
	GrulP77SOsYzaHDBOAsJYv/ZpQQOu/GurFqmBAArgn/dQB7Lr6VPbWT5f5sCJxno
	tkeVWDzirRA1LNgFfxbPcc3E0z2xbReevoPLX2ziBof0zeO0ivND+N3DylUuOsZX
	Oj5OTg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:01:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc2c798d76so66408137.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479681; x=1793084481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=HTpukbxNgJQ38wQ1qjD4I3CpHweQ7ZXDxTQotA/BM1wp/rB0JmXXrmb2B/1rtykDnx
         qe2FxdfCMGkTJ6mqOQyMGQictxKvQSnM6eI8yzy+Yr55kepF3pgoBC5SKox3ueNxH5W3
         JSXBOvFDcIGYQQn5zHurne4Smjm2Hj1ax7oXDdSwsFgiZGY/Tj/xrrYwgVEAsmvi8WgF
         mZ9sgvDqz6TOJQVGVSK2E08kDR1EAVLj+X7WM3r9zERy1Te3jF9862CiFh+Bqc+loiLh
         IAyQik2CBqC3sw7J685vy1bpL82hozIyuiPg/suLv/g9e1V7o6ZWJugLJA9VfBknarGd
         m1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479681; x=1793084481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=JWArCim1BZgirMpjFzvMoWabZLnNiz3BsTGzRagt3NlFIxgw0P0la84TOZ0zRYBLue
         MzvGt33QQPBMXl9OHXHnKjKaXV0IowHWxfJx6m2UoM64LLtQQipHi4R3S/UJCkyEKePH
         Wsi5GsupdA8Vd0WDzp1r82GTJzlvYnI+jfuda7NhynvIYC1mEFGGl9HksRUh3dbJyYj7
         LJWKP4wYtKjfYBeTyMo+bICSvOh52Wy7YcFZTmn66VtfDnTC1pfeVYkX9ryIR2af3Bwo
         CagV4ws1NVRk07I1LhUTwtMcc/yWrSN5k9Jc59f8S9UUdXG9mwBDdiglpjxcez3gDKVd
         Z8cg==
X-Forwarded-Encrypted: i=1; AKwUvBycg6fcbjrr0l2zMEfKg7s67cqfF1311riOvhvKVKEwvSr3v5CGtNCP74sk8lnHAdRByPV6S0f9OntkXf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKvchhLxVExxywZIgClOsbmTW7dlmMu9oQpMR79s+ZVpu1p4WP
	zGMKmdHq0KLZa9kM8IO9NRdMV6zb0J6ZJeRo6n8RUoOdq/SKGKnIrtwQyG/XxnyXJJ9cscqquEQ
	WzqEsmGroOGnARayQBo42NO9n53NOZDiVBKkwpuBanGy0OkwQoNKocLOfYvzfZZLky6E=
X-Gm-Gg: AYBFou3Ul1ouVlEU0I683KT2AdTTLnhN1ouW30S0DUsT9OR7v9x3cslSJZLzv/e6HCL
	861iDJTfqm+x7XWouawPa7bXq4BDKvQ9rzWPGj4haLX29AeQGkkA4YsV7OXjIvrLDdVOLCLzgzf
	vNr/pzlgEv9FRqNRLqSVMlA0ad8HYSSPiCSSPyPNznDU9k8aVTDnvS0nO+kLYIQi9XsBRsbelat
	6BRVe3/5L+dUmrTcupODHp/lqZq4i27VzTCqJNImxNL2TIQ53XTmG1uf4vFQhewGJm2l+tEOBzr
	SOqe8GIVKNqqYONAAw7e+Gp6DQGUs5tFzSEH1Yad8Hm0D2tC8fCXHLCAaaMja5Fhj58QAcAERrh
	LcvBnoiVAFQDlH5V5AOW2aA==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535653137.2.1792479681031;
        Tue, 20 Oct 2026 00:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535642137.2.1792479680435;
        Tue, 20 Oct 2026 00:01:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm4659866a12.36.2026.10.20.00.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:01:18 -0700 (PDT)
Message-ID: <2640c0d2-e251-4f7e-a6f8-44bf721341ac@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:01:14 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sYJf5ZKz4mwI1VTvrAe0fu5_9sTQSawQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX/ksPdo3ijn+p
 Zxv4H6qiRKq5BFnqY/s3zDrR97nS1Y5gSOFuI+BsotGIP90ajfcQZ60s337vmS9TFyHiH8m7vMp
 9rXHI+gKs3EvvPRGokX0SVvLZgdbEP42BRwsZr9po/nNjwcqhBd2NCQRV5ie8KsrCcJUHE/0KKW
 dG+J46s4amFIuMoyop/FabKHrNuVVxPAfZdxIlFbeJQA8hTSkTpzwQZIBaowhNtat6/X9m3xA68
 A/Il9CDIVb92fAZz/W/6jgHiOHN3UWoh7rLRjFhg6i8Jd2wp5d+4ef6ac/y9DRMH8wlbv0ZSh7z
 5zNUQCdrO8lCZNLpCbXCXKD38Ur3/mmHLIn8N8fPYuN6+AONb2uq62GYQsuFT3JFjgag6WuP9sg
 /suw0dhWrdSZzWMw+egvdgACD+7d8geP1soy0hSZ0Dhg5RSMlqh1mHO/5K8t6zhpUlUxqE+PTKS
 yryyl7TAq7uYjq7OxUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX9m5Dblbzm+U+
 W3gU5v30Ufs/ATsrffd9APHu38Fs9wT3VXtFD38py1ipYZ98ndZ7vzwbtkEjuRrWphD1Z7ehCOE
 0HZehFlTIMsg3h4NIyN1VGN0TEHLyJU=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad711c2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: sYJf5ZKz4mwI1VTvrAe0fu5_9sTQSawQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 4:30 PM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

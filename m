Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58051DFFB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376337; cv=none; b=s5TKiddp9XQ3wTFIEMyaJsFT1uQiCTQXPDIWK4XaurVOuE73mFSGx2M7N4UuS0uD5XwuesvYjbK7DGrJL5hLuVs52ox7UXqFVO//Ne3bQO5XezcWdqQ6X8KHEzNQUA7xcGvBd7XXHp6LXJ3hMaUDfx8mOpnfxrxRPHcV1yg1zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376337; c=relaxed/simple;
	bh=007UxazwKBVk6DLr4rQj/ZyfjuNlcMJacLfSlvz+yX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1sKxdCIB13AKgAkQSVr+kHWfwmOYmEdjBV0uNMkIMW6H1K6A+occulIcLSmgi3lIKIQPtQM6KGeW4XzTuJhycSbfrlC7WHu2dQURX4NfwJ/vhUwB/0o/Q4vPvhCKixCSZNLfTuj9uOOb8lAvw99rUq/Mdgi/w7a83jdLFE/3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu30TUyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQjQIqtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu30TUyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQjQIqtc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jHcL3842679
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWYZ7msSYmlK31FCpNcPthlZHIih2I60thjD4nII2Fg=; b=Vu30TUylXcs2ApAz
	jpkrAuzfnDI01giNPNamMcYuTycPsGACZcmeAoEaH68U938aRg7P+tTJyoCzJ3Kg
	Hz7L9XJGh6gZNfZFlqwBjwB6ua7RH+d2K7ux5q4hAzFb0pnK7RmvkShCFm0HkNZ4
	vhd5qCxHBCaeGIQCKaRxdRZ/TUS0adGCNnQ8GZRiysAdrLMPVLTQmQV/2qutymXp
	9/GTDPFNdtlf/d1hRlVuU1RBuri8/HiGbzwuxC9U60XD36wE1yEWNrYhSvFhtuM5
	RnC0kI+hKebmtvkMet94c84ooaV952/X+Na1dC/Q1aqQkRpSlx7hVRm276BRIa8y
	JF/yCg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5uag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:58:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c4d46037eso3724296d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376328; x=1789981128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWYZ7msSYmlK31FCpNcPthlZHIih2I60thjD4nII2Fg=;
        b=EQjQIqtcAE+MKCZ/4lA2xv8oPV/TdbQU6fQUYZDC+SJMKPoTV/icvV8V9u59vj843g
         O0obnarcby7A/umIqcPN5oh8dbtla3OfsMdmbeFn6T0bzo8N3PNh+hV6PdcxrTzUImeH
         UruVPol8nh0+7l/eYkjDt9qP4RwdEWzcuFKBbD4g7ntrerid/7A8aG2O5AwG7On0SvTS
         Z5OFjAxBC26p4QfuvxC8jwuJU2m7fpJphCd/BqR4ZtxYymM8GNUXMwEo+8o//7UWSsPK
         e5R6yvU0I5oAltwwDpFZSLM61/1T711ZEwEB3gr3fzAFD+bxJIDbsBjhKoDSKAQUTf82
         mulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376328; x=1789981128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWYZ7msSYmlK31FCpNcPthlZHIih2I60thjD4nII2Fg=;
        b=YqjyTneERo0UE9vUoYNjjNhoFzWJkyk7WH/m5rb3uhUWZSs1OkxsCu5kFXFBweddkL
         C20Y+SE0GcTkNJwe86B5SOYwBJzan5f6hJwJN9dXEB2ZGqadZtTTatjVV9ucR06TlUMX
         RL4FI1yF7zh+BPcgkmqaEfUfe8xnX31xCyAdwl9vqCCGl1HkamjZY+lPup9mYBgW62V7
         DFT5viYz9j0ob9ZTGe/jNzduFhjybL9CnQRVtzGNwxyH7SntmF47lneGccasC9a+Vbbe
         TXBjJhw1VgwERuFQCuOQ8/LJuhthj0pXYKn1arYb4RC6cry4t9Q154Mo0sQELd0/H6fD
         RyjA==
X-Forwarded-Encrypted: i=1; AKwUvBwbTxQzRbmoRY6m/cDrdWQG5cyRsqay0h2WMutuynGP2zR96aowSDHnuDiv3TcDu/S8A562gyF98gK+U0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kK0mFwTqHIjxLQIFU81A1sXJNKBqaxtCJuLdrvA1hh29sxcz0w
	JiA/1ScG6Nu4BqQMJByO+twgIbitlATXpMuXDj5JCo2akNByLnTIyqvOYTWJ/8FgmVjL998BONY
	BnTkBzIf/OqeT7eDq1j8tkpgJwpAp3dPb1g+pkZY4Bx2E28oZeObWJf1hdNH/Fr1+Pb0=
X-Gm-Gg: AYBFou05V552V1pErN7d8W40tALs+2dUpBf90BklCQu5eLpJwrdPTNRsymn6ufmEX+b
	51zgBdW9sKhwjw/md+/TpRIz9drrzkB+ufAhCHHM6a9WESMTBEP6/2Od5xSREG1AC4n6t4VmYsW
	MVy5mIXGh22dsJrkgllJPiAus8CuS1Ccjl4uJNWeNRFTaI5+ZPlFn4CQ98vXRT5UdiGXhUfYkTo
	oULxYSwVdPaFjrG+T2+LtkjavGC3EJZhN3Gp4Rzltw2mC9UmjRs9TPCdwn0ncQQl7z/rkhhBK/r
	ZL24/V/U/8XNpxXAgfTXQpAIJMrYDc+irw6bAYynsDjRuhPO1C1Ou4eKCMM7pcudGwjcMTQESUs
	LiLkOCKm7cGj358FO34wNzQ==
X-Received: by 2002:a05:6214:2c09:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9122e4f6497mr21528516d6.2.1789376327906;
        Mon, 14 Sep 2026 01:58:47 -0700 (PDT)
X-Received: by 2002:a05:6214:2c09:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9122e4f6497mr21528266d6.2.1789376327545;
        Mon, 14 Sep 2026 01:58:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219ecsm391189266b.16.2026.09.14.01.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:58:46 -0700 (PDT)
Message-ID: <583a10f4-a1ac-4539-8e80-1bf197bfaa63@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:58:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
 <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vg7Z2f807mybOCdwSmWLaSwhqusbpF0I
X-Proofpoint-GUID: vg7Z2f807mybOCdwSmWLaSwhqusbpF0I
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7b748 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HHB2upKr6LlMs7tUYOwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX2SST+Xny1zwu
 2C/sbV2ioctT7PhMcf0RYT2l0kMAKRx/yUVr2J89fl78nRp4WZhCMNU8nBMaIM6HyPeYUUUtPQU
 vPMcvWSqQgec+UZ1adU//WDaS3ofyhs+sh3N4atwAuALcl7+n+4uKeArnuSmgBARPXUhuKDCjzy
 E+M2B2ZekT98Pv+nZRN4Ar8KgvPJ8PgQSMWZxDHSrBFPdHk012jqL9NlrvOaZJ7tQVG7QO/e71B
 6XPlY4LRjDGVV9wwbltpw0bNAsHY6GYK5PlhpISSak+Blm9K/ZX+4PK1ywMeQ3fk9cr4Un8leeq
 HwZcRcV0rDfQnqmFDU3jp/7ZJPQ4ffxu2Mpf/pCJxeJFttTmPjRtbKLTXCO/TKp9Y/CRubatm1F
 /yUbHa2AVibS55SR5RAlZwMksGukEgC40aloP7c/QcVE91cNhfjUtiaJ4RSok49nDK332TMDSJW
 pGfDSFMO5lpmHj3AK0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfXy4DoRFqyLRm5
 t7H+zyKoPbD5NZR5nNhZgbvwr5Mopyr/FmfE95mQyvY2C5yLrTt4NmM2RpfYPFjBT9F4eD5p5PS
 bLE3Gu2wfhperfAysKylOxGe2m7ra2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140126

On 9/14/26 5:14 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

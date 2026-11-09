Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222498;
	b=D7kaVygzeC0OGN9OBgWAUkkK+ypElFeMu21VWaM38jG/tQQf3vtK0ZY5jnTiaFHXlN7u
	 u1SBi5bgLJF5/g2R8UG2q9D6Xr2xqhr+fQuKhUBSDudTpAUJThYELVzqBW0jkoAMeS65+
	 e4OMpmZfVkyOwxtB4CN4KzfQJVa5o6mv0i1XbqRyZqR4T8nTC4DaZuADVMnX46aXBgQnt
	 QBY25XMgfJqPwSUn6zxDAOw1jfxJ9gdPsMh+D25Z2xfWjri/iJrHi6kqrZ0vF9JNtcRrT
	 NUIbC1qMdY962DEvujmfIf+3IZkpNYDkokVmuXu3co7qx9Csr3qkXt9jhPPptzRkHlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
	b=TigGKxdEbU/CnvIJBxm0rrIo+nyUGxJDiOilhe7+vOOryu+Vjn2iG25YzQJx9BIDPMKm
	 rr7WxI8khGc0cI7zdWYrbGyBGuKBaotwtxX9zoH7t2DcWKtNFe5dwUx3CQE6IF/Coyq2G
	 ETkAVBUGoEj3X3wbbbQLFRm7NlpL5BNoWK/OQEuUCuQR21LAf42bURGg/3t/CDEH/swpP
	 yedboEV6vXm+Wa/WRi7tmbR6F5GbbKcWw1GHa+CmLbZf08LjYNeDAVcR1M8AzoIhSSIXn
	 J0P3A238AEWUfVSJ5r/hUdZvpO8rjbuvuArzamnayYtq1lkP1ztX8EMHbZeO8ydw99g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHo7EinQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b/q6LzJQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5F606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A5F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LHo7EinQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b/q6LzJQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v6vK562007
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=; b=LHo7EinQJg9ARF4n
	xexAhH0K5D+x4kWAJSUylb7Smu9iPfa1I7dmdhZ+0cPSsH+wPyUt4j2t7la1iHH4
	VddscktFCR5IrT93cKxXOOku1kni4IN3y7NU7yRAoWTfouT5r8XYbcRprBD8uI62
	vnwFDLlxYvkMOSVgH8fWk3knoIAtryLKT2MaA5NMvMGNXG7I2Ui0nIlU4n+Fml7T
	qg3Fuy7zLNHDbYLnV03csDxAYDixGN1eCLXj1BvyBlzI+DFLxTbMJau4XcVtbL6a
	Mc19gRvhksR6JkjeI7i5el+MilEp4ZT9vcJNZ7ItjQX766j7C4HWF6IfNmdtM2fO
	RS95IQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxe3bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:08:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso17233385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222495; x=1794827295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
        b=b/q6LzJQv6U8+LiGl8h2+VgYxDAiT7j6UQXWvU+MBWPOAKMDSLvC3BUuRIkIPDewZi
         i+ID47LhK7CZumhzctS4SebuBUzxPsFcu1qnz7+9FjzdkPUTUZDv3cw+L5bUaT6ZOxJu
         SxHIFZLz1G7Ux0HbWpndvNn4By57WeFtGU4yYeNJYW9XW2M6pt11p2+jiboRZssAnD/J
         8JlH+UNuVofoTm0TLhRhf6obeFX/75W6cnQyNjvukyztIP1ed0Ghlu61+3DYnEb0mYSj
         lZ2h5Gys78HnnUHdN/nbgMY1S3RS/M7jau39El03nL9chC/I1Q/aUiWoq1OXGJKxTYqf
         wnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222495; x=1794827295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36DtqmFY9ZuwB0YeiQKuJ7Aj4UwEcsVzlYW4e3gr6+I=;
        b=z3vOOdEFximTbQBoZZvHi7dzbsKAsW8Per+QfQAs7U6/wa3RHmvfOfvkSvRQbFKR8k
         2Kp+OhJ4c62G0+1Jmnpl8b1Luf46XUGspDRW/MIXg/LTJbOWxbvFj8lWIN7nWpW6UrFw
         QzXzt1EvgOgwYPXlfDir3qevemHh1864dvVCut3NMC/9S617UWDepwNJE4PooK9k3UYq
         R9BZqeNRwEIuSDmJ7v5mJv0cYik+fbjNAaEI5LHXxVrUYKk7/c5YqKH1Ei5a5lCz1jFi
         oMrs6WAm8q6PEzdP6c7wSnnSa0j8tyRlh4pD53mqCM/oL6MGwQfosDdH8JJr00n4CrR7
         1CVw==
X-Forwarded-Encrypted: i=1; AL+hErHofBAvsXgHQo6WFDTRPN7+6OxA0QjAy/AlXBPxPqTsOXQ5Ojv7SFmjGO9j1jupgZ22p17l6J+Grm/RPwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yyGHk9GYQ0qcmqiwh3mSUi/Z7dMi0XynXitbr3GYQNgvBNgAI
	TwRTJbIS8sKnW5nv8Da5VIXlr56+rkZPgMTGlFQhwvokbFtbyprV/u0k2TUaMaukldkuhBtej6a
	IeS22b89Q+JgbBSSR3bxNe8B3ZqIiNCbouIGSBvF9ddsqKZh5v/cIqZ9IOGdrSd++1M0=
X-Gm-Gg: AYBFou0yhuUCoZaODf4UsMck4I/oDE1OaiaNBKQpF4SZ7wA7r6fLWnRYsgC0ayvjOBH
	96T1Vk2c3NPjeyp7wIN9PhOpxDGfkmfRDBC7Bn5okQdGZktn4XbzP2En5UrQ4XIASQEPzxuDmbc
	THdnWvfkjVJpuoxeUq+zG6s66HF4NnRQfNajI2eATtHIP8NU1eWgRlM/+/ly0pU6ltLt9w7SB5W
	PFoAQzOdR+O4xgQpAECL+KSz+8FfAeuTFwHJBRwnQ2H2WH3HWc6anxEB/UENVtOfjE8mluwurRj
	WVbj40O4NZrhksXOMpwFISz4DebdCSKOVKIPoiTUzz2QNvxjcJeA8w6vrHUx0Z16rRqTruEXR3k
	n6U0ZZ5xQE/jqYuBzLvHc7SZV4anxd0WDh+gjrUvRYqxJ/VpkXUDVBT3U+962gAbmhYKC5Q==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr515074885a.5.1794222495312;
        Mon, 09 Nov 2026 03:08:15 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr515069785a.5.1794222494798;
        Mon, 09 Nov 2026 03:08:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f94805sm148341166b.26.2026.11.09.03.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:08:13 -0800 (PST)
Message-ID: <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:08:11 +0100
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
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W_FHN4i51KIrt3ZkUGcTj7hEV6-ZIxAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX0YipzxvmUvt6
 2mMbahoGnNZoGGI58JN4R1V/+XRQNMWuQA64OyeDbps/sV2rxbD7WWm+EDcVFNd4oSdZyEQyCx1
 1DBUnjX0qQfq9VVebPmjJKP6fTANBMJ+x7yv/hnwTT110X31veXGpjG4W0Of8ryDf2xQpshnf1p
 axVe4kEASeL4CGpK6D8K3FTzkWJ6BOWo608FxG7apHYmOlnxS3G4+tQeUB8Y+ycZRUmAsibJLGN
 lg2cJukPsVHaNr8EedzF7Hsb2FWaOjmPeRTMHXJPEZ/29OZqRvLN8cF3g3PQGnhjUFJk2Xyrvc0
 XoqnHmBKa1n1w7bVua5AH1MZ8WS5sg6MUO3jfWmXKs3YxUHGlK/sGuqABNCZfaL2P9fSUsoQZ1s
 n4rbxS+rw2lJ64+DrBpA8g/e/a5uyFAkvPcBhTSJJ80+kmJB87IOiw1L4m67a+RE27mtmKWpPxM
 FO1agEZPBAF926iO6Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX8tSKXAmTsIuj
 66asCgqUVN1MxoBgL2r8ciK4OoBsdXocw/00nnnXI5bcBntDWpBY2o+dhGqRjBzyHg1NkxeZBRZ
 PuzaS+njHZ3zZgLryzhqRssS546BO50=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1a99f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=0q0syt3hQrrWoPH5w1IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: W_FHN4i51KIrt3ZkUGcTj7hEV6-ZIxAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

[...]

> +&i2c2 {
> +	status = "okay";
> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";

No PM8008 on the other phone?

> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 112 IRQ..>

[...]

> +&vreg_f {
> +	status = "disabled";
> +};

I think it may be cleaner to move the definition to the other
phone's DT (are there just 2, or more?)

Konrad

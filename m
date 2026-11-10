Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310218;
	b=C676DeFXxpV3MqcjB5U7tfonSatjNOxc8tStzl/xcd7bEE8AJ5qsgNXDnyhMt+5fysw5
	 EOqB0n0+fj8UAoDRUiREZhCqy/TDbC9feanCGTsttoGzk03VoHhPGmgopyWKJ4PpUMf4m
	 jMrKDRB/jvRhdr/ZsB+dBn09DJ0r5aPBGZ0dUIdL/RcRKgJK+rdNcQQ+iJ4K3gy5Kdxtg
	 by9AuCKUwGCPbdGSfFcqovhtWtRz2ldF+Y4Rt8wvlXDPLF3jEctRDlXUz6WN4/qyUlu03
	 SO2BczAhOMqrgiWYT43zDQRO1BGujQhOL6WV1hUPYvmCTZY45qByLyJd63D97vF5bHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
	b=mZoEpiPpHYxTPJGwL+SIQXr2WH7WSJCrJgD/8IBgWDzDwC2Cu1wQhFG6rrdcbS9I0vK3
	 oZGMvPwKBGSXfVDvWy6U1tRgYvbSY61sRnH85UrrjdGNyyL8wgbj/p5sA6sjlqEe4a56j
	 I543zIIplGY1JsFHnoX9J9gGAOdpSVf4MMaxoZAnFOenA2/8wqWhAvta/JBrjVXnLGnIw
	 X+qMKsV6B4t1eMfsBDklCF9cjsuoCUwTX9JBlpkNmG4V4mYfW9r4zphLgCvHYeJY+bZ3A
	 oFyAaI1EosRemCCD4fKl3glg0BBcA1ZKFcnAvR6oMdThVWsZA0ccp2a/Xnm9NUO3xnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7bbIAyB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA99606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA99606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7bbIAyB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAMao3196464
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=; b=QqnelBNbbS62un9n
	7ny8IsyVSWcBmz6Xf0VREBrSrSnCpvech2cV9YL94kXrOxcASwIRy+h0AgfiAoJD
	wyRFSAVn7H63KnF7UbKqKoCJakBJpBuVgVNRvm+Ay4CSdZ/YSMdhSSZn6m8L9DYU
	WcO21F0zTvhilgLPVXqBsbOXt+Cen0SaKaPoPHLE6PjzNMk0kpkiiZcn95esr67N
	6GJVmIJaeo2anyJbus5ugKMVf8tIKBny/CgmR0ge5/y6N27TvXOF6QvgDW+OxxWV
	lHEQwLnrYQHFb8uZcvaevnC388/FCcsTQqssJMV+7tCTgjLAUF00r8jkfeS0mFBb
	QV///w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crjeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99089f9591aso389614241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794310216; x=1794915016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=d7bbIAyBjzOP+rGQyYdVsvz77IsNcsBnY1qiHF+tzWAmwGFefTYjwMw5vi4ceJ3QkF
         FH28xG9p6fWLIKst5KoqpICy+jGPU+awpeo1lt0GCWFiL4fw6L4uvvcASNG9pcrNwV7H
         IQ5gsf8ZeQvW53tUx7y/PYEALMF0TMvR0hiUnPh9Ro3Nw+aV21iSW66zcGNO/P+5m99f
         ceCOul2CXKjwj5N6saKKpbmeE228BcFmO3ycrfwQVpm6ax5uWWfrjJpEPLY5AsqNii40
         qe189CT+sPE+WJHlBjkxcRxmG8BcyOsjyJCF/BbOzeeiBLLIoTl/+oj0KemTVy+vcfSK
         uVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310216; x=1794915016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=1B9BKWFC/zY6D5H44ze9tfHtBRQ1qkr9LQWeLNyP3rFScPZhPqq3yKUGLX2lxky9J1
         W8QLd2kgZv6WBlVmBsjuxFCnDdl5zyUmI/eT6hohSgnz71IgawC1wg6JD5hP0wcjU3yW
         TKtTyKb92vp6P7o8D2HFdqeGbR8C9EDl/SDxB3UKwFuSamra8mKuFMv5HYS24/e5wIku
         g7eD0edZYTwbFL6i/lTsz4ozAMctHLRzONvK3R8LwT8lTG9h++z1f58blqedKu5AZkx4
         6DjY+7DnRjSHCVxka3M1BNaqyVVX/IfT/sRa1BaCDpD1Cdl6X+6lqKrd9oIKAyn9UWve
         Z25w==
X-Forwarded-Encrypted: i=1; AL+hErEOPCdLe3EAxARDHCB9symWWLYNo9bXB7H+l+TFjb3YU+r4QMde6pUs7gXIqjyDbaXWnWkSPMYXeYe17oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qBqzxyv6QZNVr1Y7HOps+9wy22lFCpZgUcsr/o5ErHe/BqnT/
	TJkYf+wFPzDy35f+ZzRuR3O/NBTwnDRhQS4sbsyMoSxjeyIRugK33B7+XVo6xN9rNS0TlvJSlPM
	hJsWZ9R1JxjAVVf3WE1Uw27YLVf0H41Nu6HZwrH26c2t2wCGh2CMUdRY9PnwSoRzJQyk=
X-Gm-Gg: AYBFou1gILT9xXsP44W7YLdaX8eDuTA+QLsvVfQ/3YrDmrrMwhkcxZ8IVgYVvYSSMyj
	zCPWzVW+dfzZcgRxxuNxbx3sqTDXMsNMld0fKWnZBFLIWdVqhyllrv5uT7Fh8v/O6ZgG7NiW/yQ
	AJ32geUQqnBRjtalhqyUoTYmt5U2Qz1Wsj9nKbNh6d5NXRxNXgJnbXYtb+pKvWhTdiTt5uKqA0U
	G9V2Uhba37gHQyxjQEhxxclBgO4y1QFpXbRvtnzO6lKLXqT6XClPxcHFEP0lJvB5mmc6LHPCwSo
	IGms4/BUzO+NsXJeQybZ98eigdyBuFLEmoyOHrk/ubrAwhrHVnJO2UQhr/zb27TQFAqCMCwl6Qa
	cSm2QH4Gs8SQJp9qevuAkI1AHa9ND3/uGV3pcoTq5o9+v1xlN13wXA+2wwLS44+/TXXiYx7ownm
	43yd8X2IZCR+MypfMboyPbn8ywx7NnhPJY1aM8KBg9Sy0yIdYx9gP+zXfT4RcTPQ==
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613061137.11.1794310216409;
        Tue, 10 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613056137.11.1794310215878;
        Tue, 10 Nov 2026 03:30:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm68744635e9.15.2026.11.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:30:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
        Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: (subset) [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Tue, 10 Nov 2026 12:30:12 +0100
Message-ID: <179431014821.61906.16254753709778386743.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FqszVnQQFxBuhGyKizig46agLk2QoZ6v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXwjfeZ8bbxOOs
 hZO0jky3AOiQcT3Bj/0idv+hvl2jAr8bYyWKCSTZP928RMcDobOfPDePGD3VFlM6zHH15EYJbHL
 gmb5gT31Y9fvFKPfQqzlEqUFP6FBQh4=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af30049 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WvVV-90v2Qb5btd7p0QA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: FqszVnQQFxBuhGyKizig46agLk2QoZ6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX2cshgduYHEn6
 IZ3wQaDk2Z/uscVpn6ltvMMqtxWysnE0e5+Tbok1CanaOcTWYGvmNkTN0Jmzd/GaNfiRljXuWe3
 NfoO0OvMC2Pyv6jqKdWEqO6tMhl7hr4kv2LNCIN5PQJvC5qKSnCUnZ4qCUTM2z026JnUJaY0RK+
 ekAXFl2IsBTyygrI/OUI8lPa2f1KnIZN3PDzaKGaegGM/LWMaIT3pokU1EDLE0Pnn5FIRzDM5/J
 tT6wZ47MPMPqz4x3EBlzJBhIANZVvAuUIMYWNFw/w/AmibmOkOfBegvbGBzQr0VZwhr1SU1wlvx
 Tg6LWnjqbt8+MojX37WoQjY3Ntxfi/NJAQG9ugL7qxtANoMF99c25T9XBhOGCn6sPoqbrvaSWw+
 4A+VPcpSPjiAEoGmE+XEva7IhhgZSxvpDy6VOMuCbc9584XSPmMF2euT65h3Rnrh16O/tpSPHdC
 L9U13w8+m03C6UaTwxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045


On Thu, 05 Nov 2026 11:52:58 +0800, Peng Fan (OSS) wrote:
> Per i.MX8ULP/93/95 and etc reference mannual, there is only one
> clock for a GPIO controller, so drop the 2nd 'port' clock.
> And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
> PAD, not for gpio controller. If we need to support digital filter,
> we need to add the support in pinctrl driver.
> 
> With binding fixed, to avoid dt-schema failure, correct gpio node for
> i.MX8ULP/93/95/94/952.
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: gpio: vf610: fix clock requirements per SoC
        https://git.kernel.org/brgl/c/cebd1c0961d802092bdb68c591d4007b1b662296
[02/11] gpio: vf610: simplify with irq_set_irq_wake()
        https://git.kernel.org/brgl/c/4d49c80223fea433266e5b84464211c6acd86347
[03/11] gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
        https://git.kernel.org/brgl/c/00e3c475fefd0eceb7e1e01305ae3587e654bd94
[04/11] gpio: vf610: drop unneeded header
        https://git.kernel.org/brgl/c/78b100b8a3d2119b141041ddb3fd358190c988b8
[05/11] gpio: vf610: drop unnecessary wrappers
        https://git.kernel.org/brgl/c/0cd60ba4dd958f343cea5970f237c80d589f4cd0
[06/11] MAINTAINERS: Add VF610 GPIO driver support
        https://git.kernel.org/brgl/c/c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368A43F8D7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452311; cv=none; b=eQIbQkeJ5ql9BpMhfqdLNM3JwQCOi+aMTVWQYpTnxQGgj9JUGdBVBV8HxiRXEV2h+LEMXBwU5iAgcnS0+o4ZlbnGMOnpn7YrCV3DbwkQVCXKgOdDPG+MQQdIBUk63BKmacQyUN9uWhcjc9bdqdowXm9U7a7hpw/5p5Qsgcnx/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452311; c=relaxed/simple;
	bh=lmbl0FDJ8BKHPU7iGiLSRRUOzdLjYSXjkdgoP2gRUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daR+hD9K/CDsoNfyL+c0IMtbsq1frhXfkoYMqxUW7wQ20Ta2D80mJBzyCGbxnIcNUJFaUiId8Hfm9t9MS7c/uQW/UVTVFRu9597lIzmcO76Q/4fu8ASVFKUdlw1aIXzOG9c4gQokLs884UPO40E+W33NB8w0gWVgZzbDuMobg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYAr1IbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVE9d5AB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYAr1IbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVE9d5AB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F3Rcr31758504
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=IYAr1IbJLqKGHlp+
	8asmbPHttAf9fAPsgi74UFS+fWXB2zYMG+GRBUm85azZODOx/3pIAfXSSu/i/kB4
	5bwFbvagZrWPOUNgmUNmMOtSw2B3A8xhIMQ5h595xLXb77yE2vHyOUjIVCOCvKL8
	Yh9Oz+g471cIkF59lwAgs5JY5Fd7nV4JAm37hAVdwzirn29fwbNa+0ePm9SfqOq9
	G7NSkTtNk2EEt9l9nuba4rvDRUNDDOb6rM+v9U9c1h08OTLPQkegwsp/wKoqVhOs
	YXbk2bHC1haLukheqGRPl6ExyoQBrMgHSXBLv+lUOau6J3TMBsu0Bj5d29FWLNCr
	Q2ymAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8hd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:05:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso158538185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452306; x=1790057106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=fVE9d5ABIQKYlGViC8aOFdrQ215dCKXoVhE3/GvEez0A5Mse1Mr+Nv5v9NI3usHgxt
         SvTHJ5lSKFCZGuQU1fv1lPblvFgoCybgpXcNyiWyj10sPmi7oyH/pm4e0tl6Bv26EeA2
         ncIWJq/fTDVbRMSbitzqGhUtzF1c3y279795mQHmBY7nthkwXXMuTxYrBeUdlFYQTeWo
         HfKpWsJuzm35Zplf1tRMzAdwDxrYeRqyr0WqNMgrhXN8MkW6zO073DDfwTcUT/Ix2EdL
         GNfw7OvT253RiGTsfR/7tQOkYlcPJ/Yq2iWQGfVrrRYxpv20oGyBAEU7bJvIVSOgrrNo
         vAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452306; x=1790057106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=2OEUXGeGhteawFcwJAZ7TjC8qyQoCdLkIuWY4dNTNiRY33wr/inJmXkyw4HWcohQyS
         0VTEt/xYiKe3rwhZFg/G0c7fLs+WK7nJ+rzIUgpeWTzLbLjftsuRxFDP6g31xfz4DOon
         58LskmnCm4PZ4arRuJdguQGojwEnDPP7AEElZzBYHuXsa6AUHT1Z9y1S37AcaEpxNHvO
         5C0E3lUr+pulKXdKvQWHGddz+e5SdCTgIOMCy5+1ZRVSkEyevlOJ9S/g86RrE37aJXp/
         TFXF70Yq7y8Wp6xeAnUNqNnEN2fbP9eLBj0J8tCmvv92rhd8t1KRyeKYkTtNUfNVuxrN
         y/kw==
X-Forwarded-Encrypted: i=1; AKwUvBzSDxmEBM/KKtf9UjXA890zHJKBzWmo5gbFC6SXqCNv6ZMDQBZnbjB+5A0RvExjqVlZZ3n6//CsuEtDkfU=@vger.kernel.org
X-Gm-Message-State: AFuF++leMYo1efCHYEp9rd77nJKIgCpTZ3DJIrB2xbS7J33KvDWSUynB
	I2SJyWMCQq5rGeNgA1YoB9ZB0VA3e8TLjE5TjFJDGripBiEZlJajzaK7g5czhOhayh3k0FaA1l0
	ahTgJM9VvYh+XbFlULkNtUgUdKa7+O9R8Gtpg9tVg/eZm0FYyUeDJQlAnljl+M9deBfs=
X-Gm-Gg: AYBFou0R0I5MPvuOaxJheSFhng+XzDRIcZWMzzxHIe/CFoRTfCqhtKodA/jwLKD46fb
	UEte5bVimLMGmuQ3gSGjL3TOFffVXjPDCi6R4w/FsxU4x8u9kjMx+sL+ZcysIWqJjoj+dRRk/6t
	JUvGUKPp2we+TRm2sRIQAUPcg/G9bwkgvvGZlSJWhB9MqAuw1028eNOMlpwyX52enHH3ZwKdd94
	0J1/5HkVZDLZRLB+/pDgtpYmp/3UPdTfc9BGef5rOHZ+hyKiIkXhIbmiJwZljkOTaaaf7ad7sgY
	QO+NVvJKqNA4nLjrUDHkItjcqRo984RjtgYjDejhpHo8rrcbFXRS+DwqP6+Z7pZpgxWUNOIE+DO
	jYyltJJe1kvWyoExCAN1xJ7sUSO0+
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323526085a.29.1789452305618;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323522485a.29.1789452305151;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm30648123f8f.34.2026.09.14.23.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:05:04 -0700 (PDT)
Message-ID: <18eff59e-e9ec-4c44-8d2f-f689bd5f1832@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 08:05:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqg6VUKriyVANv6u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqg6VUKriyVANv6u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfXymcOEZsMymDy
 u60aHQxuxWjCbIX2sZaJclFGWoXjl7a2BZLEytmBOxLh0Gt8rPotxKRy5UDSMs4h1hWaYN1SfPi
 2Qw5iH++j32kGA1HJWMtRIuzqC135rk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX7ES3NTp1dqel
 jYDEYkuQfgNMOwF52mOnRn6PvFRL6+f+hYKh40t939eRHe+uFIl+R5X06EtS2TrI5vStuXXBq6v
 fx+9uKKbE5Cb2KolQlDxiSVu6rsXxZqiANIxpP8FfFvvoy+aTT/KcNM3i8QH1vqsUfnpGNJleyc
 Jl45v0C+NtiiMLp+lYKOQcVZQKi0mNqrSApxSByOuv/ZCWvoHND4Q0x62al0fs/vqdPwicQ6+Cm
 98P8RiG7yyNG4rWfIRsMszz5szCH0/dLrcHrhAHlt6jfjU+PW98f3lD3/JDKx3qQFtLqcg9b5u6
 9SDA6fIuPkPrKsm/5Q/oA6G6iRBuqzFWkEdZ3od2ero4/OU8I7V4KS2BxDHiNY5rI57/eG4I5NO
 exEONRL+M86T/b8oZh90IuVW4e7UVbgdeb24KWhLwtb07JcYZobtREPFX1nkEfXHIU74qNmKgfJ
 ZUjqShNwi+xrXDMd6zw==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8e012 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: v05lSpoyA5B2QWJNAJMLSZ3ZeEte7JF0
X-Proofpoint-ORIG-GUID: v05lSpoyA5B2QWJNAJMLSZ3ZeEte7JF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150085

On 14/09/2026 20:17, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Can you rebase this against current for-7.4 please?

Sure

Best regards,
Krzysztof

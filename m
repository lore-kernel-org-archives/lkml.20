Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223971;
	b=fgY3W1QO+al8+1JZ30g3LED7hgLXtv+Fr4hVB5WWsl0LQYA0pOEfJygpnEGBYdQ2dAeF
	 fRzNwnusDyPGd/Dv4KkVu52rSKWykEEeLaXIat48JbocomkuHOlTu2InrFUNgqisYD39w
	 wwWGwGRanVK3dUcmjGIxss4bK9zD06I43OHd0a3wEtGD0s1OvuzvWydWMpsm2ColbLV3e
	 15YlETldjujnMTDXq5wkOdaIePtRu/4TS1V2gFjePtBtU706Hv3pdpyqe835WlnkkSjoX
	 VM8dTOby0NDc35EAxDLSb6pIcrUNvl17VAjOMiDkLgybZA4ysQDRcfFsb2JCY/pBTbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
	b=4AFpbbXvieP8dWhSWfgHoouv43Ou7d056u4/JB3yhhUw+xxm1gi/INJ/PoHYNoRlrFGV
	 S8UHBW0tcp9ZqYCcSNdhcCH2vNFOs06wwV9ZQt+1DBNXj2hd3ZjdCDjvx2eosJ7/DTTPh
	 EXzqpwu0MR2+e0Q99WWgTMM4GHwGnCuLcQ1mG87DFLAhH+gYH9u9oUDF3NHf2Naau/oiq
	 iUXGev9mcVXtMW3WZq3UF9AETGpwS7g/dCHNKWNs4KeyqyxxQqbhmrX4dADTE9qyRNgXT
	 a9INQITEqduBfH3fZHBl5AYv6Jh6p7SD1ajUgc1QVt3IK7RThe9EjQt63vf+EWrLpYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qr+CGQi5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOqqfziA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD68606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD68606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qr+CGQi5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOqqfziA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPHT62969855
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qD
	gpdHPAIE=; b=Qr+CGQi5rIYEDNqxvY0FDiFyL9jPmq29Pwmoeccb6c57Yuq+Fjf
	iRlQWk9kFq3xhCSMa6EVEOZ7ACmFabOma1s+E8RH9qM1YzhtGufS8F7/E83jX887
	Rg6IihX16MLyeLQB2Zsx3ntk9/0MjKyIbHT1eHReFlCkE9soJyB2Ouv7L2UmysV+
	QOxANO8ZCeusvd+QDjec/miL6f0co8CkzD87hVufsP6v387leB/i4RUgLfr4SC1A
	ahrM8Af2LkLrrtVcm2gx/8RUg3mbJHbgRwSnJH75CkkMN1/WHW5jGjIoX8nsfGeX
	V5e0e4QNqZJa6HqHhCd+L7SQgLJU0nlwirw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehsm6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:46:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337ed1ba44so33210251cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223969; x=1793828769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
        b=NOqqfziAKxWFFwOTCevh+kVlSLCnnoMBiZ/FIMDUcQ+Q24FpjcvV1Zne9Qr2VvDa8L
         jDpUZ8nTzRfTOMDHg+UyrC52fg4uuGS6vFKQNg5J8H2HHol4mYvV7lVJv0jd/RpDLKLN
         A69JXgQrtqnwRE1IhSR0Cb0W2DqlEzeoZoK4ayCWmPK/A0rq4Cj0xM0dynt7V4LiegXA
         CxpXMj7qSFXL/4t5wcUlVu+xc9dqGvgieQ8c0AVwnEkcvOyo57WksGKpEYboBM7xuHMr
         /GeytDHa87mjHE7wyFp21vGDBeMYMd4a5z4+89UkqOA0ZuySFyAgSFdz612ifufq7ViB
         t+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223969; x=1793828769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yatBU14VGzZ1rXDUAbqIfl87LI0npKeI7qDgpdHPAIE=;
        b=NBpiCOy1/9Cz3sv8bNUgxuxUWdyajlpDEsW/UnMP0XtUHo04qk9E8dnf5ftN8G6ij/
         eLBFt6QUVW6rnw4OXXMygUWBqGi1SwLKzaXqWnYHvbvGoxP9AYSM/LYBZI4mvL50zz4p
         SkuiTRL/Mj2vWIFYh4xkhm8v0Pyix2GjB7r3GbR6kK+WpB01XuS2Ieni/lwL8pJ+TnwB
         lxDBVeyqhw2t08I5qlgUnHxeTDZvvdXSgGXESpKIHQiPcg2SPkmD0pKlQt8ZUP9kHr0N
         ZrscROc193A1/0V7sm6/eyc4BqYTs8110/EiBEoMHkO41W8LPBThm5ebF4kWRgXkYWQU
         Thkw==
X-Forwarded-Encrypted: i=1; AKwUvBxc1K0NWOIdJWPwcOF9WS9/teae6E0Gtno/Z0ozLCaPl52NE/uf0e/jb3X/rV/8fD9ApL3kviWou0Bbdwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzDbKBAuTZNxekefVig5lbdyfdEPXx+mdPs6Z3ekP+QsTu4hem
	IIu0C/OSUx+a4y/f+VSMqS8Ae9NwtdSMSZ2pCCjd4GaUZieQjs/5Rbj8fnAAZgrfBcz3j/yPLD4
	wUT24VmaIxksGPOyEo/gKujHpU/BnTvVJxHtz1HGfl7q8kOX3k6V2QP+LQzP1s+n1Aj4=
X-Gm-Gg: AYBFou0kqBkgvuuIPM+Rgc9PDEQsTBY37pVw2QcgboGk6+qq9BajEwUsbPTEHtw+Tpx
	Loi3dGzqqq12RrATsKYWqLEGc/N6FHkUovdLDWKSOideuxF3fG5L+rWwOFRKrNjbJzHkJ13Repm
	xiYVxaYiXbmFsSpFIcGhN95NAuwK2p9LEunMr5gRI9bNNrEBgDBPN4fAdgrWq7FJ6y1kPPNfggW
	7D2KGoz39mqwOjNYEW0QRxkBr6PZp87J1wgBJSkcnk08AkRx7cXIOfcco30UWAWouzLS4jMjf6X
	985GOC75g5j88HeLB1OcDuvnUiXXhzn/9R0sbEgtCoI35i5vAsvXVeQKA4dEWizZjNSUNImzCOZ
	yqDDtm0IBQ5z0uZ95CAk5GlV1mKYF6ZVThSeTkLgg8gOlcVrF4XXKj/G2dqhfWA==
X-Received: by 2002:a05:620a:469f:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-94408930328mr566037785a.4.1793223968764;
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-94408930328mr566034185a.4.1793223968293;
        Wed, 28 Oct 2026 14:46:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: monaco-arduino-monza: Prepare JHAT 40-pin connector for HAT overlays
Date: Wed, 28 Oct 2026 21:45:49 +0000
Message-ID: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k6ILcIzWfHo_XpMVxV0NUZRcFo975IRx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXxZvbgK2I0dUx
 FeHctEYkvqEA2pRwImWND/3R5qouGnWPrFXKiMdPDh0rDCHbQb0ZRWHmUufXSkstbsN1owvXl3g
 Q8B7bvwMAdG9vVGuw1VfRq6/xIgSngocPuEOig560MDc+Vozb/q1WYKM3fiDcYedxvFXgZmeIRY
 Ktv/RzZDeGnVo4WoLYqZtav8BqokcLCQ9yJXwn7EF+2Dp4qefU3GND186dTjc1gDfKPoyBc3+FB
 FgC+LHhsyrxHYMhyver++jjw6UqAqnsyE94bbRxWUjxhTkEN7c7oXHbrLqdUdhsnhSklQkC30Ft
 9mQ3C0MAXTpSSOaX7jWrcnxn13KIVtOlE/6TYcMgXJTcggaSuOF4mx7L3XjDmk/1aE76y9aVq4S
 8OOHSoNcRnnY9kcB23bE5rVGFAzOGSdy9qdPVbx10Nl1O6YjNsGT3kj9JaIFIseh+GLhvoAdBWG
 bIeAJGzkaJWvUQCkznA==
X-Proofpoint-GUID: k6ILcIzWfHo_XpMVxV0NUZRcFo975IRx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfXzLooTo9pLcTB
 65z+EK+tSDSCCJvDvRaQVZCX6weWhazTHFL5eFno0pQQ1WLjSm2OchCfIg11H+xJRitIegvAZk2
 NUJl9oSen4Abdu+hyEOOokYU5b9L9As=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae26d21 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=3ufCqafKAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RhnwN_n8znzIZ15-MQA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=aIhU7PV4tMzn2raNFj2v:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280086

The Arduino VENTUNO Q board exposes a 40-pin JHAT connector that is
pin-compatible with the Raspberry Pi HAT specification. These two
patches lay the DT groundwork so that HAT accessories can be wired
up via overlays:

 - enable I2C0 and SPI3 on the JHAT connector and add the i2c0/spi0
   aliases, covering accessories such as the Pimoroni Automation HAT
   [1] which uses I2C for its on-board ADS1015 ADC and SN3218 LED
   driver;
 - add a label to the sound node so audio HAT overlays can extend it.

[1] https://shop.pimoroni.com/products/automation-hat?variant=30712316554

Changes in v2:
 - dropped patch 3 (Waveshare WM8960 Audio HAT overlay); needs more
   work
 - picked up Reviewed-by tags from Loic Poulain, Dmitry Baryshkov and
   Konrad Dybcio on patch 1
 - picked up Reviewed-by tag from Dmitry Baryshkov on patch 2
 - rebased on b-next-20261028
 - link to v1:
   https://lore.kernel.org/all/20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (2):
  arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for
    40-pin JHAT connector
  arm64: dts: qcom: monaco-arduino-monza: Add label to sound node

 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)


base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
-- 
2.53.0


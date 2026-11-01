Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540267;
	b=IhApbZ1X7yE+AH1s2WLVpWbv8Y82+6kNhXvKsdYm9xA2MR2bviWnlm5xBz+0aC3/FhiK
	 /sRLTKq9/qEo5Iwjr2u//0emrcRj3FucqbnPLUQWsmoVziNLViPbgX5o+GW6Yi3J+Xlly
	 rF91fTxMEAZeklOhfz9cUfnxZTxkguJNkwKIQUIpZR8uE3WEiyCFAq1zP2pBWHhYbeLOI
	 J74PdAll1S7qWw43FVmTEMlO9uA9qjeXoxyhUuq6aF/vl7vyJnsNIBmAEa4rkarkIxXJU
	 EMI5KSe2OfFngPqqUi+Ez3m7jvm2HqvvCkmTDLE0EhHczEqUE3YzPnINop9hN4++cOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
	b=2nPqGSr/GB7XVM0R/6u+5KXdQLHQTmeelil2jicyZEjzPmdzpMqdlr3Pqeo3dVR/MrPq
	 N+67ySLPecVZdaTibqJYShF5Qs80bbtHK2HbAP2dGFrozafy85g3tvEKkCqegsMLMt8bl
	 2yBY5DbvC+SQh4OuTEwUwPM6Hgl8EhDwebpP9mvkf7dFTiydZSY0L2Y6vpXyee8ZLVzgF
	 PI67T/vfb+EGnwcaZtb9kD6KoD2WVVpBs+p5+6FeR1HK5ZLTKC1ihKxrnzlbnVFCBEWM4
	 E22nAOj9z8IngG8yfHueRivj17oRsNVd2WwrSUUmxkVEALaDtjPA6voMvAj7lTmS6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hy5n3c6w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOBPMW3L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6D606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E6D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hy5n3c6w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOBPMW3L
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1BHHZx1717001
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 13:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=; b=hy5n3c6wVjk99iUm
	GTO0ipvPEU4GmN8j1ywo3HUCdo6gKV63UgpZo90/cI24ZVC7T4z3GTwNoDsbNXIU
	Xn7JO+KbH3Zdubva4tt5dXVcca9GTW4Pl5YXlXUQArsxjjaVcjBvjEo8rln9Oaam
	iE9P+h+OYJSNwhw6GPoh03vjJ93kFB0eiy4+GlTO5+2kzt7o/Os4wiBO75AE9CL/
	ctOwpQFYIKQVhD3QTQwhzacr3VhVl76ohnX+k2ALP2d9m5afIo0wQxW4sWym3Cgy
	YZHLdtdC4YKrvslSK5QR4kTfRxpuLtWkSM0YaNJ+LnaJVoAK11ew0lgZOi1qFkQs
	c3ZwCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79ruhtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:37:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so193024785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793540265; x=1794145065; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
        b=FOBPMW3LQkSm5q1Ly7cWyNuCzFpoGfxBoNUdSQdyOo9GlNgTw+yjPxlGGcWHfMAFg2
         XAF3maq7q1hNH/TJWmib/9jLC/zUO9EkO2dSvSiJwqF4FCbOhuqo/Wlj6X7YYM01VxHi
         kP/uxM0V3URgmyhe9KnI99m9fnYTETh64at8j4o0v/cui6Tuk+s+nWgl+/zM12h+3nWH
         NbQz7Oe0aQAoBfBQ4MYgqKzJiNgFtpTuYJ6GBpq8daKNXnJ8CJKTjrAQLvPbMd4tUoEB
         XlBicD/jsXZLxEpm8VbNKtR8ekT0AY90eVIFsDlnRDB2qckmdEYa9PF3WttMZXPVxBql
         KKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540265; x=1794145065;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
        b=MwVmCi8olnPKPVbwNoQ7/ixcA/6L3mITm/0EN3t3wooRMNAMn3afQaQeImw45XvVEx
         e0d0olFDnHELFNozcekE2+6u2JsOC2vxVk/YPzSh2oNplFu7AK9nsc2CaJI+oWqZs9if
         03aILu786TFdBNn+VhPnROXgAJeGbEcsL0/7vWKtDZR5aZKXQnEX/jIL6mo24u3b3TAQ
         prxu72AOd05sk5krFn9loedyVaLFjirOfircObvBfsJcC1Nzg/5iewWKbX/SazR6PnKk
         K2VSARSK/cYKcfBfWfuQTr02GzorXTR3CjJJDbBqqIKthUYsahEyt6wLbuts68kjnR1p
         0nZw==
X-Forwarded-Encrypted: i=1; AKwUvBy9N1hXXWkl6n1ViSNF0crunZ2lDAT6yOl84ULhQSa9gyXtYTktaMYqDzVT77RTkT0jM6aHwZJeIpVU7P4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZbg5I/8H/7pmFWjQ8u+a050Pw9psO/d2M5ANgLFiZ8c4RJuRM
	u8N/uG2p6CdOMBJ+GrzPOUEVDKWz6oYs/OXOPvUvDNc5LXfvr+ShqEK6f1RhSzxSHNI0KmmNp2m
	+4fxtuDNnHLmGEFRRT4kPvXiHMVnDhilacV37Z5l7JjqZ2WFy68NUaH2G87jOE4LZbe0=
X-Gm-Gg: AYBFou1rDR9a5g/VTKHOTTDbaDg38B7zqrg/3JPbTN7bSp62mL8qH+pNKkMZVJExeIW
	BXQ3cLKeSi21NWN3fcXYBtja8q4kgJ8hGLGZbYw9LWPkq8h8t1roNT633bEtLe+PYLKXci0XR/H
	W5Q6GIfB15mzn09uZuZ7wT//AGpJbWFaXTEQz2vhPl7uJ+466tnvYGSC/qHxChEbK5aJZZRtTPO
	VQwa5pW8MvRWZ2sZZKRwdrPgxR5vVzKKAP3EJJhwe24cE8JV4i/CyQaHBel1XnpOC215I5eiuaA
	yDG0pKKBvMMAGpiJ1Q45w5PiMClges94f5nTZxXU2vWhT74BzeJYaETnK2jArUuJK8P138TnWUQ
	qPcBi/R9jzS+ljCSp4d0puwQZqeU1jrRcqxeGFApf0a8Y8tNno3b4rx5miVrusbM=
X-Received: by 2002:a05:620a:8904:b0:93f:211b:a7a with SMTP id af79cd13be357-944216b7a6dmr1299171985a.29.1793540264866;
        Sun, 01 Nov 2026 05:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:8904:b0:93f:211b:a7a with SMTP id af79cd13be357-944216b7a6dmr1299169185a.29.1793540264396;
        Sun, 01 Nov 2026 05:37:44 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm14029011f8f.43.2026.11.01.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:37:42 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
Date: Sun, 01 Nov 2026 13:37:34 +0000
Message-Id: <179354025489.2686703.1864959237402110457.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdvitGyi+DIn1dy209zldQ8u1g3NQ/x+0UQJ6J50KDg=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq50Ch+KOlEeSf8bGjUIvznUwOG+mV6MffOXTSk
 FOVArKpaHOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaudAoQAKCRBjTcTwaHBG
 +MqID/9O1uPoWpRwRV+yJG6AktczcmsHm8L+LmqPdz4L7UOSZPrPkxZpSgxPtP2OeArT3dQ2t1d
 /fWDLke81cc78ZmFKDU1lkYgLLILsCDF4rIQJtYHezMz74NSGsbwRrnUZ+A27GrU1gUyS6uLJn5
 1kMx+lBq+MP1iMSyZLeTc87dY/k0KZSEGUkT4p06wvVlnF7QDSV5hdNM1pISAsXbULxBMWr81Qn
 kEYGRTcUK7+ressnLeVGClGee4ZUHpO2aS+SqzAYOHg0lVgzTunXlOQY7KIUTDffZpbEuaAC/Ri
 3eOOnJ/+luvFU+bBM1PL7ly2EMKNToaVGLJHmUYWWyoGUPpInmQGsRohLd5HpWH7y+8/QHFpelr
 /ATS+Tn7TD+4BYeC7iNacTF5YswB2cfxeecjgPV3eUTPOL4nW/wMHXSUPIcBPXixa93CMmCSHa9
 RLpryTpAOIegFe8/hDKyUSF3UeXz6y2LDnpVFgDxIlWPWp8fX+TGDqrA0jrwQRksz5EETkC3hN3
 u3v/3m8NrbYo0IBsIxlyrtVKXlPBW2NjQzdPFQOT+F6pLQ7IIiJ7R3lroWyNspIKH6HayzD+tNC
 HoTMtrKA11if+zgSm1Vq/nfD6mwKKqhQ3qx0xrgTahtPjgeKRutlRledxyxdHXFfT6rv53q6T7A
 96gJy802YO1EvSg==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-ORIG-GUID: LqLgqhRR9-dOeurmGaPD7nmkBIWUOolL
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae740a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=mO8_gwkcAAAA:8
 a=EUspDBNiAAAA:8 a=DTIOQyTOvEYwzOPpGJoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA1NCBTYWx0ZWRfX9opNn9WJBshh
 FrNH7I7yKO0tIgtp0f1ZnG52IEdfJeCQne1rcNUzlEmXjFACSWQi7+zrwyaZsX0rskFYEjfcahs
 bhWzzdLokljVwZL3XfmOgd7YUzBKSQQ=
X-Proofpoint-GUID: LqLgqhRR9-dOeurmGaPD7nmkBIWUOolL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA1NCBTYWx0ZWRfX9fuUQvYS+0jq
 hvF6eUL1vgqF6TJpt/cwVWh9H5qAUCijT+c2MHXmGSHxWeGYFR9dsBWV1loRGK995XvJCYmCfks
 XZMCw6SoEuWK0eX1fIhjlvxGpnZx2K8g+ggsFBHmWRiD/vuB5iVg3E1GmRMNrKaR/h5BxlU74b0
 5fOLu0cmbwEQsGot01Z10SX4lhrxoAJk6hbw9UEtjplDQF9MD52KZqX5kFHGMKsOv06lA2jnQBF
 Eh9zVJ3ZBp1XC9/Y8/LeVzZwDqR39E8p4gIUkJaLAa1BbcEtito44/Kx1DgnGndHaaZQQw+BqDs
 SlS9Bd1PlJm/SS/dQfkCARaPYgul/iflBhQBQ7ssAdXzE68y9slnT/zkqGDKrkRacI9q3xBXzG6
 M13pbcMN88ZsCTvkjCtPMucYcQdT66KmHnb8Ja43GiyGGjC5Uq3x4xu24JoBlgEF44/y9EvZOAk
 eclOKGBCXhJKm4Q0kmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010054

On Wed, 14 Oct 2026 17:49:49 -0600, Luke Macken <luke@phorex.org> wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard


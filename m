Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484932;
	b=xcYNjQCoHrPzxDS4cloMN7oc/Ubug3rUqnbADf1KG6d4UMjfydk9yDuEPizI2TyBIzzN
	 LQoO9hMaEH/4GvhwN9WlxLDa9dYNmr+qGu5a9jKnIW4XGeqTS7DoOX0KEQw5stJDd3z61
	 zBTrgYVBAapRtTrG2BisbRZFCf9gP3Cntf5KGNqZ4I1EsReNt1oALqDXfS0dG5Af/tZca
	 5RdUm4E7sEtuVOkFx7AQziba4KJ69l97pu2Odv3CftoO37oogD8Wq34lra3gxHQ0sDsP1
	 qFyCBId8+XE2OOtgDQJ23EKZfTR0OV6bcNHo6dID5Ahk60fwn2lvrNDrBIOOc89P+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
	b=XOZy9thm5xK8KsTGy3hnTXvu1XvgiFUgw6GfNc+QWL2nGctVftJDxUg+ajqJjk/2h9X5
	 yaqoazfhcejbssYEIEderqM6GVO6IG7VrV0xUE0pwA3aPLEHom0vSbL2yFMc4tIvuwKSO
	 sBYCtTrOaFd/gZu8nn21cWfV81QuLRRPxrk7s/OSnUuTHSFASjSmcDqddHIyxIXp1lrXE
	 c7Moa2AKJKO50CLypm0SuuIcE/Tw51ab+dt4W80jMN7DM7feB8l2t2QChW2fezMWgl6a+
	 /Cu0gQHBQb7T1O5NS4i+sD595mACTnk7JIEBoLooEfK3TiD4vHi3hlACe2yirMR9udQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D038606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D038606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8HfMu3807111
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=; b=lkG+4lf97J9M1Jcm
	9rFwU/pY9ta+CZlYP8cdyba734bZluqzXOKHaZVvMjFY9cNTZ3g4N4J27pHDTpDJ
	KGp+pK7du9X4blUs5u0KiwWxGdv7n9oiFYG2JUWfieciXhVlJ4wEcOEYQqdMouSp
	0o53zwQVoZlr7Row84twP9dKTQyPZB5+g8fo3XkXfT0nNo8p5JYcOE0QVSXNDOjQ
	Ez7AKlSmZqHxcwIYaw6PFHkN+N4Cnpkb2xpGwuQaBrJ+aZXToBjFPGTMPQF4vRvg
	fb31HTx8bv9LEbhZTWI54XpwEas+L3AEVhEVazZ3XAjf2qpvt2+KJOXToRmyos3q
	rGgzvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9mwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so59940885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484931; x=1793089731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=fPPcrtSB17V9olGUvvqwdz7mqYYl/1jUJZdqPUQVSN5IXo8QmecFstCzxB02aj5NNF
         T6oHPDLhHvlrXG3hcAZRNX2RBvVPiggS4iorD+HwH+j/mif1P9oxRPJN8XUeeu82pmEY
         1isest0EXYGauS7MnGnrazG1P4rUT6Trhr9mBwKKksiPOiQEcSx2g7Db4uKIX0IcHrdV
         ySR4sEE+dX5WAKullsUtuzJy+yEUkYA2nH32Ou88N3kbhMY5O4Wtnx5Aab2tWp5G+1Yy
         NXtdqh/tGehq5Q+xKXqxS130pnm/83V7TvYDsu/EgRR2GousuXZ8DcnxxXnpVRUQwoyB
         k9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484931; x=1793089731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=oILkJwA4UU9aStwI/R2UbX1VNgJgU/4vvJvL871/OQzFo3Ixabdn7cz9HkBwHwWUdu
         cNkPP7QgrptNiw1SZ3IyyCjp/IJ0WcsefeoxkYOrh771/o/r5/6GBrLfP4E/kG5SnVZ4
         g5pMJ4E7UBIDF9qNSW3BH832DUoog3nFod2TmPXTnCibcxLNG7+xo0TOa6pOwWX+Pj1m
         wei1aAHrln3ljEBX6Q/QyrRUlF415o9lF7+345qNDo24wLIlBPw7FnoQuMHNPLj94B0v
         YRKYdCag/207whCsT6F1v5M6SXmZxeMwqBxaYYlv6NWNLjZQssjc/oZ6MqRL4ie0C27m
         PhLg==
X-Forwarded-Encrypted: i=1; AKwUvBxjYFT2CtS3653cRXmz9CAHmzj68qBTG3zamdSQjc1Z3/Vv/Kp3+yW1FVO+2aXJQANN0Ts54+jV0KnEn28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ80sO3urqX0rssx6/g28muezNU6JHbct7bei+9+w3tTbqSRfnA
	5BM/GOyCxtduz3YKDa/65tI0VD2MxluYzXFrQMexoA70Q7V1/GtagyNUSpkknSqMJudK4TJ1YHI
	ARNWXnfG1l6zkKtlg07VuCGLMaH6QvA4ej/uYMcMqiKTC3OCaBQshhv+gbesQ1ahCeBM=
X-Gm-Gg: AYBFou0JYz/dYteTELpl1sWTHEI/j7kFRpj2cuRc9JHsnDGjzccOZ5KH6XrUdE+SgE2
	Gwc/9IK54OCyYQrE3TCkXU2R9JfNzShD33WUYcmO5g3xVEpziZUcIT+QeityBtY0tw+cdWFHFe3
	2CKZ49B+y1M8X4UyOI/W51gBDu4QgLKnQqB5Ng/XMla7isc53kexXbA8ZsB1PY0Q2E9Ji1zSR8X
	BKHJ8WygZYuw7lq22zBPl2Hc+2iy468S6lk3J2yGsb3LHDUkeyPsugukEwnY34lrh8DK8cJkRbn
	+TD2K5YQ/akqxqQBV0BpeSqnrbI8WqlUszEJ2BJiAMm4eW614LcchR4HHB5U9bpuCFFJKv5fR3N
	l9r+vZFnNH+LuxK3qx1D8zg==
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869317285a.4.1792484930881;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869313585a.4.1792484930511;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5026181a12.13.2026.10.20.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:28:49 -0700 (PDT)
Message-ID: <ec5ae206-beda-42d5-b152-91c457218374@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:28:44 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gpJSD4wF1zernng1Tff3EYN-ApGrOELX
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad72643 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6_vhy4Ov9suG7DV3KvwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX0Ft+ftzN//Mk
 xH3dQ3i4Qk6BzLqZtJLGpYXP93d17Cx/kragie7wiIK5xefQCzczxXW+tKZ9JW9THK11Xg6YQba
 odqAibzJvuXEy+/FiMCrA/PJnFaZI07UtbjelB7pTblH0c5hn3Ae92jQR5BsmFH42IhCzs0NzQ/
 +loGI7N6zZ8GThtiTdmNuQKVSYORcBuVxPZBEIH1+wd3MgCcK7Y9OAJAumUN2AS3ihpl/Fvlj91
 768rbYjb+V5H++b7vf7EfW/C7Xc0ExVpjJwqcmo4Iff1p4KH5C6qxTzJJ0xLm+R73e/s3Y10OFl
 SNBNFabVUeA1ir1A/rUMFW/UsIxwxJ6fXe/c6GnkV5gatH2+1vKg+Z3iaV/YDr/l1TU3lXJPnjK
 xRhGqBNHPi1H6y4pzDincFs4xLZ7nFPznFmBn+MH57SdB6sDENjC+f6L9y4ACa8PckKAWDDYdPx
 XzYw3YHZkMuwMLSDdtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX/3fC9BbvZ85I
 r1qUOK1i+2fajTYyUJadPOnls2y/PKJFT/885MLZalhL0Spqs5a+3FZdDiIUymmUZBUf3REtA6/
 2ui9R3+c8lRLg4Rll2tY1gSrTNj2nJA=
X-Proofpoint-ORIG-GUID: gpJSD4wF1zernng1Tff3EYN-ApGrOELX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/9/26 9:55 AM, Xilin Wu wrote:
> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";

No i2c bus and hpd?

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C925A645
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343551; cv=pass; b=KX58GZTVC1uqBwV5saVHEcPlJlNSkKOrw8weMWDp6WlVOdMu+A6oOtZFvgso0a+KoogKRM0fIi3PcMsfSHM/1MAG5XyX6NyiXDi1PKSEiPuvtQCI4C9qYVgfBZcSa1Ds1It7PYxIqQjNkVt60Yfe/YsC9yYf2Hn4/tuLIdGxgjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343551; c=relaxed/simple;
	bh=kqdNlwg778/987rRPFcemtjB5R0/alDQShoyszIUXi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZxoQFvZFFEa6hgQDmI51SHQhkVyt9ONzRjqH9FMAehvJsKl9YQiLJMQZOkEKdOytO7gfTlDtUPNLH72dRal5sxn54XzxERxAwJrQT8YTQM8pJJkEbi3Hdvla7lu4H8Y0sfav1lTz9THGj80ArHSnopINKSbIReLPvOVL3X3UAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiFirrNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjLnN41T; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiFirrNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjLnN41T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDGeCd1193848
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=; b=CiFirrNMJE46vkez
	ab/ALVoKzVYq3KdM+wurlRbp1B6pozl0+xZlajKqHYhciUozzuBY7HlW4B9bEgeq
	01aTayxTFbLZjXcK2kUyA4C5CGDxayVgrjT12DPiulgqZp8+24MXVbQFUBKalGN5
	p9GwIgBIhMFeCrnL/r+4yFxTmyyyZcUvwHKtmgVueHEfPC1dTHXv2IcCvaA5pY9E
	bXsatblJpbCU9xw3/A1vAwABdtqMVYDxHNRpOtBokCQv+9P5D3KSurkRHYF8jsvl
	7RxWADkv+Ho9B8J+D3C4m7HNizpmI3Gz6NL7dRH63YIWrYea4jFZFF+zLX2j8bQ9
	XChfMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874kkx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:39:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1e564fd5so164577885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790343548; cv=none;
        d=google.com; s=arc-20260327;
        b=cVQmTmLW9390lqdmUZIv6oviPaM2hxz/Vv0ygqW+G9T7dQoF50N8gldHBAVCx+ooS6
         3tBeimI3CDl5gebKrRDXYDx6/g7FPtydaDAUAEfamN3SGwP6H20IughhrBTa4bCoktV/
         C1yLPQvTyPpDhaAmghaVBh7+eGA6IVfvDmMqchMyvwxuCheKSmf0UsIz2vntC8h/JUHZ
         vnMmHwER4D8bsUrpkKeyqxm0kSq9L04hlOCJcPrTMAQdMkdtX7F0JWGuKVEeOUS61KS+
         vd6T0iIkaQx8yDhO0iffYYl0nszdwaDpami14E8ipCcd4KwJwsRb1U9Nk4R6HqSIfW5T
         kvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        fh=DclG0M06jwznEBiVE6KT+BSyTFNNFLXrJ9W+A8YHjvg=;
        b=GgFiewn8QHhmaC40yADmrDFvw3lE8v9ZZMJachVSPw7sEQTwnMHds/9nO3cvSEvxs3
         6SXhHLkEv5rOeFFJQj+M5fS/FTNoWkd1e2d6ae/AjXuy0xPCS/S7e08+Ce7lIWL9SvLB
         /ebOpSceQW5KbUygitRRcyQHZWuMDdZtE4xUpr9YtwCbgoId6C64RwamL0Gz8uge2r8K
         H4t/ZgoaQMnxKSALU2NSG98rfUS/gh3CkCFB5Uasofo/l8nUWq9AIhv/rRPXA1rFWNds
         JS8LMSOntRMrBON5pembs0kk1ix+5iwJ9uUtRjiMGbTeUekLIVuTEzdbILyc/wARG121
         o2jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343548; x=1790948348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=OjLnN41TvHXUGa7MBrf9fj+CrpaWlDp6jgP20kUZ79RYwBnqHsD2K/ZHsBfxJr0C6X
         5bLg4kK6XWXCGlWpS4+g8GmhWc5sivFMkZ6UPcPR0PfTiZKGAXGfrZJAn1JrUrO9v3pL
         +o/3NTphHMc1pEr1w9tuiniwaSWa84DJXKLHsZJBOqqauXJKVeciIGSFjrUGEe+xevFE
         0tu5GV/o/wBP/LDnwxL4ckGIva0g4Fy9erhgynszry1UC2kIN6hUmqZne6dnMQMW7GsT
         RLoI9Iw1mSzZIhFcCnl5EDBJRUTgLvqYhyFIIEVyfYO8DPzOfGwQ8Vznq6kgHkRZsrq9
         XTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343548; x=1790948348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=W1M04R8LPvZPDksrC3++v7ewPBNf54VAFgOKKF8/twSK7M+rCDbOzJ4U6yfyuoP4A9
         Yj6N534qHZoTlNwSi9vE4CPMEHNOfWWRZvHtHzdDF1S9fyBwBswzvxmlusO2tZtYlhT6
         OpbyRJfxnRAXwn6gQZs8WrnQ/i/4fLmh0xbRe33whMhLzxj8quzmGDIuWSb/KZR4t/XD
         Th8BD01u3VKCMokKAGsrHJPcg/UJuM0pghpIbUXMSKFJ7uw4dPBlFQ9DcEZIfnscjcg4
         NrY/LiI04XhuOgEQ1GE2qrKvjtXcdjA5JhvvxWwsW0YwNzTPc2jKnUNv5QyDAPGd8/7R
         MtqA==
X-Forwarded-Encrypted: i=1; AKwUvBxOJ94NruSVsNkKJb/bjPLu5EscFm31IDYtIwXX+JhUayPVb6niq9mBs4tuEVRcDTqGLJeFrPEis/nEpl0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOY6kclYydS1V8yS/hEQCDYBuNhD1Sl4qLIZsvFLPsYHQY0npY
	fHPpmMl2zhkS6sAP+ARc1quarpflIdVdVTh9OKyG061BUCTW/yY7O0Q9pRz5Awaa2s6ywvRhnMD
	PulfRRCLmlVUN7cjtexp68sgwuaxEPZ7E123dGc+qjaA3Y0JHLn33NLPmufYejs2/C5GP5VpPQb
	wPLi2q/vOmFfVaDZ3zNwXZh8kahQlVPWW6rn09F7ZVUQ==
X-Gm-Gg: AYBFou1DQBo4Fsk2Tm8Ox5yfm4XGTvGrSbiBImyhwOgDSaThCkPvYb8SItVaHb1iqjI
	tHI4cXIq1oXmgrhCBLTWqdqxqsp+7gEWdv6N5s37XvJK57zBebKQeRPYNsNuZ6HLmcWjU6iw/Zx
	gQjQ8DHmAm9cqgE3Lsu40b5Tk4H+yqaE3QUceCu9557hRXxwLK7tfaAnAAJZhHbHqpYtuhu9SUv
	RZHzI964NMqgRcWrnCpxKWfb5m+MiOYQN+tocCiojsGNcXzX1q1ur9fvhjGULerP/OYq9ZrPZA=
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id af79cd13be357-93c43bf1ff2mr431890885a.29.1790343547648;
        Fri, 25 Sep 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id
 af79cd13be357-93c43bf1ff2mr431882585a.29.1790343547133; Fri, 25 Sep 2026
 06:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
In-Reply-To: <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:38:56 +0200
X-Gm-Features: AclHuK99T0Ubawi22EyQadvbidnQEmVlySi-fMkWCvta4a9Udx0OX1G_I0L1lvQ
Message-ID: <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Rxc9DeWZTl-hprFLImGslM5qjJ2KSJxE
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab6797c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=MW6_J8xfeE2cRKj6bkYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX+kZn9Rt5og+r
 sTwyob9gC66X5+slErSCHSyhZgAse5HQJX5/39EnOTj0wgzgS/4arKwJUgzrZ29wdJxjrAgIp8x
 P1nPk6X2AlJctuttpYboMepuzVHlANxXs6rozKWfYLFtS2oVPRgn6D8S501rs0BVfPWMF2vFyil
 I3I7ksgpE+YwLKxEVqYal7bVJP/XyCkww9SwEPDX0KxudY9hTesQ/rQJfKUvTBKq84F2UHK5tSQ
 QfoPQrmM104Vh1F3UPAbR8+VX/ChzZ/AhXvLE1/vKwteJ/drpVIA1r9+v75zP3/wrD2jenVmFfe
 z4c4eMz8heaBKScYkBxfnTl9gRHAiCcjehFq+N39YCO5CUNinYBGnBV+Z+wNsgVhEMnn4Zc//EZ
 33+0KGhHcUdu80cJDwr+UMHh9Kil0f9koEUotXePcbZEUyeQ3V28G5o8eM3Tiwt7xou9IIapvcB
 5gzUKO5Z9Fa3jWDVA+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfXzfEKHTgAkeAt
 FUPKmqhVyE620Wxf/X2jzCAcXAP+VN+CNx/dQ1H8gakT9hYkc9mzxzThHALfv8JKt/wdL/bHvyi
 LZwrm70CL6t97wiRFjMSk1rrlskjDfA=
X-Proofpoint-GUID: Rxc9DeWZTl-hprFLImGslM5qjJ2KSJxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250054

Hi Jens, Luiz,

On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@kernel.=
org> wrote:
>
>
> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > [...]
>
> Applied, thanks!
>
> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node its=
elf
>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18

If you're happy with the current state, would you mind picking up the
block-related and Bluetooth-related patches in the respective trees?
They are independent.

Thanks,
Loic

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BE14BCAA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785462; cv=pass; b=BOrCUYB9jpPeQT5g8mMJoKwr2c5kPXP45vPNCPxMoi1C71B2BdLesZOQ6stXGUVA+/6Qjdf/vOilueBa8QEl+rP9sF3V0p8ZrgFB8zZ8Tx2BFKfi2/IfZp6jPXKRbXyTycdPamNjswVmK0NdvijMYqQjhgbMnVPjAC6+xOudUBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785462; c=relaxed/simple;
	bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLaZtmoxr+9gMywHxMkB7Sz7E3xDWOFqnATadTrNRIXSQ2KVa6wGoLAreXDBZDAtSlklr3DUrmX3uvQwV1EoQRq+hY2SkBpeoI+JZjpVRA0Tn9OYhlvFd9v4BZjhDN+Fz+KKTr+Wf+HCPRIAiG83C0x2lb48Igo5enFnAWhjSxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U04jKatk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7S/LEd5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U04jKatk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7S/LEd5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnHFs3863151
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=; b=U04jKatkX5/Of0Lk
	NmSq95IrJaz5jcdpR2S3y2CdjZZrtZ5yoWV23Nl9G6UoLVXFr5aJFDMsoJi9WX0I
	nscIDNxtlNflYhFNPAXMWADWfbhGH4jyE+UTB9K4qxcPXD49SSYVfWcrjguxeEIT
	5YxVZHRqY0IiHKiufD+oEu3sQ692rdNZR0iwB2iLAudyyGRUXah+yzW/eGC/j5GV
	OpNpHAZsAMwSdDV1TDRFnU/WVuXH2wSDuQRWd50xY5EagiCkjIaZj703b4cFmVsP
	v0sXaSQuO7cUCRLl/3/CJmTrcuN6JvGiwTM4bqVg0Ec4ccJogB1oAkJj0fPshJKx
	ZHO2kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hvdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:50:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104215fbdbso86355556d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788785458; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/C5Dh9MD/3CFUamUdOEqwd8DqanjMFWSA8riwWsfXNa7qEwhcnah+5PjQnt3JmRlO
         h/NC1+s/mfyeSaK7OhXzwfNNjwFbeaRsN9BhN2ONkqFKgWAqaWCshvxVFifAzggxKSx1
         LGz8XMxOOHPZgGiUgjVgTMnzmeLOAVxlks32HNUmxu0a4IJrRtxBO/lv0oKX213n/eVS
         BcbNB8AfMla+MLw4nO0Y15XcuEBcCu6uZBYyZ+NM/bzVTIwRNKQ829xrNboY6g1y44qy
         ys/CFN59kq0DibCXkHa52qFhn1/RSsL5ixQSBQ5lF7zdIgkecYU3rGEAhgjPL/uqsin/
         53eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        fh=fhBRr250NbrbxllJzxi3STJEXQz6gGPS14no0/02+rw=;
        b=OL8jyhCqBh9HFMxoVxvtRPmT756Whe5ciIf6CciLZhpXmLADV4mLFLEWuirdCQ9lxP
         NjjQ9A3Q8vL6iZdKfqaPD9C+iUIJTicojzNPjftUYt6pMxC+U2eQKTVLOtwUOAKVY/eu
         ReXeQTwCCJRARiT1XPdOQya1Gk2p2Q7RGMY3a4is3dOhFp8mN02MWQHDycZVdhh7go5Z
         RZ+3e/l0MOH3uKj/o3/tBXsgBVAK4qhS2o2NoxqtSPsSjlZDhfI8KSkWYWCEh65ZESTN
         0qs8ReplMJROVtTXc71+OQEkVAkCr+ECgS4rZ5F9NTtCJF4r8EV4R65Ilerr7ZAIQuLL
         aX9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785458; x=1789390258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        b=D7S/LEd5tfmtAEoVBVUlbGFPQU6VKZUF6Je2YKaHzboMgG4c99XlJi2XdYmYUTlbFV
         2jcTK3II3F5K7p3rCXJWuLbI23ZM/zO4YMK1gF9S98VsFnH9njBf9UL3qWHYCDrC/iQ1
         P8KcfZ2fjjnCiuRCybfFhjBvFTifik1vvY70WK7D4A0dSmotItmcUZ2jaIxZTkqcH+cI
         ry4v9QNHbBpTXQGV1d6qic2TEaPCOCzgTIgVv1e80EnheXyqK2M+eegseltrbo8kVYvN
         yVWdPTTYKtR1xBSXGe0YDdvv6hpftT+suysydKLOpr0WFpUIcKyWHWH19noPraGnXB8j
         +9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785458; x=1789390258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT+Bt5eURaG5QY5OQe8D6BhKgHr/3HEhc0BcnyDPJsc=;
        b=c+SLuTM/7NRud8kmMf0zlcA6AgFE5q9R9j+fnTYeCOAQxHePFFt+TNlmesz5Bln7Wr
         tr3RZKDEHfDs91XUsSLOPkHPJNNpyVEwYD56t31VsCFOj/IyhcSbmH7HsS3U5z2R4Yno
         LA7TgVJKXmwKOPyIFa3FYmxfDxFJqwx4/YRu7rE7FgNyFJbv4mWXIjq4/cb+PMJFlRL7
         SftWJ4v2UCCga7/nO2VJ+/oZt7Ve953a3LhT523S0I1gkZmk/wkFLcpSKRBajPZHly5t
         2c4YNEiJffeJn2VQuewEoXJN+g1PoEmG6Zp2thANKkmJ96EmzfxAH3zOYR4cmTUs0dBR
         sLqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdxEM6gOgBsfGWDGuJFTxteJjRciEyQzkDvI/EEvoOmxuELFdTSmW8hFUhoT9o3qVpW2U8aqBDJPnEG34=@vger.kernel.org
X-Gm-Message-State: AFuF++lJeXa+PLl+tU0lEEfAmDkI1Ow8zG5xkvodQiO2rSH5fCOtLXWT
	FtwUUyuj3eAKnXgx11+aHpkddG5UGKezcqzcnhcAZoxsr2iqQ0YBxtPRc52+feNcVlMfuQ6wRq/
	12jRqHuSSTYqzqWLns2MWxwPX0Xs3eR6zgHdeIuKNMYZqVx2L2dM07+oPfAuG3CBsuAVEC325Ii
	kfUiLMWh1eI4LXPhbuKcqQQ1LorQQiKkLG7+mxeTcaRQ==
X-Gm-Gg: AYBFou0RPqd/NTL+0TAZvVJ2dKxQ6tYq9IjC6X/JHBe+NSoYiOI1nK8shLaOCvaNJAj
	lAF92eLgN4paODZdG6/OhkYyG5wTShbZhm4esSrXAkgdmIrIYqMuKVdRUhiuNPxIOiTM6fIMq0N
	B8Ffj5OdPU86MDWIu92CuQwuQXDyfNRg+FtqtnvY4vYxH6WYwUTBHaIlQXhlOTLaFY76jn+C5GM
	lz6+HXWAGKUS1b/FKAuakCHh0Y24PoQr7XMRiUGBB99280TZUFkYt7gpS8D0RSklYlFGLKSkX4=
X-Received: by 2002:ad4:5d67:0:b0:90e:84e1:8b93 with SMTP id 6a1803df08f44-9103efbc676mr253793506d6.16.1788785458367;
        Mon, 07 Sep 2026 05:50:58 -0700 (PDT)
X-Received: by 2002:ad4:5d67:0:b0:90e:84e1:8b93 with SMTP id
 6a1803df08f44-9103efbc676mr253793026d6.16.1788785457864; Mon, 07 Sep 2026
 05:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com> <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com>
In-Reply-To: <CAMRc=MfDAiUMzOYRWioK2NDM37=yQqb4pQ5ETZz1PVOKQhhdug@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:50:45 +0200
X-Gm-Features: AcwNN1Uy8Dv_z6eHdNiSSHvTLy1MMXc0Rh3LRZ3dI-XaUt9s5OrddNB4Kn5BgT8
Message-ID: <CAFEp6-1PuGMGkdfWYiUQnYffm7en8b-DQybg_4M9xw9MVDNRsQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] arm64: dts: monaco-arduino-monza: Add support
 for LGA WiFi/BT module
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9eb332 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YKo8iWYt6ehE2M1v1KUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: QRSTK6vBJBqw4wlnhU9NfhiIIIyDrW5F
X-Proofpoint-ORIG-GUID: QRSTK6vBJBqw4wlnhU9NfhiIIIyDrW5F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MiBTYWx0ZWRfX+24peK54aWFn
 /tWsUW1Ga9P+SIOoetnK8ejIlaqpQJm87LVYdbtrUFz+thC3z3prEkVMe6hVLf5KvT2EMUPBoNL
 FbFUyoiePedskZlAF+aG/LXhBcbs/14=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MiBTYWx0ZWRfXw2T1vzCTsMUx
 r5+Ci+xJvd4LB7mX1m0VhHoNX38TlDiHm9G6pMUMj8lyQnuzzEcvJ6odNzEX2bal8AtUaFnHrL6
 aiIDjTgQq3iTDhnANcQp5NS4E5f+POEuHxiED8Dy6xU/RanQD2wFK8kfpAD6bbBOqFohwKppHes
 cWOx54OgEppEWUsutLJ2VAnnDOTyXSTCq59fja795DH9Z9yqXz4OCsiL3nwsrzRmW9aPmbaAK/m
 YEysAF8cpuOAkBJhFJe3xmX/GnND6BQe53sFguDQSq5VjTzrh2nn/JKDJxgXM6UMipXWikqwUk3
 6zmrUwg75QhMrfdxiGnECf7H1o0dgpsFLjmAPKwIgQWO03yI9t4z4Rb73uA3IPQ4MAPz5ykOS/T
 /vYd6j9QFB13KSivFKJdsWuYGeLWWx8TsCYibxrL49InMl5vuH+4g7fSsvbxBly2h1DX0evMYBQ
 uDCc+/y7oW/s8IA1wTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070142

Hi Bartosz,

On Mon, Sep 7, 2026 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, 4 Sep 2026 17:42:15 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > This series describes support for the onboard WiFi/Bluetooth module
> > present on the Arduino VENTUNO Q (monaco) platform.
> >
> > The board provides LGA pads for a wireless module. On the VENTUNO Q
> > these pads are populated with an NFA725B module featuring the
> > QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
> > the design is functionally compatible with the M.2 Key E.
> >
> > The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
> > Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
> > signals, as defined by the M.2 specification and handled here via
> > the pcie-m2 power sequencer.
> >
> > This series models the hardware using the existing pwrseq framework
> > and connector bindings, allowing coordinated PCIe and UART bring-up.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> What is the merge strategy? Do the pwrseq changes depend on first two blu=
etooth
> patches (I don't think so)? Can they go onto an immutable branch shared w=
ith
> the BT tree?

The pwrseq changes are only a dependency for the Bluetooth changes,
not the other way around. So yes, they can potentially go separately.

Regards,
Loic

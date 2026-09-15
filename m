Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB14ADD8A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487269; cv=pass; b=AHXixyAptUSc+39A4eS9oo2lcGNeWhwVY+XSqrpSGdXXNhiBzm/B0qNwaxRu0H7AW1JFXHTX4HRAV65NlcOMm43A0OEc5jP9GCSC/KyDgn6ab6UqejDxBqverptzZ2k/mc3W5Y7iwRbJ9MXXw/4I+LWMXxkZPQkRlzmFsZPaB7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487269; c=relaxed/simple;
	bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9XIDMtZb2mendtc2RG+zujn/+Tfz9mcrzlgwGpJURZOVGZnWCw0rc5ZnDMW/HFfSQ2C55CG+rC0lqC7tuqM7zefoLwaRlBhi+9cVzHdPnTYGmG0bXhGhr7LVqIbZ+mup2Mr1BiuI1SQBfV0LG1AQP7BfNUMQAiWFUgocHYTQG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuqQLGPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTYIT+V4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuqQLGPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTYIT+V4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFBR3u126689
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=; b=UuqQLGPi6RwKHBON
	dYUZOaX4xL7lhyYzbVQ+38hF8V4hkwKxj8i7ct7SGEuUwtQU8gbbB7g9UFQVcLTE
	Z9tY0fUXyRB7+fOWh3KJB+Ub7YhF1wNtr/PxkTmL+gOSSfOhlQ1TGNi6kDBtrTLo
	nqVKJxSpdNQxR3kQeBsSI3SrMYadaIQZiHpHEef7O3mbT5/yg0+C10wCcyQI4OsR
	5xBRxrFWQM8PNaAiEYgHiH4SyqdbGaFk7TgmFuQsfCL+PM5W4F+TPiUecdTlpnqk
	aYHpmIhDlByW5YvtXqGMWxAi66Fx8ma19WynfSsXmu1lFrZ6NfK/fwG7Qv5uePuK
	ZCXEcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtsw4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:47:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso105069415ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789487264; cv=none;
        d=google.com; s=arc-20260327;
        b=ggSF2Ib0VsHJet7q3qHAfECpiBJ+ab5qKfd1yajGpBUKyCkUmjtQxcAF/K/rocReSR
         Vdgc0f0qN92DctelrMRhy7RErVifCRpYfw4ha/v726dg/F3dpAVLWU//CtYqAvCjg/BG
         TCQpPzzaPOl87xWM6C3zMfRuOCCP+IUeYrHOcC4/8OSzQjQbAoDMPwnRQpCHMdY50oWA
         yhmpjZ5wFEA5wacc8n3o+U1D5nADt7uVPUb1Cg+oKUR6siLlrqysxkb/aanypjrtf+Nl
         3IuQf5h+f2GlauP7EuS/EDKCDFswipyyNqFcVWv1ME9Vjkk5lmZ2BkW8qCAfITf220uK
         ZrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        fh=ZA+4hWAajKQbZ3GQ70K8Cn7z89bwhmbByY+6LjiutoE=;
        b=fp3DMjjnnxrE+qo7yzRU9EZlMZoffpln+J8S8COQR52/sK9NIhnSibvYr/JyYYnOER
         zpLvMmNFFl8S1pEzwXx5u1nsr1IQfqMZmi7xOp68lFeAiiGoNDEIaitV2JF7ca4Km8ti
         nIaSFnrjqKVPTLILOyCu9sUYtf2NlTJlko3gOpRLv6qvg6+KUiAkHIjiW9YSdUxGXrMr
         DNUFqqAcdPMetyQH1kXMEWR4BCjx375pswkVKgevmP5P2fvO2HD14FVsPUDMJOIdIqOv
         6e8+4ZP5bL9vd/a3V/gn2g89CneSoZD4XS7GbulfcUWttAr/tSENvbZPDuj4JD/DHU2v
         kYrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789487264; x=1790092064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        b=QTYIT+V4b1JJmM1rb5rRx3slHx6vq5Ny/OUSyu8xEKqOdZF7ZNKyDTjrTRL0kMNoO0
         gjey4rE6Er2pYwr21yzosbwrmje0AL2Gy94xbtJVvtiRYy9aMIdInFKOIU/dsNj4KRD4
         sBRtUFaWFSdFuR5ig4G4HXy2iGfvOIi4UvPYw6vctDPsfAaMiEO0nnTK09Mi8W/G/QIQ
         r3Sh3dR0M7DdZgG5/LRWyQkN9V7VGDBFFPWoXX6pbIP9BJV5RbeUoD8kL8zKgMQ1rTlr
         3vjquA4e2vBpkJ2hEvspY0PY8JB5/tMTIUoM/qfkFexp6ILHnJy+KbGqhrs1wMjiLrC9
         RmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487264; x=1790092064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        b=Mu/xFxMIzdBaCQwiHLS1Ee+qJOmwL81c2uyB2k+KltAT+EtBPPeVDOK8jl55ENopOi
         W1W8u2yc+HQncWT18xtpM3ULr9xp4UPED6VfCJQLzjr9S3Nfp67eYcwQI0GUXg+QeC5z
         kKQOvTghfLTBNYMrckQRpoyRU/IMzzHT7abESsWbPBF+qweidYcuviIgjzzCmmMpeTuT
         TV90rsdNOmnT0bKqf8z4eImL3aI+9SuzaDyQg0xLUOFb/0rQVyO/eyX+ZUdu/jIRPIPZ
         haNDEu9L/blqrjhSJLVMqAkO/00WM2qDceWFiFzleu8d2OCkVGzaSilm7q+VbqG6bwPg
         xSMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAY+mPT/BMhG2Xi+KL4ivCjjxDGBZkIfNi+BLDqnFJl0YuG14SVlxkgMnYyAlzXnmDyEzktBoJxHkITcA=@vger.kernel.org
X-Gm-Message-State: AFuF++lvTDe9oCcouk17Mi2/wCeOOYJ00He2DUGZkqHePLULGFsQj2/P
	1d0/Pdq7RojoAd0se/UN407+9bCqzGgGCqGb61iIMYXJXyr1RXiUP/vc+MIneu0HlFgHbdQYquh
	EmHn/kV8/bTabK1avYMHYHxRPkmSlMyjmay1yWguz1g2OSYwRJBksPkMlynVq3posg+KJI4KCtI
	WZTPY1BZFCvfr9+T2qIc/fssb1GJ9SqVvGa0NLR3I1CQ==
X-Gm-Gg: AYBFou1PR36H9WZc3JM2ON05DiabXQBuyDM9E52CHS1QXzTTpd4CAn6nBPkYZnHuYnI
	7tzaqQ0b+bFUDwdB1zqnetY4Oo44NYtvbtAZUZhRXJx5lepV7kvdiRxJkecQT8PJMxbHH1XKAHB
	jAkW9TJcllaxdTMzl5CyF6iWENowALq8oH+NymuNx80x7uJAx86gqrfJgq/A==
X-Received: by 2002:a17:903:3c4b:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2dd837b0f4dmr30164805ad.1.1789487263765;
        Tue, 15 Sep 2026 08:47:43 -0700 (PDT)
X-Received: by 2002:a17:903:3c4b:b0:2d9:b60d:7755 with SMTP id
 d9443c01a7336-2dd837b0f4dmr30164475ad.1.1789487263399; Tue, 15 Sep 2026
 08:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com> <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
In-Reply-To: <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:47:32 +0200
X-Gm-Features: AcwNN1XLltJ2FYh8c04_i-F6ztWC1xrsL6gII51QJfaGjk0kyDplWQBNgu8CYL0
Message-ID: <CAPx+jO-Fh7RDmHz-YH=odsHxmqYaj=vj4R9iUSSmbSqcRr-p6Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Ulf Hansson <ulfh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Qingpeng Yang <qingpeng.yang@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xfLGYjeTvO3ushdk6CdzxQhZ2cWL5-tl
X-Proofpoint-GUID: xfLGYjeTvO3ushdk6CdzxQhZ2cWL5-tl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMCBTYWx0ZWRfX08aDEPpTzvB6
 09pMkmLtXOG6CTMMXOr52AyoRO7LlRb7vSC2ECCi32YYEMa7vQbsqcDiFTvReNeF0PGy/q1Geqo
 RKVnAzKQL24tX0ncdOENDI4ckyNayl4=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa968a0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=mK_AVkanAAAA:8 a=VwQbUJbxAAAA:8 a=BY5PBP3jAAAA:8
 a=PMt6m80IFYFBIeLpiBcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=3gWm3jAn84ENXaBijsEo:22 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMCBTYWx0ZWRfX4eTHJiUtxnFy
 D9oEWrndXiFHoAG7SCvBJKQCP7KB155RJKpuSRkmX/Qek9GnNwhQcOkMcvzFHG9i5dT+1ZTjaaQ
 cqNkxV92cE+IRRtyz529kb2sa4lfN8/f7saogvU3lDqUv2wNJ62qmyvYdlt9udVB0+DvmsyAQK1
 5d2ppVZjYTR4yB7TAWVXwyhLMWuOqU2yoDCf4uZZPO7/cqLTCj2fDbntmWS6p+KiIISWfzxc9XA
 IoenL+0cAkUilv8ABNieQIR69FW64G+NQBwavGASs25Q+kF1M8GOBLzyGTrZ3UBYUxK5EMBF2i1
 qPgYRhGGNCUxwY/wbxwU5gRpYeqByLOm11Oa4JT3yCU8rono4716ujSlbozr/y9amLWzZTz/b7m
 PFUTkyM3G2l574OvK7t5TMq50KZivdP91FWWmuNx5ay4AA0l2IOxFAHlvVSAKW6iZAPl2R1DxZ1
 hbPSjlTaaM3jCE1K31A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150230

On Mon, Sep 14, 2026 at 12:40=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Mon, Sep 14, 2026 at 10:56=E2=80=AFAM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> >
> > From: Qingpeng Yang <qingpeng.yang@amlogic.com>
> >
> > Mark the A9 ethernet power domain as always-on since it is required
> > for ethernet online wakeup and must not be powered down.
> Is "online wakeup" a wake up from suspend?
> If so: is the Ethernet controller listed with the "wakeup-source" flag
> in .dts{,i}?
> I'm wondering if the pmdomain and/or power (wakeup) frameworks in
> Linux have other ways of managing this case (e.g. only keeping the
> power domain active if needed).

We certainly do.

For in-band wakeup we have GENPD_FLAG_ACTIVE_WAKEUP. If this is set
for the genpd in question and the device being suspended is configured
for system wakeup (device_awake_path() returns true), the genpd will
remain powered on during system suspend, see genpd_finish_suspend().

In genpd_finish_suspend() we also support out-band wakeups via
checking device_out_band_wakeup(). Although, I guess that's not the
case here.

Kind regards
Uffe

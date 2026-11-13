Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584800;
	b=M8paS7I5bbthBwbJMinpsy4cNzG6iKb3hsTeMCtP8rCCb+DTAbZTOv4wDG7gLbDwezTx
	 h3ClrJU7nRssNai0jXp/2gqe08huFOkAHNjH4FWBseAcBrEgeEhEgbvAvL8wJYp79BnlD
	 sphqLMwWWLZcfoMIy+LNFfIvBT8lN6wCKi4zJmRx3n3tqve3pFtAmJ3y5NW5DrEmsLUlY
	 FRi/WZCgNwFyqCeNykAnp52ZTV3syj07fc27VJmqZMts8xkTgzN1q7FbuDGqcbbxaJCnG
	 pAnwKL5o9b6cpzxOqGeyEq7CemIofjPpqFEnzXM0CSrW2fMOgIx/GCWx8pZoOegFMIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
	b=W+iHWnbyf7im2SGGKkcZLfiAWfXIfk32L0dnkilyTDZ4TesA+vqi5u2c42NGqCjog3kW
	 JMtdfFu/Aziz8/p2jm3s0+FBm6RH6C49I1BHHJrrXR4rzkbO4X1Q4FrS5lMop/ZPHjxVx
	 +8nlfLlGP119aJTr80uT8F+cXhJAVF+IfF02Rwsmf8OZj7w+PVvQxEazsCQOV3C4qCIjx
	 c3T8oyvPIIsGJy/4R7Buffmc75U8Ej/kI3bSpgcdUhbY+8t/GHL8SZ7pjx1pvvRqEF6p3
	 UTrg4W1b5CtNqletQoTYtEy8UwCSQ7fOBMvcPUBzh/a5rDuL/zgPVvwuDu0+SKpwzYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bbSAKYvX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrfNPUlL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E7F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E7F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bbSAKYvX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UrfNPUlL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRAh43618617
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=; b=bbSAKYvXGPvY0V+N
	bRG4Xt3FavZ5yMSnamztID6YOs2nG5iqmKqal1KXsVHcKuu9c9TtY/Dx5CUQDZSU
	i/IVhBT9pio/QK0QcHi+XJgKNSKHHM7O7DZXDR0aErFywvK5ymRgqcLBEu0k4Cgk
	9Kx1aPCQFjevHwOaySSk58RdPJH/p/QxVsqxVyDSnqWLlVJwNFSolL2yBumQn7r6
	g+K7FL8BVIjcgx9Kwso7KI97YqLBb0PxNSvrNBDjosi+wajwg1P5NHfWcv9qTFV7
	bzEvqB5k2aiVkbAckBc0AUrnoBt+oScbHpRuF2aS1G/PEGSVn8Pna13vR0mLxSxa
	p7X14Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcpqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:46:38 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso666314b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584798; cv=none;
        d=google.com; s=arc-20260327;
        b=KA5Doz63GZbgaSWdbJGrJ6qKqsZ+z0s5pWIS7JvVnVTGkdYBiT8lO/p7N0Vssxgqea
         0EX2x/4Ov0WVjAvGhKYtta26MmeRMzK5r/b934aC5VcKsKAcTiFqh5wDeRceSezRUiiO
         zD2N90SIMZDL7RbAgqHcpF3DT8DJhheqfEdb1NQYddqq9onSSIcNVYmV+7S+5EVBORs1
         /4YMNxZ2IWSGsMwrtRwITS0XsHokdYhyXmmXcnriBVDZJjPWdjHB0v5cQnxOEvKV4uaW
         z5KC7l+SYD3PEjHq8hOOruYBKCGB0fezWmJ7rud/G6EXPPzjuWcnxQ0l22aH85Lh4dFD
         /O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        fh=9egkJewIVureh1tcV2Kr+xIminwZIrU9iF7a9OUaLtw=;
        b=dTn3AtIDQLxTJZJGeFvZzQ3YF27X+KP72E/1jt9cBTquk4alVtbTdtKSuXy8fhIWta
         dJ8pZmtD8DrkN9dYNgEKMhGtNNaXcMtgigRija6xT58wWWTa+Uah/fr5nr5W0fpR9Dn2
         geos4Smiq02sv1wPwP33oOKQOLsfUeyG73Zzb6pALlaLLRFWIQ40O9/lORpxhWNKMPv+
         vMtJmykOxt1mtSku7URJiLbbbNqpysYVxDcfeRO/vBw/WPqE9jUdV9vIUU9wgGykIXaT
         9T5TyDZDILyfpMJg+uzAgMC4f7FXiMTUIDWDuA9uzSR3AZyecBj10zkh9xHJq/c5xr0a
         71mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584798; x=1795189598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        b=UrfNPUlLexK1dlV5RNt0t34f3TQQcHrzJvV+vRe90Ip0VwPah7lPJoAPFo+6bF7ScP
         +hTQmtCiMLnD8yHRBx6jgcpuOaLJPHUAiDITkb+XgiIv0Pe6CW8YG9gLS/x+hT04C1Fs
         ea7f97FR1sMFg88u6IFScnvUvJLzdCA4vIV6wgmgj91XRxlaQn5+mdVzIYJACWoNX4Tj
         X+5+9iXASzLM5VelZ9VKYQqkZ5GZdXFCDlTnnVKfCxVzIf/y8L5XKj6YbaTJi7+IZsGW
         6ScMKVm4KrKU9z94yBDc6N45Vb7F5RDD3KN8xVYWsUACFVm7r6/UX1lCDz3yHWaru8dF
         EYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584798; x=1795189598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWqUlGlVZHACV08AdFucWTUI4cbZXYMPPj2UCfpzMh4=;
        b=UHr6eVs7QfnJQih+UtgpFQlHJKI8R9ZHhXFcZpMnwfF11REt7lezVersV76MobeT2k
         3AFBrBNTuafzWS/wrVEpAfD0nbMR7374ISRzKQv2KdICQgaWyv0de+nWPv590i0yJZzS
         DMktnaih57R8FZjXklBi98mUIf0yWzxsIYzWfHHVRKkVGBEjNp96gyq8crwU/x0Ml5yY
         VSLc5MNjeS9lzZpRX1CwV0pLISfyU8/87SfUkpQkHhInDE1qzLqZfy26HZU2ADtqpGUU
         W/3xMCeTkVUPuy/All4fFo2Z3wWTZ2VquFiwn2+Cv5u6Vpsm/4QvO84QzO2M286HNHmk
         PmkQ==
X-Forwarded-Encrypted: i=1; AL+hErFAvV7w6IkVPzLD8VxAJqfFNDMBUxpMNFK4V+sf7FUaYw2wAhL/1H0jeol6oeOWRKyoSyMv0p8Cga4yVj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yRq2zzL2Shua4weIavZxtswEztN+on2evx03s5iQ5bR2hVHyX
	nETCPR06TekVx+yoM1t6lP4REfRdSvd/tbwUL77xryJ8xmAECulc0zVgQ4BbsdGYx+GoCI+q9Z3
	WhTNQr/KwORQAl+ITwQGqksh96QqhRhUsoi8S71IgX5pDBajqpUWV3OyfxAYC3espirf0xYp/Z9
	Lh6DjPcfaHDk+eZCslgg5gntFkXxHmGVSkEi4c0T9VKQ==
X-Gm-Gg: AYBFou03lehZl5digyu4Q16iyH2iE/VDSUO3BbRNejARQKO3NyjAL0mDfYNU57C+RtO
	B/bBuOA76I9MyRwBE9x3B7DtmScZ9s913gmvSqGrpyKkd3YIoM9bOF2bAASUDBCZ/Vw1wu6fdkC
	SGp9JKSRjdvOKVspuCLAkpN6tYYA7SCGmPH/PUCf8Ti/8fph4HNTtjzsMGsPhkAhVuB7a8Owxo4
	ZZOqgDTs5znwlFLBxi86o8mz5j08qwH+n2/k3cRpLqYCsewycnslaUSwmS73B5xBOT5VqbId0A=
X-Received: by 2002:a05:6808:1303:b0:4fb:ac9b:b084 with SMTP id 5614622812f47-56e6530bb19mr2540026b6e.37.1794584797987;
        Fri, 13 Nov 2026 07:46:37 -0800 (PST)
X-Received: by 2002:a05:6808:1303:b0:4fb:ac9b:b084 with SMTP id
 5614622812f47-56e6530bb19mr2539998b6e.37.1794584797569; Fri, 13 Nov 2026
 07:46:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com>
 <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com> <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
In-Reply-To: <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:46:25 +0100
X-Gm-Features: AclHuK8sUK0_ujE66S2lKh9E6PaK84E5j9tQjywkDGncX8ILJWnaaM_7a6IV7jo
Message-ID: <CAFEp6-1xf+ab7FhbBJPH05V7zK+bs4vVwVHJCHZEBCbjcKw9EQ@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>,
        Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af730df cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=4MXX5DyrQvMvXEW-PiAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: q-2__09gBDRrnBUb3x8JQfFhm65UcRD7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX2z26QkAoLv+d
 lZbVVGqQQZ7m8kQ9KFO9g9zZmSdcnN8sWeuT7Sc6AzURI2XTLB9HBC+ONPoH8gdrmjwIHL4CMuV
 NXlM8sPC/hI5zacxhtnhlZm8cBakuIb0oeNt8iW9KRUI82Kw5np0o8mjV6n5ifke8nM73Pn/Dnv
 zP30VD41fkyXJdoHlYO+o1TcA8MADiRxWEd0WxjQ1dJ+kc2ArGfcjLXL+qtSpEEDxDR5sH2a5Vb
 XQ+Ct273hcas8bf7uTWbvs2Kgvi7E5m+mrgR0NTxgdV2D6sJiRD8H3mfqYc3eSk3s0RlFNTB0Qa
 qsjjBKkvsvMIGP1oWID4OS4L1Dilp7oU+o2S0PAkL5QFMepFCYPInInqP3DsjqF5wavMM4LfjZ2
 AV6rw3+0IGkdvMIpQYG5zAtOkZLy987HtrXjN5SG1eU2Yq4aBU/nXgSQ07V74MiBDRfDQAWiC4/
 hSqCiPZXoeWmpoF3blw==
X-Proofpoint-ORIG-GUID: q-2__09gBDRrnBUb3x8JQfFhm65UcRD7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX30YJaH/9txPC
 QD8kB+VZH9M7xrAhQIukw8g4FX8/AnmrfMzl5vyE2MJxjRadltdunKFA8rc8lxlpdMfmuD9O88Y
 EvR3cUglO69OcVQMjOjFma9FhttpYyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Hi Nagashima,

On Tue, Nov 3, 2026 at 5:45=E2=80=AFPM Nagashima, Shunsuke <shunsuke@nagash=
i.ma> wrote:
>
> Hi Loic,
>
> On Tue, Nov 3, 2026 at 2:46 PM Loic Poulain wrote:
> > If Linux-firmware ships 01387, someone will need to confirm that the
> > MFP capability addition works with that specific firmware version. For
> > QCM2290, I can probably test it myself and provide a Tested-by tag if
> > you can describe the expected testing procedure.
> >
> > Yes, to Jeff.
>
> Thanks. Then I'll start with the qcm2290 file only, and leave the
> shared 01387 file until someone can test it on a db845c or an axolotl.
> Note that qrb4210/firmware-5.bin is a link to the qcm2290 file, so the
> change covers both.
>
> Test procedure:
>
> 1. With the current file, dmesg shows these features (crc32 a79c5b24):
>      wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
>    Connect to a 5 GHz WPA3-SAE AP (PMF on) and run iperf3 to a wired
>    host, up and down (-R). Do the same with WPA2 on the same AP.
>
> 2. Make the new file (qca-swiss-army-knife ath10k-fwencoder):
>   F=3Dwowlan,mgmt-tx-by-ref,non-bmi,single-chan-info-per-channel,mfp-supp=
ort
>   cp firmware-5.bin firmware-5.mfp.bin
>   ath10k-fwencoder --modify --timestamp=3D1706616060 \
>       --features=3D$F firmware-5.mfp.bin
>    md5sum: 58982403c9c56a4b888fe0ab3104d7de. Only one byte changes
>    (offset 33, 0x00 -> 0x10). Without --timestamp the tool writes the
>    current time and the md5sum changes.
>
> 3. Put it in place of ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin and
>    reboot (ath10k reads the features only at probe). dmesg should show
>    these features (crc32 f9e8f071):
>      wowlan,mfp,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
>
> 4. Repeat the iperf3 runs. Also disconnect and reconnect to the WPA3 AP
>    about 10 times, note how long each reconnect takes, and check dmesg
>    for "firmware crashed".
>
> On my comma four (WLAN.HL.2.0.c10-00459), adding only this bit to
> its firmware-5.bin, with the kernel unchanged, took WPA3 from 22.6-31.6
> Mbit/s up and 21.6-21.7 down to 273.8-287.7 up and 242.5-243.7 down,
> close to WPA2. Without the bit, ADDBA Requests went out unprotected and
> no Block Ack was set up, and with one AP a reconnect took about 24 s;
> with the bit it took 1-5 s.
>
> A failure would be an association failure or a firmware crash. If WPA3
> is already close to WPA2 with the current file, please tell me too:
> then this firmware may not need the bit, and the test only shows that
> it does no harm. A monitor-mode capture is optional; with the new file
> the ADDBA Request frames should be protected.
>
> If it works, I'll send the file to the ath10k list, to Jeff with you
> in CC, with your Tested-by.

It works for me on qcm2290 (Arduino Unoq), and greatly improves
throughput on my WPA3 AP.

Regards,
Loic

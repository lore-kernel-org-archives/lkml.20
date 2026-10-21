Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792568694;
	b=sHnqOnCFZKynRiZXRbUXqr/3AuWkb2QqEQm2t8tBrWRvYvfzXIaPG8TeFSx3jJTIXZh+
	 8pmB6MON4zYhmWrxD5sRFZs3Q3sfufGzE0dw+reDqMg8aehDGUG5DlSd0zOI1TSj6d5Yl
	 C4XIJg2U+6CtnqkXAA+75rXkpYMEG0TDZjRs/T7BpzRd+hf836hNtAuDqiJqLOuWoKxo0
	 6GVlGTVZnSG3DJPbC7U2Mb1O4gHUaMxZsu5+xF+FBl05cOnyr3cQiIlwxfnR/vr7a+9sH
	 xoxf+69Y3FpUgPERWwl76ppSGw46sTxjakzfoXs+B9Wk4Iu+lD04T74RSNqli41x61g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
	b=Bzai1du2Y5ilz0IX8EXYcseDzt07OXd/epbJIknKE32tY2d4/4VUJD07YEZAc+ZnGe7g
	 JAghWawtpoj05AeTp2gD/1Hthe5k55VKN4HY91hV4M0Ze6y+h1NJAUqlBDyyNvfOlvSLN
	 gHecH2xzSRDBIMTA0oXkqnZHE83ELSpJuufZRXolGQ/aIeRgFquvnIFozUFLyxtDaVsXM
	 mZ3oq3ZvOq4/q75nAakokHOld700W2VFSMi5u+Ro797IuM9ktIVIUsczXPVU6FPAMAUtW
	 r/CGIM11xu3qNa1EN3KlEfTYj8sIevCxEkFMqvp5eAR/PvsqQACzmyZVuRWAded6FsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdxo1FD5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmwWMyb0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 935D5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdxo1FD5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JmwWMyb0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jNaN3359107
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=; b=jdxo1FD5E9Y1CbK8
	wJBF3T7px8WGG3gXrO963dXhMxvwAJS8yx9tXnrCwq/OaFfc+2aqeJ9re5lH8yJm
	2FAjfPD+Oc0TY8kifDBMwzPhN2/r9RrGOqTwwsdu8SLmqBtjrkqTs82W34gjXcb/
	rdEUsc6ANKPtkjcaJs6I0opoOzqyRxj7eZzlVr9skQYeQ0XTnzAJHnrVwUguJOxs
	Wb1rKqEqJSUe04ovRZfTWcfKeDBK6PIv44wnmTv6uFeaxa9PQnzFg7tduJfzp+fo
	U8i3HX93Sl6MoK/lLpZrEszvHUEaa0BMpcoZZv3IVeTXK73B3GZDQSsK3AxVnwt/
	5Z3C4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jm13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:44:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so99609085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792568692; cv=none;
        d=google.com; s=arc-20260327;
        b=iTwuSUNyT3Yp121Ww5y1ffZH+spDWGtnxd7/QAneRD+MCm3GYxkPzmP+A6c1nZp8sp
         UQDZODsTNdGiwBU2XnHFB/D0JL+Nz5gZdMtuqZ3jCCQ9xnciyTtK+erNt1Y/97zceQs2
         MvnE1LSg9KEnqGTR9PJ+RjA/8ymrooQwgsv1RO49ZkdQAfIZ1A8104Xmuy0KSSKvjEvz
         MnrHQ2ruyl0aoPK/5cehEBXjkJqpbtOIkofawr9N/V8//kxEe8QGUY7aadOLTKjGXheW
         7pinOM4v7Ya09NVZjwi+T0WaTuBf5OaT38b+VKWI8EYhrIRkrAUzGjsdwHzzOutiMcOY
         ibuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
        fh=1mRIf35EM2KhCaH8TP5T+o7yAzvRRysnwzc5CnDTDqs=;
        b=r+Pi178hWm0PtWEYykHA2I8YJMwd2ZJ9HThdqJV9YW+Gxw8TbjhcSs8pflxsXbKuse
         Kg30uryf7LRMLRic69lyx6+1G7LqDvtlVRzf0w4Lq+jPKg6xDoV9hX7C/HJJSYJa1kI/
         Eboy64b9kl2iz7jzc1x8KleGqYhudpbkYpTdmdK5LSfcY1z33NIOSHQJPeNFXNOPzxoo
         RbkanZzplgCrXDaCkuFFNto5QaPAVRORMeyagVq6ZJAsh4QxwMZjeiBRUgWbh8agjFZA
         6DEptXDTCg/UJHQhLxiiSaR6J2PcenWs/Wuewk+5f6OXyd+weDRHfugXkEvVD8UC2GCo
         pc3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568692; x=1793173492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
        b=JmwWMyb022VDqs2dVvgQPo2irMuTnmV6fLk8pAuN/vZGs4lhWpsd3UaPdet2pXrCOI
         s1NpjLlLr5CWAczCdVhggYP2P3vVB/aJGm3h9qjQ4dkiMeC8alqwLvlWWFVO/zCuncZ8
         I/noH2qpVA8I6zYbJGykmUBtJ787jgrQgT6OQTXt6+SiJp6mn7vUYaA/4iZjAVuy0YPd
         aU0B+2cNPk7dCHc4jxT1BPVVJsaU2tqAhYeC2dc63h1lzTg1p9Usgue5YzYI46XhkfWz
         /x7LUuS8mm02/djjUANHaXBjaKZ3jG2eunC/0lfe+Vy8L7BMv1T7/kyRhJbQ9Zv5wmzd
         THGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568692; x=1793173492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUepUBVvZqTH1fHQ+aT3wHsXwm6+pjQiNT04ccwpTr0=;
        b=b8JfcOCxiqXTIOFbKZUk6VzRJKtaR3k6ey5HEMavWtReQ67prD2eRc1tX3ypFOMTMt
         E84jeWGsnqu+eQ9JwjfgOD+Cp27OUHCAIih5TrM3eN+9SY8b9hNU1Jbwos4htsvRSP4K
         1i/HM+BajKsELfAB6bx3SwmtXe0xLkAfswDcXYcysmxqvhoO0rc0OiThFqwcvvXxuLNp
         Vgk7YDn2B+a1e7I1zP136j4ANKASlRUbo+0YYAkoUxf3oUn2HGnrvmRAkpTCX2EAU4wx
         AWrcJR4SrC7QDVum2cPLUktYiPuGNs422sNGI/uUm196NoFbGa2RO+CcQL7bxepbMMuL
         cwQA==
X-Forwarded-Encrypted: i=1; AKwUvBwSmcY4B/gIfvNHJOdpY+70EjcZc84Boz9mq0ImkHrLO+w/bxXFKylejQVJfgdQassJwTUwhAvihPIs3F8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgyAMTrgjERNhUrqXGmeEKKXnUIxaw1hOq/la8/WEoquw/JmDm
	Oc2n8g0tLDtXCl//oyV6QUJN/qVqL/UcJXG7o6rqsmN3K8+a1TnNJWLiDBoKt3X0SoaRbrmba6u
	HgoJJ/P9Kb+y/sus/oVs2Q5K3JjNM63nsSXcza5iyBvGYmgaMZDGgWfAddjHTBLkYd00OJdQ9zH
	Sml18hVd5a3W4lIvS7hfhGmn2IogeNVsZPXu1geoL4wAcIgHCPWRsI
X-Gm-Gg: AYBFou1P0KZCFN8D36qvSveBnZKNVbvSlzFJt17oyJYczPvMRiGmWVwZTexcqs+N4mR
	rgKXG885QX4GvYDRlm3T278leI4DZol+waFvIY6xwylskKdk8+v9R6AHVxPQDH1CxPCpIrwatrO
	0o9k0gXsA9h1MH7F6623xxpPTt5MG59R+YEQTqYXzcy2UJXm4S23XgmnzSr14FgLVmUc5fEkPQn
	27uy4JYLKnFO1UNkTEI4oILNIMFLFZaJlbKhC2pvkqn0JpcsQPPJi2fYxeBz0T6H/N/2CaiYvM=
X-Received: by 2002:a05:620a:4452:b0:939:de48:e41f with SMTP id af79cd13be357-93f57f4a770mr277892185a.31.1792568691709;
        Wed, 21 Oct 2026 00:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4452:b0:939:de48:e41f with SMTP id
 af79cd13be357-93f57f4a770mr277889085a.31.1792568691247; Wed, 21 Oct 2026
 00:44:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-3-birk.skyum@pm.me>
In-Reply-To: <20261020193946.51478-3-birk.skyum@pm.me>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:44:39 +0200
X-Gm-Features: AclHuK-A2tHFi1BbsII8WbD0jiKjbsnoXE2GHZ86KIPcCe_VjivQo4KKDrbb9oI
Message-ID: <CAFEp6-0wmUYhcF+_nv8U3WovxyHVJJFs1FWfN8xb9ogMOxpBRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: qcom-cci: Suspend the controller 50 ms after the
 last transfer
To: Birk Skyum <birk.skyum@pm.me>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX1FGyhSLKm9E6
 PmAjkkIr2IDi/nMM8ssHB1yYz8U7ovMbprqmKFq+S28O8o/rYM12s7jQpx45Y6qRwWJXWwD4EpZ
 6FmZQvAXR3tfvvXJweuf7P3kNkH1MoHCX8g99hkE0NnK8qELeKm7ro+w+WbMf8pYoO1DasosTwq
 6L/U+mEyc2jQG1P/i00OwyG5/YETP3IsWAok6tyCJHglLcwnpdzGrp7+ASBCUkAA3qkBJdNN4WJ
 E8qEp/D/DiGyKsRSuIMTd1uG8tHfmMIl+Rhfo9PymKg7nMUU3TyOHuf5ypcHvkjOF2B3gWD+RXo
 PC2hiIDQjcHDT31gMLpAW/Z9lVv3VJoQf8epbRNg+IZxyVZ9C+daBQbWCEyFmKIWM9OSAh6MVvM
 r7EcLJJKEPiw7Mt7/RL8KHWQduF6en3kMQVAHIuNTfLMqUWSuwsQJqz2WXY0OuFLovHpZlno1Ir
 rVs+HOyywLSSHTbeEqA==
X-Proofpoint-ORIG-GUID: 50hxuYT3MabraRSzAUfq16d4bqoBCkdv
X-Proofpoint-GUID: 50hxuYT3MabraRSzAUfq16d4bqoBCkdv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX1LI9uDgjqMYW
 8Vkwe5iom43NYUp6DBMg8aMAAPwiRCF8pCLV6Kh5l6RtRRTO3buZAnpD+sj6SdFrmj+M/Ps8rN9
 QNjd1Opifm6Z7eZLkF1qZEMvy0+xfwo=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad86d74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=ZovgdgjKAAAA:8
 a=Bu-N7aw3tzf4DBNc8b0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210030

Hi Birk,

On Tue, Oct 20, 2026 at 9:40=E2=80=AFPM Birk Skyum <birk.skyum@pm.me> wrote=
:
>
> With a 1 s autosuspend delay the controller stays clocked across any
> power cycle of a target that is shorter than a second, so the reset on
> resume never runs in between and the first transfer after the target
> comes back stalls until the 100 ms timeout. Camera sensors are powered
> down when they stop streaming and up again when they start, so closing
> and reopening a camera quickly hits this.
>
> On the Lenovo Yoga Slim 7x (X1E80100), restarting the OV02C10 with
> v4l2-ctl after pauses of 0.05, 0.1, 0.2 and 0.5 s failed in 19 of 20
> cycles each, and in 16 of 20 after 1 s pauses. With this change and the
> reset on resume, all 100 cycles started, and so did 150 of 150
> libcamera starts back to back.
>
> Transfers come in bursts (a sensor mode alone is a few hundred register
> writes), so suspending 50 ms after the last one costs one reset per
> burst.

So, no, we should not rely on runtime suspend/resume timing as a
workaround for this. That approach is inherently bad and fragile.

Have you been able to probe the CCI I2C bus during resume? It would be
useful to see whether there is any activity on SCL/SDA and, in
particular, whether either line is being held low.

I wonder if enabling SCL stretching support could help here. One
possibility is that the sensor (or another I2C slave) is not yet ready
when the transfer is initiated and therefore holds SCL low. If that's
the case, have you tried the change below?
https://lore.kernel.org/all/20261007050147.274096-1-hitesh@ebytelogic.com/#=
t

Regards,
Loic

>
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 51ce174..62b0fcb 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -794,7 +794,7 @@ static int cci_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto disable_clocks;
>
> -       pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +       pm_runtime_set_autosuspend_delay(dev, 50);
>         ret =3D devm_pm_runtime_set_active_enabled(dev);
>         if (ret)
>                 goto disable_clocks;
> --
> 2.53.0
>
>

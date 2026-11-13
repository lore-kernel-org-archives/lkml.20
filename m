Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592067;
	b=bWYXsxUC+Am+O4TkeVLPou2hDm5UY/U7SIiPpyHtLvw+469wHTCaMCtpPodIZD7hKHw6
	 DC6rec+hjR2YrcXa+1/7E/oqAHFsUwVDuihO0OJLYNkq+RUX4eXewWPQnMIqEt1M9/Zy8
	 g08vZLpN9ppV62adrFr2+8M4y1KgWxjC9KVT4pudxATcd8034OxsrPm/vZ9aXECipkKao
	 IrS50VVRToJutuu+zbmughwQVppTIPBmXfhleFpdCyAc2GzkWLARe1L3mIV3qRA+2/+Zl
	 rrwr13uXc/GgTWVAPvwy0U0dvPTUCBj/FTyRc0teAEqs9lVlu4CohkYqk2GYSFQx/qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
	b=hUBx5CSwVhgEWCUcl7PuF6FGkyCZs151iT1/2JhKXyvWhgEesroFG56ef7J4Luh4FAwt
	 6gj5AWX6mGehAMwm3VEq23QMjIrCf5cdbThoQlPpu9yqxPImEw/Z08lix379evdd1RsG2
	 7w1Nfg3wg+v2Ww+qyrKGNL4WN8PiHjSmq3gIv9IdZmrXH3D02zmnEGi9twim4438AcKC1
	 UBrCMbWEVx+Lr1fbhhQNPh8w6rbG+FQOidLs5DmfrSS4lNUo10TfLIdvZGPgSSrBW8kPO
	 FTQvFfrN6BEIbOeT4QoQpfm1hkWzK43Hy8ZdUyQwo2e9QBzVrSuMpDCxaKqoDGIBtgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcznuWyK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkCkP7n5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D28606C0A4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D28606C0A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcznuWyK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkCkP7n5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXJCB2808704
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=; b=RcznuWyKp1IBp9Mf
	p6xVOeD3Y/BJqD1rDuzzbT3i/578VJmkuaXrNGeAW7aRQwD9RaoBB6eCuAoF84BZ
	9NhLPsT/8N78CBXiGQnn4bY5ohFkrk0VvKX05XSEGtKCNpEYi9Kc41pkBeTJ2yuB
	2y4Nbma6Y/pr40wypVnROv/iBBYhSdqdyZpGJvGrgyeAZF2gbZ2JJhhFeHiELT8d
	dpk3RfYzniz4y8bWkk7RWTNdnbKu/2yUJHZSMxleFXp4uYv0KvBoYoDk0tnaZplY
	GbXuf6uYLmXthYtNQFM1BlD9+jbtkNNp3XEnpc+mZp2ap3/Ki6FWCSbmR1vWdcPq
	ixjK1A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662r8b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1595730a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592064; cv=none;
        d=google.com; s=arc-20260327;
        b=d/ClBnZp1pQHzh5+dg4MSAz8r85okwkiAgGdX7Pb1l9Wi4LOJntbVpL7ZSAGTuc0Ke
         dXEAMybDa1Ege7xibBe7HuosmuQ9zx49Kozu2qrjwHJuV7zxSfqSTAi6Q2c5OMG2V0oI
         6t/cs/Eoqegxkd1ZqAffStcXXAxUwbj8oTWrP33i/lC4gche2/4mBENBRhvTZIjMFOsd
         Khbzku9/mlaS40XNE4mAz070lUNIbBIUiiG9EdzEgJYihUNpI4CNbFZCFN+Mam8ghVtL
         Ban2ltMX553PZV7s7j+0EuUHMXJw+Oi+/FWgrtOeFRsB/7+Dviz2dQ+qxlQTb4+Yl9EO
         Gvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        fh=ntp/cvrNkMxCEuYYfKoFvxya2vtRswqwPjKJ+s/Sf3Q=;
        b=dcSz1myRwGuJCEPBy2fXxMe6h+hPLI7zbJ/MO4Db1p2Nwbg3ncyA2/DwXSTrPudvR6
         +RUjJixebFD19ZGlPvfWtdtq135/fATLQ0/913YeJ75Xn9vcbCPNBmnsquiEA0kWB6Ir
         IHP5ByP+UuHgHfzBS6vyl8isozjW5bBf5Ks+ZPq8nsfwVwOYoha4/carK2VGKql8HwV6
         nWQx8ROGM6Yy/e0blbm8ZY2S8k8t1txVz3q8MZDo/+ka8QczyzWyM8QOH500a3J4/h/x
         WWaDbIGu2rioHfiMrB+2bOQFVJOAmk+Si6K2QFPN1TKySSEmRZ6T6zwuYNt4mrQ8SNJI
         GBQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592064; x=1795196864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        b=gkCkP7n5GIh2mJEaxkN9fdhigjWm/V5OVuf1uUpxzLni4FUhI7Wuec3HFvtJbDczDx
         qk5i2T7KUSHJRUIpHMf3+VFigtc0ylrU3kn75dWB59OdfIC7CC7xovXYtrf2qg/RZw9b
         OyS8SMEC8TPlwnEu9udtKUjzZ/zwL/5yKsh2/zW4hy9WRwuP2jHWYLxDOk0NTlz5PISW
         z/cvcoBTUzLuarKTB+kkl2slb/m/wde5BrgnlaX41CFKV2TWB/tsJfy9dd3P0p08ApQ7
         W3ThgPpw+Xyq2uKodynu4bUoJ0zd0DhSz7CLLUvS+xeAFaLctwR8vYiLaEcOtFamVsr9
         06pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592064; x=1795196864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        b=sbB90O9IBG+S1ggTdYPp0j6m0S7TRz7Yj+XkhtUNQcKxqBxzEHSggebTfcGOc+yk78
         LCUx2Urr3fNnsP+IHS1awWZjxJAVKFxc2K84VwvDo/33jY38hIxp26Sl0oLHAI64fJIQ
         XOwZdZNx/cPixDGRvcF/XcsiIfX3PiQTRplIa5/H5ty5UYGVCQK3qwUk39TieTW8DpOe
         Rld4BeuuWuCyUkleudhdpVmo6xfM7pg16blMQ+XtI/9NoV+cSTcf+5yat3423El9QSjI
         hS2fTMPRdL5McdGa+2ADXGGm6ptulWUkZuSIQ6trxSy9Ff/jAkx97giTSY7owLcAloAc
         y9NQ==
X-Forwarded-Encrypted: i=1; AL+hErEV9PXIIMvZglec1mU6BXwPvO5REHR0cIQWpMY6CGjaJ+6Nn7DYF1Anb4esG/9i8L9/fLpphjQfXDMSQkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mIupNqlvidd9SUbcRn1C3ahLdq4JMQWsqBYJmTpGbAlpdyfBf
	fmpLBtIo+HGxnMxuoiaBE27jQLcwE0MAOru56jOutbsrS+ETgNxQiU+7Yol+ErVlbe9ZzdtVS/U
	C869/uqR8msbEGQ9OVdirFerkOnlTxejLDzx/wXfSwg+Cx3i/Fi6GqvGtEk2THq/SJyBV/rOn6P
	9ucG5FUqU7QwsxfnXY0KIlnSdB7sFlJvFS019jcIZrfg==
X-Gm-Gg: AYBFou00JraWNG+rfl+ivIOWg+6djQY9jmBm1jJIvX0m3OXO46BgqTcVch/jGIVA4VM
	He5RkqTbK5KgoCgPiXJRDtxD/nuF9TgkzFqUytHX3xuMxoeXo+DguPsOPA292DUicUiUoZi9VFr
	CVnnfq92lMj1B7/AJdgrRbOELNOPU+4XkT9/jbSBPoAedhKca/GIWPlUBbZg==
X-Received: by 2002:a05:6a20:d48e:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3f7a68a5208mr3120353637.25.1794592064035;
        Fri, 13 Nov 2026 09:47:44 -0800 (PST)
X-Received: by 2002:a05:6a20:d48e:b0:3d3:aec2:4dcd with SMTP id
 adf61e73a8af0-3f7a68a5208mr3120329637.25.1794592063543; Fri, 13 Nov 2026
 09:47:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019092417.391522-1-leonard@lausen.nl> <20261019092417.391522-2-leonard@lausen.nl>
 <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com> <avYBtK0fyG_0--nN@venus>
In-Reply-To: <avYBtK0fyG_0--nN@venus>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:32 +0100
X-Gm-Features: AclHuK_J5EuV9dnZIsWrbl-naj0R0vX4a-pEYbeUab3qTKG86s3ZcxdOv5w6zDQ
Message-ID: <CAPx+jO82TGVDRqoz+TN86LVfraVVeNhHBFktTDNvVzM7S8zbng@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain supply
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Leonard Lausen <leonard@lausen.nl>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, detlev.casanova@collabora.com,
        finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
        inindev@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, gahing@gahingwoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: IeLLF-Iq3aw_nZIuCFGLFYmwezNdXLit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX+ndKZM8+Iy3M
 PzdXtYEWzbbfkFbvZf2/U8PmknYyU9IYaMGNKANLCCyNB093UeFjx8UYVzG8vBAsizjR1d6KdJi
 SiH+1tJ15Nh+tY3w1+ys8fVM7YgSaT83qBmEn/isfpCO7KH8ubaSZW8mDH0qPWbCMg0KrgXnEQt
 exfCT78NlE1d0OTG/tqaVzJVvd8C3UfblZ/hV+04LVNrZef+sR+u7b3NC3P5DBHunAF1Od/3dYF
 dmIB+CU6JXSr/LtblOGpanxlGb1z6YcSwfcjA20+SCYX4BHU+QIWgACWefIgcJdQFJb0QiCdLV8
 YzJihxjYF9mn441FN6laWJC3u5O8i52B7KvTqrdw45MWcDvqIpamJuRlzXwys3jQ/nwLVCFmAAH
 AKUIYdLKeATvsw6Xij5OzITkwU1O5Et8LLIGbaH/9S5xyckWN/52t5UnmozeUfu3VOgGGKOhP6v
 NeF+rqhVE7Wg7R+so8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXxUEAxeVYXtB2
 yMYIN9UrbyMs6J/ZJrkYZLgxaeNT+gqNWCcubd9fWzNjTW2sGAB4kNYH2Nw+Gbhw4t6KZqd31nB
 QZKADtlfBnacUq/HNj6EJMLeQ9rn4Bk=
X-Proofpoint-GUID: IeLLF-Iq3aw_nZIuCFGLFYmwezNdXLit
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af74d41 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=9GNsruGHAAAA:8 a=QX4gbG5DAAAA:8
 a=TNRU4YkNAAAA:8 a=mTdHOEkXxLqTN0UqMq0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=gf-oSkQAjqHFJRp-GQfY:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=T6RL-YpNOstmnv1gjOTq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Thu, Nov 12, 2026 at 7:16=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Nov 12, 2026 at 04:19:58PM +0100, Ulf Hansson wrote:
> > On Mon, Oct 19, 2026 at 11:24=E2=80=AFAM Leonard Lausen <leonard@lausen=
.nl> wrote:
> > >
> > > On the NanoPi M5, boot hangs during Panfrost initialization. Before t=
his
> > > fix, booting required blacklisting Panfrost on the kernel command lin=
e.
> > > Loading Panfrost after boot reports a GPU power-domain acknowledgment
> > > timeout:
> > >
> > >   failed to get ack on domain 'gpu', val=3D0x113ff
> > >
> > > Add regulator support to the RK3576 domain descriptors and mark the G=
PU
> > > domain as regulator-dependent. This lets the existing Rockchip
> > > power-domain regulator handling manage the GPU domain supply.
> > >
> > > A corresponding domain-supply property is needed in the board DT.
> > >
> > > The regulator-capable descriptors are based on the regulator support =
in
> > > Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU se=
ttle
> > > delay changes.
> > >
> > > Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahi=
ngwoo.com/
> > > Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC"=
)
> > > Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> >
> > So this should be applied as a fix and tagged for stable kernels, right=
?
>
> Maybe like this, considering it requires regulator support, which
> landed in db6df2e3fc16 ("pmdomain: rockchip: add regulator
> support"):
>
> Cc: stable@vger.kernel.org # v6.15+

Alright!

Applied for fixes and by adding the above stable tag, thanks!

[...]

Kind regards
Uffe

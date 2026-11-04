Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834317;
	b=Rh78JNEeoaU1nf9VSk9f3zMonfSqnSydlG4hv/RXnZjbuJJ+sUtZFHzAQ1EW4YWPnXzV
	 tcQD+kkzs34UO3vT3URaPce16VowjbZVxVDeG1cLKR2HrmgQTHBuupXnkftwFLoO//606
	 TpaIse1oG2h1ONQ0yrFGBBSjEYbCgh2Y/csEvHI6NZ2oMUYx5jB2+72T4hS7EY6rE+uCD
	 MwFOWNau2WvzsEdbEvqDN0TZW6sv/QPNgVGBSH664h9V+OHJ+ZqMCPGleP7npCCpp5p73
	 F6uSQHWzDQUepkQykB1fxDOfQDbUJXg1/jGofW1W7h42U/eTmnX9zVp8g5AEz5eGnww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834317;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
	b=kPlSqw9j5odHh6glFFiiDZ01BXPLQE9V61QPMazqeO6N0ynsJr2ZEfkWzA9csGgkmTKf
	 Cm0gk1wqmPb39EOiJZQfrOPEF8v5V5cF9YtS/q9njKQGW8aK7HpwBYPTWNZGtlMazHmF7
	 xLWFJMkvKK6xDBFwAaLavUOJwSjkuX2d7Di0DCuSfQE7QezjYAW3kemMBzdZx+B+iraxe
	 SwMd6sa8FlV+pPdCklwSAdzHvcWZmQhrDw00eCI/A7QHftkUE1kFYYJwClaRcYwx1WzPo
	 HYDtgmhywlQBTzF+t34T3zseRHaiafmug/LJEYFZw1F0kjGuPW3dsyJAO2nyxNb+xxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853FC606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so10255211fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834316; x=1794439116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
        b=p5n4JNnstv+0nhoWL8U3Wh0JbfApoDR9rZjMVTp0ENJUR0mR3jUOfJwBRnKBBxjs2h
         pxk7n49J+G8EtoI34XFpZPtB24n5v5V6caPF0/T8IcfMHStpO8xJgvbPAGchrmtWtoK/
         WCpdtW/2/wuQOpyPapcF4n7g7pGNofX3B7WDQGmfyFvNF5Z0sD1Q7o+XiqM6OM3uJlCm
         iMIr8YEC1Qg4sr9Dw/7zDHwEtAwOFzahtWH6UijipZQYV3QRsVr2p9sQqAlHkZAqCT4E
         UfZwKzvHDLI3HX+F/Ka67bhpslpWXmBgMPdmCrMaan8lxQtl2t8enS0Ejah1LNwLlqND
         9ZJw==
X-Forwarded-Encrypted: i=1; AKwUvBwZZGBndIIxZwVNwBv9aXwgd9fdiIJWHuDqIVl3sI0ukj10mNOWfZLqR5WyAKFjnCJAoyg4npu8lobVGSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SD27XM6v4fvTmUx6aW57Hwd7TzmphVTHOGj4+n1Hzqy2VxXvW
	Sw8lT+Lw7+TrbZmK7f8ViflqhfCAB4JlkDdad6DJCYSntq+cM+uIsO+4R++lxLT/H7c=
X-Gm-Gg: AYBFou2XtPnsZDh1U3ONVSx/qqh5sw/fMnn9YE3beyEoA11Y6d9yDSWnu1+i6+PEhEu
	A/113BfqJFRBnvLODFRPpo9cYIuVaicqSjJRjrgj7wvkjTPSNXAIt6SgVvtw8sSIQ1f6Tu2TBjj
	TXKudokYkEDPDl8R80qYGxUOHsqs945koNorugvP5kVa4GHEoZp1z/yIl3nGpv3o92x0212+Xuv
	kvKwDUYCOVhkqpkUUZufMb8Jqs+qkwG38S2rnZWNtl2tHR5CQrhwJlpoWXspL/M+MeX8Itn/g3J
	w5J60GUNkr0GVRbSrR0fSRB67hfEJzJyjtFzdGdqvMlHQ/nY7ZI4X/VlYrl9FspVSnsTrGtmHb3
	SzrMWv6lWph1YcJzdBMKMa47PxWC6EyDgrdngbt3z2yWkLAkN0X7LERUAYmDVzf4a3eIUPSgjYM
	MSZtkcy3h3GzVW8H3eEjCInG3uJ01jZ0HXABprRPHKuE5FhUWYjmyVgIieDfP5xj1FxBYTZ4AYo
	ub6XpNevagIshbKVzuMaFWYOgef/uHk50w27nqK7QcjfaHm2uHk8YQ/YJHxBB1QZrSHZZxcG1vW
	W7n/OJ0BTecPk3i/GdqRA9hYe4Wz9R28Xy+OkvFUyheljCKEBtDhcM/Qx6sZ8j7MoCKTKjI=
X-Received: by 2002:a05:651c:890:b0:3ab:716d:6406 with SMTP id 38308e7fff4ca-3acb7b22a6dmr42315581fa.17.1793834315560;
        Wed, 04 Nov 2026 15:18:35 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc7fd7bcsm6863681fa.39.2026.11.04.15.18.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:18:35 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so12068781fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:18:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwvF0p/Xrigu41kSwsdn9XYr/k7e7/L1HqHnJv6HNlApDGmRUomlH8Q9KXzJm1NoFsQOu5fZ4bgah6i+tw=@vger.kernel.org
X-Received: by 2002:a05:651c:31d2:b0:3ac:e4b6:b93d with SMTP id
 38308e7fff4ca-3ace4b6bad3mr1250481fa.8.1793833951678; Wed, 04 Nov 2026
 15:12:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
In-Reply-To: <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Wed, 4 Nov 2026 20:12:04 -0300
X-Gmail-Original-Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
X-Gm-Features: AclHuK9-uWrMe0XXfFl-zEd0pTQ8lUonEa8rXy8zxcLRw3JRTxzZbTIo1byB1YQ
Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: Val Packett <val@packett.cool>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Val,

Thanks for the review, and great timing on the SC8180X work.
> It should probably go higher in the sort order, before 8250?
Agreed. I=E2=80=99ve moved them for the next version.
> Interesting, why do these match 8280xp and not, say, 8250?

SM8150=E2=80=99s downstream DT describes the PHY as qcom,csiphy-v1.1, and t=
he
v1.1 2PH (D-PHY) lane sequence in cam_csiphy_1_1_hwreg.h matches the
2PH entries in lane_regs_sc8280xp offset-for-offset:
- 0x0004, 0x002C, 0x0034, 0x001C, 0x0014, 0x0028, 0x003C, 0x0000,
0x0008, 0x000C, 0x0010, 0x0038, 0x0060, 0x0064
- lane blocks at 0x0704, 0x0204, 0x0404, 0x0604
- with 0x0728 =3D 0x04, 0x0700 =3D 0x80, 0x070C =3D 0xA5, 0x0738 =3D 0x1F

The SM8250 lane_regs_sm8250 table is a different sequence (0x0030,
0x0900/0x0908, 0x0034 =3D 0x07, 0x0010 =3D 0x02, etc.), so it doesn=E2=80=
=99t fit
the v1.1 PHY. If SC8180X uses the same v1.1 CSIPHY, the SC8280XP lane
table should be the right starting point there too.

See https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-co=
ral-4.14-android13/drivers/media/platform/msm/ais/cam_sensor_module/cam_csi=
phy/include/cam_csiphy_1_1_hwreg.h


El mi=C3=A9, 4 nov 2026 a la(s) 6:19=E2=80=AFp.m., Val Packett (val@packett=
.cool) escribi=C3=B3:
>
> Hi,
>
> On 11/4/26 5:54 PM, Andrew Gigena via B4 Relay wrote:
> > From: Andrew Gigena <mail@andrewgigena.dev>
> >
> > Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> > subsystem contains four CSIPHY, four CSID (two full and two lite), two
> > VFE and two VFE-Lite instances.
> >
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > ---
> Wow, what an unbelievable coincidence =E2=80=94 I just went looking for t=
his and
> found these patches on gitlab in order to test on the similar sc8180x,
> and half an hour later you've submitted it to the lists! :D
> >   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
> >   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
> >   drivers/media/platform/qcom/camss/camss.c          | 262 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss.h          |   1 +
> >   4 files changed, 267 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index dac8d2ecf799..851decb0691e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -1141,6 +1141,7 @@ static bool csiphy_is_gen2(u32 version)
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> It should probably go higher in the sort order, before 8250?
> >               ret =3D true;
> >               break;
> >       }
> > @@ -1236,6 +1237,7 @@ static int csiphy_init(struct csiphy_device *csip=
hy)
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sm8250);
> >               break;
> >       case CAMSS_8280XP:
> > +     case CAMSS_8150:
> >               regs->lane_regs =3D &lane_regs_sc8280xp[0];
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sc8280xp);
> >               break;
> Interesting, why do these match 8280xp and not, say, 8250?
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 2680a9914765..dd28058e98a7 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, =
u32 sink_code,
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> Sort order here too
> >               switch (sink_code) {
> >               case MEDIA_BUS_FMT_YUYV8_1X16:
> >               {
> > @@ -2010,6 +2011,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *v=
fe)
> >       case CAMSS_8280XP:
> >       case CAMSS_8300:
> >       case CAMSS_845:
> > +     case CAMSS_8150:
> >       case CAMSS_8550:
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> > [..]
>
>
> Thanks,
> ~val
>
>

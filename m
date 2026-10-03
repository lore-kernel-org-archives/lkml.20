Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E931E309EFC;
	Sat,  3 Oct 2026 02:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993128; cv=none; b=U9RDIWEYpqisvi0btEZwZfyslcK13vmRUQB2wTRVEUeU0gqojWmPasKyr/mS2bNhTG7XC98MtyUCYy47YTeKpS5N8vFLV0yF0CMAEs7fFDTP8JZ6/QvdJHz1ruVK9SQY/ZUOhuvm8+Cbd77oZCuz7XUyuHOsDpD2/Olnqpwxj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993128; c=relaxed/simple;
	bh=W/YWP1xpuEQLxbrDAlJEzxXMFwIqHADxNYpCPBGkQ3M=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QaMpfBFQm4j+yMlxSgo3t/yM6Y8tEilMDpQbC1guKWBchQ3ZLQAPQuax4sInu2x+Sw8Rv4JD9U5HihwdNGu3bOdblDW6udzCR28Kk1FDA+bhogf/fjvwQ8HNVbl8Dfr08/KotGPwvmLTZCChxaatvSi12xd1zdtgOVgQIwPx8Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DsFCRSOD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DsFCRSOD"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:25c2:6a77:c271:6ec1:599])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A1D3593;
	Sat,  3 Oct 2026 04:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790993009;
	bh=W/YWP1xpuEQLxbrDAlJEzxXMFwIqHADxNYpCPBGkQ3M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DsFCRSOD0zFWvpBDwCpsFoIiPG8T5vJ0VfIqTpq3gUtC/J6Te1hQi/4hnnFwQUogO
	 cWjCZCLoEz+ZfXtGhIUhl8LWnA07q0/kpNH20T+KzeTKpFSqxWhEvq5U6i128UMV6x
	 MRqncGRM1kGtwSfwxIqu5MhDJ9ANqlWVBP8syGWU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com> <20260925133001.2780868-7-r-donadkar@ti.com> <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
Subject: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: tomi.valkeinen@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com, mripard@kernel.org, jai.luthra@linux.dev, devarsht@ti.com, y-abhilashchandra@ti.com, laurent.pinchart@ideasonboard.com
To: Mirela Rabulea <mirela.rabulea@nxp.com>, Rishikesh Donadkar <r-donadkar@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Sat, 03 Oct 2026 07:35:16 +0530
Message-ID: <179099311665.241161.3689416902838951007@freya>
User-Agent: alot/0.13.dev38+g8e372ce37.d20260925

Hi Mirela,

Quoting Mirela Rabulea (2026-10-02 21:46:11)
> Hi=C2=A0Rishikesh, Jay, Laurent, Hans, Sakari,
>=20
> On 9/25/26 16:29, Rishikesh Donadkar wrote:
> > From: Jai Luthra <j-luthra@ti.com>
> >
> > Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir bayer
> > pattern to capture both visible and near-infrared light. Every alternate
> > frame, the sensor changes the exposure and IR flash strobe registers to
> > stream an -
> > A. IR-dominant frame on CSI-2 virtual channel 0
> > B. RGB-dominant frame on CSI-2 virtual channel 1
> >
> > These A/B frames are routed as separate v4l2 streams, which may be
> > mapped to two separate /dev/videoX nodes by the CSI-RX DMA driver.
> >
> > Both of these streams are captured at a resolution of 1600x1301, 30 fps
> > each (60fps total). The extra row (1301 vs 1300) is an embedded line
> > prepended to each frame by the sensor, containing the following register
> > values:
> >    0x4813 - VC (Virtual Channel)
> >    0x321A - Group ID
> >    0x3920 - Strobe
> >    0x3501 - Exposure HI
> >    0x3502 - Exposure LO
> >    0x3508 - Gain HI
> >    0x3509 - Gain LO
> >    0x350e - Current Exposure HI
> >    0x350f - Current Exposure LO
> >
> > This driver also supports a few v4l2 controls like horizontal/vertical
> > flip, multi exposure and multi gain controls.
> >
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
[...]
> > +static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct ov2312 *ov2312 =3D container_of(ctrl->handler,
> > +                                            struct ov2312, ctrls);
> > +       int ret;
> > +
> > +       /*
> > +        * If the device is not powered up by the host driver do
> > +        * not apply any controls to H/W at this time. Instead
> > +        * the controls will be restored right after power-up.
> > +        */
> > +       if (pm_runtime_suspended(ov2312->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE_MULTI:
> > +       case V4L2_CID_AGAIN_MULTI:
> > +       case V4L2_CID_DGAIN_MULTI:
> > +               dev_dbg(ov2312->dev, "debug: %s: %s =3D [%u, %u]\n", __=
func__,
> > +                               ctrl->name, ctrl->p_new.p_u32[0], ctrl-=
>p_new.p_u32[1]);
> > +
> > +               ret =3D ov2312_set_AB_mode(ov2312);
>=20
> So, the group hold for A/B context is set right away, when the control=20
> arrives.
>=20
> While working with the Omnivision OX05B1S, which is also an RGB-IR=20
> sensor, we run into this problem:
>=20
> The normal expected sequence is that the sensor will output alternating=20
> frames VC0, VC1, VC0, VC1,...
>=20
> But=C2=A0 when user space tries to do automatic exposure and gain control=
 via=20
> v4l2 muti controls, if the driver applies the values immediately, if the =

> virtual channels are not switched within the proper timeframe, it is=20
> possible to run into frame duplication (no more nice alternating frames=20
> VC0, VC1, VC0, VC1,...but duplicate VC0,VC0 or VC1,VC1).

Yes I remember seeing a similar thing on OV2312 as well when the AE/AGC
algorithm is turned on, and thus exposure and gain controls are updated
frequently.

In our case the streams get mixed, so in the captured frames for VC0
(IR-dominant) we would occassionally see frames with the exposure/gain
values that we expect in VC1 (RGB-dominant) and vice-versa.

I had assumed this mixing was due to asynchronous nature of the control
updates coming in, where the exposure+gain latch on with a delay of 2
frames, but the rest of the registers in the group (like VC ID, and IR
strobe) have a variable delay depending upon when the group registers are
programmed.

Without the AE/AGC the frames are stable (no mixing), so we must be talking
about the same or very similar issues.

> The information we received from the sensor vendor is that group0 update =

> needs to be between 2 group0 launchpoints (similar for group 1). We can=20
> use the status register to query the currently active context, and in=20
> order to avoid frame duplication we can update each group only when its=20
> context is active.
>=20

Ah, thanks for the pointer, a status register for group launch points
sounds quite useful.

> This is problematic in the v4l2-api context, it implies that even while=20
> streaming, a v4l2 control cannot be committed to sensor registers right=20
> away.
>=20
> Even with workarounds in the sensor driver, to defer for later the=20
> updates for the inactive context, it is still problematic: defer for how =

> long, and problems with overloaded systems, a stress test can bring us=20
> in a broken VC sequence, as there is no atomic way to determine the=20
> current active context + update the right group.=C2=A0 A broken VC sequen=
ce=20
> shows up for example in libcamera as lost frames.
>=20

Indeed, I think we need some sort of a mechanism to enforce timings of
control updates in V4L2 framework. And I don't yet know if system stress
would make this impossible to ensure without enabling RT?

But knowing the sensor hardware provides status registers is a good sign
that it should be possible to fix.

> Rishikesh, Jai,
>=20
>  =C2=A0did you notice this problem on OV2312? A way to reproduce this is =
to=20
> stress the driver with frequent repeated set controls (for the=20
> multi-controls), and observe broken VC sequence (I observed it with=20
> libcamera and on the CSI analyzer).
>=20

Yes frequent control updates reliably reproduce the stream mixing on OV2312
as well.

Would it be possible for you to share the downstream driver or the status
register you have used? We could experiment if the same solution helps on
OV2312 too.

>=20
> Laurent, Hans, Sakari,
>=20
> did you encounter similar situations? Any comments or proposals? The=20
> concern here, to summarize, is: v4l2 control cannot be committed to=20
> sensor registers right away (even when streaming) and we are also unsure =

> when the right moment to perform the register access may come.
>=20

I think this is a good candidate for discussion in the upcoming LPC BoF
session [1]. Are you planning to travel to EOSS/LPC in Prague next week?

I won't be travelling unfortunately, but hopefully Rishikesh, Laurent and
others can discuss this.

[1]: https://lore.kernel.org/all/22a0424b-c67d-4dcc-a31c-26acd764c653@ti.co=
m/
>=20
> Regards,
>=20
> Mirela
>=20

Thanks,
Jai

> > +               break;
> > +
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
> > +               ret =3D ov2312_set_orientation(ov2312);
> > +               break;
> > +
> > +       default:
> > +               ret =3D -EINVAL;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> >

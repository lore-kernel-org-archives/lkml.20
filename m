Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945471;
	b=2uPBJhwqOlefb6QtVgbzG2DqLYs1g02yp4c5Vfnwhd4HnPQ57HGmHs9P6MIAqnlsZUmC
	 nzvR+3W5b610rUGQSb+YIrHumIwi3s0F30E4qc2h8HDWLsXkLlL1ql7Yz6xb615LIJCYp
	 zLAJ+7TRxPXezqmEyQ+uErM4nL1XWLet9xaZY2iWH1UE+lEvLQUjsmrdmWhbq+o5z2XLO
	 8YHYHvZwY1vZKCsKhxeM/BGNi53ifNlz2bTib86SdMs0kmfJTdeoMKOc1c4E1rxA45Q5/
	 UCNxjy8+b7AL8ne/Xyzn34ny9ascVmU9XGKvFO0p3+kzYghci3Q09jrbwJPz54B9z1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945471;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=dlMB2EQjuzBySmR5GqJBziBOr+KKGv+oGqz2McQg0Ss=;
	b=01v914k0LqrKO7v3mUdDxg92VtnEaGV1YRDFYqqgd7CyzVXpQeV620SE391XF++nv+qT
	 f0ma+vbpzBZPfq1KJG0upR8WElDjH5iKhcXQ09MLnE3b6l74gvVsIfuF1Fc3dguDTYvIO
	 11q2FWLukVKSbaTviftXa3vcGiyYCCsmeXtADPV0Qfmmt5TfTv91QgQpmbUoan6qZ6YmG
	 WFW95NpfPBTJuo2X9NotjHKNOIw6c6SHPEpzduUYsc9/B1AQS60EaWVJ4JrnG1DG2dQ/Y
	 rHyQpsGrwwRSsTC0OccW3P5vfa2luAxKVtcy3QDU+7WiK78UEQwLvKwbmJ6X51sauvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CoEmUfaY;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC727606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC727606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CoEmUfaY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793945416;
	bh=dlMB2EQjuzBySmR5GqJBziBOr+KKGv+oGqz2McQg0Ss=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=CoEmUfaYL00ZRlWq6ulYaVkNZeN1ZD+oNWBABhrwQYxaFtvOnN9pwRBSLFqh06Sag
	 4ZqWGNbpBo5bEhwIdg4CHV1E9yXk4Kzwqm6LtKzDaiSs9h2all9wJqzNkNK7/yX+of
	 WnwoMnfoY2evLp4/GtEdziIhXoAC6VjsWuZKbTSU=
X-QQ-mid: esmtpgz12t1793945414t31773276
X-QQ-Originating-IP: TvjStvLttQ2jKx3rjkbSQUng+nHe5KV9P0Hm81jxCs8=
Received: from localhost ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 14:10:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 186222589772570272
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 14:10:12 +0800
Message-Id: <DMNWKP4OI5IT.2S74EHH6A8Z6G@linux.spacemit.com>
Cc: "alessio.belle" <alessio.belle@imgtec.com>, "luigi.santivetti"
 <luigi.santivetti@imgtec.com>, "maarten.lankhorst"
 <maarten.lankhorst@linux.intel.com>, "mripard" <mripard@kernel.org>,
 "tzimmermann" <tzimmermann@suse.de>, "airlied" <airlied@gmail.com>,
 "simona" <simona@ffwll.ch>, "dlan" <dlan@kernel.org>, "imagination"
 <imagination@lists.freedesktop.org>, "dri-devel"
 <dri-devel@lists.freedesktop.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv@lists.infradead.org>, "spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] drm/imagination: retry runtime idle when firmware is
 not yet idle
From: "Baihui Liang" <liangbaihui@linux.spacemit.com>
To: "Gyeyoung Baek" <gye976@gmail.com>, "troy" <troy@kernel.org>
X-Mailer: aerc 0.17.0
References: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com> <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org> <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
In-Reply-To: <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ODTmzx1EshNFL4WFHQIljyjY0SnRwoPgWzJAelDdb5qUjsIeI8MIINUL
	D9CTRx5CD08jrkzzVgZBDNww7zePC2CF/8+UWWZLH3+G3/M72V2UMKlsuM+w3yE0ElycuNp
	fZXR9y6WUYYvJjjmtvMjq7C5I2Y2cpNAVhHoq0g30znS94LdIoIQwZg/nH2881ESceU0auv
	T0AOekcJye1Nudr5SPxcOaxTShNdK5ktjrGlYT7vyCJVaLRyuVBdxUQR/VfyawZAHqkq9vM
	j45DnHJkAiZ1nfqb38TMIoUV5z/QYUEZopKUTK2km0Ulu8Ec8pnUP+FMh75TwH1sTCdh0cz
	qQXWM4nPgu76ovGwX3wj8AxBJM0/lE0p4IuEeJlYHko/PhLDO/mBpeJKFccF5htBjvb0a2Z
	W4gDYJoiM6yPaxvMK399/9h9lHyPA0AvvWjRiAVObCgbfa3OHgKCBqBwM9nfig4EZdCY/TS
	v87ZcAjIHLaIUZ1Np4bpPOIgencFFkO8M2KCy3vt0w3RAWcSWoaM0MPp2J9cclRmbfFRMzX
	P5QUuWv9dJXXBE7R9pDwxHkALP3AFyXKvpFfIcjKT2qYdrqXOkx5VSjEFW+YVPKdODON6U5
	N2XbbakVA2bRDPPyHN/SOPjFxdmRsD8HLDClrw3uVoXzjfuZYZPjcf3TNlUBdYi+cwWM14j
	239A2tnXn9cByrkvrolAdgy4ORbbDTvUTyi/u1qTJ3TUIuX/zBMqE+qI7z/KBN20SvBZeDk
	BXckoFb8nfWsth7/Yy7ZDylfrS0zlNy6fovcPEgiCpmMNpAnjhiTYDXxXC6/shVDvagkjBW
	fy/NAan3fwqmPpT/bIcg0LGgjAz8qsG4ONwlpZmr6HGA7h5u1h08hmENy8I0Gignl+I4Ux3
	p2UGRyFu5cyodIbpYjU5tVVPRuGOtVWWkfS+Nflajctd+MK9ocR9gOeUuVuC5UeDO05fbek
	qt1dAUdMOCU8NpEpyU9Paw0Klr8xpDZ4CJYj+GAO4+0QmQw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi all,

Thanks for the review. All three of you are right, and v1 was wrong.

On Sun Nov 1, 2026 at 12:34 AM CST, Gyeyoung Baek wrote:
> Hi Baihui, Troy,
>
>
> On Fri, Oct 30, 2026 at 10:55=E2=80=AFAM Troy Mitchell <troy@kernel.org> =
wrote:
> >
> > Hi Baihui,
> >
> > On Thu Oct 29, 2026 at 4:38 PM +0800, Baihui Liang wrote:
> > > Returning -EBUSY from ->runtime_idle() prevents the PM core from
> > > retrying the idle check. Schedule an autosuspend so the idle state
> > > can be re-evaluated once the firmware reaches ROGUE_FWIF_POW_IDLE.
> > >
> > > Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> > > ---
> > > Tested on SpacemiT K3 (PowerVR Rogue BXM-4-64) by running vulkaninfo
> > > repeatedly. Without this change the device intermittently stayed
> > > runtime-active after the last user went away, because the firmware ha=
d
> > > not yet reached ROGUE_FWIF_POW_IDLE when the idle check ran. With the
> > > change the device reliably suspends.
> > > ---
> > >  drivers/gpu/drm/imagination/pvr_power.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/dr=
m/imagination/pvr_power.c
> > > index eb4b6ecdf4f..6f38249ffcb 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_power.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_power.c
> > > @@ -434,7 +434,16 @@ pvr_power_device_idle(struct device *dev)
> > >       struct drm_device *drm_dev =3D platform_get_drvdata(plat_dev);
> > >       struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
> > >
> > > -     return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
> > > +     if (pvr_power_is_idle(pvr_dev))
> > > +             return 0;
> > > +
> > > +     /*
> > > +      * Firmware not yet idle; reject but schedule autosuspend so
> > > +      * runtime_idle() can be retried.
> > > +      */
> > > +     pm_runtime_autosuspend(dev);
> >
> > If I read the PM core correctly, when this autosuspend timer fires it
> > calls ->runtime_suspend() directly rather than retrying
> > ->runtime_idle(), so this looks equivalent to returning 0.=20

That's right. It merely delays unconditional FW teardown without
re-checking idle state. I'll send v2 with a different approach.

> > Could the
> > real issue be the pm_runtime_put() in pvr_watchdog_worker(), which
> > perhaps should be pm_runtime_put_autosuspend()?

That put is only reached when pm_runtime_get_if_in_use() actually
returned a reference. Our stuck-active case was the opposite case: the
device was active with a zero usage count, which jumps directly to
out_requeue and skips pm_runtime_put entirely. Changing this call
won't help.

> I think sashiko's point is valid.
>
> Calling pm_runtime_autosuspend() from pvr_power_device_idle() when the
> FW is busy only adds a delay, and the device is then suspended without
> re-checking idle, and this is effectively the same as
> returning 0. I guess it worked in testing because the FW was busy at
> pvr_power_device_idle() time but reached idle before the autosuspend
> delay expired.
>
> How about moving the pvr_power_is_idle() check into
> pvr_power_device_suspend() (and dropping pvr_power_device_idle()), and
> returning -EBUSY after pm_runtime_mark_last_busy() if the FW is busy?
> The PM core then reschedules the autosuspend regardless of whether the
> last put comes from the watchdog or elsewhere, so suspend is retried
> until the FW becomes idle.

Agreed, v2 will follow this approach.

> I think this is the pattern described in
> Documentation/power/runtime_pm.rst, section 9 ("If the
> ->runtime_suspend() callback returns -EAGAIN or -EBUSY ...").
> --
> Thanks,
> Gyeyoung

Thanks,
Baihui

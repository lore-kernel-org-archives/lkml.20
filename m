Received: from mta0.migadu.com (out-116.mta0.migadu.com [91.218.175.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687A3546C1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582054; cv=none; b=Yy4QdUqwE8H+iEBmfnptauQqyQRzFtj+Dnz41WoNI8vfqHKqBIk6xbOnlAVOhL2kORTNz/TBRnT/8rlgQc9wYESTC6/S+9FAfwqPWg94mADT6s7Paca9HSqF3ap6lrmJIS5v7RKwn2gocT/W67CX9Hmcc1TMDC4ITocrFVwPV0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582054; c=relaxed/simple;
	bh=YPSRlgdGLBWI7xYZ3+zmloVtjuS+CrLqrr2jRlpVAMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcDTohiIYXxhFHzLkwNc6haaZVnkRYm8/QijwlmyDzHZK2pPmA5/ynulvxMBeGwqVrBtKGGxzLoH3DcUMrFKTMisy0yLv4hgXKU7NgPwdVTiaWVrJX1asSo76JbgU42tjEVCnrCRUMW8naYZRw0pNDY9oWFM4fxGnXuGkV3QDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AkiZqcVz; arc=none smtp.client-ip=91.218.175.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AkiZqcVz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YPSRlgdGLBWI7xYZ3+zmloVtjuS+CrLqrr2jRlpVAMA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790582050; v=1; x=1791186850;
 b=AkiZqcVzGB3tvcHd+odi9h1RcPsZzgPwfQ8T0SsWUEjWXJeSybg3YItQMPaBiWYvjLiHxceW
 /Mhs6IIwC36QOcD4NaYPlNODXBFzKGL/g9SD4SPPABUTkbfxn4b8gSbGinTKDQzmUIKVYr/TMR+
 jTG8thJ0L1NKa1UtYWifZBmw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a32e607d171bb71;
	Mon, 28 Sep 2026 07:54:10 +0000
X-Mizu-Trace-ID: 9a32e607d171bb71
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 09:54:08 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] media: i2c: ov9282: update flash_duration range
 even when powered down
Message-ID: <aroc9bgzdPns60fG@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-4-f520af59df1b@linux.dev>
 <CAPY8ntAyYq_54Yvo1uC=LBepmqLma8mz_rYTmsm62LzHkixX7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAyYq_54Yvo1uC=LBepmqLma8mz_rYTmsm62LzHkixX7A@mail.gmail.com>

Hi Dave,
thanks for your feedback!

On Thu, Sep 17, 2026 at 11:38:22AM +0100, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > The flash_duration range update sat inside ov9282_update_exp_gain(), which
> > ov9282_set_ctrl() only reaches after the pm_runtime_get_if_in_use() early
> > return. So with the sensor idle the ceiling kept whatever value it had
> > when it last streamed. Therefore setting exposure before flash_duration
> > while the sensor is powered down may clamp flash_duration against an
> > outdated exposure.
> >
> > Fix this by moving the range update before the power check.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 90a0fe542ce4a..4c88de1965171 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -645,6 +645,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 if (ret)
> >                         return ret;
> >                 break;
> > +       case V4L2_CID_EXPOSURE:
> > +               /*
> > +                * Ensure the flash duration range is also updated on powered
> > +                * down sensors.
> > +                */
> > +               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> > +                                              ov9282_exposure_to_us(ov9282,
> > +                                                                    ctrl->val),
> > +                                              1,
> > +                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +               if (ret)
> > +                       return ret;
> > +               break;
> 
> This hasn't removed the __v4l2_ctrl_modify_range call from
> ov9282_update_exp_gain(), so the range gets updated twice if the
> sensor is powered on.

I will take a look at it and adapt it for v2 accordingly.

regards;rl

> 
>   Dave
> 
> >         }
> >
> >         /* Set controls only if sensor is in power on state */
> >
> > --
> > 2.53.0
> >
> >

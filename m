Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E74D9565
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606393; cv=none; b=uMFFUaL1v0wIsooxml3fOYqmERHDMrG31AJX+5QpCO2SV8cfTturblQY8VsOUI3iiWll6UiVdVrpuRsKZJSVFB4JiZF+SZk8wYds+hkBl75nLu/I3sAdcODk9Zqu4dt6KMwOUOfP/rSpkEy2Bv4xdhONgy/F+7GYxqAnP6iz8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606393; c=relaxed/simple;
	bh=vsJoLw3liF0VvtO4oyMxsqzwveZcsfmhBHB3j0jOmrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNjCgEABE/AVgMge7KYWTLmDmPu8HK/BlQbsFw1y2wG3PGox9feQhaLlwBVCqdMZVj/Xoz8F/ml1XAEkif4ouJIfrN0h9OYhBHylQadIBCfl24dFiCSxJflFnrQW/u2NPRdFnEpRb8xAig79mirziOPzdQU872D4nwtLoTSJEcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G2y4fPE6; arc=none smtp.client-ip=91.218.175.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G2y4fPE6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vsJoLw3liF0VvtO4oyMxsqzwveZcsfmhBHB3j0jOmrI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790606374; v=1; x=1791211174;
 b=G2y4fPE6GDs09jOD3+ZXJRrMHqz06/Ph4nhvPoYnSw++On0H7NK1q9Gd0qwT0r7riMwKTxCF
 siaEy1TqPZDPko2XFrgjyKBeMl0sU4iilRrVnfwSI9JE/RguigBV0az7hhf4X41ykv3UZtDZxhO
 HqB47vMbLLpUfjiq6D75r5jQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2e8acd8450d3c992;
	Mon, 28 Sep 2026 14:39:24 +0000
X-Mizu-Trace-ID: 2e8acd8450d3c992
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 16:39:20 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] media: i2c: ov9282: add refresh of missing ranges
 on a mode change
Message-ID: <arp7GM4KZZZF6zN2@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-5-f520af59df1b@linux.dev>
 <CAPY8ntB6hoUMCr7v6E5soWzh+CDuSsdy_bJPStxk=b8mfEzN5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB6hoUMCr7v6E5soWzh+CDuSsdy_bJPStxk=b8mfEzN5w@mail.gmail.com>

On Mon, Sep 28, 2026 at 02:15:05PM +0100, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > ov9282_update_controls() updates the pixel rate, hblank and vblank, but
> > currently misses the exposure range and flash_duration. Both are dependent
> > on the line time and therefore the pixel format.
> 
> The exposure control is dependent on vblank / frame height, not the line time.

Sure. You're right. Thanks for the catch!

> 
> > Refresh both, and commit cur_mode and code in ov9282_set_pad_format()
> > before the call so the refresh and any nested s_ctrl see the incoming
> > format.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 34 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 4c88de1965171..e64d8343c18e9 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -557,6 +557,8 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >  {
> >         u32 hblank_min;
> >         s64 pixel_rate;
> > +       u32 exposure_us;
> > +       u32 lpfr;
> >         int ret;
> >
> >         ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> > @@ -577,8 +579,22 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >         if (ret)
> >                 return ret;
> >
> > -       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> > -                                       mode->vblank_max, 1, mode->vblank);
> > +       ret = __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> > +                                      mode->vblank_max, 1, mode->vblank);
> > +       if (ret)
> > +               return ret;
> > +
> > +       lpfr = ov9282->vblank_ctrl->val + mode->height;
> > +       ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl, OV9282_EXPOSURE_MIN,
> > +                                      lpfr - OV9282_EXPOSURE_OFFSET,
> > +                                      OV9282_EXPOSURE_STEP,
> > +                                      OV9282_EXPOSURE_DEFAULT);
> 
> I would have expected that this should be handled by the first clause
> in ov9282_set_ctrl where if vblank is changed it updates exp_ctrl.
> That's how many drivers handle it.
> 
> Looking closer they tend to set an explicit vblank on mode change
> though, and it is that which triggers the set_ctrl.
> There has been previous debate as to whether changing mode should
> reset blanking to give a defined frame rate. Memory says that Sakari
> was in favour of doing that, but I can't find the thread.
> Sashiko also flagged on a previous patchset of mine that if the
> previous mode happened to have had vblank adjusted to be the same as
> the new default value that the new mode selects, then the control
> handler framework won't call set_ctrl(VBLANK), and so the exposure
> range (depending on mode height and VBLANK) won't get updated.

Thanks for the explanation!

If resetting vblank and hblank on a mode change is the "preferred" or
"usual" implementation, then I'm of course fine with that. Either in
this series or in a future one ;-)

> 
> All a little messy, so I can be persuaded that there are enough holes
> in the current driver that the easiest solution is just to update the
> control ranges here if you say that set_ctrl(VBLANK) doesn't get
> called in this case.

Regarding the vblank set_ctrl on mode change: I will do another testing
round and either add a comment on the behaviour or remove that
modify_range call.

thanks!

regards;rl

> 
>  Dave
> 
> > +       if (ret)
> > +               return ret;
> > +
> > +       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> > +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> >  }
> >
> >  /**
> > @@ -855,10 +871,23 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
> >                 framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> >                 *framefmt = fmt->format;
> >         } else {
> > +               const struct ov9282_mode *old_mode = ov9282->cur_mode;
> > +               u32 old_code = ov9282->code;
> > +
> > +               /*
> > +                * Commit before refreshing the ranges. ov9282_update_controls()
> > +                * and the nested ov9282_set_ctrl() calls it triggers derive the
> > +                * frame length and the line time from cur_mode and code, so
> > +                * they have to describe the incoming format, not the outgoing
> > +                * one.
> > +                */
> > +               ov9282->cur_mode = mode;
> > +               ov9282->code = code;
> > +
> >                 ret = ov9282_update_controls(ov9282, mode, fmt);
> > -               if (!ret) {
> > -                       ov9282->cur_mode = mode;
> > -                       ov9282->code = code;
> > +               if (ret) {
> > +                       ov9282->cur_mode = old_mode;
> > +                       ov9282->code = old_code;
> >                 }
> >         }
> >
> >
> > --
> > 2.53.0
> >
> >

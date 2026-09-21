Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB736EA8B;
	Mon, 21 Sep 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985883; cv=none; b=VFyK3CkS3VVrwPxy4LtiL3/viKkjSy28Ng/6stDa0kZ5D8qW9mc495dv+Wc7BxIqB2AIRqSbknhnOOTr0rasLekVm4Dpvc/GEMymxFh0PLH0y/ZHmlYYpaSJiAjGMaYNFIynauqavOpCEpP2HhcFFCB2/TzaJnjLI7Ejfy1Jbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985883; c=relaxed/simple;
	bh=fHZY4IStNtbOlkeH/lkkLYxztDxxeJfIuR7oEBMyTlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOT3O3QEA1kRD+GsaSD8tMxYuWCpChK384jomVWlamF2XsPG2qNQYLPh27bWtXqdSdrC/PViKZCiZUObNIYLqb4WSspp8b9fN6vUgltHnnX1t1EXLoW0QPxXSs5didup0bKfaAn8/flwCXot47b1wvzUOarDKEoadch3/RY43A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itfiH9Lr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itfiH9Lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789985881; x=1821521881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fHZY4IStNtbOlkeH/lkkLYxztDxxeJfIuR7oEBMyTlg=;
  b=itfiH9LruxTXwSRa1mIC8BcTF5qnPzKTY/woTM1XD+TftSD6KcvmZnD2
   trOH0dUcrEraC2hABttddrdol+236TkX6+Um6ufTaMmavy9dTbkkaI73/
   vadHy3EZKgM50E9bZMN2VHxSGrWAk8RhInjYSrb8IqtGyL9DA5tUizNw1
   Af839taV6m1QsgA8cXJJ10MJXuDnz4vt9RE1/5VEwzaShhB5infxlvrys
   lj9lHIm+EK0deimPWS/CGJJIEW1FoE3QJGLSyx0HM6cg1FSjWqyzie1T6
   NB17ImGxmtu3vrgrJFqc869ysomIw+GBZtyxNTFek7ehKIMEY3JzGkE1e
   A==;
X-CSE-ConnectionGUID: IqhpRM3bTka8YD9x7iyr5Q==
X-CSE-MsgGUID: ctaDzZmHRcSxf/tB1IYivg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101080822"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101080822"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 03:18:00 -0700
X-CSE-ConnectionGUID: aMPcDpcFSJebozUmrpzOMA==
X-CSE-MsgGUID: HXBtIuivROOVAS0ZmCsMsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3627293"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 03:17:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06E9E120370;
	Mon, 21 Sep 2026 13:17:55 +0300 (EEST)
Date: Mon, 21 Sep 2026 13:17:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: hi846: Fix link frequency handling
Message-ID: <arEEUjn0wiWpJjc4@kekkonen.localdomain>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-3-mitltlatltl@gmail.com>
 <apfrV9FZ1UN8RW55@kekkonen.localdomain>
 <CAH2e8h6eYmych9ESURozoNmn5Xg9SWcUUCo681NBz0FY9LB92w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h6eYmych9ESURozoNmn5Xg9SWcUUCo681NBz0FY9LB92w@mail.gmail.com>

Hi Pengyu,

On Sun, Sep 06, 2026 at 12:56:27PM +0800, Pengyu Luo wrote:
> On Wed, Sep 2, 2026 at 5:24 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Pengyu,
> >
> > Thanks for the update.
> >
> 
> I am glad to see your review too!
> 
> > On Mon, Aug 31, 2026 at 12:00:22AM +0800, Pengyu Luo wrote:
> > > Link frequency is tied to PLL configuration, lane count, and external
> > > and configurable clock, so use runtime here instead of hardcoding for
> > > specific configuration. To implement this, we do
> > >
> > > 1. Drop fixed link freqs, we calculate the driver supported values and
> > > use v4l2_link_freq_to_bitmap() to get the intersection with the DT
> > > supported values.
> > >
> > > 2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
> > > mclk clock, lane count to calculate link frequency.
> > >
> > > 3. Drop mclk clock rate check.
> > >
> > > Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > > v6:
> > > - Add link freq ctrl back (Sakari)
> > > - Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
> > > - Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
> > > v5:
> > > - Use separated fields instead of raw register values for PLL cfg (Sakari)
> > > - Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
> > > - Drop line break (Sakari)
> > > ---
> > >  drivers/media/i2c/hi846.c | 151 ++++++++++++++++++++++++--------------
> > >  1 file changed, 94 insertions(+), 57 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> > > index 7f069aca0fce..2f8624f9bdf3 100644
> > > --- a/drivers/media/i2c/hi846.c
> > > +++ b/drivers/media/i2c/hi846.c
> > > @@ -1,7 +1,7 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >  // Copyright (c) 2021 Purism SPC
> > >
> > > -#include <linux/unaligned.h>
> > > +#include <linux/bitfield.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/gpio/consumer.h>
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/pm.h>
> > >  #include <linux/property.h>
> > >  #include <linux/regulator/consumer.h>
> > > +#include <linux/unaligned.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-fwnode.h>
> > > @@ -219,8 +220,8 @@ struct hi846_mode {
> > >       /* Horizontal timing size */
> > >       u32 llp;
> > >
> > > -     /* Link frequency needed for this resolution */
> > > -     u8 link_freq_index;
> > > +     u8 mipi_clk_div_2lane;
> > > +     u8 mipi_clk_div_4lane;
> > >
> > >       u16 fps;
> > >
> > > @@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
> > >       "Resolution Pattern",
> > >  };
> > >
> > > -#define FREQ_INDEX_640       0
> > > -#define FREQ_INDEX_1280      1
> > > -static const s64 hi846_link_freqs[] = {
> > > -     [FREQ_INDEX_640] = 80000000,
> > > -     [FREQ_INDEX_1280] = 200000000,
> > > -};
> > > -
> > >  static const struct hi846_reg_list hi846_init_regs_list_2lane = {
> > >       .num_of_regs = ARRAY_SIZE(hi846_init_2lane),
> > >       .regs = hi846_init_2lane,
> > > @@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[] = {
> > >       {
> > >               .width = 640,
> > >               .height = 480,
> > > -             .link_freq_index = FREQ_INDEX_640,
> > > +             .mipi_clk_div_2lane = 4,
> > > +             /*
> > > +              * Dummy but necessary if we set this mode default, otherwise
> > > +              * hi846_calc_pixel_rate() will be broken in
> > > +              * hi846_init_controls()
> > > +              */
> > > +             .mipi_clk_div_4lane = 8,
> >
> > The divider of the 4-lane case appears to be always two times that of the
> > 2-lane case. Could you calculate the value instead?
> >
> 
> Ack
> 
> > I think it'd be better to keep the link frequencies and modes at separate
> > indices; this is the way it used to be, too.
> >
> 
> You mean add an array for the divider ratios then use the indices in
> modes like before?
> 
> > >               .fps = 120,
> > >               .frame_len = 631,
> > >               .llp = HI846_LINE_LENGTH,
> > > @@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] = {
> > >       {
> > >               .width = 1280,
> > >               .height = 720,
> > > -             .link_freq_index = FREQ_INDEX_1280,
> > > +             .mipi_clk_div_2lane = 2,
> > > +             .mipi_clk_div_4lane = 4,
> > >               .fps = 90,
> > >               .frame_len = 842,
> > >               .llp = HI846_LINE_LENGTH,
> > > @@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] = {
> > >       {
> > >               .width = 1632,
> > >               .height = 1224,
> > > -             .link_freq_index = FREQ_INDEX_1280,
> > > +             .mipi_clk_div_2lane = 2,
> > > +             .mipi_clk_div_4lane = 4,
> > >               .fps = 30,
> > >               .frame_len = 2526,
> > >               .llp = HI846_LINE_LENGTH,
> > > @@ -1167,6 +1169,9 @@ struct hi846 {
> > >       struct v4l2_ctrl *hblank;
> > >       struct v4l2_ctrl *exposure;
> > >
> > > +     s64 link_freqs[ARRAY_SIZE(supported_modes)];
> > > +     int num_link_freqs;
> > > +
> > >       struct mutex mutex; /* protect cur_mode, streaming and chip access */
> > >       const struct hi846_mode *cur_mode;
> > >       bool streaming;
> > > @@ -1192,21 +1197,41 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
> > >       return NULL;
> > >  }
> > >
> > > -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> > > +static u64
> > > +hi846_get_link_freq(const struct hi846 *hi846, const struct hi846_mode *mode)
> > >  {
> > > -     return hi846->cur_mode->link_freq_index;
> > > +     u64 mclk = clk_get_rate(hi846->clock);
> > > +     u8 mipi_clk_div;
> > > +
> > > +     if (hi846->nr_lanes == 2)
> > > +             mipi_clk_div = mode->mipi_clk_div_2lane;
> > > +     else
> > > +             mipi_clk_div = mode->mipi_clk_div_4lane;
> > > +
> > > +     /*
> > > +      * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
> > > +      * [11:8]: 0x02 => pre_div = 3
> > > +      * [7:0]: 0x5a => multiplier = 90
> > > +      */

It seems it'd be also fairly easy to write a PLL calculator for this. Or
just use the CCS PLL calculator?

> > > +     return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
> > >  }
> > >
> > > -static u64 hi846_get_link_freq(struct hi846 *hi846)
> > > +static int hi846_get_link_freq_index(const struct hi846 *hi846,
> > > +                                  const struct hi846_mode *mode)
> > >  {
> > > -     u8 index = hi846_get_link_freq_index(hi846);
> > > +     u64 link_freq = hi846_get_link_freq(hi846, mode);
> > > +     int i;
> > > +
> > > +     for (i = 0; i < hi846->num_link_freqs; i++)
> > > +             if (hi846->link_freqs[i] == link_freq)
> > > +                     return i;
> > >
> > > -     return hi846_link_freqs[index];
> > > +     return -EINVAL;
> > >  }
> > >
> > >  static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
> > >  {
> > > -     u64 link_freq = hi846_get_link_freq(hi846);
> > > +     u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
> > >       u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
> > >
> > >       do_div(pixel_rate, HI846_RGB_DEPTH);
> > > @@ -1429,8 +1454,8 @@ static int hi846_init_controls(struct hi846 *hi846)
> > >       hi846->link_freq =
> > >               v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> > >                                      V4L2_CID_LINK_FREQ,
> > > -                                    ARRAY_SIZE(hi846_link_freqs) - 1,
> > > -                                    0, hi846_link_freqs);
> > > +                                    hi846->num_link_freqs - 1,
> > > +                                    0, hi846->link_freqs);
> > >       if (hi846->link_freq)
> > >               hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > > @@ -1503,10 +1528,9 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
> > >       u64 frame_length;
> > >       int ret = 0;
> > >       int dummy_lines;
> > > -     u64 link_freq = hi846_get_link_freq(hi846);
> > > +     u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
> > >
> > > -     dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> > > -             hi846_get_link_freq(hi846));
> > > +     dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_freq);
> > >
> > >       do_div(link_freq, fps);
> > >       frame_length = link_freq;
> > > @@ -1699,6 +1723,7 @@ static int hi846_set_format(struct v4l2_subdev *sd,
> > >       const struct hi846_datafmt *fmt = hi846_find_datafmt(mf->code);
> > >       u32 tgt_fps;
> > >       s32 vblank_def, h_blank;
> > > +     int idx;
> > >
> > >       if (!fmt) {
> > >               mf->code = hi846_colour_fmts[0].code;
> > > @@ -1749,7 +1774,14 @@ static int hi846_set_format(struct v4l2_subdev *sd,
> > >       mf->code = HI846_MEDIA_BUS_FORMAT;
> > >       mf->field = V4L2_FIELD_NONE;
> > >
> > > -     __v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
> > > +     idx = hi846_get_link_freq_index(hi846, hi846->cur_mode);
> > > +     if (idx < 0) {
> > > +             dev_err(&client->dev,
> > > +                     "failed to get link freq index: %d\n", idx);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     __v4l2_ctrl_s_ctrl(hi846->link_freq, idx);
> > >       __v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
> > >                                hi846_calc_pixel_rate(hi846));
> > >
> > > @@ -1947,20 +1979,33 @@ static int hi846_identify_module(struct hi846 *hi846)
> > >       return 0;
> > >  }
> > >
> > > -static s64 hi846_check_link_freqs(struct hi846 *hi846,
> > > -                               struct v4l2_fwnode_endpoint *ep)
> > > +static int hi846_add_link_freqs(struct hi846 *hi846, struct device *dev,
> > > +                             struct v4l2_fwnode_endpoint *ep)
> > >  {
> > > -     const s64 *freqs = hi846_link_freqs;
> > > -     int freqs_count = ARRAY_SIZE(hi846_link_freqs);
> > > -     int i, j;
> > > -
> > > -     for (i = 0; i < freqs_count; i++) {
> > > -             for (j = 0; j < ep->nr_of_link_frequencies; j++)
> > > -                     if (freqs[i] == ep->link_frequencies[j])
> > > -                             break;
> > > -             if (j == ep->nr_of_link_frequencies)
> > > -                     return freqs[i];
> > > -     }
> > > +     s64 hi846_link_freqs[ARRAY_SIZE(supported_modes)];
> > > +     unsigned long freq_bitmap;
> > > +     int ret, i;
> > > +
> > > +     /*
> > > +      * Since the MCLK freq varies between platforms, calculating driver
> > > +      * supported link freqs here.
> > > +      */
> > > +     for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
> > > +             hi846_link_freqs[i] = hi846_get_link_freq(hi846, &supported_modes[i]);
> > > +
> > > +     ret = v4l2_link_freq_to_bitmap(dev, ep->link_frequencies,
> > > +                                    ep->nr_of_link_frequencies,
> > > +                                    hi846_link_freqs,
> > > +                                    ARRAY_SIZE(hi846_link_freqs),
> > > +                                    &freq_bitmap);
> > > +     if (ret || !freq_bitmap)
> > > +             return ret;
> > > +
> > > +     for (i = 0; i < ARRAY_SIZE(hi846_link_freqs); i++)
> >
> > Could you use the hi846_link_freqs array as-is for the control?
> >
> 
> Could you please tell me if an array with repeat numbers is acceptable
> for v4l2_ctrl_new_int_menu(), if so, keep it as-is is more convenient
> later.

No, the link frequency determines the rest rather than the other way
around. So the values need to be unique.

> 
> > The selectable modes are expected to depend on the chose link frequency,
> > which is not affected by setting the format, for instance. I wonder if it'd
> > be useful to squash the next patch into this one.
> >
> 
> Yes, it seems so, we need to get the index of link freq to set
> control, so we can filter the mode by the index, and this lets us drop
> previous checks.

Sounds good to me.

-- 
Kind regards,

Sakari Ailus

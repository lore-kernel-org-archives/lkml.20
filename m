Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C085046D2DD;
	Mon, 28 Sep 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583227; cv=none; b=PRhgHGsFxq+WFfYWII6FqnFReRwz+ZF07Z9LcArA9LVPF40OI17SC0CdwjcwML3xG9lmSkuapw3RsF8c7tb4uquwi3bSWYum5SEehyh2M2SphAliZzwwNDmm4hSNaUbnLJgfNymFh9OpE/683+ZNliKLZICqYNcfOUa4FAMwGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583227; c=relaxed/simple;
	bh=N3ELgZ74CcL/wgZ7q7mm3p+yfVZMx5oVp9lE4oTHyWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7p/u0O/w9MsbGvx+GCtcpEXktFSVhTqYLIYAMnYTkCOYWGFI5+pOwpmYq4GdtJIi9CTfGamS82Cm0Hm95KjxQdwNHWIbWphnJSdVADF/fAqDJDUrzNS5hH3PZa8+3NpGIujfT2/PgNHo+UAL7gYBeG44YuAmwz9OOECMy6Dsk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4CT6Nt/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4CT6Nt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790583225; x=1822119225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3ELgZ74CcL/wgZ7q7mm3p+yfVZMx5oVp9lE4oTHyWE=;
  b=U4CT6Nt/Vd1wo/JYaoihOvQ5GNDyAjMVNBwljB95Msb6K4yjmYmN4ugQ
   bxc/aIA9t+yDJw13zeO+SG5brZftga5t57OpwsAfS/SFUVadb3hsk48Gr
   bvZvJWYj8C52dbm0C+nw7GAl5K3+jSnRXlCTd80NwWwsu9HW4F2oaDebn
   y1ZUmsmZ+j2lnnqkloB7m8YFXtOoDDgj4Rnxam+XeT37plp6C2uI5ZArv
   r2crUtUaaYCE1IQ1Bk8zcrhQVUbd8IGtqnBpbYMpgyhYDPuudUP86Bvmn
   x5tO1GFSuxpyE6zUFFvAJLyVO+3hIP0gAUpFspqmpaZ1aZEwV/yYwIugh
   Q==;
X-CSE-ConnectionGUID: WWWNMIynS+aMEKSsLIQCGw==
X-CSE-MsgGUID: hYte9bdLQeCjThMJ2hjQSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100607382"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="100607382"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:13:45 -0700
X-CSE-ConnectionGUID: Q4z6T0gRSYeYAiesbKnxmg==
X-CSE-MsgGUID: s7o6hNIdSi+qtl7LdBT+iQ==
X-ExtLoop1: 1
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:13:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9FA8F121BA9;
	Mon, 28 Sep 2026 11:13:43 +0300 (EEST)
Date: Mon, 28 Sep 2026 11:13:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: ov13858: add horizontal and vertical flip
 controls
Message-ID: <aroht8klOruSDBJH@kekkonen.localdomain>
References: <20260926080242.93628-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926080242.93628-1-lsa.uz@pm.me>

Hi Sergey,

On Sat, Sep 26, 2026 at 08:02:48AM +0000, Sergey Lebedev wrote:
> The driver programs OV13858_REG_FORMAT1 (0x3820) from its mode tables and
> never exposes the readout direction, so a module mounted rotated cannot be
> corrected.
> 
> The Microsoft Surface Pro 11 for Business (Intel) mounts this sensor upside
> down, and ipu-bridge now says so - commit b238116ccd4b ("media: ipu-bridge:
> Add upside-down quirk for Surface Pro 11"). libcamera reads that rotation
> and tries to compensate with sensor flips, finds neither control, and falls
> back to Rot0, so with the quirk alone the picture stays upside down in any
> application that does not rotate it itself.
> 
> In 0x3820, BIT(4) set flips vertically and BIT(3) cleared mirrors - the
> mirror is active low, which is ordinary for the family. There is no public
> datasheet, so the bits were found by experiment: every bit of 0x3820
> through 0x3823 written singly mid-stream, and exactly two move the image.
> Two existing drivers agree. Intel's out-of-tree ov13858 declares 0x3820 as
> a bitfield with "hflip: 0 enable, 1 disable" at BIT(3) and "vflip: 0
> disable, 1 enable" at BIT(4), and writes !ctrl->val for the mirror;
> ov13b10 clears BIT(3) and sets BIT(4) of the same register in tree.
> 
> Both controls were checked by eye, one static scene in all four states:
> unflipped the image is upside down, vflip alone stands it up, hflip alone
> mirrors it, and the two together give the view this machine needs. The
> Bayer order at the output is the same in all four, so unlike imx219 and
> imx258, whose flips select a different media bus code, these controls do
> not need V4L2_CTRL_FLAG_MODIFY_LAYOUT.
> 
> Every mode table already sets the mirror bit, so the defaults write back
> what the mode list just wrote. __v4l2_ctrl_handler_setup() runs after that
> list and before MODE_SELECT, so the read-modify-write here sees the value
> the mode just programmed.
> 
> The two are clustered, so a combined S_EXT_CTRLS costs one register
> read-modify-write rather than two, and grabbed while streaming: nothing
> here documents a mid-stream flip as safe, and imx290 and imx219 grab
> theirs because on those parts it is not.
> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>

Is Documentation/process/coding-assistants.rst relevant for the patch?

Please clean up the above commit message.

> ---
> v3, commit message only:
> 
>  - Cites b238116ccd4b in the "commit <sha> (...)" form checkpatch asks
>    for; the Media CI flagged v2 for it.
>  - v2 said the quirk on its own "names a rotation nothing can undo".
>    Snapshot and Firefox do undo it - they rotate the picture themselves -
>    and qcam, which does not, shows it upside down. The sentence now says
>    that.
>  - Tested-by from German Pablo Lindo, on a second Surface Pro 11: qcam
>    upright with this patch, Snapshot and Firefox unchanged.
> 
> The code is v2's, byte for byte. Sakari's set_selection() point is
> answered in v2's notes, and nothing here changes it.
> 
> v2: https://lore.kernel.org/all/20260921124444.79396-1-lsa.uz@pm.me/
> v1: https://lore.kernel.org/all/20260921082609.30830-1-lsa.uz@pm.me/
> 
>  drivers/media/i2c/ov13858.c | 52 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
> index de2b79a9a0e..d870d2edb4f 100644
> --- a/drivers/media/i2c/ov13858.c
> +++ b/drivers/media/i2c/ov13858.c
> @@ -76,6 +76,14 @@
>  #define OV13858_DGTL_GAIN_DEFAULT	1024	/* Default gain = 1 X */
>  #define OV13858_DGTL_GAIN_STEP		1	/* Each step = 1/1024 */
>  
> +/*
> + * Readout direction. The mirror bit is active low, and the value every mode
> + * table programs already has it set.
> + */

This only applies to horizontal flipping.

> +#define OV13858_REG_FORMAT1		0x3820
> +#define OV13858_FORMAT1_VFLIP		BIT(4)
> +#define OV13858_FORMAT1_HFLIP_N		BIT(3)
> +
>  /* Test Pattern Control */
>  #define OV13858_REG_TEST_PATTERN	0x4503
>  #define OV13858_TEST_PATTERN_ENABLE	BIT(7)
> @@ -1042,6 +1050,8 @@ struct ov13858 {
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *vflip;
>  
>  	/* Current mode */
>  	const struct ov13858_mode *cur_mode;
> @@ -1208,6 +1218,31 @@ static int ov13858_enable_test_pattern(struct ov13858 *ov13858, u32 pattern)
>  				 OV13858_REG_VALUE_08BIT, val);
>  }
>  
> +static int ov13858_update_flips(struct ov13858 *ov13858)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = ov13858_read_reg(ov13858, OV13858_REG_FORMAT1,
> +			       OV13858_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (ov13858->vflip->val)
> +		val |= OV13858_FORMAT1_VFLIP;
> +	else
> +		val &= ~OV13858_FORMAT1_VFLIP;
> +
> +	/* The mirror bit is active low, as it is on ov13b10. */
> +	if (ov13858->hflip->val)
> +		val &= ~OV13858_FORMAT1_HFLIP_N;
> +	else
> +		val |= OV13858_FORMAT1_HFLIP_N;
> +
> +	return ov13858_write_reg(ov13858, OV13858_REG_FORMAT1,
> +				 OV13858_REG_VALUE_08BIT, val);
> +}
> +
>  static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov13858 *ov13858 = container_of(ctrl->handler,
> @@ -1254,6 +1289,10 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
>  					ov13858->cur_mode->height
>  					  + ctrl->val);
>  		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret = ov13858_update_flips(ov13858);
> +		break;
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = ov13858_enable_test_pattern(ov13858, ctrl->val);
>  		break;
> @@ -1481,6 +1520,13 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_put(ov13858->dev);
>  	}
>  
> +	/*
> +	 * Do not let the flips change while streaming. ov13858->mutex is the
> +	 * control handler's own lock and is held here, hence the __ form.
> +	 */
> +	__v4l2_ctrl_grab(ov13858->hflip, enable);
> +	__v4l2_ctrl_grab(ov13858->vflip, enable);
> +
>  	mutex_unlock(&ov13858->mutex);
>  
>  	return ret;
> @@ -1619,6 +1665,12 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
>  			  OV13858_DGTL_GAIN_MIN, OV13858_DGTL_GAIN_MAX,
>  			  OV13858_DGTL_GAIN_STEP, OV13858_DGTL_GAIN_DEFAULT);
>  
> +	ov13858->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
> +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	ov13858->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
> +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_cluster(2, &ov13858->hflip);
> +
>  	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov13858_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
>  				     ARRAY_SIZE(ov13858_test_pattern_menu) - 1,

-- 
Regards,

Sakari Ailus

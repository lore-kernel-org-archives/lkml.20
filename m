Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027660;
	b=Glx8TkzYw4movp3zDDcRSJ2mlrZW36u91DlqwzxUvrD2hSaTnPeadj/csEUQSA8jMHkd
	 BvxZE3v0w+EnbpTdg8WovcgnpxnvXzR/6/S373M5dAGhjFIgZ4crNlbyP68smnyGgDQ8O
	 3n3ScTObs/gwbyPDIarpJaeHBc826Pfl2cPBBIxmFsoFatYHwd+Go33nPSM5EJaburDhT
	 Wp83CY1u6V7r6VO205Ej2sWobYVAiTdXBLvNz01Qcp5DHBKBy5/HNMwuXjXyGCIu/boj3
	 mOXvHZ77DpK1y8WABGEDvUJaWkUj2VDEu8vtNnCTm3vQSyyLyBR9qoFRBznyO+kUPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027660;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=LhlyTM3sk5sQhlLdrTfo8qwPa2beyW4Tw/tl5FfhpZA=;
	b=3Kamen6bfdqLGQAXlPhAuuHfxuf/mTFu+jJtlKr+tTRfdqhrjgmYb9BzynxmTHSZQtju
	 rZpUtS0un2w0m8HNLwWryg4kUCPZIu89ZPz0Erm4M1OH9uDIXYtU38QLjDM9slTJKY4Wf
	 lE7IT9pVlyBVEJNThSkco2+JS5YIG5ASRzQB7GZJLSfxbbCB8EvtLYQNmZFkHkhXIaHMJ
	 /J6H/CWQRVuIzjMatPUFFhtinYLgnxEJ96E37mwiNDGZhJ0GgQ5RysmRTEL1HvcoQAMIr
	 nl6kgGwlfLaTDwYaVER2KRdTe15Fx2jkJ8aAVzQaA+P4Un/WVb4gLXQztkOB+z0Hp5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="T5Uysr/1";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DFF606A31A;
	Mon, 26 Oct 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60DFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5Uysr/1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793027660; x=1824563660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eombiV1A25cmId8jc9OJAhq3HuK9q9s+MIjfLdLbkVc=;
  b=T5Uysr/18KnyGxpIAp/u89kD3Q2dtfongzP1Yba0Mpfi9HNFFSNIkPXn
   8SCPJsSxNHLd1r90n6gP97+0nCTZBftSRAPwVH7K/kCjU4NFmxWvr8l3e
   TqaEWlFDFTg7mFT0UeEW8Ga01hE1GLRE4mVRw4KBidouqK0Z5OwnRZobv
   voEbWWSpOH9eCoK2CuYJrFEvFf1MB1uZxqb+HnodecVRT3fi6g4iF6Nv6
   8jZZAwK7K+8R+wEceDP3EmEYO9LH2l0D49usUxpunWcZ41Zwz1A336Ez0
   +uawOD9PmRBvXDblfYp4XVSIdGyZRfIt8iLvv8gg4t9HK3QomDc/5Hlsd
   w==;
X-CSE-ConnectionGUID: izoWyDGoRMGMUI2SY4u/NQ==
X-CSE-MsgGUID: QZmS3d3kRGCqgzQCK7p/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1592839"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1592839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:14:19 -0700
X-CSE-ConnectionGUID: oW1o4m0TQ028MXlFxnIIBQ==
X-CSE-MsgGUID: ZmlwHtx9RDm6u2j2fmMElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4630501"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:14:15 -0700
Date: Mon, 26 Oct 2026 17:14:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, djrscally@gmail.com,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] media: i2c: ov7251: Add strobe output enable control
Message-ID: <at9uROkXwXmNzFyh@ashevche-desk.local>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-7-antoine.pichot@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026111032.88355-7-antoine.pichot@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 08:10:31PM +0900, Antoine Pichot wrote:
> The OV7251 has a STROBE output that pulses during the exposure of
> selected frames, meant to drive an illuminator. On the Microsoft
> Surface Book 2 the front OV7251 is an infrared camera (Windows Hello)
> and its 850 nm emitter is wired to that pin: ACPI describes no separate
> LED, GPIO line or regulator for it. The mode tables leave the pad
> disabled, so the camera only sees an unlit scene.
> 
> Add a V4L2_CID_FLASH_STROBE_OE control, off by default. When enabled
> it sets the STROBE pad output enable (SC_REG5 bit 3), strobes
> alternate frames (frame pattern 0xaa instead of the default 0xa5, which
> lights four frames in eight) and sets the
> pulse length (strobe frame span, in lines) to the exposure time,
> clamped between 52 lines and 45% of the frame length, never more than
> 776 lines. When disabled it
> restores the defaults the mode tables used to write. The span follows
> exposure and vertical blanking changes while the strobe is enabled.
> 
> The limits come from the Windows driver, which clamps the span to 52
> to 776 lines: 776 lines is 45% of the 1724-line frame of the 30 fps
> mode. Expressing the upper limit as a duty cycle keeps the emitter
> within that envelope (eye safety) at 60 and 90 fps too, where a fixed
> 776 lines would let the pulse cover up to 96% of the frame (552 of 572
> lines). Keeping the 776-line limit as well bounds the pulse when
> vertical blanking stretches the frame, up to 65535 lines.
> 
> Alternate frames is what the Windows driver uses for face recognition
> on this hardware: its 30 and 60 fps modes write 0xaa, and a register
> dump taken during a Windows Hello sign-in on a Surface Book 2 shows the
> same. Lighting every frame (0xff, which two of its other modes use)
> would double the average emitter power. User space tells lit frames
> from dark ones by their brightness; V4L2 has no per-frame illumination
> flag yet.
> 
> The control is written only while the sensor is powered, and from
> __v4l2_ctrl_handler_setup() at stream start, after the mode and strobe
> register tables. Setting it while the sensor is idle does not power it
> up, and the emitter goes off with the sensor when streaming stops.
> 
> On a Surface Book 2 at analogue gain 128 the mean pixel value of the
> infrared image of a room is 19 unlit; with the strobe enabled the lit
> frames read 496 at exposure 504 (span 504) and 587 at exposure 1704
> (span 776), the dark frames in between 18 to 20.
> The span read back while streaming is 258 at 90 fps, 45% of the
> 572-line frame.

...

> +static int ov7251_set_strobe_span(struct ov7251 *ov7251)
> +{
> +	u32 span = OV7251_STROBE_FRAME_SPAN_DEF;
> +	u32 vts, max_span;
> +	u8 val[4];

> +	/*
> +	 * The pulse starts with the integration: make it cover the exposure,
> +	 * from 52 lines up to 45% of the frame and never more than 776 lines.
> +	 * The vendor driver caps it at 776 lines, 45% of the 1724 lines 30 fps
> +	 * frame; the duty cycle limit keeps the emitter within that envelope
> +	 * at higher frame rates, the absolute one with long vertical blanking.
> +	 */
> +	if (ov7251->strobe->val) {
> +		vts = ov7251->current_mode->height + ov7251->vblank->val;
> +		max_span = DIV_ROUND_UP(vts * OV7251_STROBE_MAX_DUTY_PERCENT,
> +					100);

units.h provides PERCENT constant.

		max_span = DIV_ROUND_UP(vts * OV7251_STROBE_MAX_DUTY_PERCENT,
					PERCENT);

> +		max_span = min(max_span, OV7251_STROBE_SPAN_MAX);
> +		span = clamp_t(u32, ov7251->exposure->val,
> +			       OV7251_STROBE_SPAN_MIN, max_span);

Can we avoid using _t version of clamp()?

And naturally I would first clamp over the _MAX/_MIN range (this addresses the
previous Q) and then run min() on top.

> +	}
> +
> +	put_unaligned_be32(span, val);
> +
> +	return ov7251_write_seq_regs(ov7251, OV7251_STROBE_FRAME_SPAN, val,
> +				     sizeof(val));

Can we move at some point to CCI accessors (v4l2-cci.h)?

> +}

-- 
With Best Regards,
Andy Shevchenko



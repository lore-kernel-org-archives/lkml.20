Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99F48F82F;
	Mon, 21 Sep 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988809; cv=none; b=AwI6pXfEy0b73egX9YR5xRgCfYv5VXpHwvvriCb7zcMN+16tctTrVaUF5etSTOyaxkESvQJEyaEfBuQs0gE362yaFo3jRxsZXVYgA1CadKt2df8p5awq3t6HgXRMOH8HkmBeJk1T0+a/KYO8oap84AN2yVBXzbUseZTGSqDtOhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988809; c=relaxed/simple;
	bh=4QIULEO63K1mGw6Hdn2wHigLQbtDy2PuwdlMdPjUiz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz0LWdlU3R2K4tb0jpruHG59YEEkvsCsee44YOExX2oHGF9P2xA91wnHM11bJedcu8f5LftSQW7icVEQlEHX/Nt0MPwS2eDF1/xcnxVZ1zys+zWuwaW1QFQ+te9CLW8snuKI/4i52Vz7/NQS8bw1+eMonoXQCwVr+w5S7r3NzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkNVoZm1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkNVoZm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789988802; x=1821524802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QIULEO63K1mGw6Hdn2wHigLQbtDy2PuwdlMdPjUiz4=;
  b=LkNVoZm1j2FpAY3+EidFWn/CODAGspF6jvUM6pE+SHZ6WpvCmNn7Ukrk
   AQOqQAm+g6x9cI2Qal7G16XqP7GL5eSSVJ7JPCiAGqkvx78nmDCT8GtWG
   wzvte4rIonJxSbiVgbUtIHrtkzzD6+x6BEWsB6lX+wJjKtRSPACHUSSvc
   xhrKq3ErJ7XhiEgsjU4i9uwAtv2ULZqr2Mg3iubVaqEadReYLe2KIJBmv
   3utc9mOZ77ejMA68vibykKUQ2NjGoHRYVfjDQle13r2itrYC5I4/yYCTK
   ZVoHVGJgA9d85v6XRmDbWFRvm6C2MwPITCD0wqgFuvkv6ePjxEJ+5R5XO
   w==;
X-CSE-ConnectionGUID: rpBdEzqrRJmVlIuQDi9YRA==
X-CSE-MsgGUID: //I79/0zQkGekYEAkJzWXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="107994563"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="107994563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 04:06:37 -0700
X-CSE-ConnectionGUID: J+QpXSgzRqetvGJz62064g==
X-CSE-MsgGUID: 0uPSoY8TTxOkrnfxEcKcbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="298849514"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.157])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 04:06:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 98CED120370;
	Mon, 21 Sep 2026 14:06:35 +0300 (EEST)
Date: Mon, 21 Sep 2026 14:06:35 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sergey Lebedev <lsa.uz@pm.me>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: add horizontal and vertical flip
 controls
Message-ID: <arEPu__kIs1SJbg5@kekkonen.localdomain>
References: <20260921082609.30830-1-lsa.uz@pm.me>
 <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk>
 <CAPY8ntCLhQH+8nT4jGxnOEWNhnn3=ESPnkip-6Y=zfkaHP5gvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCLhQH+8nT4jGxnOEWNhnn3=ESPnkip-6Y=zfkaHP5gvw@mail.gmail.com>

Hi Dave, others,

On Mon, Sep 21, 2026 at 11:57:07AM +0100, Dave Stevenson wrote:
> Hi Sergey and Kieran
> 
> On Mon, 21 Sept 2026 at 10:02, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Quoting Sergey Lebedev (2026-09-21 09:26:14)
> > > The driver programs OV13858_REG_FORMAT1 (0x3820) from its mode tables and
> > > never exposes the readout direction, so a module mounted rotated cannot be
> > > corrected.
> > >
> > > The Microsoft Surface Pro 11 for Business (Intel) mounts this sensor upside
> > > down, and ipu-bridge now says so - b238116ccd4b ("media: ipu-bridge: Add
> > > upside-down quirk for Surface Pro 11"). libcamera reads that rotation and
> > > tries to compensate with sensor flips, finds neither control, and falls
> > > back to Rot0, so the quirk on its own names a rotation nothing can undo.
> > >
> > > ov13b10 has the same two controls, but it is a different part and its bit
> > > assignments do not carry over. There is no public datasheet for this one,
> > > so these were found by experiment on a single sample: single bits written
> > > over i2c mid-stream, each captured frame correlated against the flipped
> > > baseline. Of every bit in 0x3820 through 0x3823 exactly two move the
> > > image: 0x3820 BIT(4) set flips vertically, and BIT(3) cleared mirrors
> > > horizontally. 0x3821, where the mirror sits on several other OmniVision
> > > parts, has no effect here.
> 
> Intel's ipu6 driver for ov13858 confirms this -
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov13858_intel.c
> 
> > > Verified through the controls against a static scene, as correlation with
> > > the flipped reference and, as a control, with the unflipped one:
> > >
> > >   vflip  +0.994 / +0.629    hflip  +0.973 / -0.141    both  +0.975 / -0.178
> >
> > What do these numbers mean ?
> >
> > Flips are 100% flips. They're not 90% flipped... or 90% correlated to
> > something which might be flipped.
> >
> >
> > > The mirror bit is active low and every mode table already sets it, so the
> > > defaults write back what the mode list just wrote.
> > > __v4l2_ctrl_handler_setup() runs after that list and before MODE_SELECT,
> > > so the read-modify-write here sees the value the mode just programmed.
> > >
> > > The Bayer order at the output does not change with either flip: per-channel
> > > means over the four states agree to 0.2 counts in 70, and all four frames
> >
> > What does this mean ? (what's 0.2?)
> >
> > > demosaic correctly against one fixed pattern. Unlike imx219 and imx258,
> > > whose flips select a different media bus code, these controls therefore do
> > > not need V4L2_CTRL_FLAG_MODIFY_LAYOUT.
> 
> Just as a note, if the driver supported get_selection then the crop
> should move by one pixel in the relevant direction with the flips.
> 
> Moving the crop to preserve the Bayer order isn't that unusual in
> sensors now (most of the Sony Starvis and Starvis2 sensors do this, as
> do some OnSemi sensors I'm aware of), so it's not really worth stating
> in the commit text.

It'd still be better to do this by using set_selection() to select the crop
rectangle, which is a bit awkward before we have the common raw sensor
model patches merged.

On the other hand, if this is all the sensor supports, there's little we
can do about it I guess.

-- 
Regards,

Sakari Ailus

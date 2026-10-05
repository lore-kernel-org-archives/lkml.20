Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EFF377A98;
	Mon,  5 Oct 2026 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187473; cv=none; b=hgDgT/ijxfrJlZS+8g+mgrP8txESCr+9OaqEkkbhUolwqMo0DhWMbzyZBeOeJz0IOkZwzBhsZNSK3okvuc986ClfkHstWMNaet1izXD3bn/ZK4EixKI0+bVfi6v9KhorucxVteIygddoOHGJSLRWp1Z0WJsbNKzaxzFKcCKnbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187473; c=relaxed/simple;
	bh=7wT7934j1TSOaCku8BmhYMvBfKvbPNhN2Nlt+rexYZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKnfgCJg0Po8pskwjlPOKyRryiI9PzxaJ2La6Pn/hRNI/rSi2lWsNAGozXcoFf8ONawIy70iFAUzJRbv0PFdrNSxBZz06ZnxdKzJgi6sQYCq3L1dpmV8GD7YgdNyxZFNOGjhs+ihENb1xLMlD2izK3hhdytfIgLVBviPmC5rg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1fHEb1R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1fHEb1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791187470; x=1822723470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7wT7934j1TSOaCku8BmhYMvBfKvbPNhN2Nlt+rexYZA=;
  b=n1fHEb1R0IEbKxOwUSkgv0lYiEV33P+bICdAshYAyqvZfZc/EEps2IJz
   31SMtNfHkTHW6LI1N5hcKD+0kr+oI5ryJbbn94sNxj99+62Csh+Xy5b9o
   aiZhS1EAbYyj46KzRPS1NsrnrBqkB+OxRUFYmAd2bAsE0Bx4twxlIjhig
   yj7tH8FKbaLfJ0R3fiXb7G9J4Ys2Ne6LPKYGPLHo5tV+f1/airvp0JM5Q
   VRJtigW8U8y1WlfN0DWUqch2lkndRuxX4z9qR3usmkMJFQrfoj8InIFcv
   jhS6ig26Gl8Ee5vON9qwpohpj9KQh67mI+p+Q6a8mDp3VaXYYeAC6FAbc
   w==;
X-CSE-ConnectionGUID: vuiGB9upTTKdkWy+KxAxaw==
X-CSE-MsgGUID: lOpi+zocTPKmHWqUA+VsFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="103223469"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="103223469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 01:04:29 -0700
X-CSE-ConnectionGUID: pKXV3LKKSXSOfIuyMGLl9A==
X-CSE-MsgGUID: jjFytUrmTTa89sfSXPDbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="281519374"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 01:04:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 15D3711F817;
	Mon, 05 Oct 2026 11:04:28 +0300 (EEST)
Date: Mon, 5 Oct 2026 11:04:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: Re: [PATCH v4 0/3] media: Add OmniVision OV32C4 sensor driver
Message-ID: <asNaDFhUmKwjs04o@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005071010.7191-1-robertbozik@gmail.com>

Hi Robert,

On Mon, Oct 05, 2026 at 09:10:07AM +0200, Robert Bozik wrote:
> Hi,
> 
> v4 of the OV32C4 sensor driver. v3 is at
> https://lore.kernel.org/linux-media/20260829115832.8749-1-robertbozik@gmail.com/
> 
> The one open question from v1 and v2 was the second I2C address - the
> write to 0x3e that the sensor needs before its main address answers -
> and whether it belongs in a sensor driver. v3 could only say what it was
> not. This version answers it with a measurement, and the design follows
> from the answer.
> 
> The question that decides it is whether the block behind 0x3e lives and
> dies with the sensor. Measured on the machine, polling 0x3e and 0x36
> every 0.5 ms through a runtime power cycle and lining the polls up with
> the kernel's regulator, gpio and i2c tracepoints:

I've been looking into this and it seems the answer to the question is
"yes", we can assume it's always there. The sensor has some kind of
always-on functionality that is controlled through a different I²C address
and accessing it is apparently required for the sensor's power-on sequence.

Cc Antti as well.

> 
>   - sensor off (AVDD disabled, reset asserted): 0x3e NACKs, as does 0x36
>   - AVDD on at t=1.0 ms, settled 3.5 ms; reset released 8.9 ms
>   - 0x3e first ACK at 10.1 ms, reading 0x1001 = 0x00; between AVDD and
>     the reset release it did not answer
>   - the driver's 0x1001 = 0x04 at 30.1 ms; 0x36 first ACK at 30.6 ms
>   - reset asserted and AVDD off at 4000.8 ms: 0x3e gone by 4001.9 ms,
>     0x36 by 4003.0 ms
> 
> So it is unreachable without power, appears only once the sensor's own
> reset is released, forgets the value written to it over a power cycle,
> and disappears with the sensor. It has no ACPI device of its own, 0x300a
> there reads zero (it is not an alias of the main map), and 0x36 has
> nothing at 0x1000. The same register pair exists in OV08X40 at that
> sensor's main address, named AO_STANDBY (0x1000) and MS_SELECT (0x1001,
> 0x04 for streaming) in ov08x40.c. The vendor Windows driver writes it
> from the sensor driver as well, once, after reset and before the chip id
> read, and never reads it back. I take all of that to mean the block is
> part of the sensor and the sensor driver is its owner.
> 
> What changed accordingly:
> 
>  - The driver claims the second address with devm_i2c_new_dummy_device()
>    and writes it through a CCI regmap of its own; the bare i2c_transfer()
>    is gone.
>  - ipu-bridge no longer instantiates a VCM for this sensor. The SSDB
>    says vcmtype 2 and the bridge would put a dw9714 on 0x3e; dw9714 has
>    no id register and binds to anything, and that client would hold the
>    address the sensor driver needs. Patch 3 carries the exception, so
>    patches 2 and 3 go together.
> 
> Two smaller things turned up while re-reading the driver for this:
> 
>  - The 10 ms after the software reset was a busy wait. The reset sat in
>    the mode table with a delay_us, and regmap_multi_reg_write() turns
>    that into udelay() on a regmap without can_sleep, which the CCI one
>    is. The driver now issues the stream-off and the reset itself and
>    sleeps; the table is the vendor's sequence minus those two entries.
>  - power_on() returned 0 when the enable write failed. It now fails and
>    undoes the clock, the supply and the reset.
> 
> The power-up timing, your "0 and 5 ms" on v1: I did not follow it then,
> and I think I do now - nothing after the supply, because the regulator
> core waits for it, and 5 ms after reset. The measurement above agrees:
> the block answers about 1 ms after reset release and the main address
> within 1 ms of the enable write. v4 uses 0, 5 ms and 1 ms, verified over
> a cold boot, 20 runtime power cycles and 15 stream starts without a
> failure.
> 
> Where the numbers come from, stated plainly this time, because v3 said
> both "copied 1:1" and "measured by me" about the same table:
> 
>   From the vendor Windows driver (ov32c4.sys, FileVersion
>   70.26100.2.18255):
>   - the mode register table (1787 writes, at file offset 0x31300), of
>     which the driver drops the first two entries, stream-off and reset,
>     and issues them itself;
>   - the 400 MHz link frequency, carried there as bits per second;
>   - the chip id 0x563243;
>   - the write of 0x04 to 0x1001 at the second address;
>   - the registers the controls use (exposure 0x3500, analogue gain
>     0x3508, digital gain 0x350a, VTS 0x380e) and the rule
>     exposure_max = VTS - 32.
> 
>   Measured on the sensor:
>   - the chip id, the register meanings above and the exposure rule,
>     confirmed against what the chip reports;
>   - the gain ranges: analogue exactly proportional between 0x100 and
>     0x7c0 (1x to 7.75x, 0x100 being the power-up value), digital
>     proportional with 1024 as unity, clipping to black one step above
>     16383 - the obvious donor, ov13b10 on the same registers, puts
>     analogue unity at 0x80, which is wrong here;
>   - the timings: 320000000 / (4080 * 2614) = 30.005 fps against a
>     measured 30.00; the power-up sequence as above;
>   - flips preserve the Bayer order, so the media bus code never changes
>     and the crop compensation ov13b10 does would introduce the shift it
>     undoes there;
>   - the 6560x4928 array and 6528x4896 active area, from the window
>     registers of the table, agreeing with the vendor's product brief;
>   - the second address, as above.
> 
> The rest of the series is as before. It adds a driver for the OmniVision
> OV32C4, a 32 megapixel RGBC CMOS image sensor. It ships as the
> under-display camera in the Lenovo Yoga Slim 9 14ILL10, where it is
> enumerated through ACPI (_HID "OVTI32C4") and feeds an Intel IPU7. The
> driver supports 3264x1840 at 30 fps, 10-bit Bayer, 4 CSI-2 lanes at a
> 400 MHz link frequency, with exposure, analogue gain, digital gain,
> vblank, hblank and flip controls, runtime PM and .get_selection. Tested
> on that machine: the sensor probes, streams at a measured 30.00 fps,
> frames arrive complete, and the full path to a processed image runs
> through libcamera's software ISP. The driver has what libcamera's sensor
> driver requirements ask for: the five mandatory controls, the crop
> selection targets, flips that keep the Bayer order, and the orientation
> and rotation properties.
> 
> v4l2-compliance on the subdev, kernel 7.0.0-38:
> 
>   Total for device /dev/v4l-subdev4: 46, Succeeded: 46, Failed: 0, Warnings: 0
> 
> Static checks: checkpatch.pl --strict, sparse (C=1), W=1 and
> dt_binding_check.
> 
> The series applies to media_stage.git; base-commit is below.
> 
> Thanks,
> Robert
> 
> Robert Bozik (3):
>   dt-bindings: media: i2c: Add OmniVision OV32C4
>   media: i2c: Add driver for OmniVision OV32C4
>   media: ipu-bridge: Add OmniVision OV32C4
> 
>  .../bindings/media/i2c/ovti,ov32c4.yaml       |  105 +
>  MAINTAINERS                                   |    8 +
>  drivers/media/i2c/Kconfig                     |   10 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/ov32c4.c                    | 2716 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |   26 +-
>  6 files changed, 2865 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
>  create mode 100644 drivers/media/i2c/ov32c4.c
> 
> 
> base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa

-- 
Regards,

Sakari Ailus

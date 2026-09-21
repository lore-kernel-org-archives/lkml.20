Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4118B4CCDEB;
	Mon, 21 Sep 2026 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007600; cv=none; b=JzfDMCf0kCfxoBlccFVZJY69RzfwcqVva+aBkxK4eSC7BoltjtRz62ovYtzhISwch7O7TXYHoj7rlMy6vz5MaFGJBqZVmQ//M5w5dV6tpkwQRJcp7RmRYUPgyw9+q9vuhRAZYbI1XexljT028Tc09c06MecT1e1+nEDC6pkUe+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007600; c=relaxed/simple;
	bh=Nh1o0940wrAZdAacHUvfMALeek9wgBGDKWVVWXx4B40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST06ng7mLEIyoXMT/f0CXZFUtnLzPZgD907gQc1vRh/tkrt1yi0HVasir+sDbTC4rJsCdGOvkSyvKDJq9rQBgPF/Qkh5zf3JdUIQbHpVvrwWdQMh2URr827oxwmkEf+atGIz4bRig27GQDiDJr2ODMjB8UK64yl4N15zgFFDYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbxK2uxU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbxK2uxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA1D1F00893;
	Mon, 21 Sep 2026 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790007598;
	bh=yUk6xrHyMi4gFz7Q2nWEkOHH5s2Hu2ne+l7Vi+ljp6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UbxK2uxURejDJlalyThSRTeTHPax9jSfShPdzCRZkP3u0RZSL8ufyoda7eOKicwe8
	 A6vKtma1Z4LdM6+QhHs2KhURVQw/tQweIBomV0Fs0bIxphqHuqdBdXTH6uj89tQocL
	 QmEawNd3P4dx1hmF2HM1b2KwGFi7NihQpZZ4x/+VT8vNVTVnWrDKAKXogwLjhJV5pv
	 XEV+9G4BACeyxqQh1+IIFCDVF8Cx/+xCnMajPrKrlZrazEdt3drIXiGv21VItc1Uek
	 QjDuJj4USMvKbR2MO0l6ymVn/GNsoa5SsO39JaNz86/hs3yczaiN+IweshvtnjgRVU
	 Ots9izkGZaPtw==
Date: Mon, 21 Sep 2026 17:19:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 8/8] firmware: smccc: lfa: add sysfs ABI documentation
Message-ID: <20260921-essential-inquisitive-spaniel-9801eb@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-9-andre.przywara@arm.com>

On Fri, Sep 18, 2026 at 04:11:11PM +0200, Andre Przywara wrote:
> Document the sysfs attribute files as exported by the LFA driver.
>

Looking at the sysfs output in 2/8 message log,
activation_pending is missing from the documentation.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
> 
> diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
> new file mode 100644
> index 0000000000000..afd349af9cf14
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-lfa
> @@ -0,0 +1,106 @@
> +What:		/sys/firmware/lfa
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		The Arm Live Firmware Activation (LFA) spec describes an
> +		interface between platform firmware (an agent) and any user
> +		on the non-secure side (like the Linux kernel) to activate
> +		pending firmware updates at runtime. The actual firmware
> +		update would be provided independently (out-of-band, or
> +		via any existing explicit firmware update mechanisms), then,
> +		if supported, can be activated immediately, without rebooting
> +		the system.
> +		This directory contains one directory for each of the LFA
> +		capable firmware images supported by the agent, identified by
> +		its GUID. Within each directory, the same set of sysfs files
> +		provides access to the properties and actions for this
> +		particular firmware image.
> +
> +What:		/sys/firmware/lfa/<GUID>/activate
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(WO) Write a boolean 'true' value to trigger the
> +		activation of that firmware component. An update must be
> +		pending for this to be successful.
> +
> +What:		/sys/firmware/lfa/<GUID>/activation_capable
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(RO) A boolean value to show whether this firmware image is
> +		capable of being activated.
> +
> +What:		/sys/firmware/lfa/<GUID>/auto_activate
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(RW) Write a boolean 'true' value to allow a firmware image
> +		to be automatically activated once a new firmware update
> +		becomes available ("pending"). This depends on a working
> +		notification scheme, for instance via an ACPI notification
> +		or an interrupt to notify the kernel.
> +
> +What:		/sys/firmware/lfa/<GUID>/cancel
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(WO) Write a boolean 'true' value to cancel a recently
> +		triggered activation, if that has not finished yet.
> +
> +What:		/sys/firmware/lfa/<GUID>/cpu_rendezvous
> +Date:		May 2026
> +Contact:	Andre Przywara <andre.przywara@arm.com>
> +Description:
> +		(RO) A boolean value to show whether this image requires
> +		a CPU rendezvous in firmware to be activated. If true, this
> +		means all CPUs will enter the firmware during the activation
> +		process, so will not be able to execute kernel code or
> +		handle interrupts for a brief moment.

What use does the userspace have with this 'activation_pending' and
'may_reset_cpu' ? We should drop them unless you convince otherwise.

-- 
Regards,
Sudeep

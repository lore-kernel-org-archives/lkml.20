Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1082E737E;
	Tue,  6 Oct 2026 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284477; cv=none; b=Gb0ommcBILubQixgcyWFBSxXxUTtpb0nHU6DaZuUgMscLmOr+ikI+Zm9igB6X2WgqwkkYm9QBpAZLanAMdNQwBRVjZN7iO8MrAmdDNtEf0rzvup+G9dmbudmrP7xKdtGsiKuWwqrtLfCfv3d9IWLHY8XtFKmKR8NV9YEP22ar3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284477; c=relaxed/simple;
	bh=Wy1xkXhxTU+WKZ1GVuZmF/3N3CBqTGwfB3+4nEXevhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPOw8LCBGoydNi3PYOhZWCCiU8hAwyNwdZa9Q/C98VBmDQsqEqGOjiJyDbFsIz5w8zMAup7oKufHOce0Cz1BlxyHT8W3/v1Ye/PXbEI216WP8gjft4CaJhn0d1QQS25aM2AzbqzpfuTm3UU5flu37zRyRd0NLLAJGPqln7eRm1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oK0ifYDl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK0ifYDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791284476; x=1822820476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wy1xkXhxTU+WKZ1GVuZmF/3N3CBqTGwfB3+4nEXevhg=;
  b=oK0ifYDl8tWakOU+A2lo5E14wJDyC3WRNTt12H3gFt4WLkF+5Q4s7+o/
   0SnyZ3zL0oOWlwNNqRqBRRFpapPen8zuox098pdziGr6wF6IPluFRw0Uo
   CLXOUBhmTybYK77eOmpHQeFM8Ww/cwv4P6dhEQcNVSD5LAIXRFfoj3fhW
   0OY4tJhhxyF4FX1cPisimKd8Z/vngQW2CMk7kUOSzDEmfMpvSFQuljiMU
   EvZW0gATkobaNuSxBDvJ7z2nmvBP+nnj041rvmqEGZgrgVh1LDlFbjmcI
   ceAZCSVtIvmBmNXCbkwkR8ccKyzSrfFD9yUMvQzDJb1xyffn8Oj/gfIK3
   A==;
X-CSE-ConnectionGUID: JdPdG37eQoS/Vpaa2uVv7A==
X-CSE-MsgGUID: 2+M3UOMMRiW8OOXuWwDySQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="28273"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="28273"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:01:15 -0700
X-CSE-ConnectionGUID: oNHqWV7wRN6ZxiV45KNihw==
X-CSE-MsgGUID: JHZQnhpzTvKT1ViAq2njVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1189089"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 06 Oct 2026 04:01:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 54F6899; Tue, 06 Oct 2026 13:01:12 +0200 (CEST)
Date: Tue, 6 Oct 2026 13:01:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: hans@kilurion.com
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Keep Meteor Lake host routers powered in DP
 redrive mode
Message-ID: <20261006110112.GP176164@black.igk.intel.com>
References: <20261006-tb-mtl-redrive-v1-1-5ec921114c37@kilurion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006-tb-mtl-redrive-v1-1-5ec921114c37@kilurion.com>

Hi,

On Tue, Oct 06, 2026 at 10:06:43AM +0200, Hans van Essen via B4 Relay wrote:
> From: Hans van Essen <hans@kilurion.com>
> 
> When a DisplayPort Alt Mode (non-Thunderbolt) dock is connected to the
> USB4 port of an Arrow Lake-H system with the integrated Meteor Lake-P
> host router (8086:7ec2), the USB functions of the dock work but the DP
> AUX transfers time out and no monitor is detected. It only works if the
> port was used with a Thunderbolt dock before and the system was not
> powered off in between; suspend and warm reboot keep it working.
> 
> The Barlow Ridge host routers already have QUIRK_KEEP_POWER_IN_DP_REDRIVE
> so that the host router does not enter runtime suspend while the USB4
> port is in DP redrive mode. Apply the same quirk to the integrated
> Meteor Lake host routers. With this the driver logs "enter redrive mode,
> keeping powered" when the dock is plugged in and the monitors come up
> after a cold boot.

Yes, Barlow Ridge needs it but it's a special case. ARL should not need
this - its all routed internally so something else is wrong here.

Can you share full dmesg when this issue happens? Please add
thunderbolt.dydnbg=+p too although this really has nothing to do with TB if
the port is in redrive mode.

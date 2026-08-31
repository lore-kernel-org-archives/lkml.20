Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494AF3E4506;
	Mon, 31 Aug 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176193; cv=none; b=GeYTlxfcsOCxYsZ2kUmeW7knAyfiuiLo9Zhvm94UdDz51E85w+57ADDpPLJnh+sJz2WC+R2She2q552C/jaGpjupjqMgst82LqEN3xnU+oCU9QtS6QACEqAfzEPZVf5puT9C2ocHR3NFg7G1tJLBNXF0DxYJqYjtv4EdviQgcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176193; c=relaxed/simple;
	bh=cO4nIb1FlbAVvNepCuk49MLi7BhBFCebL/Sq4XvBzhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAGOK92/99KsMlUfyBuFAPHfwYYh1xTG/eEm96Ewp9u2Gb6prXqhKiZct5j/Ontj/gUTI17SVsOyDmRZp7d1pSwtQfDQSmqr1w3ZvHJZh29WevzUgxPJn/LLclF2aIAKnU2fV1WQdfTyTCvwrJ9K40ulYn9Pp/DEyGWrdTK9nH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgMoQkhz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgMoQkhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176191; x=1819712191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cO4nIb1FlbAVvNepCuk49MLi7BhBFCebL/Sq4XvBzhE=;
  b=jgMoQkhzuQvp/bCPLay0MnYS0Dr9YGe5aaU1kG0PceQg/AHA7NaxCy2R
   Syw3RUADX9S1kgsse2MECqjRjhTo6vLhn0XJmXRltvm1iJ+dF91hGienH
   N8qxWbh9t730VVnQQ348z+rl8XBgJ4ENKQb4Xjs8e2CjgzUQWc1DFoxUQ
   5QJq461F0L5BO8o2qQbbfGmOqFsm7xMBDn17klknTaVIhsxVB43JdRzfB
   Mjy+aLVA6n3t9GyCP2J/OaF/s4iBAOKtrxcNvqk94SU9UOGAfSff5j+0j
   fxnTeeTJHvVJG/70e2uy6XxOp+mmSJTb1EusvGi1xmoxhDk6iZou0lDda
   w==;
X-CSE-ConnectionGUID: eg+09nh/ScG3pBGLGflMfQ==
X-CSE-MsgGUID: w4Y4oiLeT/qX8szR+BPy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114119122"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="114119122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:36:30 -0700
X-CSE-ConnectionGUID: TtwHLS/SR/OwbF/SBC9hog==
X-CSE-MsgGUID: /E+mniLrRPe2bqIzRaVcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="270697187"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:36:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DDF6911F894;
	Mon, 31 Aug 2026 14:36:25 +0300 (EEST)
Date: Mon, 31 Aug 2026 14:36:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI
 remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Message-ID: <apVnOSRgD04GwLww@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com>
 <apU1JxHwqGsQOIlQ@kekkonen.localdomain>
 <20260831102328.36764-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831102328.36764-1-dmanresa@gmail.com>

Hi D.,

On Mon, Aug 31, 2026 at 12:23:28PM +0200, D. Manresa wrote:
> [Resending with the lists on Cc - the first copy of this reply went out
> to the people only, due to the same mail tooling error on my side that
> Hans just caught on the int3472 patch. Fixed now; apologies for the
> duplicate, Sakari and Hans.]
> 
> On Sun, 31 Aug 2026, Sakari Ailus wrote:
> > I recall unbinding the ipu6 driver successfully in the past. Do you ensure
> > above all sub-device drivers have been unbound first? I guess the V4L2

In fact the sub-device drivers aren't meant to go anywhere whilst the
sub-devices remain registered.

> > framework nor the ipu6 driver necessarily ensure that right now.
> 
> Measured it, since the machine reproduces this in a minute: unbinding all
> three sensor sub-device drivers first (ov5693, ov8865, ov7251 - each
> confirmed unbound via sysfs; the VCM client had no driver bound) and then
> running the same PCI remove -> module unload -> rescan -> modprobe sequence
> fails identically, byte for byte:
> 
>   sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
>    software_node_register+0xd2/0x120
>    ipu_bridge_init+0x192/0xeb0 [ipu_bridge]
>    ipu6_pci_probe+0x417/0xbe0 [intel_ipu6]
>   kobject: kobject_add_internal failed for INT343E with -EEXIST, ...
>   intel-ipu6 0000:00:05.0: error -EEXIST: IPU6 bridge init failed
> 
> Which makes sense: unbinding the sensors neither unregisters the bridge's
> software nodes nor clears their ACPI fwnode->secondary pointers, and the
> -EEXIST happens at the IPU HID node registration, before any per-sensor code
> runs. A plain module unload/reload without the PCI remove does work, as you
> say - the device keeps its secondary fwnode, so the graph is still wired -
> but any path that goes through device_del() (which clears the secondary via
> set_primary_fwnode(dev, NULL)) ends at the -EEXIST.

Indeed.

> 
> While re-testing this I also got a clean confirmation of the dangling
> link-frequencies: with the creator module unloaded, rebinding ov5693 against
> the surviving nodes fails with "supported link freq 419200000ll not found"
> (-22), and the same rebind succeeds the moment the module is loaded again -
> identical rodata back at the same address under the stale pointer.
> 
> Hans: thanks for the quick ack on the split. Series sent as
> 
>   [PATCH 0/2] media: ipu-bridge: survive module unload and reuse the
>   software nodes on rebind
> 
> threaded to this report - with one correction to my point 2a folded into the
> commit message of 1/2: the property *name* strings in prop_names were never a
> problem (char arrays, already copied); the real module-image references were
> the link-frequencies values and the "lens-focus" property name literal.
> 
> D. Manresa <dmanresa@gmail.com>

-- 
Regards,

Sakari Ailus

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837494;
	b=PKAkIF99uE/cqtF8Hah3W9KbnajnzQApcnW4P2GZ1/uX96uCqj0003xsBNsQb+EwbtBO
	 Wpm/DGSiUuOK52aS1mjm7XVZwSpUHzXk3QrluKUJnKh0C76WD3YlWsmRrk1AIb0SMxLib
	 o57RszjzG3eym3eF21dND6+HKfS23+mjpVo8P2jjTsbRJ2s2QeV2CHPuTyy/mr20FJvUJ
	 xr6y5i6L+JSzJFozMng2hIhnBO1Uiz2mjBXX4i5MwXunZU1L5SZKlS2PqmHtFtkGzXkti
	 G/U04PRRVzOGOB4JawxXg8aJR2sENbyN2/InNfsGfS4WwZJyigpEfuHjjypKTWWnzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pf9qCYRZB1EIwaMBu5s/hJHjXRG/v0BY2coeM+6XPWg=;
	b=EyfzfJ1nVj69iulXSKWj3IH9oMS2lroFTAvymBTz8GjXRie73KF1TX5gLKp8c1YPN+9K
	 2GrBtRBRt6ru5VMBVVR9iemTbBV7LOoZMJxwU8ns5yffElAUceDaRjWetX8EuS1nLY5h5
	 O9eDgQbXlSTcE73SQjpQcWlUC0nHukATSzyWoSqiA2nU1HOlAng/mpgZ/Rfb1qBybS+Nw
	 Auue+BoTZnBGbqahRsK8nr0pVpmL+PTnZdU0hnI2Z4QTo4JqIilgFS30YjQIDhDP0mFHY
	 DWhHbTaiRIrXjiPdJU5LQbJ8h2XmH6HVFpnwKow4770bqQdr0XcdT+MRLfRBQN5FeDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kf+znXXJ;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2085606A330;
	Mon, 16 Nov 2026 13:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2085606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kf+znXXJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794837494; x=1826373494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cO5ckKW4Iyce2LjjFCoF1OYtCDM8hcKM0Fx7Axg5T1s=;
  b=Kf+znXXJky/5L2QOlSYWYhnxysj874rf1WRxkpYnj7R1bNv/wJvqc4EI
   P+1TLkBht54KKZZF8vv3xECNqdIWLHIihWCUzTop7FGvTxiN6GpCZDpbh
   EEcPRfSLldhl7w4NLLG1WcrIGCRjLu/vUjiBxJXKruY6bchlvff21fsoU
   jeKzZwAIS5kqYOgWlsBGsSZHDDgF8ZggKWbTKGftkgZIouaTuLxjoKuNH
   //9K/24LYQT5i3Obnb6JfJUUgq7zR4lmA4u55gu2PrJta5bvezUieuUnR
   W7NrwzI/wmMG55OYig3Apr1tUEJ8vpKLiMlEhpDFObHHP48YfH0xsacWK
   A==;
X-CSE-ConnectionGUID: SRPINpDGQCGixsXHb/vScA==
X-CSE-MsgGUID: xifA9oTRSsOwnAj2fFwykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3477271"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3477271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:58:14 -0800
X-CSE-ConnectionGUID: 9RgE/HRVTQCJRBKyzpDo8Q==
X-CSE-MsgGUID: XWC6wo6BS6WjfqpHhhxTeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9686364"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 05:58:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7C99A99; Mon, 16 Nov 2026 14:58:10 +0100 (CET)
Date: Mon, 16 Nov 2026 14:58:10 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: shyckless@gmail.com
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com, westeri@kernel.org,
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org,
	alok.a.tiwari@oracle.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Keep the USB4 port when component_add()
 fails
Message-ID: <20261116135810.GY259790@black.igk.intel.com>
References: <20261112-thunderbolt-v1-1-fc30057cb7cd@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-thunderbolt-v1-1-fc30057cb7cd@gmail.com>

Hi,

On Thu, Nov 12, 2026 at 09:57:03AM +0000, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> When component_add() fails, usb4_port_device_add() unregisters the
> device but doesn't return:
> 
>     ret = component_add(&usb4->dev, &connector_ops);
>     if (ret) {
>             dev_err(&usb4->dev, "failed to add component\n");
>             device_unregister(&usb4->dev);
>     }
> 
> The port was registered just before, so device_unregister() normally
> drops the last reference and usb4_port_device_release() frees usb4.
> The function still goes on to set up runtime PM on usb4->dev and
> returns usb4 to usb4_switch_add_ports(), which stores the stale pointer
> in port->usb4. When the router is removed later,
> usb4_switch_remove_ports() calls component_del() and
> device_unregister() on that pointer again.
> 
> component_add() can fail on allocation, or when binding the aggregate
> driver fails. It isn't common, but when it happens the result is a
> use-after-free and a double unregister.
> 
> The USB4 port can keep working without the component link. Keep the
> port registered when component_add() fails, and track whether the
> component was added, so that usb4_port_device_remove() only calls
> component_del() for a registered component. Otherwise component_del()
> would hit its WARN_ON().
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 5dddb4169284 ("thunderbolt: Link USB4 ports to their USB Type-C connectors")
> Reported-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Closes: https://lore.kernel.org/all/20250622140455.2884518-1-alok.a.tiwari@oracle.com/
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Applied to thunderbolt.git/fixes, thanks!

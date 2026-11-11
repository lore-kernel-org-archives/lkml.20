Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409460;
	b=ec+vERMKS5LYX6dL5H1sbLgNUbDdpHR6oeHMYULmHU2WVeNjtM6sBdej2/fKVMliWvgC
	 XVdMKNkjdMTFgySWw+NDG1vzVL2/C9pCGRTuGB+hXboBYR72kI/HL84lGIxRG5sslwSCq
	 KP9CEsGhWdTPBtbN2TtvpUj0rXbkc7LZ02TwGrmoKVROeONYJF6ZdqQEV97+flf10yUiB
	 icGN9zApqJF2aZQi/c9FSyOCTYmQEfe3Dn5tk7sne9dNFSF9uAo1/9i7kFTeC4E37z3O9
	 7Thm2OzlkvH0krcC+Z79ksSLlXa+FZOftxsjT9dFXcPqNvGcJnsnIEfgTpl4zjpEFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409460;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MMRRnvmnigTVNukZ0z7qN4rgNghyuOPuWedVFff/mPQ=;
	b=S7B36JgbfP4MLytrAKQiqp3a/Wt7hutJA/8YqnGs6+LroSncOR20kLeQnJsL5iDCy0rs
	 P8I6oxNz6/NTDn1YTMKTCjV7fsW/eFHpyU5vlelkcVxzGM6Ii9DUQFhZnMNpeqzLVI9RL
	 gGSZvmOUxsRSZviFTzBBRYhPnCZJNUWbWn3d5asimoTqqsQWNC/jZ7R4cQjYU8McyD0YZ
	 Rs41t0WD8mA28K0KO6WoyrRE4bPmHZLKJwfuTMp1ce0bL3Hm+L6U+mIkDo8unAbU/wfRX
	 lyFTTasV4zjy5F52m95q2ATtq6v/m7l6rEgHEY+XPyJLKSCpfHz6mq1sD/ayMyea8pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZK8gb8VU;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1054606A321;
	Wed, 11 Nov 2026 15:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1054606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZK8gb8VU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794409460; x=1825945460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RdztAk9YKicYrEIegIuHZlbqYSu6obOf8O+YMmLeZ+I=;
  b=ZK8gb8VUVWiQgXtgOe1uPbDnjBXIJ5loc3KqFLT46r1OxM8s0uBETdgy
   0IP8Vyp6mBKdjRXi2TvLnLWEODZiQ8EwMzuKqWb30onEb8mCoffPWZb1C
   1+0NEZVVcjaml8PwQ5exGewWmEDr0qlCEcWqiusqwEilMVBCipFlrX6W+
   SbkpvuMFJQVppnbpYcsJZbUvJEsVKWlSt7qeiu6jA5rUOvf5gNBoGbzKB
   Yof1wSSsPSCD/AX472+EDWM7IvE5AvjdF6lsSu/f24ryUQVpyo2IEwIfh
   ejXRkvo4HRedXE5QJYOzaPNZ9llRmYLLCTpbzGdBjgIQR9LjoQM8izuT8
   A==;
X-CSE-ConnectionGUID: 3zl1rNiSQDyviSKx2TnavA==
X-CSE-MsgGUID: eULWe7/HT4Gj1pXEC07iQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3090059"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3090059"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 07:04:20 -0800
X-CSE-ConnectionGUID: tAje5x0nTc+K7i6SfZ5M7Q==
X-CSE-MsgGUID: qOPQ7diMSU214av9P7EVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="10223106"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 11 Nov 2026 07:04:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1143799; Wed, 11 Nov 2026 16:04:17 +0100 (CET)
Date: Wed, 11 Nov 2026 16:04:17 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Check the alternate mode ID allocation
Message-ID: <avSD8X8aRtT--4iK@black.igk.intel.com>
References: <20261111041446.3072716-1-lcy8047@gmail.com>
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
In-Reply-To: <20261111041446.3072716-1-lcy8047@gmail.com>

On Tue, Nov 10, 2026 at 11:14:46PM -0500, Changyul Lee wrote:
> typec_register_altmode() stores the return value of altmode_id_get()
> in an unsigned int without checking it. When ida_alloc() fails, the
> error code becomes the ID, and the alternate mode is registered under
> a name such as "port0-partner.4294967284". A second failure on the same
> partner then fails with a duplicate name:
> 
>   [    0.423055] sysfs: cannot create duplicate filename '/devices/platform/altfail/typec/port0/port0-partner/port0-partner.4294967284'
> 
> Return the error when the ID allocation fails.
> 
> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

CC stable...

> ---
> Found with a static analysis tool we are developing.
> 
> Reproduced in QEMU (x86_64) with a test module that registers a port,
> a partner and 63 partner alternate modes, and then two more with
> failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
> this patch, the first of the two is registered as
> "port0-partner.4294967284" and the second fails with -EEXIST and the
> error above. With it, both return -ENOMEM. Same result in three runs
> each.
> 
>  drivers/usb/typec/class.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 54c7810b563b..29fb13ca9f28 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
>  		       const struct typec_altmode_desc *desc,
>  		       const struct device_type *type)
>  {
> -	unsigned int id = altmode_id_get(parent);
> +	int id = altmode_id_get(parent);
>  	bool is_port = is_typec_port(parent);
>  	struct altmode *alt;
>  	int ret;
>  
> +	if (id < 0)
> +		return ERR_PTR(id);
> +
>  	alt = kzalloc_obj(*alt);
>  	if (!alt) {
>  		altmode_id_remove(parent, id);
> 
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> -- 
> 2.43.0
> 

-- 
heikki

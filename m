Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111610;
	b=uqTb5xZoHbF/6try7fPjbzuCqg3eNYmNkQNOBQgedkF1bPZ4iFB26xWWcqz34RfeXNR/
	 oOAifdCiDs8aTdFnTItg6LjrNkpgjx53ggtyH/tU7jHq0BUkFctnFHtrAozoUO+sB5g5u
	 sMQSO/2BIRJdmJ7l433pJ1vWOIMQV2T1kgsRA5MCzicWOwh5d+E60+KZSvFO1EW/TVwmA
	 bQXzFkV3dxfUqP7rNWVsntJzv7TjiIhVeoEDED0+e8cBeOa4FaODU/n8MDGtp4Oe4ChTh
	 vdpTUOMp91I04LXJB1nFOktVFFhPP8a9UUiBDb3AVtm4BSeN2O4sojSreF7x40A5bUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111610;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=v4X9sttYv+Qhk2oOjuZGFQ6QuOW2aloRmLgi1HTmaKI=;
	b=3wuZhKn41bxnRUnFbRCyhfGVVPq7DQqmUDX8ZFxu3RUwkvJzwGMChTJg1tTOh60drtRk
	 v/bff30ZM85UAA3LkPfi+Hi/RUUE1Js7ersAg0TDA8OdN/5Um2xCTK3ShyRBSh+ke85JT
	 gWRjFELoabgxooEOSJwCN/oT2NnxB+K+scZP39H02kJzROF98evvxM+nAebO6DrVMGzBr
	 C0hhem6I5BK8jhNKDrqSqgA0W5DpLBiIJ3gQtEQxfjiauHlhM8VhpmhlmYO2GcP8YURNn
	 yrYYNeha4PWQaU2Imf3nzPvf9n9bFvaI2TApJMtec+2IkIpvwSUklroj9GjPOJqeRAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfF2tVK+;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0A606A31A;
	Tue, 27 Oct 2026 14:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F0A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfF2tVK+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793111609; x=1824647609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d5+EUntBsa2Oe6aXOEkUeqPupBlcHTrKJf5H61RJn/c=;
  b=YfF2tVK+rR/QITb3c5Qx+tkl0RAUV3hvaaCpdUtPELgiBtwazlRl4MqS
   Ql7txGYGAyhkIePuio88LWd2JAPDX3JHpQ9Jj8HmoS4gazTmFINeUIaUE
   AWP5QSxeG6F1lM/eIiZVRUCmc+4j2HTaU+y6GCkTSgNhMmTde4JPIR1wN
   qijuLgU5KwnMWSxUNvGr8cvujmoRP8w48l1pzcutX9YT5PdGMa/Lkfmku
   y0gfa/5YcAC+ydoRvuB+qSLEqwg955DMs3T3kZ7dczPtp5yAzIWPOyRuG
   lBwDrrkJQLNdM+jSPXG9S1tAgRYlSIaS3m4S8myuY2Z8cpGHpmKTfpIoU
   A==;
X-CSE-ConnectionGUID: QICH9ds9Qaqo7YzIM+/WVw==
X-CSE-MsgGUID: 9PnuvT6IQ/Ku+erquNhzTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1843818"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1843818"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 07:33:28 -0700
X-CSE-ConnectionGUID: ZWmM4MZYTDub7j5GFNPpDQ==
X-CSE-MsgGUID: nrHWqNSbRgmJwnOIf4pzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6400801"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 27 Oct 2026 07:33:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5D7DD99; Tue, 27 Oct 2026 15:33:25 +0100 (CET)
Date: Tue, 27 Oct 2026 15:33:25 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: stream: Undo more if the start fails
Message-ID: <20261027143325.GJ158991@black.igk.intel.com>
References: <2026102751-nibble-synapse-d406@gregkh>
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
In-Reply-To: <2026102751-nibble-synapse-d406@gregkh>

Hi,

On Tue, Oct 27, 2026 at 03:24:52PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> If the receive buffers cannot be allocated or mapped,
> tbstream_dev_start() stops and frees the rings, but
> 
>  - leaves the DMA paths through the XDomain connection enabled, with the
>    hop IDs of rings which no longer exist;
>  - does not release the frame array and the pages which
>    tbstream_dev_alloc_rx_buffers() had allocated and mapped before it
>    failed.
> 
> Fixes: 6db21d817b43 ("thunderbolt: Add support for USB4STREAM")
> Cc: stable <stable@kernel.org>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Mika Westerberg <westeri@kernel.org>

Do you want to take this directly via USB tree? Then,

Acked-by: Mika Westerberg (Intel) <westeri@kernel.org>

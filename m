Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014496;
	b=GUMT4sbM9O1+BEkL6XDl+YiDpbTbpg7VusB52NPJdVB3rvUN1x8pFa2didvRODqvynCM
	 rMUiEedrrODu86vy31Fb+SpKhWLV8mfOmWPTPwjlGVBK+R5cYIYQhNcBgkEp0DM01Z20H
	 xP0zHZzJz87QPiVnTF/JsuuwVXQt9r+/cX0n4ojCVczwOKirrtEf0rf7XtfZpNZ6+Ns7u
	 aXc+7YeLYR5YQZwQKzl5PtoC6b/6ywfWwx2XlBgUPe2sQ63wpgDFxMygS87/GwK4kmT4J
	 MOczeiOqtPdknyoovLjhteM689DF/ewjZUb98GZmX9fdMk5He3vev5tPV+OXln2mRKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014496;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=81iWWYvNHOsYhJI1AtdMbueFZTVrGpiCZivI5SfyHKI=;
	b=n3dcB12kiJOoxO2MHnpOI49+MaZa0EoQ+QTqFZWAjZ92FL8lGnS2U/n8VZ4geB3mtW27
	 nVqrdeM5ZFtpa4CVC/lmM5c5a9r5qIcLNSUCumd4cpeiv4769TBN+7v7lch50AW4mVl2T
	 GXHKC4QpobNVa3Z6SdX57tz6fpnppdRWbSTHLVqgxQvLPO4bbCsCa6E8pKq3E4h7wdDOA
	 Q67sWhpzd7X7VLiRo9tsm7y9g3gGWuSsPxzZJokUnNobE22XoexoAS4nAYJF40CnH0ao5
	 y4PNfJwfKEMDT6AKA3M+PTIdMh49pcmJEZoEUL89T/zZ+jZRABuZhOiIeXlCT2Lcgkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QmppccKC;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0043606A31B;
	Mon, 26 Oct 2026 11:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0043606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QmppccKC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793014495; x=1824550495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RGYZQXfA58aETXSfq31w7qTqCLtv7XhPuDLLw9HvvkQ=;
  b=QmppccKCx66rgaBPSJ6lY2szB7ClPTf29Qo+TCTUiPNt1MkqD1qWOFRL
   MLmeQnyu8wnWeWsM0EWzuXo65z6xvYVemvDJRlvxTYZwyhoIKcOc0A39H
   Oo8RAF0+kiBzLD4sGrmgUDEsky6pKYI8JC4eaqvHcFNjo8XNb4CWzkQr3
   bN/SHfVZpi4hifGEx+fG++Ne5v9Ap9UUT8lrN8it7cYiUH7LyAj7oxhbn
   WA5MVdz3OjRHSNWiCwaoJYWm7fMbgLuRS6QxbFrgeECLf2FxT/jCglzz9
   8vm8gegdd62twIKQFcYW7kLLIW/XWCx1ALqYPiCKaOo/B0g9otcXp46G6
   Q==;
X-CSE-ConnectionGUID: /Ze4pcvTQpuyzYCiZ4o8GA==
X-CSE-MsgGUID: 6xJsCgaGRe6w46lVmoDKQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1688419"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1688419"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:34:54 -0700
X-CSE-ConnectionGUID: QigCHB+eRra3KI8W7BsTdg==
X-CSE-MsgGUID: Z0gGYDW2RBqwLlpjblv/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4145333"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:34:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9D55D121CBF;
	Mon, 26 Oct 2026 13:34:53 +0200 (EET)
Date: Mon, 26 Oct 2026 13:34:53 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, djrscally@gmail.com,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: i2c: ov7251: Add control event support
Message-ID: <at863XdUDea7JDA8@kekkonen.localdomain>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-4-antoine.pichot@gmail.com>
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
In-Reply-To: <20261026111032.88355-4-antoine.pichot@gmail.com>

Hi Antoine,

On Mon, Oct 26, 2026 at 08:10:28PM +0900, Antoine Pichot wrote:
> The driver exposes writable controls on its subdev node but does not
> support control events, so VIDIOC_SUBSCRIBE_EVENT fails and
> v4l2-compliance reports:
> 
>   fail: v4l2-test-controls.cpp(1128): subscribe event for control
>   'User Controls' failed
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> Set V4L2_SUBDEV_FL_HAS_EVENTS and use the standard control event
> helpers, as other sensor drivers do.
> 
> Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>

Instead of adding explicit support for events, could you instead make the
driver to use sub-device state? See commit
e8a5b1df000e1a23c04dadbe99621441e0889f88 for an example.

-- 
Kind regards,

Sakari Ailus

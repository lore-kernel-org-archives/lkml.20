Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C54C4F6C;
	Fri,  9 Oct 2026 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545967; cv=none; b=o7blJc4DrrKeD87tTa3Dq2E97/f2xIpQw2/5rdloAQz7bFqid9f3npa9ocsLDTLXZbm69e1aVBzsDcws4dbBEc3LykFk4/bltqG/DQ22pyHKF5elsYfRCMIgg5Esba2RXeR2Atzu0rjrTMdXLb7zVSMfiogxoH4Efoxq1gygbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545967; c=relaxed/simple;
	bh=XyQqzU+8QNIzammOFbpxePpG8apNsTjBiyIoesrfVXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDqLHiEAaeMW9up3cBylYjaZEQ5Qyun5aTA0mceHwoLCVLQTszHuN6myKcRFOW25orSTvkh5FrO9gAW7e5C0BfkJipGa4gOkVLa4mrouY6UQgAJEKhjSG5N/il6ZX4PknvkVFxKG64pTFhh+SfiqXPbxzkjajYaHA7XtJf5dqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbNRdt0T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbNRdt0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545959; x=1823081959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XyQqzU+8QNIzammOFbpxePpG8apNsTjBiyIoesrfVXk=;
  b=FbNRdt0TNIF6MObGf+mbFHUJ2IXKIp4XegVIhi3MJ+GMBRjv4eB6XBgX
   +lIXQoPPoq7CNJZXG1RLtpptlulRTYOAj4TLObohj32ylj9nARy/RzRpk
   V0HnUaBHPGrd9OdT/Sorlzcr11xJ86Mg8RtaH0HltzVorhqwnMHXyU8bP
   QrBi+2ZD5g+ZkS/Ey0evKzpVj9ZzTK1CzCgZYjFdUuQ7ZRQ6ZzMZWnPgq
   Yr34V8vJODV/cABMDDiIilez40ugu2PDXynzpNQ18El3Uo0z4pWJwBRuF
   A5fG4JVLsnKMcoPYIPvXVSdwddlKZm0y7lab6bleXLClX/6y3k//Phz6f
   w==;
X-CSE-ConnectionGUID: WNpAb+W3RVGEZsd4wCOXkw==
X-CSE-MsgGUID: 3mFTu6w4SI+hNOH4oIwFvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="248516"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="248516"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:39:19 -0700
X-CSE-ConnectionGUID: b3P3XatKScOT2h+7qSLvEw==
X-CSE-MsgGUID: g+aG3UHTSXuM8KDdDgwQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="306851"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2026 04:39:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 04D0699; Fri, 09 Oct 2026 13:39:16 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:39:15 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: displayport: defer instead of failing
 when the port is not DFP
Message-ID: <asjSY8kEVlo1biOa@black.igk.intel.com>
References: <20261005125645.17899-1-jean-francois.bobier@laposte.net>
 <e416c2c7-4a10-4061-bbb9-cb1aa5958798@laposte.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e416c2c7-4a10-4061-bbb9-cb1aa5958798@laposte.net>

On Mon, Oct 05, 2026 at 03:20:31PM +0200, Jean-Francois Bobier wrote:
> dp_altmode_probe() rejects a port that is not yet TYPEC_HOST with
> -EPROTO. That is a permanent failure: the altmode device stays bound to
> nothing and the driver core never retries it.
> 
> The role is not stable at that point. With a dock, the partner's
> alternate modes are registered while the port is still UFP and the
> data-role swap happens afterwards, so whether DisplayPort comes up at
> all depends on the altmode happening to be registered a second time
> after the swap. On the OnePlus 8T this made DP-over-USB-C work on some
> attaches and not others, with "dp_altmode: probe ... failed with error
> -71" as the only clue.
> 
> Return -EPROBE_DEFER so the core retries once the role settles, and
> release the plug altmode reference obtained earlier in the function
> before doing so -- the very next check in this same function already
> follows that convention on its own early-return path. The leak existed
> on the original -EPROTO path too, but turning a one-shot terminal
> failure into a retried EPROBE_DEFER means it would otherwise repeat on
> every deferred probe attempt instead of happening once.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Release the plug altmode reference before the new -EPROBE_DEFER
>   return, matching the convention the next check in the same function
>   already follows. Not present in v1; found while re-checking usb-next
>   for related in-flight work after v1 was sent, which turned up a
>   since-stalled June 2026 patch proposing the same cleanup on the
>   original -EPROTO path (https://ratatoskr.run/lkml/2026/06/17182803/t).
>   That patch hasn't landed, so this isn't a duplicate, but credit for
>   spotting the leak belongs there, not here.
> 
>  drivers/usb/typec/altmodes/displayport.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c
> b/drivers/usb/typec/altmodes/displayport.c
> index 51c92dd88..91d72789e 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -766,9 +766,21 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	struct dp_altmode *dp;
>  	u32 cap = DP_CAP_CAPABILITY(alt->vdo);
> 
> -	/* Port can only be DFP_U. */
> -	if (typec_altmode_get_data_role(alt) != TYPEC_HOST)
> -		return -EPROTO;
> +	/*
> +	 * Port can only be DFP_U.
> +	 *
> +	 * Defer rather than reject: on a dock the partner registers its
> +	 * altmodes while the port is still UFP, so a hard -EPROTO here drops
> +	 * the DisplayPort altmode permanently and nothing retries it --
> +	 * binding then depends on the altmode happening to be re-registered
> +	 * after the data-role swap. -EPROBE_DEFER makes the driver core retry
> +	 * once the role settles, which is deterministic and stops logging a
> +	 * failure for an ordinary ordering race.
> +	 */
> +	if (typec_altmode_get_data_role(alt) != TYPEC_HOST) {
> +		typec_altmode_put_plug(plug);
> +		return -EPROBE_DEFER;
> +	}
> 
>  	/* Make sure we have compatible pin configurations */
>  	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
> -- 
> 2.55.0

-- 
heikki

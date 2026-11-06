Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986771;
	b=vFjBybVaB9OoqiUvklpTNCub4irAWNP4s0+5NDPcxTgBz8ufCCzivmfcYSXGoQYfPNl4
	 5LKorUJm78Xs8L+Mc4FdQUrMLdDdOvuc2h1YNeRuC8dGJZgdxjQpMMJHUKCXEIKqt7SYr
	 ByqlPWEhoMt49RkafLTz8DE9fg6dG7KLozVCRqiKBhCofpfQKCphLtPD0KeaRq5rotZZT
	 6CCUdGbSeKaph3rDbOlH1WntUxrlvIUf4q8p3GRi4qvqI0hUl5/txRpAQrPor+an++4qr
	 xz304yxzp2gLhlmhZ4g6u3ezf6o+1hwtziad4cmMc3hUdRxOD4gai0jS6Fl+GF6OHrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986771;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gpLucCNwfo9CMk/AZnKDETWmvJoH3FHtadRWwhHA0Wc=;
	b=syTKi/IUL0Y51q5YpgFbYmpuY2jJab0C0CD7YTytBW6brnEyUJKjDcQ88pdbHVdJpd1M
	 xxMYxTxKdzVzdmt31MOMdwmvoyhBA7ZYugjQ+J5l2PI3mw/Y7dxiR8dVHAxk/zPeY0Fzj
	 yy8p8V/aPLDhgJp+r7K7QTYP1c3Tf0OfqxpgIBayZgawB8sMQL9jDBjdf2YSjB+U79WTj
	 rDN19dJxp00Bh5Od53Dq3X3hTIqFyJAthY9G58dAx6F6mnZXWqaAEpBveVx0PDmoB4tro
	 JGd4/5pCWq6Sr7WCgm1dS+nHD3iZYlPCSkPMRCVDttKjNPp88GG0fgbjdvN0Yfyv1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QXIGf7Qw;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4176606A329;
	Fri,  6 Nov 2026 17:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4176606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QXIGf7Qw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793986771; x=1825522771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oUGarqEiEyoJOCbxj6U4ulQ/6uSx+SE0GcKxz9HMhsw=;
  b=QXIGf7Qwkaqfo+Bjjm6/nNjWPKANatBpwnHF5LKRl1qaslHhDWEq56FK
   uL16GYWj9N8tjMuQOQB8NphnODd/6IeWbCc4Cf6LX5iR9G5yXRZCcsu/o
   WwTEdbIPBK5sI9qJ7Ahwth+EnGQe+2VPq66f5uEqi+9eNHvEIIxQzvDyV
   VIxkvzmL0F6PjX018mVJZmV+AzYli+OXrimJlr4oeMuPs+EeOjavohAUu
   GRpPFmVwHMv2gPQE11gWpo63pi2zhxM0e4ZGAofWCa3eCSSp91L6F5Asz
   Nx2yb8z72v1SZo4vZd44OaPWv0Ug/y/zBIs9yMzaj695IAnhF0DyTr6oc
   Q==;
X-CSE-ConnectionGUID: xStAYKUNQbK4bE4a/qedcQ==
X-CSE-MsgGUID: btVG63wcRVCewxxRQYm9Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2697953"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2697953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:39:30 -0800
X-CSE-ConnectionGUID: 4QPQNhxsT223zWuISlcypg==
X-CSE-MsgGUID: nws0Q6TiQ8CezBErYNPIWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7660180"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 06 Nov 2026 09:39:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E8E9799; Fri, 06 Nov 2026 18:39:27 +0100 (CET)
Date: Fri, 6 Nov 2026 18:39:27 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Do not report surplus partner altmodes
 as firmware bug
Message-ID: <au4Qzzl1MxcmD7JU@black.igk.intel.com>
References: <20261103234750.27510-1-pmenzel@molgen.mpg.de>
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
In-Reply-To: <20261103234750.27510-1-pmenzel@molgen.mpg.de>

On Wed, Nov 04, 2026 at 12:47:44AM +0100, Paul Menzel wrote:
> On a Dell XPS 13 9370 (BIOS 1.21.0) with a Dell USB Type-C power adapter
> connected, Linux 7.2.12 logs:
> 
>     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x413c at offset 1, ignoring but please contact the BIOS vendor to fix this issue.
>     ucsi_acpi USBC000:00: con2: VDO mismatch: 0x00000001 vs 0x00000002
> 
> The port advertises one altmode for the Dell SVID, and the partner two
> Modes, with VDOs 0x00000001 and 0x00000002. Only the first one is
> registered:
> 
>     /sys/class/typec/port1/port1.2/svid:413c
>     /sys/class/typec/port1/port1.2/vdo:0x00000001
>     /sys/class/typec/port1-partner/port1-partner.0/svid:413c
>     /sys/class/typec/port1-partner/port1-partner.0/vdo:0x00000001
> 
> A partner supporting more Modes of an SVID than the port is valid. As
> the typec class pairs partner altmodes with port altmodes by SVID only,
> skipping the surplus altmode is correct, but the warning blames the BIOS
> for a configuration that is not a bug at all.
> 
> Report only exact SVID and VDO repeats as firmware bugs, and log a
> surplus partner altmode with a different VDO at debug level. Which
> altmodes are skipped does not change.

I don't know of any system where also the VDO is duplicated, do you?
The duplicated alt mode has usually garbage as its VDO.

Does Dell XPS 13 9370 report duplicated partner TBT3 or DP alt modes?
Most Dell XPS systems have that issue. The problem is that on some
boards the second alt mode is the valid alt mode and on others it's
the first one.

I want to move the global alt mode duplication check to a quirk that
can be used only on systems that need it, or more likely, remove it
completely and leave the alt mode registration to board specific
quirks on these systems that have the problem.

Thanks,

> This also drops the "VDO mismatch" message, which can no longer trigger
> and printed con->partner_altmode[partner_count - 1]->vdo. That indexes
> all partner altmodes with a per-SVID count, so with altmodes of other
> SVIDs registered first, it printed the VDO of an unrelated altmode.
> 
> Fixes: 67c92c6419ea ("usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> 
> Notes:
>     With this change, the Thunderbolt example from commit 67c92c6419ea
>     (VDO 0x8087a043 vs 0x00000001) is only logged at debug level. If that
>     case should stay visible, dev_info() is an alternative to dev_dbg().
>     
>     Tool use: Claude Code (claude-opus-5.5) traced the warning to commit
>     67c92c6419ea, wrote the code change, and drafted the commit message from
>     the dmesg and sysfs output of the affected system.
> 
>  drivers/usb/typec/ucsi/ucsi.c | 43 +++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 5aab8ab9f0132..7edcf9c877ba0 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -531,9 +531,7 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
>  }
>  
>  static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
> -					u8 recipient, u16 svid,
> -					u32 existing_vdo, u32 new_vdo,
> -					int offset)
> +					u8 recipient, u16 svid, int offset)
>  {
>  	static const char * const recipient_names[] = {
>  		[UCSI_RECIPIENT_CON]    = "port",
> @@ -545,11 +543,6 @@ static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
>  	dev_warn(con->ucsi->dev,
>  		 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring but please contact the BIOS vendor to fix this issue.\n",
>  		 con->num, recipient_names[recipient], svid, offset);
> -
> -	if (existing_vdo != new_vdo)
> -		dev_warn(con->ucsi->dev,
> -			 "con%d: VDO mismatch: 0x%08x vs 0x%08x\n",
> -			 con->num, existing_vdo, new_vdo);
>  }
>  
>  /* Count altmodes in @altmodes that advertise @svid. */
> @@ -590,8 +583,9 @@ static int ucsi_altmode_count_svid(struct typec_altmode **altmodes, u16 svid)
>   *     SVID X as the authoritative cap and reject any partner altmode that
>   *     would exceed it. This preserves legitimate multi-Mode partner
>   *     altmodes (e.g. vendor SVIDs that the port really does advertise
> - *     twice) while filtering the firmware-generated duplicates that have
> - *     no port counterpart.
> + *     twice). Only an exact SVID+VDO repeat is reported as a firmware
> + *     bug: a partner may legitimately support more Modes of an SVID than
> + *     the port, so a surplus altmode with a different VDO is just skipped.
>   */
>  static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
>  				      const struct ucsi_altmode *alt_batch, int batch_idx,
> @@ -605,7 +599,7 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
>  	for (k = 0; k < batch_idx; k++) {
>  		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
>  			ucsi_dump_duplicate_altmode(con, recipient, svid,
> -						    vdo, vdo, offset);
> +						    offset);
>  			return true;
>  		}
>  	}
> @@ -620,13 +614,10 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
>  		port_count = ucsi_altmode_count_svid(con->port_altmode, svid);
>  		partner_count = ucsi_altmode_count_svid(con->partner_altmode,
>  							svid);
> -		if (port_count && partner_count >= port_count) {
> -			ucsi_dump_duplicate_altmode(con, recipient, svid,
> -						    con->partner_altmode[partner_count - 1]->vdo,
> -						    vdo, offset);
> -			return true;
> -		}
> -		return false;
> +		if (!port_count || partner_count < port_count)
> +			return false;
> +		altmodes = con->partner_altmode;
> +		break;
>  	case UCSI_RECIPIENT_CON:
>  		altmodes = con->port_altmode;
>  		break;
> @@ -637,7 +628,7 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
>  		return false;
>  	}
>  
> -	/* CON and SOP_P: drop only exact SVID+VDO duplicates. */
> +	/* Report exact SVID+VDO duplicates as firmware bugs. */
>  	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
>  		if (!altmodes[k])
>  			break;
> @@ -645,12 +636,20 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
>  		if (altmodes[k]->svid != svid || altmodes[k]->vdo != vdo)
>  			continue;
>  
> -		ucsi_dump_duplicate_altmode(con, recipient, svid,
> -					    altmodes[k]->vdo, vdo, offset);
> +		ucsi_dump_duplicate_altmode(con, recipient, svid, offset);
>  		return true;
>  	}
>  
> -	return false;
> +	/* CON and SOP_P: anything else is a distinct altmode. */
> +	if (recipient != UCSI_RECIPIENT_SOP)
> +		return false;
> +
> +	/* SOP: a further Mode of the SVID, but no port altmode to pair with. */
> +	dev_dbg(con->ucsi->dev,
> +		"con%d: partner altmode SVID 0x%04x VDO 0x%08x at offset %d exceeds the %d port altmode(s), ignoring\n",
> +		con->num, svid, vdo, offset, port_count);
> +
> +	return true;
>  }
>  
>  static int
> -- 
> 2.54.0

-- 
heikki

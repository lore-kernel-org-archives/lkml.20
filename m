Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC351DE17;
	Tue, 22 Sep 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074234; cv=none; b=imZW64Uikdntp7efZLk8M9s0BgHKwiUlUr3hWFalHTS/kwZVi60GevboZFZ/AMvQcTE1uBW1nLCtX+BzWdzoJYoCS/xP68R4PhRMyvl9zM7Z4PuAxPtLL9YgNctlrcQmUIQtzt+uMBbx/Sd15UrDdckvYrpvbI0uy/MSBdsKtpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074234; c=relaxed/simple;
	bh=vvyUO6WqkX3IJfJf7j/ASgs0PuKjpOW3rCDdiocDnwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twMqvQvotHqbAYy+qR1k2ywlU4L6ODMtbkI9ELMH31FJyWbf0A3FPXzw9SlUVfAekaXDgu2dJi8TKGFcct3ZVaa9L89fCdg5XmF8xBp/f8umEL8v2tcoenutDqBlnSzZRNMxCV9xjJ+8TjrHsTpj8oq5102DFgayCQaCtrLi4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKhoJADp; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKhoJADp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790074232; x=1821610232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vvyUO6WqkX3IJfJf7j/ASgs0PuKjpOW3rCDdiocDnwM=;
  b=WKhoJADpprwz4YklhZ7gbcRFwzxUOpj+CBPhsfZj7t5LPdrhJpl/nniT
   Qi1koX6fDIyNXg+upMy992rXShev4UdRWQbAjXTqSE8oEzkm82PJnSxCE
   yY+MhKgFz3cKlPV3MeNCnlzCPQ3Gqlzs+vqlxX7s/m9Jh8lNdVMP8lr7I
   /cqVsoiQZ2VWl+rnVZi3n3f1uvaM7DFCH4Z95Uq4DzNfpGb/JgYMrSDGv
   jSKs91kQ7SUf9kq3WRIEdsbaDc48gOfzpZg2qQMQaikeCRscZBkUYuPyH
   V1QRx3SNdf1pHQ6M+IlTtGQOuNpzIyC71JAoONFDUdcuos+8orDBdVRbE
   A==;
X-CSE-ConnectionGUID: o52zPRVBTS2/IdQmb4U9+Q==
X-CSE-MsgGUID: QO5lDF9ESCWl9JS/ywN8JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1168350"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1168350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 03:50:31 -0700
X-CSE-ConnectionGUID: 1f98lJf4Sh+GGC0PEVTaTw==
X-CSE-MsgGUID: Gdhe+zeOQfeDsHFy+RbQsg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 03:50:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B632199; Tue, 22 Sep 2026 12:50:23 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:50:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com,
	RD Babiera <rdbabiera@google.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Message-ID: <arJdb9kip_YCzjV2@black.igk.intel.com>
References: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com>

+RD

On Wed, Sep 16, 2026 at 12:39:57PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism
> for Discover Identity VDMs") advances vdm_discovery_state to
> VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
> advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.
> 
> This can re-arm another vdm_discovery_work if the port is going to
> respond with PD_CTRL_NOT_SUPP to the partner.
> 
>   tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
>     tcpm_queue_message();
>       mod_tcpm_delayed_work();
>         tcpm_state_machine_work()
>           tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
>           run_state_machine()
>             case SRC_READY:
>             case SNK_READY:
>               mod_vdm_discovery_delayed_work(port, 0);
> 
> If both the port and its partner do not support modal operation, they
> will send DISCOVER_IDENTITY to each other infinitely.
> 
> Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
> well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it comes
> from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes from a
> cable.
> 
> Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko
>  - kick off vdm_discovery work to continue working
>  - correct previous wrong fix commit id
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa2085..5cea820e00c4 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3891,6 +3891,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		case SRC_READY:
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
> +				if (port->ams == DISCOVER_IDENTITY) {
> +					if (rx_sop_type == TCPC_TX_SOP) {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_COMPLETE);
> +					} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_CABLE_IDENT);
> +						mod_vdm_discovery_delayed_work(port, 0);
> +					}
> +				}
>  				port->vdm_state = VDM_STATE_DONE;
>  				if (tcpm_vdm_ams(port))
>  					tcpm_ams_finish(port);
> -- 
> 2.34.1

-- 
heikki

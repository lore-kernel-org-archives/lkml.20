Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1653D8900;
	Fri, 18 Sep 2026 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718002; cv=none; b=QWgzL62OkkFTQq/JomNmATlMMep3At4jXGkQMRazwlw2jtOZRAN17bEvV+yKRVMdXtPKiE7LUmE8D7vqDmpnPp7bgGEANH2vsBF5eVSGuJ/E4Vp5wfonPIwmTCactaUhsM7BqzKb3z38MQt8T9D3061WgDhtnRT/3OqDdZFHsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718002; c=relaxed/simple;
	bh=1kalJkD2AC88fzQVG0vNoQck71hbfcCsC1uiYAkmkE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBorHifmZigkxvc03xnejzpjo52ZtqSUxRdEm0jFNfnHbeT7Uuot5zndWZnq21EosulKfSKkPXW/AoGHayfs8BRH7hruEIGj7rzwWCK3RsoefmT/N6fh04+WLnqXPzCNJoqd9pBLIeqGYgBec7zn3N1CKJj2pHgpbirsIwu8Hdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV6beOBw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV6beOBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789718001; x=1821254001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1kalJkD2AC88fzQVG0vNoQck71hbfcCsC1uiYAkmkE0=;
  b=LV6beOBwiiaV9JZWHkuOJsGX2P8EI3B5Bl2pwrefuOzovYtkNaCK9NGN
   4xPidkOIFhG4dnEC6C5WQC/5g2Zg8BE94uVrTZQX8d2dhLdhXWYgqEKi0
   tWcC3cN1kunUvoW7Cl0l9kGDNXp61PKh2EejQVEbFvUTtG+6cCQMpe12X
   L2AMlJ2LoFP/htfLbxWgjil+ZHW6Rt6vqWW1JdBIzlWG93g8L0dK1asCZ
   Ya1piXd57HSuyKB8vQmLIzOa4Pl0WwhnWzo7GVcpLaIDZHCpD2ETMGNKA
   C0k8BlcYaFIPHEAZfq/j/6ZCbdFAroPxf/iBVmcmgHXovoW7vDWkU02f5
   w==;
X-CSE-ConnectionGUID: KxCFZBw9R96C7ZNJMNj4DA==
X-CSE-MsgGUID: m8p1l/bYR7efD5uVdBvVew==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100803041"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100803041"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:53:20 -0700
X-CSE-ConnectionGUID: RiNtwVriQZaCxAyHeSuvCg==
X-CSE-MsgGUID: oJy3azIKS/6kIjzAeA2nzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="299371428"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2026 00:53:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2178F99; Fri, 18 Sep 2026 09:53:17 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:53:17 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Message-ID: <aqzt7dDNdHd22rY3@black.igk.intel.com>
References: <20260914093828.1910201-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914093828.1910201-1-xu.yang_2@oss.nxp.com>

On Mon, Sep 14, 2026 at 05:38:28PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Commit fa4d0a7cd036 ("usb: typec: tcpm: fix Discover Identity retry loop
> on Control Message reject") advances vdm_discovery_state to
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
> well, mirroring the existing handling for the SVDM CMDT_RSP_NAK case.
> 
> Fixes: fa4d0a7cd036 ("usb: typec: tcpm: fix Discover Identity retry loop on Control Message reject")

I can't find that commit from anywhere?

Thanks,

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa2085..cc9ea5d5e78a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3891,6 +3891,9 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		case SRC_READY:
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
> +				if (port->ams == DISCOVER_IDENTITY)
> +					tcpm_update_vdm_discovery_state(port,
> +									VDM_DISCOVERY_COMPLETE);
>  				port->vdm_state = VDM_STATE_DONE;
>  				if (tcpm_vdm_ams(port))
>  					tcpm_ams_finish(port);
> -- 
> 2.34.1

-- 
heikki

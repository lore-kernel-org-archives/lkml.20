Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A03B8BC6;
	Mon, 28 Sep 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600287; cv=none; b=QRtpXDuXXuDo+5O8XE1q3G/T9auV6o1xyQIk2ZdcPrhvrasxf53v1kL6xqJfQTlrb11vndvEMyoeu05oD+q8tNMSVaiBHlD8c4ln04uu8TiTI8VIapLRSAbxE0plDWtc0YSjYqSaVYXZ8Fj/QO+/JOLlHM4D3PXDSZkhipIqU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600287; c=relaxed/simple;
	bh=QGMT5e++tACn46+4FFxOLS4u0Q88D+y8NooM6+9yh5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KigFLdEh3lAmBqflye3bzrp+87+L/XccXSVSQZKxBYQvX/2pJcdyvLnU3rR16y+Sc+A7zOHzWu1Zyv/MbL6kywVhORDyMnDgioo2iSPCUA8vM4k6cjRcl6UixyQ9C43pioIZstsWRvuUZyzhWFyU2wK58DQpXcdKCVsArAnzVWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAI68bah; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAI68bah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790600286; x=1822136286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QGMT5e++tACn46+4FFxOLS4u0Q88D+y8NooM6+9yh5g=;
  b=TAI68bah7aefjnbb7Z8yIObHqWs/TtlWr1ULhvcmFLniy2tXwneBe6N2
   1+NS9Oy+m5n2pEAKUlYMt48/Avoxph89W3cnz4FWxJ1l/bBkwceVCIyvR
   rYLYpyktKLgU2+10+KlN/DsFF9KvRM0EaUjnpVBr0zlANPi35JmfsoyZU
   +VK+Q8Jt2JgVJWu3qmuaCtzbKFescgYrr2eNqoFz1UmHsHsA+mBcfWO+A
   XYrMe1tryElG2bvRRB1gDL40DgOShAexu6YIhJwmAree/EnRdDOB2kHPE
   V48lqck7CfI5oAS9d1zgFR92gdM26M7nvoYGDxIQCpXFgRDQxRteUKZzj
   g==;
X-CSE-ConnectionGUID: qVo3jkg5QBK9YWJ/ybqlyg==
X-CSE-MsgGUID: tpfVEE5wTl2DQjrvBdZdIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90515600"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90515600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:58:06 -0700
X-CSE-ConnectionGUID: wNZP/cTySYauBwzqOY5iQg==
X-CSE-MsgGUID: Ahnhv6lMQm6R8u3d/zhx7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="271533145"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 28 Sep 2026 05:58:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D4D1C99; Mon, 28 Sep 2026 14:58:02 +0200 (CEST)
Date: Mon, 28 Sep 2026 14:58:02 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Message-ID: <arpkWnX7k4c45vCP@black.igk.intel.com>
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

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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

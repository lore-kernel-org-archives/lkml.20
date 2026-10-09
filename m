Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903D4C10D1;
	Fri,  9 Oct 2026 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545359; cv=none; b=LHQ3AlvH0PU2bzEci/PbKA3AFnZbB1m0w6QcQQkaHk26bi1CGtHUXA2wsmX8IsnvwsqrtPf/Z/L+qmh7TNpzEsqjOPnSMR8ocOndpfKeN11HeRypL6PHVhTv2fXNYxkg1FTo3FybsgpUkNoDQRQ2tSXbddsTU74sohwciWXpIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545359; c=relaxed/simple;
	bh=Co7woE4HmZ70Ip79dtMQsK+thPOuVw8r2SOQfVGK7Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cR3FLkQOhEFiEUCWfaiQ09iC4tbd+6A0rt0gdNxtJdD9l/u+SvvQ4bSb7H33VYQcFXfr2iM5Ch8YdsGcu7YV9B5sspT/+SjwGtHFhA3HqaQjrWDYoa1HWeBknhTwGtBsctYZdykpvPg1+CPS25EQMR0jVJpRpeiVxxkTaV0OtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJSAmpUx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJSAmpUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545351; x=1823081351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Co7woE4HmZ70Ip79dtMQsK+thPOuVw8r2SOQfVGK7Wg=;
  b=MJSAmpUxTbFHSZ0jHCNCU5rDxQCvueSvR5R21MxnkQbH5qjGm+DJ7Ykz
   k0BE/cXu8phrvM5S4ujK/3P9+rtAGTNV6pzB0g26m6mQZp5C31y873w0F
   1QkeZtut6KQo6wsAa383bWWxN+rQ94FL9vXfcIiDHkW9REu81EKoi7FeA
   Z3gBIV9/Z6phcjcEWt8aa/KxvNcACKg1NffzXvHaqbyQ28FhRYCqwsGKV
   nk4kVm9quZ3g3m+kkP+xX661lhj3Z0ZH+FYO0HIYoYAEv9KLzroPgtYIf
   ZGXKKJ+CSN1b57OJ9yrhs9juDdJAbymRCNBTXAqF1SKinvT3kyQp2M8UJ
   w==;
X-CSE-ConnectionGUID: FCFnuadbQ7G3fRlOGFUbFQ==
X-CSE-MsgGUID: JojQJrNJQseIs055fflXZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="222907"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="222907"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:29:10 -0700
X-CSE-ConnectionGUID: TQOaNMgYT/is9sC9axJRxA==
X-CSE-MsgGUID: RR1spOxlRjGaLAiHWxzDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="253905"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2026 04:29:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B886E99; Fri, 09 Oct 2026 13:29:05 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:29:05 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
	Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: Allow configuring tSenderResponse
 via fwnode
Message-ID: <asjQAWEWzBX8-qrV@black.igk.intel.com>
References: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
 <20261004-tcpm-sender-response-time-v1-2-3f8b43084acc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004-tcpm-sender-response-time-v1-2-3f8b43084acc@google.com>

On Sun, Oct 04, 2026 at 02:58:29AM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> The USB PD specification defines a range of values for tSenderResponse.
> TCPM currently uses a fixed, relaxed value of 60 ms
> (PD_T_SENDER_RESPONSE), which may not suit all platforms.
> 
> Allow platforms to specify their own tSenderResponse deadline through
> the "sender-response-time-ms" fwnode property. Platforms that do not
> set the property keep the existing 60 ms default.
> 
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa2085..9f98c87957b1 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -399,12 +399,14 @@ struct pd_revision_info {
>   * @sink_wait_cap_time: Deadline (in ms) for tTypeCSinkWaitCap timer
>   * @ps_src_wait_off_time: Deadline (in ms) for tPSSourceOff timer
>   * @cc_debounce_time: Deadline (in ms) for tCCDebounce timer
> + * @sender_response_time: Deadline (in ms) for tSenderResponse timer
>   */
>  struct pd_timings {
>  	u32 sink_wait_cap_time;
>  	u32 ps_src_off_time;
>  	u32 cc_debounce_time;
>  	u32 snk_bc12_cmpletion_time;
> +	u32 sender_response_time;
>  };
>  
>  /* Convert microwatt to watt */
> @@ -4316,7 +4318,7 @@ static bool tcpm_send_queued_message(struct tcpm_port *port)
>  			} else if (port->pwr_role == TYPEC_SOURCE) {
>  				tcpm_ams_finish(port);
>  				tcpm_set_state(port, HARD_RESET_SEND,
> -					       PD_T_SENDER_RESPONSE);
> +					       port->timings.sender_response_time);
>  			} else {
>  				tcpm_ams_finish(port);
>  			}
> @@ -5549,7 +5551,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			port->caps_count = 0;
>  			port->pd_capable = true;
>  			tcpm_set_state_cond(port, SRC_SEND_CAPABILITIES_TIMEOUT,
> -					    PD_T_SENDER_RESPONSE);
> +					    port->timings.sender_response_time);
>  		}
>  		break;
>  	case SRC_SEND_CAPABILITIES_TIMEOUT:
> @@ -5896,7 +5898,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
>  		} else {
>  			tcpm_set_state_cond(port, hard_reset_state(port),
> -					    PD_T_SENDER_RESPONSE);
> +					    port->timings.sender_response_time);
>  		}
>  		break;
>  	case SNK_NEGOTIATE_PPS_CAPABILITIES:
> @@ -5921,7 +5923,7 @@ static void run_state_machine(struct tcpm_port *port)
>  				tcpm_set_state(port, SNK_READY, 0);
>  		} else {
>  			tcpm_set_state_cond(port, hard_reset_state(port),
> -					    PD_T_SENDER_RESPONSE);
> +					    port->timings.sender_response_time);
>  		}
>  		break;
>  	case SNK_TRANSITION_SINK:
> @@ -6208,7 +6210,8 @@ static void run_state_machine(struct tcpm_port *port)
>  			port->message_id_prime = 0;
>  			port->rx_msgid_prime = -1;
>  			tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TCPC_TX_SOP_PRIME);
> -			tcpm_set_state_cond(port, ready_state(port), PD_T_SENDER_RESPONSE);
> +			tcpm_set_state_cond(port, ready_state(port),
> +					    port->timings.sender_response_time);
>  		} else {
>  			port->message_id = 0;
>  			port->rx_msgid = -1;
> @@ -6218,7 +6221,7 @@ static void run_state_machine(struct tcpm_port *port)
>  				tcpm_set_state_cond(port, hard_reset_state(port), 0);
>  			else
>  				tcpm_set_state_cond(port, hard_reset_state(port),
> -						    PD_T_SENDER_RESPONSE);
> +						    port->timings.sender_response_time);
>  		}
>  		break;
>  
> @@ -6226,7 +6229,7 @@ static void run_state_machine(struct tcpm_port *port)
>  	case DR_SWAP_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
>  		tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
> -				    PD_T_SENDER_RESPONSE);
> +				    port->timings.sender_response_time);
>  		break;
>  	case DR_SWAP_ACCEPT:
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
> @@ -6256,7 +6259,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, ERROR_RECOVERY, 0);
>  			break;
>  		}
> -		tcpm_set_state_cond(port, FR_SWAP_SEND_TIMEOUT, PD_T_SENDER_RESPONSE);
> +		tcpm_set_state_cond(port, FR_SWAP_SEND_TIMEOUT, port->timings.sender_response_time);
>  		break;
>  	case FR_SWAP_SEND_TIMEOUT:
>  		tcpm_set_state(port, ERROR_RECOVERY, 0);
> @@ -6288,7 +6291,7 @@ static void run_state_machine(struct tcpm_port *port)
>  	case PR_SWAP_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_PR_SWAP, TCPC_TX_SOP);
>  		tcpm_set_state_cond(port, PR_SWAP_SEND_TIMEOUT,
> -				    PD_T_SENDER_RESPONSE);
> +				    port->timings.sender_response_time);
>  		break;
>  	case PR_SWAP_SEND_TIMEOUT:
>  		tcpm_swap_complete(port, -ETIMEDOUT);
> @@ -6385,7 +6388,7 @@ static void run_state_machine(struct tcpm_port *port)
>  	case VCONN_SWAP_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_VCONN_SWAP, TCPC_TX_SOP);
>  		tcpm_set_state(port, VCONN_SWAP_SEND_TIMEOUT,
> -			       PD_T_SENDER_RESPONSE);
> +			       port->timings.sender_response_time);
>  		break;
>  	case VCONN_SWAP_SEND_TIMEOUT:
>  		tcpm_swap_complete(port, -ETIMEDOUT);
> @@ -6467,7 +6470,7 @@ static void run_state_machine(struct tcpm_port *port)
>  	case GET_STATUS_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_GET_STATUS, TCPC_TX_SOP);
>  		tcpm_set_state(port, GET_STATUS_SEND_TIMEOUT,
> -			       PD_T_SENDER_RESPONSE);
> +			       port->timings.sender_response_time);
>  		break;
>  	case GET_STATUS_SEND_TIMEOUT:
>  		tcpm_set_state(port, ready_state(port), 0);
> @@ -6475,14 +6478,14 @@ static void run_state_machine(struct tcpm_port *port)
>  	case GET_PPS_STATUS_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_GET_PPS_STATUS, TCPC_TX_SOP);
>  		tcpm_set_state(port, GET_PPS_STATUS_SEND_TIMEOUT,
> -			       PD_T_SENDER_RESPONSE);
> +			       port->timings.sender_response_time);
>  		break;
>  	case GET_PPS_STATUS_SEND_TIMEOUT:
>  		tcpm_set_state(port, ready_state(port), 0);
>  		break;
>  	case GET_SINK_CAP:
>  		tcpm_pd_send_control(port, PD_CTRL_GET_SINK_CAP, TCPC_TX_SOP);
> -		tcpm_set_state(port, GET_SINK_CAP_TIMEOUT, PD_T_SENDER_RESPONSE);
> +		tcpm_set_state(port, GET_SINK_CAP_TIMEOUT, port->timings.sender_response_time);
>  		break;
>  	case GET_SINK_CAP_TIMEOUT:
>  		port->sink_cap_done = true;
> @@ -8160,6 +8163,12 @@ static void tcpm_fw_get_timings(struct tcpm_port *port, struct fwnode_handle *fw
>  	ret = fwnode_property_read_u32(fwnode, "sink-bc12-completion-time-ms", &val);
>  	if (!ret)
>  		port->timings.snk_bc12_cmpletion_time = val;
> +
> +	ret = fwnode_property_read_u32(fwnode, "sender-response-time-ms", &val);
> +	if (!ret)
> +		port->timings.sender_response_time = val;
> +	else
> +		port->timings.sender_response_time = PD_T_SENDER_RESPONSE;
>  }
>  
>  static void tcpm_fw_get_pd_ident(struct tcpm_port *port)
> 
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

-- 
heikki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968755;
	b=hoJtJjEh/ZpQwRT9UxX/V1KMaS2f68yJ0VIo+Ykot3gvTpR75vxysg29lGenBmzLHju/
	 fyD6sInBkWTq94KGOTXKYI1NwRwe9JddTbtJkL1hAdGwukJNewzOZOuA44NEHntgIJUII
	 RDBCQAGdz9bJ4u5BTduJOuWv8zQ1bzf2CxxNa88jr/+34MwkuXE8QOlI7iwORyjgZkW1H
	 9t4SpicyehhsefIo0YXwVWinyWayal4q9kIlTKkRWzXczZOlfQObvo2kV29/lPfHhAdvH
	 VhFmJ7SoVYs2EdzuhAR5gUAxCfvTraT9HkfQZUlfd4s+5eYOQQ2wBqD06LLK8mE5eHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968755;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Jv9BjT5rPlXMxhVAAGgckLW4HJ6LS8pG25jymZiZcwI=;
	b=c8MJh4EMckhNXrPIYVfnpazE8fSn0kW+w2+c/HCy6W0jb5l6J10DmRMdF5W2PcuJ9E0B
	 HlqfEmffu//hSPOLSUm8HcH23OIbP3VghDDOjozLG2RwDO35bV9FwKqLOZqcue7ic6spr
	 ny112cXiHJ27LZBfj8yvqwWk/GdHhdvagPkIxt+JmVU8vIrV2SxhkoQRH7xiWMSq5hM8n
	 oKnAQOjpBMsBRQVJON5r1HMWxcqjrc2Ph9MfA3M2Q6+xjMH64SHzImW1iXtE9c6CjT57c
	 E4Fb7R+FEVRJoFOzDNehcgUVKaodVJbfdY2kxxX4/amlm/YvJkWZFegsV+wLvjBTruA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DftmM/pW";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D2606A32F;
	Fri,  6 Nov 2026 12:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398D2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DftmM/pW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793968755; x=1825504755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zw9yNBbukFlVCZOIwf6Jb11Yr7CgjJugTt9KNNA9rho=;
  b=DftmM/pWRspGc5AFlaI86i05ifLtcG3oGL1sYP1uECYKlLaij6yQeacc
   iVSQSEGgBsaOJ16vT038l4XwBijC2gNhZ3/eN5qHkuAysxX8THlwqy8MT
   CMz6rL7h/1xNgXp6elwinszuEYlyqwlRB8g3llFKBki/tDXr8PSCBOG5E
   xbwgIf+UjWeFFbb+n8GFNS8X3FWZ2dKn7G7U99BXn6fyD+dtRGsFNSIdc
   1fNVATWVTQlWtzHvMrmPEM/JCIlmqvuoL1SIcsa0wyultvEij2YAzyh5C
   szyS0smZwGnkV5cOuqYrvtjGG6wmuB5I6DZ7xYN8lEm9Msz7X/WGJE4DC
   Q==;
X-CSE-ConnectionGUID: u7P2C88OTMiTs0fA5ZNKWg==
X-CSE-MsgGUID: aAKYylXTQlan/gAvlJXP0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2665628"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2665628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:39:02 -0800
X-CSE-ConnectionGUID: vrGw8kM4Q6C9VMbHsjSiOQ==
X-CSE-MsgGUID: swvuZCQpQ4O2yeFbowREag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7599727"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2026 04:39:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id CF60C99; Fri, 06 Nov 2026 13:38:58 +0100 (CET)
Date: Fri, 6 Nov 2026 13:38:58 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged
 Get_Source_Cap_Extended
Message-ID: <au3KYk13lFTjhltb@black.igk.intel.com>
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>
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
In-Reply-To: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>

On Mon, Nov 02, 2026 at 05:09:05PM +0400, Alexey Charkov wrote:
> The chip mistakes Get_Source_Cap_Extended for a GoodCRC, as it apparently
> decodes only the low four bits of the message type. As a result, it sends
> no GoodCRC for it, but still queues it in the RX FIFO. The partner never
> sees the message as delivered due to no GoodCRC, so it retries and then
> sends a Soft_Reset. When FUSB302 receives the Soft_Reset, it finally
> raises its interrupt, at which point TCPM sees Get_Source_Cap_Extended in
> the RX FIFO instead of the Soft_Reset it just received, and answers it
> Not_Supported, which is not a valid reply to Soft_Reset, so the partner
> escalates to a hard reset instead of getting a chance to gracefully handle
> a lost Get_Source_Cap_Extended.
> 
> Discard Get_Source_Cap_Extended, which FUSB302 can never properly receive
> due to its inability to automatically GoodCRC it, and answering it from
> the host within the protocol specified 250us window without so much as an
> interrupt cannot be made to work.
> 
> This way the TCPM view of the PD exchange at least matches what the
> partner saw on the wire. This lets the TCPM complete a PD negotiation over
> the FUSB302 with e.g. an Apple Studio Display, which otherwise always ends
> in hard resets.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 3319f6a2b0c9..96dc48250d6a 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1463,6 +1463,19 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
>  	fusb302_log(chip, "PD message header: %x", msg->header);
>  	fusb302_log(chip, "PD message len: %d", len);
>  
> +	/*
> +	 * The chip only decodes the low four bits of the message type, so it
> +	 * mistakes Get_Source_Cap_Extended (17) for a GoodCRC (1): it neither
> +	 * acknowledges it nor raises GCRCSENT, yet still queues it in the RX
> +	 * FIFO. Without a GoodCRC the partner never considers it delivered and
> +	 * will retry and then soft reset, so it must not be answered.
> +	 */
> +	if ((!len) &&
> +	    (pd_header_type_le(msg->header) == PD_CTRL_GET_SOURCE_CAP_EXT)) {
> +		fusb302_log(chip, "dropping unacknowledged PD message");
> +		return ret;
> +	}
> +
>  	/*
>  	 * Check if we've read off a GoodCRC message. If so then indicate to
>  	 * TCPM that the previous transmission has completed. Otherwise we pass
> 
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-fusb302-getsourcecap-01c38dccb230
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>

-- 
heikki

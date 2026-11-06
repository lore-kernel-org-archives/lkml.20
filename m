Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969063;
	b=KqucZn/5VMnkOYF1puOSaHT+oRfGm3tEH3w+RKr+WhXjQZ6XHNLjMYFKJGWEfx8FOltq
	 qQpYFqY3op5lmIdLEyQKyV/nX8Q61ScB4o6BQSU1TGiXWAlA4n3meFu+kR67DXcB5nOxk
	 NCssMZF/ldH7YhaECJFW6/IyAo5bfzbhotDclhcfW5vaq/6IYEmuNJjnfFQGPxLQmWy32
	 drjs4Xq8suDgtrh2DkjkGbxYRVMskKNcrLWFO16CUYqgyy/sFwdOkqsCpktxFzyEhGIus
	 /ohAvlbFaW67h7rEsroyp5vmTXB2OPQ9M8xE+IXXFbbIZgdZ2DdjikT/NzKgtYGZaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nfK2PWnSSClqPpf5/Zg0SPfib+pYdM9HTX5+3ba+8T4=;
	b=YSSLO5Ihqw3E2a5aDgaPqnKvr8A3MRAOqDdtlhdPa5fCiu50Wr8wjTVtL57HAx3FB+zB
	 vFQeKloemu0Z0pEreEpYays2ojeVwk/sBRjZKel6jpE+HN5W60hzdwH82XZGpbOMPCObk
	 y3HdJtloFMezBmT5ehHNoSFBQFdEv1/gyd/ZJ5ogh9VySNSd1pBjqJ2nPXNXclElfVUq6
	 ZsjX7ykz2Y/EbMiV6yjtZ09PsBwcSsa4D8lQPQ0t7jgLA7gCNmzPdVqgziL1iKfKi717g
	 UAxZXqcGZgYLP5PtHIRAEGx+Le4xKgyeJu/09hODhQJv7sKx5tlZfxSjTSjHYSEyIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kdW9s2O2;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22259606A32D;
	Fri,  6 Nov 2026 12:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22259606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kdW9s2O2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793969062; x=1825505062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qhHM4ueFZd0a7TlGTz5pNWFdYoM8f/7u5CGqPqtWf3E=;
  b=kdW9s2O2mCJHvfJKNzJb386Kwy6ANoR8G9tvKmC7y1WCVKQBrnOFwlWi
   ossnZJ4mUamlNGWa1KT1fPMWeH9Pecm+3dRIRS7Re2DbY+Tacu4ywuyr0
   sxddmmRbHqLlbvCIJqzZRBDsHm+uou9iWqXFwidR0uFovfKh0uuN35PRv
   5ZQadHremsajq3XEXhpD8C8Ue7OgUjxbE8Txgcfsr+z9YLg3E9CdcFMB2
   yMNFnT495GRGOxyRtYea4bNeFuw1VXGK+n4CsiEW+wgCEE5GaW8pibf0F
   AyywY7KVYzLGmU/OZoohoBF3vyYl7i0/ZQKdqwuFl1Dar4hdFpsv5bzAT
   g==;
X-CSE-ConnectionGUID: mS2BkjYCTaKw1I9LfnLsSA==
X-CSE-MsgGUID: js+q21biTaqFlgSYd2Sw3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2668721"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2668721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:44:21 -0800
X-CSE-ConnectionGUID: FW/1uDk2TtWFIOdn65UpcQ==
X-CSE-MsgGUID: u24jSQR9SMSx3TnvlcVS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7389213"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2026 04:44:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 296EA99; Fri, 06 Nov 2026 13:44:19 +0100 (CET)
Date: Fri, 6 Nov 2026 13:44:19 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Send PD messages longer than one
 SMBus block
Message-ID: <au3Lo_HFgW6tUZri@black.igk.intel.com>
References: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>
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
In-Reply-To: <20261102-fusb302-long-tx-v1-1-0d2719488c3b@flipper.net>

On Mon, Nov 02, 2026 at 05:44:38PM +0400, Alexey Charkov wrote:
> The whole message, tokens included, goes to the FIFO in a single SMBus
> block write, which carries at most 32 bytes and silently drops the rest.
> A message with six or seven data objects needs up to 39, so it loses its
> closing tokens including TXON: the chip never sends it, the transmission
> times out, and the truncated bytes stay in the TX FIFO ahead of the next
> message. A Discover Identity ACK carrying a full set of sink-vdos is one
> such message, as is a Source_Capabilities with six or seven PDOs.
> 
> Write the message in chunks of at most one SMBus block. The FIFOS
> register has no address auto-increment and queues every byte written to
> it, so consecutive writes append to the 48-byte TX FIFO. TXON is the
> one token that is not queued but starts the transmitter as soon as it is
> written. It still comes last, so transmission begins only once the whole
> message is in the FIFO, as the datasheet recommends.
> 
> Flush the TX FIFO if a write fails, so that a partial message cannot
> stay queued and go out together with the next one as a garbled frame.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 3319f6a2b0c9..e10b7a4b679f 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -967,6 +967,7 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
>  	int ret = 0;
>  	u8 buf[40];
>  	u8 pos = 0;
> +	u8 i;
>  	int len;
>  
>  	/* SOP tokens */
> @@ -1001,9 +1002,23 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
>  	/* start transmission */
>  	buf[pos++] = FUSB302_TKN_TXON;
>  
> -	ret = fusb302_i2c_block_write(chip, FUSB_REG_FIFOS, pos, buf);
> -	if (ret < 0)
> -		return ret;
> +	/*
> +	 * An SMBus block write carries at most I2C_SMBUS_BLOCK_MAX bytes, and
> +	 * a message with more than five data objects needs more. The FIFO
> +	 * register queues every byte written to it except TXON, which starts
> +	 * the transmitter instead. TXON comes last, so the message can go out
> +	 * in several writes.
> +	 */
> +	for (i = 0; i < pos; i += I2C_SMBUS_BLOCK_MAX) {
> +		ret = fusb302_i2c_block_write(chip, FUSB_REG_FIFOS,
> +					      min_t(u8, pos - i, I2C_SMBUS_BLOCK_MAX),
> +					      &buf[i]);
> +		if (ret < 0) {
> +			/* don't leave a partial message ahead of the next one */
> +			fusb302_pd_tx_flush(chip);
> +			return ret;
> +		}
> +	}
>  	fusb302_log(chip, "sending PD message header: %x", msg->header);
>  	fusb302_log(chip, "sending PD message len: %d", len);
>  
> 
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-fusb302-long-tx-d2d06ed2a937
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>
> 

-- 
heikki

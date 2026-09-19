Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D464335C6AE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779281; cv=none; b=PZZUcPtNcbpXNqrW1OIz+VyRfHE+DRUK3xQo0mcOj9jMP/EvEFFm3+lKIAd8HxnTQ4dkUSJkz4AJeOWaNafwYKXTsEnV2poMQC0N7ZD8/cJC3Wh9WhzmjpFfTtFEc4SOFacm4MG/gQyZXUo8+z5ixOoFQW/GGbchOZaBmA1+w/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779281; c=relaxed/simple;
	bh=QOhBEfG4yrhp+FTxVrBTMzSlWRARVPYUlGxnIlFF3kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAomg6ckhDVVxdZbcb6SSAwMCem3x9Hfq03UkVzkpPFuHRZOW+yoBLPuLEqqrterRdJdO9mflAnGIqHmP4WWMXDsgcmPTbYODcdQR40qD3VU8X8y4fh0BdMp6b/kOhU434DWTGkDZZAVjCuUzqOX0gZKF3foFB5mLNEPmAkDvCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=vfutVT7Q; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="vfutVT7Q"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1102688a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789779276; x=1790384076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aS8vpLbCC+UV4B+QKFVqLQosffbfcP7BnnH9D7Kwu74=;
        b=vfutVT7QJP8EsdFGbVsHU7dAR9d12WcukuPGczheLSF3CA997OmcGfCJ6Hxj6pt83B
         tTmAtIBGeEi9iIuddazf64VMYcwbQ5EZyoajvxYXHJn824GvNjHXiPzIEKziQyY1jCSy
         scd3LVUYCT31wMNWx0bwGuGgFJtmxOiRuvDnyP16K/Idchi9VJXK6FTZH8pOcatrUJFh
         lwxHOx3/esYSepIsMn7MUTXfZ5L2kOlyglHb2UUUwu+H07AUrWm75u41EW4qAgDH0Y/N
         0ItcLzIs+M2EhZIZSwsjV0bNhnjrc9++ccPDTIVlkraNCXr0788WJQGWysdjpFqSIiTG
         /vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789779276; x=1790384076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aS8vpLbCC+UV4B+QKFVqLQosffbfcP7BnnH9D7Kwu74=;
        b=h7R1/+lWMxRtILOLw8C/Ch8KHBG4mSCbNkmxy2U9iKiJpFy+njSIHKO0iiB8Z3nvpE
         dOLLCk4Y5JOkdhofKUXPgf1hWmiBxDianznIvWzycsQaG9Fjwq4qZJU6u0DJqkl4lamx
         rl5cWy56fsEWK1sas9z3h/DnxktlbDq5gwoRbq24JliO401sE2wPTqLW5Jl8lZwtfOwg
         C3Fig6mjyzKYR+qxXKJ0Bt0s7fGHN/bNFhoomrovtre11BCUsXjUrDgfTpvNVmr5006e
         Ww5yymYMvWYv4QNnl24e6qcgeZ17IVFvXw23AlWYUWCooF4gxRDpztKRbLT4onzdSeYr
         5N3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKYOe4rInOyxEkOyHfih/d9qvjUNiqrRdgwTA1aGzgPzTyhr11mfCmPRFjXtWVCEjhNiB1mxoGgaYTqQI=@vger.kernel.org
X-Gm-Message-State: AFuF++ll83d/hQ2rDZn6zW9Bp49KN300I5ovREN53jZ+7m2O9EMP5xVo
	EDv7swnX5QSuc7l6G87wzZO01sJnAzsj7EDei3gMQDO4X57PYXql9P/SgjMDY5ibafY=
X-Gm-Gg: AYBFou3YPS260ziKvCHQre3MChUkkUtrYgc2yhQ4YBSa6Q8J5Sypvjvf3eXpSMbv1DR
	C1Xx2wkc08tc8xOEUifjAE3502MlBnNAbu/pxTwUZIugDG+3QkEI0od+PTuJJPyMNRPXyrZ1Cqn
	LiizRkxEifvKMHDqMt2VXETqlSlfirO2YKk0I4M4qHk2D24IXHezfILNy2g2xbYMjJbsVka59fS
	pMjsDkMVjTO6y8+oJvRoa0Js2n3A6NjPzNqWyPjwrtJLhwrRqQXG+eQ5kRw7DlKC2zMSCSdBPtH
	e/MfG3RTbDaLwN1kR3WpUuzEkN4z7RPKtoI9M3XtI5+G17D1j/arIv+Ff28zrbdJgWaL8od3ESO
	VuCPwjGY/xwemh/Bq/6KgjimKOh0FFWezFBSFy09uA9HIdPhjHsDBUXZd8K7IsbEU6UVC+txoYH
	sOLTcP4JWTUrD1dbnwvhYUufHazMdfjiqEEmOEeFRf9v0ik9CO8gtE
X-Received: by 2002:a17:90a:c089:b0:39e:6c68:c78c with SMTP id 98e67ed59e1d1-39e6c68ca3bmr1516708a91.66.1789779276128;
        Fri, 18 Sep 2026 17:54:36 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c5b3932sm1706421a91.13.2026.09.18.17.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:54:35 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:54:34 -0700
From: Joe Damato <joe@dama.to>
To: Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 02/10] NTB: ntb_transport: Use little-endian
 shared fields
Message-ID: <aq3dSqE2euoxQeQr@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Koichiro Den <den@valinux.co.jp>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260914084838.2158249-1-den@valinux.co.jp>
 <20260914084838.2158249-3-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914084838.2158249-3-den@valinux.co.jp>

On Mon, Sep 14, 2026 at 05:48:30PM +0900, Koichiro Den wrote:
> ntb_transport writes payload headers and the RX ring tail with
> iowrite32(), but reads peer-written copies from coherent memory as native
> integers. The values are therefore byte-swapped when read on a big-endian
> system.
> 
> Mark the shared fields as __le32 and convert coherent-memory accesses
> accordingly. Read hdr->ver and hdr->len once so their checks and later
> uses see the same values.
> 
> Fixes: 74465645cdb4 ("NTB: Fix Sparse Warnings")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260815032932.151F11F000E9@smtp.kernel.org/
> Link: https://lore.kernel.org/r/20260818064951.7EA231F000E9@smtp.kernel.org/
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v4:
>   - No changes.
> 
>  drivers/ntb/ntb_transport.c | 47 +++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index 74f4f8c1c7be..3f497a62673f 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c

[...]

> @@ -514,7 +514,8 @@ static int ntb_qp_debugfs_stats_show(struct seq_file *s, void *v)
>  	seq_printf(s, "tx_err_no_buf - %llu\n", qp->tx_err_no_buf);
>  	seq_printf(s, "tx_mw - \t0x%p\n", qp->tx_mw);
>  	seq_printf(s, "tx_index (H) - \t%u\n", qp->tx_index);
> -	seq_printf(s, "RRI (T) - \t%u\n", qp->remote_rx_info->entry);
> +	seq_printf(s, "RRI (T) - \t%u\n",
> +		   le32_to_cpu(qp->remote_rx_info->entry));

it looks like the code READ_ONCE's this field below.... is that needed here
too?


>  	seq_printf(s, "tx_max_entry - \t%u\n", qp->tx_max_entry);
>  	seq_printf(s, "free tx - \t%u\n", ntb_transport_tx_free_entry(qp));
>  	seq_putc(s, '\n');
> @@ -633,7 +634,7 @@ static int ntb_transport_setup_qp_mw(struct ntb_transport_ctx *nt,
>  		qp->rx_alloc_entry++;
>  	}
>  
> -	qp->remote_rx_info->entry = qp->rx_max_entry - 1;
> +	qp->remote_rx_info->entry = cpu_to_le32(qp->rx_max_entry - 1);

you read_once below, do you need a write_once too ?

i wonder if the read_once / write_once with endian conversion can be wrapped
up in a helper or something to simplify? not sure, it might introduce more
code than really necessary.

>  	/* setup the hdr offsets with 0's */
>  	for (i = 0; i < qp->rx_max_entry; i++) {
> @@ -919,7 +920,7 @@ static void ntb_qp_link_down_reset(struct ntb_transport_qp *qp)
>  {
>  	ntb_qp_link_context_reset(qp);
>  	if (qp->remote_rx_info)
> -		qp->remote_rx_info->entry = qp->rx_max_entry - 1;
> +		qp->remote_rx_info->entry = cpu_to_le32(qp->rx_max_entry - 1);

same as above with the onces ?

>  }
>  
>  static void ntb_qp_link_cleanup(struct ntb_transport_qp *qp)
> @@ -1445,7 +1446,7 @@ static void ntb_complete_rxc(struct ntb_transport_qp *qp)
>  		if (!(entry->flags & DESC_DONE_FLAG))
>  			break;
>  
> -		entry->rx_hdr->flags = 0;
> +		entry->rx_hdr->flags = cpu_to_le32(0);

this looked weird to me but grep says this is a common idiom, so TIL
cpu_to_le32(0) is a thing.

[...]

> @@ -2490,7 +2495,9 @@ EXPORT_SYMBOL_GPL(ntb_transport_max_size);
>  unsigned int ntb_transport_tx_free_entry(struct ntb_transport_qp *qp)
>  {
>  	unsigned int head = qp->tx_index;
> -	unsigned int tail = qp->remote_rx_info->entry;
> +	unsigned int tail;
> +
> +	tail = le32_to_cpu(READ_ONCE(qp->remote_rx_info->entry));

see above re: read_once and write_once on this field...

i didn't really try prototyping anything but seeing this repeated pattern
makes me wonder if

static inline u32 ntb_remote_rx_entry(blah)
{
  return le32_to_cpu(READ_ONCE(....));
}

would make the code clearer ... or less clear. not sure.

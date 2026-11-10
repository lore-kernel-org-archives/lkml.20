Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290972;
	b=aQSN+LGbAcXbzsJtXJ35+HHFUK1ialdnuTs3of5u+AEzDxT9qOevmymte7YdJf0tgS+M
	 fxBpqIlnyF8yd+NOsrRxxD58fSYgj5ES9ocTOFKZ9dPqijjBXR7B/M5dsOWJvZZMeVSPf
	 OUMJyM1b5qjF4r25dWtI6wBUSEBasDwrba88l2tORPVwSUAOKflCduVe3eiiGr8QL1MqF
	 KIP6dtJl2Ra4N0TuEChPjAz1304jGuuVa4eEfdY9WZYbLDWlKML/Jaj292poSISn72UKy
	 FE18qJ1mtraOG4xXGe3vaBlMfaWFcmAXypbFvJ9pIiflDDL6Dp666naFPhehZwM5xTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kZjQ59UCRW5R4H/+cRlryoG4wGj0VlSB5hBgqDomyao=;
	b=XbPN1vInr+fJx4vRVuwes3HTLJUF4GxBDWgdiowqetRVbXEiDjtpIjy4LRnJ9LJrg7EM
	 d/UCn68qglFwe2atkUyzl8ujkMaT8pft7LWCh+e3wEut7FtfUxyqILybJ0VLpl6gUbHTU
	 1DYrv23zJYely0dsQog3h0JgRxAVfJ/NXx84YSdzYLkS4DaE942MERrwCpfxXKdYkuVgV
	 +7w44UXtsp1qkRkCWxt/j+YFGP785mVRyiAcmY38mh/ZH7bTuVj4NLvK5pwJ9jhuITqEE
	 B3M9WH1Cy0kzZKGSRaJs3rfQ8zFigFCMPlqN23PK3xC3pmWK5yWOjWe81vypB2xNM1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epMrlUtR;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F480606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F480606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epMrlUtR
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2145933eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794290972; x=1794895772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZjQ59UCRW5R4H/+cRlryoG4wGj0VlSB5hBgqDomyao=;
        b=epMrlUtRWSUM5cfEhQk6DRFCCorJVZ/Kh7IkCkBRre/d2XBunMNkWp6qdbQd7p84hv
         dw8HGZHlCZWbuU67Z0S0NFhaxkV8O762iOjsCXfrURP2aLOqNr5eyaVdNurw7N9MS5s6
         O3VbSusDNNieK4N3JebYUBM/hoXEdCJag0qhAnsKwsUQs+rjFbVoGL1SxumY3jJpyw5Q
         0nmGB47jik0O8e+HKAcI/AHNKRzpqXm8ewci2yoaAKguFtfSrcBIvECed9OCTRSTRgAw
         +TTC93s4/Rc7r/749St/csY1taqce1ozvNURZRRfvSoNwPlnU2O5k4Rray0AQEYkV+HK
         laSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290972; x=1794895772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZjQ59UCRW5R4H/+cRlryoG4wGj0VlSB5hBgqDomyao=;
        b=BJ2u58CZFP45C/tc4vy3us9BgjfXiP8jpfndIn6P2lVPJZWV5SO9XyBn9Y1jvoSRqh
         qSf+LsNuQojtun+jenmE3a575w4D61KRMu4LiuVPK5cxzOcqoi9RMpJZO2FCOSNKPgZ9
         ah8Ie0meN5pOzoVzntFy/TRZ5sIPkmb+EFO8ln8mF/J/n1KFw/QEEU2uiknpH3Gb9KiE
         n+aIDQL0SCGuvN1rIanKxbs2psfJA020duFNSbhxuvDxYAmN8YUthlDFmlRHX00ht24z
         JQ544cNj3z+iHPDhKun5F04mJQ+tzJh7NPjv5/5Kt6vBwtVsMH0tlWQMKx+eXO0gf8Hh
         ex+Q==
X-Forwarded-Encrypted: i=1; AL+hErE9eq/T0GN9Hc13Sgo7TDV0Yt2MBR3wCdlFdlg3hVUXS7QtYfJHvzfzxiSAzb8Xd5SGe9ZCVA6NH0Hg4uU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QtxWheQ95mbOb2Ooi8128i4ou1Yooqh0O0WHGsR2NNiMr8wTB
	CSZ1/F25l7wscKrh0FosGqa6uvu6dbBILPJjWmUIxhC4ceI5r8wJ8uaZ
X-Gm-Gg: AYBFou0CjSGgSjiTiXlXOs72LAp4eo9O019jwVfrJqZfRVkVQ10p2SJ6nBnxG2lkxm9
	U0rL5MlbfpgBAKgyqZ9xrGx6dRD/VKuIzJkZPZeH5SQ/8BSrxRszm+s2KmcVfsn2sPWVJva1w7t
	hOXxctLTYMs4eLWWyTKgIiRiZzlW6D0+B4HBhUdhigH90WA1K4lofhDJ73Dc8KOWrVTR1nT9x5l
	nUId367cSsynCSvmXpecXQHPsdbY2AFhCsSpDTKdrVZsS1gIwXJ0jyMuRHwdmfuUMLdbpc1aQOH
	OOkrHbM951I1WZ/3H0Rj2Rrb9SK1nLV8oPnfpvXKzXZXKkng98ccJiZyEVFwk4fNYwzF/1x6BDb
	7obtAnMN5h5joMMBlAjAy8EBnmu0CZ1MVSdiC4gEf67o6h8XQBtPQood4P8Z1NHA6bQpf8Lp5sE
	ZGWpcRyKdu1xhnaUgXMHXzTU4RtcuSDxK+3KDJZDM3sdqsKs0/O/qa+toBTVLtY2rU8/8tsEzR8
	K93TTuMMj/Tw38gRtBRTeDDoa798THdvqWZK89mxaH9n8gsqc30+L9Ybm5kWSntZPPzT1Ft+NjX
	FmmZx7DO6/xoRZNmTEUd3ByS2yq9qm+4EfT8ystWHgRgRimpIqurfHXpeKQ=
X-Received: by 2002:a05:7300:ce03:b0:375:b560:a323 with SMTP id 5a478bee46e88-375b560a540mr358953eec.1.1794290971394;
        Mon, 09 Nov 2026 22:09:31 -0800 (PST)
Received: from TheRealOne ([2409:40e1:f:bf46:297:7dc6:50e0:d877])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm3875925eec.11.2026.11.09.22.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:09:30 -0800 (PST)
Date: Tue, 10 Nov 2026 11:39:23 +0530
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Samuel Ortiz <sameo@linux.intel.com>, 
	Michael Thalmeier <michael.thalmeier@hale.at>, syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com, 
	oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net] nfc: pn533: fix slab-out-of-bounds read in
 pn533_recv_frame()
Message-ID: <avKx-tpX2nBgp57i@TheRealOne>
References: <20261014083239.144506-1-chandradhar.2003@gmail.com>
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
In-Reply-To: <20261014083239.144506-1-chandradhar.2003@gmail.com>

On Wed, Oct 14, 2026 at 02:02:36PM +0530, Chandradhar Kumar wrote:
> pn533_recv_frame() accesses skb->data to check for ACK frames, dump
> the received frame via print_hex_dump_debug(), and validate the frame
> without first verifying that skb->len contains enough bytes for the
> frame header and payload. When a short or truncated USB packet is
> received, this results in a slab-out-of-bounds read in
> hex_dump_to_buffer() or during frame validation.
> 
> Fix this by verifying that skb->len is at least PN533_STD_FRAME_ACK_SIZE
> before checking for an ACK frame, passing skb->len instead of the
> unvalidated rx_frame_size() to print_hex_dump_debug(), and validating
> that skb->len is large enough to hold the frame header and complete
> frame before calling rx_is_frame_valid().
> 
> Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
> Reported-by: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
Hey the correspondig syzbot bug is opened for about a month would you
like to look into the patch if it is applicable or tell me if anything
is wrong in the patch or there are others way to fix the bug.

Thanks.
> Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
> ---
>  drivers/nfc/pn533/pn533.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
> index b0133e51dce9..c730a84f1c62 100644
> --- a/drivers/nfc/pn533/pn533.c
> +++ b/drivers/nfc/pn533/pn533.c
> @@ -2193,6 +2193,13 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
>  		goto sched_wq;
>  	}
>  
> +	if (skb->len < PN533_STD_FRAME_ACK_SIZE) {
> +		nfc_err(dev->dev, "Received a too short frame\n");
> +		dev->cmd->status = -EIO;
> +		dev_kfree_skb(skb);
> +		goto sched_wq;
> +	}
> +
>  	if (pn533_rx_frame_is_ack(skb->data)) {
>  		dev_dbg(dev->dev, "%s: Received ACK frame\n", __func__);
>  		dev_kfree_skb(skb);
> @@ -2200,9 +2207,12 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
>  	}
>  
>  	print_hex_dump_debug("PN533 RX: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
> -			     dev->ops->rx_frame_size(skb->data), false);
> +			     skb->len, false);
>  
> -	if (!dev->ops->rx_is_frame_valid(skb->data, dev)) {
> +	if (skb->len < PN533_STD_FRAME_HEADER_LEN + PN533_STD_FRAME_TAIL_LEN ||
> +	    skb->len < dev->ops->rx_header_len ||
> +	    skb->len < dev->ops->rx_frame_size(skb->data) ||
> +	    !dev->ops->rx_is_frame_valid(skb->data, dev)) {
>  		nfc_err(dev->dev, "Received an invalid frame\n");
>  		dev->cmd->status = -EIO;
>  	} else if (!pn533_rx_frame_is_cmd_response(dev, skb->data)) {
> -- 
> 2.56.0
> 

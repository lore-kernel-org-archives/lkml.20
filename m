Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009623451AA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987409; cv=none; b=qnw+4KtnmlZ3wP0gEabLkkPknuNummtag5b8f3cz9OFRqSEspcb2Fim5y+YrnynBNUjE6aEWQQSC+KD81KQ1hAaPIdIZr/ven3Od1B7v7FWVhnDVXJj9fxR35ut+mFLZiyGkHtoDhUahTPaUvNzANmdvmlujXJf7Vjji5KMM1NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987409; c=relaxed/simple;
	bh=8n2x4+oQjKgoBuQkJQIXlCUgVb3Yjm+VjxbJSDp/6QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSIEkDKW+MERbhv5UswCnLpAJ7iSl5y1GTUFzN12ZBm3UcPF2GNH/6Kr53r95VHk7ZULAvYZhP9uGAVRiFh2J01K6fGNW58uyNXTvbewJ9np5qQHzBdss1fbuyIK1av7AxWvwXGWy281pjNwKg3qV2TArOxKXJEOrBewbrh6XWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rI+K5tei; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rI+K5tei"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-936dfd009d1so35273985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788987399; x=1789592199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y727yYl0dVIyP6iqOFhDnAiWMOdMmGcyQzect6GeKCg=;
        b=rI+K5tei5edB0E0woOpTdXs+UhZdZksIvbMDfOOHZ4WgyG9bEoDpmOLo68o93fTzHB
         G6qDInQj5hsUAgkIL+JbIp1rhNT0ukPZE1trTSGAfaTZ+KyLVOHDu3U4VRnwy6MEU1hh
         AfB/22Gr7WlEB11Zw9cekq6sq0cTbAw9m2Qwq2yfIEI9F3pTBtkm908/zepgG3tVml44
         YEK+b9Ez81df7W9dRR9OGdamjhMRL2QwuWdaduZ7gB9GDTQGEyvd5dNzOYiweTql7lIO
         E0RiBadbFj3r1ogz5OZcJmILT9TTz4gWLyzGnwFWvBNxXHBC0if1C/WjNQXEJQ7cgVU6
         aGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987399; x=1789592199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y727yYl0dVIyP6iqOFhDnAiWMOdMmGcyQzect6GeKCg=;
        b=FM37AaJ8sza571QI7DLNdiWaBa7w33di8wdVQRpRWNM3KQL22Z7NGG2embf/uRNGSd
         VpwUnMBj/0PrOtQqE4aHhBEeAH7G9dctZFRxjeNUmmHSqBMIUux1LAVTMByUa1+7KYKX
         J0yt6ja/Eyj7ekxEVsfLeEJ7TVhOJR+/lSJI7GPRRnc13h3sYxjnWcKPrfMj0bVHYWOR
         YWfZNyJWwV2LCN602N8CoOkaiBN9kOf+THgv5fuKTaIzuxuta0p5Rb4ZYJM3LTWzAoRm
         uaT2jIiQ9hvZ/nn37ACbX8aIFU2cPm0jr4Tt2oqx/kw7bxrF7NfPwWON54NqIYeDO8b/
         ScQg==
X-Forwarded-Encrypted: i=1; AKwUvBz7ntU/kMQ6tzSKQCE3Jc59zUNJ26OLH0KXo2JT6hworplEQbcE/3ZqWx6e+tVS4MQHZh/UNf2V3iyKpGo=@vger.kernel.org
X-Gm-Message-State: AFuF++lCuO7juyxjFjrXJrDrUsEVq2vWbTiS7CURrpEV79s5PsdEuPYk
	cKPqV53CAfnn7cXgUeG85OfCfSRHYtkErb8s3SIOY+2I3Dr9T5rHRqB7Mru0dbq8sA==
X-Gm-Gg: AYBFou3rLzwXDhU93LuCtE42mugeFdRWWnAdxigOb2MnfnHJZ9tVp8FE3tmQ4fPMlHb
	7963YgMV4cIBhXhmxUKtB5wuRd9L5izacSLaDUmANTlBE0mVNYvNJDH3nSwyjKfB3FZ3ll7jMIl
	0M+Tv6tHljpJ0pORP7q+A7p0YzgheawXkkTmlJKSrM+srm9fts7cHsdUE6gPrT2t9Odlr8KM7vc
	vq1aSgKaakiwKhjAnYPPGs5a6UvRk49yV0v6hoyL4W43ZEyQNO2QSItTQUfTpK0p7i50bAsjREi
	/eF1rLVqraONbfuxAcFx+UsnA7lvgKsYREggwq7TquTm4FkF1+nuYUUcgA7vKGwClpr1hVymkvN
	RkM+VsO3qIqj3oyBKJqNK2uA6vYr6AK21Tn7RE7NuYHYGhBUvd4xL1hroJF003CPVU1xWNZODe/
	c5SEZWiQSlRVuCUPETvZ3g6rVtpsyWm6A8gm30LVCWsWzU9MklxC83sy3okRXpD+1vFJkR7j8/
X-Received: by 2002:a05:620a:2705:b0:939:72cb:baf5 with SMTP id af79cd13be357-939d8002941mr148789685a.44.1788987399427;
        Wed, 09 Sep 2026 13:56:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b5c477afsm690401485a.12.2026.09.09.13.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:56:38 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:56:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: storage: ene_ub6250: set transport_reset to
 avoid NULL deref
Message-ID: <49a9586b-cb7e-4c9b-ad1b-c4920ac0f9a5@rowland.harvard.edu>
References: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
 <20260909171926.54111-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909171926.54111-1-ngocthang2710.1999@gmail.com>

On Thu, Sep 10, 2026 at 12:19:26AM +0700, Nguyen Ngoc Thang wrote:
> ene_ub6250_probe() sets us->transport but never sets
> us->transport_reset. get_transport() only fills in transport_reset
> for the standard USB_PR_CB/CBI/BULK protocols; since this driver
> matches on VID/PID alone, a device can report any bInterfaceProtocol
> value and still bind, leaving transport_reset NULL.
> 
> When the transport then reports an error, usb_stor_invoke_transport()
> calls us->transport_reset(us) in its Handle_Errors path, dereferencing
> a NULL function pointer:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   RIP: 0010:0x0
>   Call Trace:
>    usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
>    usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
>    kthread+0x38b/0x480 kernel/kthread.c:436
> 
> Set transport_reset to usb_stor_Bulk_reset: ene_send_scsi_cmd()
> already frames its command/status packets with the shared
> struct bulk_cb_wrap/bulk_cs_wrap from include/linux/usb/storage.h
> and only ever transfers over us->send_bulk_pipe/recv_bulk_pipe, i.e.
> this device speaks the Bulk-Only Transport wire protocol underneath
> its own SCSI translation layer, so the Bulk-Only reset is the correct
> recovery action for it, matching the pattern already used by the
> other subdrivers with a custom transport function (alauda, datafab,
> jumpshot, karma).
> 
> Also harden usb_stor_probe2()'s existing sanity check to require
> transport_reset alongside transport and proto_handler, so a future
> subdriver making the same mistake fails to probe instead of crashing
> on the first error recovery.
> 
> Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> v2: per Alan Stern's review, justify why usb_stor_Bulk_reset is the
>     correct choice for ene_ub6250, and additionally harden
>     usb_stor_probe2()'s NULL check to cover transport_reset so other
>     subdrivers can't hit the same bug.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/ene_ub6250.c | 2 ++
>  drivers/usb/storage/usb.c        | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index ed49a3bc859c..3137c2cdd021 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -2350,6 +2350,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,
> 
>  	us->transport_name = "ene_ub6250";
>  	us->transport = ene_transport;
> +	/* get_transport() only sets this for the standard USB_PR_* protocols */
> +	us->transport_reset = usb_stor_Bulk_reset;
>  	us->max_lun = 0;
> 
>  	result = usb_stor_probe2(us);
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 064c7fc8e368..823a4b2e9033 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -1100,8 +1100,10 @@ int usb_stor_probe2(struct us_data *us)
>  	int result;
>  	struct device *dev = &us->pusb_intf->dev;
> 
> -	/* Make sure the transport and protocol have both been set */
> -	if (!us->transport || !us->proto_handler) {
> +	/* Make sure the transport, its reset method, and the protocol
> +	 * have all been set
> +	 */
> +	if (!us->transport || !us->transport_reset || !us->proto_handler) {
>  		result = -ENXIO;
>  		goto BadDevice;
>  	}
> --
> 2.43.0

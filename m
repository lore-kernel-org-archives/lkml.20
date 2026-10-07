Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F763D9535
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400668; cv=none; b=XjWqIiQXu3HZev9Eg3oHwyjylAS/7IiolrSlkvogDyCHzavPYyhJ6HOLXF2zOipCBc5CJCTJS4bAeX+gjnqBIzqvl9GN2ZkW5CulFYrSzE6iOBn7xDDitDUlGB2zDmvDNqSns5Y3rMJltMlbZXyDGOTIzrsT9zK+pROcck4f004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400668; c=relaxed/simple;
	bh=QNHqERiJA6h7t45r+pE5d1xtdTk7ObwjjgXwFfcr2HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8ehzvU7xHn4lDUKvQrR960/tzlqhHOKn/zkP6F2y9PXMTKikhOZZuzAEDV9seiE9PYQI2bLqKXO5PwFcK62T36gADm0sLcH6nVtv5xVAsxVRC2mTYnh3+NA7XifvLf4Gjms69zTfNcw5430MMytHQTz/yzCfB6Yp8aNB+ueey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=C3xRf301; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="C3xRf301"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91957ec418cso32122006d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791400666; x=1792005466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vx4KWtJbCQ7YluYTEPnOzhsNsEprOEZ5m0BGDaJh/s=;
        b=C3xRf301V0u1xA+oPF0lM7sCiZyRXHQ1d6fsMLT8ZrZ8/6IRldTOW9A4bqZWHw5MG/
         1tLGDDK1PhsN8fIr3K0XiN4pVJ8Gx6GswvBloQlZThGglrPXIbA/6LLUah+7v5DC28/Y
         n59JJ6WVH8x2U0vl2E9CULQBK9AD8db92FMXPg0n5CNnTIGhATGnocKU2AI2ez34RTsA
         7hkcADZf6k2Fw5obieFT+5CVumMNSRu6Opa0JvFIqo5AEJvGylQRBAaynYaApEMx1DKL
         9pGNleMgC2iU7FQCmf8h0210LefbUDNvPJ52ceL+x9Wp5ShgFJayOdQyqtNCxnRHCl9F
         D/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400666; x=1792005466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vx4KWtJbCQ7YluYTEPnOzhsNsEprOEZ5m0BGDaJh/s=;
        b=2BCE27dHzwbju58qUKdfT1kuhgSEkYc4ATBAQ120w3xVU5ZdW68NsztV0Xuj5VIB5P
         o9Q71ix7x5XbwcEReOTy2XpaBrVz99Jh0fSOZgSln1ybAVJlB20e+LzGMNdlvIsTSpx/
         MKhY+CiIIcv/cgNOKBfLpj4XBDbqhXajP1JO94zecpT62fnPjdzeda7S8WbDqDHCmOaX
         /ezl3XiyMynF2i/NRudGPwh3cIC0EYEC8kZYlMqtEzY8D3RtG8pO9EQDB6hCrfRz9Cwp
         vS83bUYpc8F02Q85WQFcvF11FihXdnSscKTnUP52XlNnHn9IK4kFOvnpv4vFJX4u2zZH
         unuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQXAs1oK1t7VmALDG6ZTH7G1RD+BbE+V9ets57AuinHmUvyGaPO+y4kYosaZEFmNgTjBGTZQXEvGginrY=@vger.kernel.org
X-Gm-Message-State: AFuF++kAI80BVH871cixpx2IOU04J187DAJz1wmZamWZPZQkFbgEtiXx
	+SaT11rmESL7ySmaAHFScqZjnyqHUp+1QMsSYL9uMAMEe++Ni3hT+Ba+y8OJYPtfeQ==
X-Gm-Gg: AYBFou0Dynb9n4QP3nhbD+bFApfEQRiAafzg/y3eCjnkITxRO+DdAcbtLx5a31g7dW4
	wN6PaQ7UBuAxKj1avwwexH+Cm5HOhomaZ85u2eTEbTn/lMT2R95EL5N1CQ6IIhnBKs/KdeDHmM9
	31sZ7gZpqkk8sZEHFCdnITxvo97fFaUoVh7c2sAsDSg3cKnNyNamR/tVnX3Mqrr9nzGIy7WjuCA
	6cKMglNI7t1tDd/koNN+HX7RMrIwnQxH73o5HDnWuydeHAbqWLTV9wyzDMaJbD6HGWVNn+CSowT
	lrQVYMdXHvrl5Idhn8Z+0ziNj1ZzsKPkEP0yq096MDEJXZOhB1T9P5QLclhhfMVGnJOuUF48Uow
	WO7Z+w9KbQGmWcPzVI+6YpLm/NZl/sH1u5eoWBENoizYPP+dOL1ZzRt9h7AhEG3m3EtvQUu8gAt
	1m+1hgi4zll8V37Omv2E06OknrHJmsWP5IU5msbhRjr0bv67KMQ3mW2ekJg1q+8vl6+OEloOzB7
	8qeU48hzTwacbkC40+GD2A9dOQbpHe+L1KpmYDF2w==
X-Received: by 2002:a05:6214:c47:b0:917:8d82:ad9c with SMTP id 6a1803df08f44-9199782ae73mr57573006d6.24.1791400665453;
        Wed, 07 Oct 2026 12:17:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996cb5517sm27824146d6.15.2026.10.07.12.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:17:44 -0700 (PDT)
Date: Wed, 7 Oct 2026 15:17:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Giuseppe Piscitelli <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
Message-ID: <f1fc602f-0ee8-4e95-b764-ca34280eaa80@rowland.harvard.edu>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
 <20261007191130.8652-1-ooonea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007191130.8652-1-ooonea@gmail.com>

On Wed, Oct 07, 2026 at 09:11:30PM +0200, Giuseppe Piscitelli wrote:
> On the first insertion of an iPhone (05ac:12a8) after boot, an already
> running usbmuxd can select USB configuration 4 before the charging driver
> apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> driver that enables their higher charging current.
> 
> USB device uevents have no MODALIAS. The charging module instead loads
> from an interface uevent. Its registration reprobes the device, unbinds
> the generic driver and calls usb_set_configuration(udev, -1), tearing down
> the interfaces and interrupting usbmuxd's transfers.
> 
> Emit a modalias in the USB device uevent, using wildcards for interface
> fields because no particular interface is described by this event. This
> allows udev's kmod builtin to load matching device drivers while handling
> the device add event, before broadcasting that event to libudev listeners.
> libusb's udev hotplug backend listens for this broadcast, so usbmuxd sees
> the arrival after the charging module has finished loading and reprobed
> the device, rather than before a later interface event loads it.
> 
> A slow udev worker delays both module loading and the broadcast; it does
> not reverse this ordering. This addresses hotplug through the udev
> backend, not clients reading raw kernel events or scanning devices before
> udev has finished, and does not synchronize later manual module loading.
> 
> Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
> Assisted-by: OpenAI Codex
> ---
> v2:
> - Explain the iPhone, charging driver and usbmuxd interaction.
> - Describe synchronous module loading before the libudev broadcast,
>   including the ordering when udev runs slowly and its scope limits.
> - No code changes.

Much better, thank you.

Alan Stern

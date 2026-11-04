Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813769;
	b=l2br0Mtr2zJWuPIZTs33+7ZrfyHALYaed5zi+IigBiEaYIoYrHuJjcEDsMh7AlkmIoL9
	 z08DwiqoqlHs+Khnrux51PJ+OHQaxQ6Ijkw6R6XA70HNmPNv5FcipqaqWO+030RgfikJG
	 H4xM952cWcxQYp4XzbE8tlkeloSh2lTSx6WhdW0jQXU7a5nPNQtpC9A/X4mhSlMxFNq2A
	 QvzCMbWd1OHb3kZ2SRbPtGBU6o0qielUrlTUBsEv1iVlHt12DV1fqgsIv3XIRzS3VTtxx
	 ujYxCeeOp2rzrhs7lLwYd3PGNcITqshw945a2beXogX8fnBVVZ9g9PxC1RSqtYU3DIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6zWWmAM/EjSfX+fzNtWWpqxiPfU3InnZ+YWyZ8VpU1Y=;
	b=DPGt8lJJVOCpbWmfwBvUd9jBSq5/0R8sNEhkmpKW2PaAqoSWkMlstppydOj3D2qTggXr
	 gMGARu5v3OMfMA61fjccd9K8fXthEHSWUJ3OU1djx8kfRqAm/QpR3YnmbRBN497HWm5Pa
	 goHMZIYgEWu5sX2APjGYEbdvLdRCbXS5LG3KpAexbEulS8BoxgEXGi3ZfYOZJWJZjWPPd
	 xpiMRhHaUwY5pErS6zgGCXaIP2gSH3wgK0JLtwDxzeWmUjJi7XeDb6rUVqb4beLlmOlna
	 rV6kLobyiWY6vRaJvyx7Bmh/ZXzxDmEzOn7VBFkbw6tBKHEOU2tNpwESeXnRqrYKk/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wufik20/";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A560606ECC9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A560606ECC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wufik20/
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4f540ebso523838f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813768; x=1794418568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zWWmAM/EjSfX+fzNtWWpqxiPfU3InnZ+YWyZ8VpU1Y=;
        b=wufik20/hF2eGBxiq5EJOIEIs3TvBuHcrkCWZl4iunPIc/jhCgNNuuYqUB/VKoz4nb
         rdlyC7Q0EPWILdkaRhUzDeEyKof0V28bqH2T0TlHfpRVt1Qe5Baf1lwWsvLU/75RZlbh
         bqB0ykMxUep4Ur8yvE6fkibug9V5IZpeyAAIDrui3507ekFUacV6zsNvNAAMT3plDzfU
         264qGYsGhaynzVWx2lPks/HF4qzlYieu62zoC2GL/yrIul+6mlfr4wr5bM1HKLPEqyOl
         5CCD9HtILxCwa+SUjsFF0ysOHZLYiIna7ALDMU7R2oKtXjqJMScQ4bK1U58WOy0n75d9
         TakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813768; x=1794418568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zWWmAM/EjSfX+fzNtWWpqxiPfU3InnZ+YWyZ8VpU1Y=;
        b=Ry4ZhVCKitVGxwMz1DiBBf7oSnykJFlj3A+EXbOYJvUXlTJKIef/DREpdq11g0OAp3
         OzDJRKs6gjxIVkfXjHhWOz5mZs1lPm7enVnkENX8ggcKv1Jav5b0PhJuwZA/pROZ9fVN
         RPd3MFggvDySBEopbOtrECH/UB55dRZvRbJDzcbTUB2wV1uJ4qwl26aQHOsX6E0jf3SI
         NSikPZCkfqlcKZv6wMc9wwkE7PHu54z0rb0NLMgEVPtpRvGG4EsEvSzEn7wp+9CJvGiO
         LbuJK2A1sWOCRx+OZIgjmPGoym/u26EODQmGGwvmMXrXAA8usUXgW8HOmAvX+xYrO+Rq
         eOGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzivimLZaNJe9tBBDUnD/FkwBxEa/ZIUXR7PT4pJvmQe0lZ7gc3qbz44bZN94ZY0GPou9/IFVlOunRlZlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mQUGZG5jsgGrJ4rxj/sUoE4M+Mxf994XVn06qutccOJkmPdhH
	q07XNKTaNb36FdbfQt34lBTB/I+0kMihH3RQHK87IgqNmkB6YBaEg7H1
X-Gm-Gg: AYBFou2dkiAu/tHrMZfKPNqyTYIV0HQaivEM4PCxK+ZK5TQRzio5LchYpsxJ8y8Egi+
	mV5DVlxwduUE6HOJUWrrrOOS5ziJhG7hxVLl/oSYSg7dYF1mmLgD1Lcx3Z1tQdn+AMM4Xb5uIOk
	Pn0D7VMkz6lzIrmA7KUAUVesB03izJ1K1ByeoDWsfCOSvLSd4fJjR34bQLkOTzTu0BpxwUZ/+A3
	jarwgZBKHpJ1qkhG5usj+qt5/xpzskU3FZRnCW6qHC+KzBMc0z5DotRvPl0lJrFW70ugDm4L3/b
	DW2a6nJSZNIV8TmkurXGbWtVh1SZ7MHt/aqUboJmvLMZHDUzHTN7+cAs3UP3pTUQVkW6r7tfihO
	XKWqjVsD3c6xpoE/8kjmt3+I62dLqZhdyn9cZa6ggFh2TPeCGoGERZ54pg3P00z1oG0tQemTa9e
	RHBNF7v1PB2ntR5NjCUIUlq1vKhsWPURklWTv3esJ/xhW7pK0F09sLt31ZD5fTNL4QngMHPqGJ8
	WjlhGFwqFjJFEUnbFt31y+aNjPFNFcECQopmSgM8Kv0EsSDnLSkzhVtqB+spmAnOZT+R9kQuZf5
	GyNotE7ZtR1xJW83kxX6rwYoQxdiGxcWv8g2o7ypEs/ZkxvwEiK7Gv6g/YFb
X-Received: by 2002:a05:6000:400c:b0:48e:35d4:55b5 with SMTP id ffacd0b85a97d-48e6e518368mr33802651f8f.52.1793813767532;
        Wed, 04 Nov 2026 09:36:07 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm4825519f8f.18.2026.11.04.09.36.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 09:36:07 -0800 (PST)
Date: Wed, 4 Nov 2026 18:36:03 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, xuhaiyang5@hisilicon.com, xuetao09@huawei.com,
 caiyadong@huawei.com, suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <20261104183603.17d663ce.michal.pecio@gmail.com>
In-Reply-To: <b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
	<b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 09:59:24 -0500, Alan Stern wrote:
> On Wed, Nov 04, 2026 at 08:44:02PM +0800, Pengfei Lv wrote:
> > Per USB 2.0 spec section 5.5.3, the ep0 maxpacket size is fixed for
> > all device speeds except full-speed devices, where it can be 8, 16,
> > 32, or 64 bytes and can only be determined by reading the device
> > descriptor.  During the initial enumeration of a full-speed device,
> > the USB core guesses 64 bytes (hub_port_init() with initial=true);
> > after reading the descriptor, the real value (e.g. 8) is stored in
> > udev->ep0.desc.wMaxPacketSize and propagated to the xHCI ep0 context
> > via an Evaluate Context command (xhci_check_maxpacket()).
> > 
> > After a port reset (usb_reset_and_verify_device() -> hub_port_init()
> > with initial=false), the "if (initial)" guard added by commit
> > ff33299ec8bb ("USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()") skips the ep0 maxpacket
> > guess block, so udev->ep0.desc.wMaxPacketSize retains the real value
> > (e.g. 8).  The xHCI Reset Device command preserves the ep0 context
> > as well, so the xHC ep0 max_packet also stays at 8.
> > 
> > When the subsequent re-enumeration then uses the "new scheme" and
> > issues a 64-byte GET_DESCRIPTOR (get_bMaxPacketSize0 with size=64),
> > xhci_check_maxpacket() sees hw==sw==8 and does not issue an Evaluate
> > Context command.  The xHC queues a Data TRB of length 64 but applies
> > ep0 max_packet=8 for short-packet detection.  
> 
> That's exactly what we want it to do.

Should we want it, though?

Were there known devices with bMaxPacketSize0 <= 16 which required the
whole transfer to complete before they are reset?

That's not what happens in the initial iteration, so it seems any such
devices would always take two iterations to begin working.

Is this what the only correct Proprietary Operating System does?

> >  If the device's first
> > data packet is exactly 8 bytes and it sends no ZLP, the xHC does not
> > recognise a short packet, keeps issuing IN tokens for the remaining
> > 56 bytes, and the control transfer hangs in the Data stage until URB
> > timeout.  
> 
> That is the correct behavior.  Indeed, the same issue applies to _any_ 
> 64-byte transfer (not just control and not just Get-Descriptor) when the 
> maxpacket value is 8.  If the device sends an 8-byte reply with no ZLP 
> following, the transfer will hang in the data stage.  That's _supposed_ 
> to happen.

Right, all those details about HC behavior and xHCI internals aren't
important here. The device is out of spec, apparently expecting the
host to always use MPS=64 for this particular request. It should send
the full descriptor in response to further polling.

More useful would be information about impact: what this abomination
is, does it always fail to enumerate on the first try and trigger this
unsuccessful retry, or only in exceptional cases? And of course,

> Have you observed this problem in actual testing or is it purely 
> theoretical?

Regards,
Michal

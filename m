Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540980;
	b=ANZxFuCGyBLMM3WT5xrsmslA5zbIWhu6BtPwOrNAnL92GcgIJzWFMzojlq1LQz948oLF
	 nxINr2dUOzju5warlBsVEkFR0e1k+tjbpT+aC6ld7sO53oSKce/Ya/C446DyitVk8a/Ns
	 RgkM409q/fajcOs9O0aWqZTHM/9zDUaT6kIPAcfBXoKacTF4Mft92PE/UOYlh/XDK9nwQ
	 gVYMjH6/0YlqpdNbKEezWc57DW5Ctd+fFKZ2eM6UlnAt9055MCrXgewo4N45JnFGEKM93
	 TTB3yF/aK189MUF5pypxuy5rf4NwTdIux4pH6YDPMMGrPIddVreiiN66v2uM+hRhX/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ror5uzNBAPnTGREKcaynZwXoTgt7o7ZJkOe7lTAegcE=;
	b=J84CeqR5l/066YnOBqlTOAmqArA3NEdBNTM5Us2cq1jdqbShKkaoO7lJoGSpN9mUI4OM
	 rACDQS10zB+WMdsKFQgXY6zFlr9LTDtoBfspwfjEcbAO8c8DHp3fukaUbHnnXl7a7dURo
	 Nr/8hlfVWw7uw5nCk3rIolsFDk0G1ejsT32Kl9vlt7RK94OucquKlAoem3lvVf/094iKM
	 9I07V8inX/aNbY17JEphW11x7rDDEcLBCyVr/p71NAgt/7fR9jLXtKqwvEudayAUjJz/l
	 KeUHRwF/MQG3+gG+dQEmwgNt0fS+IfLyXuBMRhA9j2a+IZ/sDY6aeViSNJrKsfMFQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=O91wHUCq;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44FC60A3802
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44FC60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=O91wHUCq
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55ae1516f1cso10819551cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794540979; x=1795145779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ror5uzNBAPnTGREKcaynZwXoTgt7o7ZJkOe7lTAegcE=;
        b=O91wHUCqAA7nZAzd27eMZrns//8GWtYMGeYNuk8zDJwaZxqGyNARnM7wmkNv0OaWZ5
         lb0epVfXxoUsEZv/xpFinX7WcLcocbUitmfC7A8HIRTlp1HPEodOn6sqv4UE/+Fy3hbf
         TkUUveGCG1L+0fPirxN05gnlc9i+I8Qblb6kTl0jJCRn0YUm315Ctm9OmLGk8OQDFYgc
         SUg7GrWwDPaH3A8rP0a2dRPAByRUfMulMnGM35uKVkOtPMIm/Rs656bCFzKo+ldGwHZ7
         CJav0jPF/AVtRW+P3RuVHzX8p3pwwLRw/f8URL05cgY2jQSE4RZRli2gazkHBn8ff4dP
         ZhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540979; x=1795145779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ror5uzNBAPnTGREKcaynZwXoTgt7o7ZJkOe7lTAegcE=;
        b=Y6Mjqny1MGTMgNTjc58iOr8ZU0LllJUy21bU34so4C+/BWAjYpQ+U6kZ40ym9reBPx
         DLClrKYjR6xQGYHHxFLW3gN4i0A1PE+MIuhqBiIAah1VuwKejcek40Wnyuuv5Oc5dfJm
         rMaPxij6rXQlRL7WUHJLk+CrBpPLdmGXPh+KgWdASJSExcPnMo3g4dqpEPY/v8Pj3Chj
         gf0DxRzmL/B3c5XeMXxj6ddgYPUmjWJfd0V7d+eqnJHv1nbzWLVnG14DXz3fB+qR16q6
         2hf5kJ9mQMm5ICdkdKYgY/LqPIlTJmkmM9F6xx0ZIc+jOmcjN4xnKt8mkhiaoUhjLWUz
         HQVQ==
X-Forwarded-Encrypted: i=1; AL+hErHlDOHD4zgAlCWjrVSC+ipuVY3G5BDh3oxYjy4+9Pxr3kK2g6x09GimhLscvIi4/KOCBOsO6ZALkCOU9Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qx5uer6mI1i0MBqkMIRaNzkxWjEHdoQzbuK5cTIJusmi/3cQ3
	tihWlp/e3mxI57DlP+AArx2Yk6f+eWn5d7CcufqsSfimy4B1FmyJUJ8UaIe60Hq1Ew==
X-Gm-Gg: AYBFou2OkYl6Yv5Q8Mjmng3rTf5u2jXSBNQOX527dNG0VECBDt+t8m1R2HhRfWt9lNN
	nWPY8j6zmJRU0Hr0mlHZjIsn7exW9OU3qTAkjPbQcKvxERT+GQwPusv+A4GMfyg/sSSl34fjX+r
	m+wTS/Ei50d0JtJtQlD7kTIZ9zDOmICcfrfGXFgbyPWOfqWAMZcsLcNoMcuWO7hDpkKcliABt1/
	axgpYyWAXgKvYK9dUgYk6ETBwmx6yK58r2SLPWrzZpRw7lIQoLhKuh5TiojAK/zYyx5YbislHE/
	xhlqunprmXcHdymdG2LF2zLuWlBQ5tsrxW+r+LuTe74lDC+8LdnaVS8hQOSLKf/wWxO7JrRCec9
	gsEfhjo9W1Op/4jmMuCR9J2CMC74JVEWZ7vVr6MVR+MveoKEp6sqfY4xNWSccJRM8nJgxEr+VDt
	sOWGNT9w9ojQCANIeUrHJGe5uxxBvaffdaxW1lMQN00WxdKcbNvBqbmND/tADuWM4JjpezuubaN
	53Za0CAA6DNxLgMSz5HbQzkSvRkff3Mx/O7JZmujH602AZDbiFpndzQLUhUuwfEFhuii8mcuICT
	sE7/g4tuzb6DlSin9pcEiSn+YrHYkw==
X-Received: by 2002:a05:622a:4cc6:b0:54a:9f87:4a57 with SMTP id d75a77b69052e-55ac4796854mr24162471cf.3.1794540978495;
        Thu, 12 Nov 2026 19:36:18 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d954e1sm10781096d6.33.2026.11.12.19.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:36:17 -0800 (PST)
Date: Thu, 12 Nov 2026 22:36:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: Clear a pending connection when
 starting the UDC
Message-ID: <57e83596-03c7-4406-b01c-db2ad2298413@rowland.harvard.edu>
References: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>
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
In-Reply-To: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>

On Thu, Nov 12, 2026 at 06:31:35PM +0400, Alexey Charkov wrote:
> Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> connected"), usb_gadget_connect_locked() returns early when
> gadget->connected is set. A connection requested while the UDC is
> stopped sets that flag too, without enabling the pullup. A later
> gadget_bind_driver() or soft_connect "connect" then finds it set and
> never enables the pullup, so the host doesn't see the gadget until it is
> unbound and bound again.
> 
> This happens whenever a UDC driver reports VBUS through
> usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> Type-C port controller switches the controller to the device role at
> boot, seconds before userspace binds a configfs gadget.
> 
> The pullup is never enabled while the UDC is stopped, so clear
> gadget->connected once it starts. The bind connects according to the
> VBUS state that the core tracks anyway, and a function that deactivates
> the gadget during bind still has the connection recorded for
> usb_gadget_activate().

This is good but it doesn't go far enough.

The UDC core has gone a little overboard in the ways it allows gadgets 
to connect to or disconnect from the host.  Along with the automatic 
actions associated with bind and unbind, there's vbus_event_work(), 
usb_gadget_{de}activate(), and soft_connect_store().  In some respects 
these interfaces act at cross purposes.

(There's also usb_gadget_{dis}connect().  Those two routines seem to be 
EXPORTed solely for the benefit of 
drivers/power/supply/isp1704_charger.c -- is this really a good idea?)

In addition, there's a good case to be made that soft_connect_store() 
should rely entirely on udc->connect_lock, not on 
device_lock(&udc->gadget->dev), and it should check 
udc->allow_connect instead of udc->driver, and it should not 
call usb_gadget_udc_start_locked() or usb_gadget_udc_stop_locked().

And of course, as you implied but didn't state explicitly, 
gadget->connected is being used for two different purposes: to indicate 
the current connection state, and to indicate whether a connection 
should be started when it becomes possible to do so.  There should be a 
separate variable -- or none at all -- to handle this secondary purpose.

The whole situation needs to be straightened out.  I think the following 
approach makes sense:

    1.	Connecting is never allowed if no driver is bound, because 
	in that condition the gadget can't do anything.

    2.  Connecting is not allowed if Vbus power isn't present, because 
	it would violate the USB spec.

    3.	Connecting is not allowed if the gadget driver has
	deactivated the gadget.  Note that the activation setting has 
	to be forgotten when the gadget driver unbinds, since it is
	driver-specific.

    4.	soft_connect_store() should be able to force a disconnect, 
	but it shouldn't be able to override 1 - 3 by forcing a
	connect.

    5.	Whenever the state changes, the gadget should try to connect 
	if not prevented from doing so by 1 - 4.

In addition, the gadget should be started when it binds to a driver and 
stopped when it unbinds, with no changes at any other times.  (Read the 
kerneldoc for usb_gadget_udc_stop_locked() to see why.)

And the proper way to test whether none of conditions 1 - 3 apply should 
be to check udc->allow_connect while holding udc->connect_lock.  All the 
relevant routines should maintain this invariant, perhaps by calling a 
subroutine to set udc->allow_connect whenever the state changes.

Have I left anything out?

We do a lot of this already, but not all of it.  How would you like to 
implement this scheme fully?

Alan Stern

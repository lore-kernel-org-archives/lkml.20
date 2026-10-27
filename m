Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100429;
	b=fOdgGQYHx1wLPtZh9qWx0m1X2BLZZOUABgGnD14v5klPYQb3icw9afscbWscTIeTRawf
	 awl417i8q0Ecc7dQIpBuwrXZsPHgBIVTdf07swg2uszRDsQcn8tMrifsWHc5jHseAVNK3
	 W/u7/JwP4Tfw15oOMfp+WMZuR75tG3nDWsmvb49AI2kYFc+LhzoB16kjlDg7gsR89ogud
	 D7su5wWbK9myPXzMe8FmEPMzM4OeTBjkS7IC+Edg/S9E4wKQJvVRvPBPlkoaQaD1/tkWx
	 /zBDqsJWzM9VDdWacqkJbeOrPT7blAlSqOe0AUZe4bN4HR8HdOObNejmrY/pnC00Cxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
	b=rlLWTmSnEPU4ID+WQi/o+f4uK1Mo9AKG7CLqX/HZaoVbWsi+KvYdZ+quYAe9ysz5I/Z+
	 5tM8H2VXbrAgQTWTf+WJWFAyVBBr90dg6WKTd3QkERiI98+I6rSqk5/vPzHxMxASGKguI
	 bANziILNdPORUefv2UsFhLmLBY1eZR7JNhlvMsL1X4+Uy+NjiqDYgfDhPCLtTRYB2EaxS
	 P/oabahmk+wUCKzPhInfGzFc2lP7lC2n41lPAbdjkOKM9Q9YrilTMaTeYts/CKkjuhR8v
	 D9l+2o0ReT9EifWunu6jcX2cGOo39PfCDZz7kac3WFy5+F/p4h2TtddzqRWDez3T02Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DmZLhUb2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA91606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DmZLhUb2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27707495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100427; x=1793705227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
        b=DmZLhUb2kDU2Mk020s03gbi6UajB9n56O6qLXGia6Fd5V3NwcyZNyvddEqhKK4L363
         Kvy6KD1yagn5Ukdwdkx45/yJmH8Ley+9PVOMMfIycCFj917R/MKg5BuiTrKG/PvbIPhK
         B8wxtigfc7+HnacLZjTlwpiCS0GXi+Ehb8fV7uJCENXFTHvs748L5bmU8+4vYKFRaRqW
         surlEFPFsn4GKB4JHWaCB1P/03E0ug6sKTT3xW0RzEfWuM+hVZ5cgsj+63xvKNMR8a4u
         xVFpTTN2etJL4nTW6XAOJKRxSWkrsamMxTdcFxfrispbGjp+vzef0e45guDc4ZusvZ/I
         puSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100427; x=1793705227;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
        b=19jsjmyAdCj+VhnaITSYZnxoiy8+WnBtdQKIJOAZfL81g+7rzhDklCOuyE7cR+p6wI
         EOfICAT67EyDV5gdGyjZwTXBAzgInYFsupBHuoRsnC2pgoZ+H8cewM9DM8GezKiPk0S5
         8hO3ogb4AqI5zl50Mce+kNt0Y4TgSZoWZkb2RXWNFzZO4ncirjlOnkNMa7oo0g3Olja4
         aJNqDsOTQampxQMQiUbTK7o6FkFMTVeSaXQWAxbinuYMiXvyWBCAZWibxz6Ok3gOqZB6
         IKIvK4RMguYdyNPWSLrbC2E0iKZak5SPwRi7TCd5YIHj01XFMCevdwOCzdb0E4ieqPDt
         37mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDfbIIZoeZziuXfMeXnyKUCbkT9T5RqNa5umrxhT0UtBOIrOYdzjUgUCmCn3Hc26kMCA8zHkavNU1AI4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkMfDyHhn79XdrIhija0qHMwjUwBbfXLfdWMNeY7qTZhQ57A+Y
	45BqmK5cKteXCJdnxjuukvj5TnrlpeNo4s+muf5YdEVVm0zqRW1FMSI3
X-Gm-Gg: AYBFou3D4fd+uzs14q0F3WdOr+qXElkSM6xjuDRdIx6k4gaADVljM8UyyMhOaJPUOXW
	IDWVXNyuzOQHCULWs+i8FwRdE5+rwDNuDRNCtb8ol4ktuqAavU1FOKRsKMWkZrZtcY4hsJVgokt
	YsQeBnpN7JEzhGo4DUpfJQDzbQnBdKlQORGX6iV+AXp5et+YcwK27Psl9IdqPVzZKRgetUsweXG
	NzwSIeP1MBzSl0uuT3+A8PWmUYOFr/pkDxILhtJnNhEtpQphWMnrwG6SbRPAnx6CNAzBR70Koku
	uDhlP20Bjl4LFc+2peAp8BMwEVmlRu0PdClDBXohuM8kDcvTtBRuGkYzYXnFJM52lPdNy/oLrIt
	bwtIqDUJ7u2jbMZf8+OSI+mrBVTSJEczHu/al5j4rxktaQGXxOI3TFIg82xm/wSCsMjoqFuZgxE
	BWGbx7t7oo6M+hvie5nhwRS+L1HBl2TPTFMlkgzxtEEszXWYEZNjldgzDZZWI/Owml1+V5B7Yvu
	GBzTtQBvdqjSoIUmI9wQi/5TgmeDbdWPyvWQw1MhtqikvtwNCkZX6Ug4eB+Dubzl0ObiebE9y64
	OoMtzoTK+w==
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr182266245e9.26.1793100426728;
        Tue, 27 Oct 2026 04:27:06 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm449397205e9.0.2026.10.27.04.27.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Oct 2026 04:27:06 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:27:02 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH] xhci: keep ep0 blocked after disconnect until Address
 Device reloads it
Message-ID: <20261027122702.77f01cb0.michal.pecio@gmail.com>
In-Reply-To: <842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
References: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
	<20261027084845.1588204-1-yiyu@yiyuzhou.io>
	<842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
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

On Tue, 27 Oct 2026 12:36:26 +0200, Mathias Nyman wrote:
> Thanks for the detailed description, this looks like a very targeted fix
> for this specific hid case.
> 
> It still leaves the stale TRBs on ep0 ring, and relies on a successful
> address device command to clear the EP_DROP_PENDING flag, blocking ep0
> in all other scenarios. It also leaves xHC internal ep0 in the
> 'halted' state. Not sure if xHC internal halted ep0 state is cleared during
> 'reset device' or 'address device' command.

Addres Device is not suitable, unless preceded by Drop/Enable slot.

Reset Device:

  For the Default Control Endpoint the xHC shall terminate any USB
  activity, abort any pending events not already posted to an Event
  Ring, and transition the endpoint to the Running state.

I see no mention of "halted" in all of 4.6.11. Logically, the spec
seems to assume that SW can use this command when EP0 is running and
busy, so it can transition to halted while the command is pending,
so the xHC "should" be able to deal with that.

We know how dependable xHCI hardware is in practice, but actually this
might work because IIRC Windows also doesn't bother resetting endpoints
of disconnected devices. I haven't studied this very thoroughly, but
I recall noticing that it queries PORTSC before resetting endpoints
and it violates the spec by dropping halted endpoints, just like we do.

> I'm thinking we should take a step backwards first when fixing this
> regression, and then look if we can tune fine tune ep0 after that.
> 
> 1. Make sure All TDs are turned to no-op before returning the URBs in
>    the disconnect case.
> 
>     Add all TDs in ring to cancelled list, turn them no-op, and then
>     give them back.

Seems helpful and harmless, doesn't account for potential TRB caching.

> 2. Treat ep0 differently, cancel all TDs on ring as above, but still
>    reset it when halted. Allow a Set TR deq pointer command as well,
>    and only give back ep0 URBs after this. This partially reverts the
>    two patches that caused this issue, and clears the ep0 halted state

Sensible, if Reset EP/Set TR Deq on EP0 of a disconnected USB3 device
don't trigger HW bugs. These commands only change some EP Ctx fields
and don't submit or abort USB transfers, so they may be safe. It's even
possible that they are safe on all endpoints, but who knows.

I don't think this will cause any issuess on Renesas, even generalized
to all endpoints, and I still have the HW and ability to test.

We could use some input from the author of b8c3b718087b ("usb: xhci:
Don't try to recover an endpoint if port is in error state.") about
those issues, whether they affected EP0 or not :)

> 3. Possibly keep EP_DROP_PENDING flag for ep0 until
>    xhci_setup_device() as this patch does, but always clear it in
>    xhci_setup_device() before it returns

Does this result in URBs failing to submit before the device is
addressed, causing USB core to drop and enumerate again? That part
does seem a little dodgy. We may agree or disagree with core's
policies, but they are what they are, and not an accidental bug.
Doesn't seem suitable for 7.3.

Regards,
Michal

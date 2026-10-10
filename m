Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB372D8378
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596995; cv=none; b=rOgQcLLNMUVgPcO5bPl1gsU3bKY+CVZKjl9Qlc69DjPOu0QdbkhCKVkwji2OmWhXEiNfi5lMDbt7y5AqqtQKQWU/cW/tx213Zo1l8ISgFOUzmOKlfi2aavX8kP1VWy+aJER2Sg9emfTzqFlKe7DTIPVH9gx2a6ADJddsWMXxWUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596995; c=relaxed/simple;
	bh=W8wqps2u7akJN+4Ig9t6psXDckfkXSUUQ2f8o0U8UZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDpFTrDz2vcUazF1V60zi0T5SMsTMfH9krcH7A88mCenlH6jfSo/R9GfoHWhzKff+FSPJs8BQk2CaY60moLnw9whJwBPrTC/83gfQ4D3bh95DIsueHffS76gfb/UH1SqO9FiU9WXmMK564v+OAoKfG76dK7COrWqT+XN3tAWUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=h0rv50zN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="h0rv50zN"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e6eb77f0bso24919185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791596993; x=1792201793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HX/UZz27MsL/V4wPwo8QU7r3MDtmRSA6wmc9p+u+eaw=;
        b=h0rv50zNK7QcikP3OMWR9EdOF2nwETLIZmWWrZ7fAA831dFE8Vyefmcech8nSkLGf0
         CRkGUfgaEjRjAVSpjZ/ThMl+LT4g7dsIx7bOAxtHY0Xhr2d73OqVWQY/sJaI1QLw17W5
         WUiFVUwol05yUlIGOhOPVqESG0Nd9ORb40InwqJ1W6vK0jIZfDEXW/YVTpB3BbuRSJlS
         8Ww/cynKNshbsqR8an72oczLqAQz+hUcGefw/4VQfOSw5KpADuLGK/tFr56z1PZXGLu9
         mSce69P4jdeB4pYXlBqoO4MwMPBF7r8L/zbfZl6BEWi6RZfYCwl0Uza1l+YuZqZt5WkO
         XmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596993; x=1792201793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HX/UZz27MsL/V4wPwo8QU7r3MDtmRSA6wmc9p+u+eaw=;
        b=DY3rqgliC5NoZUAqNj+v6m46QQw4B0Zc3w/gv9KfK+KKkVeeFNhbbLAeIZwfaa5NKk
         tRsGLQme+tuQR1rzkBlLCuuID+9hdrbmATAdRtzOtV8XKKiUDzfTaZwJLmemdjCf6wrO
         OySNL2rzoa5cJCdWE+SFU3Euh8yR4Ln8OS+GwywzpsSbpWtkDdb+fa7RtSpoV1FsikBm
         M236QS3XGic9RgNoAGBMPxzz5R9WMGYfqq8BpTbIlaj8QgYeShXOgjclqndXaxFD9GIT
         HYTazKGnWdVLofzsUv6sHJ4kqzs6ZE5j8QT2AjnSNDJax3k8w66v9dmQFWCjWnemsIvy
         PHGw==
X-Forwarded-Encrypted: i=1; AKwUvBxzqXWEcqjELwkz4XZynI/WkR6H+VBUaz3nzbuJfdDPr+7USWeZQpqo3ADwuZwzrBEh2vdTLlRkXflkGvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfEkm9ZeLbDeUzdsHw3J1xeaKuNK1Z2LJs25d9kPSWOMDJD+3Y
	rZVsrieLTaRNAXEa2FM0FsdodoIwa8QZKrTFgXmv5IJsHpKANOUYuQxcQCJyVh2PMQ==
X-Gm-Gg: AYBFou2CgnDDhLJ8xOT0n0I7/CGE2/S79NjTJ5a+SpTaqJHug6vev13LdPf1GplEF9K
	gAqgRUhfetrtHYY7gcEVTTFHZ8Xv9oQ3vzvsIXot6+pa9oW9nw8QcwKU9CwgzSOmmfQPH+qcD1K
	znxv0eJNX0/JNFGN6N2PIC5bHF8zniTgTlrHCdSMROYeEwpkowPD0PSanir0DaAbXtxU91fBpfH
	SKHPakk2/Z4jKwcIa/2tKLsoGKc082+LP7LLy+6hc704hxyoQby3c5DMArb3Ksiz3WsWJ5paRIt
	eZnJm+FDkoqtaaY3CrrSk5k/dP2c609+sxJ5bRNPxSvQBPb1XBeT7asfg366X0YkX+0y4XRpQrk
	neJ7bNYo+6quhh8U/MGzY1FZsK/uCke5G7rokpHfxJ5NY2GkLbWRQ76rXN+cXwnoB4HSAGmTmK6
	ztx3K+Ue8IV0xi9py85Sv3pPODrzX/XtMY2pTsH+IO/FkrtiIR7tv5N0nxx12cN15yc6EorkI=
X-Received: by 2002:a05:620a:6cc3:b0:93c:6028:6d2b with SMTP id af79cd13be357-93ebd208cf0mr636124685a.43.1791596993106;
        Fri, 09 Oct 2026 18:49:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm316485585a.35.2026.10.09.18.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:49:52 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:49:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: mosafer <mohsafer@gmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	khiemtranzo532001@gmail.com
Subject: Re: [PATCH v2] driver core: complete deferred binds when
 drivers_autoprobe is off
Message-ID: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
References: <DM06HWVAFSOW.2F050J0BT27TK@kernel.org>
 <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>

On Fri, Oct 09, 2026 at 01:22:39PM -0500, mosafer wrote:
> On Fri Oct 9, Danilo Krummrich wrote:
> > We've recently had another patch to fix up cases where dev->driver is
> > pre-assigned. Please see [1] and the corresponding thread.
> >
> > IIRC, there was no reasons the remaining users can't just use a proper
> > match() callback instead, so we don't have to worry about those edge
> > cases in the future.
> 
> Thanks for the pointer.
> 
> I had not seen Kien's series; looking at it now, we are attacking the
> same half-claimed state from opposite ends: his patch makes the release
> path tolerant of it (skip klist_remove() when the device is not bound),
> while mine makes the deferred bind that usb_driver_claim_interface()
> promises actually complete when drivers_autoprobe is off, so the
> half-claimed state never arises.  If the direction is to remove the
> pre-assigned dev->driver users entirely via proper match() callbacks,
> I'm happy for that to supersede this fix -- I'd be glad to help with
> the USB side of that conversion, as I now know the claim/bind/teardown
> paths in detail.
> 
> Until such a conversion lands, though, the window is still open in
> current releases (syzbot hits it, and any userspace writing
> drivers_autoprobe races it), and pre-assignment is not only USB:
> drivers/w1/, drivers/phy/tegra/xusb.c and
> drivers/mailbox/zynqmp-ipi-mailbox.c pre-assign dev->driver the same
> way today.
> 
> So please treat this as: whichever of Kien's guard, this bind-side
> fix, or the match() conversion you want as the canonical answer, this
> patch is yours to drop or pick -- but happy to have your steer before
> it evolves further.

IMO, we do not want the system to limp along forever with the device in 
this "half-bound" state.  Claiming an interface should cause the driver 
core to create a real binding at some point in the near future.

This should happen even without automatic probing.  For example, if both 
interfaces are unbound and the user writes one of them to the driver's 
"bind" sysfs attribute, both interfaces should end up bound to the 
driver after only a short delay.

Alan Stern

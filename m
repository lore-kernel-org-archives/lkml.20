Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33829361960
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302748; cv=none; b=Vp7pggsTihxaSmp9F7Q5KgRnh+UceZYr/W32U7t7l9nA7os07ol2c6leJdpn2iBOezLmADDV6zyLh8Txrd3UlT1chxlLvZRzrlZVo5zp0mYHkbISMVwH1YuHESs45/lWPksgKGfyYUqvLz+y6E15ENqmM5insG++gnGRt0I9cCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302748; c=relaxed/simple;
	bh=AmMY9+JiOedVBwkxJkvIf9KReIiEj6fvyuFyhDZAsuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCh2KIhDy2dfbRGWcK1ZnQo8bJ3HCfBD5zlb0fLvg4l/hLOpOiXxh5di4LSoZLaiDiHlPqH4limyhDIQ6YHih4yV01OsrYYsMi1KBsR43eJf4cJeaSLVpPFlHL4WYr9Rnf0zE3xpBhMeglSdy/Z9M9ywvJq6KYmtJYYKELedQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch; spf=pass smtp.mailfrom=oes.ch; dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b=Ow4uhTER; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oes.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b="Ow4uhTER"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso3710835ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oes.ch; s=google; t=1788302744; x=1788907544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pbcWidxi+5W3ugdRwHYPgaHhKhKyuwEwYBB8DF4jk68=;
        b=Ow4uhTERmwrAgiEIA6MrgPBZW8OhaSKQmE6yXxYaT8gET8xgR+z486tUSmo+m6jXWg
         93HyJ5r5KZIno8T30gnYDDXpF1rkUVhcMm6jNLIYnYdioHwe60PZcXr6WOYDSBNnI9Sj
         WMSjJ1nqm5eEfe+4rZrMc3swn1DofCvVMEbwvSW5U2RA4KdVQwjHFuzCw6GMDRLfPZHj
         lQMPjknkWENP/JlxAvE5KMIPtZvjFzxM1iinyRa3bNYAclUeZD7ZraMh+Y2wGcjpHHWp
         r/0RRHJ/rajA9dWHa9Y7FfCN6LqFdrALfPllLajN7ccbhvtg5TO6ca7o470ofAx2seqB
         Bh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302744; x=1788907544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbcWidxi+5W3ugdRwHYPgaHhKhKyuwEwYBB8DF4jk68=;
        b=OAIgyA7J2hqwxareWKSfmClt22xg34S3xGl3UTDimY/zeqZHSraV0V7CNz103yhoMA
         OUjtfb7D40lOzXfgKFF32uoNdGs4hGr4ZI5/lEUAdvfFo6LuKxcjT+ImAgTNLHJK3Oyd
         v0o707Y+V+AA/sWSUtzR7tUdNcAxXF+vyqWv0YopZfTpZNAX9Vqc2cfCGDBihvjemfS1
         uWw5B0V+XjJn26Z5kFXN0Z6uDP9w9Om8CUBh94ffWlbgy5Ir1heCaBSWErUExM4tnHMm
         enbRiPnAfO4nIFFdx054pOJbPHOmc9ztNeUdH6shVXXiXYktE5GIGq69m/v62j4nI2wj
         6GwA==
X-Forwarded-Encrypted: i=1; AKwUvBylqkjDGU+9WFKL8o53ywA80nfktCwqHNYGTfj9TtoLi7KVkclfkCcp/ZwlkswlMyBav8FxjhVvtsHonNU=@vger.kernel.org
X-Gm-Message-State: AFuF++nv8nkTO3LoVXcyK5GbBF2HvXm/Yj5XJxs7nGR4anqaXEg/u2fk
	3sbL+3z3mH5CaqqxEnkJOBELSpiacduF8eF08u60GpgsK5uRiDo2koTzRwliPP6tXg==
X-Gm-Gg: AYBFou1742vP8rhvaN9vUeSLcwXTj739bCFhBSg7fU1Y7fnOflkK+wFewyiieqJNVD7
	Q8XevdLHUDOuuGWb1cM2Qr3bAfZutygJrEYauXDRuEI320mRZH4C4tT5UiAaOXYv6ctWtw7ipjw
	bTyoNpjhyTmWClSnw6jbp6A+WajU7FC8q7pCZ9sLcrqpE075d15gQVBRWCdSZPu/l4j4zo9yPQB
	zODt2az2Gsp17KTS0KdDSoCSuvfK43496lKZSea7rIXzmaNJ4pdPv+TcezGx6+FeTU3yushdphx
	xessNhaBQdcivF7WxhWgnC70My7tx4I6bW+G+xa1BktAMDepQJB3fj4QTZz0gn/lozW0XLXmBgu
	AfmWVrab9CJZivQ5YKbRK4ndefeuSMFYXjQ8KXH8+tGSQQtbp6b9IUrPs1shRj3GlWbn5sYDjpR
	Bmv/aUQ/Mh4zgQZUWlI557csUnPqMT3NW0+eGlbvKmu1LB98m+RoOMNfveBBmvHKBgMBPZ01LXg
	wDkVKGuRFRniixBb2NUVQWUqpS6O0oux7+sUkuEDru94mPY5RR8cVzdCnk6Va33gpqzgKa/kJCx
	RYIH9bw5rLAF
X-Received: by 2002:a17:903:2c0d:b0:2d6:f988:398f with SMTP id d9443c01a7336-2daec6b1e12mr6735075ad.12.1788302744259;
        Tue, 01 Sep 2026 15:45:44 -0700 (PDT)
Received: from cosinus.tail5d817.ts.net ([118.148.155.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd48865csm3829475ad.54.2026.09.01.15.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 15:45:43 -0700 (PDT)
From: Julian Oes <julian@oes.ch>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	oneukum@suse.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Julian Oes <julian@oes.ch>
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in endpoint
Date: Wed,  2 Sep 2026 10:44:44 +1200
Message-ID: <20260901224447.50777-1-julian@oes.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026090142-walrus-zipfile-70d1@gregkh>
References: <2026090142-walrus-zipfile-70d1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 06:33:15AM +0200, Greg Kroah-Hartman wrote:
> This sounds like a broken hub, why not just replace that?  It shouldn't
> be causing transactions on a different port to stop.

I agree that ideally my hub would not do that. However, my assumption is
that it's not my specific hub that is broken, but that this hub (or
other hubs on the same chip) have that sort of issue, and I was hoping
to be able to fix it for me and others in software, rather than brush it
off as a hardware issue.

From what I understand an endpoint halt is spec-defined as
host-recoverable. In the current state (without the patch) the read
never returns data again and the user doesn't know that it needs
restarting.

My patch is meant to do the same pattern that cdc-acm already does:
EVENT_RX_STALL → kill → usb_clear_halt → resubmit.

> > +#define USB_SERIAL_STALL_COOLDOWN    msecs_to_jiffies(10)
>
> control or bulk?  This comment does not make much sense.

Sorry, it's not clear. Both: the halted endpoint is the bulk-in one,
but the CLEAR_FEATURE that clears it goes to the control pipe, so one
recovery attempt is a control transfer plus a bulk resubmit.

Without the delay I saw six stalls in six milliseconds. The clear-halt
succeeds every time, but the hub re-stalls the endpoint as soon as a
read is queued, until the transient is over.

The delay is there to stop that becoming a tight loop.

I can reword it for v3, depending on whether you agree that a stall
needs clearing at all.

For a bit of context: in the past 14 years, I have been working with
various FTDI and similar USB devices, and it's possible that I have seen
this issue every so often. Usually, I would just re-open screen, try a
different USB port or hub, restart the hub, etc. It's only this time
that I stumbled on a reproducible case, and had the capacity to dig
deeper using an LLM.

I have been using the v1 patch that I submitted in May ever since and
have not noticed such issues anymore.

Thanks,
Julian

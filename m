Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716314;
	b=ngf6C4EYrtgmEegqoYlSGTLFcDpB2caveAedqHTkBQwjRNzUoLm5D4JhVU0+mRHLRgf2
	 ZtErHkyEArofroxM/x4Tv6X+/NClHDeGdk5PnJ4M9FBZ3SQ2vwGx/grqPMw5Z18xUlkLS
	 qFSWOhFwhXXG7xNggExsKcdj68icZZa2NxN7HxfJYhiBBkN+i/V15rdJKBQ9k9cgUeeo8
	 HINlZ2g7IIUroc7MPI+eB7fGk0bpuw9VfdXXaJ61R6QLC2oVSvUix8QigDNUk1VZLBus+
	 mmO7srSh59/Dj32ajy7bpQeVRRnr2shLHZkYX7rUeSrrd9Ffm3mZz5AsZYK9shumL9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
	b=WIefWtrVNaSxqGAYamnYKi6eVqunZgsP4qjRi978bJpFn+fymGB8Vvb8AWEKO26uzE+Y
	 UEAiyF6xUEhx3gW2A9UWgclhwnobChMU0pce/TutZ8msBUaUo0Nztj7y+2y85l6OOllMl
	 R1Qix93wljH/XZaMiUgYnVUtHFfPf6fzQZRM51QotoC+RE4tU0lzQ37zY2rldanv8e7Yf
	 /Da9xlo4TOkMjHqwbLPiIbiDWO+Z4hVgw9N/EIXbEkAokzi6mEDc1/BTA9dn2oVbYzKu9
	 Y8r3YmK3UrWcE1Y0juDwdZy9wrTlinBqOPbhXzAZlxJWsNRKX//C6+P+6uqa0foCsbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Smap8oM2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5760606EE92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5760606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Smap8oM2
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so1121021137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793716313; cv=none;
        d=google.com; s=arc-20260327;
        b=YfeIuz1R2kXIJTt+6IhqqJTha6AD8i5MvUiP7FvZ0KWB+5cXnMLmreHL5Wt8DU39SM
         Z2QpSD4LpJzTtAvazVBX/HAI265qvT8ealf+bjh1vCrXE53jYNoPv0ofqNuvGlaHimJi
         vJVHnGxGCzNyOBJVqonX+YYxtchXydH6ixR0jF4BzysJ09BGcjhNJGfS9vBVKz2mIxxP
         GjqfIQIeEzAjq506ZealPsrBtv/1qwiD3xswVdeM1AFJOOkznira+B2fZptTr5yRD2MP
         IinQ3xmtHcF1/eO0/gjQN5OAAt47SMQtaUo2z9L3RQqOyL4WVfoPnZ1R8fChWOfEoVaX
         zcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
        fh=rIadowESpaS2IuhcJmIxLFRsNVpj2bqGnGI+ksJxTUo=;
        b=nAIgDxTEesxkJEpLPHB6LcyjktRc3Uj4R3SjhCZQ0jBxu15t/BC+UauhlHv6AuBZ8X
         XkogptzR60SSZCPYaPyukGUN8wM5ev608+y6n0FSvH689zI2qZ8tRIXOkjciOU/GJEFt
         42cNZCb9BpOGQg1lPPNKUHB1xnrqp4FJbXLdPpZQNCvHXGEuOlBnzs6tFSg6nsTZr2VA
         KH2nU5QU9mXegCJdDmfc4sMEgV3yIAW3JjerDdr7XM6zeAjk69H9KfmFcQmvJIzlV7O7
         VzHhj9h1P9VFnVSOwKyT1P7hLuCbcCWrVyTy/1E9oGMtpt+1RvLgQ+uP0MbYfR4SQ2UJ
         WVPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716313; x=1794321113; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
        b=Smap8oM2rjkTf+PYKTVPK2ndHEELHMqi0tjCUI7riN3MY48HWBq4D/TdHkTRGNcaec
         GyHm10XgVNZwwrVPvboT/hDR+bWUe7CjR7ns+sDPd00oIbJ2bI9xld+L/ok9/0vDzk0H
         AexPapi00ZZpvL9tohtVIJvcNwyJK25eb8gLP4RwrUtxEH/SqeXg+P+SaioEGYKqZTy5
         AtUOhygCwyPst4C2310sKGT87lvjNf/Q5m0c28RlpRyK5gLNDq8mirv1Vv5tqt7aqfAI
         12pHtThiefiNdvxI2d7cqsewhDd3y6cAsbTIgPB4SbzZtR64mtTf3wsznFMClB80RCUD
         a0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716313; x=1794321113;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
        b=EyytYDZpVaRWBCYcFifiO4rJmw0QWnd1yYVIt6zmy14UaFA9C/xk0fl5XOiE5tzXlT
         vaRzeQUij+Jrd6j3HhlBJ6aBhWYACA2Th9PKAMAVg1bOjtXjSGVyxRXmMGTkU6fM7EsG
         6FVXuFuHe4bzu/d1yhRkAzOq/owNgYHOxM437L8qMwJmzwt8jflGaL1wVcjcDveK0GnN
         ZALqLK9rkU0C41+zr9jFGQqXkbryNIOnM/waQpW2fWDGYy5gB99oWc/0Ju3bzeaxMeFW
         F/zAozV/MycnYIIOVo4V8mi31tbIA8IPrI+BAz3WHWMRYREYU2SmHr2+8rIXs0LkpgoG
         Zc0g==
X-Forwarded-Encrypted: i=1; AKwUvBzQPBhivququczVSlIBAfVch5+obXWvMzVeAQJAv3gJbKoVR0OeMyyQjJUVk7GNc91UCIO1S8cLkOeuQ4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5YqJ2GbBJnHtQnU4xbdw0RUyRyjX5b3HlAeGSWmvxFC8s5my0
	/jIgVDmFnBKJMCirsnjYajLjD2R0DLalzm5Nm3QYys9npsOR9O5njoL9Yl1o1QJksGrUV+CCsgt
	HqYY0OSRQSE42XKfTcgTmeo16KMAwRn1kfR/E/Gk5rA==
X-Gm-Gg: AYBFou2dFco6cFoWYy2FuVGp/aqyx6IUe8jB1daIuf1vByXY4D7Pm5ohufl6f6BtdPn
	tFUrVLim5lqG8uBTZI9NlVWzrD/WEqyP9KBcwfAzXe04rzT2zjj4/aw0GO/0E5xGqmEAUW0jMlb
	BlmdeppKDYYevMqMO5kbBaxUzWfcW7y1CcgJPg0Az65qYjjPhknfDgZLXe4zkwEYU4e2R7I+FLh
	0ZcECg8yPa089x8GW268qad6UP0QWOw+8wgw/foGni9LxpETuMjnE2BDnqT7dxfpuPuUZY38Dpp
	JiQiMPkYo+y092inG+zz+sz6Y8KLgS5e5gu5qC5lFdcH4ZvWgJg5iidmb4aQ2+lfxl9A5beaUzk
	8hLkBCoOs0iUr2IBbg3yhz945XmrbPwymTKfJCFgImMV5BU9V9vrUfIM1AmGJ/2FsVGS9d+yQZF
	PXvIsabk2nutieKavBY2RWNuRoK19byV6/YZeDkrW65EkzflFv2vALKI8CkT+Q7Ksi5u2WtolNr
	kbcyn83jQnnJIsPsOPCLqY=
X-Received: by 2002:a05:6102:fa0:b0:7cc:118e:7bfe with SMTP id
 ada2fe7eead31-7d072626940mr4818312137.19.1793716311133; Tue, 03 Nov 2026
 06:31:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-13-kmehltretter@gmail.com> <CAMAsx6e0fF5mwfruaK7e=uHehVfjMP=Cy7jB_Z_e9aXTk-yZPQ@mail.gmail.com>
 <20261103092458.2e5f6f6f@gandalf.local.home>
In-Reply-To: <20261103092458.2e5f6f6f@gandalf.local.home>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:31:39 -0300
X-Gm-Features: AclHuK-_rxqavuwe2tcDwhaMYrtMJgJquiSsapHbqp3XF--B-b4Urs6Hv6vh7Rs
Message-ID: <CAMAsx6cc6NFi-iHU9QLptfpoCY+0QP2V+CkpwvPL8Uxx_EK1PQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/13] Documentation: entry: Describe the
 pre-counted hardirq lifecycle
To: rostedt@goodmis.org
Cc: kmehltretter@gmail.com, peterz@infradead.org, tglx@kernel.org, 
	bigeasy@linutronix.de, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 11:24:58 -0300 Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 2 Nov 2026 23:39:28 -0300
> Daniel Pereira <danielmaraboo@gmail.com> wrote:
>
> > Signed-off-by is missing. Is this an oversight? See
> > Documentation/process/submitting-patches.rst.
> >
> > Also, "Assisted-by: LLM" was removed from the docs by 1e035297ffda.
> > Maybe describe the tool use in the changelog instead, see
> > Documentation/process/generated-content.rst?
>
> It's not a requirement anymore but there's nothing saying you can't have it.
>
> I personally prefer the tag (even the old one where it said what LLM was used).

Hi Steve,

Thanks for clarifying.

My main concern is the missing Signed-off-by line, which this patch needs
before it can be considered.

Karl, could you please add it in the next version?

Thanks,
Daniel

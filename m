Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918144;
	b=HBLgrL6RsDaLRjDcUIlhGfFyDXVfkkDNmClv/FqhooMsMKR3FwLnlt2EkLo9FIOOjrdg
	 j9dB46c0j230cIN7rjTO1treg6wPWFuLvJxifqkPKQDgLOL4sh6KvdrWpz2vhjmVJ3LIh
	 DelgxxVGup2gPyR4mfp6i7RhgjMkfjH/HZQYOu/rQJpb24tkXVKJWn+vnwYwL8NJOhWfp
	 3Po0TGTKkHKg62sysY/N1aa18hU4SlT4AbjMVnKdhCMx1svnH19rO6Zv7kSkUtNfcLlfU
	 lIutHtuErvNR3bZUycmvWAaM/l65AXW0w0yKQbsJFEUOUTjaMFq61VEVSNmM657bmoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
	b=EoG/G8n+rpoeFwi48s5XBS14wewihcvF72Ywxp1fQg1jJfEp7s2O0XpfMYSJ4oK1ucqK
	 UX/HndwuS+rI5NUYHapfRwfxvR3k6opSfXFXt4H5dQCm93VRfYsglOK3kuFpLhYIRJeOa
	 ALx7tLufeqEY6a2buGo8/MIOnDERpa77F0R9l/R/kRbtXZYv/j3mIYYqW9BLfugvOITw0
	 N1GAr6F1CCYowYQRW9cAd+y7m7qRn85SfaIJr4f4xR4JkmLZx1LhabN40J1KM+KrbqUfN
	 DEgNprmY1DxiBLCc2DX8+ZbFU0t2q5Q7F8HI49S+NMZXD9vwv3dsIPQpXAAt0/E5sCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpotCsR;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B05606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B05606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpotCsR
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so45720145ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918143; x=1795522943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=dUpotCsR8VDbxO6BPwe2pm2Frlg8byuRtnKfEYVQxIsJBIP57ZkkVkb1pTQTWPWgFg
         72SwPlggj7OMi622Vo5qpvNu3MddcOt+bi21dl8PBjMZDab/rWf9EAYXttijjWjgJ3Mr
         Xs2+igDLWg+FyQrIRH9slYhs+lpwrk0iPZzVtXxAAxOFGxTS7JXoazTeg5v0jfn9Guwn
         e7rG+9N/6gBN8zWkhYHNe4kuq7J8Z4F4be+Kl+yR2jl9Oz8YD4ZvnaG437/cYcwaN5ew
         oVE6DYCxwEPiWQvCbtJohUg6d8pdXZovciuRaDhUUH4RFbA9e8eIe0p1f19jqkPJCgGT
         mREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918143; x=1795522943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=e/6bMZFK/aJiUZqNUX7eRbzG/MAx+X9KuThrt1wJ+WfYRsPxhwkutGPdfEdhYXVq0s
         LgPjko/S11/Yy73O7ZgHZRDWgr04+dDO7OzT2IUk1V6dsuheHNlFVyNDmC4/AtbR2sH9
         goAygs0aaTY5esfTM78WFbiyhQYK8jhx0zDzlWQq5hUjEtfvTjdcABsSpiS+seyxrauk
         hnaCepMyt7rfJ5x5XRsBktDhttd5u4u+pQlyHLs1EyqFn7Mx6B/y5/zftNOrCl5hjC9l
         bx+D2ZOotF3+A+FtErm4TBPwUTA4avbiW5JjdnQKEZLjG/gmi6xqrZTzXiMKJ1S2hh6B
         WLMg==
X-Forwarded-Encrypted: i=1; AL+hErFvXSb184jqKJj7qAdLjFJAq30DzxEuOpOTqHPEZz8porGWVeSp5adEf/scYOWgLO8W7mtSpbqB+4qM1bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T6iU22FC5jMw6cOVJemFBsFk/5k4RAXi4yQn6T6IhiCkVMBmY
	qf3xI98T77owpBes4l2QtphU1TGsup+5o5AWMEM5nlWRyfiIO39tuKkh
X-Gm-Gg: AZFdTZdMjrmtALjK7t0SfSCigDnPvfhtqv6NiksBzfEngjkgC/42uTK+gflnEhPnkHX
	Vmo0WOlFqSyB4puT8QbliZtVmFxmC797viM9xR2Yjncs/T4QOGfHu1xfx7qJsjYYWLC5tN1S3Fn
	TUnaFysoUVAK9wLSQUlA0T8i4lxr8RD0BMcfwlGjQvyGpW+gM+4Ywpi+CKp8nz1YwjnpkXZXTou
	NfTiId0PnpJEc98bIQLokEZUPp43I9V/ejL++xtzRPDnBVVfW9cAJgKC3eq8tyXG9WdoPO6rcIb
	bAh11zacN0cPu6EmHPtyz3ULckW6kQWGiTSqEWaWwvUZm6UEK54fqqoUP7lme5Ty2xplCZJ96TO
	nwofIV/2Jy/rbwHSvymGO8ebxxWQHTtACnyGiyYYsztKv8juoDWDq7p+KOrN+F/usix3dIRDnb5
	K9vzKplC2kkMEYBv2BF2CzjgMq1hoVVD4vtGNgYSA6gyaMSs33Mz/Y/ys3iFkiGs8xH1SOos7b7
	06wTR2bV0pD/Hgzf8VadBoKwRtjhvUscly8z60R3FUd5mz+g7gHvkRXMYVey8mCXmBk3LDUVUHF
	kBUdnDfe3Y4DmfxUAJQL83UVKP0/
X-Received: by 2002:a17:902:c40a:b0:2e9:5059:4468 with SMTP id d9443c01a7336-2ee0d664b4emr129370335ad.7.1794918143343;
        Tue, 17 Nov 2026 04:22:23 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d86a1sm14701045ad.8.2026.11.17.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:22:22 -0800 (PST)
Date: Tue, 17 Nov 2026 20:22:15 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	aurelien@aurel32.net, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <gwtbssramb3rnp7dgqxm5fu6ywkn2h2jigdh5dvj5fvtv7rktk@upytexvwkjaq>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
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
In-Reply-To: <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>

On Mon, Nov 16, 2026 at 12:54:42PM +0100, Philipp Zabel wrote:
> On Mo, 2026-11-16 at 15:54 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> 
> I don't understand this, possibly because I don't know what GEU is.
> 
> What is this reset shared with, and why exactly does the reset need to
> stay deasserted?

GEU stands for Generic Encryption and Fuse Unit. This reset is not
shared with another consumer and only resets the controller state.
My explanation about needing to keep it deasserted was incorrect.

For v3, I've switched to devm_reset_control_get_exclusive_deasserted()
and removed that explanation. The reset is now asserted on driver
detach or a subsequent probe failure.

Best regards
Jiayu Du

> 
> regards
> Philipp

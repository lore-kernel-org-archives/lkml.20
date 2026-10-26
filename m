Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040200;
	b=vOVlLsRUWObp5BnNX0hnbHKx/+bby1iNv5Fy+ZGvk6ag/INH5O4EwHOJBYxImOUp+KjQ
	 2O8P4Id9+RgE/YWnxRGtsz9m6EdhZom3ycjXVzI4WN070g4xTaLz8r8FJx3ldC2X7kiIc
	 zY7ddu4rVg9dXcv0IgZ1+X1zzGyDg7D2TZgYmB0rkRVmOTYtkVo+q8j6Tu3pF8GW40dUJ
	 3qnG8bPpKj6fI8t2KxuWyPc0oe2PrctZt8x/ejxKwjl1b5JSEKzELND0KJoW/51srcp1j
	 Jct6VVK9FfgQc7UH9L1wd0O+7zfpzbb/ugv5cZuHhqXrugDaV1fo9lTgKeASGfjHD9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
	b=q4yY3ev+a5jJ2REUPvBVpH9VdO8j2OdGL7ITxFD3Y9/isl8sqm9DuoKFjXBppYXZEQIO
	 SwTTgcdkYb0xzEqJf+iyC8hnUbjrxN8yOnCg2XK7NBq936VPRW1b+Q4xXGnovxMOH99Br
	 14tAaPjGzDG4ROJIbOu9HNK49DIH60fHQB81l1AYerWcE1vLt/C95syanpQp9r40vltec
	 VvOFx0P66RkRNi4C4I54w51ZUsRROOPqS/gA0TPpbwMBtH9O0W7V12+ZSKMnWxhqq/9wB
	 bXs+xkDPeL/pfFL1Yd30hgA1CfDKMHEEq/xtx1bZZb8PP/d7DEDyPQqmwGu0jAb2ieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33159606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33159606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b83459526so41410626d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793040194; x=1793644994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=azZPsctqXRKqpOwzOSUanbXvvxd+v2oxaACaz4naHK4U/NBQWTZSH1+8VRwPrLVwY0
         DocnyrGmPyv8LQRxTMk4K4sAlQVJBR98rqP+2aWoEAiU0n2xJtP2lXe11PdsBX9zw7zH
         rykKuo4jE8Sw3g1ZHf1cUaz2vGbXwYAs98RHcsf375OaxpJvYYqyPF71AEMIeOtk1CIf
         vDE/ajmi0uLVqaMusVBTVkVR8NUGi0AybkTdqBwAenvqpPLeBFRcUdif9SgXW44+UVBP
         XcslWkg4kCuQnmXySZ0RwdZ8wSe243a/pyuPpY5dxc6Pr/hlCqlSwaLgYcUdwFY6ZPLq
         p4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040194; x=1793644994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=P/6u7YEHoaTOc4CFNHVAJuEPR/KFSo8QXQLd4Tj8/DO1GuB1/8oXJGb+PNOtR+Hoy3
         bhuTbYJb3rGC58lnSV+Xriw/hyvDk6uJvAODdHyTuXgm07yrTES9MZQMgdTHg8dzANoD
         Q1iEst9frpRHWRmp9NoEBdwW4349S+d1naAPRg869yiaLyRW7BxLZKBJceJn3EpgWmBc
         7iEOiV5LObEBWNeVH0Mj4zKNpqZ2L3tfjF7r67/yIdUW5/ZxCC+/hvVk0z5pSH2U1Vtv
         A8RNJvJpsP+BT2l72aQJmVxgdQXe6fVn3A72Og/uJNgIz4XZrzY0KDJQZoH7Pfx9NtnJ
         d1yw==
X-Forwarded-Encrypted: i=1; AKwUvBxj5LdiPexwuE0P11692vPtTRBHLfH3imH+swVhnCVT+1qTGeXKgw2boIIgkkLuAB0w5U2DAxzWSJPkOy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0dMa5X+ueD9ol9iZnfA6Gb8BRLWVNV21EReoIGNwF7nSqnoHX
	zsk6mdeezcZRnE9q88Qfo8vx6+2/MVWTRsAG6HV7hV7S6a7/7wLj5uvG4O/iLeXWLh0=
X-Gm-Gg: AYBFou129ddn6GnSd6x/k20bbkowbksMAWOW5byD7rNk3351idogeBzis9QBt97s0cL
	amwwZeCul9WTzpEownBMheVOziqgCuTR7+OyjUq4UD3XSPFhOjWEBU40yIwomyv5iujCkgKkjiS
	FsVBsZKMugqvH1BIB6XHWG07et3fFWnhO7Yf5rPzIPRuaBrpZHmtvaQiJD2g19vLEm3QCSs17K5
	H46a3S5lHhX4GcE9b/V+YtSSm/Gc+95pcwYO8mkWfFYaYGfdfRCC8iQDloSFsE1IYVldOKljGcL
	Z8JAVI5lJgol6MhzvZn5REE3GNdIW9Qn2zojmbsqHtaYKCCFD9CZw6lmq5jRnqciZ7nXNREj/45
	HlTnThI012uFI6tnl4amxkkz3NrmQkSLAnyaMrOl5hxtKXHGHFH4xxBr2evN1bdUrTL+468laSr
	HmXgTdEdZo/UmHPpPaPyHldsVHOtyWZnocHirIRJXACGmJypVk9W74XMkWvDeSyPSiU79yorXtG
	TVJXMNj/Bdv2QP1GJRCt8eiGxdYED4Ai/npX6bBPJSupb+6GoKJEPRr3UNxS9TkC74npBIEtdjX
	8VFFhmy9gjGdZSe5Z78P/2m2hwhGlEbtxBcD/tnvOx5xb3yL0Szh6I1Y790GbQPzFgcezX2fi5p
	rOAORoStHMuY=
X-Received: by 2002:a05:620a:172a:b0:939:6c31:2318 with SMTP id af79cd13be357-940ef8d8389mr1233127985a.34.1793040193950;
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067c879sm758709385a.16.2026.10.26.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLPf6-00000007foP-2hO4;
	Mon, 26 Oct 2026 15:43:12 -0300
Date: Mon, 26 Oct 2026 15:43:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026184312.GA1685504@ziepe.ca>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
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
In-Reply-To: <20261026122243.GA28851@unreal>

On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:

> This is needed for two reasons: to save hardware and software resources
> when creating a large number of VFs, and to allow the PCI config space to
> be configured *before* the driver starts using it.
> 
> There is no in-kernel alternative.

Having userspace involved in driver binding has also always been the
plan for confidential computing needs. We cannot have a device driver
bound across some of the HW transitions like TDISP shared/private, so
there has always been an expectation of bind/unbind.

For this case the existing sysf drivers_probe is good enough for bind,
but we must have taint-free unbind for PCI devices too.

I think this patch should be reverted ASAP, it is a pretty major
regression for a lot of users.

Jason

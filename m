Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904969;
	b=QXIvUdlmt4tGyipj3GSie+Gb1NpwLqVqxrfgvholshKj+bcmB2VgEAvCTcj5rhhFzDvW
	 5+JmyG9LVeQHaD0DAz9xhyo1Jcq8uwx9+/CV4WvgypZ7aUw5EAXG6MwWCuIeNmtGwdfaQ
	 KYykOy/jgHpq03lWrV0sQH8jiTh7oN22+jbzUfoga+BEAITO5ySwaT2cOMEeb6fhTXOli
	 VhIj+UaZx1kQNV8bRgRr0Xnd7tzGw4QesR9myZCYnmWmXwK+6dn55/972ZSPALF6p5XlN
	 gPnYpoxEv56RPjncFXkKqYSjiKTHPZHkJawoRSKzI4XvANl9y/RH5iRh7Lol4khqNTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9JRpOjFd9h9Be46JNorYz6r58ZtExm/xfZM8/HWY0UU=;
	b=2MRZzvG3GKV9XLwtSAloQpracZHjzEDYIrfR3OLDOI5hlfocJ4zmexSzd79DpCoUiiA0
	 9EBvaQUKCKjb3l7aZKzl5VBPVvkvucyIKrZmTwrvqP9oQyn7pINUFOv/pU9XeuE03mH/e
	 w8OfzhwxV41ExebU+RQQduDSjGCrPDPmViHDu0wIgZv6GLhqkkUFRuPUMuWWE03YIIhhr
	 AX09LuQoApV2Tx9k5/x6T8K+XuCnQEmfCvTwsbrZiaNfierFtnZ/7vuvyv90/sMeNoUu9
	 Jp1d6W32dMuyf6kyw7K2JIIh3N9hrfcUuJee/OBSIhd+OsWrF+h3lpzl1y/uIMmfi4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSrgxbBj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337956082BC0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 337956082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSrgxbBj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6380655e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JRpOjFd9h9Be46JNorYz6r58ZtExm/xfZM8/HWY0UU=;
        b=kSrgxbBjKnJEy90/O9km/EcNAA4SlWHSl0Vt6KmFMtdkOHiwyUVFWav3GmYEY7qMp1
         zLu+S16zFatZ6gctxN5yKWijdTo/J46bnqA5rR4olqZPBaqQ6DLWCldJms+r6Fl85fSd
         QhDuqG01TPv9U9jjiPWdiqTJHoEIJS5eRsDTNpVE/0ovescXp3STEjBv5Y7hGLsCXzbh
         oUzQ4MT46aAoGC77sO5b3JxdUrzvhQjoagxbSFfL5syQx8ArkND6TIZRwi2AG/1t3RDe
         tStSpoVEL8FGpRutliysOGERbbm7BwQYgjlzKellzE08Gg2EpBpnGJul7JVhHWK2dDmX
         P/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JRpOjFd9h9Be46JNorYz6r58ZtExm/xfZM8/HWY0UU=;
        b=THrglB22TeQaCLWrRz7+C/05NarejGnKhuGBJyvB40hx0sLlMkSn3HVFuItjnXqZ3C
         i0wnWruCy+jRutxawmgJdGmDgAbFAWYfVV8TE3wjaas+g1vdGj8d9lF3EorkXbFQmxXe
         f4bJ1hdOwcZG9Im5BNKAcpWzW2Pqujst2TcLIN6D/R83JeVoVi7/QJzRxkAdOmC3xqCy
         2SavMiSkR37wy+30GD/cQOYMv2JFRP3xRho8lxHEd30l960iNqMj7Quf6ehQlmfNf/lL
         pcowgoOMZnZ107TBxraVn9JNXcriL5iyF6qoWPSd8+GhvY7Nwg5hW8B2QmyQPRbOKUpu
         XzXg==
X-Forwarded-Encrypted: i=1; AKwUvBwAfpPGU1M8qKG6N19rSX1lcqa5hYb34wTG/zUiU5Wtkw3XcEl2Hi1FOi+8pQ9ku2WaYh03XHlXsuAzUi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n49fN1i7IsMvAFtQmdYqG4xFnIVtqsGGIXVs/5wdW5romE2QJ
	d70V4U1RcAv0FZi3YFN38arMzRASfBcpfKB0uI+MktvnvV/ml/3vqqiIM34PoPkR
X-Gm-Gg: AYBFou0dLCsFgOLVmk+NC9/QRkhKW+rytMcWVAjONsMi2XJ46o+ob3RpN8jkA6n0mIr
	gOqwP+f1uGhY54hZAkAg0xslYc0xysBvfDKj8EbmTsLqoF8XT70fqf9i6cSKeJAciYZqWDMyyx3
	F6a7vh6h5JS7k9I612tjb1X0oqsmBGmCC0cL4kXmaoESyzRkmSWftZY942lfyKkbvC71+Mos5ai
	plzGuqyAIPFVDigbNaDqrYgayXECLTqs11/762IPSVkBBZNFMeSLvAgw9xZ4f5htsGepOSop/g6
	aAHeP0OCdqsER37+zfdhRPZqrvvmC145tIq7rkFSqQmAC81RR2C1kQY8b0kRp7Nf6LGedXyKc//
	AX3ru9KFZ2hiHAw6G5ohmaNQ0R1IkiXfeXl1m1EQDOGxT/3XnXYX21xHY5ANeQ9+o9jRI4nq6IF
	Yi1AKxAA9DRGjZPkzhuzcchF9qebRdzF9lg3F4P/McEVJpyNbn5zUCiFlcAj3YVf8kk4MVUJmJD
	OZ2ysDmfPpTg/WZVPLGDXbtnrxwMv/AoMJz46EFrECgSuvG8SieWVIIvOohRcoTOiLKb39CCqoM
	EgeP8i2gstcI4PVYLhR8jVCicjtwZFBnmBwmetA=
X-Received: by 2002:a05:600c:a04:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4b6df9bee79mr241625e9.11.1793904967521;
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm10404195e9.6.2026.11.05.10.56.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Date: Thu, 5 Nov 2026 19:55:57 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <20261105195557.68e8f04d.michal.pecio@gmail.com>
In-Reply-To: <d0c16945-29ce-48c5-abe5-2d2c6b562d51@rowland.harvard.edu>
References: <20261105054333.7811-25031212351@stu.xidian.edu.cn>
	<20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
	<d0c16945-29ce-48c5-abe5-2d2c6b562d51@rowland.harvard.edu>
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

On Thu, 5 Nov 2026 12:11:43 -0500, Alan Stern wrote:
> On Thu, Nov 05, 2026 at 02:56:27PM +0800, YuanZhe Liu wrote:
> > With the port owner exception above, tools like uhubctl that send
> > SET_FEATURE(PORT_POWER) to a hub without claiming either the port
> > or the interface will still get -EBUSY.  Do you want an exception
> > while privileges have not been dropped, or is losing that use case
> > the point?  
> 
> Well, it _is_ kind of the point.
>
> The only program I know about for manipulating port power settings is 
> one I wrote many years ago; it is careful to unbind the hub driver 
> before changing any settings.

And the other one is aforementioned uhubctl.

Since v2.5 in 2022, and commit aa7fc0a1 specifically, it uses sysfs
usbX-portY/disable interface if that exists (which is since v6.0).
Otherwise it uses libusb and fails with the v4 patch (I tried).

So if this stays out of old LTS releases, maybe nobody will notice.

> If we want to allow this sort of thing (changing a port's power while
> it is under control of the hub driver), the right way to do it is by
> adding a new command to the hub_ioctl() routine.

Probably redundant at this point.

Regrads,
Michal

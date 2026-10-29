Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317583;
	b=eD8HmqrTpIScDk1EDT/PBLQaPq522vDRZGh+WCZ6j98HNcQIKvMjcYEKRc+oWtlhGelR
	 Q56ZHsTr1LplBbxO/Z3NptjgVC17Mks9EdW47i563vF1cRo6M4ZEuFlsMkspdpOgCq6Fp
	 P1BawlK3XoC0I11I5UibgipnhZix7+fU4fnmM7QxeTFunS+EbnSs2d9+rZoFCO8nkkJy7
	 91BQxAI79JuenQqSRGFPAebxx6pmIdTtuzWXw8aN0X5v2Iy7Mw7KZtlEEOFFn+H4NPywX
	 /aXtrqI+8Qp4QQ3ulKdPG2kbSerTqmSId346uauwWxpGZmFUwowepcdYADeudIpk8Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PllxAaGrXJhLNtXCiCWXAHfgTtYT2V3WrE82HbznE6c=;
	b=aIkspV5MzwvQClndvAaNKMwS0vO8cmFDUE9iG4aWdkgquXNv1W4Quzehd8OrpM5Fdc5h
	 TMC/YAWbDm6+EQPr0TTbtPOU/CZEiTU4KkWdQ4TlJX4h0ZgwjhulWxQdg0ghEIqXZsFme
	 wo0syNk4V66/lUfttyhRiDq1jSWHSC106iv08BjAtdUteU55XDT2w2Fzxq40s0nGLHyo0
	 irD0GEX2kQ1ZmNECnrAJV0vvBuiTIUKzTt5zBtDjji3oY8BT5AM4FrannYfnwZ4rRAsit
	 rf29HLGUv6smkmYOd5qxh/2hTAhQbO6sroMy9XGvArI6qGzg91cQfDjK4ly/GJ7zRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hesling.com;
	spf=pass smtp.mailfrom=hesling.com;
	dkim=pass header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=C74lyjM0;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C84E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=C74lyjM0
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so321348eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1793317582; x=1793922382; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PllxAaGrXJhLNtXCiCWXAHfgTtYT2V3WrE82HbznE6c=;
        b=C74lyjM0lbcQc5NBWL2BfcIgE2mAqwsSxl+vCe1ghq5A6GeKC9qyLQiZjTfcdk+LAf
         HBDO3m6aZ3O/MI4zvT54fAfxef9IjgOVXr13NfqTY0hVrxu4emX8cMnZoiQfxUOYEfHS
         1jXSabhsc7G6Sah7KKwZGjToEI6VXpJWUVisuRlLSw0K2JEl7qdzYo7hycQYsLog+m/B
         oORU9bhL5sF+6FtQ5zcbuBhY1c62aqryhm3yZgPO2C15UVkU58B1R8LkcXQdgkd9M5JF
         lSWwXESDMU6Fij6KHm32K1EiquCRetGyJjy1mlmELgJ0yRvDkNk/EftLgte/Sdy0fWEu
         4l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793317582; x=1793922382;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PllxAaGrXJhLNtXCiCWXAHfgTtYT2V3WrE82HbznE6c=;
        b=c4iWrfpP7wi5Bj5ervMMUGjT8yfu+gXWH+irOibC5Bivtd/8QedV+21Dm6zixr+dEj
         NBLf1qePG+Fno9qfOWTbA1VxcsmVXJwtOLgrEDpJEhaEMtJe4YPclQxKopHzf+Ni3RCz
         HNZSnGgrx3vv0C7IQB6TlXS9u+Adk98GAn1evn+n/UwNfaAurFRB2NbcOC7PhXxNA1Tv
         Qfajb5BvOhbV5r4FgEPCu9thwMgNsnx+O/GEV/j5fBd3+FehxzExA9wtJbfb6sFr87pk
         IM/v6JB/ufxcaAac9wKpSP9VFmVjIxkhb2pTFaY0lO65V4Q/L3l8mYosYz0n7EpNGypw
         Qb7g==
X-Forwarded-Encrypted: i=1; AKwUvByo+Ba4SHntGYUOwTRVJhHe+WjAweNK6qneg6GqkUtOJFeif4WOBpP8BSdPn1RTBcX1E/rWtH4M+GPQnQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL55lMpNTHN5e20v3ZHLs+T+8GCVtzoAHzMb7IcbF/iqZ4xgQpl
	88lYfRn/ziltOrHq/yoY1OaNjgl3dsp047xEsEBtwZOPAaoSrOXl0Qd3OlSBBmlwtUM=
X-Gm-Gg: AYBFou1Wz8bxjcWeOSyJFl6GSuX4qE4mLLqjmH5IP5X3bxiwUEqTqrn1+8yo4SnfSGm
	8BXokKGTTltst+4mmSMqqUVn1eeO++vsoyNlNSyG0So8mGgHUjDSHZ9v24TOgD4xPiqMH4Y7Ywi
	fqTsePk4vwJy+Mq1WLyJptfuX3GJS+dOIlqBSUiLCx5jFj6lIrgMpO0K6yE1ZwhZHy7DExMSmVL
	i6Rh9hPFl5LyVhXMTfrqpNAVbMiNwiBVJ+iXWToTmSz+MC9h4/91cjF+R+GYCj71OTzrYs48UWg
	r3NQ69z5qaF+Ql519uWCMcJjdXgnWbSTLSdVTqfsPT/ZDIFpFKnFPrB2Dbs/+xoyS1/gcKOg+oY
	eqnUpobCOkjbwYIOs0HcuElhQ5aF3ufz9lfF5V5FhHSMRtzzMA16wUe4GH00yQY93EF3YlFoTiW
	yUyzUrCX6FAvIG/51BUDyXSQnt6Jp52ugCx0TC5hWEeele6BU6zumAciEHt7oWMSNlIMUd3zQOi
	LG/oYCJ3MtGbV2Dl9a4bnSjLE1hMJssFDEOz23pT33O3J9sTamTWKmQPGFChhCKO3JffFYkN0Im
	9QYXtnC5WNNZG0ebEwpvZ65u7deo0XofdxTAUHD4EUnZsfxr
X-Received: by 2002:a05:7301:4e47:b0:36a:1add:64aa with SMTP id 5a478bee46e88-36a42340ab7mr1090651eec.9.1793317581338;
        Thu, 29 Oct 2026 16:46:21 -0700 (PDT)
Received: from [10.20.0.147] ([12.244.13.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm1676444eec.12.2026.10.29.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:46:20 -0700 (PDT)
Message-ID: <fa1ec0429fe8c1287c126b50989f1cffe2567a86.camel@hesling.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
From: "craig@hesling.com" <craig@hesling.com>
To: Huang Wei <huangwei@kylinos.cn>, leStoppe <lestoppe@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 29 Oct 2026 16:46:19 -0700
In-Reply-To: <20261015025431.3927020-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
		 <20261014031228.1fadf3d2@delby>
		 <20261015025431.3927020-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi all,

I apologize for the delay. I am sad to see that this change is causing
such a headache. Thank you all for handling this.

On Mon, 2026-08-17 at 17:35 +0800, Huang Wei wrote:
> Craig, was the intent of 4cc01410e1c1 to cover only the HDS200
> series,
> or the whole range of OWON scopes sharing this VID:PID?

The main intent was to cover the HDS200 series, however other OWON
devices seemed perfectly safe to cover, given most of them use this
same simple serial style IO. This assessment was just from analyzing
documentation, source, and bins.

This simple serial driver enumeration seemed like the right
convenience/abstraction, for most people, who don't want to learn how
USB endpoints, libusb, and explicit permission granting udev rules
work. Most distros already associate a convenient limited user group
dialout or uucp to the serial device for easy access and also easy
unbinding for libusb usage.

On Thu, 2026-10-15 at 10:54 +0800, Huang Wei wrote:
> And the point that the VDS1022 is a headless scope where
> the PC tool is the primary interface makes it clear it should stay
> unclaimed.

I think I am missing something, but why does being headless mean that a
serial interface shouldn't be bound? Or, is the primary issue just
breaking necessary user application? Again, my apologies in advance if
I am missing something.

To be completely fair, I didn't know the VDS1022 used a pure binary
over USB interface. However, I'm not sure that would have changed the
calculus, given it still LOOKS to be a simple two endpoint TX/RX serial
[raw] data interface. I hate that this change broken this application,
but wouldn't it reduce the complexity a bit for the Linux use case, by
removing the necessary udev rule, removing the runtime dep on
libusb.so, and simplifying libusb control code?

https://github.com/florentbr/OWON-VDS1022/blob/1.1.5-cf19/install-linux.sh#=
L337

From a maintainability perspective, it would be unfortunate to have one
arbitrary subset of devices use serial and another use libusb.

On Thu, 2026-10-15 at 10:54 +0800, Huang Wei wrote:
> Craig - if you happen to know whether subclass 0 / protocol 0 holds
> across the HDS200 series and firmware versions, that would be a
> useful confirmation; the dump in your commit message is the only
> HDS200 data point I have.

Unfortunately, I do not know if other devices in the family maintain
this device 0 subclass and protocol, but I will try an older firmware
on the HDS272S and double check.

All the best,

Craig

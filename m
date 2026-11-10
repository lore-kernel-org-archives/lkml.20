Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316961;
	b=fsXjs30I0qh2dW8vnVx//JxBtMAR52KJxZ9lbIEkbhN3Ml0nJqgUthepZ3Au2S9lxFH6
	 AG/3GUR5D5xtKET8CJZDORg4bwR29jSBXh5UE2/UOo1EWU5FFxZib+Cwzp398n1mYtpEh
	 4Zl5wsnZvlplWrsg2hT+GolgsVy4RAarL8oMdAjRfEdKFfpgYUQ7A9huEeQsHGAP4uBO+
	 t6ptDnatZgYnmra87GJJqCipmQcZgZrkk45bi7v1RPTZQFv86mG8ZdOAmG04MOK+hX+7U
	 io+/ySi++XJzuUQPhEObzVTorkchoO1HiJpJrB30j891sG8Q1RbB5HIhaB2N6S2ehXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sHEx1YOYwVmS9mdP/h27UNxsg/xQGaKawL4tWGMHKBM=;
	b=JFqPvBs+pC/Jh7HylpRheF7M/oEV9RWYKTPTyDg94m8iAi1BZpSVmoqAzDLtA3Yhpm6O
	 UOySD33Gk02J/TIqwDxkE2Fi8t/cW6B3T5hOqUi6eSpCu7bP/03ekQ+u6A/5l2sxd0ldT
	 U7j3kl/j+T171Gq0r540cl9yAmyH8H/ca/YjxLsPfuyn6UlEKAC8vfDzU8p834O6zT0cD
	 1L96x0qcVARUMi0m0mr6uNeRoW32RP0+CpoLzWHt6nd1uy8xGdsS+Fe+IzBsuZg6sbI8Z
	 8rXVcmSxBlQPm9gFIXz/S13jsq4l6Gsv4HFXYJNKy+wzGkdwVJoH9OkIhTEGBjseGQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdU2lTBt;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640B606A7D4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1640B606A7D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdU2lTBt
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so2502785c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316960; x=1794921760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHEx1YOYwVmS9mdP/h27UNxsg/xQGaKawL4tWGMHKBM=;
        b=pdU2lTBt/tf9UQ0mMFIwo3Hjnf/Ybhh+iNkHOs+8ze76RxylLa15zXfaAM96YEMZKL
         UKfYpagdK5KjeIGNpS1N1uVSKj4e5k6c6bycJ3TmdvjPQP7AiehshG/Bf7vcMn6FegFk
         jQnMmakU1S5xbZ5l4X1CyDv/RxgRoLhZ4Vjlpf4qILu23xpQlN1X3im6nY95pvES9ate
         SU8l4rnIib2hkQj7K3RdyME8q1QPlJTHEkbWcx2EMtnaH/IQWrbmxb4+YHC2PlAcd2E4
         wk7M7SgkPcqaUbo0wtSkzGcUoBGiJIF+l5jeC9PZyd/51xTbgcjDqcvjYAU+PYWMgiu6
         G1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316960; x=1794921760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHEx1YOYwVmS9mdP/h27UNxsg/xQGaKawL4tWGMHKBM=;
        b=JZFFMuHBvLWaQ61K8LeRypjFDEZ3WqV9YIGxSZULqjIfkxdp2C3DJ2GHx7peGPbrmE
         jwGMUqt/z6mXoIY4h0O8LM/rZBp6Zk4o8q8ToCigJjvAOlrXoyjTz2Fb/IVLj27xOmH0
         2XbeaxoEKKDWDpP6pN2VhInHiBNbrgyHpQxouMBZo6r67e6+wCKHMvqZK9Ouqsiz9CIi
         +owgmX4UwnqUzE4pI0iDiMpP+vCMHLsQHdEJCJ/MafxvNrCvE7C74/D3opxWz/emq0/O
         O2A6dtkICQLBaWfkV0COSHDVjT8gwfgXfXnLLO9XSGTLVpOmbg6sN7VG5BZ33LjKidMx
         vcjQ==
X-Forwarded-Encrypted: i=1; AL+hErGlSC9DUm+sr7/rd8UP/fDaxIIxzs+oMA8CcYIRyI0FBdTTVJZHnpJ0oORXnKmro226/VR3krrt3DRtoys=@vger.kernel.org
X-Gm-Message-State: APuU4Z83YLw9YBrtH7YyIQi5SPnDdqbzoSc3CeTzfI5eWJHYRfYBEtvV
	Z9sOpgBeWV/ynD16W4erBpsmvrrc2dWTkCgIrJSci1aYOAsYY3WXk6KZ
X-Gm-Gg: AYBFou02F57CstmOWOvDF8wxmL6TVyspCmhi6Dlox0ErREy7mRI9hD70zho8s7uJo7w
	lQQmQWgtw8+i8S4Irm3TzhjFmm6I2d0ylwtc+20CshXWT79tzP45P/cKgElalSN26wXS8nAsY8r
	KmSkBhbK2tVvRdOTPuUZxFt0gI9Y4WFmhmATAZt1nRL7P/Tq8A5SYAcJrezMmRwoJm6Zd2EAF1R
	8OWxIRdyHl1Awci2L9OdRPwwGtIOrMB8grfLfFnduz8vmj/omRRTPyoPXO50XzU8E0omjmuQpha
	4dog6kkZMk6QIu4ouCkcrjb4JFchGhFXTN3V/D6O08Yj8eJAkNgiXbPk9KKvt8ozokomank6IdJ
	eUpPLNO9jdwO0ZepINFk4iZloc/V6Qw4UUiH8CihHfQ1ny7abiCD4Kv25gOCM3ucBdN4l288f2s
	ZuTOAnOIKZqTZ8AQO6tiGQQP/mWnhBvcH2iO0qYT3XZsORdBX6wiYLyP01uS1jMslTYnpGFnvhD
	Z/Kvc8S/dZBwPhb9Mfd3OJsR6KIzjJhlMkf0EKczwzcf/H6l519rqH8wrXTy8QW2S9lpQlQTW4L
	amYWw0vnrI2px/E1Im1Kg3CGAus=
X-Received: by 2002:a05:701b:4591:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b3ba921484mr1380094c88.19.1794316959868;
        Tue, 10 Nov 2026 05:22:39 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm8213240c88.18.2026.11.10.05.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:39 -0800 (PST)
Date: Tue, 10 Nov 2026 21:22:36 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jingle Wu <jingle.wu@emc.com.tw>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vishnu Sankar <vishnuocv@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, 
	Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avMZOPd7qq4xR7EJ@sapienza>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
 <avKBsi-E7IeUgsSY@google.com>
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
In-Reply-To: <avKBsi-E7IeUgsSY@google.com>

On Mon, Nov 09, 2026 at 06:36:15PM -0800, Dmitry Torokhov wrote:
> Hi Yuan,
>
> On Mon, Nov 02, 2026 at 09:08:36PM +0800, Yuan Yao wrote:
> > The new ELAN trackpoint variant id 7 is found on thinkpad
> > X14 Gen1 laptop(Product Name: 21XMA006CD), it's now
> > incorrectly probed as Generic or Logitech PS/2 mouse.
> >
> > Add ELAN variant id 7 to match the TP_READ_ID command
> > return value, probe the device as trackpoint correctly.
> >
> > BEFORE:
> > input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63
> >
> > AFTER:
> > psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware: 0xa1, buttons: 3/3
> > input: TPPS/2 Elan_variant7 TrackPoint as /devices/platform/i8042/serio1/input/input65
> >
> > Signed-off-by: Yuan Yao <yaoyuan0329os@gmail.com>
> > ---
> >  drivers/input/mouse/trackpoint.c | 2 ++
> >  drivers/input/mouse/trackpoint.h | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> > index 3bd8fdf56cd3..f46fc1665c96 100644
> > --- a/drivers/input/mouse/trackpoint.c
> > +++ b/drivers/input/mouse/trackpoint.c
> > @@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
> >  	[TP_VARIANT_NXP]		= "NXP",
> >  	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_Synaptics",
> >  	[TP_VARIANT_SYNAPTICS]		= "Synaptics",
> > +	[TP_VARIANT_ELAN_ID_7]		= "Elan_variant7"
>

Hi Dmitry,

> I wonder if we really need to say "Elan_variant7" or if we should simply
> say "Elan" here as well.

Thanks for your reply.

I'm fine to just "Elan" if it's ok to you. I just want to
highlight the device has id 7 from other ELAN devices which
has 3, so I give it "Elan_variant7".

>
> Jingle, is this your part? What is the difference from Elan trackpoint
> reporting 0x03 as its variant?
>
> Thanks.
>
> --
> Dmitry

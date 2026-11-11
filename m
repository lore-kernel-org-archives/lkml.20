Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405904;
	b=vEXG3Y22hJFfEhMytITyDKHseZuj7OJhLwf7sbHF1CDHGeJOixwk1W7S1lbeRGcKma+N
	 /6uRnIK+2uSkK1rFR0CDjoAjKM8ZCGLcwpv2sT7yGG1Rkf85J6gJwgJdTc9dP9RpR6ebK
	 JuUs22vN2NWVIPXCPgTyvhjJmICGyFrZLxKNY4VTtx4ERACAAMa+ofU8QiAdOBS09P5VG
	 OrjOzY7Zc/ybH9d822Q4oj4qd1EAU5NSMs/XRV3OAo+wPGcW0AHan1JtNeI8mzVYTApFw
	 MQkw2bIANKr7xrRMA7/gYMSIftZ8wvPR3UmdMVPbJG0pHD2bhigiqsEHDp1bxW0S3Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=/2TL98f8PghA+Pe3iD4T1awywNMH5AS+0iuSUCcKU2I=;
	b=xT4YGmffasl88SXkKx9qm3IG7GvjVWdb+GRswXJFTaw9kuD2+91+mHkmk+VnkS1BtQ/b
	 mcqd1/8fOqLQMrVpfePPwWdsEmn4PZx5d1IrBZwfRA5XPhvpqZ5wa5hk72/FYvw4sO8oW
	 N877QXHF3wVXsNZf09pKIAAO/W3ClqxvlEsdf4FkZIFcLBNzGb33BvuAySods4gWhxG8O
	 H/QQvla6E1GyZ/Yg1BzhDR+MLdWQhx5NvCDe9hIrDc+brbJ8OKNgeYNoEz8wTgi95n+fD
	 06LbTqjSdOssFv4KAPXONY0urE60KUuUquhDmIdJvDt5tdGowgbl+sD8+AexmGIck9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkXjTjV3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E5606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkXjTjV3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so3170111eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794405903; x=1795010703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2TL98f8PghA+Pe3iD4T1awywNMH5AS+0iuSUCcKU2I=;
        b=lkXjTjV3UgTWiWpT2DEeM3Kq4oY1qH5YYmhP9vK9ercB+vkMouyO/ic7yPk8cP83kC
         aCL1yLtyK0YpmTSRKjq419TvpeLpdGWfuc66X2vU9yLwTStpMqEukhtz0Df8m3VKcYQr
         QsL8JFU/BGYdcuIg7Qg3zJeGj3CTxP4RZwbx3nGC/leGgceB6oVPATWHfnrdZYavApYD
         4SFfBY8pLElH7ymNDIPgkHCfJ6L/6QIemD/ziYi0X+rzaedYDTItDgwnEJ+GVKyyKq4S
         F4m/GxE7lRHM6ZbE6R+Hlj601Gc3xNyeyEZC2tkeCk8Eo/CXf3aoxwNxykOERdH71v2s
         XBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405903; x=1795010703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/2TL98f8PghA+Pe3iD4T1awywNMH5AS+0iuSUCcKU2I=;
        b=Dv7S0gsIpCmxt3UwpWq5URzOlRpEoAtvTZoB7xy5MjlCuf5bd1Uj6RuhdX/Ju9tbzf
         nTTQlUUqEzqTCTiC06/A02dXYWM/10sqHGanjvzO+ImM+mmYJKiHIcfcC6T5JSGoStzR
         VWphjf8lHZRLpbcjeL4hX2+gFxrBQlk8O0PW3bd5keAB7t+NEAzaHJMmxlwk+a15UWWK
         vf7vIbYvDgkShko97Ffs5RQKCPNgOL7LmcSd957T1ERRFh86SxsYOVVjUCCb4mHAaA95
         WLZEpZV5EbtmcD4z0fHvj4wg2mUhao7CXtLUtDkZmvBqKYzu/0P/tS2DPF19CPSpMMER
         4FDQ==
X-Forwarded-Encrypted: i=1; AL+hErH7HeIHJZ+QWI02yp5JtlGdy8jiN5Kw6tZR2StvUv5vks4A5xwelB4UYg3bZg0PjbhgCs5SJY2IAoiDwlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V4Gk2yGeFymwMkUVr0Hth+KiD0KRbXj5I4d+U9jQNyJQHHkOM
	agMdduFDxMyVREdcKwDSiqkwYgpKt7FFYslsTbxhOKVKAavK3IhmxjBH
X-Gm-Gg: AYBFou3nQIP+3GEn+QENbA3a7rK0s2HmbISBpafT1QpAtltTnj8IwOZIYnpKTxCpjx+
	F9fQYgpha8DRSE/mA+ZaylI7/W9DGEwYn0Q7Hr+hGquASRCiyObhJrFw9bEiofy3yOAIrrbt/9K
	Wla3hZaCuHmWUmK7ttJrLueqimFiu8zdgflxFhgtXAsEHAGODNCddKUIOATqjlnf9tx4oaOn1Ib
	OmJjW9cA6RgOdXEiyE1E4wvcOePRvJQ4gutFo8fVLLtjbzRZFF512ueaYmKeUUbunTzS9GMHzed
	oczJfRpBkj0jCAjorI8/alFz66EyDtF4qT3fIfxARtRAnXLggyKznrbiEGk6YjU+M29VxZZMt+t
	qF3w0d1PMgyy70EywM2UKk/2M8YFQyf2JxhtTPswu9gzBaWOjwaJLPayUA1D5uht8HX/SNnwa6U
	B3w1Jk4daTi4fizIZGwEAnyxUgr+16NhxAGd8eBD8cH2p1OscnUaHBHO5ieQsl79opa7cp85SRe
	Js0GEr6Dwggz+FWPHqRKrDJ4KKIsJjIwOUFwNCMZ1LlMJm1SYQUT81+0o/JtNIzPO5cGiPEHySz
	bYFz0jFyOi9ZyAgQ04TdhGLs3uE=
X-Received: by 2002:a05:7300:f28a:b0:36e:a11a:b2f1 with SMTP id 5a478bee46e88-37686464a66mr3277755eec.30.1794405902642;
        Wed, 11 Nov 2026 06:05:02 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm14716222eec.13.2026.11.11.06.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:05:00 -0800 (PST)
Date: Wed, 11 Nov 2026 22:04:57 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vishnu Sankar <vishnuocv@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avRttU9N0EZeq8nY@sapienza>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
 <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avMcB0q7wF9oP5X8@sapienza>
 <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>

On Wed, Nov 11, 2026 at 05:26:36AM +0000, Jingle Wu 吳金國 wrote:
> Hi Yao:
>
> Could you help verify whether the color of the TrackPoint stick underneath the red cap can be used to identify the vendor?
>
> White: ELAN
> Other colors: Other vendors

Hi Wu,

The thin stick under the red cap is black.

Also I visited the lenovo's supporting website, there's only
1 ELAN dirver for this thinkpad X14 gen1 model's trackpoint:

https://newthink.lenovo.com.cn/driveList.html?selname=ThinkPad%20X14%20Gen1

The laptop model I'm using is 21XM, the driver works well in
windows 11.

Now I'm confused on who is the real vendor of this
trackpoint device. I may ask help on Lenovo's supporting
website yet. Wu, is that ok to refer this mail there ?

>
> Thanks
> JINGLE
>
> -----Original Message-----
> From: Yao Yuan <yaoyuan0329os@gmail.com>
> Sent: Tuesday, November 10, 2026 9:48 PM
> To: Jingle Wu 吳金國 <jingle.wu@emc.com.tw>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>; Vishnu Sankar <vishnuocv@gmail.com>; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Phoenix Huang 黃世鵬 <phoenix@emc.com.tw>; Stanley Chen 陳建維 <stanley.chen@emc.com.tw>
> Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device variant id 7
>
> ⚠ External Email: This email originated from outside the organization. Please use caution when opening links or attachments.
> ⚠ 外部郵件： 此郵件來自公司外部，請謹慎開啟連結或附件。
>
> On Tue, Nov 10, 2026 at 05:26:21AM +0000, Jingle Wu 吳金國 wrote:
>
> Hi Wu,
>
> > Hi Dmitry/Yuan:
> >
> > We have confirmed that FW A1 was never released by Elan. The Elan Variant ID has always been 3.
>
> Thanks for your information, Let me share more details:
>
> The trackpoint has driver from "ELAN
> Microelectronics Corp." in windows 11 on same device.
>
> In Linux I found the device is probed as generic mouse device but not trackpoint device, it's hard to use due to no sensitivity setting from sysfs. I found the reported id
> 0x7 is not in drivers/input/mouse/trackpoint.c's
> trackpoint_start_protocol() after debugging, the trackpoint is probed and works well after add the id 0x7 there.
>
> So I thought this should be a ELAN device w/ ID 0x7 and cooked this patch.
>
>
> >
> > THANKS
> > JINGLE
> >
> > -----Original Message-----
> > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Sent: Tuesday, November 10, 2026 10:36 AM
> > To: Yuan Yao <yaoyuan0329os@gmail.com>; Jingle Wu 吳金國
> > <jingle.wu@emc.com.tw>
> > Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>; Vishnu Sankar
> > <vishnuocv@gmail.com>; linux-input@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Phoenix Huang 黃世鵬 <phoenix@emc.com.tw>;
> > Stanley Chen 陳建維 <stanley.chen@emc.com.tw>
> > Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint
> > device variant id 7
> >
> > ⚠ External Email: This email originated from outside the organization. Please use caution when opening links or attachments.
> > ⚠ 外部郵件： 此郵件來自公司外部，請謹慎開啟連結或附件。
> >
> > Hi Yuan,
> >
> > On Mon, Nov 02, 2026 at 09:08:36PM +0800, Yuan Yao wrote:
> > > The new ELAN trackpoint variant id 7 is found on thinkpad
> > > X14 Gen1 laptop(Product Name: 21XMA006CD), it's now incorrectly
> > > probed as Generic or Logitech PS/2 mouse.
> > >
> > > Add ELAN variant id 7 to match the TP_READ_ID command return value,
> > > probe the device as trackpoint correctly.
> > >
> > > BEFORE:
> > > input: PS/2 Generic Mouse as
> > > /devices/platform/i8042/serio1/input/input63
> > >
> > > AFTER:
> > > psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware: 0xa1,
> > > buttons: 3/3
> > > input: TPPS/2 Elan_variant7 TrackPoint as
> > > /devices/platform/i8042/serio1/input/input65
> > >
> > > Signed-off-by: Yuan Yao <yaoyuan0329os@gmail.com>
> > > ---
> > >  drivers/input/mouse/trackpoint.c | 2 ++
> > > drivers/input/mouse/trackpoint.h | 1 +
> > >  2 files changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/input/mouse/trackpoint.c
> > > b/drivers/input/mouse/trackpoint.c
> > > index 3bd8fdf56cd3..f46fc1665c96 100644
> > > --- a/drivers/input/mouse/trackpoint.c
> > > +++ b/drivers/input/mouse/trackpoint.c
> > > @@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
> > >       [TP_VARIANT_NXP]                = "NXP",
> > >       [TP_VARIANT_JYT_SYNAPTICS]      = "JYT_Synaptics",
> > >       [TP_VARIANT_SYNAPTICS]          = "Synaptics",
> > > +     [TP_VARIANT_ELAN_ID_7]          = "Elan_variant7"
> >
> > I wonder if we really need to say "Elan_variant7" or if we should simply say "Elan" here as well.
> >
> > Jingle, is this your part? What is the difference from Elan trackpoint reporting 0x03 as its variant?
> >
> > Thanks.
> >
> > --
> > Dmitry

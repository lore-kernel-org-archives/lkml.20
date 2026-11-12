Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487790;
	b=APQFWb9rkLJlFl+qyNlpT8shYDLjgblcImWgP9c46XVCd0lkXGmVXRWixxsBYueFaxJ5
	 T6+796IJfSX0AmnYmvmyHcu0IUkxlTd0rV7cFVfGOuCr/o6dNNIJ+U1GyE41GSZj3ojq6
	 vxSIj9A2ptN951Coit0TasZtC7lCeIld1acL8VNbn/DXMS0y2G7rO0IiAR6Axy1A7eOtm
	 VDZF+gb6MRYuKAJnKw26iY6LDqOz+JnWfzFHfZrsSoB2QCR59xDSAy/Ku7bp0EVj6Gcya
	 nDtfGJiWVYg2ruUPdv6gaRYM6qOACYN8AFqBvOELpmnad2ZVGYH4orupNdp8kyvGgFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6nalTf2fnxdnA3PnfvxMRPaFwmEXqK1eA5eTJUaR4u4=;
	b=dw3b3FBQTNj2arSzjjQ79eu9KaTvQN2i8FcZrokOjqaZwvjS2JgE3MldGls+rANrjGWC
	 t1tToL60dFCrhi++k3buLKiriwlOKjodsZOz1RkfcxSPO816eiClVTAH99DcJTfMizt2U
	 QpYDcZXw9E28Jpy2XfXWvu07Cnds+C6PECLftjsNVwmF1HjSHeUAQ5n5l6fzmBur0wesq
	 dSvZO30UaWtc+Kebw22kUPeL6yvPLUMb/RgjL6pMAhYpIXTF6bpIY/jfbgpNcxTfYXOlb
	 OlsUVuGKWPCoaclFoKi87n+lFqrVsieqsY7LO8VywoLPIEHaQVUrgroZnhClZ2Qq2cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXfZplFk;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB26D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB26D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXfZplFk
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so5791490c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487789; x=1795092589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nalTf2fnxdnA3PnfvxMRPaFwmEXqK1eA5eTJUaR4u4=;
        b=fXfZplFk/O8v0PP499f+0AjZ2ZN4SyjVrfQOSW7dNKMxft1QQM9WQJa1u8u7QFXesN
         oGZ2ypv4ZCMuT5qTITzgk+Ke7lRxwScqHcgLCkSxcBbp4zyneTU4dJGHIzVG6yRhpj9w
         gWXuYnVTk/wwqH43TUkTWJ9mFUf8eSCHFiXlSdlanEjKY9YzCpqQsBxF2wulO7usfoGn
         fQaIuQoiHSDywAWxocnvRrDk7yNBUpHCpHHAETdOg4jxhpdQRF/2mRpxn6KvlBh27G0i
         +aBPvdkrG6msNMFYoatQno/sCZv2X1SATwHqXN1C472YPBh+91Qso0PcZoXGpN1iX9Ti
         BBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487789; x=1795092589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nalTf2fnxdnA3PnfvxMRPaFwmEXqK1eA5eTJUaR4u4=;
        b=aIcIAKWvMAr6KNpgNMSe2aeWqZh5LTkCRBJnhB6lngIrxi4k274u6XXwQytxFkAfog
         28/fnwfFDTlQCvVFyuwnPJCpzx5YTx8YEWctJJ8azmGABC+dDQXRpnvblOOdTcM3liyj
         uNz8W5Zpb5nh//krt/ow4c3I0bdILna/FOsDsJCqFrDxlAJfauAGwbJP/dRhcKXjdSSJ
         gkDwpzk1SCjqFmgCCuKFegEKAJlrp7kUeg3eeXSPwR+U85yz+k66xhHLkGbw83RPXfEv
         2/v3IWCdleLW1LFw4o6/wfxDE3zQ4mJsjYY0Km+rz3NvMFIEWwJcI8jw7+hX58BhmHID
         ycHw==
X-Forwarded-Encrypted: i=1; AL+hErHZIcocqgRUZSJWk/1a3hiFYJbkQUBJe0oJjNuCZR11lO+NHfo/gPknIQW0lTamawkKp0EJY2yBTP24l6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z92GXzk0euin2jMztey91C7rCD4f7cDbv/Qu7prSd3HSn2BjJzt
	UoW1syjmM5FGLffCifZnHKnVoT3ndM8YE6KTfczR7xYVJ+x/IUr5e7MK
X-Gm-Gg: AYBFou2Hnorpcj6H8zgneQiJbZH7OBKPGXhh58HmNsDdhS6X8oI4oWL+IIi8IaJEaTq
	SBIdjSkzOiULMxg39n0rv9Bhgj6v1TRjw5V/x931JyNRCj8SFBOflapp5UZu4zQKD7QpuN/dfEG
	ngaRtR0OzEpwo4na6lFwmttnEPGbVq61GXoGO8EY20JIwT+zRiTkgFwrfGHH/qN296ljARj+vwE
	vr5nt5N4/VXByfVYXP6Rn4500WUwB67jbn9V0LmGIrpY8iDCaUu4gJXNA03P2YVoNKlbPqbx5ox
	hWjQ1ril1tRXubE3BaufpU1UGcmPpmJhp6AhdljTRwnrIslvRBkOYixAczVKJ6E8+5o3ZsTb3nK
	X0X5AzNY5fqmkW7OqexZcCo65SS1xzvouFGssUiKQKqOoXSwuc1TqXNTW3apgTzEqxZGwdiPQKQ
	e2MRs8vcQZYXWqj/kIYhgU3vW/nnOtMX/RFhkoRpFFLyDn6VL4RVHyDLZ9L7HCA3CHuc5Jh8N6m
	JXqgnqMDcOiPqhx7fyXLBpVSGMg6dJhDnE20iSK7O0qD0/0XGCCH18Lmdmz2k0dT2OXE7HXplOm
	4FcRm8/MaGDoL6ICu4OaQvRfaSY=
X-Received: by 2002:a05:701b:2903:b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b3c037877cmr4011227c88.33.1794487788647;
        Thu, 12 Nov 2026 04:49:48 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm21766617c88.15.2026.11.12.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:49:47 -0800 (PST)
Date: Thu, 12 Nov 2026 20:49:45 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vishnu Sankar <vishnuocv@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avW1Q7Fc7k-zjkHt@sapienza>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
 <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avMcB0q7wF9oP5X8@sapienza>
 <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>
 <avRttU9N0EZeq8nY@sapienza>
 <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
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
In-Reply-To: <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>

On Thu, Nov 12, 2026 at 05:26:46AM +0000, Jingle Wu 吳金國 wrote:
> Hi Yao:
>
> Upon inquiry, it was confirmed that a black TrackPoint stick (0x07) underneath the red TrackPoint cap corresponds to a vendor that is compatible with the Windows ELAN driver.

I received "Delivery Status Notification (Failure)" thus I just try again, please
ignore if it's duplicated mail there.

Hi Wu,

Now I see, Thanks a lot for your kind help on clarify this!

>
> THANKS
> JINGLE
>
> -----Original Message-----
> From: Yao Yuan <yaoyuan0329os@gmail.com>
> Sent: Wednesday, November 11, 2026 10:05 PM
> To: Jingle Wu 吳金國 <jingle.wu@emc.com.tw>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>; Vishnu Sankar <vishnuocv@gmail.com>; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Phoenix Huang 黃世鵬 <phoenix@emc.com.tw>; Stanley Chen 陳建維 <stanley.chen@emc.com.tw>
> Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device variant id 7
>
> ⚠ External Email: This email originated from outside the organization. Please use caution when opening links or attachments.
> ⚠ 外部郵件： 此郵件來自公司外部，請謹慎開啟連結或附件。
>
> On Wed, Nov 11, 2026 at 05:26:36AM +0000, Jingle Wu 吳金國 wrote:
> > Hi Yao:
> >
> > Could you help verify whether the color of the TrackPoint stick underneath the red cap can be used to identify the vendor?
> >
> > White: ELAN
> > Other colors: Other vendors
>
> Hi Wu,
>
> The thin stick under the red cap is black.
>
> Also I visited the lenovo's supporting website, there's only
> 1 ELAN dirver for this thinkpad X14 gen1 model's trackpoint:
>
> https://newthink.lenovo.com.cn/driveList.html?selname=ThinkPad%20X14%20Gen1
>
> The laptop model I'm using is 21XM, the driver works well in windows 11.
>
> Now I'm confused on who is the real vendor of this trackpoint device. I may ask help on Lenovo's supporting website yet. Wu, is that ok to refer this mail there ?
>
> >
> > Thanks
> > JINGLE
> >
> > -----Original Message-----
> > From: Yao Yuan <yaoyuan0329os@gmail.com>
> > Sent: Tuesday, November 10, 2026 9:48 PM
> > To: Jingle Wu 吳金國 <jingle.wu@emc.com.tw>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ilpo Järvinen
> > <ilpo.jarvinen@linux.intel.com>; Vishnu Sankar <vishnuocv@gmail.com>;
> > linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Phoenix
> > Huang 黃世鵬 <phoenix@emc.com.tw>; Stanley Chen 陳建維
> > <stanley.chen@emc.com.tw>
> > Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint
> > device variant id 7
> >
> > ⚠ External Email: This email originated from outside the organization. Please use caution when opening links or attachments.
> > ⚠ 外部郵件： 此郵件來自公司外部，請謹慎開啟連結或附件。
> >
> > On Tue, Nov 10, 2026 at 05:26:21AM +0000, Jingle Wu 吳金國 wrote:
> >
> > Hi Wu,
> >
> > > Hi Dmitry/Yuan:
> > >
> > > We have confirmed that FW A1 was never released by Elan. The Elan Variant ID has always been 3.
> >
> > Thanks for your information, Let me share more details:
> >
> > The trackpoint has driver from "ELAN
> > Microelectronics Corp." in windows 11 on same device.
> >
> > In Linux I found the device is probed as generic mouse device but not
> > trackpoint device, it's hard to use due to no sensitivity setting from
> > sysfs. I found the reported id
> > 0x7 is not in drivers/input/mouse/trackpoint.c's
> > trackpoint_start_protocol() after debugging, the trackpoint is probed and works well after add the id 0x7 there.
> >
> > So I thought this should be a ELAN device w/ ID 0x7 and cooked this patch.
> >
> >
> > >
> > > THANKS
> > > JINGLE
> > >
> > > -----Original Message-----
> > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Sent: Tuesday, November 10, 2026 10:36 AM
> > > To: Yuan Yao <yaoyuan0329os@gmail.com>; Jingle Wu 吳金國
> > > <jingle.wu@emc.com.tw>
> > > Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>; Vishnu Sankar
> > > <vishnuocv@gmail.com>; linux-input@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; Phoenix Huang 黃世鵬
> > > <phoenix@emc.com.tw>; Stanley Chen 陳建維 <stanley.chen@emc.com.tw>
> > > Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint
> > > device variant id 7
> > >
> > > ⚠ External Email: This email originated from outside the organization. Please use caution when opening links or attachments.
> > > ⚠ 外部郵件： 此郵件來自公司外部，請謹慎開啟連結或附件。
> > >
> > > Hi Yuan,
> > >
> > > On Mon, Nov 02, 2026 at 09:08:36PM +0800, Yuan Yao wrote:
> > > > The new ELAN trackpoint variant id 7 is found on thinkpad
> > > > X14 Gen1 laptop(Product Name: 21XMA006CD), it's now incorrectly
> > > > probed as Generic or Logitech PS/2 mouse.
> > > >
> > > > Add ELAN variant id 7 to match the TP_READ_ID command return
> > > > value, probe the device as trackpoint correctly.
> > > >
> > > > BEFORE:
> > > > input: PS/2 Generic Mouse as
> > > > /devices/platform/i8042/serio1/input/input63
> > > >
> > > > AFTER:
> > > > psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware:
> > > > 0xa1,
> > > > buttons: 3/3
> > > > input: TPPS/2 Elan_variant7 TrackPoint as
> > > > /devices/platform/i8042/serio1/input/input65
> > > >
> > > > Signed-off-by: Yuan Yao <yaoyuan0329os@gmail.com>
> > > > ---
> > > >  drivers/input/mouse/trackpoint.c | 2 ++
> > > > drivers/input/mouse/trackpoint.h | 1 +
> > > >  2 files changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/input/mouse/trackpoint.c
> > > > b/drivers/input/mouse/trackpoint.c
> > > > index 3bd8fdf56cd3..f46fc1665c96 100644
> > > > --- a/drivers/input/mouse/trackpoint.c
> > > > +++ b/drivers/input/mouse/trackpoint.c
> > > > @@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
> > > >       [TP_VARIANT_NXP]                = "NXP",
> > > >       [TP_VARIANT_JYT_SYNAPTICS]      = "JYT_Synaptics",
> > > >       [TP_VARIANT_SYNAPTICS]          = "Synaptics",
> > > > +     [TP_VARIANT_ELAN_ID_7]          = "Elan_variant7"
> > >
> > > I wonder if we really need to say "Elan_variant7" or if we should simply say "Elan" here as well.
> > >
> > > Jingle, is this your part? What is the difference from Elan trackpoint reporting 0x03 as its variant?
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry

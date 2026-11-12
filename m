Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486968;
	b=SHhkSysThn9r8ZV9lLrAA+RzNZdjJoTulI1drNly6rWvTMi2K0SPspNVbFfVVWyyIo/7
	 ESADtukVngVstpJwA0XaoO4k8orpDZL5lA/AKwcpmMpJVs/sNzZP0U7j1NorSEvwvanEq
	 Oy7FtL23aZrFFqxkyZJk1IZEYGHFOLRPid+Nb+5e3q1uoF5oPrw7jN2KtbA4Iw2UZdmYN
	 uCRDeejoxMiEFUx+IiCNOSY6Qp7upemlve4jIra//cFgdYEyZFb8KRJk8gwgSz9hlF+ny
	 X+3QCAoEYs4642tGaiw3Dd/3Tj1Kis+6isyDSNrFp/sU3eiHxq4pPZBpygSyPcGvJJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=hjVW9VP/TER5rvEadBEmYCt8ueid8AgZqnJlLcgyHj8=;
	b=MZi5QuvzNbNFKiplqWi3PYGL9/sW03dz4IqOw6nX3V1/pHs1P+YyYuy//1HLZh4x21r/
	 bng3ZLzlDQkrv06iwsbY6iyWy7U+jNy27iz/eLa8n2nvgPca79/QM6+LYuCS76nxRpoq4
	 Mj7hM9s8DBaqgyy/hjIjzCOWhbhetSExGOotoD/9pFoEOWavnRpDJ3XgD5TUbCEhi9Ttu
	 USBhTrJi3NJbIM+dWNMTGiKfLwVeQlTPKyadXCb+W3tPp0hzwnNmPuaCGi32zmuVtviZr
	 sm3lOy7TTr19A5GGMNL00tksMVnL+pZvVBoxqiGxJKlg92197Nsfo+YNklJmYOahsVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EY2seoxg;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7CC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EY2seoxg
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7909293eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486967; x=1795091767; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjVW9VP/TER5rvEadBEmYCt8ueid8AgZqnJlLcgyHj8=;
        b=EY2seoxgN/lP5QZxJCB/IQ7UKMLtTYoZG4g7DdWrqL5oZKQMb8OBcQAdISuf117azw
         hUIedT4HiaFrFWVSsyRSd7/zRB8tpPlVVvHo7CpOrqpfGQ06FPuwz3Opuw2jCgVa5BVa
         nmGd1xjy8PgXgJXt6mkfiNDu2r0ViPDjHRtgHRFjHkMJuBn8aJl49JTuvs5wJ6DCYrIb
         82cN6dW1p42Dc3vwGw5x3m3MK2nN0EEyR9lFGoa2VgdbrNKqZcUfY188N05YogGQyZI0
         /v99f1cu1xnZcTF0itKA4/UgbFExnYBzD8mz3gDoGDixuwH6M8sz2nCCM4P3O5JUhP/7
         Sm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486967; x=1795091767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hjVW9VP/TER5rvEadBEmYCt8ueid8AgZqnJlLcgyHj8=;
        b=NKECDtTsYIgNa7GVI345XR6+B6J1UZSYTb7hAt8JbsZ0z7qiVIoFWzKBo7qPrpZIH3
         JuEfp/HAwT2gawBxwFS+2XN7X250y/qSzCSrLJLrN3VNSAZw+b4WraKbQpYhWWi9B1zG
         GjXZ26DTqWaZ+N17LhVb+Qk+bb/RK5x+qd8YOsfeekeCuvXlsUR0GMb4jO9WpXMRR/dZ
         oLKDyX4WZYDs6QfnZ3F7F1cU8iTiAzZgSY2Ena5FSYY1w5dcqgVWUkVUPLG0WbHtUM4R
         uD5qHDttSz5xlLhxgVPF7GPyn64MmyP/WBDnIpV97zCDuD8CPk12XEVya+RncoerUpk6
         07RA==
X-Forwarded-Encrypted: i=1; AL+hErESPGq3xh3UZTZ69o0vgBTWaW4FU7EINEqw9U++2Pcb78DbJ1M+fgrZ+Mb2KQr+C5o9NTizOepQTmdbJNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wsCS7gYmukDfV+413d/jYVPDSx0jz2ArLyCG10o2JWnFOWZWy
	SIA1AmdzbCRw/GQjSQjeSAuiF5RZ+i7ZvvbZNzBBSwtZtDJsc/6+iwLQHyM/Vw==
X-Gm-Gg: AYBFou36jED53x18qlOQ/WndwYqAZG3DPqiO+dsSvhEXQLQPtppP7nR/duS4FtKYvGj
	4tnO52QmDV8wLV0VBn8qDjOB7+vDeMITn94P417JPuF0R+HOY5FoK3x0swq02iH0r2EgwMRk19z
	BcbmH8gGFYzjMAO4SIYb//tiQC9Xub6Vg0QYXVzgmxEXB9UEV6pbPnebQhbtEqtMfCg2qkcuZoe
	UlxPjJ18dpaVx/tkWJOYslRiFZGmPuf+0b03L3QIZtMCw/hcJYJLDKeYQ9xKtCM2KFfcvpSRq+6
	0gDy7TpedzVYNWFAEuqfu5ywvJS3CquqZPeNOorYkR1Fd29StVCHBjkxTSbhiiHwa+KsHfbusM2
	RBWglsv5gqplTg5YN60D6UFgdm4yFrFvdWLk+7jEQy2QOgULxODoUybWwuZjae0e4qJzkLFq4QV
	DhSVzZEaE8wEjNgZV3WiRJF90vNcozLch0eyCAAh+HQUH3CtYXesHzIoSGW059ijEMtnduTNMKG
	YvwRM+pQIPj3/Vs+IjT1Tgv4uNV2JZapk7AjBfnvHgdPHtoC6hBhp8QBiegp9aptRyKC2GIlGF2
	7zeWIUfQQJdqGbP5G3znJh8hq4E=
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3768366a866mr6118746eec.5.1794486966515;
        Thu, 12 Nov 2026 04:36:06 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm28827005eec.17.2026.11.12.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:36:05 -0800 (PST)
Date: Thu, 12 Nov 2026 20:36:01 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vishnu Sankar <vishnuocv@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avWyftYhIVaPpoln@sapienza>
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

Ah I see, thanks a lot for your help on confirming this!

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

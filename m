Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318513;
	b=A5TSf/qvjGmQVvVUvJE36LRq26s7cs35MfYay+qVJSaamqOlXNvJEy2Utamf61ph023X
	 K12kys1bcqGcr7kNdLR4sHWLDlbG8Ev1Pk/OrACvJUp6KVS//gazsKptkp6XlN3gfilgN
	 C4Iek7GUqr5HvBVvG8riL7WTR6RkmuGp/YQki2fXqRK3S3uhsDxwouIB+Ej/YLt68GdoY
	 N9eyXYHz4lxluEBz583RJoh0Y39hZkUUv3zP+zlhVYN2P4NtYkHAorgMw/9VjPr5xNpEq
	 yJ3CXWZ58EwWM6d6EWDHA7a9vAIsU5PxERoLRziwi64lNBJL/nXLRk38IFa3WIvtTUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Co4X+lJ4cTnZFILI0kHUCUVHOUrsje27fDkW0QWbJgw=;
	b=mmNpzmdUIzMGOXU4OnD6X++/vXF1OlM1rxRDXDvCD1a7wnpP60gvfe7sna9xgvAPlTaH
	 sRu4rqzxFJhI2mdEgna1KDSnjV+pn3rSOokjaQNNfK4D3zFiFWE3XBQIsPzGEBQdIm3zt
	 1lzOwvtg6GknbGZvnXUxlJAGODuzxMXDEVKaM362NRu2I1PnGvzlRyzOFSwVRRXOyO6cf
	 PW/xKddmC0q/htSi79BRlhmVOyitbMLSIpKPQhMW9O9nBKZdN7NhQS+R6X9n2xZ2JHbMN
	 uKdBstQ1LFYkfkx89FYxaxTSJgrp4xjf0CfQhZEez9/NgTiy14Wmvo4F4yyCfDrhqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXfyOBZh;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A73606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXfyOBZh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so3150819eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318512; x=1794923312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co4X+lJ4cTnZFILI0kHUCUVHOUrsje27fDkW0QWbJgw=;
        b=zXfyOBZhxWw8SbZHBTmtB7CK3cXMr5ykrNBzXsVqyPwfiXoq2qlPajWzAsD6cViDQ+
         xLnCjZ3r2COxxasXvuG0aLpIX4Ij+/1n7Zxgdp5EYg13S2G+aEWityyQBnVdnnUeenMI
         dIWK30BRw/QdBLVFotB6sVO7MeskSSCjCIZUB0BDT+GsUJ6lKysY+SAjIU5uKdaAzQ7/
         7x+CxASPVSv+tS+A5gr785g2JnbaP81hq3QwGUWYkU870jmmJ3P/ULCeMeabVH0HXuCV
         NNppmBkf3+bTvRulsZoBM5VU19AjeSuxWLQCeDmuf9cmhLoeFOZY1V8begZ+VjTwJnbq
         NOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318512; x=1794923312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Co4X+lJ4cTnZFILI0kHUCUVHOUrsje27fDkW0QWbJgw=;
        b=qXN+oEh4uJcLEfXh0pDUsrL01po2X96+ars1efv12t38XrbbPownQU4+RQXTHSXQlo
         kzlnsZ+Z0PgkUAou+Tb1vqV1ua3IFmBNYnJBWBAduMBkToQuGWwxMipBv2mh4bXpX81v
         zLBdqtfWpYu8jT5en57LGNBGqV4xAR0natZ9TueGsGxNNH7sjmyFF9GtP9cZ+gn5v5kW
         aAbJCwdCTCoikd7BofH5ijxMNKCy4tLiGmZOAHxmewLgRGCNQc/DrlSSrRtT7VRBuavf
         YhRqVFoYkllTJfXSkwn4W/GY01pEGZkVONJpuzflp0OHjzR9YqlUhO5PJ8Zb1xkClKux
         EvvA==
X-Forwarded-Encrypted: i=1; AL+hErHauMCLfOEW2dBAeNtiRc+q6gXu1u0zJwUUO+o55RXhzIIFmoJ0B/NG9XmOfizA5UDF91/rnPY1J3YeB3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ckJQdAfljtGbEXD3jBLaUvJrEC/iBM9yPNekuILZhqkLrJHgs
	10YWVsOYEEyPIB3d2Im7zRb1qyMrxgiWLIsLNwoCEHxt+jG1NMhBdajw
X-Gm-Gg: AYBFou1+ijpYPNoaFt31j9wb+fJtwuIP750U/XVL26cjiBN9vdN82Vt+HleNQQDnXF0
	/zW3KgD4LQ37z4U/nZH+cNyq+uhQ9ZSWQc5j/rOUsCds9ELpjz0eOdl2Lq8BzjETGaiz8iVsFSp
	lkjNpsNAg9yQ4DVgcPv46joRb1Gi5HbBZsJxtcr9aloeGawFnWwywOvq/vX6vuufAk+ya9WZq7M
	TbMJJkYqBwj1R9w2lxs6BvbYk9cNCIaK8m10rf/gliQS186mV5AyXcQon9cwO+Z/BWUrElrYPCp
	ssAYURu0Ermt+OOnwx6cqHi0I/OHABAYL3bmAiMvubQQtbJnoqWp5cJ8qbowAWb5nbxZ9h+wc5I
	gqoASAW5zdHQRcErWuNdGjjfSQlyjXhuvzTtkAKXfCGmhFx4gj/BbkZ6LwdxvPDYXeDYOKNBh2C
	nhd8/RSIJ2jPQpvcs0yWl3Wbw7L7QqsOaUQ967ATwKNQPq/upBLoqLpOi/7p2ZvMQdG31x7hQVN
	vKDAw4kXr4rejDzVIVvfXGGzrImy23rGUQksPagev8PRMp49Hjz5XPKqCMWkY08wbPrPp1Ftifz
	PdJWxHgAz6mdJTvchqrbXDgjjcg=
X-Received: by 2002:a05:7301:648b:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-3751f946c28mr3807038eec.31.1794318511934;
        Tue, 10 Nov 2026 05:48:31 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm6663679eec.13.2026.11.10.05.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:48:31 -0800 (PST)
Date: Tue, 10 Nov 2026 21:48:28 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vishnu Sankar <vishnuocv@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avMcB0q7wF9oP5X8@sapienza>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
 <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
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
In-Reply-To: <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>

On Tue, Nov 10, 2026 at 05:26:21AM +0000, Jingle Wu 吳金國 wrote:

Hi Wu,

> Hi Dmitry/Yuan:
>
> We have confirmed that FW A1 was never released by Elan. The Elan Variant ID has always been 3.

Thanks for your information, Let me share more details:

The trackpoint has driver from "ELAN
Microelectronics Corp." in windows 11 on same device.

In Linux I found the device is probed as generic mouse
device but not trackpoint device, it's hard to use due to
no sensitivity setting from sysfs. I found the reported id
0x7 is not in drivers/input/mouse/trackpoint.c's
trackpoint_start_protocol() after debugging, the trackpoint
is probed and works well after add the id 0x7 there.

So I thought this should be a ELAN device w/ ID 0x7 and
cooked this patch.


>
> THANKS
> JINGLE
>
> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Tuesday, November 10, 2026 10:36 AM
> To: Yuan Yao <yaoyuan0329os@gmail.com>; Jingle Wu 吳金國 <jingle.wu@emc.com.tw>
> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>; Vishnu Sankar <vishnuocv@gmail.com>; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Phoenix Huang 黃世鵬 <phoenix@emc.com.tw>; Stanley Chen 陳建維 <stanley.chen@emc.com.tw>
> Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device variant id 7
>
> ⚠ External Email: This email originated from outside the organization. Please use caution when opening links or attachments.
> ⚠ 外部郵件： 此郵件來自公司外部，請謹慎開啟連結或附件。
>
> Hi Yuan,
>
> On Mon, Nov 02, 2026 at 09:08:36PM +0800, Yuan Yao wrote:
> > The new ELAN trackpoint variant id 7 is found on thinkpad
> > X14 Gen1 laptop(Product Name: 21XMA006CD), it's now incorrectly probed
> > as Generic or Logitech PS/2 mouse.
> >
> > Add ELAN variant id 7 to match the TP_READ_ID command return value,
> > probe the device as trackpoint correctly.
> >
> > BEFORE:
> > input: PS/2 Generic Mouse as
> > /devices/platform/i8042/serio1/input/input63
> >
> > AFTER:
> > psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware: 0xa1,
> > buttons: 3/3
> > input: TPPS/2 Elan_variant7 TrackPoint as
> > /devices/platform/i8042/serio1/input/input65
> >
> > Signed-off-by: Yuan Yao <yaoyuan0329os@gmail.com>
> > ---
> >  drivers/input/mouse/trackpoint.c | 2 ++
> > drivers/input/mouse/trackpoint.h | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/input/mouse/trackpoint.c
> > b/drivers/input/mouse/trackpoint.c
> > index 3bd8fdf56cd3..f46fc1665c96 100644
> > --- a/drivers/input/mouse/trackpoint.c
> > +++ b/drivers/input/mouse/trackpoint.c
> > @@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
> >       [TP_VARIANT_NXP]                = "NXP",
> >       [TP_VARIANT_JYT_SYNAPTICS]      = "JYT_Synaptics",
> >       [TP_VARIANT_SYNAPTICS]          = "Synaptics",
> > +     [TP_VARIANT_ELAN_ID_7]          = "Elan_variant7"
>
> I wonder if we really need to say "Elan_variant7" or if we should simply say "Elan" here as well.
>
> Jingle, is this your part? What is the difference from Elan trackpoint reporting 0x03 as its variant?
>
> Thanks.
>
> --
> Dmitry

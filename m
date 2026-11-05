Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881838;
	b=aE3WLD5C+OKdokvunES51K/GRQd/4jUOGkx1lJgJUoasW4KC/AyKItScOzHpowSgsQad
	 V7V7E0LG4aPRdoG654gbH9HIT8qOdAaLvZ4SCjl14bHjltDdzfdgepAgwIvYPUFSOJhhM
	 28SKi5EObNYu+ICqoCSLorCPoohJ/EpmG3RJgKoF7d2s9X9kTFqk7gKYPJY2NB3MUwAqd
	 yeyVrUkpx0Z1+jky+z8uxbKGU59U73/d8XML7n+vxtUZ+1gOGOBgV0eO3yXzEd2O5yNr3
	 Uti/K0wiq14Nm7GQaO9R1kQByT8xxD+M25QpsLAGWVjeMuL2gVh5q5BiQrb8ZW4aZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NXQY59s7bZpTSHFUOUk0f+WmyGheH78ucLM4Hd8zHqc=;
	b=PCoonJfISIaK9+44xrpLn5kQaQ3/jPIhUfLK/1+THvNxcVCh2NJAUIPCPXhW7BkzYzSe
	 WfzWa8iTxGl6S3tx7NZRPoNq7fEdKDy3DeaizdK9Sj3qAYv3DJMyUMU1qYClvyIZB9xHL
	 OS3TSNmF4PYK+CmQ1QC1Z6xY20YAwaRtf6izkcKnaJ70UFR1NItrxrlJxnfyAVz9uTaVo
	 RVqbWXIFRJiXn65/e91aMCCgjFkyN0IzRGXS2DB0UriWcSLj2QnWFRPaBmrZxa9Htz8/c
	 DLrPEsgDZqPh7D9tRQn9Ca/Efbhrg5bCUAgfdmYsXA6KqUbUWsj6KDgLputLbHEIgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPhhH6+N;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B88606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B88606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPhhH6+N
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14158915e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881836; x=1794486636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXQY59s7bZpTSHFUOUk0f+WmyGheH78ucLM4Hd8zHqc=;
        b=nPhhH6+NmaqLVBTjCn6gLiWxt54G0rgpmjDMCOOOwIWuE7hkwZaTwdHSUcbLz90bV3
         +ZhYUFxfNS7WxFP0TCpE2V3+vHO/juXGoxxLRmQAG1M0RU9BwCAIC6xrf1jMiPl7o2Ys
         87goIbnEB+AfvUgROipi1L6JBvIsJ37EY/02vV4hcGgnLBoV06mTIbqcKsRj3vaIT1H3
         eS7zqYVWOirImhoCWwjmNkft6z7CcanMqZG7wJAvrrmk2Ge6lrxeGZdEDDTTyD8TFphY
         Ih93YOQAnCpD94CVFIldfnCL/sushsVq1Om2ZW5GSygkVHDGFcvj0LHnRYakzU9XaN/D
         x+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881836; x=1794486636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXQY59s7bZpTSHFUOUk0f+WmyGheH78ucLM4Hd8zHqc=;
        b=v8t2kMdz45Y/QpPAy2gLVANBDWYaM0vm/k+Qzs9teAaYOw4G25G8o+SlAS8uJ69YVe
         /k9DFD0oIj9DxqGtJL/Tkq9t9u9iJfKbHQP4acQLdCoZwHtigASAly/vwpR1ZnpFg6Qs
         qwnk3tAzVjLatj5Mi9UtZO+2RgE4xnuC1fTt23OlNeUDXJtA/9GMDl2PBxVVv8wuP29P
         VsiEtT0LvHrP81FCEQTPrfF7LSp+1R02CkHOCtOw6bzn4lN04yvqrwyFNE3io+pzNcGb
         i6CfkoaP+QMUFht1WnaiQUR2C9BzgaZJtSqadGx7UksrT137Thjfk+t2bW8+qH2HKUQd
         /Vng==
X-Forwarded-Encrypted: i=1; AKwUvBw1jFMuSwKsa4j4QM1tstA4PHFrkWvLrRvBjZbFJRFXygubTVJQ0UQdKwcj0QGxmXkfmRIZe7gvMqrvR+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z86nmkR+B9h/2+COjxpjCFwU3SoG3C8Tx4XWK8grD9lUTdZUxmw
	95iT5PWSVvSwUgutoWO37eNee7jwiiIwOcm/y425ilzzYwWsyE4sizDS
X-Gm-Gg: AYBFou21n+rf8I64AU0NCaNcu4E1/nnPAEhspdxs/7s5tVGOm+8VxyCxPCpfT1TPnrp
	Bld1zA0DsTlENn6vlZXTedyAxxmD/PqM2iFtiD2jAgo2pRM0zZPhF7iIz6AsSFUQoe1lVb5RqAV
	xrhXbgyQkbDW1bcN15ljN+SWCemK61f0kc+8YQbCY80gT/yMAvvpWK+lGbE0T7gNnINoXSSOZab
	W8gd2Zn5fYlh/AXnDg4gSIJoiQwsMOEVnRP2e+yGQRO4exEaEO9U4+lOLRdMl+iyGzApkdHCKlK
	cOxoz7QB3WX6ElMITm7TNwlIAbto4ZANI0gjUDsPo1cJPrA22x92C5isv+TefeQrx5pRm6fw3/z
	c8sW9wxJGjxiqsH/PMu330FexU1aVMkuC8gCdtog22OUqDMSrEShTp4ynYK3Ajl09uxRsgA4byR
	V0xoWNBhP2IEQflUESO0kJQfKi8xuNS1WZAVEg8exr9FKEFgZST3GdR7ojiCdVb6QGv0ka8cOtx
	k8Dcur6TdJYIuHGXrxqRMJuD3mI8JsWL+X+p9i3QoPYa5wgEbDDdYEFDDUO3KaTHkqeZTWoSHYF
	PbR5Af2BQRiIZjQGWHE7NpvxUrXDYW5rccaxVJ8=
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr417810655e9.16.1793881836320;
        Thu, 05 Nov 2026 04:30:36 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm11450138f8f.4.2026.11.05.04.30.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2026 04:30:36 -0800 (PST)
Date: Thu, 5 Nov 2026 13:30:31 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, xuhaiyang5@hisilicon.com, xuetao09@huawei.com,
 caiyadong@huawei.com, suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <20261105133031.6a49f1cc.michal.pecio@gmail.com>
In-Reply-To: <59b0cc88-9ac2-453b-bd68-56aa356c0fc0@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
	<b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
	<20261104183603.17d663ce.michal.pecio@gmail.com>
	<59b0cc88-9ac2-453b-bd68-56aa356c0fc0@rowland.harvard.edu>
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

On Thu, 5 Nov 2026 00:06:24 -0500, Alan Stern wrote:
> On Wed, Nov 04, 2026 at 06:36:03PM +0100, Michal Pecio wrote:
> > Were there known devices with bMaxPacketSize0 <= 16 which required
> > the whole transfer to complete before they are reset?
> > 
> > That's not what happens in the initial iteration, so it seems any
> > such devices would always take two iterations to begin working.
> > 
> > Is this what the only correct Proprietary Operating System does?  
> 
> I don't know offhand of any positive or negative examples.

Pengfei believes that the current behavior has only existed since 2023,
so perhaps no device depends on it for enumeration yet. And proposed
reset matches initial enumeration, so it seems low risk.

> But if a device was going to hang if it was asked for the remaining
> part of the device descriptor after a non-initial reset, how would it
> ever get through initialization?  The procedure does two resets, and
> after the second reset the device has to send the full descriptor.

I guess a device can harcode enumeration, including the 2nd reset, as
fixed sequence. Or it may send 8-byte descriptors while in the default
state or when wLength=64. Not sure why it would do that, though.

> I don't know what other OSes do about this.

I tried W10 in QEMU with qemu-xhci host controller, the device was an
audio dongle with a HID function and bMaxPacketSize0=8 passed through.
I disconnected D- to get errors without port disconnection detected.

Windows doesn't seem to switch packet size back to 64, it only disables
non-default endpoints, checks port status, resets it, switches xHCI
device state to "default" and then reads 64 bytes of device descriptor.

This succeeds because host kernel has already configured proper packet
size by this time. Not sure what Windows would od if this hanged.

Later of course second reset, address device, normal enumeration.

Regards,
Michal

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855189;
	b=iPRsanZLlMuRuvxX1S6i0+x++D7QVTwTAIkO/CPizP8F9h7rQ7nBEOtDkqkHZEmIGRIz
	 wdTqoe+Z4wxWLeqRzQMV5UWMxZXsSvcLpTDXOc4PcgqbVdR8mLyF47GikIpGL0jRv/8RJ
	 KfskRoFIKYKsC7SV/t0gZGOAQdmYnKTPv/btH9THjCpGIPToKdRB5lJkeS0aUnZxVPBFO
	 nEfuyM3RJ1KCjCULcvTd1Y8xD7UsbFfHBfxE4EiOgCtJXfT/CjUL09sh71m6maB+fpUg9
	 tc6XwkoXacPyWgqR2WISbZdpP3e7fQXOauNV3P/y98XBaIYjVIGYiYZn5UE6hv3TM2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WJXyrXeadAPpp1EgKOr4nzDbu8SHuoj6JH23Y/l65FE=;
	b=PeRDaOz54bsxMa+XTQiadqC+3BEmp0Ojh9ldAfF0i+2j3trLdfo1GSgMJV3qTCt6ZjP2
	 W65oU6aFc2lc/d/Ah4efZuWfjQTKquxw1qx8Py9tmBikzh3ep55XF0KBU1bp3jcoMdKJL
	 QlTmRz1oOQoCRSDGN5tz+4TndJaNQY8tnLjPUq9WktqStbUz+Z88QGRQQtKpLU6s7zLv7
	 fj6R5+PHiysZJqJqZpyrER6DqbYDrnaYqhCWVLCEBtU+LRUpr4nmCaOc3YqOWIrdP6o5A
	 ChHXRwFpPUjJl4I30YzqF6amAxAsbfiqkRusMxo5T2J79KEEu5D0ns5vL/dtvcX4D1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=u1vps6FB;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B7606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1B7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=u1vps6FB
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b8306b9f8so22852306d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793855188; x=1794459988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJXyrXeadAPpp1EgKOr4nzDbu8SHuoj6JH23Y/l65FE=;
        b=u1vps6FB9frxf/5wIeIkT79W6+qKBcnHUXgZFA3lxyIcYMxWBSmuscItg+LvtzCPt4
         wBr1/mtJY/KdPwSIYKiqNB7nr/GC5kN1g6ESuFk5sivSG+oM1NZS9EzeiYbFdXLDLnJg
         R2P4a9eqHvR/8bAAY7C/e8ag0fUqd68EswHYUgY5F3qh8yTG09z43B71PnaptvlwZjQi
         zS69FjHsGpaGz/m6gfwNcRf1iwYvtxvw3HKv+CwvysJR2kNza/Q5lGXCV1+6fI4TEX0t
         h79lQrcPeWwS7dFc+ta2AHIO9VxrEiNfI34Egr3aWtmJCvctnWKRi/7MqfEHpYhsm2qP
         bjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855188; x=1794459988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJXyrXeadAPpp1EgKOr4nzDbu8SHuoj6JH23Y/l65FE=;
        b=e73qkkKgaqv8BwODiSwuUJIO8DbEviWldfDv5nuq0qJhQPZMWiEMucmPYlSMTYOz8j
         dr1WlphG7W6cqB2l/KbeLB1/H8PBo+fLyFn3FtnL4DkIFOkQrw+f941N/vwFaix11Ee0
         67781vlOLzT1WcqJdTF7pOH6tqUsu6kUvqEdkEaBqxdj4Jp+DFbNY1YxXxZbsZ1XIuVe
         1k9YZXurSpZbmW3uFPJ5euJqiJTlJDdh1T+wAN+EHmnKKolsYUU6ZFDCwA5s917q/7sF
         0f4b2Jw27e/RcsjP0HDed7kTe3KLrRtV5MXRPDN4ZtfbEADtGrOOXg/givAQtyF9wo5w
         VsMw==
X-Forwarded-Encrypted: i=1; AKwUvByY0iW/Z/nm0lkbYadeVxlex6H1oI0UMpRSV2Yuixu7M9qyccxBNYyDI+NN1ruFne8DoqymIq4fbrxTaJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yafwlr7PI2Y3BMitoHiwSfrqwS9RY+4YbEqXDMeyqcI9HhqQe
	cIspUTEB2M+49i1eSobHQZv9UQv9mbc6iIWYm4+WdvLQYf9BV8XLMoeJ5KMrlwAuDQ==
X-Gm-Gg: AYBFou2a9mlYayogv/YV9uOhO+k+AManhmakUpw2fVx+mqHeLJcrxS2i03X5q2wfuVG
	JFyi+QxiD6oWffd9Ks2hlC4es+Wi9ULW2PZgzBknR7D/xarAIIc9sMAsB3BYO99615pKAPcNPn3
	By+p3RLoeimBci3uOfBG3X1kXH1HIQNg9VZNeMpvW8Y+xJD31lafsO1iNx701AaYBTQa69TqNEM
	b/92ZvB2CKZlmIiyypfHhH8XoX5v7fxK2aLcGFyYJUH62utAqSJmOwwk3j5ymD4GVO0lD+8dQ50
	CcnPb5L1SCvj/qk9WDnuiONXuQGucaGsq4d65nK8kgkmT15aUG36tLg1AoDqrZ4qyt2gDf7iYHh
	7vs3y0LWL3VqgSeFFAXrLoecWgtDMBOqKQR9Smy/0at3qaQ8GU+OY1JWFsIy3Hl/0ZRgVCYUuQM
	Gjq0YH7Z+IoTQAy9RWrk5YlKCzVWbh7W+FP+sGr/TBun7XgQprjgbr+VHDR688YvprnQ+M1VnNn
	i3zTGfKn327Cllb+aUOoccvwsWIXcFZ9eWh536D9BkHsaCOfADFktFz1uRkyWrYONBzyF5CBzSM
	U+fZsmoxMk7fv9RnN7TmWBg3T2lX
X-Received: by 2002:a05:6214:2263:b0:91c:7a7c:4491 with SMTP id 6a1803df08f44-91ca4bbd308mr298429816d6.43.1793855187833;
        Wed, 04 Nov 2026 21:06:27 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e01a3f5sm38061886d6.30.2026.11.04.21.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:06:27 -0800 (PST)
Date: Thu, 5 Nov 2026 00:06:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, xuhaiyang5@hisilicon.com,
	xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <59b0cc88-9ac2-453b-bd68-56aa356c0fc0@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
 <b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
 <20261104183603.17d663ce.michal.pecio@gmail.com>
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
In-Reply-To: <20261104183603.17d663ce.michal.pecio@gmail.com>

On Wed, Nov 04, 2026 at 06:36:03PM +0100, Michal Pecio wrote:
> On Wed, 4 Nov 2026 09:59:24 -0500, Alan Stern wrote:
> > On Wed, Nov 04, 2026 at 08:44:02PM +0800, Pengfei Lv wrote:
> > > When the subsequent re-enumeration then uses the "new scheme" and
> > > issues a 64-byte GET_DESCRIPTOR (get_bMaxPacketSize0 with size=64),
> > > xhci_check_maxpacket() sees hw==sw==8 and does not issue an Evaluate
> > > Context command.  The xHC queues a Data TRB of length 64 but applies
> > > ep0 max_packet=8 for short-packet detection.  
> > 
> > That's exactly what we want it to do.
> 
> Should we want it, though?
> 
> Were there known devices with bMaxPacketSize0 <= 16 which required the
> whole transfer to complete before they are reset?
> 
> That's not what happens in the initial iteration, so it seems any such
> devices would always take two iterations to begin working.
> 
> Is this what the only correct Proprietary Operating System does?

I don't know offhand of any positive or negative examples.  But if a 
device was going to hang if it was asked for the remaining part of 
the device descriptor after a non-initial reset, how would it ever get 
through initialization?  The procedure does two resets, and after the 
second reset the device has to send the full descriptor.

I don't know what other OSes do about this.

Alan Stern

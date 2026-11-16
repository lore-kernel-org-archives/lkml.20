Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846523;
	b=PvgznbZzpTU9A0gTAfRCdjLOCzbBOhI6BnMDKrwTpzjl8tF/dVN5NiGUChKTyMIbUe5D
	 II59mPq3mhJy4eU9yQW1ZAQh06aWOMVT5AjAGl6YDHdAWiM/gK39cWgbohkiRXyB5NGi9
	 79kF7xzq3VgX+QxBJ2ObsxsJyIOMWFz02mnE7klphEFYYC/r2BXf4Uqs7ICu9vbV4aLtG
	 D+EJ5rERtJdtvxaiPFDfGoSU6M9dZObsrLRTa5kHzU5XBluWQ3AShPj9gFs9tc2F2c6T9
	 IwYw+hXgfA8p1QOl+Is7/lL2AaC4zXKcSBtr5vNgU6TdooCl2gcq/QDfsZGm3CpaPig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
	b=hTQK4OkwQCFQR4J982bv2D/bew85WlZoE0/uNNmmhhmMW4npO8xrZZmzPRI3JDKcnN0H
	 /aSCLLYmMgPOIlrWLqVVvYuqU/sOPzVz+ja69Yu1os8XctC+j7YrTNg5RIKxNOC9zn4w3
	 u9/xUoJbki+p2yQ7OdFcxDLzR34zr/j9VGE5uGKNVjDjDyzScuCnPKNO/d7m3lpHGSl1H
	 B6tgqxmhIkePtCkiv+X70rgr4BjllJCp6hk2yWXsuoPTXi0TNgKc7GLOFd93jrz4Pqa9R
	 i9t+NuM86sDhOk6NqkaYeefGOITiMMjyu9hkskvPuwIeRuipx5KHfdwP4Lt14gUsEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgGsa1h5;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A71606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A71606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgGsa1h5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so30337605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846521; x=1795451321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
        b=DgGsa1h52Rts8iMQsAM4EJfolE1WumuJFMv+MANoxbtXJXUOJKjkXxqF7F52ddwi4B
         igJl8Rh2ip7GVy8wPhlLKhruAujaQotXx1zhJlK/t1l3kKd7ciRnftPamiLQwevK64Bt
         k8APXM+6MHR6p9gPx61Vp76+p/B521PwanYfwN3htVEnEoonaZ23QL33BIDUw3R+yf4d
         h4IbGGGBRAapLvL8Rlc4TNDPbcyxFICIxnJoPuMIWyJ/Ovt2fCzL+Zl6ikJ+w7CHqluQ
         Ayy4mBCMc8Z7wwVKi76I1WC/0L03NnAnS2aMKpMAIs0mwzZilY4SpSvU/4y2CBxtQROJ
         IW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846521; x=1795451321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
        b=Y+MyIivQW+Eln3D8cMpGazdPLnJJITYKxGL9GXp418ejBJNr1VIyW4gIrRe1wbc3Nt
         kfghlRYTqr9xjtN6hrQ6MPNhepk4mt4R4xwnajjzlRtqOUMWKd/k7lrGqLLGreKmEeIu
         XEIfvG2MccQX/Gu/3iHm0bA4+U2eu0NvZXopJWlqX1G9MP5gS66YLubyvp2iGBnU9soG
         LV2+/1YupyvYDu0vzdod2fRL/2NeYSkedQ/ePv9Pp9FCFKqR0uzc6HbkvFEEEj+qiYjF
         bkxaANyvib6qlbIoi9Q6EG097HOaAxsW1qgQyVXQQ1VzSGCaKqXn1cJEgZ3DaOiwB1yQ
         KkWA==
X-Forwarded-Encrypted: i=1; AL+hErGWFZt3L/Al1l2+on/SInrY0zMMjQCFH0H/yij8Xi8jyPAynBa8G6uiS8401ScVc8bLT1iXgQbMOzFrYHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KbFA0SlfSwz6Ph79/Iam46wZAGVd6SVsz4PbPLUAh0o5HPKBf
	m0Sz69K0LxxnO+jsjaCdpFTHXA4M4U2LMNZCw5C7dNshlAbyWVrlfcWV
X-Gm-Gg: AYBFou1FpQDK18/BknYcYx/TbTu9Aauv01wvto438eGlCrDp9J7OEmsyiw8RBIRr+M2
	M2K7FsaC/r3KBLhRZ99vcUE493/bg+nW9I96/0WfgMcdjzdg4GhPPyTwX7D84cYisXJTjc4lXRs
	MkrBxXVTRkO8oP0JFtwd+lQWz1OT3h/FGYlxozn+ylm+uFXtW1QRAS2HcjaoynE8BvG4A014cUa
	8uLYFBNR0NxVaJ+0mzn/3WjguAUqXLWJEKx+o/xHcud3ia5aPxXAo8BhHMTeA5zmXD1zaIH/Joy
	7AuPm2LqF/nYuccxIvlRGJvs00V9/KXTH3TffJYDhMGXILgr9KXQXjNNHKaR40VsE/zDU4ulwtG
	ddtiw5vqSkOqCj2yY3HZOdP14JlVLwI61SX+pnID3IfRVmS8U69QlSkivnZWhvUF+w5mlu6R4WR
	vWU6CWhRQy+GNV6BZ81//egvWYWnsaegh/OqJPYzx5FrNNk6KC9XcZfVWRMF/15yurlZLASd/Q+
	TxZN/Mt8MB5DsNKbMqDF6cWiFB5Eu14ZfllmP+pQCCX3SVdOzGICXtaxewuuVwordJ30kUNUp6N
	4ct584QkNfXTn5mOjvQoWCSZ7WDDYDngaPCv0Qezft7UvhbCorvLaidl1CjgDXO2bWh4KrWj55q
	RkneCcuqVIHLwi7fcfp4nH0Ka9hCPLG14wZgxdC2kw35rai55Vh0=
X-Received: by 2002:a05:600c:3e06:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb6947426bmr119351755e9.20.1794846521012;
        Mon, 16 Nov 2026 08:28:41 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm412165885e9.15.2026.11.16.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:28:39 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 16 Nov 2026 16:28:32 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 08/10] iio: frequency: ad9910: support iio backend
Message-ID: <ika7dmfhhue7il5xgbgx434vjxdwj57dz6kebaossw32vym7nt@gmpxjkkqirgz>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-8-0e9224ddf7b7@analog.com>
 <auoRUS-tsK4X0KoU@ashevche-desk.local>
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
In-Reply-To: <auoRUS-tsK4X0KoU@ashevche-desk.local>

On 03/11/26 18:52, Andy Shevchenko wrote:
> On Tue, Nov 03, 2026 at 11:53:04AM -0300, Rodrigo Alencar via B4 Relay wrote:
> > 
> > The AD9910 parallel data port allows modulation of the DDS core parameters
> > at up to the PDCLK rate, which requires a high-speed data source. Add
> > support for an optional IIO backend that provides such interface, with
> > data streamed into the device through an output buffer.
> > 
> > The parallel port channels get scan indexes and scan types according to
> > the data destination: 14-bit amplitude, 16-bit phase, 16-bit frequency,
> > or the 8-bit amplitude and phase pair for polar modulation. As only one
> > destination can be active at a time, this is enforced by the available
> > scan masks. On buffer enable, the destination is configured in the
> > backend and the parallel data port is enabled. The sampling_frequency
> > attribute of the parallel port channels controls the backend data rate.
> > 
> > The backend is also notified about profile changes, as it may drive the
> > PROFILE[2:0] pins, and the debugfs source attributes now consider the
> > parallel data port when reporting which channel controls each DDS core
> > parameter.

...

> > +static u32 ad9910_buffer_chan_idx(struct iio_dev *indio_dev)
> > +{
> > +	unsigned int scan_idx = find_first_bit(indio_dev->active_scan_mask,
> > +					       iio_get_masklength(indio_dev));
> 
> Split assignment.
> 
> > +	return ad9910_scan_chan_idx[scan_idx];
> 
> Who guarantees the scan_idx to be in the boundaries?

ad9910_available_scan_masks constraints the possible values here.
will add a comment.

-- 
Kind regards,

Rodrigo Alencar

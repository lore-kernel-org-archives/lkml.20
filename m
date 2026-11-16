Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804111;
	b=k5gG8iFwjDVEvk5t/lCmTikOfF/0PGLBm/dpsPh+g5aQNMrA7Pu0Mrc7TYD4MUl92JhP
	 lCgHdZ27hxWXb46IXPIE9sulYir/1EV9aQCj+cxFFP8nNf7ESVecVFDo/S5bzi97PSVSg
	 r/OMf4TWxZHzwkqlgMd4nTcrQ2pWQO8SiJ8EmSk+xGlB3rUvdSoja/OEzd+GYhX/jyYou
	 fVxXWtDWkF/s2Xq/dKTOeYErZF+tGmz+CmasobsBTv85Q1KNCjJ42UObiQfALGN0DHz/e
	 repfeoyldEIcxymyuGpMIJVC3Z9pxQnQY0asUAVpJKiBmkW497Ym4BWqCjciONvpasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=VTg76kZYdcgWJGYz+qNwtmcTjFCSvF3hJ+5NhX0RygY=;
	b=khR4LEPTTMCktdgZrzf1zpSEuE/qHyCG96IB2WP/VVMJN3o7uQrAvIhn2GI0z3SCUFRX
	 /7XfdOcES/i/SKRvsMnWbUDaSf4ukCmA45y+EG6cti1joMfQaYPN+pViPZsqqomo+7QmY
	 0SUweWN4gfMlTyn4FI+xtiZZsM155/TlTqiVi4srRUATqGr7pddYIyU2lrtkA3F2isJ0G
	 6nZIEAofZP77t6DGe3UYrhn0ODEVaSFHVVgzaKtNVfmG17yZvsXhj97aKBsEhB1IDj/H5
	 8Ou0y/lOonKp8xpTlnfMXRu9l/NUqWHpJEagij2nt8X7v+1eIkeim52Hx/etI+a+xNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crDJr2fg;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crDJr2fg
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37071c0f42aso4450386eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804110; x=1795408910; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTg76kZYdcgWJGYz+qNwtmcTjFCSvF3hJ+5NhX0RygY=;
        b=crDJr2fgE7IYKY9ipw8yqz6NSK46OAewcvxSzfZtWwosU1qGMmuk90S/wHLwuueoZg
         zq22Ri1rdlPWHjiqX9Z7VXyagyB/84RrT9nOCcXRixDAQpVYEjnQvWmAWKjKhX/Wownd
         FK97h2C5q0YDqnktM8FFbDdmwMc/Oit0vH0/UC3io/AHz4XcVAw2K4oSzab1XmxxxvRi
         /k7vD24tI8/Bz5ZnHE9uAwm3fy7a6Pk9QZuvRLVzfSZt+qhje8l/907jvV6VtB1o/hWH
         CxSCCY6PZTEZFB0kuTQa+cb1iylIdK+wLs3kxTzdHlKFQ0dy+5z7uIJbUYeT7t7ZHcgz
         GERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804110; x=1795408910;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VTg76kZYdcgWJGYz+qNwtmcTjFCSvF3hJ+5NhX0RygY=;
        b=jTuMmhtoW0DcrC30bK3Y4mENRoDWszr/hWeNxJ6GPitLE+yYlTYkSQ7vmyuAuvadM7
         paRhWAXhyzUjDLcnGusUwPI5F1216ucyf7F5eFFoeIyP2zvfcrifkWotJbFeRw0xUa/l
         g++FWtmBfdTzPtr+qzj9zPTQdNiwSLkPMk973oHYueknX3DprYFvTfsGMKHsZMuYy9kx
         70xZtRnPH2dN9A0UvA6d/4Rv+4Wt9hMC5AOwH7kLM9tYeVVmvLGt/n3f+qTygWlEBfGo
         DxMaMaLnPG0wCGSFM7FAhAn8prWEOSUdBHV7P4r04gncck/Ewp3RW5MeF7bsQIOqyJ/B
         Et6Q==
X-Forwarded-Encrypted: i=1; AL+hErGMuS9ce/UaVG2LSfLD6cnZGxJCanku6CszrSajVhIJ1VNoA8Rnb3zoAq7JrEfb4tyLn5z/yc5ZCvTe7Pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2AaxYvZfInBBydNKJce7A25D7x509DiALGFEQ4baBTK0O2Itd
	yo9/CFbjhtOouEBpkyNuIIthm3RdQsv4s+IHP+tP4Tuo2hRyzyjz7ugn
X-Gm-Gg: AYBFou391+bvb9rPilDA4ePw7i0Yf+mMnvthdu7gaqEVylynyjeKeeQW1VVl67VRMNZ
	ZaFSdb7q+h2Gov6ofTHEWL6XFcdDrTOQSJnkZGn3flt1DtdGX1x/w1077qLv5aeElQTANjWh9CM
	XRwJInenynD+YUJ5vbbIAcWxGfhFTxred9UbnMKKV1joxQEU/Lq0SoHOY/WJzTXO9ZFSS7XJF87
	RaFI91mwTS947XUaIBR91c214y7xqARAusUIZON4XdpSevou9xvVeZvCcAAJ1NKxI6qHbzCXDzu
	WLR6u/ZZgjNhXJPDYwESbVZr3QAOS1yQbwHu5GEX92X5+ZlMYsxGa0OF1Hlfng32FfJ5n65uBWF
	yds3QXjYZK4BSTWyBJpIuyf1ay+PynhpNGqxqAnsRgS/1zIH28xlboHvtDGaPRphvRBbYy5a0Q2
	Kd7E12lumr4HMxqWMFtndah9lZfJy4Mqcx3J+MVrTX1WWeKBJqkO/lvIRgO/eXcipw3NL2Gzrv9
	6A6LTsofUaGF7S6W2GZp9fhF/aM26yoLl47CmSAjJD24vvLSRuFfprV69Ukcgkc6giSyIbVTe9W
	qxMGwYDk/PCs8Xw4LtA0ZbO+1iI3p6wpyV4JwUxYaZBYIAf54yE9z/FZoy9B46JYmlot3K02NBS
	hT9bUSXXII9PEVw==
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr14170507eec.22.1794804109971;
        Sun, 15 Nov 2026 20:41:49 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:203f:d9b9:dda8:24e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm30905922eec.11.2026.11.15.20.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:41:49 -0800 (PST)
Date: Sun, 15 Nov 2026 20:41:48 -0800
Message-ID: <7f9d0adf1f49c5a2b3919130caf0acb7@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ahmad baghereslami <ahmad.b1995@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: synaptics - support the touchpad LED on RMI function $30
In-Reply-To: <20261114090808.2572722-1-ahmad.b1995@gmail.com>
References: <20261106095658.44166-1-ahmad.b1995@gmail.com> <20261114090808.2572722-1-ahmad.b1995@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ahmad,

On Sat, Nov 14, 2026 at 12:38:08PM +0330, ahmad baghereslami wrote:
> Some HP laptops have an LED in the top left corner of the Synaptics
> touchpad that HP's Windows driver lights while the touchpad is disabled
> (double tap on that corner). On the HP ZBook 17 G3 (SYN3040, TM2706-002)
> the LED is not driven through the PS/2 deluxe LED command: the Windows
> driver (SynTP.sys 19.0.19.68) switches the touchpad to RMI register
> access over PS/2 with mode byte 0x7f, looks up function $30 (GPIO/LED)
> in the page description table and sets the LED bit in its control
> register:
>
>   register write:  SetScale 2:1, SetRate <reg>, SetRate <value>
>   register read:   SetScale 2:1, SetRate <reg>, GetInfo (first byte)
>
> For touchpads in a new rmi_led_pnp_ids list, look up the F30 LED this
> way when the touchpad is set up and register a
> synaptics::touchpad_disabled LED class device.

Why is this touchpad running in legacy PS/2 mode instead of native RMI4
mode over SMBus (InterTouch / rmi4_smbus)?

Could you please check if booting with psmouse.synaptics_intertouch=1
switches the touchpad (and the pointing stick via F03) to RMI4 over
SMBus on the HP ZBook 17 G3?

If InterTouch works on this machine, we should add "SYN3040" to
smbus_pnp_ids[] in drivers/input/mouse/synaptics.c and implement LED
class support in drivers/input/rmi4/rmi_f30.c (which already parses
f30->has_led and the F30 control register layout), rather than adding
RMI4 PDT scanning and F30 register manipulation over the PS/2 command
backdoor in the legacy PS/2 driver.

Thanks.

-- 
Dmitry

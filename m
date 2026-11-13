Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572659;
	b=GHOr/pU1zP64AASnxFrUuDBgyvETDPg+Mh5ViQdNK295DSHIw1DdYJTYS8wPp0Lkadsi
	 IvmdEobeMV3vmjr1xploa89Vfo/2lKtkVH0qL8n6jHUAQ/mv9MY+5L546b07YO6zbX8a/
	 WUiHBszGPhcE+BQ6vAV4RwR8ZIIWN1sdrVEUS3ysSXxSVgJ1JJCVz6w2M2qiXMZBWjYDt
	 kfCm6zwm8aRd3J96hcdauoEWmIJb6VZzboqW07U0n6Ge2xodjgD6NUyGSK4RBWyspkvW/
	 0WJNiYOxj6c6HIK9fsQlbOkqq1gTuRuWRGzMtPziWPR6U0seC2W21BPwtdu++2h7Hvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
	b=tu1+o8AR3tOYPBqWcLnxv29HR9qRTUzkLDFIKX37RR57nb6Uk2v3K7g6gxRmSSJsfaNc
	 sQNuQ11AaO1xgBMqlj5Cn1iwykhNn5QmHhxN5/UW8k+ZKKOyyeTTaqm421moTW0tsDNCT
	 wfoA/1cZ918Py5lbNm1t+Fx4LZQLK/cKveRjwAfZJiWrinhS8IN2+P9WMHGwB+BrBPfKS
	 eEE+dV6DtYKe0uIthWhXp8wsHSsOAoXr6HEIGibJyHu+RNEyUeC+YsyYibVBtds4HzAdG
	 fIlab5dyFdiAmoRIxyKPAiUhulBCmv68OWHtp9sVHIYp68dJae2vPo6zoDHp1M3Q27A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPwIm5Fs;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04C860A260C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04C860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPwIm5Fs
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso1321124eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572657; x=1795177457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=VPwIm5FssYcf5tgjo8d3hmUfvM6E81Ea1Ks/10Q3gFgmUCg0ga6D+J7u69pi4EQPzv
         aCZbphLT0EXyKoVc4nLadr2TgoJlRfSiZy7purzSurIhG1vQjqFZOzwGx/nhfNnLRqcL
         Ajli1tfHuS+4Tuy70GmKWT8kY4y4brEQwvNvhxt4UER+Y3qBvq4PE9zuLenL114KJoeV
         FS58xyQPJqq6cIRd5H83Ppnombuu9Zdd6VNFL75tYMF8qacbTc4MWb0pQDuFJN/xnwjL
         YidvVR8BDXeAp926gD7BtunnRfbdUVvcqpD6mz2EnOKSvxxJQc5xV0fA0ADsZ/nLw24t
         pLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572657; x=1795177457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=P2HpUYMJHLkYYeRYI2jYNU9kcxVniROnOqRHhxww++9MDbrWR1eYAQJXS3Cx+Vvbep
         aG7qUjb/9ZmZdUlLzRBK3dXM68HgteS9oP0Cn/9EdZR6K4HTipmMcIQ4uDbpCSOkUc6g
         1g15VkprChWSm2Bvqm1rtVatp8CYgeY8G0IBwwOB/X3Ovr4NEfINjQfRBCObcMmDAlo4
         PU/KzhEzeWWBmFm+ESMrmyX+jeRQQC0neYXlaTC5VXPnPkDZFUCP5hbn6yikq6glWPwV
         V6iZqkJ/+1/FaFgjeG4JW3+av29nqzDzNELwRpT4xMVPXLmOkzHGUx6M/Yu+gFQj/Ng9
         ykOg==
X-Forwarded-Encrypted: i=1; AL+hErHOXDXqcGntOPoSt3Xkp+SOLKixQWzlgj4PJBRAKLbRZX0FJXcWyJEXoKNXTyYdL7DWyLmoc1/rQwwqSRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nRQ3NNGbEBML2n6heaPK0Gs7vNkhHOJ7V/ZIFAfDVNenudlzS
	/d7cdnsqWXB87MD5FY5t60arrwnzEOy7ngULE1BJyMx2D1q21wEjP+Ia
X-Gm-Gg: AYBFou262yrCiEQ8elY3ft5ZaBvL6rtSI8ewQ7TM+0ecCk4yIQD4r/fz0szeEFHbDY0
	AINGrEsdkS8IOHFui+vjepV0x8HOHGsItNioSDyhHwaHDABdkuZh0EaJKnj652FzDjUG6p/epXo
	llZ87JTTcVlcBtZ5EOS7UftkSWM0FvabHULwvWSNpch7XrdA8YhvhzedrSLquRltW+wALI8Nw43
	tCHLT+H4oE23d8vAq9W0QKd5Dz2D6lkngpXLR/KVZYZCmWdJ9Gr/YEPZcFK2nTbfclpEGSN305d
	XR+yqLLOlptQYduGUYFgaEXqjFi9ukb15eQC4jVTQ0uxzwfMBFoMFq0Hutz+WkZip1RlF0j1Qev
	BpdXfZLswM8Ffg9ov/OkmsAc1TQtL+6niVgcpMq6GAME0oZrJZ8kT0BC0B6nJNGF7Ja7EvEfFNw
	Ek4LVzZ5dtYu7F6H9LqJQI92iHD6yKEbij6MTPi3lq4m0bXekit1wt6mjIvWd1VzfjT/O3M/PSi
	S9h1f8xBueMv6hyIxeZTYHvZmWylt2ZeFkpOMRFStOXfUB3gEzdnAYpqw/HedMkVuPdkuv9+QB/
	pyHmZkLgCpdFf8GIxCw4ZdYgTG4t6w==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1692885eec.30.1794572656803;
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm7242488eec.16.2026.11.13.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Date: Fri, 13 Nov 2026 20:24:05 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <uot2mqhilzdfngqcwpipdo5xzncyvesmw2hw6rqk7mnveer57f@6m4cqzotx53k>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
 <au5Q9lYTUegeEglv@aurel32.net>
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
In-Reply-To: <au5Q9lYTUegeEglv@aurel32.net>

On Fri, Nov 06, 2026 at 11:13:10PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-06 14:05, Jiayu Du wrote:
> > Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> > fixed-layout cells for the temperature calibration parameters stored in
> > bank 0 and bank 7, using controller-relative offsets.
> > 
> > Leave the controller disabled for board-level enablement.
> 
> What is the reason for enabling it at the board-level? AFAIU, this is 
> part of the SoC and does not require any board level hardware. Therefore 
> I believe it should just be enabled by default.

Agreed, there is no board-specific dependency. I'll fix it.

> 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)

...

> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@120 {
> > +					reg = <0x120 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@19a {
> > +					reg = <0x19a 0x2>;
> > +					bits = <4 8>;
> > +				};
> 
> I have tried this patchset, and while I can see non-zero data in the 
> /sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
> appear as 0. Is that expected?

I see the same on my COM260 Kit: both banks contain non-zero data, but
the two trim fields are zero. The factory 6.18.3 kernel gives the same
bank data and temperature calibration data. 

The thermal driver change in [1] reads the bank 7 trim first, tries bank
0 if it is below 8, and uses 0xd8 if both values are below 8. This handles
the zero-value case. I don't have an explanation for the zero trim values
themselves.

[1] https://git.openruyi.cn/OERV-BSP/kernel-spacemit-k3/commit/334d70cf990d4e9a9899bdfb758e47732ba5d519

Regards,
Jiayu Du

> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

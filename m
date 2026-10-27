Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090594;
	b=LT7x9AHe9ObVCRGF4lmqCAKWjGd+8lyJIHnUVAU8Mlf8TQqVsd/k1vJJ40H8Bu1gyJ4S
	 WV/UtsdUcHIMfusOrPS4351Co5JdRpeoOBZibfb1AHK1AQS3OoW47mGAPFaMCj+GXKbsB
	 iPVB/Lmlg0WGpURUymsROSeaFfPQruRx+kTFE1kR4WBtZuRY6ardyvZB4ZpolZO0t8oUQ
	 quksD+/LDIAGqtFnX555aGRwRIRI9R+A9kQbwx+NpsbAYjtvzzthTnYuPRbAkQWuihsXO
	 yjCaIsKA+fcAIyj156Qe0HIpOo+uUgcAChFF8t2fqLPD1Gn02hiD3tWbN31I2dDZ+dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
	b=g1KBFRMjfwHS/oeukrJagu9q625g0ic07woxD1SdwDuS7qV9//4cnrdrESH+FXfi+ZkJ
	 wc7c2QaDNmQQpr9+oZMQUXvayD2R3qPaeev2lEIfEJs0WfjkdI0e4VJVwEwJ2WAV+eLjF
	 hYfwG+/t0lZfexlBC1ercW60RgfwbJofBxFXNNUyN8I1D/fGH+3fw2nsOCgK2PapLW1Uq
	 08oOIdqcLTqM+MP7AYqogi7rZz/C1NbmchDAQZvCdIKrLxA8eiIAgOA1TtN8CLnnBzjVC
	 KDHckFEdgULZM1Iqf2adSnHcuTEgX939/ZTAWp1uAxwEWQxJKsrWdDJ/U3EKJfDgsvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U+MCwusp;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C4606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709C4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U+MCwusp
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso34396525ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090594; x=1793695394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=U+MCwuspKVOe/KK7pWHUDK/JipbXiKDqESILed5yddyrB8jzOGCrRR1HLo9CIC7kpN
         YWW6ShXECFbKW62LREn7LHMdFXmrBdFoH1PLM62ubh/E5tnQKus8h8su1aUN7ckQH87o
         p+Nim5cuJl7XND8KTbx9UljIYReLcStP0wC+Ks5OvKSGRRQQZO8OlvL67yNQF/qVrbI7
         pU+PRwVQS5/z+jHby7XUUYDajwViLkC/Z/JNNYTRvtgQPCxs5PJiQUMEtvqE3EyL4Fbr
         HeX3QTP33FzySauLCgmMRbR2R/8CyCYzbFMsasZB2w0968yQX+VS18im2KtMPnH4mmKn
         DR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090594; x=1793695394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=XNuWe4FeSRh4GT/uZvIKR9aRUhLv/fV70JUbAYw58lA+faeGpdfqqv7JH1f7U73Wr1
         FMQuSD277k6ni6kk8TTK5eFUz7+d6VTcjAjSm2pUyw2u2iudJv3fmREfPVwN+5cUDYyw
         l9qBQrsvnwVPGOoVRedLC1kOXrXymlAnLRCQda6pxkjRfXoZr5YFDZtaR1w1WDH1gPbE
         fvWE3cJZeN/792FddAo7hShMPR+3tXJPXC3+aPJM2X5WF4Tfre+akuZM2BchALJXR4TC
         eqrkiH3cJUp2y1R8yCjCwYXFjahVrJ+yzdybBOHqXNI3W/RNC16XJPeMRYfp6G8CDn8h
         /rqA==
X-Forwarded-Encrypted: i=1; AKwUvBxIPV/vvOL7rk4h8fERX14D//TLoJ54msTYsk262LqPxOCvkowQXVkxeHLJajk2EH3uRdF6qIWpQtFg+BY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1KGZIhqBBCznjGQdSBBsmul5bG5WfGq4RzEXRRYevR384F0W2
	v5xnIV4SnYSYG66fm3hjJUYb0++G4LUuJfY0BwMzS7+Vz/uuRhCQyLt4
X-Gm-Gg: AYBFou2FW2bs2co3wodwDgZRX4E2wbZ79peTeMpYWSsmpuZ2EmvKEIyzCHryB18glY7
	sOnh0dKd4Cr/0iro/iRR/B/JW2pXiHQOVf/9xTkaoaS2Q26ESiWY298ba8XrmDDUai+XqeONDYa
	xSyel4jUvT2u0a5UQO742K9qGEj5e0fiPwjaSldl2QNW0uMQEz9FQYh4rcfHLgnaHrBap57321l
	tTyL4KWWK9mv5GTX64VnIEwO47JvclXKJ+bQVIIhcyDjtHQuvIwElc9NFlyEgrzacpPVTybbtLI
	HyIXwF41e37vKBeEwUFsdFVupqT10eEIds7o4JSZ/CMCVsqYbd+n/7m9wly9H7wLmiXTg6Ul+YF
	rRwD+UJ1xHo1YkBxDzuyRBKQ7ehdLpKBfxdTBElPKrHKZBNI6zp26bZdFRqsgg6CX7N1b5C4Ppq
	mZ4pWRlYVqsKVPk1PH9gZKaxAx6oej4UVZ1JYhiMZeS+ZN7wehvVmptMQET/GFk+yQtXRT99VCD
	dZNvERrZ6etuZCmudTQ7r4vUz8Jf6pVQthHnlkmBfbiN+CMsomi7hlFv1SBUkC0NfTTOUxVEC2q
	LZRdX33tTbzlEMl71HwySAhls5sB
X-Received: by 2002:a17:902:f68c:b0:2ea:cb4f:fd3 with SMTP id d9443c01a7336-2eacb4f10a9mr43735615ad.4.1793090593725;
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm5901625ad.53.2026.10.27.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <auBj4o6t_RyT3wfk@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
 <athuYJjPMkrecGm3@inochi.infowork>
 <atiB7-u5bxJbf-1q@ashevche-desk.local>
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
In-Reply-To: <atiB7-u5bxJbf-1q@ashevche-desk.local>

On Wed, Oct 21, 2026 at 12:12:15PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 03:51:20PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> > > On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > +struct k1_pcie_device_data {
> > > > +	const struct dw_pcie_host_ops *host_ops;
> > > > +	const struct dw_pcie_ops *ops;
> > > > +	int (*parse_port)(struct k1_pcie *k1);
> > > > +};
> > > 
> > > Does the "const" here add anything useful?  This patch suggests maybe
> > > not:
> > > 
> > >   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> > 
> > I am not sure whether the compiler can make use it.
> > And I have not seen any explaination for why no reason
> > for that. It is good to have a clarification.
> 
> These const make no sense. First of all, the third one is missing it.
> And I have no idea what would be the proper syntax to add a such. But
> adding a such make it clear that there no sense to have them. Either
> you make the const the whole data type instance on the user level or
> don't do it at all.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Good, I will remove it.

Regards,
Inochi

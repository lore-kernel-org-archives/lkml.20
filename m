Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049949;
	b=RWsy7DfDOomWzj3PtRHzio8VSYHwhBEblKvfOfpNluk9fw7DTRJF5vCCyAd5ignXffLc
	 gVFjLJ2mYwqk3yS7YXQWkt2Muaan7SZYmlLHNYNdC6s4RxlVhQP50QReBMwN1rKAEmH8e
	 bzX1cz7KrFKTz0s7BRH9Wn/xEjVZDjbsufbSVRuexqGl2IaOS2c2pWmrKFGUugHeXcCuh
	 vly/uhPTH5DkLOmTU71Ar3Tq6Hs01/KprtP0Bu9L+bolOCacrhYpAUkLYYMS4glX3Kxhj
	 FY+vG0CSz2WKFDXaigvSz0GRQKn8bafCgtoICwlpsfi4jCRq57+Lukai4r0Wx1lyX+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kpcgrgeS4YJixEjOpFKN1PyswVGYEcCcMxkh0K6m0Ok=;
	b=KTiqiTGnnfVlkWaOGV06QGcQewyLWARn1vKUKaKb2khxLuB5H9Dwr71Nt3KG1RnP4vXl
	 R/TyKETJ1k9jQlCtIKQ1zhVE1UOOD6PChIRYzlFwAT3+2pO/m5LdsZoBQbgnkaAB4dTjz
	 4ZsCpFkRyyr0+PJIbRvff8RQAWbSJOzDWJhw40cpI9WFRYqXZJIHDa77DrpQXWXRLCcGJ
	 U3lumyldTjSa7IOs2X1AxmdrbBXRY4c55a9YH8YRhPIK28aWkHRwM6+VXK+nNrMxg6Tzf
	 ZCTteBxcuMEvD0PykD1H5tcu5nQehTPJukfYznyhIOz4Xbpid3Twfd9Em7McCT8FBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=toynIiF4;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4E606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=toynIiF4
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed41818a4eso806215ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049949; x=1794654749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpcgrgeS4YJixEjOpFKN1PyswVGYEcCcMxkh0K6m0Ok=;
        b=toynIiF4lQi2EG0ep/9UvK4SLQn83ci/V6WzBDqELM7fNOt2FIY+K2yUFZidtbGxlq
         V6cm+c1ij5DybJpfplIgNgullFXQaNsuTS1XccraiuYGSGLmzTBIP7MV/VTZrgj7Kma8
         SerWFdyxZZxDxbMH/bTfH1fN/fXXvq4drBlKns7HzEKBIy/N6+JZsjvdfhcnv0uGBsCi
         g92rpQ8aWOGnn33TNVh7NOXGxAV/HLll8fuNQAHvUp+BS9UMJ6rBVbReHRLX2SD5AOcA
         mhe11yAUDePbJ608xoT9i/m/i7NU9UUJX5Zzhv3bxtwQ04t7D5nr6GLxbLzVfwwVplKg
         e9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049949; x=1794654749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpcgrgeS4YJixEjOpFKN1PyswVGYEcCcMxkh0K6m0Ok=;
        b=2p7YMHBndW9LlpBhByvdHzGQRpwelVulABEgS8xo1qGfv1DosJbJRB5gbYZ/qjlxmK
         HYXC/kdqbVtyLtV+w3+7R6LuyVSzSuGrxKDhR16YpJXt2IOallS1/2leE8k6iV3t3o7I
         p/Iy89sGwjEYCyfORqnYXYL33AqVBDSpqp5NBy7zZ/CGQevpUCe6FEzqsSBXB/HtSAc2
         jOMYHwm9dp+d+x9EzHQ3iF4rYvlypwiXa1ZQWF1n5rYoQ9wCZBwDbbQezfaptqxUTudJ
         G7TwtXD7AT7MZiaf2hwb6s3jjbV7OL7j8X11V+tC8iYRoKCBkc8/fY3R6rzOPWjlxsa1
         VV7A==
X-Forwarded-Encrypted: i=1; AL+hErESf7D96IFpD3rJF9GKqTTTcWl+tZH+phaPVnwW27bR4YDtwnkYxyCg9bQ8yN3i3JEzLuA8buMyJDJ83mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80JfohSKcp7NZAUFWUxZj46lt+FQs0XOqtz8c3HxNetGWkX6kA
	tYSluYzuMnSke9MHU8A/24xH0ut7HEikqej51r/lYdDUkttjS+dXgbnQju9d3yb3
X-Gm-Gg: AYBFou1e8E1wto/MJN3UJT8ObsA48jUDeUjg7nxJQYuNJiQ9rYBob/qeGj/XEqVsP01
	ZzxvzlJm5qsu8HN8oTm6ugVzp5j8/oVFwb9aGq9/cMU1zyvaiPV7nkuKpBhLSlbfvLjkQn46rP+
	GukukcYBDIBVEGOB29dcwuVZcahlw4Ho4oXmHzuKfx1tjgsmLfTRX1gbzSOWxyC9arIeXgiLZho
	rvEyQbHwGilkfFRBkZnLI9GUycP884gTYaGUPIFdnS2SLKKazmWswAXnKr2u+ppJxBemedLjzEo
	aGH00JptUi2vxwoXoWuA+ebtRo3KYOru9Oaq4YczQi6omwPijZLKhRvhvEmC4QDKs3TTv8my910
	wX1qkk6j36HOALuGdZK1DtOOkGDb+aja8ePRQjbZaXACCIWH79IBYpePC8PQFTicH4Uh632frpe
	roSAXbZPg4v4e8M8yxKRyp43BxL8nxfwY9+HQikmkg8bVxcKWSg2KTf0u9mO7sR80maa0kqIvGf
	kvhRW2t/TG3r7ifb4dm0rz1m4zkdrPvPdDwlcaSj7hYioNZw/SJxXleUMSpROeraY0584qG8ZU+
	avewQasbFydef2uad/pevAP1
X-Received: by 2002:a17:903:1a24:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ed416ae161mr87708345ad.2.1794049948724;
        Sat, 07 Nov 2026 03:12:28 -0800 (PST)
Received: from marchy ([2001:e68:544d:4b2a:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89f59sm12431085ad.68.2026.11.07.03.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:12:28 -0800 (PST)
Date: Sat, 7 Nov 2026 19:12:25 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jesszhan0024@gmail.com,
	airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <au8HmdyRnuFmSmKh@marchy>
References: <20261030083737.47188-1-azuddinadam@gmail.com>
 <20261030083737.47188-2-azuddinadam@gmail.com>
 <20261103-zippy-quantum-bat-98b5ed@quoll>
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
In-Reply-To: <20261103-zippy-quantum-bat-98b5ed@quoll>

On Tue, Nov 03, 2026 at 11:49:07AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 04:37:35PM +0800, Adam Azuddin wrote:
> > The RA8875 is an SPI-connected TFT display controller by RAiO
> > Technology Inc. It supports display resolutions of up to 800x480.
> > 
> > Assisted-by: LLM
> 
> You can drop this.
> 

Will drop.

> > +  interrupts:
> > +    description:
> > +      INT# pin, active low. Signals RA8875 interrupt events such as touch
> > +      panel, key scan, DMA, BTE and font access completion. Optional, since
> > +      the host can poll the interrupt status register instead.
> 
> Last sentence is not correct. What driver can do is here less relevant.
> Question is whether hardware datasheet allows interrupt being not
> connected.
> 

Understood. I will drop the sentence referencing driver polling.

Thanks for the review.

Regards,
Adam

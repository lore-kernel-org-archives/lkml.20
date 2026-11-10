Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309731;
	b=vKpBzyMASgs6zqTgeSE4yXMAPHQ4sJHMYwUhfznaKYlubFoos7bsLXEMIMMzkS71v55g
	 virOYxr2w03t5mQI+LdQ3Ny18O4ID5+6QLdOjH59n6Itco+D54QTf1sVZAIdmkF7p69oJ
	 IfLz7vp5VaVeeAERFan/03jJ0igzfCX13oNAhsHApV8MBotiuVxuD3xi50RUfFJNC/gzt
	 ybq5MaGTD581mDHV6W/IPCyZmyAQWYW/MuSXd79lkwxWjefZSOJO5XKXU31XsqsUvf+fo
	 AasDCfI9i1PIzSbhYiE+oJFD9VBpweSuynuJpjlfWhpHXWTEHNhkbKKeCtmoxp7lqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
	b=IGlmbskBx4N0jkGOM4WVbQKTaaHm6wIAwbNKWzziTiCbvJ54M3kFlkS9yey6wIStTd77
	 ZD5hgHm4DeHGbdAYAQ/5f8iHPUVYHewMqXBSjpAZzlkZANYw9YsjwHdmDOw/AB1s8oea8
	 5K5bK033dmXNBbi+eYL+mnU/NXSwk06aURs61seoRsc3TECcYjyEPBaPqo5Q0rEEIFWmB
	 rKzlQ4QSrAvsU6mJj0ts0Mptjak4lMZlbZLOffsz/UiWwhBhgpGB+qClPRnO9pMsY5rf1
	 8ePdfQjf0SJTNeXdBtnK0HPyvw69WxCT36SrY0bo5xW9DyDreOXGS4f7bptwo3eE5rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPqS74x2;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86523606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86523606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPqS74x2
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1185304a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309730; x=1794914530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=WPqS74x2NUSC1tknWVErVJDYN/dNQGSgNh2hN++DSeZCzj7xEGWcYIMyaMK5BHl11J
         5GCY+COu5espLBEtyeUQNc3FBAcbXjida8XkdTvkjA7izRWliOola4ss7LiRfZKtwLab
         ErVzZ4xOjR8tnuLcCh7hgQFJ/z8tpJojKR6Ly87XdXz0oLw0ZSmt4wutVzBl1DkWXIJX
         sKvc5mftkffxfJbnwxxSOf2M92EBn3BTp3hcnOqMIpwD+vHwzts1rcKEimx2zYSrKpFw
         e9hCO6sravTaCPzSjjPlFBt1Vck0UH8pJIp1lRDm/W5KNJBR1A35mqYmM5DCdeSNLlyZ
         frFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309730; x=1794914530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=qSqjNdyvAK4B0RJNpIuH28gcqPgH7vA1HQUVj4OimBLrFkUEBbxDUCIZkKQa5zae6M
         FiC5bo3jBoAbUjeq+IIwOjiw59tDGFpnX37zo51iPST7gBHq/QP42dM5n8T1qoGK8aFG
         sBVVl0XITcGdIbEEEKh9GDnPZWwWq8NNqQ4GZhI4soKpOiGlGPrVapSEqmscQj0//K5w
         CGbH90vEi7pcOiFRVMBXn0dvPYbwjS3fwKzJRn9gI1Cynb/3gjEJ+ZMffi4ftM8rCHGa
         mtLjZiJ8nQRROLaT8RAiW1APmJr7aJ6BMsIRqsGK9jaW8bTMPocUAzO3FH0gP4hqEy3Y
         B7mA==
X-Forwarded-Encrypted: i=1; AL+hErG/0Rx0NfK+vObqDmWTE6igro9VK1IyUdS7LpdQGwiB3tpbUX4c/pOs2jaWGgMKfwHuzW1BDRQtsQLmySM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8py6soT1twjtmi0JqqI7rnlzapO0mUH/bbl7+1/3Y/5hCakF7M
	8gyuTQXYMrP/T1ilcbuMosmPjwgyoyLLBeP+i08iW9m81f+rq98cUdKL
X-Gm-Gg: AYBFou0nsWogYqCCYYp+iCOJc2mzatU9Y1H0dlPPb/WiKaIBP3qRYLrN2JfZewkiYH8
	cHHa5JJXW9G5dwToI4cLr9LBgi+7ghEqOhLVbVoIZYTdiSC4JrCH3sMwqAPdJ/HqbErjn0t7wBP
	rK2OanYeWMDJYRKAAxLyGcaI58kCyLnryXpjRpCkNQflik79y1fLgtOTNhj4/2QR8xL/hFzLrL+
	AtuAYS6BoJB4RrexOzx3oL56VxM4KV2dZAc5wMEnjv74yHk2sxijffg3FIE6qSMryKM8Xr13C6N
	GoTb4pSiIvxcogfS77tiqxrt7Clu1kOlyos+xD3Ad65P9hJbzB0/diDlTtunS68PltciHBfJZ1k
	/S/xXMdt2XwQIJMFu0549qtWaQxuxly3P49uxzdfkMJPvuXDNCbM7CNp3PwQ4IZMkds1xiWqTR0
	mQ1SwiAG68t+JJGVpEqwS4g7GSDDcsyykxUlBtUL5oo2Ua2UApDPkJZb8G8dOmLdDEtGocVHTXu
	0tr8WVi2VVSV+byvqtNuTZ19Oy4T++V9YZSWmQyk3smk85m9C41oWuMS6HKoX8q8V8nYhts/IQs
	WbtcpaQrex9IPgCNKgCReEj6vRM=
X-Received: by 2002:a17:90b:1641:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3b166ce8601mr2382151a91.50.1794309729892;
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1c0csm3413913a91.6.2026.11.10.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Date: Tue, 10 Nov 2026 19:21:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Longbin Li <looong.bin@gmail.com>, 
	Dinh Nguyen <dinguyen@opensource.altera.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on
 Huashan PI
Message-ID: <avL-KigWPepz-Z2A@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-5-inochiama@gmail.com>
 <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>
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
In-Reply-To: <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>

On Tue, Nov 10, 2026 at 11:41:37AM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2026 08:06, Inochi Amaoto wrote:
> > As current the DWC2 support role switch on CV18XX SoCs. Enable it
> > on Huashan PI.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 
> 
> Best regards,
> Krzysztof


Sorry for this mistake, I will spilt them in the next patch. Thanks.

Regards,
Inochi

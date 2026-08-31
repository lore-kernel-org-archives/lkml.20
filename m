Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDD4A8FF8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188815; cv=none; b=DnLUeJ1rIkVefy4HRvQXEyC0Zf2PNPNUcfQabGgwNgwQfqb2D8viW8RJh2SV73PAb+uwA9kx5SPzDa8dY8dD98r0HyRuCW5u29ZwIBXynp4/jWMgXs6PjjA/nEtR4mNETKL8/r9MbnDUKhM816775b3ksqTOSQk2qhoRO5+ODo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188815; c=relaxed/simple;
	bh=Qf6a0R4jHmpC2yWs/50T3ZOjz3UwOjYUHDa9IVMREzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rghpFkacORnFYi5OoKDHAXklczqrHTa5T+14nCWb93p+gJQLysGLMrDJUiwgO36MJiva/IqFvKFd5KE1nf4h2iMn5Ybu7jqVhBWW0ZxjUi0mZ4/Ab5l8CDvrDgC8xR4oIrHNtFwSm5zASuh2C8AqXes9zKFngL+UAanno/cw60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qaAHzKfl; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qaAHzKfl"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52f83889a93so37714621cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788188813; x=1788793613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qaz4VU47r+Xftf2j/Z5q+DqA7/o7KPiocjXOlXL2zbk=;
        b=qaAHzKflu1iUrBUraePOYA68iAcW/gBotYLJo/iGHtSfjEK9wi9jOvPF7kvD5UIWXJ
         9EOBVxcY9pfaKLCxsDUgToZzdHpH1nJ+UAPkNA7OL25pTidZSShy9B6Yy6o+AxhJPs1J
         jUSMhyJrThlwW8OmHS+1x2Ec1/swddy/dg82qmrg/fJ4DIHmUXTbBvrHdWRA6l2qsv3X
         jmn1GfwlFclPXrqhHa4PZzXgJHOgnoOmvo6SpW28xAt+GrolMA+ANFK7XFHzPLVq+4Ab
         8YZa5/QqRNY97HbUjgyri3xoxaD1dVbUE7vtut8UNWPCpxUWDIZTzgA31fJNlhQy5ryV
         Tj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188813; x=1788793613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaz4VU47r+Xftf2j/Z5q+DqA7/o7KPiocjXOlXL2zbk=;
        b=L2cLSVJXIpL+cLi81++KNYwEuIeqmqz3tE9UbFBUXhoe3ZNc7OI9KKtJIXOZaS8d3p
         1zIQ5sOSJhZ5iMnnAv39VUmwBffGdEyFBqh9vWbMyNxIdKmSV/LY0yXgkeVGarI29e8a
         pHjWY01z2mgVWJ16MUgVMI3fvabh4d7mU2YPQfQWmvlABpG0LYMcftgafisPOZm7WKP+
         F8Q2trQsoMOFwYQeJIYoBvlOEF1oWUk7UWIK+tuLDketEWrPLUfAHzwzJzne30jOSbHf
         GV49j59zomjX/VyvbtH2PXGp5YAt05R/X2hSwpunvObJo39XJ6NgLSqo7dkQ77KK0zou
         Np+w==
X-Forwarded-Encrypted: i=1; AHgh+RomFVwsV5j9FFM4jSdyF/T6g1faMwP0Mp1+u7KhzlxT6B+suRUuOsuN9fCUx4o23CMPDM6oES6Cnaxa6Sk=@vger.kernel.org
X-Gm-Message-State: AFuF++liASAyANzMVYKjVf13XXeAHx4ubacIJ1ukj2T7vlfLfnTtXarh
	cVI9bPXQ6gbwLylDKnntF/GWxM1m3udywP8X3H+se6rpazobr8FVLMw13YfiZ/sDHg==
X-Gm-Gg: AR+sD12fgYuW2ADGLhDoPBsWgc4z44Ml/4WlGEtWNqsDSayybUr0Mllbk+jgZV7ylrH
	chYDM5dG2E8A/u2uteUxHAkksTfdeFUbKuPz0KtuEXck23caPU0klh289sgUmrmkmF/p45CK14v
	px3/CInQIEKzFAxplJjP8eSqbiOz/t8S5Fnn9KV+6oCqJDQcwYrA/904rK9MXatyjgWZI9eg5oZ
	8rNAoci2ucCxv0R/DzR6zyA00a09bV4iogk23+rHyvIAxy0bYobavpdgmB9uI1DYvBGKizZEO4i
	t2U0EhEu2dWCNaVbMt8CPQlnMvBHok4Vm2Qj51+h/GSlXsl0U9T3MRs8B7S+4yEawoAI92keA7n
	rQsv5GmEaQ71Qe7rdTEtuNb9FkZP0vcX66+L73WsoQvuZtocydqYa5kJACJHKkapOWvVTcAH6LM
	DMZExTgLY4uGZ75+U2gteRtCn3d31lcmjxjT7WbJsLJA4m4LS3zUUVA7AMlbhYjHt1idExegLos
	Z1dFhI=
X-Received: by 2002:a05:622a:c8c:b0:52f:a319:da85 with SMTP id d75a77b69052e-52fb96af1b0mr343696001cf.39.1788188785242;
        Mon, 31 Aug 2026 08:06:25 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4516af8sm86096826d6.38.2026.08.31.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:06:24 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:06:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xianying Wang <wangxianying546@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, kees@kernel.org
Subject: Re: [BUG] usb: gadget: dummy_hcd: general protection fault in
 dummy_set_selfpowered after unbinding dummy_hcd.0
Message-ID: <e416d8aa-a92a-4f7e-a0fb-fb537a16568e@rowland.harvard.edu>
References: <CAOU40uBQG6_o+wU7UbWgRzZq4865QmLfJBdK0RP+iqLNy7Q8ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOU40uBQG6_o+wU7UbWgRzZq4865QmLfJBdK0RP+iqLNy7Q8ew@mail.gmail.com>

On Mon, Aug 31, 2026 at 05:02:28PM +0800, Xianying Wang wrote:
> Hi,
> 
> I would like to report that a previously observed
> syzkaller-triggerable crash is still reproducible on Linux 7.2-rc3.
> 
> The reproducer first unbinds `dummy_hcd.0` through sysfs, after which
> the kernel logs show that the dummy HCD/UDC instance is removed and
> the emulated USB bus is deregistered. It then writes `dummy_udc.0` to
> the gadget's `UDC` attribute through configfs, which triggers gadget
> binding.
> 
> During the bind path, `configfs_composite_bind()` calls into
> `composite_dev_prepare()`, which in turn invokes
> `usb_gadget_set_selfpowered()`. This reaches `dummy_set_selfpowered()`
> in `drivers/usb/gadget/udc/dummy_hcd.c`, where the driver obtains the
> backing dummy HCD from `gadget_to_dummy_hcd(_gadget)` and dereferences
> it. At that point, the associated HCD pointer appears to be NULL or no
> longer valid after the earlier unbind/remove sequence, leading to the
> reported KASAN null-ptr-deref / general protection fault.
> 
> Based on the call trace and the reproducer flow, this seems to be a
> lifetime/state validation issue in the dummy UDC path: after
> `dummy_hcd.0` has been removed, binding `dummy_udc.0` is still able to
> proceed far enough to call gadget operations that assume a live
> associated HCD.
> 
> This appears to match the previously reported `general protection
> fault in dummy_set_selfpowered` issue, and I am sending this report
> because it is still reproducible on 7.2-rc3.
> 
> Thank you for your time and review.

Does the patch submitted here:

https://lore.kernel.org/linux-usb/18ec3122-7566-49e5-9964-1028857405b1@mail.kernel.org/

fix the problem for you?

Alan Stern

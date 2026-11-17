Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917839;
	b=ORn2jfhuRhtmfXnng+kOIxHQfqPt0ng3upkYXsg3xuE7OqAadg5+qaqgUsyjIvSutvz2
	 dU6MoX7E9Y1e0Cl6lu3fKQcfEDsIxg2PHofe3pupA9lQAStriKYHGq42tUaopIChAueoG
	 DLVo59O6a57iI22CYogYZdVOXsqMxt0ozX5cLtCMeyVoW2oXNFUvk0PewoRzT4lanRhrN
	 I20ut6CSgwBD4UpJato7H9oIb0m8hBmwtcqwkLTpZEYL9KqGguW+N1YLCGBiJ8YdiWoHa
	 oloRJqy+XMNax+RFi2NONw1m37At3NH/GSqMzFsL/7E7NA1diWRjGcTpMMqByiaBzyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nU0HNOJX5cxVhUM4H1v4s7zyRGp0x3z7E7rePfZOJiQ=;
	b=L8wF3pmM0+3VX8te9PA/wpgOvvNA4na5bO1Abm684LAG+K5RuGkPRvQhxh2Tk1gzEDye
	 cFdQjHagZDu8pBq2PfGE8EBHLTB2ffjg+drohOOqlBjLMSoYFtBawnln3UFD9DVwcpaHN
	 bN7uBeD13258h4BqeAZNJo/51sWkeFU0xILRcEEHvDS/lmmjFsuBYz2ZRETjESASqZkNu
	 +N49tmjaCejVkCvVqb1rtYiow+XzvgSSs6WG+bkzHBk1g+UKCubyoKt0dWxYcE25pK/VD
	 K8o6xc8RviT1OUIYTcqdPREFCW2ltI+9VDIRyUXKzkmP8cVkTOaUE6FmdbAPvHj0ZuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBfwRgOR;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C312606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C312606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBfwRgOR
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40f29667e6so803389666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917838; x=1795522638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nU0HNOJX5cxVhUM4H1v4s7zyRGp0x3z7E7rePfZOJiQ=;
        b=qBfwRgOR128pvEdXHm0a3UQwhgEm+6Ls2eiPpMOBn60nQsGZynyeqWF/DgvOR+xjuB
         HnReB608vVEKzJH+4gkl752mMfF2X/M0RK8Eh6jmh891p695yqoc0KgGTT7S8215k1+v
         2rhfQS8iaK+K9ldYbnszHLxIdWsftASol/modurz+1tbxEIiYTjAUg2UVeko2MR971/q
         +8iH1hcWvmYjUvovx4Mnabt+E2GfCZvKRl+0f/01tWZKOB2Civ9cg3lpYKRAU2cJH+e4
         fj1CP4mAoQtX996AcmBcRvdO0zb7MheUMBNRfpkuhBkfIumsf7RulWjXCpk8238GHz56
         kVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917838; x=1795522638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nU0HNOJX5cxVhUM4H1v4s7zyRGp0x3z7E7rePfZOJiQ=;
        b=ScKdZ+2TeeS1mebyvqX3aPDe+FAHunJoHiTK3UhC7CKRxqezAtW5kDhDne5xq9t9N5
         wZ9UAELIArZGq9gy62sXIOwRMQ7wIsJjW9kJxKG5MYuvVfutvghjF8vy7B8OhJHJGjNX
         ZpvI8E0/0UEPqmprS7mskUad8od20tOghr3L9R8y4wAvGzKAtCipr9YfUtZjbIYAJD1N
         sSfR2aB1qGPNg2p8+Q6lBoQNcJwWRyxuLuioZ2j9O1McjIa80GB1vWmbP5VKGDWNn6cJ
         W6m02b6p6y5RaeZXibbF8Ao8F0oqvLAfRrw9z4LuAfxwmOz7whGHM1VOVpBCAIQMDTMm
         +5FA==
X-Forwarded-Encrypted: i=1; AL+hErHNrjXS8Y6wWilm1Ftb5b+BKQtJbRkM/81dyqRjcJDIWGpBgh7MAn/m6mMeve5d55vX7bOkMeLgYm5gXa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J2v+X9mF/Apm/83+wz03/57nbfNQiHOnM4CA4v577qDr6Pxwz
	2xoNj2P66ZdVssy5mIVIS8TF05et1mRSvKyHXFw45hz5CYacM/wOd1PChWPATdnCYKY=
X-Gm-Gg: AYBFou2ro7cEjBihKQ3brk7opzjAEz1aB7jNLtMp0ht5HOnDtPbCgf4tzmXdFFg8yuY
	k2Pv0Kkz5ymssW0mq1tLnRzyKk9Bmxdg9oi9VT/3Kd24mkBF95TzqFkdiDOIuFc/SJoRt4JXmXG
	B9TtyK5R2n2ZyuvJDsxSZP0eDi8uwStcV9LyNHc1JaSfYfYT1mdUnEbiyzdeWmajUCGAl5PA0Vg
	T8la1ktdjy6bEZj/i0q7F5L9z36lZO2sa78gC800ngkhJWLkzAxAmXye2zo571yOxkdN1PLOxXe
	gCs83JcK3sNIHmndUCh/V3nXl8zBl/NJ2mU84RgFv12mG+rRlL0WfrYWHqB5M43H0Mpcyft/stX
	m4rv/9ItnZnVtyhNfrbB6DZS460BSjo8Vtphy75+3+1x5cDx4iJO1CeQQbIB4rmnHoDSXKgzG0k
	xK8zLcsoGDS837HiBH/LpcGmCKjXmj4sGA2GPqZPgF1318o1NXd0vFgXioefU3Z39YRc1qLhcwy
	HpgUxJbCu5FjbQl1PM2YUlUH6V4FXUICyKQgAd7UKwsZ1eteNCou4oTfi1aAXQB2CxmMk4ILxi4
	XDIAzJLqDwgnQ4AjcmPYwQnQUE95ieodt72jTai7IqgVJjF2aTMYPHkHU1mXxIps6mo9gKwJRSq
	8D8rgsDtQIMP+7hEx6nBPhw==
X-Received: by 2002:a17:907:1b0a:b0:c50:5e0a:fbad with SMTP id a640c23a62f3a-c5096430d02mr1128651066b.39.1794917837477;
        Tue, 17 Nov 2026 04:17:17 -0800 (PST)
Received: from nixos-macbook (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50c041600asm353859866b.10.2026.11.17.04.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:17:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:17:13 +0100
From: Jacob Procee <sn125164@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261117131713.2db5294d@nixos-macbook>
In-Reply-To: <3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
References: <20261112113005.16418-1-sn125164@gmail.com>
	<avw1kOqmrUii-msr@black.igk.intel.com>
	<3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-unknown-linux-gnu)
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

On Tue, 17 Nov 2026 13:03:03 +0100
Sven Peter <sven@kernel.org> wrote:

> I suspect we're just missing the proper suspend/resume work in the PHY
> itself to put it into a low power state. Or maybe we need to keep an
> additional power domain enabled so that the PHY doesn't lose all state
> and keeps working in a lower power mode.

Agreed, please drop this (and v2).

That second option is what happens with wakeup enabled: the dwc3 node
and the ATC PHY share the atc*_usb pmgr domain, and it's only switched
off in s2idle because xhci and the root hubs default to power/wakeup =
disabled. With wakeup enabled on xhci-hcd.*.auto and usb* (Asahi 7.3.3,
j314s), the domain stays on and a device left plugged in stays
connected through s2idle without re-enumerating (no "xHC error in
resume ... Reinit"). Asahi's pmgr marks these domains
GENPD_FLAG_ACTIVE_WAKEUP; mainline's doesn't yet.

Wake from a USB keyboard still doesn't work: nothing calls
enable_irq_wake() for the dwc3/xhci IRQ, and irq-apple-aic has neither
irq_set_wake nor IRQCHIP_SKIP_SET_WAKE.

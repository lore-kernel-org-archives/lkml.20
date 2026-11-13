Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794550216;
	b=GlCZBtTiHIWosDX9r4/Vq505iQEqFvCm6sWBjW5qUZ5rxaXU6H3BxPVysl8g5babTVWU
	 tcr6UpDiFQrY40ATAtNJJuNJwMiXO6Vivh12KMUpxhXgz7S9RXMQ7p6og+sdvEqe2eCDw
	 DQAJ9ShtvUV42DiveQuzPCltwVUwVcLhePdb1qwoq/3b0AADWvQo8j6eJM7/xyJIiA0dy
	 TCC8UHHSKL/X3IcJHvl+bMEcC0r2j78IYIWUAISdzAu0y9WKndVWlNrcdQyo9WO6RLh0f
	 77ZjyiEwvwSgK0ta1SRNF7I8J/szFcMz/hSm9TO1YTfhfg5m/duyVihnrOlmhoF52dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
	b=vblUBZsXUZmPL/KyinO/lamQ2mL5ouz+pAIwcnY0IxZyvsmrbjbrTTZing481gKuju2C
	 ipav41vsiShEHqc86TEhv8A7IwxUtBHRnuoChxdH1kMUX5H/IEHQDuf4fFskkvNj3HXqm
	 z8tgBJR4j3XkPdx6baV/xhYV0lbZIlDuu/XqtVsgSCE6FMsT/OPxEkYViMzbU8CxnM4k5
	 jJ0ejuFVmY38mSb7gRmgbvkoPd8FlaZRvIEXigfzeO/LIGnFGhcrVd9Q+QDJBNMUE2XTz
	 KDFeribE5oyhnDe7Ipb1ucpZFA6B4IgFj1MSL6pDO9u7sGkI626AwyYUMFw6UDLGY6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WA6G/ruV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01822606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01822606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA6G/ruV
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ab5e64742so674525eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550215; cv=none;
        d=google.com; s=arc-20260327;
        b=bNd/fUIe9aZTnFY+xLiLSLFpg7swxxZ/zclRjAR9IkcE7/qOrThj7XDy4lVcHBZ5EF
         s+DDuW+FiFXOnp/dPSvcH+l2S2438AOsJSDwBpn5UM1q7T+kNt9wel+6yuxb9hA4x3TY
         WUZd/+FoFHD7+Jfyrqp5evN7DusFg/QY0shSvJMIfa+yaOgSMyb3B8oRCFYqVQzwb6SI
         VUBpMlfy5UTgNOEyUS88TjDbvplcpEjEoJhmX6J1wocndEoTvh65O6OhX19/Es9sNfMd
         vAQFuLNKKk4ijG0RKQRILb5rP6mnJStd0pqaTip5+pEuU9Tz7+/4mUSRlrcw6wIfT+XD
         1gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
        fh=SlZiZm5/RLtGPicIg6zrUuPzivLNMm5YhX6CqaYyeUY=;
        b=MTDYXEf0Z52IR10GESUQQQh+nU0PTKZUWn8c1RhI79zOwPWl4vpIgXrYvuOwID+HkF
         HlBTMPQfqfHh4xaEUgYbvQLIDwaPN2IZq3jyS+vQ0muy40KDORjnBYovvEUYuFU1LaG2
         kzmL7LMeSaJhdulxBplSTsSj6YbPfroGcCiB3teLgnBWHfJHFYG9W+E5+fVNkToB/Bni
         uqGWM0q8XFXC9xzTwV3K8ob95Huu1QJTJlrecL+G3KTRgzpRgjctmwDWhGumNzhRWsPh
         qyRSziIvAktNrrgqWfjFkky+2a0R7XyUGgbRVepcS1dtnvqn93EdGx6PeDUM4qOmc9hI
         14Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794550215; x=1795155015; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
        b=WA6G/ruVj33Xcc8MAVixoMTzolifZQDlrHnLE0EvgGR+xSkc9Y8YbDgO0rKh1Fqh/a
         nQ26saUTpi3TU2Y+uu5kYKO6kqdni7y2mwPZQeCm68OzvoE3xZz4iJeHgyJMaUUnJtId
         mB6udLTCkyP9lpyoR+jXswiXRXEd9xptiTLbuIAKfrj0oFwcOoqbq2VsO6fNDnUOpid5
         jc8UAxFazsIf0JfbbGXGv+uvt67C3FoOZDsmnsPDBM8rUfaI+ju3pyweh39gzMt81fA5
         q01req8w+i/UdPTWOC9iqP/lhDcj+9Pn9ESfbzsb4tgq+m92A9qiv62eSd3TH1aj1+UC
         aOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550215; x=1795155015;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cQxNlYjkxquFu1pWFdcxgvYVr86+DzpHkUj/AQLnyU=;
        b=Rit7/2GwW2VYt+anS/bd+J+r8VOYb2806VaGGtD02pbkkR4FVKuGILdq9psmmwqoP0
         eN/J/21wV+qnMiQZg6NrLIeFQYl3J/hnnOj70vdldsr52hs+4IUorBJR3Ikbm93etODH
         l/NuJKIYkFUktXN4Il+ANEQ1S80btzj8yjs5xJ7LRXFOpcYjA4OVE8gQYCLJL51jLHkv
         2EaGKG+jd4Is8wUWVFEMrSDclyyZyiYOUn6x2kL94ja+5xRBHj5aCDpvmvhnQHLy/XIa
         4XaeqSqieZAUFWSNgSDSzbpp6vFX67LSOIdh/3nMmwdVbh/O+4ftItqnWSZoQREmJMzz
         e4TQ==
X-Forwarded-Encrypted: i=1; AL+hErEfrgqTVhRIJCMBOEhZbzNhMEfKSjFjgurZxg7omBy2KFPtRMi4yNz7eodVcl6WdpRcxoIPTvtNw64Jy90=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UVHs+OvEwovhfdZQ+ydbD5TlGw+0XBeLYpHFSuFbZyoB5yeQT
	lEZRDfgHLuCIT4k4mFYtCI2wTAT0OnY/yWG/a40NXqbO7/8w5NJ2VzjpWv4iDTPub+DNhn82Bgb
	OywYEBx9n/eH6CZ01S99dlbTvHkJrnBw=
X-Gm-Gg: AYBFou2JiWqtZ2zhioSHWgLLz9ohPnLgFj75HrOg0b5wb7BT5KeUn30soPi7RcaBcIR
	QeaBPD9f+T3c04UkvWRWGOReTFW27y8u6r9IgyrJfYgI9GhqcH/+6zcivgr4tV99TcIugNrZITK
	tK5J2VJGVIH1FSvNaCnX93UGaYHbBhpZjfGqn7anjqZATqROZVi4+u52hgoWSZnj2Jars4YghH1
	EXEW21G5MwYPdXwoQ0N4fI9RyhHn6+0BBjXNFlUs41t8EZugx/uwct1LLbhPwZ3b7QNkxUN3fY2
	K1oNX9Ocy1DDDKCwX4I/NmBzj2kcbIjypeEzxd+173kMjIiyXYtG6NOGOLRldGFSIrOq1bEBiuq
	zXEsa4mO/kQKV3n0WCerfZThNpnoxwEdMWxSCk6V2SHHp6HEl9fqgtamSxQAv6jTidhiq+exSol
	5HvI5pf54TBpnlRDrAR89cyvKxBLwpyN1QPqvVrGAVw8QMG8lzsEmH6213cdH08XvaoYHqk7Txe
	wvlag==
X-Received: by 2002:a05:6820:c0cf:20b0:6f6:1e3a:6fc with SMTP id
 006d021491bc7-71ab51a2d59mr713841eaf.79.1794550214796; Thu, 12 Nov 2026
 22:10:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-exp-phy-rs-maybelocked-v1-2-3023cc9055e9@gmail.com> <179454612500.2199510.688554972467066283@kernel.org>
In-Reply-To: <179454612500.2199510.688554972467066283@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Fri, 13 Nov 2026 15:10:03 +0900
X-Gm-Features: AclHuK8K7LUv1bQRf5-U0TPkDoWKhawhWDsTrvclohqGU442XIPQ2sC58L1Zn6c
Message-ID: <CAGAB665d+tpGT34GPD6TAjc_Pn225afYw2ebLb12ZFnUXZoW6Q@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] rust: net: phy: pass a MaybeLocked device to
 soft_reset and match_phy_device
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 2:02 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: High]
> Is this conversion complete? read_mmd_callback() and write_mmd_callback()
> in rust/kernel/net/phy.rs still say "This callback is called only in
> contexts where we hold phy_device->lock", and they still build a Locked
> device:

No. This series does not touch read_mmd_callback() and
write_mmd_callback(); their SAFETY claim predates it and is wrong in the
same way, since they run under the MDIO bus lock instead.

> No in-tree Rust PHY driver implements read_mmd or write_mmd today, so
> nothing triggers this yet.

Since nothing uses them and the abstraction cannot express the MDIO bus
lock yet, I would drop them from the Driver trait in v2.

> [Severity: High]
> Can safe code in a Rust match_phy_device dereference a NULL phydev->drv
> here? Device::read_paged() is now a &self method for every context, so a
> match_phy_device implementation can call it on &Device<MaybeLocked>:

> So for an unbound PHY, this would oops with the MDIO bus mdio_lock held.
> Every other PHY on that bus would then hang.
>
> This wasn't reachable before the series: read_paged() took &mut self, and
> match_phy_device only got &Device. The previous patch, "rust: net: phy:
> make Device generic over a lock context", made read_paged() a &self method
> for all contexts, and this patch makes MaybeLocked the match_phy_device
> context.

> Should read_paged() be limited to contexts where phydev->drv is known to
> be set, or should match_phy_device get a narrower context?

Neither. match_phy_device should not get the register accessors at all,
as before this series. The patch 1 findings about genphy_soft_reset() and
register writes from match_phy_device have the same root cause. Patch 1 makes
the register accessors &self, which hands them to match_phy_device even though
it can run on an unbound device or one bound to another driver. That was not
possible before, since they took &mut self.

For v2 I plan to keep &mut self on the moved methods, so match_phy_device
stays as it is, and give only soft_reset a &mut Device<MaybeLocked>.


match_phy_device is more about binding than locking. I think it belongs
with moving phy::Device onto device::DeviceContext, as pci::Device does,
rather than in this series.


Fujita, does that split make sense? And is this worth doing now, given
that no in-tree driver is affected, or would you rather wait for a real
user?

pw-bot: cr

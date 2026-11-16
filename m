Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836895;
	b=qEPMOpLgxPypp/MDD6cx5DAK/cd29HdnOW4WdxgOH0aUuaMw8y4ja8YNA63q+BzZW69K
	 j3l6YS3jYOK/mJgbEBEaPvBA7VnnU7jfLt3zFaYcjXzHulM1JJmmiJjVGZpROATRhyfPY
	 +/XnoptyosNcmFNrocZUmFKKuJaOvc5pOXjMRMxQ2rp5mD5QVhGStflwLcMKu8r3GYGXW
	 ziTehdFouHpJBkcJtImymn1Oa/wXN3AI9/6DFKz9d46cCk7IWXui3x+Vh7+H+INiZA0pO
	 w3JsyjWfd7il/LYTZlZZ8kLS/9yDD0gFpMbXYtUVk2UhCbxB1585vyVBAQ7hws8/9Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
	b=X+BGJigQ8mwsjDg+mHudWvR6ZWONdrW9DoJPVwU8dz+saV9g/SNanrs7YEWRf/ou5Xzq
	 aesIxuJhy1wlkEqDWaA23v4S/bzWKOJ0iibnLTg5FDtZdtOuOJo4RJRaqNhPDCLJUiwyf
	 TCtkTg6gfdnURLvSYcsvvsYNDMa87Vjt8wkcszXGc6MeqTM8nINRSilKFoe7/pzqKe3BH
	 ISEh8mFBhO1szUE1KFR52QXvmgRQUpNMoqDjG3Ov1bryzGf3NZXMXLi2rTr5zVxsZbUEB
	 nszjA686b4qmpBPU9aW6dh1iAMBN5cv/n7hMB0CSYdFXO0d/Lw8do179BM4Zh1w9W0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDjM7ouN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678EF606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678EF606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDjM7ouN
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716c0217635so4563985eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794836894; cv=none;
        d=google.com; s=arc-20260327;
        b=SO+uzmjBY68XnWNE1/wtPIS3jzufjl3QVYFUA6iXI2UFgfhcV/qCega7WOrnCCurEo
         1WDJioqbZuHcV9PFHdljpuyCd/RJ5fK4/491M0uXLx+lKVUUVIXE/HqgdqRL08AO2AfK
         tQpeHp/iZgC3YiwwNweEt6GDWrwNg3u4Zm+UzQ+V15UkW7/5ee0tdfFjUNXD+dsBXl5p
         XDeukWdoRsgT8ve2gSByT7m3VRfyKmmVS+lnuTDJI7y0zh+zKtQun8Xlt19tGDxq/uBd
         XmmUBlRG51e+IwXFSAu0swkcGOeThhfr1Ie935Vvim/M4Wa0TKsHP9JcGZGLTf9i5J72
         68IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        fh=mdeHfYh/0kj8RCrZBwuxdsuquP5nx6TgAJPy0wUBh6w=;
        b=i3Sri59irtRB6P4miaq25oGSUpbgnInARo5m5sJ5/bMutZ91FVhw8SUqMra4WrvUPf
         UKZz7wa8Mq0uD1kBkmWUIeMBIhSJyzsrL4wo5qEYfPBhn6z+hlyLjKL8Y+4XboZTVcaR
         cjuNKFnAR6ca7eulBUVZaOO4boByws2+568pgGK/zAiFhJ/aAphjqmoNgSDTyJDB+Mjf
         c23CMa4driXXK6oy1NBTShF6LSwnmX4Zy+0mTujXZ7hfKIenS3O6AXF7Ad81jy/bFPwz
         sxBCIevhGkH8dRbrpE8sjz8CtleVgfxus6Dcm9DH5Jyh4O5v+EKyveKuA0ctkOCcWJdZ
         fGXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836894; x=1795441694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        b=LDjM7ouNloY/7f4uugMx8sCMqrD6kfbljijeB4PG+tnLFVO+oAN/fiqW9jdms0z3pS
         /zmH8zyb4dNbBmmMtJfIR7BSJN86jOe5aP+nZvjRwF8TdpO5bCQMQSWyawa0rYSy0JYe
         ADdTvKPDNphWiPS9zI4SG9TcYJln7akD9XYGepcjJDAUM65KvyB0z1smGYXH9XQ2Lyec
         Do4sgLYXnWA+LwoZfmcn+E/qKJigSWynCPT8kcCdMftw7Q3BId5OdeSDzv3AwEzwAq2C
         s2hmxV2O5lOCQInQOCTkaPuLjS+ezhoWJKBtCMM5hD3IGE5/VbIM/0bFYFZh1ijUq1Mi
         mkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836894; x=1795441694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        b=F+t0+3uxuCQ/4RNBj2Zm/crDAdXkV1Z2RYqJl1QT7m0P0VFC0sYLWK5geNtK03bdEp
         7zGK9kWJEXqq8qSrHly1p29xKuEyB4g2F2yVRxsO+nuy62XZYpygvUepcCWYazgcHsxt
         fqiYJcZyqicjHGzBP1ItUoG+zIb3oU2235ho66tQJFdzWiDZIv93JxmphTw+wHELR2P3
         S1c6/V6xvhZqz4Z+LQOVEzTQj/pIKhOfu4zwoXyJspXqiLW735G8ocGu5x0r6ftlF8jb
         Z6fGyqreQSz03PcUxHHb51OPYkTWu0akHkMH8JE3efDq5qRLU55C0f4t4yfNiJXsSWQ+
         3JOw==
X-Forwarded-Encrypted: i=1; AL+hErGZhO0iWKSBTKKxtKfrosUCNuakfeJd2F2OSBD1lQCf4LMpYrcm1ucVqrKa0Azwh5xN6F+AHyNSV4Yxhis=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mDmkN0yCpJg0ixK8Bp+8mC4KZK4lIM0ebl4M0lw5alAcQJtNP
	GFqMbZxwJha2DpdU9zTdQRTtpCXTU1lXAa4TsD8EGpeTGuFq99aPzgunlya6MG5BTIhewWuWXaK
	mKse87QfGqsFnIhbaLuzhaBdMNaiKixc=
X-Gm-Gg: AYBFou3N4oyk+2mrh314O4rdT4XS5rgL/NikH6GbmJDiwU3gXdF1v+PIYnRLJ4aGwTT
	4jiCaDgRITkfknIS9KRGeds9NCGh/BGP8kLaTe0uZKLSd+xlHPGC/Jg1T5Aa5dtuQoQl0iJLHXc
	gxgdVGDku+vZghKIqb/4XaCxANWrFqzqc7toLM9UYBhFbpoUc1ssLWkdpdujCkAg0Yi1UePtjwg
	6N9hN4GosXyQI5LAxeeBORychf70TJyTlt/Tf+djkVD+ShmO6vcluiDGjwdaBkvaxq6ua3Olvef
	rHFpxv0m81cxjOglInTbcJQBvqwxuk6b3SK6kXh4fqAfBeEt91zq1SaaG0lP5AgyWtzGSyRu6Zn
	wUFSWC0Hklf4G8jgyEw7zDH76+gZegKn1AmvXc2Wao0BAeEnZSWgSPmR25FK3XknOATnoc58F47
	krImkFmza4NS4J2C+bVJvryn4lfdQwwqEmdScHH95xWRP8FefOXp5D2W6t
X-Received: by 2002:a05:6820:2485:b0:719:d9b:d750 with SMTP id
 006d021491bc7-71ab5228714mr4375156eaf.38.1794836894278; Mon, 16 Nov 2026
 05:48:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com> <179481441455.3136.11985756118593625944@kernel.org>
In-Reply-To: <179481441455.3136.11985756118593625944@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 16 Nov 2026 22:48:01 +0900
X-Gm-Features: Aa3M54qDodNhNTwL1i0nBiBJxcrabpOvbxYPWu_JZsDXPNfRjaemdjKWEiiohJ8
Message-ID: <CAGAB667OsSkw_iKDqVwjJjWvwWoz5fSY7Cy3DUU1nFnWnrhaHg@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v2 3/3] rust: net: phy: pass a MaybeLocked
 device to soft_reset
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

On Mon, Nov 16, 2026 at 4:33 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: Medium]
> Is it sound to call genphy_soft_reset() on a Device<MaybeLocked> when the
> caller is phy_mii_ioctl()?
[...]
> The race itself is older than this series. C drivers that use
> genphy_soft_reset() have it too, and phy_mii_ioctl() is documented as
> incompatible with the PHYCONTROL layer. However, this patch is the first
> to call genphy_soft_reset() on a MaybeLocked device based on the new
> soundness claims.

As you say, the race is older than this series, and I think the fix
belongs in phy_mii_ioctl() rather than here.

> Would it make sense to take genphy_soft_reset() out of the generic impl?
> Alternatively, the MaybeLocked/Locked docs could describe the exclusion
> that the unlocked callers rely on, and note that the phy_mii_ioctl() path
> breaks it.

I would rather keep genphy_soft_reset() there, since C drivers call it on
the same path. v3 will document that the unlocked callers rely on the
state machine not running, and that phy_mii_ioctl() does not.

> [Severity: Low]
> This fixes the lock-held SAFETY comment in soft_reset_callback().
[...]
> Is that still accurate for either of them?

No. As in my reply to patch 2, v3 drops match_phy_device, and the
get_features comment will rely on the same assumption as probe.

Best regards,
SeungJong

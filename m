Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2563DCD8D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887170; cv=pass; b=tCiM/myoWNNExnjg1q6VB7MrnJwUxZHrCSjIWvXSROz6oe1fRXvwOmK+NLRxchUGwsd67WjlHEzvU4zjG9fqKP0ujrRuBuJykNFSg9JFTPo47i8+JGnaX1/x0JSUdsn7+93TWCz7aDljnJr/YLfJTAm6hLGZQ8dlz2XnX4KNpnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887170; c=relaxed/simple;
	bh=30/nByOcJLdjUUYb6QfrK3u4hDpBRdXaw3vsv0P1mN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqn8wWcH+j9uIbFeTxHiS/WdZCFHw9oJYdrOIz5COrhb+7vL2d2jw2n2n2U9pfebh4qN3pM2zfCZO7i+wf8kTq3k/wU5Hn5kLa2Ki+qqygZJqDpDHwFNcxsVTrg62ZzqvGAKutZTdtkb2dnNISYfOfCyIFudbkc4o/d9ulKRGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlvUzVj3; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlvUzVj3"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso19922941fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887167; cv=none;
        d=google.com; s=arc-20260327;
        b=KwpeAytPe4WEyDxQKzKTEIauk0S58tqXmjIftVQ3qUG87N0QZLbK0cfNZgmNH5fYJi
         Q6B4IDsTCk1GUJ3Xa3egUcrytyKJwp7f7aGXYrjAJBWCiz+e4MrlQijRvjab1yXBD14U
         SYNrPO88ojCFJ/KPLJcZaUWC5jjHLap/8F+FWbBhAcpS+Tk/O/1NKvrkcr8hHCx+mf4S
         x11tZQBGoa9RgcnajXZk4iTuF9GjXNC8GwbhfjgnwojV/uKNYXkU+1w3pgBG1Dhdc/sY
         +NAnXTauq0gWVge7cOAGmfvltSjiz1BtYBHMvzrgxuwmbteZWvmuDIuwXXKZZ4hD4erM
         6b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2iGlLnN9AnwU82QnbvfehXlTLjFdwbOP6w5F5kIy7w=;
        fh=q0Tmrd5+0uIyVQES/9u38+oz4ojqlj28Ps0RQFpGib0=;
        b=ZrC8NY+18zyXfKOtzTgZF7w3yUtJCvlJGcGeAPc70HJXSECM2qFKga1SOTtB/cfsf+
         IO2Sf5nkTcwI8n5nE7KrzYQllxe8jyfLLSLl79hgkzN4oxFM0DXU18AC5cfsE6rGkBOX
         WNNupCqEAkVtiNmPrjO6ZTBXtgVRnhk2LJCHjPICqOUkFdKinr3bNkWIPY0uxoIZJMeT
         rKS3nbgPFPM4882L9hL67HmwiTGPEySgSTH126vsqg8MbdgqeEXZt5J5FoeVySQizlkY
         DkftlXxdlIaUwagtFYin579Qk9+sEOkIiJVK2yhZ1V44jtu7C/igfkUFAbJi+PuAjNqF
         ccWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887167; x=1792491967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2iGlLnN9AnwU82QnbvfehXlTLjFdwbOP6w5F5kIy7w=;
        b=FlvUzVj3Hmts5PuHrpcKAJF9XR5pb0xq02Y804/4zuNTa65wn9HSIbWFmeVewetFdx
         JTqgqgiWGCweUr/fZCAinXjH4ZB/I9mtVem5TjUg2ihxvLDxAjZStYu7v6rQdsd0rJT0
         nYfrQRQne8y/u+OzJjLRTHAyfsfb2WQxuKoDOKQD6oklP23jsEz4jHzS5ood7tUlmviB
         nkgCEWtvpTMcE3Nqxlh6nz3no3u+tungwiX2xfP4uUUzi8vGbnNmoMVoBMDuHanIXFYb
         fAM5i9azUb1PVo1DNwih2DjHNYdwwL34LhjDOyJmedlg3U1DyWll6zw7FupdCChojSe1
         M0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887167; x=1792491967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2iGlLnN9AnwU82QnbvfehXlTLjFdwbOP6w5F5kIy7w=;
        b=hKG8CP69VsTwVXRtnRmgnNA/CdKXAhatJ1Ql0EWbbxGLR7ucBF+IG5tRbiJgB8yoHJ
         oQalV8L8PISa0TNtS9uGG5iOHa30AAxVYKGiixWc7PzuIb4TljUvV3BsBMUJKKe6GUDt
         cRZptLDKSSgqPcyxZN3ieMf5ZkE9ghE4jYZwZTx0ddot2D+0m/9LbdOrXTZwXzVybPbs
         iVasyyvStHCihSkwC9bkB5ulIxpLIhrIcJTJlgFOmLEuvo2zNAtWrIIf6t5mMqdq4jAh
         dTVz6lVFICFiOVy77rmCzVwv+q+l8uWWySyIGuhStMh0pEM0sEjdpaHWQ3qePdUMYMSb
         2luQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqDe+hFnMXuYYpe0nXRcJFIkIID37iVxB+av/pxCcruCLXAuevvNSBsh32uHSyiM3oxajRZVmeoFaJcgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvC6oG2V8Bd/8DUkPBJB5+38PNQTI93bgHZsWEjIAWWWaLKQEA
	7dWdpGzLz1KRe0DxIZaWCIzK6Mq8kyxZzB44jOpULXFfE7RT4poevSC27vMa2IBeVHhbM0munOy
	EC369JxZHer2OjwvyBfmWhKyiarsNy/c=
X-Gm-Gg: AYBFou2cUGCxTQmnVZCcQM3LkkGM0tniWCzwrW8pTJXBZx6VY9Ksb+lbxDyRXbrl0oR
	mxmToWxtcRBKcrIBXfka2p89nj97P23UVPnyC+455QuKmDD/nrG9fF4iy4U6emeg8X0WQRgqHAG
	9GeyKruM3R2GGia8ti0nlfjQtcHsbbGvi1hZRGgTUWeYmarTV5JsK+yO/0rNprE/jYYPxdAyDSy
	aS1ORiyHmPIHU2i6cYZv7TUN/k/R9s91shm9giIs6dZOGh9/D0cpZmhwMPttnnDM5J+GDIEEP+T
	uqrcongmyPZPIgVv4rE3zNVljLfnejrFbFPY3I7DEFx+bxXGIIJNZdPkz/5Px2bHwsVQli8b3Nm
	AqBS/e3UbMFdP8Lq7cdj+oQ==
X-Received: by 2002:a2e:bc23:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3a9c5384f54mr25409041fa.16.1791887167208; Tue, 13 Oct 2026
 03:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
In-Reply-To: <179185709988.434549.15422498299449004512@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 13 Oct 2026 19:25:56 +0900
X-Gm-Features: AclHuK9xbgdrkpalW9mtMclsWr4HeA1zLw1yC-dAP0vRwaQkMlm23OayOZqQ2Hw
Message-ID: <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] The commit message misdescribes the precedent it copies.

Looks like a nit, will adjust it if need new revision.

> - [Low] The patch adds an 8-byte 'struct net_device *mc_dev' to every
>   struct netdev_hw_addr_list (include/linux/netdevice.h:253), but only=E2=
=80=A6

It seems to me this issue by itself doesn't deserve a revision. Will
fix it if new revision is required.

> - [Low] __hw_addr_changed() (net/core/dev_addr_lists.c:22-26) reads the
>   device netns with plain dev_net(list->mc_dev).

This was raised on earlier versions. Every dev->mc writer already
reads dev_net() under only the address lock, so this adds no new race.

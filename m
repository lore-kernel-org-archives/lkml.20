Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CE3793D5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023412; cv=pass; b=hZ+R/1VqiUyvglLk4oIUggxdqaEeI8RUG4p7pD/pVsswyxoGdX73z7CFP9mLopn0lva43vD/R8M1EGhbOAzEHJbj13G4fLfNY9vgiV0YI44AycJRZIlRQrjO1lcAgY+P6UIjxcKVTalFDCY1NJ7UIAfeZs7aPX7fyopJuKisHxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023412; c=relaxed/simple;
	bh=2AqOeRbrkTEeKxz/VGkXBEycMszwg20ujuSANUVGQhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTUPLemtXMaOz8zmlB2I4b8h79I5H7tNq4GK4Mx4PzuJvZ0Gk5/wC+CxOydYX/bGvZw7vSmvsQ1Dn9dpNJkPo1cxYLqbsx5i5qSnd65xS8lKB7vFq16qY+d+gPolwNlxsycmqsOKoSBfFq8o6dFVIjWaDIMlLf/SJ4tZj1q+qNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoDPnoOR; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoDPnoOR"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so206387e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790023407; cv=none;
        d=google.com; s=arc-20260327;
        b=IWUpJR6jWeZ278951GJAcvRJ6X26WvuWW7/nwgGfvhA64qN5rMBkQ3RhSfIc8gVDS0
         eR26R8DPKbEzCZQ8nurU6iAIKPX7+kwhR9vlwkX5eMBnuGH9/MSs8pbDsaiSRvRZs6zU
         y2x0p8MBKBa4wDz2/wQgMeqcwpm03cD7gkBo089NbavE85y0Q36taKJCzTVxPJyfvkbm
         I9VtinFot2RQxMG4b8nc6hdyXHkFtRikE2EdDJtsxY/9KXLDe7i2YQRblkfEaXv5KKbw
         W3SYLY40NsdVLTZDDhlieI0jamqvj6XDtqm3Gx/pTRsaKjYtzwmVbCeBORDLtE0oWfKX
         /MAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AqOeRbrkTEeKxz/VGkXBEycMszwg20ujuSANUVGQhE=;
        fh=fmXcaEOMwxgXvNs3rW4T1v48/+6pmK9oKycBs+v88GQ=;
        b=EU+fAPpSRTxciMwRaxRG98vLZZpK6GI0+AMakTACW+Hs1A3WGm/WOahyQpS8Ijxxed
         f5SQFazwjcwReEx1hZd/x2LHg1YZLjHIRCfO9L+GUcqew5KdJQrqhEM0MRvf3tI4tKRb
         wjh1sIPikGG6jf0Dj/b3cZEadslXq5rceklE6Q4VuKoIeVSG7Dn7lgQh1T3UjlYZ4zUg
         KK+MXAuOi8J007RL3BkvXFxQkTWeVMkrSHc33gqCG0RC1FBcZgSAqNGL6FD4DS/9K5TZ
         gFNn0NhSFZNUGTZdvRd7QXmayaezUbnB3VN8aT3SzYJ9MgNri/Tpc2wuC8nWS6RCngnA
         bCow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023407; x=1790628207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AqOeRbrkTEeKxz/VGkXBEycMszwg20ujuSANUVGQhE=;
        b=GoDPnoORyycuUdelfqd5OUIt9Se3EY0kad14vH+3MD9E/20H7L/wdsYHd24C8ClAvV
         dM7NFhJkr1BeTJiuJnk++grbqDbfeZR9Aw46iFe134DoVtaTCnmU5PIxjJrGXeG2B3zu
         9u5im+PChGZdYlopb8xds10brRi/yTw/Im7jiQtfHYkAy7G6EnyzZvYCJA4D756Xbuzs
         kIyGDMd1FkXNyyOpVOy+s2fMqs37g83RUm0I8KJaOCPeX3x2mTWQzG4hCPPCiwwb7zsF
         gHwUJF1Kd4AkTFiIRucvciLmq0NHn4oUWNethsE1VOdnQGbYigQlfiLQyX6wMEidP6jW
         fDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023407; x=1790628207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AqOeRbrkTEeKxz/VGkXBEycMszwg20ujuSANUVGQhE=;
        b=fjDi+oRkWtHgPWzGnDv9SOBx8VRskBKk3PPpj6UBO5RWPqf6RMVPK93DSciZdGqY4L
         69RA5V6V+Wijl1eH1+Vs6KV6DYpsK17ha9hTvXeQO4szOHc+6Ev15fI3CeNN0h4ZWeE9
         mYYogZ2YIeHZAsmpOahiD6jidUpxmxrlhQ2evmTFn/A4Pwu/mJ0UdNYdn5sw57EYFC1W
         KZ3kTt6vNlYrG47pie9+/hA7cHaWsuY09CS/iHIWour0GCW0Ilm64ZZMadH2Diq1YICL
         dwBsoSzlqcQ871yQ7NxK9HKsHNryaHRG974Nhszhnu9PLJVqmJp3OZzZqeke8LSUerRO
         KowQ==
X-Forwarded-Encrypted: i=1; AKwUvByXgpimIXEI8LTkFHB4NDzMj54Cz0wWIfg9nlXiUyKPG9bqaPBsqVQQhKYk0K+UZHIsXty2KOF8XzwdbHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lkWedb+ixfj14d0FPcgnVAVZj+unjvd9YbX412kBX1Z3im+ldR
	Bcosh0qHhAe+Mo/0DX3zKXwfQcLB0mTZClDXk9Z5nbdhnmB8A8yEfk5UKdQMr4iXnKAnAaglu/w
	oQW2LZGn6XzjF+VzVPiDSuL2hTyHxj7Y=
X-Gm-Gg: AYBFou2aMixxr69/FZzYOHgO0Ph/HNdF8+W7kDYSIOcFRf0dtV0hM77pSAzEBEDsebt
	cwPKCIkE1vDb8GhepvgmAwdM6PQMxKfkZ7b9pIoCPsA4SPI7yjjG1jgrGopYSD84SEEsffbJvWg
	yMHI9zn+5JvmWx+950tlchS2wFla+L2yYhWNvRDqaYiYfl3mIZN8tCOenKHxZOBuzokUfgWv56Q
	CTM7A/jk8EB3yv08qleW/ZQjHJE0sryiOzjBpHI8umvFpuKnKJYOWumXojg66jmLm6W3vGhVgOO
	YZ/G+Gtpdr0n+aOCqEh9WmY1BMkxAu+B58Hqhc6QJ4Z/WMKc3UOfE7xXUziBNSXgS3mXHv3KYQQ
	pJUWdnQHczApHtm4MwJcX1R6KAgfo/zHF0X3KqhVHND+b
X-Received: by 2002:a05:6512:3c90:b0:5b8:b392:b401 with SMTP id
 2adb3069b0e04-5b8d28f8740mr203875e87.16.1790023406454; Mon, 21 Sep 2026
 13:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-fix-macsec-net-v2-1-784203ec4836@gmail.com> <arD488xDvFFwtTTN@krikkit>
In-Reply-To: <arD488xDvFFwtTTN@krikkit>
From: Haseeb Malik <haseebulhaq55@gmail.com>
Date: Mon, 21 Sep 2026 16:43:15 -0400
X-Gm-Features: AcwNN1UVt7aUbP_RA8XzUc4ImBuixAqqs5Pgi8wN_QARDaMYSFlj-pf3Ytt-ASc
Message-ID: <CAB4N2KN-0EpTcU4eWD3hdFN=cM0S6T9UVjmy1URQPjJck8riVg@mail.gmail.com>
Subject: Re: [PATCH net v2] macsec: initialize SecY before registering the netdevice
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Haseeb Malik via B4 Relay <devnull+haseebulhaq55.gmail.com@kernel.org>, 
	felix.walter@cloudandheat.com, edumazet@google.com, 
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, hangbin.liu@linux.dev, 
	kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, horms@kernel.org, 
	davem@davemloft.net, syzkaller-bugs@googlegroups.com, 
	syzbot+f2f6312ad1b5a0bfe316@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, you're right. I picked the commit that introduced the warning,
but the initialization order goes back to the original MACsec driver.

Corrected the Fixes tag to c09440f7dcb3 in v3:
https://lore.kernel.org/netdev/20260921-fix-macsec-net-v3-1-accf94f93f5e@gm=
ail.com/

Thanks,
Haseeb

On Mon, Sep 21, 2026 at 5:29=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> 2026-09-18, 15:01:29 -0400, Haseeb Malik via B4 Relay wrote:
> > From: Haseeb Malik <haseebulhaq55@gmail.com>
> >
> > Creating a MACsec device with MAC offload over an LRO-capable lower
> > device triggers a warning in rtmsg_ifinfo_build_skb() when IPv4
> > forwarding is enabled by default.
> >
> > register_netdevice() invokes inetdev_init(), which disables LRO and emi=
ts
> > a NETDEV_FEAT_CHANGE notification. This reaches macsec_fill_info() befo=
re
> > macsec_add_dev() initializes the SecY. key_len is still zero, so
> > macsec_fill_info() returns -EMSGSIZE and trips the WARN_ON in
> > rtmsg_ifinfo_build_skb(), even though the skb has enough space.
> >
> > Initialize the SecY and apply the new-link attributes before registrati=
on.
> > Move MAC address inheritance into macsec_newlink() so the SCI can also =
be
> > initialized before registration-time notifications report it. Move the
> > per-CPU statistics and metadata destination allocation into ndo_init(),
> > and release partial allocations on failure.
> >
> > Fixes: ccfdec908922 ("macsec: Add support for GCM-AES-256 cipher suite"=
)
>
> Why this commit? The "register, then init SCI etc" order of operations
> has existed since day 1. Without ccfdec908922 we don't hit the WARN_ON
> in rtmsg_ifinfo_build_skb, but the bit fixed by "Registration can
> notify listeners before returning." would still be bogus.
>
> The patch itself looks ok. Thanks for picking this up, things got
> crazy and I forgot about it.
>
> --
> Sabrina

Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32679339853
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760141; cv=pass; b=A6Vkh9veSX9ZRvfRdp4TUMsF8Xbhpp/rv/glB8j5pIUWyWt3zJAoWyik3HoFNfVi7aEFtttavPM4q/7TEs/FuryycDLX40BRVLCFokWfxE4NqruXaUI7z50nv02ig6Bu+6wpXPJn0Mt7qTIxefU5ilaGbia6S/sIAaQ5Bx8iR5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760141; c=relaxed/simple;
	bh=HzvNuidgeL3juabceaGKuJfW0x/vamvj7Q7WND4DCxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXvL4QgSEjCnWNySUVxkl6LKN5A8HLsMofWhUC3ezWPpsvjt03q9DR9YUB52qv/bclR2Df9TVFoTNrYSw8EefYEpN0uzwLVlEOM3+UL49ZySK47IqgyA5Kny0E5kyDYs/TQ0dSdve5ytxa58rLMbdf+vjFeJXeH7J0SkX+wgGoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tvmof/NP; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tvmof/NP"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so1289698e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789760138; cv=none;
        d=google.com; s=arc-20260327;
        b=kASw8prdFbB+hsG42K7pyCmCxGWJwW29ThNQXQcoQCl5FDdvxNu0Q4zqWcSOJeMMjW
         w1oE6QO4PKSrQn4NsidicUtW/dHIisd+vybCs+DAqvGq9NjNcJyIwOOzYNR0tFipFm0+
         z/rc/pwSyKxFXR8OdjGs18+6xHCI44B0yBEFSogsYBZnrY7dX30K9VwI1CY94KyTHlXb
         rHmLoaGxMlSzVHCSk/PWxPrvbAHi/N7DyWycD0l1tUt43452MSIw+7z32o6Y70N9N6io
         AVPBUIL79x45noKMHuYRVGXqAC6JKVf+seA7HRdx3wrRxp8AtX3ZIFuTsPZOaIT2P24s
         0HOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2nxFd75vNkOQ0e5yGedl+RZU+0EEEGzGt/S9Rcg/pPc=;
        fh=jKqgPei8jyjek7iTXvP1ApPZWpVI3UjNe/6Wzpr2wBI=;
        b=TFlUOsqOLIojcNLby+R4uK/pCSf1/zY/+acEwUohqGJeMT3AFjIiZK9h0CO7MqjSbN
         3lK2TQ0styg4a7Va3oCQLgQRHqWIoNTDskrNsHsYZ5QhVjLsNf0SrfGHNXx1ZxNDI3II
         yRfc1SLqdDZn8PHtgxelaktrqF5ljWVWtmLMsAxgzWIVe7g21dm97RhNFLO/hh7Nm8bX
         qVcGlq+ZVPrGpO0+1pCtZH+HWxx3txy0Noo5tdmVSxAyptQaMT1kTykSDYJGSwu3tpno
         +HmdF2vjbNnNLndcdoaUQIgXsn8739AP3+tRoBgwwbv5iqKylD5lOwipGVLHDriihgJV
         XCQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789760138; x=1790364938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2nxFd75vNkOQ0e5yGedl+RZU+0EEEGzGt/S9Rcg/pPc=;
        b=Tvmof/NPM7ege0mtijP7zeeP8y6IVGoFRHpLtot42xLIcVn2xDEpBAqVRO6dT1MT2k
         ae2hEJWJb+Msg4YVLLRLNFb/nf7FOKyHXjccuqppLJz26RWmTebRTYiYYeskssHRQ74x
         XePvq+owocNPOX738LUVlSg7a/hBUWZ7kMnvAMOdLDsSYJpWSWTuCdzTzUK4MxihvrKg
         yMBeLwRKQGcHr/JFqluvGwKw7s8Ep1DZMRu8SC3oi4W5H8aokf8kNQHd/8LhcWa7ZXzD
         s5USyYBxF4pnV72GukZUeHGNTyXUcO+HCvfszYqFzghIXFa5YQGrrm6BuVVNY4TKV/vl
         IEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789760138; x=1790364938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nxFd75vNkOQ0e5yGedl+RZU+0EEEGzGt/S9Rcg/pPc=;
        b=GysvxxYzRVbq8XRgDJRoGVSvRfdc0M7Gs1D37l07lr6oPOuqQOfijvl/ed/v2mFYfV
         QRqaGLubiY1XdrbeGDjd/oGMQ1/xN3FDrwJR4gjZkM7Pu0rMZspYs6LEQ1EYL47H4qCT
         KXqmxY85f/y96cHy8S5XfXjclqC1AaTVtuh3Bbtf3NNUBBpIeZDqN8Uq53T6zpmKqa1z
         FJIy7xWI8O7YQaISPKOhmctHqEMRT9fQbe5JRV5EzGnjr8GD106FgEbnSi9Jt5uIZXDq
         Z5dq5a7jIb5yJcHw4V8XdcBHJR+cQMpGHj6FQO7hnP468ze/79YJz3KN+IbNV1hcZYMn
         VfVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfRfJnYdhq2yZAiwOjfc5koAoLMtSLPIj6kUKdEOXFmhpNl2IFdX9yndeW1ZBkzF4JhFoiNunC/NTt4z8=@vger.kernel.org
X-Gm-Message-State: AFuF++kAeY9Ssnbt05J/o5OP8/h7Qn7kpwpFhdvWKy691DkGZl/rN1yK
	ssmqYjfs7T8mOusHx0CDJMCUloJF6YOoA2fo6OxaDxgbSVaKWT1RVEj4w7r1RXntkNuGewu5Nic
	Dt0tZS8F1+jTO80cmzyP5z3j3+R2ZJIQ=
X-Gm-Gg: AYBFou2gQoscO0Gcw14tvgtbDWR4hwoAng23SJ+YBwUMaFf5VkcM/Wwmem06bWLCkLD
	2r+xqs158gSRnrGFYjOCjcnGn0eyNns4upp6LOB2xT9U0UOxZy97TWf8MZYASO9j8DsgYX+V/yt
	TK/GyQ/5qBgOlMIN2bPUXOZz+YBqz30xjGUmp3g+rbJAlaKB/2po+Q58zgPXeofjuxGsu4d5Af0
	5lPhiZl/vWg9iy20LVVY9hkrGbP1hLy/AkZchPiwDLKvTB6hbrirw3nSgoSu7jreFxCBhZgpxSY
	mGbBWsxFqIYVQKSLzZbpyjyR0DFUyHsdxRj/WVdvqAiAUe6BYaucVbWigpa8V4L2qn+FYeyGpMU
	fHVtEFWUaR7LENVbEAaFzbzJviEfGwrittdrAVALYgnJYxj0=
X-Received: by 2002:a05:6512:a344:b0:5b8:c21e:28e8 with SMTP id
 2adb3069b0e04-5b8c21e2a24mr835758e87.19.1789760137898; Fri, 18 Sep 2026
 12:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-fix-macsec-net-v1-1-c82aa58ae741@gmail.com>
 <178951752525.22033.8547704610100726932@kernel.org> <20260917180909.566fb795@kernel.org>
In-Reply-To: <20260917180909.566fb795@kernel.org>
From: Haseeb Malik <haseebulhaq55@gmail.com>
Date: Fri, 18 Sep 2026 15:35:26 -0400
X-Gm-Features: AcwNN1WpSFcsIQWeLcBWVspSvI8wcqej2JfgX23uUmxVKrtS9ZZ_74s9WB4btHQ
Message-ID: <CAB4N2KPz-ARRDUdkos_S64Cyvm5cBfq-5NxP5wwL835wf+tO-Q@mail.gmail.com>
Subject: Re: [PATCH net] macsec: initialize SecY before registering the netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, sd@queasysnail.net, andrew+netdev@lunn.ch, 
	horms@kernel.org, hangbin.liu@linux.dev, felix.walter@cloudandheat.com, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	syzbot+f2f6312ad1b5a0bfe316@syzkaller.appspotmail.com, davem@davemloft.net, 
	pabeni@redhat.com, edumazet@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed in v2 by moving MAC address inheritance and SCI initialization
before register_netdevice():

https://lore.kernel.org/netdev/20260918-fix-macsec-net-v2-1-784203ec4836@gm=
ail.com/

Thanks,
Haseeb


On Thu, Sep 17, 2026 at 9:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 16 Sep 2026 00:12:05 +0000 netdev-bot+sashiko@kernel.org wrote:
> > - [Medium] Incomplete fix: the registration-time RTM_NEWLINK notificati=
on
> >   that this patch makes succeed now carries a bogus IFLA_MACSEC_SCI =3D=
 0.
>
> Looks legit

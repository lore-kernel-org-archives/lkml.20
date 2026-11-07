Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794077276;
	b=q1/sALgIdXPrIxd21xbxv63MW/NZqulDsLgIeBGcaBbl2EaBu6EOjnQghscZVWC0ntEe
	 MC3/gwO4v0dFyQF14bM4mI/b1NldXOT0U3JT2TYUa257s7o/MDs/z+pbogxCzoGF8IOfE
	 HndZJPIHj8hgqphwtibv5Rwyp6flPs2ky3SzgodrjT3nZeW9EysVgxlnl8boOeWDR5V0p
	 3Sk/FX5thDHZ/b51NVcE6WwqRmeS/vvN7CBlXFxHEPOuTPPORQ4ZhN1iqY0UaCzkvNgsO
	 ep9jr/xO5icXtXnmBJnGeS6g3ZKNAfqatZM/Ar/EOmvRARwwzwjkFgQ9HLlp67yLSpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
	b=etVHe2pj9KVT8yveebRrYXxjx4nDgU36mtpKWwc8V/35+ZPNK6M2519jZ1fjUV4Veara
	 DhbsQlSo86hCqlkqPYaLSRN2pbRSAa9KDA0yvU6NJJbIbt0/I5YK2laOKmm/5mS4B0Ym3
	 XrqJP7e0gKOTkm7nMmXfCRezPGHilaV7aEvuXOO3cbndNWOBT8lDVafaAHCfPRHs4Y9dv
	 b1FdcX/N37V0AyGdOM5pRi1vy29Ju2tG2O2HwpwFo9eZ9xXGNnDiWaVjCZwmVklZI2EFg
	 7lUvBJBJJiJjUvKWDpyDZKo+EwBfkB7PPvfZ754mVmlEicMUP9FKCvROw5945hJF7rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDsWkgNe;
	arc=fail smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F88606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F88606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDsWkgNe
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so923627e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794077274; cv=none;
        d=google.com; s=arc-20260327;
        b=SRyXaHUoYhsTukht9GWIHok+2x4gywQrNR3JetCV8VV2AT/MmMGUcyzWL5qMSthvVU
         p2lDwZiYW4OtgT9SYy8T5rn0q87ljA5HZGNiTJyjvGNxOISD452RqqIrqGAG5rsASo+O
         nn8oR0P7RNJXQymrvYSvHL/c4UNswrVLwxoSviFdLvg7jaZAvOVvK8bunUmX5qTR7JNi
         WGUswh0aJ7S3O34wVYR32hIyKTZDgXdaxsWWGnP/dtb+9sLpPeOI3iYkUaogQxV8uZGe
         MPsaM/VPlvIxw5AtBecmuA0KJYFcVtoob7HD4JhJvFHEmLfeGDG7moNbto41mSj2Byg5
         DI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        fh=cYp9bhmOKXcjnnRMcMw4OIXfOFhfqTSN/X9SDnFduVQ=;
        b=mE30Z/wyWgLoLekmy4KI9jW+qknG/7nxA+JzrvtApUzE0rG2EtLzttmGD0i4gl31jZ
         8sYfvyX7OzpQJYYo7QIsSBmGk4M6vbAw/ubSBnBYpyr7UCR2Omhs1KhOgYDKf0WG1haC
         9wjdWbBgik8syf9HeMEsUVoIdEKJyq9N/g3ZXSnFsUve5pjQN0OUqNH4Ps5BEsSf8BuT
         BiFU9UFKmy9vHHBwV20KKr4lJztkD4zeWHzkqv8AGBDL2pzIpm9fh0MQj0zRqwSflga8
         cGiuVzKPQRiwF+JMM0c6RXcAbPp9z0glpMDo5if4tt6mAPyoPotPDS6EXq2FM9oruQUq
         2acA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794077274; x=1794682074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        b=jDsWkgNeFsbdQ7qKqbpHSGOmDkfyI4OzDS2pJc6+Irn0QHpBxG9wPbmRTDmNnDdzS5
         db8t7KSVAGcHE/QtRbNhFDCWnX4uqUr1mEeZuLglr9YUDK4k94+gZZ0e2v5XDqaLBMAu
         GF2mKtLq3tPj9IBZGN3w1gGTAF0jFrsZMFCKcXAmKrirJiOIjEcuysNg1l24IqICP4gV
         r2UQCTmuYiVAi+q/1GU8UDVYE1+IZodom/D3RIz9GtMMMdasHTqHTXmlylMP0IcXnVJO
         5lWPTzglrmuISOXtwRoPqefa1QyXnIQk56sGTTb2Rf1nGsDNJzcZ5BPRF2XDpKcZZ3TD
         g2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077274; x=1794682074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        b=cLpk85Nt0xVheBthcQGbhioGafariKUk3LpZ1q+uEh6xEpWQL46ChXR3zPbD5qxTPb
         ZoRpkIqwcvKb7k1toq0Rw42Ad57Bqv+qpJEHZSi9faYm/cyNCHNFvQztzwtdX5A37trs
         A6GmKvbxgAjSc9Cw4tIloiqY6EJFotVgwzlZ2OoOe/RwNvzO3vNcGLBxDEuKGUapl8HO
         nKW8qkf8ftTs5Y6buD6ncYuZccMMQzVkZG1FGq7WCPKncfn0OgLGB4t+TOcrT7Vt5tTu
         gx81U7g5g9VYPxKkH5vJXx38sDiKulDEbQIKldH54r2CX0Pm1E8VtbZztcemvwmBSnxH
         zQ3A==
X-Forwarded-Encrypted: i=1; AL+hErHOI868+0aae9yCd9t06dj/4+6fvwMaJAkfDNVxBsW7BkCBCC1E7ev4bptwO5Vecf3LxAOhTfcv8bwQhI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nZk8t3k4+3oLaIZeLGuZ8mAQmLQ4E7d7Cb4m6X2l/WbTTFBWZ
	/KAf56CNZmRXFXeT6BxRjVqCe8Sd4Q5Uk0AE3fu9Ygr3r9joid7r2Z/rUh8oh7KT2QOiqib1Rv/
	+hzkJO0QB85yDnjRYVkBZjidwdWVq9zAZJz/7yAY2
X-Gm-Gg: AYBFou1vC8JNixwvShGMZ6PjV50igXYi3moy7aouTSibsPOYIKdHDoGlr42BQfHaKkz
	mFcuvA9xl47YtV8QHFx4XTe3Wrp8+2INSIaBDMgO9US/tczmDG/0VBP9wi9NqxKBDHs9by5L78Q
	YS3eLYifL/1IjP1GhDTGgqJHcJWApFzIKJipsp6j2SinRtxO2ZoH94XZF+YU700t97rYRhgJmiE
	Jc9riSswM5zuTPMuw1YCXZAmpdeZRJ0XkY2Z0icUKJjwZYkIQoaC3SnZ1wDiOHHMysPGV02rSXj
	pDr3+ld6gnoFyXdCYFzlRofcXH0IEEL+dxs4DvLBXWVjLFJUiNmYC2f17BSGFHkqlniDPvQh9yt
	YGh7DU6fKfATyb2/+gBfj+0B9NPjPapzC+A==
X-Received: by 2002:a05:6512:291a:b0:5c0:ca1:9dd7 with SMTP id
 2adb3069b0e04-5c00ca19f2bmr594320e87.35.1794077274068; Sat, 07 Nov 2026
 10:47:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <20261106-befreien-addieren-eislauf-e09212803534@brauner>
In-Reply-To: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sat, 7 Nov 2026 10:47:41 -0800
X-Gm-Features: AclHuK9s0dgg3FDVqp4WbjYQnA0hebDpEpxOAgz_VjLjRP_HfRjeTpRH9DX274k
Message-ID: <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: "Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:13=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:
> > The whole unshare/clone flag situation is getting out of hand, IMO.
> > And this new thing makes logical sense but is really about reducing
> > exposure.
> >
> > Perhaps we should instead have a small list associated with a userns
> > (extensible in the future) of things that the ns's admin (i.e. whoever
> > has CAP_SYS_ADMIN relative to the ns) may do.  That list could
> > include:
> >
> > - Create loopback with sensible defaults for ipv4 and/or ipv6 (i see
> > no obvious reason to separate them)
> > - Create tun/tap interfaces in that ns (and attach them, etc)
> >
> > And add a very simple new API to do these things.  Actually, the
>
> We've had this idea in the past and I think it is reasonable. I had
> always thought that we should expose a system call to create empty
> namespaces ot any type. Usually I'd be excited about that but I think
> that point is a bit moot and I'd really like see whether we can turn
> cells (or whatever other name) into a first class api.
>
> The problem I have with the patchset as written is that adds a lot of
> moving parts. And yes, I find the CLONE_* and UNSHARE_* flags plus
> sysctl to be suboptimal as well.
>
> So the TL;DR is that CAP_NET_ADMIN + userns =3D
> CAP_NET_PRIVILEGE_ESCALATION 10+ years later. And this patchset wants to
> put it back on a leash.
>
> So why isn't an aggressively stupid solution to this problem to split a
> new capability out of CAP_NET_ADMIN so it covers the absolute minimal
> set of things that should be allowed instead of doing effectively the
> same thing but split over multiple apis?

Because we don't actually have a clean way to make a list of
privileges that are, in theory, harmless but are hazardous from an
attack surface perspective and assign them only to tasks that ought to
have them.

But maybe we should invent such a thing.  It would be very, very nice.

Other than that, I agree with you.

>
> Anything that is reasonably advanced should not be the kernel's
> responsibility to delegate. I really think the old privilege model where
> the kernel grants control over a whole subsystem is inherently flawed
> and is much better replaced if you have the means to let userspace
> services grant and delegate resources.



--=20
Andy Lutomirski
AMA Capital Management, LLC

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794849333;
	b=5G+FlvEGr6t8o2gtTKa1CEQ1fhQzrR6ka+D4oQz1ag8h2mX7mc0IsUQMgTc4DmoX8XTW
	 xFi/fvcChuW0mnoOswuCbpJSNpxEPzbD7P02K0G0Ei+V4wUF1EoVdATFFkQLqFQiIinCb
	 whYgJEPozznIth2HMjh1JnTymOOrbhBv0K8DrqnprxOXW9IgL90p8jtsNxwK+iVuBznbK
	 FdQaqO5izP1gePYdciz/50X1ei15HvHY44DXblyZkWogqFw4Aq4VKyIG5xgcmEXeJ2l1Y
	 /crKCsKsi7oGr+HpsBvc/EzI5cOO61e565TvXQSIP14rWpjeaVXVLqIxxqsXbR/Szxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TeTKNjRbgGCPVD9Hh4J0uSo4q2UCRSd3rU9Pr4FPh88=;
	b=5c4Q2fG9c5vqDAeeQb+FIHXsrZEhmAq2TgVIMkrrpuP9B9Hqic8daLggBgAUj7JwH6wW
	 nIaWt/5O3yo/tvYDbf3dS5t5dE10LCxfKtvqIWsCMD5u2KJcq1tiRABBnxk+JIYxSNHUv
	 nqYpOHtWNOBsO4FtccdaBj/UJRetSSiGQP8EeBSbwpTxYTNBYvsI/ScjsT9UP5QCYZhpP
	 LYu4ZT+fnL+IOvpdw3L8uIH/GKhO1UgIiuMQpUVYnC797f/v0pq1JUM3S4zwYhZszPIPf
	 84QFVPGHrMsxipkx9xpRVKHgITchkRIj5Hp8vXQ3UATWxgdD1tRObwr6mldKBSc51FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ApZjJDVm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2521606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2521606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ApZjJDVm
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso3032204e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794849331; cv=none;
        d=google.com; s=arc-20260327;
        b=gnRBpho31+ZaIYikuaYt3qSCGk0DIxd11qFfWNsTNb/1lgKAM43+PqiQLAr9nP7O1O
         OcLG/RXZ+emoP8YPSu7tzetVitGp7NvPoOJVUck6VuPnUEnDFcbykTNeIC9NcXotHVuU
         KFzbPHr+K8X9zEuAA6j7MC2ZWNQ+zuOGrK5/Z8997rKpJuD5o9U1srSXoU1N2PK1yYVm
         o/k8+TbBCI0AHofjU7W3GzXJlP18wOiK2vJL2MbRgbTG6s9Inf0KL1b0CKqXfEcHuOKm
         YeQbb26ibQh0hRzVS0QWigjwU3dQX8M1QV3W6hXqeGGBfjgBCDH1F6JA6aZXObMDTtla
         f+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TeTKNjRbgGCPVD9Hh4J0uSo4q2UCRSd3rU9Pr4FPh88=;
        fh=Ntqc++k6wYN6NsjS+bONA0Gliou/H5I1i0+46JfLEo0=;
        b=PDWQ0Ygzg+H3YVxOO4k5e1XBA21tXtBgDK9qWqYZn59KDHwCxCd3AkGC7h160WNLeA
         QxmycJIgSL5UNiZUEipna/HpBMkxOxh3JFKrMUtZOxT3qbedM/BpiYxFqYBN5Dmbrai7
         o8HCnOUSW8WAmP+gnkIPhQhtqZvSvHyRBZ4ZMfo853Eyuvcx78vvb9BmpQtFP3wUf1cK
         kzqn1wki20Yl3qX6ywl29CE2hADY+lvFiQDjngSLW27+KnlgbU7+Hpak2q/5QseCODxC
         VE41LJMHBbNLzi5Tr7+eabdghkKx6Cvsu5bDiY2XfjoJRtOxtRk1Vi8eTwgrRasDtPa8
         RCEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794849331; x=1795454131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeTKNjRbgGCPVD9Hh4J0uSo4q2UCRSd3rU9Pr4FPh88=;
        b=ApZjJDVmy8Blwb7f7lK+J9zx/UG2Nq6aXE4IXdGkzgUwpToyasBcQHpBbdCoC3FESr
         MQ2PZz5AdlVHNvlsqaPOUhVXU3AFQNLJAN81XG6pfFgAc6frBmguv1fNXCnwvlexdYFm
         uO001TbMoAU22k912+wt4nRdhkzXhgHEC+18i3vXzqhK+v6NpV47705ecYGnZsqvk4DL
         g6w8+qZm1pDPrQRMNLhaqZRn9oZ3QufBXisXUWcG4Bt5SKsG50DoZOpIlec+jJanR0oF
         DlZo19AWOKlNBknkIEAGop4Dj0TKXO2QS+ZO8YRHjNeW7rbds/2qrDHQ2QwC997oDlRa
         WV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849331; x=1795454131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeTKNjRbgGCPVD9Hh4J0uSo4q2UCRSd3rU9Pr4FPh88=;
        b=U+QRFd7SGwIPR3nNiaH+dvFdzG5OELSHLDENKkJ6shBgdc3rzX6dXIEMmMlbquPfoH
         bzaUa7yG3QD6BgryCxTviTwtrqj8rIcVikUUOIka1zCFqXZ4XWKTmc5K1NKlR2yAa2Cv
         JjREtfNNiVlJNsBTNWYLYhVu5dt19BL99mDvH+0N/rWB7soNegor0jEkTy8JowPmFavp
         5o20G1fq2fmCxOIBTqiqwd4q2wx0vHgATPv99VWcJVRTjwLG55nHeO30ZoGYp3SAecTS
         8JtpL36FwFoz5CUU/WHFEby4laVF+Qcy3y54hRv2BmEREBZ9C8y57zUovTX01vVcsooG
         nq1A==
X-Forwarded-Encrypted: i=1; AL+hErGEX6qbO6GnUMDZNIvKHk/UEK4AeS0Vmr/oeJFvw11beCZPvKT5QYCm4Cg/vk2ZUh1OruePxwats70WX1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ky3cydYRX7AlxikBYciTEsMGP7XG6dMgokNTEyCQ+YxCOUfhX
	YLBKbp5qB9SWSJkw2V6ofq28Gp/vvUAJls6NQK3/y/LtvEkjGfzxZrN5ob3l+Sq5JnspSQ2osfL
	TXPhhERmKpTnFBnYd6i6CfPbKAvdOKHKTkeuJXuPj
X-Gm-Gg: AYBFou34f5BjJa73cCIh91mAqljybhfhHIsFkDR5v3Mqr5ECohzTbBH9Lg7n5JWtjYp
	4W+OKrs4cGzatoAr6zbk/cJAPOV13UyfFIe5MnWjo5GeJFMELNu1x1dnWhx+do5o1DLqtDOexXA
	aSn6+s5nQnEtno5e/fWQspMdppMOqhHJdKR+FiKzDCxkTutAo26TMYtHDHbAS7Wp5HRfmVthLKC
	zjC8VudMsW2gbK9WXT9KSOsP6BN2YRWhwfTBVXWdqVo6KNmsXbbLd9oYr23C5tBGaQrYZ7DfR2C
	EH0984SIrQ+x+15DA5PgJYS+5t2MWBI2nXkzqTFPKajO8f9ePlGn3fDVGYBkkPsDmmVmWx/MCHa
	EvtKfQm+VhpMAKUj86P4VK1eFIWNMidkwfA==
X-Received: by 2002:a05:6512:132a:b0:5c1:57cd:507 with SMTP id
 2adb3069b0e04-5c1705d8c18mr4112436e87.8.1794849330616; Mon, 16 Nov 2026
 09:15:30 -0800 (PST)
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
 <20261106-befreien-addieren-eislauf-e09212803534@brauner> <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
In-Reply-To: <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 16 Nov 2026 09:15:18 -0800
X-Gm-Features: Aa3M54qwWxMtxsZDh2vrMHB0wizt5RpGMmIfg1U4U0aXsb9fKiA9QIK00CYod18
Message-ID: <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com>
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

On Wed, Nov 11, 2026 at 7:20=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Tue, Nov 10, 2026 at 03:31:33PM +0000, Hallgrimur H. Gunnarsson wrote:
> > If we drop CLONE_NEWNET_LOOPBACK / UNSHARE_NEWNET_LOOPBACK from this
> > series and handle loopback separately, do you think the per-userns
> > bounding set is a reasonable approach for withholding capabilities
> > (e.g. CAP_NET_ADMIN and CAP_NET_RAW) from unprivileged userns, or
> > would you prefer a different mechanism?
>
> Seems ok to me.
>
> > To address the concern about the number of moving parts, I am also
> > happy to simplify the control interfaces. If we decide a per-task
> > securebit is the cleanest way to drive this configuration for both
> > single-deep and nested cases, we could focus on that and drop the
> > clone3() and sysctl from this series entirely, or only expose whatever
> > subset you prefer.
>
> Just a note on the essay I cut off. I really object to any arguments
> that amount to "it's too much work" propped up by a few thin arguments
> sprinkled in such as rtnetlink.
>
> I also reject any arguments that amount to underscoping and overscoping
> of the new capability. The scope is clear: empty netns with brought up
> loop device.
>
> I'm 180 patches deep into fixing procfs and 41 patches deep into
> preventing loop devices from abuse. Either we do the work and get
> something better or we do the same thing we've always done and hope we
> end up happily ever after.
>
> But again, I'm more focussed on cells so here's what I find acceptable:
>
> I'd rather go back to what Jonathan proposed in 2024 (cf. [1]). A
> per-task userns capability mask. Serge acked the core of it back
> then. It's at least generic and not just the single securebit capability
> thing. And we'd burn a new bit for every capability that turns out to be
> a problem later.
>
> Jonathan's version had holes though. The restriction only lived in the
> task's creds so the owner rule and setns() blew this up. So it needs to
> be combined with your per-namespace set. Roughly:
>
> * every task carries a mask, cred->cap_userns, full by default
>   fork, exec, setuid and entering a namespace never change it
> * a new user namespace records
>
>         ns->cap_bset =3D parent->cap_bset &
>                        (cred->cap_userns | cred->cap_permitted);
>
>   once at creation and never changes it again =3D> it's monotonic downwar=
ds
> * the creator gets ns->cap_bset instead of CAP_FULL_SET
> * a task that setns()es in later gets
>   ns->cap_bset & (cred->cap_userns | cred->cap_permitted)

I'm not sure this is ideal.  If a task has cap_userns & CAP_NET_ADMIN,
then there is no attack surface issue with allowing it to enter a
namespace and be NET_ADMIN there even if the namespace itself has
CAP_NET_ADMIN cleared from cap_bset.  But any exemption here would
need to be a new API so that it isn't used by accident.

I'm mostly saying this because container managers might want to
restrict cap_userns within their containers but still have it
themselves for management.  But maybe there isn't any need to enter
the userns for this purpose.

> * the owner rule in cap_capable_helper() grants exactly what entering
>   would and otherwise falls through to what the owner has
>
> So caps a task actually has always count as allowed
> =3D> should check Andy's "only restrict creators that don't have
>    CAP_NET_ADMIN themselves" per capability.
>
>    This amounts to a host-wide default without a sysctl.
>    PID 1 drops CAP_NET_ADMIN and CAP_NET_RAW from its own mask at boot
>    and everything inherits that.
>
>    Root, sudo and setuid-root binaries have those capabilities so
>    nothing changes for them. A regular user doesn't and so their user
>    namespaces come without CAP_NET_ADMIN and CAP_NET_RAW.
>
>    This also covers newgrp, su and sudo -u shells which is where
>    resetting the mask on setuid exec (Which was raised by Serge in the
>    other thread.).
>
> * Root in a container has caps as well so for containers the exemption
>   would be wrong.
>
>   So here we need a a lockable SECURE_NO_USERNS_CAP_RAISE bit thingy.
>   This turns off the exemption and prevents raising the mask.
>
>   Docker lowers the mask, sets and locks the bit, and
>   unshare(CLONE_NEWUSER) in the container doesn't hand out CAP_NET_ADMIN
>   anymore.

Can you clarify this part a bit?  I'm not seeing why Docker should be
special.  Shouldn't the inside of a Docker container work as much like
a normal non-container system as possible?  What's the use case?


In any event, the ptrace access checks also need to be updated.  If
we're adding cap_userns, then one should not be able to
PTRACE_MODE_ATTACH a task with higher cap_userns.

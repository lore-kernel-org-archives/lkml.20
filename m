Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAF4CF47B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177877; cv=pass; b=pWPQ4niH7fpKdh1eQASC05x9AK7lSJRIk03Z54WpYo32FZsc+aFqLZv6L79wBE6mC0zafGn425GaLXvWLiVt9SGldueTNcLIt3NizpFZGcJohOsJJwbgxSxIHnwMhplg00ojElLIKtp1XEhyCFB6B3AUtUgRrp+sYw1hPcG+KYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177877; c=relaxed/simple;
	bh=qppVgsYFvGGhHcWK5q8fwgXEoXbm8x8Kajt5Kyll45Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrZHX0rnWzlzQwvNOhFBlac1eRRfUYAIKf3T4cPU8EILZKZ1DV1ihb+YnF/ZYIzTIjtPUZnV45tADotV0UDLRrSE7/IEPHz8Wm/qCu5HWSRluKrOnd5P6hVrj7DVUCA7QKp7C7ExGtTld4p2E1zgV6l+28ZppLd6S4yEOrqHMSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNYHVnir; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNYHVnir"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6711f05fb14so299254d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792177874; cv=none;
        d=google.com; s=arc-20260327;
        b=jfKMZ1Me5DMH3uoWIrH6ItH7rvnAAlJ/66sAH26s7UuxIZ6bGeTuX5iVo6piFbGV8I
         /CZFrq4yUJ6ieQc189K2yBY9X+ahHk27GaqTYtIeSdVuBzDPZQMxf4aRRPxsvlYIUeUp
         PBB0mo5bP+4Qb6KE6nPv3Zs5WumeiVxwZ/hUKkIRu2aFIVJDzx5h1d5ccuYpPy3WBsKy
         /xVanrbQaodwbh07eYhhWgbAfR4hlNMC7Dui3ghqvOii9UTQQwdBk1+SCW0twzgTbiqy
         GUb4Xy+pyo5qXmOrcUmdsJNaOlw5OpU1+cEI47mkN91uU+omT+RqP7tqVXDCqX44WJfH
         hBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcM0e5h6kl2DJj3y8GjJ9yn5THeHomwVF5DySO9cYxc=;
        fh=CzVduWL+oYfgEc5X3vZbd4fxUjzs2im8zEZHlCApZ3c=;
        b=F9lax0cm2tMMuEC2rvur/Sj++JeLzZHJBz5YH8qCkkPzhCBgDypYqREoXmMGWUN/pN
         o1XbcDUKoizC5uAYxbYJjW0IZ+fv1x/vIXQ3iYsrxLT9IXRgmjn+fa5/Ghl6hhJgxz4L
         BPwsg79Hv7U3veJ7kZSyTry4HrdfQcHmh8AHDKfhMAZv+JOucX9EQEiSOJx1M2yHIqBW
         17/f+m+lI2q1vV4nnarfgyvHLYOD4G8dSbjixRBuJoP7djAIPArCKRo425eicsv7A/Qz
         Skqw4SpgY6gQFnQrhQTf4KCG2T3GsOVeYC6lHSguKrPNnOCAQo9dgSllI7ZK5ayLzQw3
         8tCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177874; x=1792782674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcM0e5h6kl2DJj3y8GjJ9yn5THeHomwVF5DySO9cYxc=;
        b=lNYHVnirjmv/XVzkDQrJJrtTF9KNDAbXxawbFWCxJHjZruMMjPqAmhqeKnvX8Dhuvl
         FqHZWxxeA1e6BytDa6B6qWm88wVrLzwDEykURFCxQx3GhLCfSWQ8hX24aL5jkY+DOSeW
         a5LUkceNq6eXRyJXYk91Xsrolvl4ZLVSW09ID+JiLAiBJwZlMk/9roGrfDRIobieGdYA
         zRTfkxGvy0mJEEGWG7b8rFrA2HM049eB2dHGCNYgNMRsupgebUZYB35BuuWYyM+WZMB3
         UzicVHJkTFg9yRS0FeittYF0id7wNbKhs14p7mRXpKok2DzsraiYLJVstHVmYBs5nriU
         CoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177874; x=1792782674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcM0e5h6kl2DJj3y8GjJ9yn5THeHomwVF5DySO9cYxc=;
        b=KWpYL0/FEauLgfOpLVyO1JeSGiWfD05xmxk5lsXcLGXxoQ7gJEMt4167d1xr+v2f9O
         ZcKncXM8V6/QMirdaAIQvOhH7rMCJ6GfGj5Pq06TFbkCm/TUZutFlqcEQdvROp6prsbb
         mTRI7tR2a7fyCn4b8gn4yr0307gxGp+AbiAfV5YSnYxgxHXvdDuPIOEbX37SYUBG/OL5
         1Y4EzlcK4FkCqHWnp20ZUSWBnNcdP2D8CfaTsXK88eqLHYGq7wQn+zKz6TVwhUALIamb
         SUGl2+Gcw8xXaskVV0305CCnjyo4jKuDjflJILFa+YkS2FGPT4r+AmEUbK4qC5BzZjfK
         S5aA==
X-Forwarded-Encrypted: i=1; AKwUvBzv+3bsQVeWS6nEJnfQjNjzDVAUgwk3J9uDE4JMdzOD3UF+S0y+j8t/y1c85v3pnha82UXk/ZEnH5RDQPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZIt3IttvU9NXKhVdbVXU9SUP/40ggzUoX6UIyFpZmyzVv6YnW
	pS5pdqo/a2hYVS6gx/+sGo56CZREVNiclzH5QklNbOKuye+eYdmUKsP247ht2p3RHyi1+/LEuYY
	OBrFbOSttebFkGgNMU7vBIHNXyss9LR8=
X-Gm-Gg: AYBFou2CWF2sPwrTpghDG88SJ53Mhrsf5ddMWI/dZnLwRdenH4qe7gY1OUBbJ4dIdvN
	yjanp2CxexZDREi8h/sl44ofMQbrxD5J2lrrjKpwriUEkPqggaDB5Z5oeKKs40dpJHn9qdyaDk0
	eXcxlMG5eVDDmW5lwITG1INKEuEewl+w6zkclE0v459mEwzRjG0NNzEifEIPCY5ajFnBBdJ2Mk8
	n3sBFU0TLuSNoTtvJjHhhMqSiLz9xzKYx75l416hsorJx369nQAl0lPNaZZwM475iYh0X7m3msq
	B/HRWOu7sW2xPSDpmnISg2zFhHnmXGgP4tIfVMWNX8bBuJmtzPXvnFbqu0MGqATtvw==
X-Received: by 2002:a05:690e:138a:b0:679:c9af:6d51 with SMTP id
 956f58d0204a3-679ca86652fmr108710d50.69.1792177873691; Fri, 16 Oct 2026
 12:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179216146138.25460.7866279004288174372@gmail.com>
In-Reply-To: <179216146138.25460.7866279004288174372@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 16 Oct 2026 15:11:02 -0400
X-Gm-Features: AclHuK82Reo9t1Q_XYkamM6mGKm-uUZWL-8Kv3QM6WU-oPDk-hAS-2iAswxeKCA
Message-ID: <CAEjxPJ7fLbBANfjcgN7Xa+axbQFE5ZALWzXxRz_kQ8zGvmw4Rw@mail.gmail.com>
Subject: Re: [PATCH] selinux: don't label bridged packets in selinux_ip_forward()
To: Joas Antonio dos Santos <joasantonio108@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, Ondrej Mosnacek <omosnacek@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:37=E2=80=AFAM Joas Antonio dos Santos
<joasantonio108@gmail.com> wrote:
>
> With br_netfilter and bridge-nf-call-ip{,6}tables enabled, bridged IP
> packets go through the NF_INET_FORWARD hook, where selinux_ip_forward()
> calls selinux_netlbl_skbuff_setsid() and NetLabel may add or remove a
> CIPSO or CALIPSO option.  cipso_v4_skbuff_setattr(),
> calipso_skbuff_setattr() and calipso_skbuff_delattr() move the IP
> header and reset the network header, but the Ethernet header stays
> where it was; when the bridge pushes it back in front of the packet it
> picks up stale bytes and the frame goes out with a garbage destination
> MAC and EtherType.
>
> Labeling a bridged packet based on its IP addresses is not what we want
> here anyway, so leave bridged packets alone.  Add a stub of
> nf_bridge_info_exists() for CONFIG_BRIDGE_NETFILTER=3Dn.
>
> Tested with QEMU, two veths enslaved to a bridge with br_netfilter in
> the middle, SELinux and a NetLabel DOI 16 configuration, 5 UDP packets
> per case:
>
>   case                                        before        after
>   CALIPSO packet, unlabeled destination       MAC garbage   5/5
>   unlabeled IPv6, CALIPSO destination         MAC garbage   5/5
>   unlabeled IPv4, CIPSO destination           MAC garbage   5/5
>
> Routed packets are still labeled (an unlabeled packet forwarded towards
> a CALIPSO destination gets the option, 5/5).
>
> Fixes: 948bf85c1bc9 ("netlabel: Add functionality to set the security att=
ributes of a packet")
> Link: https://lore.kernel.org/netdev/CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_=
6EhAuu4qfUFe_mw@mail.gmail.com/
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> Assisted-by: Claude:claude-opus-5-5

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

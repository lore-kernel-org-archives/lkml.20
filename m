Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597A348C6E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234530; cv=pass; b=n6+Cn4vJb+SfaoQTRfMZl6Z8/8yWZ20mhHf+9H5Hr5S7KxrjO6U3NygRHURF0SOLj8h/yTTs75C4EU30bMBhDGoHaEHid1jkxkgXv3kxA0oPPCMThaZNb7hk+ue9xCWd1+2KXkVXeND4TIaOVwhG3jMlU8R7zX5LnxrCSN2vp6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234530; c=relaxed/simple;
	bh=MG/oMutIsKGUZqj5v7QgFG2V0GauV5NB34SQJzSYO0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgwZzEOhrGve7h8JjavSWmSRMiIlc2elVWv/8W8mOmk6vYJE9Tt1EOGEioR4Cb6quKGqr+ktkhyGUvbchRny0vM7VdH5+HEP3L2YDUqH2qaG9RHohm0yAGnLGjWcMKVDHSyH30X2gFAGAfI24Y+crOrI6JQGluyeU/unKXFm4gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXUv1d5Z; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXUv1d5Z"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so15017566d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789234528; cv=none;
        d=google.com; s=arc-20260327;
        b=sw5YPPc2aSVYQuvcZzvFSlDnhZCnPdHsxllXD9/2hM97RdEMaM1WWGezNO11gM1gpE
         3RTJmvyokgoHnLRAstVxwRhBU9FO0BnEIU5WapPiAQn0DJHUVn6sCiVoyHYini0+tVmP
         R9tyXnA3+l6gyyj5BR00PIMe7FtOZzBw81u0rq0InrAnl3/tV3eO5WU5g1PUqlWDX+SS
         +0ctNhQbr3Yk55/4yUAsFupM0co215XLeA4spA9CpVetFRUwnCEomSXqtPwvUznOtXQV
         MT5rjkEVCepb+Rn2HyQpGaT1sUD+3/0y4WsnynPfWs1qhcIga8xdMCCmzf7+ltzr7oqP
         mDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MG/oMutIsKGUZqj5v7QgFG2V0GauV5NB34SQJzSYO0c=;
        fh=tRLiVIuT7XSOybWAaIdBImteIoIC3gr3P+89dxQpNYg=;
        b=rySlw5ze5V71CsTzKbxTxL/vdGKRAvtxRIDllwUcWVaNnArkeUfWn0FKaVenZq/WSL
         g2n7eW3Kp33dsYpP/JrzDMJ+ZOlYl1eP3LLcnhiZDjwWd0AihjsqJQidXoE2jH7qFozl
         IHby4oHzZN8NkKyRdSpdhEElcPg6pXGbA2wQTIwrvqXjeOXCfMEs1gPGRqWmVUYEUuev
         sqgb5kqLMQ/6dOZoTc7vuwoEuTw6VyLVZTr+dJ3uZPM4l89i6SeTfBSNzumCss7qCr4i
         2p1V5HzEserBipy51pa6FZbUQ6Y7cw4NoefBv2Ak1X2wZrGdWK3k5bFGWbvMRgrA5a5c
         JJCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789234528; x=1789839328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MG/oMutIsKGUZqj5v7QgFG2V0GauV5NB34SQJzSYO0c=;
        b=SXUv1d5ZusVbW6QMcQKAkJOafOuzAnGNaJTQE6I0n/3bZMidqHQPsUe7ezSYFvW5eR
         84P/Llv56IOl6B3OWHc9j9IntGx+ZJHGFyI6ANX6b055aX0YD9agYfz17+yFqUIKboAM
         t/V3BjQqU5C0VMj51Tx8kJGQpxfKlQvNtc1Nj5nfSzy2OHCMEKcSRLzMjxkYmezJ50K0
         NDrGQc9R+et6wU/9u3iSVefBBbJJUvqo+DX/A2CMY7XNNBPR8nao+11MuM8Ckn8PkiQP
         6OVnoQaP9vnIpYJUZ18pBbqwFqSGwMhua2TSadaykkpIslutQrmGMRsM99tIt1E8VSZb
         QuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789234528; x=1789839328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MG/oMutIsKGUZqj5v7QgFG2V0GauV5NB34SQJzSYO0c=;
        b=n8SG1Mc9IBGp4k1k2cAovBotaBSiHNDxNtPa1jqMlilC5J0qk8O0CrmShegQP/jlIy
         TX+zgMun0pvKDxzyIIgL174SS620dlkEQlHZcmFVj7lSAvWYEqmCAznYsGaR+HPYieQ4
         eCPzCtEqy0Aed5ZqeGqXFuzzoIAV+C1mUmi6whDGvj8PF3pYecHEqvPVHmWQwVTf8NLF
         9b0qEZW311Bx/+VB7eLdRYvJH47yRhWvsvHjwR1yGRj4zDQG+OhNOSWGLFkZoykPEI7V
         Bhwubg/rIbD3JEg3DrfwrNFEJB6h6KogIiQ+531mo6WmwU/TLFt0nWeRMj9FnHTcZrUY
         alFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF89dPABl7uUS9rv/Ku3o5bFpcODSHIXmyGhTFrTIxB2l9DDAKwNj9dPnDBMK1tUQKxmzQ+n9+UTNGwdM=@vger.kernel.org
X-Gm-Message-State: AFuF++lRnkvZY77A0mdht49/pzVdpFXn+Fsy5YhMSVYy0PO3triXMgcF
	fpiWuRii5ZxohS62gHh93ZqISSwGwGxKiRmF32qw2kIQ7FZIaxmrX7XU8szPI7VVv/9Qv4bCrll
	PizY2XiZKtb0g4S/BTDLP23qP3AOUNCM=
X-Gm-Gg: AYBFou2x1O93CD+Bxd2pkgTXRQbQO9mmCKMoGe1aT6NzHHzSGQYgMgGwWKVfgfMNghu
	2BGDrMkkNWXPrMP/h6kWAOdldrAadMlyS5W1J/6YI/tlPtf/cZ4wFAlyx9gZhbCbwY5uvmquTn7
	6hn9U3MtaaDQFeMp0+wG+VhrCqiB0lqXi7LuC2hWsjhiOFf1pwMLaLk+Tz4VvlkNr+py937wkZH
	My/wudCzOuVa0yYtVsnj1XaEb+sfpOfGZYiOwMn3i+nqVLGm2aLvKjujn6GjCL/8dyHYlXhmFxY
	asNgncAu9+Dt1aZo7TVgumjSo6chIcS81vA+wnnju+ZkmKDudF9A+Pg3OYhwCEqwxT+oDQsXPNi
	A5cN+WBU/ox33Pg==
X-Received: by 2002:a05:6214:328c:b0:910:4402:f410 with SMTP id
 6a1803df08f44-91212091c4bmr186100076d6.13.1789234528323; Sat, 12 Sep 2026
 10:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com> <20260910192314.209ecb01@kernel.org>
In-Reply-To: <20260910192314.209ecb01@kernel.org>
From: tmbates12 <tmbates12@gmail.com>
Date: Sat, 12 Sep 2026 13:35:16 -0400
X-Gm-Features: AcwNN1VO8FHui11gOOlIP1du45BV5WIWfuLdWO8vIfsBmwBzL9VU8kIrvC85IlM
Message-ID: <CAC4WM+zvK1zFuPfS5WnzuDR3b_DRX==x_S=Gg7LSLgZb9=33Ng@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] netlink: fix ynl spec tooling robustness bugs
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2026 22:23:14 -0700 Jakub Kicinski wrote:
> Why are you doing this? What's your intended use?
> YNL extensions for classic families are unlikely to be accepted.
> It's definitely not a goal for us to backfill all the ancient baggage.

As part of work I've been doing on switchdev based ethernet switches
for configuration and state monitoring, I'd like to avoid having to rely
on shelling out to iproute2 to query bridge VLAN devices.
Parsing its output is fine as it can emit structured JSON
output, but as bridge(8) always resolves the ifindex to its interface
name, additional lookups are required in order to find the ifindex.

Is a bridge VLAN spec something you would consider at all, or should
I drop the idea before writing it up?

> So you know that the Fixes tags are pointless and yet you add them?
> Please, if it's not a bug that needs to go to LTS it should not have
> a Fixes tag :/

Understood, I will drop the Fixes: tags.

I will be dropping patches 2/4 and 3/4 based on your comments on each.
I'll drop 4/4 as well, since I'm not planning to submit the OVS spec
work it would need to go with.


On Thu, Sep 10, 2026 at 10:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 08 Sep 2026 19:45:06 -0400 Taylor Bates wrote:
> > This series is intended to address several robustness bugs found in the=
 ynl
> > tooling and the netlink-raw YAML specification.
> >
> > These issues were found while writing a netlink-raw spec for the Bridge
> > VLAN family. However each stands independently of that work, and fixes
> > bugs in the parser that can be reproduced against the existing spec
> > definitions.
>
> Why are you doing this? What's your intended use?
> YNL extensions for classic families are unlikely to be accepted.
> It's definitely not a goal for us to backfill all the ancient baggage.
>
> > The patches in this series carry Fixes tags, but are all in developer
> > tooling and have no effect on the running kernel. That is why they have
> > been targeted at net-next rather than net.
>
> So you know that the Fixes tags are pointless and yet you add them?
> Please, if it's not a bug that needs to go to LTS it should not have
> a Fixes tag :/

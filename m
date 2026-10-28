Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181419;
	b=XI4u8Fif+bOgzyHajbcl0S/73ree9upM37jwbQMyfxWF5yu2teJA+zSGpXVfWT6Kdttk
	 lzT8c7r21J/EsLC5U6vt4fyYuJwNAalLlrS8w4ZH8UVPYiXb/7m2ACi1m/g8W497pOQmy
	 lsrJdI77ecfych3e4Hdbp7WQ5vr83THtpmuVgVreeroSMEgbTDGVeNHFXK5SFpUTG5uBd
	 1mjJBkrDTTK3rXyZJznF1NabMLJIEx76O3QcK2uVxHU5vuJ7A7XGSds+KbBfzKsQqCQT4
	 8+2QuR7O1VXlqEWDg3b1Lrkq6WtNtgU2+fcrhB/EL8PnrOKRdDt13VEaJJumsV+eMvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a6VquXVuy5Rn9GUpP2B3hYMvofEzquSuBwCkA3bH58M=;
	b=v/ArmaRRDLsN98bO3X4sOTJKSGdswuMmXnLovn9QWUQrlGdM7TX6OFN8TDZlbM7bVoV5
	 Ea9s5j3ZZFZ2N9vAH/GrzQntHxUJJtDH+oeBOqEmsvk7OtoJ7AgHe50WXawj8BjJFaqfs
	 5PA67CsQ65Ma+U/S3CmYoKOXHQ3ROeMMq+cTe6/4ieW3GDIuwSj5ZKzNBbHud+Z3GlWoJ
	 J0LLpbCwwQTqDDe+gDVVl/DNPQ6eXNMJVqX5IxzAP0j1HJdnXeLn5cW2mtSEqSAQ82kWq
	 fhHx5KzxTCLmmeWK2SzBVOrS9m2Qf4hPLSMf4uCtpYFX22e6T2iRKxtUCKmMjDIDYDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMLP3jdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B22606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B22606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMLP3jdS
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0a28a720aso7446197b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181418; cv=none;
        d=google.com; s=arc-20260327;
        b=TtSvE7Qd+4XkD28VbWQQ3Y+u26eHjA+TUObfs+IJDQ8ciPkBSIR7cIxnQpT/+/HvKB
         yjsqdLA2vKU36iNDIF0CPyuYMwzpaH8GABNAJlAIbHcXQNeOrZt+1SBIiICjejsmpIfK
         xiXPdaW15BR981iDyPlBpz14Xc2rLqbuBab2LvCUy7q3WPr1dfgB8qkaHrUWd7jnQmsB
         oMfdYeVxupvuqqGTSi0MZg6w7oIG+3dEjBz4umztOc91k/px/VIUNTyCU69/TKvWfNk2
         BcUncUfwYTPLqoIV3jjl/VmvQUxh06RepvKY/QBFMmUxUPmUweJtQxHhksJI0lDC2oiP
         q3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a6VquXVuy5Rn9GUpP2B3hYMvofEzquSuBwCkA3bH58M=;
        fh=KommeWBUMn2Fu5gGDNIpmBZ8MHgzN35FKjEuDdOv+nY=;
        b=py73vjtnggWa7uUPvfNZpNqjy/aEIF5Z4gDcx0p/qEzcxCQ9JGf61P+AFiQ0rAgRfm
         +62e8moDbaWJM8CnhONEdrUz+cs6neRwq9MjnvYAVz15s2OIydK1TYSOljTAD/8+rQYr
         QAtJF09uYcluNdsOiA3UE7nPldlLWuGv/KUe5WqBRE1Q+GfktkbycQtAD53k3P9tTZ1p
         QkNMRqlVb/eHYWWr7LrBb+gkrWdgk9dAY+2rcU9IKzrq5dRkSfrdjiEFv/GOVtqDp0YN
         dBitJ+ECLIbEREsqDyIp/zD92tLlU32ClLoHnFbHFcbYNgatXQB/EzDxIUnOervdADZC
         DEdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181418; x=1793786218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6VquXVuy5Rn9GUpP2B3hYMvofEzquSuBwCkA3bH58M=;
        b=CMLP3jdSANHWS50nZgDA+1WI/PAOcQyDpNF6QkdN+gmdfDVz6NU0mSpKiLoLJpK/M/
         o9eM7cEA19z9y9HnU3kL3roYfDQ0x7kshoW/Gqc+n5b+eDKpk23vndMOxiqDHEBcSNT4
         dC+/tToh0yS7EkbYtHO3SPeRL0oROZCponZ0S9nqNYAS8tqXxctEDjTE65L65B+mIr6v
         G281ujnLO0rZU+91WH3uffJGddKQiJx+z2TRcVnvFbMtW2aoapz8He58TSa4FKEwdZnZ
         ERb9JiG+XxDws3S/L5h4wX1blZwLpRNhJq5hP9JCLQTNolO4JyGWMuFiIrgzcMb7iN8/
         auGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181418; x=1793786218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6VquXVuy5Rn9GUpP2B3hYMvofEzquSuBwCkA3bH58M=;
        b=AcG3emNhVKqw2EFp6G54ozZHeVQKtlLVY294/PW13oAMZttMKmxbuQmynYkzHuh8wI
         9LllNIrK4KqEsvPGkhpunPG6tqhrn3Ykjvl3s/PWJpFwMbbxO6uFlmQPxAgXsnsZ7meh
         yQrac1FcW7+VVtkJX/y7kCzIibb4AuX6oPYfLgN463v5ujyrpMYG7ctRnNRYy5JEjnWT
         TITicQk5xZTI75gfub5URhu33K66pp3CNxbYdHXihj+N3xwGJOv/s1UgcbdLO6BBjYri
         og47IHiBOc+zbTG0oN6dIJeaIdMcCe/S4PhXrBrBIxGXcjCqKFvMcEVf3NC2rSg/K9YQ
         o59w==
X-Forwarded-Encrypted: i=1; AKwUvBxinnD3Lmn+hA113znrG8vQrLI/ywYvuGOSjjseC/USq8eOfg6Nse8qNVlQkjqLbIofre2J9vQ0Yg1pQg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGoaTWIaNSFQq7Jqba4YehTaFtXv/feqbNy4mvClIHG/qjati6
	fDEpKctogk9WjTFhoywwt4curzJMG8Z7LBsjf3q4oKC8Ls5oNdO8eoqbb3eV9W280YT/JczahX1
	8/GW4MtEQl4XvI7e6l3C6AOfxVpefeOQ=
X-Gm-Gg: AYBFou1uLNqcA66T6q1+vU9uII750HPYSCg+M27Vp7MOzSqDisXmnm8/FdaTwM5+tEw
	PDRhsWR5fZKC5Sl0fRDwgwUYo1z/7AlUmC1GEBfaxJeplkS9rytdKs0ARFj6eqINCurBu0o++Rb
	18jBbXUe853F4dBmRmDEu1jud/sOBG9vmDDfvUpYA0ILRTpMGwLpamD6DUJimO2aDVLOqcHivp0
	VAT1l8lPuwHoyxb5yfxNjxEOPipBpN+LB33T5FcWvKwncdbaHxsMBAs0RlSdQ3QmHqdak4q59Yx
	NZst0MFeT6FInX70Wqw/eIhMesWxhPsCADRydl+d7GQAgl/c7wjCkYevqzwwhhku06sU/U8Er5F
	C6P5Zp+sCfqKEB44eYlgoOBv7UpUd6VEWVEwCd0+BxrMUV4zWwD5uXddCcBbiW7EFAvdMoSnu6G
	AtoGCicfQyBNsJZklHaMqjzKKSkgaHEGk2GB5AevwHY3D7QNZF003wzQx2HAKSj9d+NMRtP2OR/
	dJJ
X-Received: by 2002:a05:690c:e04c:20b0:88f:73b0:fa87 with SMTP id
 00721157ae682-8b1b5a4cbd6mr10598727b3.11.1793181418386; Wed, 28 Oct 2026
 02:56:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com> <20261027202230.3539646-5-florian.fainelli@broadcom.com>
In-Reply-To: <20261027202230.3539646-5-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 28 Oct 2026 10:56:47 +0100
X-Gm-Features: AclHuK-sjCMqSTI129BU5xI2mRkdCU8HcsLbGdxa3fy32DUQkYzbgOpiZBy8qP8
Message-ID: <CAOiHx=kWKpYjZce3Ndo3ux8PHBKkZEop2bcBfCn04U8H5tx_ug@mail.gmail.com>
Subject: Re: [PATCH net 4/5] net: dsa: b53: reject conflicting mirror destinations
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:22=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> The mirror capture control register selects one destination for all
> ingress and egress mirror sources. Adding a rule for a different capture
> port currently overwrites that field and silently redirects all existing
> mirror rules.
>
> Read the capture control before changing any source masks and reject a
> different destination while mirroring is enabled. Return an extack which
> describes the hardware limitation, and propagate a failed capture-control
> read rather than making the decision from uninitialized data.
>
> Clear the capture-port field when the final source is removed so a later
> rule can select a new destination.
>
> Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>

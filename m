Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439075;
	b=wQvyRhtPb4dMj3geQ+lAFusBnz8tVF3wjUzTBrVpoifPQZf678Wq/bstmuola59dQcMc
	 bwPu1jCKbS2ZRHSCtrro2iYUNJpBjnzHbcV1hK55zlLJVm9ClMOGVnvjzy1o8WbZGxmqj
	 labM4OzRtu7wJ4lJeGixTHbwk12Ci1Loxb0elWX+y9e/aBXrcCuCfoapbHaq3rvh60iHK
	 5XNzSd++ObiuYQZYnPE+zR40Hkrp7sT1+o2dn+P7zLQ7GYQcarhHudH96yVzFn/74EwRg
	 TkNtNZ8ss3mR0FMkqlq65yb9/o3wGh89WzaI/qGqWAPIFArHiAw0jKeBrekP5z0rU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439075;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TJD/l2dgN60lOdRp5Ktchuk3+SNhKEQ8u28wOrvBKgY=;
	b=mVvgsbhg6CYsB+Fp/Qhgd6gikhyOHBi9Vi8eFRLSt4N4zHFOQaoXqNBhhzlIWJYgciUr
	 4LCfXlbsbHwsZzsgivfGwV8FzabLh652+DmaLkLcG24pDsvMTtSx7Ws8JqR0uka1xSC0j
	 tUkj6wsfF0kQZEy2NbRIKrAh7+m0lVv2RomDEy9WoeapW79uA1oYlxjAdaHZgHWo52Epk
	 W2v7dRzvHSHlbcdU5cEuW4QaOVt+ZmKVyIAUvJam/RVaW4FqqcI/ZTM9+wXEvW2PYQvf3
	 i6D8iYtp/cMakk6syVYPF+wc/70p2NwcBIXkJaHzZEQXfGmdozJOOA/3tjrIWJc9TlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B88F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1886560a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439074; x=1795043874;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TJD/l2dgN60lOdRp5Ktchuk3+SNhKEQ8u28wOrvBKgY=;
        b=0NghtFQA8NyxsnIt58dOAKU9kWUTKnHv+eX3JGerAXX4kjgpNjWYt2H5H79VQolZcn
         tYEYG1Y+KOET07CHU4DGVDW71GZEdlXswSczwaNw0JEvXZjvpp3AXHrBAcqrBZsrnhlK
         csdviF4Q2Gezwb4Ywkw8DYHnRjm5tf9Krz6DmpowSTH6kXx7L/YcZO5MBw8x4cuMC97A
         0iW1pzCc/31HvuFBiHCtXMugvODEkauWTOqfuKFOdk8ZmbNnjYUwcDwnkkJCy5o0laXY
         obkm23k6tXP0ISPpQiwsnAVUsJFzJt6JaDcGJG2Qy0LoKc7Ikf4YPjLnQTZ9kz0BeFX3
         8qzA==
X-Forwarded-Encrypted: i=1; AL+hErF3oqIFXVPi5SL+mUk3JAR2KFXjDWMxQhjHWEcwahu5hnHcK9JPHOfrELmQY38DKV/F0KFqnimtBpokFm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z91bscq0Eb4MrWWR9FdAjNp/NiVA3PB38AKJ5rHZUGso5YI+XjH
	wR04mJUn2Czwo8Xp4J/e2abr21NEHAnX3BSlWIkFLcG/xIRrUHIOXVkhofhtQryC
X-Gm-Gg: AYBFou2bvDLYI8n5NR6lZhkebR9a8JdjCYzpUw5mn8pVpuTaW2f74R0oxKpqcZCpplX
	sy+4Fvi2ImZpXualnEMt4qxcBU2FMTv1YFSNAqxNMmq+hrgIPXYpLhVrN1ZZ0OxSRXUPAKKHk4H
	acaUBqV+c2TeqNqn6phYkwc85GmnRdfj7dkTyqHNGbBm5SKC0A+BU/f8o8TSDvhhbWfL75SUvJJ
	x3vWS39wo3Ps3Pos5dzqrSYozpg2IoFLv3dq4R/EEBbFbwbEYBIKtIzX2X7K13ZbPrLkD1Acxii
	HXK1vdQXd8qnUeKiU6C0PkV/pEbBbiT/LI1DpOVcbqxH5x+LDaPooI4twx3RtG5H1Qe+4dNHD0x
	3E4DX2JMWG+L4ccaPxEDfPLBrKbm7M0GyBlraFbZ+15k4YfiqPjpSErLmif3orrpOWaApkjHNPL
	vb8X8N3glNkmbgK2D06GpHNLYsIKoMpfXzms5X3w3twoanLRSd2avQ7Br71M22gJS2xGlwbkL8w
	RhX/bbVFBngXINcXPnhx4WlAyOnH/xOA1Fiw5vsaLkKkSIl/2cZimCVLbEIDS/zcHkj/Wu/IRHS
	hfxFl8tuGSPN4xhgCXr1ylhxdnJ1LlvLcA5ItwM//Rj6g/4DDGTgyqW74SBjL5+M02tz3PlxZCB
	gvA7s3Y3TZK8fKwEcHbXKMi8OVKaaAM0u2UemrSi2A8rI
X-Received: by 2002:a17:90b:4b0c:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b182defaedmr3809903a91.8.1794439074390;
        Wed, 11 Nov 2026 15:17:54 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm1211988a91.16.2026.11.11.15.17.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:17:53 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7176794eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:17:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHAZq4y32F51V+Fo6zyCl/ansz93oD+OOQpDewpU7pk6O8qa0KqFx+fANVqprWB/ccslSBz+p0BgjIZ03I=@vger.kernel.org
X-Received: by 2002:a05:7300:1486:b0:376:feb:2df3 with SMTP id
 5a478bee46e88-376861801e9mr5815346eec.20.1794439072759; Wed, 11 Nov 2026
 15:17:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
 <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com>
 <52c38c53-7806-48c7-a0a4-9e1aa40cc55e@broadcom.com> <CAOiHx==VFEgLf5Zs+VGYdhdsznSwTz-8Hp_aAF6UuGnKT-4=fA@mail.gmail.com>
In-Reply-To: <CAOiHx==VFEgLf5Zs+VGYdhdsznSwTz-8Hp_aAF6UuGnKT-4=fA@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 18:17:41 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5eHpzoYdZZud7sjhjYhCEko2qp9hpLFHRr1Wcdb8ps4A@mail.gmail.com>
X-Gm-Features: AclHuK-EGy-sXJ-AuLMUcM56eR3CiFTSuahQBNsyhRLIPXPLjQHiN1ydrRXpFso
Message-ID: <CAPY4CJ5eHpzoYdZZud7sjhjYhCEko2qp9hpLFHRr1Wcdb8ps4A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > We could also try to use the CFP to perform a full redirection to port 8.
>
> CFP isn't supported in all bcm531x5 chip variants. E.g BCM53115M and
> BCM53125 do, wile BCM53115S and BCM53125S don't. And likely the
> presumably lower cost S variants will be found most (at least the
> board I use for testing has one).
>
> So we could at most use it as an alternative path where supported to
> free up mirroring. Checking if we have CFP can be done via the Bonding
> Pad Status Register.

The CFP redirect would be a nice fit where it exists, since it leaves
the mirror free for tc. This board has a BCM53125M, so I can try it
there. For v2 I'd start with the mirrors, since they work on both
variants, and add the CFP path for the M parts as a follow-up if you
think it's worth it.

Joseph

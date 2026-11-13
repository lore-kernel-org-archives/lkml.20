Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794536278;
	b=nEyfjt/741Zs6Y2OggBzUNkLCmwXQvR3QzG/ue+8kkZwgbfA+WwHXtbOo7lnCwTG4ysm
	 umFt/pICuRl3krX9+4VMkVrxGHAFIKbFGYGz6B125bdsalztquYrATA+bwvZQDTdrymQo
	 iJnlbSo11qT/KnxkSJO/4DD6Y9PoEQPAAXFdv8flDZJGQumeao0Nk7RTZMIcTw6SydOWb
	 fCgNWFcb6aNVCpe0JJ5HvUxcAZinSQos7d5rbtt9OPA2i9KGoHHCWH2yYt044sChBvbdQ
	 QTzn1pURBM3MAPT9XRSeObd25KSte0GvW9BeNG4megnX+DyK8L/CusQrkY1hJ9tybkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mMoLtoKVHPH3osTrOZ4lwcy29Ei9HXsWDANwzVPqOLQ=;
	b=0brGwST47rOuZeOXj9cQUOA2LMnLQAUNRVR5sO5SYp+cvlzQPV/mnFgIUdhzXJmdlKdE
	 XF2k3dcZ8hxKKp/pIKiDxfPQyQmmuqyXbrG29PAdMFtouEtho8AZ/dmNL2P2HBbCS9cQS
	 f4EjLo7iALI+gutbYPWpu+oxTmcQPmM0CxjVIbjhKu0Q+K7JMDHbG5AqIp5VtpObpVgPU
	 ZzzOkEWKGGF5UkVG7fQXqs5syt/7rkWmYfksKpMhPaTOZ8OCGbL0hwcY/+8tbykaToWGl
	 xb1KRjK5ksLxGHjXw66lFuWe69Pe4sBSVYuB2PK6aYCQ6eZegFsYRuMcA8jqCXhU0sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzYSZ+lJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9137606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9137606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzYSZ+lJ
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b349d21fd1so3722677b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794536277; cv=none;
        d=google.com; s=arc-20260327;
        b=by+NIjkK3+LB8yVH7xPD/5keTYgL0PYXtV3h8xkxRkTBKGxaVzwRaOFMhc21SAou4d
         dOxR0+Hu7KLbmEfkKHw91nxxXbhUiqRxHLPYiLU5dA67Uq3JB4iXuI3kJzjR9qUvv4E6
         iP3GiJ1xpFZBSup5TPTzJ1j/RcRoe5zwkRLE1sBFW1Gt6AeL/Rcg1hkHKMcw3JtTItKq
         6GnW/B/g5fy4V7eBr3BqmpiyUC/BJvGyTsJVgOfR32JjRhYw4YqFf3CaYhg4RMuBV2pq
         B6zfyB31ET2cc0V4LJqBOUlliSLpu+tRsVce8/nVsLIjbQeKkooBG8ixtFwlM1Bz0Xg3
         LYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mMoLtoKVHPH3osTrOZ4lwcy29Ei9HXsWDANwzVPqOLQ=;
        fh=K3KLQQ1sy1aS7gzfwIKZZn9YGiHaQKD1wOFFO3pOG2c=;
        b=jAfYrU9+/cgwK8JFPr012G4QoVHoRx7iXVrmUN0FdD1Ctb0+CZBFmppOldl5xojZeW
         2fkkzNphUR3A2b0cUBBEpBjkHyLQieAq5MHWbbTFQw+OxCo35bTUtVhzpHgOB3oJEEKl
         O6quZfqtXNKCpvDkY1XSXOmmshS1+TiA6ek6NNPcBBH/r1/iCP3CjT3K4rM6dZKeOy3E
         ZC1P/h9G/DC9+jjGyt2FpaxEspWBBuoJV44Wh7HxMaxTw/RTqgGbzmIfGbS4tcV3/kME
         12RCgsD8DL+WhQBFfN3URJ/YWJhK9B5zEgF5gZ5ekkVxXAdthFNJdQhGlM3bjAP6wylG
         XQYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536277; x=1795141077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mMoLtoKVHPH3osTrOZ4lwcy29Ei9HXsWDANwzVPqOLQ=;
        b=XzYSZ+lJyTAUK6ilnqwqKx/mfzWPe+1ovySBh/fHlHVSS/Vc30zGNYEjD7Rd9m8di7
         RF32Jt7OuWr9OrYLtpGXq7jyrTiYy63yPlczKxUz1bZEU3ham3X2VzuiQiJA92V0CgNH
         3S433LSJvW4CTBgNzKBCVhH/PG41TKQnuLHUuRkoKu4MACbNhT74ZQ+aASjXIh8DBBub
         hs9juuE7hx3wZwzOCLSBnyaAKIql4tGXqDQV1JA3Id27Zv9/pc96c2bclrh51pqhv34m
         lt4ZNjVWqJwGutxZl3ju+wkdarO4dILHzaEJuU2UFjF03tHbFyx09hHpgmIrq7wmABTk
         AffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536277; x=1795141077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMoLtoKVHPH3osTrOZ4lwcy29Ei9HXsWDANwzVPqOLQ=;
        b=O2L2Z5Kb2wfdeeBmsTqo08uZi5S9jZe4q5FEP0ihFNQDCq/F07PUtdr91YLSopFiHU
         RJMa3uPVWx4XrXUXNTDtgr6PoLpjPFj0LUJWfkuW7zJzt214ZU061O20Qy6L7Klzsxs6
         tFq61VeYQcK7OsL85r5VJmYPwHtgiCz8K8lV65WmjkpP/stHIBd04OQc/niE2eb8XBg/
         YoxLnWEZf0hcBUiH9f59yRunv4L6B9GZWa4crZu0cxrw1mdJNBgBQgJDYahrNxx7AM2F
         KIwoH2Q2lLujiwzGIaSfrQUbz5CzsfSlYUM5tTPAt/hpGVTcokvQ8Lh5B4XUylZJQCrL
         qGmg==
X-Forwarded-Encrypted: i=1; AL+hErHdeo6WJ+rK7Z6ZzbXgxg7qTk4N/Pmf8lE35+K0S2+rc3XI0Zegk1nrJ2I6I9GRa6kOWRfk3yttdFtibj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YNCZg92gUEj0V8ekbhm3S9qE8Ev1f1NZX7MCbN5BuGbaYx5Ua
	GQbnW9onvAEGj5+xBE1eLYBIDHyuaODIVtbONgqlyBg136/CipZqYNesR0wosDxEimRBaPSHBqK
	80ZWgy/z4Im9mra7OqSP5pun3sOr7Rw4=
X-Gm-Gg: AYBFou28ILePsSYsPesIFxQhLkxA2kjdphNRR99aSYXobOMqWwpqDSiGKErQA7kZdTP
	yOge2dQRm+JWBw1y9Enot+BTQWXaEyy2ZunaUcYPg6a5jHhtKY76EAmBJCAppyd4c1UKbZdZviR
	Wz5MB1U9DLkQ1rcpC+j7HEVfcO3zCLHZ2vNyN/qv9tdCzuEhajDyw4SawHweE7SHHTSFziibiWs
	L4TA52usttox1kSYEA+ZP0owThXnc5XODx45ZzQnR1tgnXkdJdPSZkSfHQLYJZagPJBxrh+B7CF
	YTFRDPGtOO9kQuEJTE7XEhTarH1vm8rkvUzOwFVPgrBwQZe1VocaiWl3ks/f2MZU3g+6ob1uVrg
	4WdS50PpE9OIam14nqSGJHjPM6pee2mXjSQW/9MGpztxzxnfiD7JNe7Z7yt2f1Z2bPlMJp5W+la
	FJuTQUi7OTZxxg
X-Received: by 2002:a05:690c:d81:b0:8b3:7782:677f with SMTP id
 00721157ae682-8b4aa38fab4mr7489937b3.92.1794536276704; Thu, 12 Nov 2026
 18:17:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133651.40061-1-laoar.shao@gmail.com> <avYNu60V0spG_xIf@jpoimboe>
In-Reply-To: <avYNu60V0spG_xIf@jpoimboe>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 13 Nov 2026 10:17:20 +0800
X-Gm-Features: AclHuK9z04O_rInSIsxR6V59YpeEoWUG-2HR08CxR71RNvbY-rJ-pyw53dV-fPs
Message-ID: <CALOAHbCGy+tDn6b7rt11H99odZzRG6V67c17ToeHb_0SqVdxWA@mail.gmail.com>
Subject: Re: [PATCH v13 0/9] livepatch: Add support for scoped atomic replace
To: Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>
Cc: mbenes@suse.cz, joe.lawrence@redhat.com, song@kernel.org, 
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:05=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Mon, Oct 26, 2026 at 09:36:42PM +0800, Yafang Shao wrote:
> >   selftests/livepatch: Clarify test module file names
> >   selftests/livepatch: Adapt atomic replace tests to provides/obsoletes
> >   livepatch: Make klp_find_func() non static
> >   livepatch: Call klp_init_patch_early() earlier
> >   livepatch: Implement provides and obsoletes for scoped atomic replace
> >   livepatch: Deprecate stack_order
>
> s/Deprecate/Remove/
>
> >   selftests/livepatch: Add provides/obsoletes test scenarios
> >   selftests/livepatch: Add state test for provides/obsoletes
> >   selftests/livepatch: Add function test for provides/obsoletes
> >
>
> With the subject fixed on the above patch:
>
> Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

Thanks for your review.

Hello Petr,

Would you like me to send a new version with the change above, or will
you make the change on your end?

--=20
Regards
Yafang

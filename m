Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792763688;
	b=JcKxnHs5esKdZVMrzyAJaRSSG2cPxdJa2ZPFONfImE4KJz5u+mrcoEXTPlzcejdxu5zd
	 S2KeZT6vpoO2FeNgYeate6Hb1af5PwkbJVzhcRb1SnjGHUg+CaIXPcDPITCnzUJdc9BxA
	 5xRm4YeNFEg7SUiECTEjucFUImTVaU6NswG5BdHxg/XoA+ghFQlWlHMXZ3ybqdDHfNPPj
	 rwJl/9mOMYhx9+Wda4ymDHg0Z9oJFoD/aFs0IJih1juTSrnKmmJ96uqF1bj1YfzeTUZr2
	 Q2uaqxp7NFffkm76+Yz8z7wF1O2PZ7kuxtEigpA0D4stMV0FyK1x7OhTI67YYvXQyzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2+AhzJ7L8tQJlY/aZD4qLJRxC1d8AyZMihzE03ThXFg=;
	b=a/u/tZyUtt1dS4/gPUvyJlOA5+3ObPhJVXZEEBIsQ0JqgnaadO/j9fp8S1qXDu+jMpBb
	 TUMjxvBP4IWqLAM0aIdNisPONlXFEdIACJwkiA2gTiRiRPyqxwVw4bvsrEPYgFp0+sKpF
	 xNVBAZ4M1fGdkwKlqbjrfQiTdBtX0E4QeKyqpUMIbcUx85tjC+mA1PkmtkaEv3OTNHP+F
	 5+ofKmpHBaw9uPYo3zOmxbuwZMl/3aoVGgRl9mwGcCnndQAr0eT2QYgLUnXkfEjFT7ipA
	 jZbhaQGCgkcc7EOST2jSR8mvlVbDQSEWKCSzatfIRrzzKK5S73OE+Bf0FgV1Z3bcw7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=r2Zn7V1M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=r2Zn7V1M
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1164479a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792763686; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9Zm2nOt0a0RKSb+9Hq2KsRb7Yl0++zyCh0M/Lq/jI7QH6k9U1EISQHangsC7frPdm
         kNCRat7j+neRHuNkxrfIm19p24+rV2yx81CowLO1eKJmZc3YQ8YR2YLx82ecVuJ+z8Vb
         CSYpUfqX9hD3bWQNpCxYVxAfvSRdij3+LaZXdLyurlydpG98VedMDDNX0h2p/51uHPA1
         sa+/rvKpoRfdYXR124nHg8T5E+zDwC8KW/DFksA3OtJFcby0ybtqZ1VDI0XjHeT8R4j9
         YGNBXgkgGHC9GQM0l2eMhgiX9fYk5Wxy7pSXWUApdngsMkbMu5b6FQ9N3U5oqftbjeS4
         Rndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2+AhzJ7L8tQJlY/aZD4qLJRxC1d8AyZMihzE03ThXFg=;
        fh=hg+BzW9hfcx9HPusN30KnqYFSTP7NBWBBdA6AD4ye28=;
        b=Et96bEZfZKBkBzaOC+osYBH0i03fmL03rcd8Nl/eeIkpvcfBwfn3jxI5ACf90iva+s
         SAFo23/a2dZUFY8cL37IXKByMvemzgoP5HVU91hnjV+2GzVpQoqaX2bbr802hTAXhVDb
         Pz0KAgyMRsS2vHsaINwYIk0XW29ZneXzYi0MdYU/LtIq7FaHvD8gddbALPxxMgZBMRhV
         KJl53J5ROgILt6AFKwzX9iH1aiWCKNSa8TPutp7mUh72LU1700GMVudQNdtQSZvFchxX
         NHY4N45y+MQR1A1VxIQwuf/vm/3Q54VadjiXrhUVLQA6CIzTmy37dS7U4+pQVpjol6uq
         A69A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792763686; x=1793368486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+AhzJ7L8tQJlY/aZD4qLJRxC1d8AyZMihzE03ThXFg=;
        b=r2Zn7V1MeWwdfM/XmXgX9Sb84phDtlFGMHpyF7f9b9hCLBBS/fiDx3QC3JKDSFP5MD
         LWQ0mvzZR2ib0k5Sh/fltlQ0/NnyUUVx9ZzWYyzdbJiDuDizFcQdztFRtnyvrG6Yu+Cn
         dvlCigenjv8rIBI/nDd/Tx9ovJlyN4m0YM5sxFEF19gvlPGiYeJRAhqohMyZb1roVg/C
         qdD8SuipZCYMOJetG8RiUa1eJCvCukyHsZ9U/TL5XxFMe5MibuLwLOcB8om7U2NNAWKw
         bzGhi3rE0IuDTA677sgSXJrswpj5FaoBdyAz0AEfJsArOSE8Irdz4hc7IqLBw0eFAEHK
         eizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763686; x=1793368486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+AhzJ7L8tQJlY/aZD4qLJRxC1d8AyZMihzE03ThXFg=;
        b=TllfXseavtALCctI4tKCdfBGc6vSjkA9BEZi43zLNPBg8wWZQJK9+TpYSWo784WI+c
         z8WxKU8JWao/nWZ0QtPhY3MHFCNazHrunfjTHWmKrsQivVNz8cHAIDUTDoqx4CS4/y7M
         F7FlSwYC/kBvelTNeAq3747ozFUbgPQGGyL27koCu0qJHYCMfhzDawu4YM4O+p/JPzmG
         PjIXELzP1f9ejwmczTdSnLN76K8hGj52XmTAuN/W0T+DRIv1XYwJvc9mA6xIhSue/1u6
         PRabHyI6eqETWgnvD55sl0cZfoQZMllliuIFMHYu4yIxugQShlIoeAqn+oCjAma7JDq0
         D9sQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5gguW2Iw6qUObYB6y1DUpBVVRsAx98qE23A5q858J8XSxkLxOWL8CN8Volk+6yBij+CbHx2K9Dk9e5BI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAuTIhgEyv4DTGXtR5a0/Xi/aEHdILy/ocHcVsRD3qgprsigad
	WtuKoLFdTgdDLY6USTDLCim5EKC0lfDYj76IYNQhvWnoN7G8lyScKZGPS+TN/DizqwQJYh/Ebcn
	LeHyFK1EgFZTNBD0ZTqMgl7ybHj4EBzJLy1VR8CSPVxRbC5PNoxhB
X-Gm-Gg: AYBFou1KN2lDTixJL5iA8l5I5lN5cryoWZM7kHATcJeNd4P/UJfbM3jDQWv4XOyruKP
	YNZ2uxSt+hlZQefMmbwr2uzay7BA7IlatH5py8l6TYlzmXrQO41YwwbqYVFqQVaMy0weEUAnbQG
	jBRZhOOjf+ftOJicJ+R3/yo1xjLm/xXklNbVdatjrPHY0cT1NskYoHoUv+HKujTghSEheWnfoqy
	nNi5Oyh+2Wdgn1IerbBZcGVU7P9fbX07RruvmggOBZdp+k+LA0p1XbXzKdXQcZLLIYDLXBQhHkn
	DO98syAsWjvbQWQa+iWPdRmTnDwee8iyRyg1tQJecCt1OFck0o5gGyupC7ezQAuw9+LQ2w9VFzZ
	UUD1M8S1ZrODqL8NdS3LYmohfvnez7+qhGgtqPJNKkxwKtU1By2af3oylaJWL+ZmAqogPOuks9N
	TzXAg3klyeUJWnwbOA
X-Received: by 2002:a05:6402:1492:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b432bf16e8mr2720618a12.17.1792763685720; Fri, 23 Oct 2026
 06:54:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-work-super-lock_helpers-v1-0-d0fcb3f2f275@kernel.org>
In-Reply-To: <20261023-work-super-lock_helpers-v1-0-d0fcb3f2f275@kernel.org>
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 23 Oct 2026 09:54:33 -0400
X-Gm-Features: AclHuK9zlK4tzMFGd7noBnaTxOTknDoJhgjCCtyLPmJXdPLrb9-AWs7tjRyMZTo
Message-ID: <CAEzrpqd6bW5tDMox92VJEMVJb6ohzg55KFzZAXCiQNGxvecWaw@mail.gmail.com>
Subject: Re: [PATCH 0/5] super: rework super_lock()
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:42=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Josef's two series (cf. [1], [2]) left us with four ways to lock a
> superblock and two ways to wait for one that's being shut down.
> super_lock(), super_lock_shared() and super_lock_excl() return true on
> success while super_lock_killable() returns 0. And callers that need an
> unmount to be over pair super_lock() with super_wait_shutdown() or
> super_wait_shutdown_killable() and have to pick the one that matches
> the lock they took. Jan pointed out the bool vs int mess (cf. [3]).
>
> So fold it all into a single super_lock() that takes SUPER_LOCK_EXCL,
> SUPER_LOCK_KILLABLE and SUPER_LOCK_WAIT_SHUTDOWN and returns 0 with
> s_umount held or a negative error code. The first three patches don't
> change behavior.
>
> The fourth patch makes sync(2) killable while it waits for s_umount of
> a live superblock. Right now a freeze or remount that's stuck under
> s_umount hangs every sync(2) on the machine and nobody can kill it.
> fs_bdev_sync() already works that way.
>
> The last patch adds a guard for super_lock() for the callers that take
> and drop s_umount in the same scope.
>
> This sits on top of vfs-7.5.super which carries Josef's series.
>
> [1]: https://lore.kernel.org/20261021-b4-super-lock-dying-v1-0-2b35e86706=
ff@toxicpanda.com
> [2]: https://lore.kernel.org/20261021-b4-super-lock-unborn-v1-0-0265eddb6=
dee@toxicpanda.com
> [3]: https://lore.kernel.org/tmw22jj2hn6g6lklme2j3rsfjvmstzpoicvibvmmv6si=
vd66oj@nhc4lng25gti
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

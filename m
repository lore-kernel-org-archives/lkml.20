Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800898;
	b=UFw1Ul746650PxzFDuXEJin6RPiRNDT+vPN1/0gwdktVvGcpBQB/3AhXpONUdUeOghEj
	 K6mN3ejnEZdyLAp894YT1kbqGWAu+PWw4BS71tLDysD9UeO+oj5ajvduy/Hapw4X9a/8D
	 QtjFK9oERPvO7SF07RY6J2uFrMlpEpuJdrB9Q3y99Nky44kEgn8QYFLg1kQzxnbufaUf4
	 73hVhyAJZ/CMleNXKzGg3iPMjH/FTWhxs4lfvO1xnuBoDHyqTaWc6LVEp3yq16b8craSa
	 NWiE4b7AaXIvLIBO60SWHMZHF9Bc8b8nrCdYaSklJThRDO4JKmV5nXVxrATvvrFzX8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800898;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gjE0e4Jpg2/L+9H+FXO8WVtezi6JzsD1ckb0zbLEW4g=;
	b=YH0aag1ho2btboKLt9VX00myrwONL806FGBnzc9igT/SFueCGWcUtX2uZzKW7TSVOjnC
	 sDz068uc8JIekVKMZbfMbgZzLphUh53epQ19ZSb0mwPw3ZMZLrsNWk3SKrRDTZmbNEfup
	 QjxSkd9wfay4xe/zUQKAOnUHd9FJB+lTffBlil0pvEqQUUqd2S4xZrxxUXfKpEb35pxnM
	 v0QG4vUPqooEXaJHdDORZo3LRDBg4jhJJpam2Up6QK6R14/7daMgdlZz7mqzMFWf2L3Jh
	 UuyGb15c39yaqQxzEmJTzcMM5MkR+8t9bf4yrUr9tVUhMGJpuH6g83cezZLtlmlATbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhPTozuL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481B606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AhPTozuL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21021F00A15
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800897;
	bh=gjE0e4Jpg2/L+9H+FXO8WVtezi6JzsD1ckb0zbLEW4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AhPTozuL4KSFCX2IY3v/JSy++FpA7zvwoQWHbMLM8lBoWgCklGVemQWHkd2/Xpcs/
	 JfPwdF40o/ujsRHbnoOSbUpR6WfRt7rmtwljOh2iWLoA1X95eog1gkmHN9kW54gcdp
	 sivOTc/f81cO/jRGZuTUQLFPVZ0KsMbxQ/wTBKC8KPwHgKupZ0pZkap5LX9utCo1aV
	 Jcs7L+dImB+nxFJLhorYA5MOxZULqGH80PdPulfH78QyxDL/VXxFHxb1ffHzos8zHb
	 4e/VVCoJ6xUx+pjRY9P6bo9oG0KAD4GsjmTxb7cpn+w8u9aTyJfI6liEOlKpY52wpK
	 sQ0/TIuI2LN1g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so382838e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:01:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwYuQfg98ppfFgFxB7AOqyisCN7KSQgiLvu8L3yko9IsQ9byobHgGQmOfPHB1RNP6hFXppWZ2K9tHByWWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wqvne7bhNWQoPKA8Nr3eG4SVx7tIV0zsmBgnjUFbvYRIbKLUV
	LThOMSruRigXJq3MwnthXE9f03zb6bGVzurORfoGlJLIuJmAroR5YI8k5fO59OUTf62rxqOgeVD
	uhiFmqHCBlBMbxTalmlai+t9dg3iILWA=
X-Received: by 2002:a05:6512:130f:b0:5bf:b70f:5544 with SMTP id
 2adb3069b0e04-5bfd951f972mr4988129e87.9.1793800896344; Wed, 04 Nov 2026
 06:01:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030082932.193164-1-julian@outer-limits.org>
In-Reply-To: <20261030082932.193164-1-julian@outer-limits.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 15:01:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=gqPPvLC72ioyRUJtDvqO9xUCA9B+vK95smaiEY5a8Zg@mail.gmail.com>
X-Gm-Features: AclHuK9orhwXbJqsVZsNMjktFmZa1Og1q3CM8Pzy0ZRLDTTCV01s2sm6CKPLgxE
Message-ID: <CAD++jL=gqPPvLC72ioyRUJtDvqO9xUCA9B+vK95smaiEY5a8Zg@mail.gmail.com>
Subject: Re: [PATCH] ARM: fix big-endian check for IO memcpy and memset
To: Julian Vetter <julian@outer-limits.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:30=E2=80=AFAM Julian Vetter <julian@outer-limits.=
org> wrote:

> The commit 7ddfe625cbc1 ("ARM: optimize
> memset_io()/memcpy_fromio()/memcpy_toio()") switched little-endian
> builds to mmioset()/mmiocpy() and intended to keep the byte-wise
> _memset_io()/_memcpy_fromio()/_memcpy_toio() for big-endian builds.
> However, the check uses __ARMBE__, which is not defined by GCC. The
> define used throughout the kernel is __ARMEB__ for big-endian ARM. So,
> big-endian builds have been using mmioset() and mmiocpy() ever since.
>
> This is a problem on ARMv5 BE32 platforms like IXP4xx, where word
> accesses to IO memory can end up on different byte lanes than byte
> accesses. Fix the typo, so big-endian builds use the correct byte-wise
> implementations again, as originally intended.
>
> Switching big-endian builds to the generic implementation from
> lib/iomem_copy.c instead is not an option either, because it also uses
> word accesses for the aligned parts of a buffer and thus has the same
> byte lane problem on BE32. ARMv6/v7 BE8 mode would work with both, but
> it is marked as broken and is expected to be removed, so it is not worth
> treating it differently from BE32.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij

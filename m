Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060385;
	b=hvZlLSNBhd3okxFv2EFwAfjkC1g/ld9bjSanpu8heRPouuvZUcvrIRJCxAdU8wFdMjoY
	 uzbPCQG0LyPom1FDUXkchvINbY1dp6LhhR3aKDH12+C6I6MRDVy3McKsPI2eY9i1PvLfm
	 I7VIzIU4bVhHaTqHEEIzUsO/sQ+XDSswb89SaoW47jWBqP0jzAjcdEfwWn+l7i99shMO3
	 z4vYWbTzihRIrmlrV4Vh6Wjw2TaJFO+UtjBgeRIANSMj0Bx5TH2xuVNvjNyF/AonlCuxY
	 7jhD2p5+B+L2AViwwBwz7kfuCgyQiQ/RbT+hQpoFyG4fDxFUs3M23YVZxJhfn31uz8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060385;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NFvj71R+I3vUUj1f/B2usaeSFh/yQzsOo/5M2fDlCjM=;
	b=1wEs6p5FjR08iy13WRec3rbGyInZ0vWa7MfBCfo0v9coQ5DIm9bA9t3zc4JFrwuDy7Ar
	 QEl9As53vlXcHiVy4dglAJEsPMmA8/KgeDZlW9TGI/YSWi/AAiG2SYpCkfAjgfw8PXQwp
	 o58BUx6npwWqVAzAlXmv7ZlwI/mMGklFOzgk4WAB9YEnSN+olBOaXjYhdLQBV3Nutq77W
	 XKpgFCqIJ0wMP3GwLgM5deLSUwDDc1hOxDcT8hwpItvvqzjKgBZeYHj2BxGwtQGvOV5Y5
	 HHb1eHsb3dIy4CQ4KwtjE2l/MeqD/lnU8EPMgB5+UX6z9vM/csoFzoIO5YCLY/214Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsBrWpqV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA38606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsBrWpqV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D414D1F008A6;
	Sat,  7 Nov 2026 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060384;
	bh=NFvj71R+I3vUUj1f/B2usaeSFh/yQzsOo/5M2fDlCjM=;
	h=From:To:Cc:Subject:Date;
	b=gsBrWpqVvPeea8UW8W1X6wu8nhFQdtpfOO6XMRyJz6fkKK4OixBknWQDAI5sMXEG4
	 qmcx0tvJJCWHEfn9tnI3ZgZXO7aZH+aqDMR4yIoBVgbhzzrzEwG50t1zyvgAUsH8jA
	 Y0aPGxZIb4oPEA5ygJAjUYUyABNYb2JbxrqxcoeUqFDpGxJab87PywX1AV6fprp5Su
	 hHs9Z28fmFQZ0ZraXroaHixm4iHB6obwxWZ4u76AlRthDVII5POQf3VxhDZlvzNLQR
	 rvfkZgR9BDpM3C1XW/lj6ked+l2OprwYB7PmmbcpSREprTBXXvDvN6vNADbOLUX1Vi
	 y+du8uKXJG9sA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v5 0/3] riscv: word-at-a-time: improve find_zero()
Date: Sat,  7 Nov 2026 21:46:10 +0800
Message-ID: <20261107134613.17830-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, there are two problems with riscv find_zero():

1. When !RISCV_ISA_ZBB, the generic fls64() bring non-optimal code.

But in word-at-a-time case, we don't have to go with fls64() code path,
instead, we can fallback to the generic word-at-a-time implementaion.

What's more, the fls64() brings non-necessary zero bits couting for
RV32. In fact, fls() is enough.

2. Similar as 1, the generic fls64() also brings non-optimal code when
RISCV_ISA_ZBB=y but HW doesn't support Zbb.

So this series tries to improve find_zero() by falling back to generic
word-at-a-time implementaion where necessary. We dramatically reduce
the instructions of find_zero() from 33 to 8! Also testing with the
micro-benchamrk in patch1 shows that the performance is improved by
about 1150%!

After that, we improve find_zero() for Zbb further by applying similar
optimization as Linus did in commit f915a3e5b018 ("arm64:
word-at-a-time: improve byte count calculations for LE"), so that
we share the similar improvements:

"The difference between the old and the new implementation is that
"count_zero()" ends up scheduling better because it is being done on a
value that is available earlier (before the final mask).

But more importantly, it can be implemented without the insane semantics
of the standard bit finding helpers that have the off-by-one issue and
have to special-case the zero mask situation."

On RV64 w/ Zbb, the new "find_zero()" ends up just "ctz" plus the shift
right that then ends up being subsumed by the "add to final length".
Reduce the total instructions from 7 to 3!

But I have no HW platform which supports Zbb, so I can't get the
performance improvement numbers by the last patch, only built and
tested the patch on QEMU.

Since v4:
  - fix commit msg of patch1
  - collect Reviewed-by tag

Since v3:
  - fold part of patch2 into patch1 and make the RV32 improvement
    as patch2.

Since v2:
  - fix wrong version(PATCH vs "PATCH v2" in cover letter)

Since v1:
  - rebase on the latest rc1
  - Use if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))


Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB or no
    Zbb
  riscv: word-at-a-time: improve find_zero() for RV32
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.51.0


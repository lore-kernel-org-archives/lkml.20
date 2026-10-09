Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0AF182D6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590660; cv=none; b=lGENT16Bw0nXaDG8MNs4O6Si0B4k/jg6JWErf35yiygPI+jxj9630vf5uAkXuyIUTTLhofb1Kmp5vg6yHajz7383BzWLhZn8Q10zlRtuGI/20l0hU4ieg16zJpTZzCYLJySsLKSx1GPqss4tkruFcUDbhUFK+PA5+PEhP5Xxpio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590660; c=relaxed/simple;
	bh=f/CIerXHKQFTESvVloEKwCY8lnOfc/62FyY96B44uHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQsZGDPle9XsZVyNf3D1XSzRoinGFmM7qdReKA4L8me83e/WDbEH79ig+Uv68qZs+Gdsr2PO8JjR+p2WLdRZr5u1653ya81uuDyD+gAfGLpbnc350CCyNFt4hSPvTOIqMuOKcNoNrZtQ3O71l54Zz3HkoyYML+zMfpxtyEGhME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Snrx+lw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Snrx+lw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9421F000FF;
	Sat, 10 Oct 2026 00:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791590658;
	bh=NFvj71R+I3vUUj1f/B2usaeSFh/yQzsOo/5M2fDlCjM=;
	h=From:To:Cc:Subject:Date;
	b=Snrx+lw3mk8ALrVcHbk095e3kJ2a5vI0eBAI5Em7TH5cJN092h8reP89wnij3dU3K
	 Lz1ikSFhjjTLr/XHZSsxiMZkadI4tP2OMJjRzwN2qXxUiNcgpl6drKwFoiTk9z/pRz
	 kX4HwTNYX+7dBGLH6NYgwSsVACPhkEKIZRqKXBuU5N4mt88LEtUhoJhFjbI3mREa8+
	 koFqGGWDX4DoOFV4S8jdQC0zADsg4AS62Od2lDNR4TAurhP+Za4gYL6l5FY+Bc8A6U
	 Z+aU82jUBVjnRqiOdRMviO5OPayglWkwtnRd1BmA9KlmcFn2LpXj7OlCC2jgcUIRHt
	 2frbv5b6emnGw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] riscv: word-at-a-time: improve find_zero()
Date: Sat, 10 Oct 2026 07:44:17 +0800
Message-ID: <20261009234420.29425-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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


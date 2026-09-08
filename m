Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB04492E33
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788912781; cv=none; b=XFo/gy5N6F9AhZwmUnjt2jwNr8MtgRNz59ONBlGOQnA8Q6keRd9MUii+hOGsC2UHNLl0fJvXBi+8pWkp/apzT8XzyymDU50ul3fYlbjjINawu4cnMa+febMLRdaKk3GsfOV96v/lGiu/ZFI2AOdxsuvRJAtKClHv+tJIfwCB5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788912781; c=relaxed/simple;
	bh=WAtG5G4LrU7x0zqFaY/6gjT+qm6lLKh2KeA4XZ5W7Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsgUMx3btfx1PaRt0b6EvduGdpGLmPK27WXzRaACfd3b3AwEDAhETxRx2VmnFEJaFKULIMJadAj7oo/IdN7Mb8lRwg4rc+pS9sZlg1dFUpUHPXkzwpPp2LQYDDN0gEYHJ2/wBpF8hJSy+YcCjeY8Rxff2qoQgDa8XGjrpYRCDus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgeWwwaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgeWwwaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAD31F00A3A;
	Wed,  9 Sep 2026 00:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912780;
	bh=aHlmPL6QBAJM0yWWQKBL0jzKhUApocNgYUMEhjQYmOA=;
	h=From:To:Cc:Subject:Date;
	b=cgeWwwaZTplPX21uoVIX1qisk1UxgM+t2r9k896OCRsrt4AVQYzQtqKW5wcy9978p
	 eZoz9Ywm0b/6VlfwMXGwJpn3Zwrpne/e2sLvW7PEI+/g4267hAm14k6YdE9cBk8KOL
	 9/TVqhc/CfQwizoaxhs9EyQtq67UM8EBpG05BvJC12VVb6dzo9k1pnuQLAUTaw/axc
	 ewdB7rU8DlMmuAGR1zh1Oi0bDf+UNJM3jTJRL9AsMJa279F4WVOPA4dSdkJqlDt0FU
	 dDf5c8VCBD0QGgWOA6+GxfxNKhRmmgQlq1YEj++/kQ741/t9cRDgJjMc+aEbFvKJHP
	 Rhu8m5lWb5O8g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] riscv: word-at-a-time: improve find_zero()
Date: Wed,  9 Sep 2026 07:53:09 +0800
Message-ID: <20260908235312.8440-1-jszhang@kernel.org>
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

Since v2:
  - fix wrong version(PATCH vs "PATCH v2" in cover letter

Since v1:
  - rebase on the latest rc1
  - Use if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))

Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
  riscv: word-at-a-time: improve find_zero() without Zbb
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.53.0


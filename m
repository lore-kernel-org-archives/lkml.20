Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896510;
	b=CtRu1ER2nKMyudfSOeBcQYFkMSecsZOArAFR2CKi5E+ufQSqQL659hDstIeWCc6ya49Q
	 gc+x1qp9/WRFSIJ1j/hzK64bvL3paJ3to9FVE+IIzNMfvKq/E+NN+VMnFiCQ2QuzN/5Hu
	 QGRs1w02myLnLZmUepktC9X82KOea3cdaVDgiD+Rgk+wxwtPoU1+rz3F2KYaahnQDOYrk
	 CzWWZ4b0lNL/WgPBXonRYY1xFUDq7dEuBpe6HxZLbGjE29XTqpC1gCqf+5SChw121A6Eh
	 tBIQbZDGa+OjdMGYE/BfT8RyOx645W+CPtxKaRSbrFKrycYElPfF0NUeAAvBVhdM73Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896510;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GqcWEQ1VRg+ccd2eEjcUctdPiQFmVOTmfqLuCh8z6ec=;
	b=NmKC/hfLRcZgOEQJY5dp7GntbMzEywKosIZweC54G96jdLVI2FRDX9tunimMlKDepidx
	 ryWZ8lctwKRSpwM//P1Aq3jk/SXrXEdcz6JDGZzyQrOa1gTvHpnQpEBncrLURtlTZRz9+
	 JWfYIQquGCUlL6FJv7mYLgvHYu76EbaHEYUhtQjWjIVQ9R1jKH5NDg65FraSf2eEi7Iwr
	 aDkjmeX2p70eB1xkmZ/DDsL5knGvJSeuxRA/xuC4OahsuC7cwliCVkquO4eqJ43LrfuJn
	 45gub1qeLM8tiBzsZB45yFelxJozoDdscgK007q3vmnnaeZAwkHF8CXKWDb1DgiUzNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+j7Y3YJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62B606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+j7Y3YJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EBB1F00919;
	Thu,  5 Nov 2026 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896510;
	bh=GqcWEQ1VRg+ccd2eEjcUctdPiQFmVOTmfqLuCh8z6ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H+j7Y3YJjsE20Sue5GfwqQINtPxgqaF84BY36sEXqgIR67MJhZa7kQEHayZQLspZA
	 y781Nu26erj76D6fCE04haQsfEl+BH9Q8c0o1tdZUtzO7FyGHfYMJtfmt4q2+f74Uq
	 G5p/hA0y1kY4Pz7NpL16tJK/bcUpbgBZretJqVwYAhOfHZWNGHB2mMP12bZ8Xt2hZ4
	 I5Bet3pNOnCukp/14WqG2twgFL739fTxd6mQEJexaBSNm19WiNgPc12Jpa6fUIyPvB
	 OT97GMMdtrv4rLq7knsvNNlxEq1SWWgG9sko6JjhV/mJiynlOYNRvfUNsKpWMeYcOX
	 eEtiZdT/3W37A==
From: Arnd Bergmann <arnd@kernel.org>
To: Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH 4/7] x86: require minimum 64 byte cache lines
Date: Thu,  5 Nov 2026 17:34:35 +0100
Message-ID: <20261105163440.2381661-5-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163440.2381661-1-arnd@kernel.org>
References: <20261105163440.2381661-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

Later x86-32 CPUs like Pentium-M, K7 and Atom use 64 byte cache lines
and are incompatible with kernels built for smaller values of
X86_L1_CACHE_SHIFT.

Pentium-4 CPUs have 128 byte cache lines but are compatible with
cache operations that expect the lines to be 64 bytes.

Older CPUs have smaller cache lines of 16 or 32 bytes but work
correctly when X86_L1_CACHE_SHIFT is set to a larger value.

Remove the per-CPU tuning and always build for 64 or 128 byte
cache lines that work correctly in any CPU.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/Kconfig.cpu | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 832e4bd9f6e0..382c9023c855 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -180,8 +180,8 @@ config MVIAC7
 	bool "VIA C7"
 	depends on X86_32
 	help
-	  Select this for a VIA C7.  Selecting this uses the correct cache
-	  shift and tells gcc to treat the CPU as a 686.
+	  Select this for a VIA C7.  Selecting this tells gcc to treat the
+	  CPU as a 686.
 
 config MATOM
 	bool "Intel Atom"
@@ -250,9 +250,7 @@ config X86_INTERNODE_CACHE_SHIFT
 config X86_L1_CACHE_SHIFT
 	int
 	default "7" if MPENTIUM4
-	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X86_64
-	default "4" if MGEODEGX1
-	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MGEODE_LX
+	default "6"
 
 config X86_F00F_BUG
 	def_bool y
-- 
2.53.0


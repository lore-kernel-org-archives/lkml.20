Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403341;
	b=qXR1ZWb0sPCA1NFXOHZUwVTaNIh+EwOcK/hdeepXLZkDHhxuWwFZIPge9o4rK2/euVR7
	 aPMeCaXG/bmtl0AbaIYZ2sVsokNlxronLKLvPVS30gS7eW/FjihL7s0OBZqsRbQH4zUZi
	 /TLMLkMdO482CLQheaddbrRa4n+YrpYctQFpZfAF2PgF9h6W+0AdADS8/CXBgR2nG6p99
	 vQMN9PJL7iWHqkjeHowgi0LDtXxZTgqXK8sfakfsA37ka+/cpE83yM1a7avAfqcK3o0Ms
	 bdFIYQ1vZF/7Xl6XgTeB0LttfOWNV8GFC9fqHlBUC2zlRds7vaLzE0VEpj45E9sDLXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403341;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dvhrh0mRmdWIgqev80KamhFe7z15N4F4O46RospQWoM=;
	b=aK4wLs/OSgarqr1FzZebZgpoPylVKdpeSjqr3swe6uKE5XfpKvFH+d2OM9Ft47LJwh0D
	 c0puuJgq5gQmW3InDlgENzfeX7u2m+js4UcalDV9QXt+DJ7hCNmcuOIisqm5qnsCumcLW
	 wSJGIGQZm4H9d7mIa7wHX64MkVgcgfIu63vDTOu4rm40oPDzfpmaSb2tUSVbyWTCWCtkt
	 i3x6dPbtGEpozWuklpekWlJzUfsVogQYKagSTlh88+mRrfuga1yPBrw27VrZ//4kNn19A
	 mZ+W/gAJbCFedeXunfMubzDn5QcH9La0C2mX9hHz2PW7kDiedlSF0R7o+JjHmzK+cCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NmLrpBJx;
	arc=none smtp.remote-ip=95.215.58.242
Received: from mta1.migadu.com (out-242.mta1.migadu.com [95.215.58.242])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2D606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F2D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NmLrpBJx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SkUHvCU4roOR9UyMcUp1BhEi35tvG/nfO15orsw+NMs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794403338; v=1; x=1795008138;
 b=NmLrpBJx4lVLvi+e2R/IlDopMm95pujW8QCwllQxcgDHCymnAKVLNNpxLnonKnWKNmWjVjpA
 AbCMo8dBcrJmwT5yohxz6ngTNbe+HYzk7kcfl10lZZ8I9ADpr7ykdwdBalCTScbVCYQIYs3ZOk1
 5JD3MsoeqXe8kSFyfFV0hF+M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 17efef2c32dc631b;
	Wed, 11 Nov 2026 13:22:18 +0000
X-Mizu-Trace-ID: 17efef2c32dc631b
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: david.laight.linux@gmail.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	terrelln@fb.com,
	tglx@kernel.org,
	usama.arif@linux.dev,
	x86@kernel.org,
	torvalds@linux-foundation.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: [PATCH v3 0/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Wed, 11 Nov 2026 05:20:51 -0800
Message-ID: <20261111132214.2979125-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
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

Enable REP MOVSB for copies of 2048 bytes and larger on ERMS CPUs without
FSRM, keeping scalar copies below that threshold. FSRM CPUs continue to use
REP MOVSB for every size.

This series splits v2 into 2 patches.
The first changes only the scalar register allocation: RCX holds the count
and tail indexes, and RDX is the small-copy data temporary. The second
adds the ERMS size check and adopts Linus's FSRM entry layout. REP MOVSB
replaces the existing jump to memcpy_orig(), with RET remaining in
ordinary text. ITS therefore selects return handling using the return's
actual execution address, without aligning replacement storage. Keeping
the count in RCX also addresses David's request to avoid reloading it on
the ERMS path.

v2 -> v3: https://lore.kernel.org/r/20261104222806.1826508-1-usama.arif@linux.dev
- Split the scalar RCX/RDX register swap into a preparatory patch with no
  functional change (Kiryl Shutsemau).
- Use REP MOVSB to replace the jump to memcpy_orig() on FSRM CPUs, keeping
  RET in ordinary text (Kiryl Shutsemau, Linus Torvalds). Remove the ITS
  replacement alignment, since no return is copied by alternatives now.

v1 -> v2: https://lore.kernel.org/r/20261013100442.2658311-1-usama.arif@linux.dev
- Raise the threshold from 512 to 2048 bytes. REP MOVSB was slower than
  the scalar loop for some misaligned copies of 512 to 640 bytes.
- Fold memcpy_orig() into __memcpy(). With FSRM, "rep movsb; RET" now
  replaces the 32-byte length check (David Laight, Linus Torvalds). In
  v1, the 13-byte empty FSRM replacement became a jump that FSRM CPUs
  took on every call (Kiryl Shutsemau).
- Do the ERMS check after the 32-byte check, so copies below 32 bytes
  skip it (Kiryl Shutsemau), and keep the count in RCX so REP MOVSB
  needs no reload (David Laight).
- Align the FSRM replacement so that its RET keeps the ITS return thunk.
- Fix the comment that called the return value the source input.
 
Usama Arif (2):
  x86/lib: Keep the scalar memcpy() count in RCX
  x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM

 arch/x86/lib/memcpy_64.S | 78 +++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 36 deletions(-)

-- 
2.53.0-Meta


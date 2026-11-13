Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554204;
	b=geAiXvaU8jfxlmNSCXuPqvUBeLDM99P8qmIzINnmiGjWx/Ruih2u8vWrguNBIn46Wa6C
	 8CG0gAdLcJirR4KtR/1BoaQheiDBDAaB+hEd/FZJ0sxL50gHX948DgoQPbhyxhNc8b608
	 0s1KtWcmVRBhon6JuXQYufHNMsoVNG0x5ybkRFSHY6gl7f/aGcLYcSTiZwEF6RjIWiloT
	 +xPdg1d6/gdHMcqR7doqNM3IT24SNW0UY4LvuRGjCtRlVf5p4VPzF+VCWKDaBnv4GB3vt
	 1r5zZAG2gS1nCWEkzUzvAz/+91eyMrRLDSLSU1WE1THTXgQZty6aRtUibel6sxZdv3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554204;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SlgWhN9GaJLMebYSO8+fABWRsOhCLV84A5VqjbhON4E=;
	b=T/nYxBcrl3/52BFlX91h9rEhD6wMq9EApKg3X4J2QdAmH3ZVy1yEjsaCu2iJ/+2b05OK
	 NOXx/hFxfoJEOTqQj6awD8B6e3Vm+fZ7Qy2C5ELmMmSP+V/tGijlwpziVZl0R7GBsandi
	 rUyEgVt2ZMQBEATzAz6eOiwiYoHGiR/dXTZkrLliYllLi2dFKfG2gKnthrVSErKyDQE/k
	 7ikpIgZ0ZdK5SC+KIaSIdF+FKaj6MxCQQAKQd1mle18gcB7ePC41iaqbl9KSoVDMF8Xxu
	 GrckcIsU4CZ4EJ+mGXNy2OHheHPw+ltIdthAL2gRo/vg8NEaCfnRnSMoME7OtQ7POWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrQW+y5Q;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD3606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DD3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrQW+y5Q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RQ8pA60G+MeCru45VDvMKHyN9yX33rvbO0twB8IXd74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554201; v=1; x=1795159001;
 b=HrQW+y5QO8vDTKAsYV89vMRox6nntGzm8OdLlVtRs/Sid3j/8LzLUG6vyjA2mLzXM5XR2cAp
 UdK3wBOwwKR5LAYG6akoZsmC4N5sn1/iNhjiy+KzjmytkpqSsqPgRUG8BRwEzpZKIfxVcCmhkDX
 v4qAncDQRc4nguv+KYghDYAA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f7d0d625172132b;
	Fri, 13 Nov 2026 07:16:41 +0000
X-Mizu-Trace-ID: 7f7d0d625172132b
X-Migadu-Flow: FLOW_OUT
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	WangYuli <wangyuli@uniontech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: kgdb: Fix break size, insn patch and masking
Date: Fri, 13 Nov 2026 08:16:11 +0100
Message-ID: <20261113071616.219623-1-clement.leger@linux.dev>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This small series fixes a few problems that were spotted with kgdb.

First patch is the use of patch_insn_write() to set breakpoints instead
of copy_to_kernel_nofault(). This fixes the use of kgdb with
CONFIG_STRICT_KERNEL_RWX which maps text as RX.

Second patch removes the hardcoded epc += 4 with BREAK_INSTR_SIZE so
that it works with CONFIG_RISCV_ISA_C.

Last one is more of a correctness fix with respect to jalr instructions.
ISA specifies that the target address is computed by masking the LSB to
0.

Clément Léger (3):
  riscv: kgdb: use patch_insn_write() to set breakpoints
  riscv: kgdb: use BREAK_INSTR_SIZE instead of hardcoded value
  riscv: kgdb: clear bit 0 of single-step jump targets

 arch/riscv/kernel/kgdb.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

-- 
Clément Léger

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554211;
	b=fNbzfZvtiDnsWcE1kphfA5E8RuVpRre5OR6FXKCmyYgYCAMzq29uX/qt1CwtXicg4PFX
	 Q8fgKHEw1i484xsqE5jutNccaS484A7FPhZFx+vGzPSKAirXNXB/RSyDD3L705xoaLUkg
	 YUzRCcLBy2S8U7ossftNGcHdrBuI6dOgXBSu1wGteLREjrht8Q3orNMGPPjIFhlbtPpL+
	 +JQS0YYWbY3I6Ps7et30l+7j+TPqJDXawpSfFgRdn8E+KwtvasetoFp4yLA5jTgHT7nqT
	 khEz2BZLhVLMto388gywqYZOQIhNOGTyDHuDIXy8TNX3ApcfWMOZrzplh0JqGcay5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554211;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cmhjlcc9wJVtem4SAw+5SbMmWK+OqLsq7s+Ps8ybe1A=;
	b=v36wAK0xDWujiPrGoeZ3fgBbEraaLMDlQHoWKbOYVqdjjMOeMVnPpf35coRyvE7DV/lW
	 SoNr2APA7uNKtWlkK6UI33STSVCj7vRPy8ksJgiraAq4RTkaF9Ah0mCRlozHtMuLIal0/
	 pWT/pBy6WEDoyZq1Rfm5wmwj7j1vY+EJLOaIJPgBIh5Qr41/rYVGZcUmF/yk2oSplbOqM
	 nlZsCv6v2U9snhL6n6c9jeRdcYa0Wzw5rXv9KFAw6HtYpekdFn6vKB1bliHwmvzhuJ2dn
	 xL4ZteTapZzhSKBJdb5p96ZunkqoedHT1k9yJmFkHGqV55CbSiL0pt/Mnz01sCVFM0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ua91YIgP;
	arc=none smtp.remote-ip=91.218.175.218
Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC724606A8AF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC724606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ua91YIgP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MlAH7VVzOoKTqgoo5+r2zLsQBkmZI7/9xOBOGcbvc/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554209; v=1; x=1795159009;
 b=ua91YIgP/VnkPuSdPKiD5Of5yIeP/6g9HpC4luBogIIkE9kfJvtiqWGI2/72Z7nTyZRSeCrK
 zyaTqt5Fx7SUdRiCG75h70LR1sJE3xBu1/zbCvb8mQ4qeNvKB2HIZxnkhA1/NumBVe8f3fsiXZm
 OT5gUt5UK56kJCtTeVc/z+kQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e03740ce7c941dc8;
	Fri, 13 Nov 2026 07:16:46 +0000
X-Mizu-Trace-ID: e03740ce7c941dc8
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
Subject: [PATCH 3/3] riscv: kgdb: clear bit 0 of single-step jump targets
Date: Fri, 13 Nov 2026 08:16:14 +0100
Message-ID: <20261113071616.219623-4-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113071616.219623-1-clement.leger@linux.dev>
References: <20261113071616.219623-1-clement.leger@linux.dev>
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

Per the RISC-V ISA, JALR (and C.JR/C.JALR) clear the lowest bit of
the calculated target address, so that auxiliary information can be
stored in the low bit of function pointers. kgdb's software single
step must compute the same target the hardware will actually take.

This mirrors what the kprobe instruction simulator already does in
simulate_jalr().

Signed-off-by: Clément Léger <clement.leger@linux.dev>
---
 arch/riscv/kernel/kgdb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 121dae87dc68..647560194d8c 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -48,7 +48,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 		if (riscv_insn_is_c_jalr(op_code) ||
 		    riscv_insn_is_c_jr(op_code)) {
 			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
-			*next_addr = regs_ptr[rs1_num];
+			*next_addr = regs_ptr[rs1_num] & ~1UL;
 		} else if (riscv_insn_is_c_j(op_code) ||
 			   riscv_insn_is_c_jal(op_code)) {
 			*next_addr = RVC_EXTRACT_JTYPE_IMM(op_code) + pc;
@@ -109,6 +109,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 			if (rs1_num)
 				*next_addr = ((unsigned long *)regs)[rs1_num];
 			*next_addr += RV_EXTRACT_ITYPE_IMM(op_code);
+			*next_addr &= ~1UL;
 		} else if (riscv_insn_is_sret(op_code)) {
 			*next_addr = pc;
 		} else {
-- 
2.55.0


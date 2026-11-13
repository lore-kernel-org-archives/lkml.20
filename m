Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554207;
	b=NYFc8vqHwWGN0YkZwpMVmGiSmxjWrY9pGnYCjS3bPJaqfupejcz5IxUD3IsSrPnfj/Xb
	 29tF1MOtw/55CHENwRV05BxbRtgxPpitP/PhlfrjsLR7AsjC+ixQPMVPObw+MIcKlM+1v
	 grNaaLFVqemy/a1l2ZAETvAG9Ez7JZOWNVeuPlAvYILGb3qFelsT5d5KJ4W95drGTSjhj
	 fIrsmHmWfxkTYNQ/nQqGLJmhR6GEzwbohfc9ZGSosRPbXTOXR9MButBfSwDTFSpuVhQ9W
	 oN/3EL1Ct/ThbRNuMJdXwtX7sKt7oI2p91hgVXR9SidVo6OgXZVdNywDe+iCpWKUPUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554207;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OhaEL51CLXcvLQ9HHnHXGASUdtFhJyIzcmlhJzZi/k8=;
	b=Xz1iBKXNXMFYnRmYlekhG2wDQfEcdK1kk2lCzfDSoQL5o3REGL/ICSs0jdGxYLzhz6I8
	 4kyZw6nX4lWtZbUJuXSnKCzOcJ2t9FB8+QBH1tqi4hCg0cqVeZGWDBg7cpwzsvfIW7juw
	 ubQRUcsn7EkDBBTWA4Same27E+IHsWl95f53eggeEiYa70mVTywy4vzZOGhRSiycldbdi
	 AkVQu88dSqVyhR2EHedMmVe/TvEjNmWPJ6FoWAk0+eabjXQ+2zSr2AbA92y/kO50Dx2mz
	 grEB7XXFG9w1sK9vEKwHnPNxg0ySR0St71FxqLyNzB9X+uakexXXtVUOCPmJKl7ybgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K8Lzlh+G;
	arc=none smtp.remote-ip=91.218.175.215
Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A0606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610A0606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K8Lzlh+G
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gK3FEv3HtB5PH2bOaJrgzUy1LeJIdaerJNWPT7yY4Ig=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554204; v=1; x=1795159004;
 b=K8Lzlh+Gr6lPfpxKDtsQAVwJE3B6nrJNAhr4ZcjdWP0wzKwvVcIQwWELpeh4zlwF2b4WwfjM
 8J/ol2avkbzc4Sx3GS1wxlYCaSc2n7dixXqmxnOfN/mfHKVE2NZpBP8cB0MTczrtRbht0fu9sFe
 80yukW2L+nCyB04Kn+UhsBMg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6754d430aca00714;
	Fri, 13 Nov 2026 07:16:44 +0000
X-Mizu-Trace-ID: 6754d430aca00714
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
Subject: [PATCH 2/3] riscv: kgdb: use BREAK_INSTR_SIZE instead of hardcoded value
Date: Fri, 13 Nov 2026 08:16:13 +0100
Message-ID: <20261113071616.219623-3-clement.leger@linux.dev>
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

Before commit 550c2aa787d1 ("riscv: KGDB: Remove ".option norvc/.option
rvc" for kgdb_compiled_break"), .norvc was enforced and that resulted
in a non compressed ebreak instruction so the +4 was legit. The
previously mentionned commit removed that option, leading to ebreak
being emitted as c.ebreak when compiled with CONFIG_RISCV_ISA_C=y.

Use BREAK_INSTR_SIZE so epc is incremented by whatever size the break
instruction is.

Fixes: 550c2aa787d1 ("riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break")
Signed-off-by: Clément Léger <clement.leger@linux.dev>
---
 arch/riscv/kernel/kgdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 4ad817698af8..121dae87dc68 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -365,7 +365,7 @@ static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
 		return NOTIFY_DONE;
 
 	if (type == KGDB_COMPILED_BREAK)
-		regs->epc += 4;
+		regs->epc += BREAK_INSTR_SIZE;
 
 	local_irq_restore(flags);
 
-- 
2.55.0


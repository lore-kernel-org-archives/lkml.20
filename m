Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10BA3B6C0C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550523; cv=none; b=LIoFxb9JnBAT+FENjDo+FfGbzb2fb3nvUFtuotJ9RmYHQpmTIlzaOg9jBIIdlmGlXrhQTL/8uIT1K5Mtd0QBh6JkPU9rXPW1bnsVA3aQTifCICgxY7ZlGufr7M/KS7UHY/SBB6ifrqAcdD70J8P6ij3vnMDOGuzfOVEH69D46po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550523; c=relaxed/simple;
	bh=xkSLCh845EsJhrdCyhg70nL7NkB5a8zwpqs11NLsxss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pb1emGMDWZODyMN6i1lY5TcfDdRxemydddEMxPwS/7IcAmxYlrMRHwex8hQ8iOlvuw7M9Lbn3JSaC9llPDN+cT+kfUC7nkqieR1QSwy4hiIaXrBWwd5WFnQJAGmBy00KDzy07slw6vUJF1xfmuBVgDMZ3QPCruXYK/pqx/abVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4UphsD2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4UphsD2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1378099f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790550520; x=1791155320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKp73jGG5LTsQWZvXwxxCZVQVZBAoFZGjXIJpSRfgkI=;
        b=D4UphsD2ivi88C+drIBgNdYkbpymwEOoohShRjWjN0yQdRRXqh/O+Nb1iT3d5d7IE5
         nSUj8LmBoPjMmMKIygFa1jfVxBL7csun+pbSVIgdch++/6W+8E6wLC78jF/SLxJDB10x
         sd+nfgA8xfQaa7bssu6+eThl1N2UEIVS9BNZLz5HeXJOnEs8huvRW7lSBxsw+O1SzuOn
         U/in9C7BdkuWs0xIcRBH93M/9oj7XvX6nG6luctLdMTbf2/tNZSiVObF803kVx3HMnsa
         WfxFZJ0iKAsxLmHMSL5OmLwzaroe01pgq+H/Bw3zCbApuEFHYHHRBQE4DiLkAsFEJBn3
         JK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790550520; x=1791155320;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKp73jGG5LTsQWZvXwxxCZVQVZBAoFZGjXIJpSRfgkI=;
        b=B6I6nYXaKNqw5Rn19z2RPsN8FJ0iWGFkJwP+ckL05fsdtgeYWMgokTzsOCDoUtkt5L
         x9bpJQIKSQFNItAvqBP7saExeRVvjQnKNPv0CDYcMd2+p7h6LG6yUEgYjgvTYUjzluho
         kzuOkBouS0Ki4/IZDas/pqDdbqnGbqoB+aUqUdJ0qa5az9nD4yA6f2n5E0lOcFqtUtOy
         nSdJwSkUegmMRPvkPGrklw9P3zC0qAz8yqdRmC/C5763ws355bvol0fAywAxZog5lN4+
         q33sWD71qoiIoCvLAyoEn1euCX2d1EN6ySXr3UYalF3QTRqtvRFXkr+oY1F2NHPPae5k
         k6hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT1kvh87NQ0ZtyrQ4jb6WH5nja45+V2zf8UIj7+w+oq31CJbF0G96qnFRdlrvIDG2jJUAXreM/sxComrE=@vger.kernel.org
X-Gm-Message-State: AFuF++nnuDSQZJK530P6OOjalMN4/PSyG+8Ry6AagIYIRMRIQgkvP2eS
	dDlHHSpZGVTHUF4aAvrOIrK11JRsvAqnKWOL617khJQHUlYg4EuDGEfX
X-Gm-Gg: AYBFou0SNwp3uT2ikoG/GZwaI17Jf0EGOjxQ0wdhz9dyUk50dvi8Cx7mf77kDkwSKvD
	7vkBrmNpbtD1vqar3pJnttqAhF1hygCO1hOQVdlsj/E04WEEXvlnFetocVNyC/py4F7r8xJAwuT
	rze/bTYpoHk8QBwrNoC9qzDbv2lc71Ezbmsb106cwOP6xQRMe1jsvA9+1W2a0FNGyY0A+o/YqHc
	QCVd8FFldaAzc96fa/k+skFRk8i8GURS2AtnI0wlE8esew72Je/+vtlIdlPl5Aa0qcMKPW6HdQU
	5D3e7h3sYyMaW9WyWGYlnFgysW0wY8pfMGVwCc6f30zL6rH3FV4x/ZE1CBiIlcfbbLzAkARJnox
	uViVg/Ud3noy0U8XYLdaFCy8uysZmIMTMCWgRE5+0ewowH4dfhMxv8SIezmw1p3SBPv5bxPnA00
	al/OUBwd6+eDLQaxV9tx4JqHTD9XqReCS4tfkQ0mH1jagfuPAxeYPUohVnWqKlq7JgJGyXW1cpH
	5yT0tU=
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr132620435e9.31.1790550520067;
        Sun, 27 Sep 2026 16:08:40 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f0e79sm145623205e9.7.2026.09.27.16.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:08:39 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH bpf-next] bpf: Fix bpf_loop() depth check to use 32-bit max for nr_loops
Date: Mon, 28 Sep 2026 02:07:26 +0300
Message-ID: <20260927230822.417683-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bpf_loop() takes a u32 nr_loops argument. At runtime, nr_loops is
passed as a u32 via the BPF_CALL_4 signature:

    BPF_CALL_4(bpf_loop, u32, nr_loops, ...)

However, the verifier compares callback_depth (u32) against
reg_umax(), which returns the 64-bit upper bound of R1. If the upper
32 bits of R1 are set, reg_umax() can be U64_MAX, causing the depth
check to remain ineffective and triggering excessive
push_callback_call() invocations until the complexity limit is hit.

Use reg_u32_max() instead, matching the 32-bit range actually used by
bpf_loop() and avoiding unnecessary state exploration when R1 has a
large 64-bit range.

Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 kernel/bpf/verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 0eeb498db9d3..8d8923ad5094 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12184,7 +12184,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 		err = mark_chain_precision(env, BPF_REG_1);
 		if (err)
 			return err;
-		if (cur_func(env)->callback_depth < reg_umax(&regs[BPF_REG_1])) {
+		if (cur_func(env)->callback_depth < reg_u32_max(&regs[BPF_REG_1])) {
 			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 						 set_loop_callback_state);
 		} else {
--
2.55.0


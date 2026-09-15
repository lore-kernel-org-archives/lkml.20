Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCCF3D16E6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438459; cv=none; b=m3VSlwKdqri8K6Wn3aW0f+vV+r3e+bEG0D3jNf4i8WZCNf8M+3j96NEMnWyaVSXT0+1SltSYXS2R66y14Ru2swdIw+6cyHGkkfU/dkzRCvdS6NBtteeI9v+10wA+nGc1HSSLQCJmjmnICjdQqYlU17jXC49YRNimDQ27M/3cugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438459; c=relaxed/simple;
	bh=OMt5HhDiTDnWRUkq/1fc/fNuEDADUxzcUrOtLkkmOMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLc0R6IZrPTySOzUt/ThqLeIOkI+miewL5qPxNSaOO847yIwhL7RVdL2WQWYMrg8oYkj/HqJp+uFtdCX1oB+xt773W89M+sckvysX3cVEfZRM/IUwvEOINo+cjULQbyaSCOzKzqxcnreCmZ/ig9nkzTG7+i5QUhFYHJ+4Tynnec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgHA3j3a; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgHA3j3a"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530301ff353so27975891cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438457; x=1790043257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaYOd8zTfYAMpBFvUyf33rw4Yl3HKUzIa2TDVLlOUCY=;
        b=IgHA3j3aC/IdmxXs2gFnyLB2qjwzIPYYhyKypILSKuEjYjnYDr9FXyAgjVbsw84Nci
         yNPrOFKoJI4hKLbKL20qFHf3HOVq6O1QXdwdUAxI0uFtOOfaBaGMontckPVt7evL0opE
         s3B6hi9Ap7P4vmNcrBN1uON5glCqfBSZ5xudNpoc3nSj25YjxGzoAnKX0OChFOzgtNsL
         ceuK2GpEqUm/CbfWFUreVt3qH82NrtXODHTOPADR6xGq36MvX3bi3WzsBLWlcLsTNSUW
         uDxV6qeFjp4ZoxEmeS5JldNidpFTqjOCIahhlC0XH0OxJFA9Mgl/KWk2a8J/VLMFHFNG
         0lvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438457; x=1790043257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kaYOd8zTfYAMpBFvUyf33rw4Yl3HKUzIa2TDVLlOUCY=;
        b=WYQOTTwyyjbizqDtrkBcZ9edddSxx9JSr1V3WDaunHcPheXWcKHsFegMz9fuzfBlYv
         +s44lRSrB6jpcn08UwdRvJprA11H10hB/3J8RmiimJoJ2wCFXB5bZKHCQAux1uPtNYea
         OWBapnAejVuTqHh9qAj+Bxachc9nI6kowu3WnooJ9LipCjFuj8ifzohPi5r/9znyAawU
         2/h5fmDp3RTElxNunIV3Y/pRaIZ+MlmF+7fvhLZstOLnVu6vbubGRrbtSHU79Z7QxbXc
         Aq7zN7T9zA/GdLCJZMZdIMno+PUnh3asnCtYuKMCoPLwRYDMZtcOcPTcgafnyQwg0Mf7
         sgpA==
X-Forwarded-Encrypted: i=1; AKwUvBwnBo4xJRMfLD7B8pevG2vvJpwoY6j0if9yOxopzUGxAcyGkCFoldtlaj8xS4UHwogJ3G56w5fEMIyUnm4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6FuodJqIKRRtthikxvo73rFHdwhV0a9kWpdAmIdXNbSQby+Ub
	CI93b0+FJc7p7nb77nBi+WEYKmPDJ7H3HhLWEgn8Zd2z558lz/jcJuQJ
X-Gm-Gg: AYBFou3zwMt/wXeSytY2l/5FsS8wi5HgbNR5VdaXTWbrp5EUy+UYge4gFjaj60W698M
	QJStDdze9MAkjGk7MSj/flC22+8hVx/4oCxzgSTUUQaUI/iCpjm+mz9dSvY6GFzjC1YqInb1nVJ
	/KP8auT8mwSHL/HTbktes7u1EAgJ7vtS5ICa1UBNiWVKbyFMrkOE5m843PJpSjC/1l/IcrdRWie
	UGVhL4k0O3BGdAjjuXMNB+zC5QTZKLL3iyPzvEjah/18UkhXQmLiW4VK5RSrYM8z9m+ZfifX/iu
	TFZMxpIvIcHyQAg0M+N+/UvZ5AjR6whFcT2tReDqW8HhbPCiWAvXBQWSEosa6l8+cYYzVpkwKh0
	EMZRICfbI0pEeAgQKeU4Zv/LghRNDXfBIgyqCLpRB3qoD3gK7c/H2nZgxfEOB8xEUrvZbz5HPMu
	TpupRabjlNHCuqFh/wqLUriLN1l3pyjrmZFaaApFyyTHqal6Xok1Z9Gh7b5LTIqtLH
X-Received: by 2002:ac8:5908:0:b0:52f:bfb3:ed3d with SMTP id d75a77b69052e-5310cf40d5fmr77338011cf.25.1789438456707;
        Mon, 14 Sep 2026 19:14:16 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm113147306d6.27.2026.09.14.19.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:14:16 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	udknight@gmail.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	hpa@zytor.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com
Subject: [PATCH bpf-next 4/5] bpf, x86: Add BPF_JMP32 | BPF_JA support to the i386 JIT
Date: Mon, 14 Sep 2026 22:13:37 -0400
Message-ID: <20260915021338.1520964-5-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915021338.1520964-1-main.kalliope@gmail.com>
References: <20260915021338.1520964-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i386 JIT rejects BPF_JMP32 | BPF_JA, which encodes its signed jump
displacement in imm rather than the 16-bit off field.

Select the displacement by instruction class and reuse the existing
unconditional jump lowering, including its self-jump and no-op handling.
The shared unconditional-jump path handles instruction zero separately:
its start is the prologue boundary, which has no preceding entry in
the instruction-end address map.

Assisted-by: Codex:gpt-6
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/x86/net/bpf_jit_comp32.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index bbe48b15850f..2d8a3a961e91 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -1821,6 +1821,7 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image,
 		const u8 *src = bpf2ia32[insn->src_reg];
 		const u8 *r0 = bpf2ia32[BPF_REG_0];
 		s64 jmp_offset;
+		s32 ja_off;
 		u8 jmp_cond;
 		int ilen;
 		u8 *func;
@@ -2522,7 +2523,9 @@ emit_cond_jmp_signed:	/* Check the condition for low 32-bit comparison */
 			break;
 		}
 		case BPF_JMP | BPF_JA:
-			if (insn->off == -1)
+		case BPF_JMP32 | BPF_JA:
+			ja_off = BPF_CLASS(code) == BPF_JMP32 ? imm32 : insn->off;
+			if (ja_off == -1)
 				/* -1 jmp instructions will always jump
 				 * backwards two bytes. Explicitly handling
 				 * this case avoids wasting too many passes
@@ -2530,8 +2533,10 @@ emit_cond_jmp_signed:	/* Check the condition for low 32-bit comparison */
 				 * dead code.
 				 */
 				jmp_offset = -2;
+			else if (i + ja_off == -1)
+				jmp_offset = PROLOGUE_SIZE - addrs[i];
 			else
-				jmp_offset = addrs[i + insn->off] - addrs[i];
+				jmp_offset = addrs[i + ja_off] - addrs[i];
 
 			if (!jmp_offset)
 				/* Optimize out nop jumps */

Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05C3D1CC3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438464; cv=none; b=LcaxRSlQXuroqDb63Vn6Li9CwHTVGKsr8wpPnOfWpojLCJ4nJ3UkRX1mojlTsIjGCYafrJ/CM657AYqmZjkqilgnHnv+b9Ke2Qd1l5yuCij/on3f6n2q/PZo3xpr6DKrT2to0zwzPhdALLGUUnPNbtXTGvHT2JAw40d/a0SKtpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438464; c=relaxed/simple;
	bh=/1WQcwweXawSG/8olW4NCuVNsiyfQve4wAhgNUxL7p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOVcVpoplX0mDOzxtsZ+A9nCNmICCFDD5bOC7qd6x35w7wA+L4CzuoiVYeC8HtExMDMP4+FGKYH7tQKQx9Mysc0nobJC7L+DEHL8pz4ZG9HlQVzTe0sJ/7h76WMw2fpUUpkrdGj7tG6DrJqinyV0whVE8yD0LsFLtYJb8SEdIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGP5zmmg; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGP5zmmg"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067fso342451785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438461; x=1790043261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XHejARW/GsAN6R6sQQvVB3X/bf7ngCNqKrc+swjfGM=;
        b=UGP5zmmg2vbhxLI+oOd3kxxhAQOgN8h7nuBtmyQxHqvGSeN6wRICO2m6+VccV3Wiod
         6Wq+gfpDjk6iNfAmP6d1O1JmFTKIvmUbOucmkmNNSXyqQqkFHaFG96ZCMpyJYnxgcjGY
         Kl0rqv2H06RT5pmEdky4/eUgm9AV1/uLfBNypQEYoU/Cz1YRUTuwL2pHhT6HqFKCAQdz
         tPx0fCTMeZ7SfYkDpSm3+vKpTcKkglE6u7WzcGeZFQxmVkkNp5aUsvrmYXiMmogjRQ3I
         jfujHplAyzkbrwQmn1PIwcd/0HUW9VKZlzVxI5QrpbcImfmXylU0qgS1f21dhyP3eT38
         hmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438461; x=1790043261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XHejARW/GsAN6R6sQQvVB3X/bf7ngCNqKrc+swjfGM=;
        b=o6oyQeJt5/0UleEtry03bfogOeXI+HFLlbL0HUuWqYswr/SFdeAI9DqNsvLXNsepgu
         7XhofrRyxtI87NzkAcUGBe/bmZ2HDT759aPlfTu42o4ww6n5fL7130U6I3VlnFhYDAZJ
         C6nXRMmMCe3fZTtXOhS1TzunaQeOcNNHORWRP3p3Col06BMf5FOa75IhnCN+vBNF0Vbg
         ApEvdhY4QWXp4xsCPaQ6bynkJeIVNRfxNNq5/8+YVYWnRhcX1AzDXYyw3HiZc0H7UopJ
         gNgkIL1yqjFh1FMdOVigJkurDCZVzHyaRCVu0PROvk5sW2+4AnkKDH5DL5h3nQDuk92E
         jgSg==
X-Forwarded-Encrypted: i=1; AKwUvBwqOW3R/kuPkcr+iOVWDYauKHsnmtHxRGymu0uZ96h3UNHRaczcyV3wQ4GPoiWE6UH/v9F4KbU6xk6myQY=@vger.kernel.org
X-Gm-Message-State: AFuF++mXIfgJQo5c6Y72V826Mv4YkaYXU5QCg+7hlruLuI2qljP7pfll
	nsAvqWQmvsD6W3IRCyjFAVPCQYecE030y4VBlKGa0W4SBLWJSJSSL0w3
X-Gm-Gg: AYBFou2/cnpjvaI3aYwFF+2KzP6hBPGf1EiVSdPliSDbXlnAmlDiFh83pIU21gMtFr7
	wLIHpM/77pRJmceH8pudz+Ciot9ZXwLxtvGXuZZdmwND8g/M4WqdpHrucnh0QNYZQUxC7rGiHQT
	S7mGWa5ADPx9lIApdgXN0DcHDiep6d5gKhnerQK8GFt4ZxAXrR4ZePn2V/X2929dlKmt0FYksZa
	4JMyykxuokrEJdKZ+R6apj/9lzJiPuejEnJ27v6k+7Fl1T9r87xVlbZY/3EeWUVKPe0gPugomFD
	1jATcedVprFxLFJeQ6QBOjMk64cVPJX/y2IrqvGj8nrGza4j3XaeXNxTBMuFZYabNeM/p94pqIX
	+H+l2RA5Fuwst5zcfqRWU0oce5bdK/tIQgpCZf+Ws/ZOnGsf2TjnuYvA4weeINrQlLQwXxP6pvV
	0flXFMOaNb71CgaPmt2g0700WIYrsXKR7LDN13WAYhSYlmJtAL3hbNZKXr5uCRMES3
X-Received: by 2002:a05:620a:6018:b0:92e:5d44:73fc with SMTP id af79cd13be357-93a297ac480mr768891385a.12.1789438461227;
        Mon, 14 Sep 2026 19:14:21 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm113147306d6.27.2026.09.14.19.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:14:20 -0700 (PDT)
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
Subject: [PATCH bpf-next 5/5] bpf, x86: Add unconditional byte swap to the i386 JIT
Date: Mon, 14 Sep 2026 22:13:38 -0400
Message-ID: <20260915021338.1520964-6-main.kalliope@gmail.com>
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

The i386 JIT rejects unconditional BPF byte-swap instructions, which use
BPF_ALU64 | BPF_END.

Route them through the existing big-endian conversion emitter. On
little-endian i386, it provides the same 16-, 32- and 64-bit byte swaps.
The verifier treats sub-64-bit BPF_END results as 32-bit definitions and
inserts zero extension where the upper word is used. The emitter clears
that word itself when verifier_zext is disabled.

Assisted-by: Codex:gpt-6
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/x86/net/bpf_jit_comp32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index 2d8a3a961e91..bdba05b72ef3 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -2037,6 +2037,8 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image,
 			break;
 		/* dst = htobe(dst) */
 		case BPF_ALU | BPF_END | BPF_FROM_BE:
+		/* dst = bswap(dst) */
+		case BPF_ALU64 | BPF_END | BPF_FROM_LE:
 			emit_ia32_to_be_r64(dst, imm32, dstk, &prog,
 					    bpf_prog->aux);
 			break;

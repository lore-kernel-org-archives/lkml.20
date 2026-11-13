Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590628;
	b=3F0TRQTz/3PwRsCNRczPuTAcW6fTlLePWh/FseiHYCoBt0ElxTCxnYy8csXu75O8R4PC
	 8PWtDRQXKY0WM+7L7GuuNiT66wtiLR095tZYgx0mGSPo1bK/sg/QE1Zo4tb9JzA2D/Jtw
	 iOnzeqNZ+xRk6IGvR9Gp8rR3fgNZ4TuXVPcwe+pzcpr/SqA/kqRZA2bhwLIvSeW8GfpOC
	 tTTvv75Sg1vGcrkC+LE9z7z/l73pGIiofqdBKv4looBorerIF+FUJJaQNIQOrmn6XnjHE
	 fcSFZ+vX4+Pvh5IJJy0PLYeIl1/bzbV3ba3MZkuntIRIOQRIV0mZe1pG7eZ9DWatROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cF9KWNLmTGcxUMihypB/shQsLilE+4ZcqZbL8jRLwPA=;
	b=naW3vIHGDH2yrtTOQH/P/S9pgzU2vfUrpB70MIbHsWZFipbJYyCHNaHZnWjXzW25OKwc
	 jYZ1Q+2R2a9OH9mdJtLJSH23+Lpd024N5TzzL2GoP3IJvFnqK/YrOjw263SHwNrPXDyao
	 8HWOvHLf4vN+upa6QF3iOH6wSztVisO4gmTxUufTwXPudL3oi5VjSyFjeZ3s2A3NKKmMQ
	 hIL8rEBrsr/cM8cQmvhdPWAo+3BtSxm0WUuVK/ipO1IFh3UoM2rrwUHxalNcdSm7Cq1mR
	 pFGWHDO7K6xxzI8aEw0g1ALfQkoTPr3+qmPTtELRBHWISi8TI93tmzqDm/cFFyp0VSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+3539rv;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E3F6075E2F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E3F6075E2F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+3539rv
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c00f291e1so1052734d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590627; x=1795195427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cF9KWNLmTGcxUMihypB/shQsLilE+4ZcqZbL8jRLwPA=;
        b=X+3539rveCIyD3d+ncAyz0R5kfKqSZ4WCX0KEdoq9wRVz0ht5qWpdLE0sq3paWVC6C
         mOGvdPSoriqOdyoHNZVTR5kQXp45FoxjegM5ZMBy2a3oAirlDsQCXXk91Y4Ysde0l8cB
         21nX94hZ3af0NVfB9yaJWcINOXQvgKFZ2HM2e/4T8Beo73U/3ZXlsDTUPqLHq4myywRg
         j20AXAGZNuO0V48RL8/Xy2ti6feWsA3YUZjFMf+0qr7d1ECF1+QzLNFrOT2nIcga78Oi
         6TcqPgiN1IGuEDEGvul1V5kLxwzxsQ8JMzqQ3s1WpQ0ED1bPEKvb6QlXaXgBFpL2bLP/
         seyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590627; x=1795195427;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cF9KWNLmTGcxUMihypB/shQsLilE+4ZcqZbL8jRLwPA=;
        b=oQhh/7bx4Mb8/YVNQ3nN0DkEsayT30ViT09kc9ZVuer78B///Jj1chRjYNiL7zTLlg
         /JIlp8ndCl4nA/sowlntpW27Td20K3oZjPRZgdFfsuK77pB4gsFJDu8eeBrpEq6Ygs5s
         AuHh0UPuw6rkKgjH3X5sbEQxSDop54lbYjOPIwLDCmodjeT7q7T4ANBwSqqnMYjtI7fT
         HEUJNCglx9Emsbnp/fzgbyc4WOIkwFECx/h7RzLoKyWCDGKX71CVUM9t4NTAAmJUOvtL
         H80cAVtKq/o5UiiHiK1Fs5ghZu2G0SjoNcIuZCfDJVtxeqvaktjyl9VvMWAvypxQw/zl
         E2vw==
X-Forwarded-Encrypted: i=1; AL+hErHolXz0nlQ3fXn8C6a8iqwRjrlG4r95yoWs5OPGAEfY1f49+uNlyj7+2sZQ7Jry3iCoErhEhZsdT6qEdKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/plGXpC6LRTxICQr+S6WeV22flKGsvu8LiC2bOF154UCIyGVfK
	UO1VlbXiBBW5Aw5HiY9+NbNxMyzvvch4w/tPnLW0tzhJLvrP/jFZx6ukhh7Y0Q==
X-Gm-Gg: AYBFou2eNyIVBCUrboHEErLI7t+YANR/xmNej/QR+kpUh6/C0i2QP42L4pWcyCrZ5y+
	E226rONxdwHv72uAeAbnNzoXWYvHdoyoupsF+9N2EeW+3xbFj3babBqvRP1bTbtzb6vSTEzYOvJ
	AraZUOcNaWn4Kow+/yccMuJgFA4XpTWRh1F/u+wJzPU4qzzd2kZheYNTA8R38SGO/zs9X8xIeJo
	zylqeAHKmCUkCTQ+9uV5i2/kDmHnYVL/GUVU/JqTh2GG90ouGgrGbf0mP5wmsXnfQ4eB713Nubd
	u/AH7gan+INFLsrVQjsH2i5vXGD7oQHoxcCxn1N5BK67xdOO5L1zzpzXbd9xgPssBug1dg/xc2t
	DvHGzCnVMMBJe4mqdrM8RNL+tO1FYnbIeJLV4C7ShuIVdam67YNzxJFWpI7wLznnIov/n7xutL+
	HlrNcqG6AJmFH/30n3FEWGKWyOrUJwltT+0k+mBQ+Phcg6IUuft1koa5gTDeTeiIPXHRxtppDFr
	kVJdUSlD0pXTUb9JQ9c1Du72i8R8Kq8vcJof39Hg7vM/NokzWYNUPmi8ZeHJ36eKoWPPCo7WFDS
	3mys3KPBSh0sybRoZV3sMtz/jjnu+JW1Ow==
X-Received: by 2002:a05:690e:d49:b0:67b:edf1:7294 with SMTP id 956f58d0204a3-67d896b00e2mr1265391d50.79.1794590626789;
        Fri, 13 Nov 2026 09:23:46 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm25187277b3.36.2026.11.13.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:23:45 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Subject: [PATCH bpf v2 0/2] bpf, x86: Fix i386 JIT signed ALU32 DIV/MOD and
 MOVSX
Date: Fri, 13 Nov 2026 12:23:41 -0500
Message-Id: <20261113-i386_bpf_jit_wrong_code_20261028-v2-0-1dd0b03072a3@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wqDMBBEf0X2uaFmLVb6K6WEJK66QqNs0guI/
 97EPs7hzMwGkYQpwq3aQOjNkZeQA54q8JMNIynucwassdVao+Kma41bBzNzMh9Zwmj80pM5hBo
 7dcVL62ps9OAJ8swqNPD3uLhDLsLjD+PLzeRTGS+as5GUExv8VFAWz08bEwns+w9xhiT7pgAAA
 A==
X-Change-ID: 20261112-i386_bpf_jit_wrong_code_20261028-7246b0231fce
To: Wang YanQing <udknight@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Yonghong Song <yonghong.song@linux.dev>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, visitorckw@gmail.com, 
 Nicholas Dudar <main.kalliope@gmail.com>
X-Mailer: b4 0.16.0

The i386 JIT accepts signed ALU32 DIV/MOD and register MOVSX, but
ignores the offset that selects them and emits an unsigned div and a
plain move. The results differ from RFC9669 and the interpreter, and a
verifier-accepted program can use values outside the range proved by
the verifier. In i386 VM tests, three verifier-accepted programs
supplied helper lengths beyond the verifier's bounds before these
fixes, and the helper wrote that many bytes. With the fixes the lengths
stayed within the bounds. The test programs are not included here and
are available to maintainers on request.

The series is meant as a minimal fix that closes this gap between the
verifier and the JIT. It makes the two instructions the JIT already
accepts produce the values the verifier assumes and adds no new
instruction support.

Tested on i386 under KVM. vmtest.sh has no i386 target and test_progs
does not build in full as a 32-bit binary, so it was built with
jit_insns, verifier_sdiv and verifier_movsx only, with a strtol() to
strtoll() change in test_loader.c. The commands and output are in the
patches. The six jit_insns subtests that still fail (arena_zero_off,
cast_to_user, staggered_jumps, acq_rel, probe_mem, shift_counts) fail
without the series as well.

On the unpatched kernel the unprivileged subtest "MOV32SX, S8,
range_check" hangs in the kernel: the wrong value takes a branch the
verifier proved dead, which for unprivileged programs is a jump to
itself. The unprivileged verifier_movsx subtests were therefore run
with both patches only. There it passes, and two others differ from the
expected xlated text by an additional zero extension on i386.

Claude Mythos 5.2 assisted with this patch series.

v1 -> v2:
  - Dropped MEMSX, 32-bit-offset unconditional jumps, unconditional
    byte swaps and the load-emitter refactor
  - Added the signed DIV/MOD change, which was posted on its own [1]
    and is superseded by this series; the code is unchanged
  - Sent as fixes for bpf with Fixes tags instead of new support for
    bpf-next, since the JIT already accepts both instructions and
    miscompiles them
  - Tested with jit_insns and the verifier tests of test_progs

[1] https://lore.kernel.org/bpf/20260731002950.179573-1-main.kalliope@gmail.com/

v1: https://lore.kernel.org/bpf/20260915021338.1520964-1-main.kalliope@gmail.com/
---
Nicholas Dudar (2):
      bpf, x86: Fix signed division and modulo in the i386 JIT
      bpf, x86: Fix sign-extension moves in the i386 JIT

 arch/x86/net/bpf_jit_comp32.c | 76 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 8 deletions(-)
---
base-commit: b7cc45994c3f9c5f24397fcc0251f6c23bff9bd8
change-id: 20261112-i386_bpf_jit_wrong_code_20261028-7246b0231fce

Best regards,
--  
Nicholas Dudar <main.kalliope@gmail.com>


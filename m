Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015D4756C4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782457; cv=none; b=MiGw8wI9y6+Oqqp8t2wD0IKPeSF/bA2ZwdFDOCapDXiRrB2LjpCfncuBHS+kaz8CPhHxTsY/BJgV72aS6xABaSes+cD4gp/Fl9JfhIpScGVmlCE1etITbpeTNVqw0xjBK23JiIF+QoFpdDB/ktdaWbvMdNWYH6TNHalQKMY7Ncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782457; c=relaxed/simple;
	bh=h+Kh8E3B9cClVtp2kBnxMFwcb6cfCI06S4hH9JR3j0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZHCxybIh3lndMkPIvkqR7h4xtRcFviF1LfDQztn70coCE3609XQA+RhMV3epWmedJhE/FGW2fJRR5iINTZF3tH06C2PnRy14dEBPev8rJpM5FcmEeGt5z2kQdC93w/AK1cg84UwiY3yIABC7VtbQX3JSZGdRyr4fA8k4Qa+Eek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qa9hLRnH; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qa9hLRnH"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4ea388ba6so3322155a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782454; x=1789387254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=;
        b=qa9hLRnH8KTotU++6Abntr/U7PtE4EUsLnC8qBLzzETBcFszxpWYBGxA8es1dQWNlk
         fOEx9XpkG3SY/0hb2qHXLIejfkNYWkSYZQD7ioK+ZyzBK4Qw5KFklDBmrtBu/VWIs6oy
         4OOKrzESANPFa/cLHQZuD+3u7pq+ouUtrikpLISY+KP0VM1E0gDhPxzO0p5rBe6pLzx5
         I919vVd5pPOS56tRuK2L9IKqKKeifo7BKWDCrhW9OsXf08XFGaek5UrOOzJ6QFyHG7Jn
         MUG2oSgxghfypy+6jiWS5GgECPGYf59bmbHtnwgVv7FNGf8Hb3Fzl5tajL7SsZaA6Dxg
         TSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782454; x=1789387254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE91T1YbcHjh2wKlRe2CKmWmk4DasShLxHNl5T/s+ds=;
        b=meRRZoOG7HTXXWMwP6aa6HGwkuAoWMUMREiXJHn87IRVUiaymVprbr5APC829TrzeI
         A6OYiqGYXc/Xjark2mecTh+7HDcA7A+8ksSid9hhlpyZ+ZxBU1yswohhOuH7D9MU4QyV
         q6qGXq/EG2JfU9gUgroWjxfB2UrLVscS1rQ04dqTHJdI3aA/NZqz0j0gjss4f3ea1f6J
         M0l70SxTGii7ZtlTbdgwU87eKIN+2Y1jJX16nSNW4aZBrQUV47xO973bqtnjLsUjK5eL
         g7meIkJH9w4MgDvAgAaYUnpnrenkfCo8LO9948Jk5tx+pX8mlqpGGHgxuAt7poIBTHMD
         xnOg==
X-Forwarded-Encrypted: i=1; AKwUvByUMMBLi7KLhm5t4Hg/0rn5sTm0WQDNlq6NpOQGZQInYb6C6hqUikvIIXpmIxARTsFn8ktiItphLftpvWg=@vger.kernel.org
X-Gm-Message-State: AFuF++kopFfgyGM8quBrbaraJx+C92YtOi73iT+/6AnSvchbJfav5t7+
	56RaBWOhnBA/D+Odqp/4EYYC/rQfXG7MBPCpAjiKyOg25FSQy6hbYQ7d
X-Gm-Gg: AYBFou2aJ55zylNrSugZKq5e3q1n8pjtyH5BX0L50VbbF/h+IXRHWLoWLTGFhmBRLAY
	1T89J+y9hdTwiYu+n+l8QNWUWmgbwOhmY/L0OphBe6PznivRs2BAuJyppASeLk7Ec1O4G0zuQrS
	VmlZj50d5lf4uw50LN7JjGHMn5PxZhXyMV7xp4C12nq9964JuAzLtCHST87zMK+4YxhU0HVez91
	rXrfD/yVMaqjXQV+JNTKYlOiBrTWwGI7TzkOa9yS8xnqBscf4FrpvMFl8mW79axa0KlSN57HXnX
	Y1ulZiDMgdG7/UqrdHMMVeb6BYlNOjfSyktt2vO8ChbwJtiyMKgCzgQ2Q0+ciRus2tENjYvH0wf
	3uvf1USt6dNpeLS7TCUyxB7cZja+odNgQfD5uEDutfs8bn9eY5ceAp1TGsavSA09iOxKAKmVIH8
	4tKCz//k4IOjXOODxbvit7cJ+w+0XQJd07wTblfDqqZ3c9GFocbmgVifRsrmW8uyatRdYoZ3xih
	k7YTbElVD1FPQ==
X-Received: by 2002:a05:6830:4424:b0:7fa:5c49:5243 with SMTP id 46e09a7af769-7fa5c4954c8mr12688858a34.28.1788782454447;
        Mon, 07 Sep 2026 05:00:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:00:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v3 0/7] bpf: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 17:30:36 +0530
Message-ID: <20260907120043.36894-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings and repeated words in comments across the BPF
code, found with scripts/checkpatch.pl using the misspelling list
in scripts/spelling.txt.  Comments only, no code changes.

Changes since v2:
 - rebased onto bpf-next; v2 was based on mainline, which is what
   the BPF CI reported a conflict against
 - dropped the kernel/bpf/stream.c hunk: the comment holding
   "accomodate" has since been rewritten upstream and the typo is
   gone, so there is nothing left to fix there

Changes since v1:
 - use the selftests/bpf: and libbpf: subject prefixes that the
   rest of those directories use, as the BPF CI suggested

Hemanth Selam (7):
  ARM: net: fix typo "arithmatic" in comment
  bpf: fix typos in comments
  powerpc: net: fix typo "upto" in comments
  selftests/bpf: fix typos in comments
  sparc: net: fix typo "evalute" in comment
  libbpf: Fix typos in comments
  selftests/bpf: fix repeated words in comments

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.48.1


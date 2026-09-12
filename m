Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4677B20ED
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203278; cv=none; b=FPnUt8fi+FJYn2snhWmRKV8wFoBaIa518CLg9Mm4erOT/c/3emB8Vn15aGL5tEL/uQRha22ySt4gIXbFxuiAilPAMyXhezIvXP9LkMwuIvKCsOO+dWjhTk11gfsaZcYnWuaA+zQMuX9qMwq0awGnKTyAnibmkKEV+ue55ufimLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203278; c=relaxed/simple;
	bh=kA4O/akdo2tw2RMDpn/eCUheGJVrbEaLFgeSEjZTLkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTaAhruDTSqd4KST028oxClDTb5rtYlnTHgVRQUHGIxo0A6QuqdmkQQOUTukb0UO0zb2LakotkZt4gyCyPFXUCYYNNzByfEo89w6FQfJduMeP0LmTGSs8MmcRPopTuBRVI4/VUsr0fYh1n+vhGXPar/f4X/F36N+8VhJb/XlEV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JnfB3v1k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F1wO1xiD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JnfB3v1k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F1wO1xiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789203276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UVqrsRLM86Ysp8trDXvwZjNx2dQs8WYUeTmxIXTCoc=;
	b=JnfB3v1kjKJ1nXbu+aN5zQoEnVxSZOaU/eoBjDbab/gpXg6vezRcdCdILsaN922TPkqCSb
	XQhpMVheMzJ94letdRH4cwoad3Y8j0z9DcwBB2i8FbzCqiYTzGbpfo/O08ReK4pK+c6MvH
	Uo3bo8krlz/vX5S4x5TyIdHPR/3Daho=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-3GfU1984P1G6KAvtuUJmHg-1; Sat, 12 Sep 2026 04:54:34 -0400
X-MC-Unique: 3GfU1984P1G6KAvtuUJmHg-1
X-Mimecast-MFC-AGG-ID: 3GfU1984P1G6KAvtuUJmHg_1789203273
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486f197e5c2so916589f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789203273; x=1789808073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9UVqrsRLM86Ysp8trDXvwZjNx2dQs8WYUeTmxIXTCoc=;
        b=F1wO1xiDnQr9kwMDZSwlrwqLJCRfTQEyo28jdza67E18az2qPmkHlYBXn+i30uK+D5
         AhFtI/nUZC076agaeLSq/+DdeykxwQuCIszJpkErrMrgAbbW/UH0bcHEz3MSntKM9Taw
         NjFNcu+it7qHAeCuyUQ7+jwRJQygnSqnvFrrTb0NSBbKF7xplovLIPHahwMB0JJKgPSO
         8XKP21BkV0e1gWPocrTOH/uAA8JfD+lsdcf7/oWh0fac9hp3cVV7FZYaeluGs+crXPUk
         AnDCoBfr1c035m1SRD6yUpHyOgQT/+pFv0UDEFQAg5BxFJBzQwDdjdag0qHhnEaexUUK
         ZCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203273; x=1789808073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UVqrsRLM86Ysp8trDXvwZjNx2dQs8WYUeTmxIXTCoc=;
        b=qNhPmxz1u6fH/STkZNQuVAH1bFoCHtmilxa5lJjB4kqoKmcRqvRL8gP0E3JwrYohdQ
         g7kc2Fmm8nf+u9VYQtDDnkybQLWqEuiMaPcPMbjLq/g+IJksd1V5E7Ks1GC8lJkZwdGU
         oIPrRIBuxjZmLfP2f+KLeGeP+6pdK7lk/VSwH9Eji2EjUWHQDieP6cy93TD4uv3nC/F9
         mIMUmnQiVlDHRu+X/NCU5vlljZB6WcQa+yH+fhGqm+x0P8FoWOLBnocq5866c9gpqOkI
         lEgbPQLwMfkuFmf+9BbdKs7jdSLqEmkY3HXeEcwQTS5PmNmea17tuWnoVY5Q+Nwywc2B
         PVtA==
X-Gm-Message-State: AFuF++nD3vSexDufn1tvDGroFzVtv961yauE73N8tG070w1oQPfgqPLk
	FiuyUecxBwibDrNC6uEa29273m2kLC1gvhOIEhRKcA7BDEMhm2w3In/79fRzsTinm/rGkJ9EIz9
	Trnle773lEANFmXyVP8UDU+2075g9byA+xJWUGDvRE3saC7VZmUYds+4/u4TTnPw3GA==
X-Gm-Gg: AYBFou3zRXsRKAxSbDXP+EIBHJxA0XOHgFAkZlOQLlFzp3JyDiuxkvAhAArPUyN0h8T
	BvXrYplDjbOA/NeBJd8lop9UIivk3UBNa9YEOrc4KVPpHoIFHJTtFvERqEwU/WZe4RGs70QhUx/
	Q4BYkhzqVRoQn3d1glTd1iBapKCIjPQDBA8eGU3QjJtikjN3/svp4BpifRscvsb4stVOAL55+Bx
	zZARAQgfoHAd/cUtwsPgSnUOTYkJLuHjVOhn9cu/7Pq8PPk9rzIoBdqeYPp8iUf0zRboFcf1zCY
	3MmUxQKhzTSDeUNB/gjG/FmMB7glxrFTdxp/zWLvYxqhweMlYV27/znLMDAp/dtaBFRpWuYzRpx
	T8fgov3Ud0/YzyEw2luDsyplG9Cc=
X-Received: by 2002:a05:6000:184d:b0:486:f17d:14dc with SMTP id ffacd0b85a97d-486f17d15eemr17190960f8f.12.1789203273487;
        Sat, 12 Sep 2026 01:54:33 -0700 (PDT)
X-Received: by 2002:a05:6000:184d:b0:486:f17d:14dc with SMTP id ffacd0b85a97d-486f17d15eemr17190924f8f.12.1789203273159;
        Sat, 12 Sep 2026 01:54:33 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm12029348f8f.18.2026.09.12.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:54:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id BF2369B9AB9; Sat, 12 Sep 2026 10:54:31 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org
Subject: [PATCH bpf-next v3 2/4] selftests/bpf: Add assertions for bpf_program__{add,clear}_flags()
Date: Sat, 12 Sep 2026 10:41:01 +0200
Message-ID: <20260912084109.432834-2-toke@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912084109.432834-1-toke@redhat.com>
References: <20260912084109.432834-1-toke@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add assertions that round-tripping through bpf_program__add_flags() and
bpf_program__clear_flags() ends up with the original flags value.
Arbitrarily add these to the kernel_flag test prog since that's where
we're already checking for the bpf_program__flags() value (and the test
name contains "flag").

Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 .../selftests/bpf/prog_tests/kernel_flag.c    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/kernel_flag.c b/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
index 25eb59f460ab..c723c9fbfbcb 100644
--- a/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
+++ b/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
@@ -10,15 +10,32 @@ void test_kernel_flag(void)
 	struct test_kernel_flag *lsm_skel;
 	struct kfunc_call_test *skel = NULL;
 	struct kfunc_call_test_lskel *lskel = NULL;
+	struct bpf_program *prog;
+	__u32 flags;
 	int ret;
 
-	lsm_skel = test_kernel_flag__open_and_load();
+	lsm_skel = test_kernel_flag__open();
 	if (!ASSERT_OK_PTR(lsm_skel, "lsm_skel"))
 		return;
 
-	ASSERT_EQ(bpf_program__flags(lsm_skel->progs.bpf) & BPF_F_SLEEPABLE,
+	prog = lsm_skel->progs.bpf;
+	flags = bpf_program__flags(prog);
+	ASSERT_EQ(flags & BPF_F_SLEEPABLE,
 		  BPF_F_SLEEPABLE, "sleepable in program flags");
 
+	ret = bpf_program__add_flags(prog, BPF_F_ANY_ALIGNMENT);
+	ASSERT_OK(ret, "bpf_program__add_flags ret");
+	ASSERT_EQ(bpf_program__flags(prog), flags | BPF_F_ANY_ALIGNMENT,
+		  "bpf_program__add_flags value");
+
+	ret = bpf_program__clear_flags(prog, BPF_F_ANY_ALIGNMENT);
+	ASSERT_OK(ret, "bpf_program__clear_flags ret");
+	ASSERT_EQ(bpf_program__flags(prog), flags, "bpf_program__clear_flags value");
+
+	ret = test_kernel_flag__load(lsm_skel);
+	if (!ASSERT_OK(ret, "test_kernel_flag__load"))
+		goto close_prog;
+
 	lsm_skel->bss->monitored_tid = sys_gettid();
 
 	ret = test_kernel_flag__attach(lsm_skel);
-- 
2.55.0


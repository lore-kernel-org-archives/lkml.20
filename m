Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884738F259
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065161; cv=none; b=hSbJVI+Ps5B6RO+jUslgRozoA+MsOgc2PYAvQLKG268lxjdbvEE6y7c/xAWNjazkEcYVpoTnptrKr8m5zDyMeYw0HBY/dcnYEHIdMKgQPWfjkekzjQNt3eYyqoGqi7trpB8AALsv/eHS0kqUYD4R3TdpElpM7fTbAj+3QAgiGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065161; c=relaxed/simple;
	bh=cMp1VsdsQz0vNzbyhkcNws9a4oOwysOG1eRkdE4uSO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBpFmD5tNKcU2wKnNAH1+p2oN/RJ4F+CbiAyG9KOEd/KMDplcbaK3gU5e+t4N+Eonq2zrOFr41S7TH+kVITg/seycAT38CpvhuuQLuXjnZ3TyMY5jLsm94f//xAbOtQVScF3H/G16ZIEJSsTnja7JiFbr7XzuRfCZK4Fs5nJbPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bme79ckq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4w3edFb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bme79ckq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4w3edFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789065152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqYNqU4lqML3fRZSRPStdgLh7sIE0K4n+xpeBZSASYI=;
	b=Bme79ckqLn9+u0taxp/FNGmDMwPNCj1bE0c/eYucm04ssW7auqgjtRnmvh6Nze3yWhK+Du
	jSy/hj8+xU69cY95+RJPBWbWaA+iut+2cm0gBuLs/nWj/6ILMMo068rXSMpBer9DGpAqE2
	mpekns9xxez0W9LglSRV03DqCtWBtjw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554--0WMRg1xOy-rHVweiYQu3w-1; Thu, 10 Sep 2026 14:32:31 -0400
X-MC-Unique: -0WMRg1xOy-rHVweiYQu3w-1
X-Mimecast-MFC-AGG-ID: -0WMRg1xOy-rHVweiYQu3w_1789065150
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4843d9ab895so52155f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789065150; x=1789669950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqYNqU4lqML3fRZSRPStdgLh7sIE0K4n+xpeBZSASYI=;
        b=Z4w3edFbquyYygtYo/+H2UgPknhORVX4+7mRBYA1pFA4Aul0n7vxo358oR4jKndHJi
         gbt8kzn8LI0w1YLcdc9Kxy9hjme9RCulxKSNAcnbJ19Zr2gzwbjSDnuy15Bgp6swHn/R
         cN84/91NZ0f0vbPyknyVe09hi3JntFf4BhQN/T5ZQV/UF2LclfICuW95ZjK5IXrVrAd5
         7A2c6QCD8nQR5zb+B1h5/fFQG2Aubk2mLEzzwOkcMM4+gVx7j0xrGAUmiLfDTjRjZ9qJ
         0Uia0+U0wtynYC3xjTBZ0Bo9ZEIqP9nNta1+UebJS0YtOXyigxl+skwEZtBw0ge0tAKB
         UBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065150; x=1789669950;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqYNqU4lqML3fRZSRPStdgLh7sIE0K4n+xpeBZSASYI=;
        b=Xrbd4ggHDlBHWGHADh3mQnLZUPSR4208Gm8mkgOvqvABT+mGXplake4crfhouIqvfn
         by0v8b5OoU969rY11+rcBil9B7N0ATuwEKFvTQN5rTcLnASCo1m8fgEFaDquW7gN4axO
         4O6uW0VjyMFmenrWhlr5L1pP8o5b0itfAaXrzfDIMk8aklrjTHpBu6gt1vYKIexmrVTC
         +3QHzPtRhEvwMMrbFu+NzmrvIi5wtMt/lY7YF8ecim7MSNbXL1XyzLJYHueqGbHr0E7w
         RYTJLl7F6XilfNvo0/P2O3ddXHqMd+WjlUV8qhqSYbL9lneswBqOX0NQG3nd/49n0htO
         STVQ==
X-Gm-Message-State: AFuF++lyL0Aq2/CcyKCsZRrNK0w8VtNdLk2NKSKNsOkOl5KwVlQmonF0
	TOtjdlqDeb052U0juzB/MDs+xSN4FAMFasqec7HSSceXpTiAfYDEg5CND4tVnyxd93fX7PP55Zd
	++ZEqVu3/Uu2EgSQb+TH7VV4jPtCq3kJK2w8If54NOuQ9tZ3C01+rH76pgeYuCXKq1g==
X-Gm-Gg: AYBFou1+jQCC19XMWq4el7i1Ru55NWwlEl+/xblT3UfU4+HKt/pDZ6GOWeYHPOjw941
	P1EAxRPsmmY+7Ox4s5iDtV5AxRiztnXQ9pyv9oibc0imeNZau2sVA5LSWBL2zP0pPdMsJaVra5Y
	Qh3NJZUcBHqG7JVKUTAIwbGf6tEjlyaOd2faIV8D0vah5w127NKXHX8L6xhT9sN4wxaRVvGYYMS
	9iJ/Osh5lTvyJ+8ozvIaqEuPySs3GFgXoJ7+sY8ohx9wBXAGLkowZ/CnwpNS+kEQ4kl/9ldPW4e
	RYnBQk/H73dNnPBIAU/eQ4oG3YuF7sUbr5V0CpSDjYAOcPQJdacDoeyV9390hljNC4KtoP4+YC7
	yEDjEZKybhIfowkuADR5hFC0wOVM=
X-Received: by 2002:a05:6000:118b:b0:485:8c16:5ef0 with SMTP id ffacd0b85a97d-486eb2fe6e9mr228480f8f.42.1789065150434;
        Thu, 10 Sep 2026 11:32:30 -0700 (PDT)
X-Received: by 2002:a05:6000:118b:b0:485:8c16:5ef0 with SMTP id ffacd0b85a97d-486eb2fe6e9mr228459f8f.42.1789065150104;
        Thu, 10 Sep 2026 11:32:30 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm270102f8f.15.2026.09.10.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:32:29 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 8A4759B97EC; Thu, 10 Sep 2026 20:32:28 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org
Subject: [PATCH bpf-next v2 2/4] selftests/bpf: Add assertions for bpf_program__{add,clear}_flags()
Date: Thu, 10 Sep 2026 20:32:15 +0200
Message-ID: <20260910183222.307208-2-toke@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910183222.307208-1-toke@redhat.com>
References: <20260910183222.307208-1-toke@redhat.com>
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
 .../selftests/bpf/prog_tests/kernel_flag.c    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/kernel_flag.c b/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
index 25eb59f460ab..72c0ef8da409 100644
--- a/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
+++ b/tools/testing/selftests/bpf/prog_tests/kernel_flag.c
@@ -10,15 +10,31 @@ void test_kernel_flag(void)
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
+	ASSERT_OK(ret, "test_kernel_flag__load");
+
 	lsm_skel->bss->monitored_tid = sys_gettid();
 
 	ret = test_kernel_flag__attach(lsm_skel);
-- 
2.55.0


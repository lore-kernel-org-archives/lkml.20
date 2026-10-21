Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605012;
	b=JvvjN/MwIFGFt1EOrb1DoxbjW+IwgramtrXNvI8abdyOMDkkL+sN8QkqzPsStqxDlQGi
	 vvbxzxYP20AlMAjaAmnEsu05fmcI8vJx13eWL344hdcTpM3ICsCQ0L75HychU+sKd0uXc
	 nlPOzwhp8EBwE3W1i+jO1KBf+oXVq5PlZ6G2fWT/4S0n06ZJHHqlcntARqjrgexZPhGdC
	 H5qsfgiNMjInGgssUe86JpwfphUn9Pycym28wRejahGO0PjywLuDPjRCTwVMjc4uGYigX
	 q8r+wlxGSXrzXSOB+nseqwm3NBQTS5sURRDKN3y9NL56YaJU98km2xO26LX0izG1JhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NCiFUlem6qW8F+mY1MeWMFDksPatkBHvYOmj1bKILX0=;
	b=WMu4sILi4LOX5IAxYijsB6PiRtkOV9X9WjtNj4eFtvK84BWTiL8PBEPdS4P3FnKx7GAy
	 lvz/pimm6ZTBnPRDx3HhOQlOeUv9qSBcP22p0Qqw6uKJcLURrQ36IyYhhsm5pGJmlHDib
	 C7FyMqun4hJB4efw62/Efi6CP/VzGWhLiEmoHoHNHDrrd28vOrUepYzj2aq0c1uugAgrb
	 ixRF6hVd7tQe6eLNBvygEvDXlK7lR8bJxMB4Xz4SxXPClb/WFCriZSUHY/i+rwEp0z0Qp
	 7rKJmGzjZrcoxI3bj6h0N7GRXPwL9JrDYjgIaM63GneZ3+E29bG6tdeOpiXU3TetplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=JknpP7YJ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7891606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7891606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=JknpP7YJ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so1819906c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792605010; x=1793209810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCiFUlem6qW8F+mY1MeWMFDksPatkBHvYOmj1bKILX0=;
        b=JknpP7YJuHqK4K8JU+lEEevXFO0Z8hDPpOJEfVQ2tG7d2WjPMCUFv5PHYoIQSxw8WE
         nG8/1T3sApIfPTKf6r5g1HqBks6vEK2p6thndOk0qY7sL1QECx3lhjqY3NwIQPs/+q2Z
         rpwkpQFg6hXD/4u8LXJMUtXipenNIKBFmas3T1ToHPQ/HmS6XrqA0Jh4nmTX81FOR4gx
         s4Syr3pjelkDiFT4JaghhJ2UJEBDGM3y3l9EvUQWmDF64TZB8aa0jarD9CqxI/lFeHVa
         qoIE8Y2wsFXK4qdq8EloCuDg9Y6dSfKSWhpNK0q3l0zvjcGKOKJSitUaoyuPO3G2IlUj
         GQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605010; x=1793209810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCiFUlem6qW8F+mY1MeWMFDksPatkBHvYOmj1bKILX0=;
        b=ZiIxAAR+vriDTOkNGd9t2A2V5HJ488em++I45zqbK1hoTnGTyoYbTdfjEkEzvFWvzw
         mjA2Hp51aYGoaDUXmRV/0DZDl+eIJ8veiSdRLAXSAXtEdpkbFgfk8dce6huZg3SsBmTX
         YfBn9OBQMIQTcpiQA0eSMDI9BdMBKdX0ScYgHj5qWfhuJiKzxYVn0RoWUHKuUPVrFj5U
         AncEtuhtOvMbR2cSQ1XEpAZgZTLRtbNUITvek11hZdVCn7aeN/+VDT7sHRWbJ3m61Nit
         LaBgKU2/845eUTbZss58OGkrwwZR7J/bTMr9R2cw8uYizX7p4J9RrpGVDFIV+JxtOdem
         5mrQ==
X-Forwarded-Encrypted: i=1; AKwUvByChUKOFQWzCdWJqn8W5zkg+3iW2Dhw/PIrRF0CSHB6vqPByNDbA5vOsQrjBbP/UF5sB3gjg5GSXtFjh7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdE4rYViap0Ui1yumqYjqmE7RqhywoJHnQsI6rYdzXQJ1xfW/M
	vTaiYec4JkBywb0SIv5EtS/6SyVKo/M31O2M0FpsZYOsZubf08DCvjWn/piArYfgD0M=
X-Gm-Gg: AYBFou3J2USVkUn7TwGNVkO4pYsp/k1DRZEaJ3sUVXm3FqW7WAUB+pCfysqo6+WjZJa
	ST2bvy6u5fUFejItK+DsWbFnOfUMg9guwGA2f3TmUk0rmShBtEu70bjZLZVillQjymanOBiAHI5
	lMh1ylZ4DMW3i0V45rEMwb6GBmq9UlmqMw97vPXECzJUyuRNt68y7Ur0RgUDSn3gR3KFJfBtZSH
	PGtM0GA+GtFPep8VJpzivjM5hgN/dazYvfxq7UF+NGIVMXWZ4RV6Wa6cDUAlkRb6EhQ9bUykRK+
	u6DiIlxdqSL3tA7mKihYYzg3y4h4tX/wl+3kFAARIj06fzmk5+Rj58wtsvaedgpDzCqLeOTjCnn
	1a9xxrLyDliLMqCcOGSnTwXVhWeNENevSY4bK7NDJ5zLDkmWcs5TkyRgumRizsRzZWPq1lnA8+E
	Ax0gfjUpBXkxGyyTq6oXANZHFuT+ADXM0WnaHtx3T0wQ8GlbjKB6KD5v9PKOXG2Qv2HmklpKAmh
	GwyQYQ1I87KxKT0IUkKWZmNSex1hmGq35cay8FZdPjWRc6PmxRXeRkPYo5MHP38Dyrh2VTtJdoN
	XDJupiOVZ4W9XuLqBqEdgNNWgjDoLR1KDQLpeeBSBEILSo31VxbO
X-Received: by 2002:a05:701b:204a:20b0:164:8e14:4939 with SMTP id a92af1059eb24-190a4f0471fmr3741902c88.10.1792605009716;
        Wed, 21 Oct 2026 10:50:09 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d059:e601:becb:a5ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm8226137c88.17.2026.10.21.10.50.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 10:50:09 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bp@alien8.de,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	dave.hansen@linux.intel.com,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	hpa@zytor.com,
	ihor.solodrai@linux.dev,
	jolsa@kernel.org,
	leon.hwang@linux.dev,
	linux-kernel@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	mingo@redhat.com,
	song@kernel.org,
	tglx@kernel.org,
	x86@kernel.org,
	yonghong.song@linux.dev
Subject: [PATCH 6.6.y] bpf, x86: Fix trampoline stack size for 128-bit arguments
Date: Wed, 21 Oct 2026 13:50:04 -0400
Message-ID: <20261021175004.1276-1-artem@trailofbits.com>
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
Content-Transfer-Encoding: 8bit

From: Yonghong Song <yonghong.song@linux.dev>

[ Upstream commit 814cba835ef648e0c5eb79505c96c0493b29eea6 ]

btf_distill_func_proto() accepts a function argument up to 16 bytes, so a
128-bit scalar such as __int128 reaches the x86 trampoline with
arg_size == 16. But the current implementation assumes an __int128
argument only needs one register, so the register save area is
under-allocated and save_args() overwrites adjacent stack slots.

Compute the register count from arg_size for all arguments to fix it.

Fixes: a9c5ad31fbdc ("bpf: x86: Support in-register struct arguments in trampoline programs")
Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
Acked-by: Leon Hwang <leon.hwang@linux.dev>
Link: https://lore.kernel.org/bpf/20260729050204.2586457-1-yonghong.song@linux.dev
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Assisted-by: LLM
[ Backport to 6.6.y: Remove the struct-only guard from the existing
  unbraced argument loop; count eight-byte slots for every argument. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-90358 to 6.6.y.

The backport removes the struct-only guard from the existing unbraced
argument loop. See the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 arch/x86/net/bpf_jit_comp.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 8028a5a4ab64570022c15bfdf220c4033ad0d4ab..3d33aafa2cc26541e64b37960ce20a06ce5fd2d8 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -2467,10 +2467,8 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *i
 	u8 *prog;
 	bool save_ret;
 
-	/* extra registers for struct arguments */
 	for (i = 0; i < m->nr_args; i++)
-		if (m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
-			nr_regs += (m->arg_size[i] + 7) / 8 - 1;
+		nr_regs += (m->arg_size[i] + 7) / 8 - 1;
 
 	/* x86-64 supports up to MAX_BPF_FUNC_ARGS arguments. 1-6
 	 * are passed through regs, the remains are through stack.

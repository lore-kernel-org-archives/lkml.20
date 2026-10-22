Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705724;
	b=l6G6O1mvXQuNVwJaF1b0gUAYzYnfvxeCADoqcjQKrH0+ExuixmY4u9ekaRIXjyu3jcro
	 G5KckYyBf34donYZIdTFX9lKee/ubuJa/Pw8hYeAFtj0aW8FVfeS+oLfZ9wmOwO58veW8
	 HX7tMAhuSP9p7Sx8EYMhbnMnGMe8Apqfuv1EM/q2UHqslshNvJVC9EfJuUQao9sb8FjA6
	 nIdaFavMRr0kvXFdgelWuzFGkrV6FH7UrC8iv/zYCuzMfMOAnMeD6YfFZcN0KApoazDFy
	 jMBfz8MWcseC6dIiou7rxuLwXLj7sYuG8dilcsAzir8vts4wjcJ5i0Qyo8Z6zcZzRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SeYJzOStxDcCY5T2FRu069D80kN/5wtqcCKwZQpFtxI=;
	b=OEcHk+F9a/B4aRL920KOnm9p4EYpDBbkKWc3MmVJ/Aebv4OzlpXftwNgV2rDV3aGh3PE
	 j1YjUku8Igy6jl97Jub7Hjm8iUiiACoDOj3tU/xRg1bxPOasnkINMynO+S1LJGLkOeXJt
	 lY84wS+I/afHNJWtBUol+RkbyXMzK6OptNJEHVKj4H5xdXrDlb0f7qtEjwrKKzwpk4z7k
	 6RE2QV0EMNvbfDNVn/U0Ne76t9Zge1lUeAH80LAyVa398MusPgdLTVdTS/JzPBOZI6Rgf
	 /eqh5ss7+JSeK26l2kXwCohRS+i5NIT65BSAOQeQESR1hqjm7Gm/eg2S+Bk8uhi99Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TrKe5/iX";
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469CA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 469CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TrKe5/iX
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9908c849564so106869241.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705723; x=1793310523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeYJzOStxDcCY5T2FRu069D80kN/5wtqcCKwZQpFtxI=;
        b=TrKe5/iXcZxJX68DCRVOyHPuanGptudaW0VlYsCyagJw6CW7VK1S7mIBDeMY6Sa9zp
         NTwWdKLYDuLSljX371yMG3RDo3m/fcNA2TsPYOXNUoKWXrV5f8o2HAnRhTnc9UksLJoa
         pWXt6CJTy4cSyvCxOmuMH8SFYoxliZROs8wzEF9EwdDVJaDq+VrAJndboyEEOo0+eCL8
         VB+uAab/EJp5vztPLkhMyHfUIzRt9OkZQuOdMRosywTas/DROXCbYEH90FOnefGo3HBY
         6jD5DQNNjnJTXUAfxzRWPzc1ofqMCpW0O4ez9EP6UyJ0cWlhWGqMQ6lostlRIA1xTNhL
         3+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705723; x=1793310523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeYJzOStxDcCY5T2FRu069D80kN/5wtqcCKwZQpFtxI=;
        b=i0sA8V44ozKHg8y+NRC9yDi7z49L9HvKh0Rny8KXZcNmFkLiX3tzs34Bceq+y90mMl
         VeauccM4KdZf6cdKWMtA0TCxjzIzn7wQet+iKrU/6MpfZO5+gPjeeRzAQqA42rs27vMb
         2QILv3s0K3C31iCYRKmahd45BOrzGtdZ2Re+Dv1UiuUGiwRCUwZQYJTXnGopoTH9ZOX+
         vCZ7AgJG5739ROdU78Do0YFmhnMNd8Gsd5JMF4mtogij++iGHKOboB0mvtN0DHoNXGmw
         gtKovTmxNl3sscehVnuFhsG8cvc2MsLW8/lWAxnAtHJ9KA5dDoBjESUSURORUp3ip6uE
         2gcg==
X-Forwarded-Encrypted: i=1; AKwUvByTvEnwxGVN3RVJYGl3LMFP9BRNG/7ngp9RHneR78A+th8OpQeVF1Tu3FpzNzp6jNPwsX/VfZhsyVoZAy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK1nRRrrgPQ6dTfqlqytqxwjTRJtJ+gbUd+pNruMUMMS2kxjEG
	VtGViRkyf0Wf/RUcGTvTzCOIgK/3/75U9cZ3JeXBnJK2mwJRDHpNqn0L
X-Gm-Gg: AYBFou2yBcn63sfGw8e3gbRWkZojNHWA1FKcAPAyCwfuD9d8nXDtNpOP8HZVvi41XwW
	DC44ZYWxKV+XHltZ75vGm/ZmPNMMzPKH9C9FKZ+mVpGT5QDCeZhvisWLlXwYGWAaTasEbPGUUqi
	VE0ccr6I1rD/atzGb5Ik+bwPpUOpOSxk7wjUH/j88LBISW5H+ZzJQW1pzbBwT24o9PSKeEzHxVb
	obADELPIHKDTQbHz1gpbqqrQ2sPKF47a3y5ym3fnE55MLarPxGcf743HXSV+RcBM2gNgBK0mtIv
	8pSdENtHGssXLXHIL/C165zswERnF58QJOHltECzUl9pKlSkiHigxzBEyRJMZflBoHTFzw+4z48
	OLG/O5TF4zK0D7ZVRErBFiXX+AsPFmOMtXswXcsWN4M26cLapSooA7FcMRqeVz5latQeG1bkzKS
	gcSQWYhShy80iYK+/9tmfbqZ/2au1JPlhiIHXc/4sTw8jLmDyXMdXAjzJxWBlkW+FsaYN3rjae5
	2Uky/6rSOwX36xaVRsY5aSwvCmbzgEQUjdZOLTvZs+Ysa2SG1zPqg8hchHdAs3gT/FjsHBks1Yj
	Tz9AfRpfBTE7tcvbgNO0
X-Received: by 2002:a05:6102:3f8f:b0:7b3:8f0a:f76c with SMTP id ada2fe7eead31-7ccc32f27e0mr325464137.13.1792705723097;
        Thu, 22 Oct 2026 14:48:43 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13deaba5sm443786e0c.1.2026.10.22.14.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:48:42 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk,
	Bart Van Assche <bvanassche@acm.org>,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 18:48:15 -0300
Message-ID: <20261022214815.86306-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <871p9h1kc7.fsf@trenco.lwn.net>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <871p9h1kc7.fsf@trenco.lwn.net>
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

Hi Jonathan,

Fair question - the change is a conversion, and I do not have a RiscPC
with an Acorn SCSI card to test on real hardware.  Here is what I did
test:

1. Userspace unit test with a mocked MMIO layer

   I built a small harness that compiles acornscsi-io.c unmodified
   against stub <linux/io.h> and <linux/types.h> headers.  The stubs
   map readl()/writel()/writeb() onto a byte-addressable "card" buffer
   and a plain userspace memory buffer.  For each transfer length L in
   {0, 2, 4, 8, 16, 32, 64, 100, 512, 1000}:

     - __acornscsi_in: I filled the "card" with L bytes of a known
       pattern (each 32-bit card word carrying one 16-bit halfword in
       the low half, garbage in the high half) and verified that the
       output buffer matched the pattern byte-for-byte.

     - __acornscsi_out: I filled a userspace buffer with a known
       pattern, called the function, and verified that each 32-bit card
       word held the expected halfword duplicated in both halves.

   All 20 cases pass.  This is the harness that caught the two issues
   the sashiko bot later reported independently - it is not just a
   smoke test.

2. Cross-compile for the target

   Built with arm-linux-gnueabi-gcc on rpc_defconfig with
   CONFIG_SCSI_ACORNSCSI_3=m.  The module links cleanly
   (acornscsi_mod.ko), and nm on acornscsi-io.o shows:

     00000000 T __acornscsi_in
     00000104 T __acornscsi_out

   objdump on the resulting object shows that the alignment step
   compiles to "bic sl, r0, #3", matching the original assembly's
   "bic r0, r0, #3".

3. Apply to a clean tree and rebuild

   Copied the tree, git reset --hard to the parent commit, applied the
   patch with "git am".  It applies cleanly; re-running the same
   compile command produces the same object.  This confirms the patch
   file itself is intact and does not depend on my working tree state.

4. checkpatch.pl --strict --no-tree on the patch itself

   Reports 0 errors, 0 warnings (with FILE_PATH_CHANGES ignored, as
   drivers/scsi/arm/ is already covered by MAINTAINERS).

What I did NOT test:

 - Real hardware.  I do not have an Acorn RiscPC or the SCSI expansion
   card.  The unit test proves equivalence with the original assembly
   semantics, but it cannot prove that the semantics match the actual
   hardware - only that the C version does the same thing the assembly
   did.

 - Odd transfer lengths through acornscsi.c.  All current callers pass
   even lengths, so the trailing-byte path is only exercised by the
   unit test, not by the driver end-to-end.

 - Interrupt handling under load.  This is unchanged by the patch (the
   IRQ path is untouched), so I did not add specific coverage.

If there is a specific test or configuration you would like me to run,
please let me know.

Breno

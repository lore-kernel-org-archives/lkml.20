Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1471343B6E2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731405; cv=none; b=P89aBP9Iq4pkW6y9N6e/wh5/edbv3YodokWFzcl8EuQ2q6K27R69KkMKT6v1RVOdEe05et0b9Ap5mdqDLK9yDswoMl0zVZRbjegrHBJRLQu5XhImsoTRwzQ/z2R/wABxzLb5OvFgMy0bbrmP9AO1aS1EVzSqeJt+gNB1GOod7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731405; c=relaxed/simple;
	bh=UV2MS265JeG/XFufAaOIglzfguLQfCex0JpmNsNklXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToYVRaZoopRa+HAT6gLneKPpTlaCBD2iL6y2rB+W1ma/pIYWgqtcnTwQlilTlPH4HCxLXLBbzY5DvHw2STHlk30xmpepyKrrmzqaPPHr0WQBVMGWAzecPXuV5MtwokhAStT3UaInrLNhi9j5PCIdPHgPHyVo5vQ72EdS9+92y04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANcyKfNn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANcyKfNn"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so443858a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731403; x=1790336203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3/YTpNBvG9JEca/s1uHfv5ByQp08abPn2Zh1wtqNdk=;
        b=ANcyKfNnJsqUL/riu3aFN9O+kzhsJDwxyhf73w6aJgSejjbt5e7dWZKaQ0Vv6LtXQt
         RqhAmbFRoZr2upqUEUiyV7PmSxbC3NGlXaMR0tB3cmKO8KDMh3v86rtLDUPeoWTPqGi0
         XHMtj4efJX/i17f1YufN+aTFMICFZss9L6oPglwPxb1+3PulelXNvoVFsq3kodoSLVCJ
         GtYx3cOufcIf7mvjzKeCVAIFK+RAxGzCMqWEfVvD01gnJ75Jrrsbam2rkoEdv4D6DeUU
         p8CrUuFHYbl6RpEdXoBTy5J/m0xPRHHlkSOyYOZ0YX7YijVmdNojYKzxuGy27Fp0cGJR
         1x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731403; x=1790336203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3/YTpNBvG9JEca/s1uHfv5ByQp08abPn2Zh1wtqNdk=;
        b=Op7OoUEY1uD9kCB+Tucx9WfpbRTyZY59u2rraJAPAi2qRCgMOT6p9qpLbnYMhbO8vV
         2Yjsjd99o2+wSz5koSeoN47zFIevRUy4hHJJ8g3+/nCuVdlYwMkzUNzjXAEEII4ishV7
         N7qtSPQCwdRrUpfmN5rK7xwMMLqsZoEGG2c+pvPl2fRyZlnG8sfi8/iP7bgxFNO1suc2
         WSukk78EbP1r+KggpijoOo7YidnGU7n3fYKoV2qcAqUeIX55YFIIpf3VRgneWS3xiK8s
         zeLfcHXXQqT4hlFp8lptk8HUzgXP0F5em3rl3+qtBt6ja3kzJeLv9v2q3eVSxQfOmYaa
         palQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtCsUwcTRrAaCqpch7NDxLXW06y4ABalDwhwaoZXPXOHrghc7U5Trku8dY5OpZ9ynKcfXEprZgIHCOxug=@vger.kernel.org
X-Gm-Message-State: AFuF++lkmS5zYxpo0PsL/6ETsFLn+iUcj/qTAlHVGlFnEhcwf7/zaJHL
	H2wSx/X0EFmncKg86a5zNhj9X+AZbatsrsbYGtUmS6KQly3GcLvj2kNvJjtsH1XW
X-Gm-Gg: AYBFou1jXzdshFqM0TdOCXRpMop6lgB0XKsiWWrl91AG40c9ZIVApbQ18PWGe+yzURQ
	DuKI6Bldctg+CE8ja2YimcNw3XuuSiMB1wn2BaxIexP7SZXWBvU6sr1mFVIvthrIc9X6k0yoDm4
	pIb0ld4cTkWXtVkn/JRmyzTc3Yr9bTr3rbTXCEYo/euUU4Ni2/BjRweTLLkRNBcZECrwVzjK4rX
	GvS0pE+9RSqfLcCazweJ2C10r5wSG67QSkGKD1OsgWYwz0pqFPg+8oIOi5fgqD6S4CTz+4SxXQP
	IbuptefccZVJTtQ8o9wRQ98D/wkroNmDAcYZ+WZ8Ata/vLt77YA7pxNm8bFb5N8vop3qfyWYkOK
	Fs+TRjwDauY1jW2+IOhvJ0Kruqw7+wrmYeNhSvu5uCp0Tl034vQLGhB7uAfMHg3FX9WbeFEAM3v
	uR/qKz9+PSAdosD9E3qvP7JrZ0dIJv5oxPmU93d1D172raWYnujmyMyTjRGk6b6hH0dZIyyQpbu
	VRowiMD8T1Ca+RWtJu89yk=
X-Received: by 2002:a17:90b:4e85:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-39e54d5ca4fmr4800851a91.24.1789731403361;
        Fri, 18 Sep 2026 04:36:43 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce069246sm3922628c88.15.2026.09.18.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:36:42 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] KVM: selftests: Delete three pieces of dead library code
Date: Fri, 18 Sep 2026 17:06:28 +0530
Message-ID: <20260918113631.634233-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three unused things in the selftest library, found by asking the linker
rather than by reading: build the selftests, then look for global symbols
in lib/ that no object refers to, and check each survivor against the
whole source tree by hand.

  1/3  sparsebit_copy() and sparsebit_num_set(), neither called
  2/3  the declaration of vcpu_set_cpuid_maxphyaddr(), which has no
       definition anywhere
  3/3  guest_snprintf(), a varargs wrapper nobody calls

Each is independent and they can be taken in any order.

A note on what is deliberately *not* here, because the same scan turns it
up and the obvious next step is wrong. sparsebit.c still exports nine more
functions that no caller outside the file uses - sparsebit_all_set(),
sparsebit_is_clear(), sparsebit_validate_internal() and friends. They are
not dead: they are called from inside sparsebit.c, mostly from the
assertions in sparsebit_validate_internal() and from asserts in live
functions, so deleting them would not build. Making them static and
dropping their declarations is a defensible follow-up, but it is a change
of intent about what the library exposes rather than a removal of dead
code, so it does not belong in this series.

No functional change intended. Built with and without -Wextra, and a
sample of twelve x86 selftests gives identical results before and after;
kvm_binary_stats_test and the rest still pass. The two that fail here fail
identically without the series, because this host's kernel is older than
the tree.

Gokul K (3):
  KVM: selftests: Delete the unused sparsebit copy and count helpers
  KVM: selftests: Delete the declaration of vcpu_set_cpuid_maxphyaddr()
  KVM: selftests: Delete the unused guest_snprintf()

 tools/testing/selftests/kvm/include/sparsebit.h    |  2 -
 tools/testing/selftests/kvm/include/test_util.h    |  1 -
 .../testing/selftests/kvm/include/x86/processor.h  |  1 -
 tools/testing/selftests/kvm/lib/guest_sprintf.c    | 12 -----
 tools/testing/selftests/kvm/lib/sparsebit.c        | 63 +---------------------
 5 files changed, 1 insertion(+), 78 deletions(-)

-- 
2.51.0



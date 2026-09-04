Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F440A93D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519080; cv=none; b=sk2Gp/Cr5nKzwOeTNh563B8iVGhTccIWh54bfxYjzYzTnHytiRJbSCAqBel7N7vtoklGwyOgKX0ZRkL9sMBAa/rxO/+Xa6V1uvuijQncVD4BreY//lapXkJaBVrTAtYCZkuGAdQBJxJkczY8VvJgJp9qciGEoUa7g0bt5A57YvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519080; c=relaxed/simple;
	bh=vDKT/4TmnbZ3/sQRG+Zm1OxmjpNarLJYivv2GZAU0Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODXIFIBi5mbU+zVAGV72fB1xUM/d5L0Ngzf7YNxaLuQz6vIlUOKUwr9pr4Igri/OzJ3V8T2LEvvvXuDsntOQr+95ylnSoZ2a+DKA4O4kOtq7mZXyaRU7owflA5eAwrZ41ecGypes9cuXuarldMgF6e0dZ50A6L5jOxjQLrXoAb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYCo2Tyi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYCo2Tyi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso658391a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519078; x=1789123878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vidzfit/KCAOtZyDwIkxQay1+pZj3NOhQb6ygYZ2CD0=;
        b=VYCo2TyicyuKvR0+I1D5HfxGwDnr8IZUfbrE6o5T58PE9pLGXnUPWc7Tdlg+f0g8xx
         tApdyb+07v3/YmqnuOStYVW/9Zr4RzFkZOLEcq0RiLS1OVqBMsecVYxKq7Iv+CHUoOfr
         Ga2q+8VSYpZayJto5i/OmYN8zaSfA2J5VYgn7p0Et0S+I/ddSfPN1CqSZocauWzvuP10
         PlOC2rFzmMydp1ebd+gK/t8xq7zGwToXGX5Sj8rl+ZAJuzbUtAzlV+JUtL5nynrvalDc
         J+XfdU7M9CjNEIT381qRwaSkbRK8xMfFXcpKhm0qlAMCmEULxnE/fV1tmSQR6F4TYEMv
         c6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519078; x=1789123878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vidzfit/KCAOtZyDwIkxQay1+pZj3NOhQb6ygYZ2CD0=;
        b=BYEImGnAmoVaNGPa+e12FRD/xd5qzSO/p3RakYC+un2NA8VqMoyG3sG6VPJA3egUAt
         dWbtV0T39TdtmW2dzkPYVXLwN20vfUxWMzDHuroTcM85fA/tJVluqd4nHguG96ZS1WzJ
         24Z60w+6k2GiwBcJIVhtAr1p4bk6POpPiIkzS56WMy7b+END9X98sl8a42zfGNyaOMKm
         OsHasomcSpW9EIzvU/zjcXlSTWqzTIMYYrTEmtFzu3mQcEMehFFTAlVjhBPUvEEwF3Gc
         97tY57oITKPQqWmKDh8DzdnKv7U/U+pzFpuiqB0y9CaRL0k+sEITFnIaiuzuCeI2839d
         pEDg==
X-Gm-Message-State: AFuF++mzy62ppqJchXfdt+hPHy6C4nhw5RZzdJj/DCdTzO3I1kZIS71A
	nGEqvCDzkkKYsc0R5cUwNUg91QeZ3i0ostYI4886l4D+aiqtVa2aceHYU+UDEPfh
X-Gm-Gg: AYBFou3WBqTje4h7O4lNMpu9pGhIwx2Nbccrrnx+oMwVaFGzgIstENJQKbhjBIREGhG
	khbUHpuVsCa+e+vPprNHaeXBQUwulHUSWc3JB/DUKHfylMQybnrl9HYlZ5I2V125K7Qc2/amPG3
	g1q7FfNPmR/bMQyz+gGPyp7Po9evgnVJlAyme+O/lbfSMrjpJ86EIivkLe4yOktUys7jOsL+Jpo
	+myGpsw0MVKROtva6REwNpadEJJDOiZ6P4aFMeO/qrjAxJKgXrMAwwPMm41DKGuJKnKaIa8uALU
	5E8kT6TxQMaD+rH89HD6yTNXYrjc0n3Gfmgpx9zTlNKhcE9e7XhoXCNGP/JKhwUytyTzytIPGXk
	GWBYxZUVTge83npZkpEp3zDkqk2lc5g4ubSjCUsuZ4gb0+gpMrSH5h2SUQcz1JTCsvpMAKQBDVK
	gkeoD6XUbjRpvTOvNtCJt4LLVQaQzRe8KI0uE/vMqL9QB1QfPomCBOl+Fdv4n/ll7aPSrujnBlI
	NEJxzJ8JLogp2s=
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr8706343a91.9.1788519078410;
        Fri, 04 Sep 2026 03:51:18 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:17 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:21:06 +0530
Message-ID: <20260904105114.29474-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 4 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (4):
  Documentation/arch: fix typo "initalised" in comment
  arm64: fix typos in comments
  selftests: arm64: fix typo "hander" in comment
  arm64: include: fix repeated word 'to' in comment

 Documentation/arch/arm64/booting.rst                          | 2 +-
 arch/arm64/include/asm/pgtable-prot.h                         | 2 +-
 arch/arm64/include/asm/stage2_pgtable.h                       | 2 +-
 arch/arm64/include/uapi/asm/ptrace.h                          | 4 ++--
 arch/arm64/kernel/cpufeature.c                                | 4 ++--
 .../arm64/signal/testcases/fake_sigreturn_sve_change_vl.c     | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.48.1


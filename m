Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C894356750
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789186347; cv=none; b=lBMNABTnsqSnHwq032MMLyWQv81Gp3juwAADBw2rdRdcMjjxDne5gzqKlFSicABMcAmF1waLQ/ny4+nBjoHziIvHnUvWjqimTP+MeChH0cTx4tmBJh9FXEm4dYYuJP0waRRTvUkl68UC/w0vPpGea/F8u3bNcqgTCj8FcHKk+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789186347; c=relaxed/simple;
	bh=Y4mmlS5jFgG5ATmNax0YkycTZRrcGtrpcCkO1XmVR1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTd/O5YIqgXoeIpfkpFcZAGOi/K59jjSIQGH6fyt+2UW5zssW8lb2kAS+QxznfVnIAK5d5QLeyEm5XZA6ouDqCz67iXON1AwwPmde13HMBuayI6c2Qt7LpM4ZvCJ8QxplqjyOU+EgL7uskxOADZ4FhWeRXc9T71Z2oCTk+2j9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgB1/qsZ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgB1/qsZ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9399daa3d43so135420685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789186345; x=1789791145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARX6sPlaaU5jt76zvFI9y/9+1m01ifIYtxUFDnK8I6Y=;
        b=UgB1/qsZMJxBZjyfBlxH8JnZLmoS90wsoHJlqDLNECeTNGSW4XcxKY7pcUA626UNhx
         N0UeNfJluE/VxQuWlrs8FrLU722rlTi8j9F2GJbb8hJ2KmKuDDIQw7KxgSOcfvx8dv62
         z6FA5rkpwDy6gQt27U+iawPUWyKyyF/1WLflpFHGmfvbllk5IPBzgjlGxTdlGFLmwgQo
         uYbfFdQWXA6CAJIp8KJc9dItYwpqKt+yU4LTBcLOC/+BMcJ7ccdU+8cSMoXKP1DFjBOV
         G2+mTWPLNEne5WJIzgv2Gj1PWLYL+zdaC2rzZ/7Dp9mCQ+/LTlVM2AVSAtHEySecvJVy
         Kybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789186345; x=1789791145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARX6sPlaaU5jt76zvFI9y/9+1m01ifIYtxUFDnK8I6Y=;
        b=iGHMKQSLYG7V+arctvKXCuAAuj7Q3CQ44deZocZ+nJDYQ8KmpTEIId680xPPKtDUgg
         QCsuX2jtCiB4DCap1IViVeqOryB1iAN4FArOdhpEuCQfUF/SHpXfkNiwOhNO9FRVXYwH
         faPjKsLMB6/lOipzcHGl1sOPtsrShKv8p67MinJ8W3M1j8dsoMC0qLr4OW9xp4JRtM3X
         NGE9ZudoIDm23uYvgHOpUW6xMx4hMj66n+oTdNTKszGSLSb1CgUo4mjrJNJf9SZpFLZR
         NpdCyruHo//CP2hIDRwYbkR3lCP3Ty+duaBfbj591hWT8do/Cu5BMYaSSkFgOLBN4++c
         bV/A==
X-Forwarded-Encrypted: i=1; AKwUvBzigYRmtCZ/DHAvnwlyLWfzyW0jLWy77kueqyePW2xs1ezH9F6Y3fwvC6MOT5Yx4nvLjc+hrj5D/uza/iQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lGdtIWCMwYApfekSC3ciGJL08YofMKk7kQWdWMhF7bQqk3WNHo
	zZNT0hJvkJ90cCvLKBc+GGxmmOB1+9jRHFT9md9NKmRyRQHNMwQvMNpZ
X-Gm-Gg: AYBFou0mTtAm2vBL6ka8SVYxllSb7S4A8xP8XXBet1wM/KoOa8TXxJPUFJK2VjhiIMH
	L5/kZ+8ED6C7UWFp0vc3ugX3GU4g2TA4IQp19aoYQimEPB054tMqj7oDY00s6mbWuvcNP8CaUxu
	mtwm8SADrZQyouYqJ1Cq3ikE36T/qXlLWvLyo4KK3lRzTR/8mhgeh1KwxOj0VPWItSh9j/pfE4U
	Vre9C943s20XJ6z14P7c//wyQI479Gd+QjOY/VOYN4Ya6KS8+Ttf5oeHAH+EtQ1nQN73FqnQ+Qt
	j/xAeSBsIjPPHC6nuvGmGRq0CacaqSYxkwlok/fPLi/Z1fcBpA86zTH3VX975gj6FDrdd3YN6bi
	AH99oGDlz2DsrF3xoLCTjwY3DQTrltOlCRt0kAwEcPxdOzp6DOAsKGJzasjJXNEUwAM42VMjcIW
	ojvxzk2/GT5zNk1JUSlZQk1IJN2cYuU8bMadzjvog3I7EwR4T4wc0e9BJQNVAMzWWBIw==
X-Received: by 2002:a05:620a:17a8:b0:939:9a09:6009 with SMTP id af79cd13be357-939ea22929amr988056985a.33.1789186344876;
        Fri, 11 Sep 2026 21:12:24 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a09b85dadsm18463485a.34.2026.09.11.21.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:12:24 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	johan.almbladh@anyfinetworks.com,
	paulburton@kernel.org,
	tsbogend@alpha.franken.de
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 0/2] bpf, mips: Add BPF_MOVSX support to the JITs
Date: Sat, 12 Sep 2026 00:12:18 -0400
Message-ID: <20260912041220.444715-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the five MOVSX forms to the MIPS32 and MIPS64 JITs, which currently
emit them as ordinary moves. Patch 1 factors register moves into helpers;
patch 2 adds sign extension.

Use seb/seh on MIPS32 R2+ and doubleword shift pairs on MIPS64, where
normalizing the source for seb/seh would eliminate the instruction saving.
The MIPS64 sequence also matches GCC's generic lowering [1].

This series depends on SDIV/SMOD v4, whose uasm patch adds seb/seh.
This is missing JIT support rather than a regression, hence bpf-next
and no Fixes tag.

Tested the SDIV/SMOD v4 prerequisite and this series with test_bpf under
QEMU Malta on little-endian MIPS32 R1/R2/R6 and MIPS64 R2/R6. All five
MOVSX cases went from failure to JIT pass; all 16 signed DIV/MOD cases
passed on both revisions. Patched pass/fail totals were:

  MIPS32 R2/R6: 1050/12
  MIPS64 R2/R6: 1049/12
  MIPS32 R1:    1045/17

The 12 failures are 8 BSWAP, 3 MEMSX and 1 JMP32_JA. R1's 5 additional
failures also occurred on the prerequisite-only baseline. No other test
outcome changed between the two revisions.

Earlier v2 tests covered both endians and verifier zero-extension
handling. No physical hardware was tested.

Changes in v3:
- Use seb/seh on MIPS32 R2+; retain shift pairs on MIPS64.
- Share the 8/16-bit sign-extension sequence within each backend.
- Apply on top of SDIV/SMOD v4 for the new uasm emitters.

SDIV/SMOD v4: https://lore.kernel.org/bpf/20260911213340.3767930-1-main.kalliope@gmail.com/
v2: https://lore.kernel.org/bpf/20260904111731.673341-1-main.kalliope@gmail.com/
Review: https://lore.kernel.org/bpf/CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com/
[1] https://github.com/gcc-mirror/gcc/blob/releases/gcc-15.2.0/gcc/config/mips/mips.md#L3921

Nicholas Dudar (2):
  bpf, mips: Factor register moves into helpers
  bpf, mips: Add support for BPF_MOVSX in the JITs

 arch/mips/net/bpf_jit_comp32.c | 69 ++++++++++++++++++++++++++++++++--
 arch/mips/net/bpf_jit_comp64.c | 57 ++++++++++++++++++++++++++--
 2 files changed, 119 insertions(+), 7 deletions(-)


base-commit: c1ff425d625eb2a4d2967e9889b85f202f24eb5d
prerequisite-patch-id: aa8ca3f50fc4b0160c5fdba43a92e4b7ec3f2e07
prerequisite-patch-id: 9f324d79755bae54c56ce6c90769acc8595c9ad6
prerequisite-patch-id: 35236f563c0536859077709d52b345b696e5c26e

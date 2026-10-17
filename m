Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FF1384CE1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202157; cv=none; b=GzlLrAPM0qhsA/lPqffx0hiOhzwlXelzkUqbitpOkITu31fjtb/QlLQj7yhzHH5gNgHY6HnlXAaYzRrA3AU3jcUATZ53KM5kcOlUvnXsiKnoMAYM4oQZYSYF6tYJRtvQtX1bQDiad2XEDA6ZStDbKy5B2TQFUrmLVvHuzolN7mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202157; c=relaxed/simple;
	bh=amj26N7GBgNkKSic738dtOdhoZO7SxmjDL8PSryCbBM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n0BwY0nSL83eTYXKAy750QC3DbOlvibcnKvQ4Aee4f+4Ll5YL7++YN8hcsXcr7pHYiKChq1qyOJBkVdrdIvcqiAf5cp60MSYl1MxZn3I/eH0McbMMqsKBrgPEwkCg9dU6pW+zQA+F1l476M+bf6TwoTruKFdrYteFZy72Gk018E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyBIzeHZ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyBIzeHZ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0d91601bdso11969387b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202155; x=1792806955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V5KfIFOpzzVgEmADZkACyBVWel5cim9UCxoXS8oTCY4=;
        b=KyBIzeHZBFSGJopzAV18TAIGtbwWivzxYOmavLodDM+juWnRhEp1Kr2nVTf+a5qUKg
         v5UrzbO2cE9p4/lDVSr7eBNay8uE2rE6nVFmR4qzGVjdJbsYEBZvoapqRdnUwrKdnXXm
         ReqML3nKDFFB8VqwE65GTlQ4P2t7wiAtB/nbREheOC8IfUIDHpXAHYozodQJ3xbpTrGl
         lvnyeVPOOuCQGUCvWldw0SwEFOrDNoUOAJDhBWw6ST+accIwCRddSIDGmyGCgwMdQyr3
         a1C02yAEpLFaDidk1FShhi1pKeL8Ec0tIaAERm9GTYuLwzXFs7alNGnFO0ekayT7WRK3
         lI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202155; x=1792806955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5KfIFOpzzVgEmADZkACyBVWel5cim9UCxoXS8oTCY4=;
        b=zObezWLNLit/oB1WRqLANx/sG8XWRykaAFUouT/JxXM/meaRZDWNj64Ob9ONR6iLNX
         w3jhGrEkr7dfjmJdC63UlQEbAaBACnvoLJtYgsiVRI+Lfhy+ZWGWQ14fD1v7fObIsuDi
         0ATik0XaZvPtlGt9nDFarppRkIh6iGhpZDCLfRwSLt1ssU9tPW78HjrZ3UR+m66ePOpk
         VVX+PdL6nY91GqekmMk7SPREPDZfraFGNfWQ/y17a0HyeZMBlJ9aYlaE7vZCIPzwjd0Y
         5FO/6uG+6xqHTrxkdkhbd4gNijMYR1SgNMiASvpLdYVMwotH0bQh+wdPDiEOQ69RQRpn
         GKwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDra6r9BG+1ynilLobU97m+LDVbTVIQsxTZciwxAOIKhsAVIuAuEt1llQJ3zyJRdawYrSjN1g+2mUEFhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhCSEG2USm5LE2T2j86sqNtRrw/8/alXfQFHiRlPHYiTq+8CKO
	0dtBagTD/ATMH6UHCl6J78hJ8lI9VCyoPb9cWW8eyjzuUbrecM/IcS79svggug==
X-Gm-Gg: AYBFou3oiM46Q0WJcmihg5Y0dpucAJu8eRSHaYTzxgIbzCYNh5yliY8o8elkARQNm6B
	b3imjmO+lZDiCvj8Np2Y4q+BFOHhgU6hUVr55IUiRQyzdBg+0t1LI6mcAwgl6vVi7UQX+r3SfRu
	pX+fXmPJkCsLGnAwVEbaYZ4f/7T5Hz4mO45IszNjzNqvfXk+r9/QXsLY0fBRtcJejF99bZLYYiq
	T4vvaSaRM5BpmUOHKhCRiUh9CI26H6MUi0zOETzY1CND97ioWbjdgseBxc7MLUWQi0uLZ8at08E
	NAZfnASC71/zkbmS89BByu07LSgtwx3abbVTdm+73nUAMLnSHRTpI4mDMwGkt4/DsHGWii5AGdf
	yOuRljqU1Xy917i7fCrxkbLpLnF4QDUHk+isUWDllmMD1paphKKxqZIMCZcJAeBZHDTsqQ2tvEJ
	PDi7kc5C78Rf2Nsya44DZ6aEuliEl27PaOH8acWbcpAKSK+6tXHjapBMT/1eXA4Sb4FbqYy2Bpi
	/IjniZ7CNmc+D7V6XVrI4FQ6OgJXdgzIQyWgkQ/kctCzeO6943j1ckxGcOsBmkRTZjSmpvmYL7x
	yjc189GINGE4BRzUMxZsXFreLsmg
X-Received: by 2002:a05:690c:60c6:b0:8b0:56e6:54ff with SMTP id 00721157ae682-8b0f20f2b8fmr6810397b3.6.1792202154647;
        Fri, 16 Oct 2026 18:55:54 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e590b586sm15829807b3.31.2026.10.16.18.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:55:53 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/5] alpha: perf register sampling and user stack dumps
Date: Fri, 16 Oct 2026 21:55:46 -0400
Message-Id: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywrCQAxFf0WyNjJJaauu/A/pIoxpG+iLGRmU0
 n93LC5dngP33BWiBtMI18MKQZNFm6cMfDyA72XqFO2RGdhxRc4RyrD0gouGFoN2EVOBtXJRurM
 nLwx5uARt7bVH703m3uJzDu/9I9HX/nL0N5cIHapIxaUUl5r41o1iw8nPIzTbtn0A3qXslrQAA
 AA=
X-Change-ID: 20261001-alpha-perf-regs-v3-7e23508c1ca2
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=amj26N7GBgNkKSic738dtOdhoZO7SxmjDL8PSryCbBM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV10VlF/39zcEnabm29+TT3kMS/kx1KnuxE/ue+/q
 VO/dvaiRMdHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBc8+sII8OBrdfP7X
 Eqff9YNU3ZSX5F71HXXXLHn+imX3ir3Lk8a7cSw/+I9/9t113QsWAvmjDz/+8rwXUP++dvXz5n2
 /tNtxWXsuczAwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

This lets perf sample registers and dump the user stack on alpha, which
perf record --call-graph dwarf needs to unwind user space.

r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
therefore cannot get past a first frame that uses $15 as its frame
pointer (-O0 code or alloca).

The perf tool side is a separate patch for perf-tools-next:

  https://lore.kernel.org/r/20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com

libdw also needs alpha unwinding support, which I sent to
elfutils-devel:

  https://inbox.sourceware.org/elfutils-devel/20261012-alpha-v1-0-46760216dfb7@gmail.com/

---
Changes in v2:
- Patch 4: report sp as 0 for software event samples, whose pt_regs is
  a per-CPU buffer rather than a trap frame (Magnus).
- New patch 5: fill in pc for those samples via
  perf_arch_fetch_caller_regs() (Magnus).
- Collect trailers. Magnus's Tested-by on patch 4 dropped until he
  retests the change.
- Link the perf and elfutils postings.
- Link to v1: https://lore.kernel.org/r/20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com

---
Matt Turner (5):
      alpha: fix stale user_stack_pointer()
      alpha: stop storing the user stack pointer in pt_regs
      alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
      alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support
      alpha: fill in pc for software event samples

 .../features/perf/perf-regs/arch-support.txt       |  2 +-
 .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
 arch/alpha/Kconfig                                 |  2 +
 arch/alpha/include/asm/perf_event.h                |  7 +++
 arch/alpha/include/asm/processor.h                 |  3 +-
 arch/alpha/include/asm/ptrace.h                    |  7 +--
 arch/alpha/include/uapi/asm/perf_regs.h            | 45 +++++++++++++++
 arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
 arch/alpha/kernel/Makefile                         |  1 +
 arch/alpha/kernel/asm-offsets.c                    |  1 -
 arch/alpha/kernel/entry.S                          |  5 --
 arch/alpha/kernel/perf_regs.c                      | 64 ++++++++++++++++++++++
 arch/alpha/kernel/process.c                        |  2 +-
 arch/alpha/kernel/ptrace.c                         | 12 ++++
 arch/alpha/kernel/traps.c                          |  8 ---
 15 files changed, 137 insertions(+), 26 deletions(-)
---
base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2

Best regards,
-- 
Matt Turner <mattst88@gmail.com>


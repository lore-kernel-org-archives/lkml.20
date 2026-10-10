Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E02DE702
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634913; cv=none; b=rhU1ZPyRgpAUaSKaV8cY4mHmVu1Q5WWIyGJTckQs4bae7il7j9XrWCbC5J6IKdyBSFXLC3nIyHGCnUPlNWnGdWnroTiDpUL+3j4vV40sqFpudRR1ZAcXICMxdGNEmvovZ8BCkQeX4Rihm3YWYEDYucEPk04eC5Ft5ez/mXK/8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634913; c=relaxed/simple;
	bh=zXoxilesAtPJyrfAxnGXqk4X8AL2hwCOtaFRP7CJnBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uqdJe6Ja1fi2ob3Euak8MrdBE4EJ9DNvMxeY8kN4yKXXp1HxlWFn4u+Td61raRQon85iu3PMnvVqPwa2j6uud12ZMdDL8d+OTCQi7kNCm4YmkKdYHd0jyBvWfae1e7+FaWfFRrm2bf7Gbe5YAF9kgjpXuA5dyNP+uVSb4fApVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIr5ysay; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIr5ysay"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1419d3416ceso989130c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791634911; x=1792239711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KEImB+rJ+HNxPnu7ZXYsFF7K4BEwIE7Yr1L57wfEvk=;
        b=hIr5ysay/64SGyyMmkESL276Vzx3jNCQWjSQNWk8/UjHM5FowraEtyUVbxThA0ixkR
         wF9qKkCRaKsy20DRIgzzlsUTxkQpCnSFhaOUUxOYaeGm1EVCJWJD5F1mDQvJE19WIB/T
         MsneRtRUsbqV9HNaMV/NXfaL0HUpRegJkeSmhTy97NV9APpwqJ0wGKZIgjjpRn50NmFz
         1pXp/qg1SNM2q8uXFyrgDJ8lW4Qn+eDStiJXPN/lcy3t7xPY9qkbel7uu6/smAoqEvX9
         uZrYoxwNm4J/8Xj1+3bwqoZCPs1bTjMo1uzz7Q29yPnzccc9YuQxQAdIEPUwnU+XdDt8
         M40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634911; x=1792239711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KEImB+rJ+HNxPnu7ZXYsFF7K4BEwIE7Yr1L57wfEvk=;
        b=TGR1ReSngfYszmeEqCfTQ+80m5Jtm40qyA5gcBj/EYD+081M68MNga5fcu7B8k3UbF
         Ws8obM5qEcRW//Q3uDYK+i++Nr6mim0D2VHIJCh5Ag+SoAOwtYqHOoGTvmBCA8+Tl1S6
         Q4UoaEhOR6t+GS9gam+JI+yD1IXAzLzhX9qCYmzKN0UH63tjn4B8pBHC75V/GkrggKu0
         nM5/FzugLz18/FJO/dT/64iWkcNEapLYuqpXWK/hODJ7Am0EGRpzpX755Xf6RPmfsJE+
         f3pPNaN+qhQaxsWWN+JRX9WXLVOLhKPWt/NQ28jTkETnHVcDrO0c5Z5EoprHrFuCqsV+
         Un7g==
X-Forwarded-Encrypted: i=1; AKwUvBycZUlktz0LoveICTzdKn9IjfSnOX8tvyLY4YzH7v1ernIqHWEt3BDQSBSA+g6nyFYth7MarmbHctN5Zlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6yn79AnT7PAaKrs9c5LbTuxidCIB6UQjFRaLNalVm8uQTNw8O
	RHkMIIgm9McuyccfsXjrTWgzAD4Fja5PTeSMscwtsV9QLeHm26VGDtwk
X-Gm-Gg: AYBFou3DoQSFTSzMzCgDe+vQ7govGEgf4sIEhSjgczjvj24NVqmM2IEPmuw1ohF/DOg
	kVs7Pt+ibz1xhiGdyxfBi8A8QzRDUIWefcl8jGO8TvPOQdutzPtikqcA6eYip3fn4Pt3lgwhy+f
	/SL42XQmI+tYONbJsJGLrA2HMCllV5WEk450tOCzgRkqnFYxMz9pmKKYt9AaB1KQJixlKbu2c0N
	FQuYvhztF062Zsg1moiHXExye80L7+CsiSb2RRstgr9vJ0xZa/6jVq8hQsmdcMCHawzrMLM50Jg
	QGXAjdo4o9JNs3/R5m6cbmztACkwYnDmEI/hwiSxGLOtUI9weNYp4kRFvA9vHUDvFZt5P20msXG
	6eXBVgHin8aqQN6+9ZuxlUXbluzs4+S3NpftLlPKTAmkdSqqbfI3YnVvfHI7uy/5CsmClDr3b4f
	nyGfqjF6CNl75j1Qg39BdGkSpEtJxI05sZIX3HKZd+6eWvQiCtdVbZd0EeiyUU3AWFCu+auaCAw
	QcaB7mIdzaRisvnxwPPZfwd/YDh6HfpTjEdmMko6VD7ftiepBDN27EZzh6x
X-Received: by 2002:a05:7022:f503:b0:16a:f5cd:365 with SMTP id a92af1059eb24-16af5cd03a3mr5524830c88.5.1791634910994;
        Sat, 10 Oct 2026 05:21:50 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm15401816c88.5.2026.10.10.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:21:49 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 0/4] powerpc/book3s64/radix: Add support for memfd_secret
Date: Sat, 10 Oct 2026 17:51:08 +0530
Message-Id: <cover.1791608423.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memfd_secret() gives a process a place to keep a secret that the kernel itself
should not be able to read. The page is still mapped in that process but it is
removed from the kernel linear map, so a kernel read or a speculative walk of
that map cannot see it.

On PowerPC book3s64, if the same address is translated by two pages of different
sizes at once, the TLB access can raise a machine check for a parity error or
a multi-hit. So that means breaking a 2M or a 1G mapping of kernel linear map is
not possible.

The way around that is to build the linear map out of base pages in the first
place and only then allow a single page to be dropped and put back. So, that is
what this series does by adding a linear_map_use_base_page cmdline option.

This is based out of mm-new branch for now (since few dependent function
definitions have been modified there). Once v7.4 is merge window closes - I will
rebase this to latest upstream powerpc tree.

Ritesh Harjani (IBM) (4):
  powerpc/64s: Add linear_map_use_base_page command line option
  powerpc/64s/radix: Implement ARCH_HAS_SET_DIRECT_MAP
  powerpc: Wire memfd_secret syscall
  selftests: mm: Enable memfd_secret for powerpc

 .../admin-guide/kernel-parameters.txt         | 10 ++
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +
 arch/powerpc/include/asm/set_memory.h         |  9 ++
 arch/powerpc/kernel/syscalls/syscall.tbl      |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c            | 22 +++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  2 +-
 arch/powerpc/mm/pageattr.c                    | 96 +++++++++++++++++++
 tools/testing/selftests/mm/Makefile           |  2 +-
 9 files changed, 143 insertions(+), 3 deletions(-)

--
2.39.5


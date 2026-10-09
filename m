Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCAB3451CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511493; cv=none; b=DgU+26K1zj68GL/JA1/wVT2bppSYEGvf4P0OvVW6F4ttYaSb+CLWTWoNgWJGFjSx8HZEUH7BBLjTDhWdOcXiTWGFZtbSX+StQQDaN+GNClA5i7u0ayAWF/RGA86NyD3Sxcl5TYszS26RePTyossqUSZjjQmz/WefK8M87S03aes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511493; c=relaxed/simple;
	bh=eJZETsRJ0Hh20z27qQJ53/aUqbdLLvxPKcw15Y8Xiu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNqEXpqHLIc//bEDncRbzFVS+c907MZDwXipmiTK8tfstqXkJrl9IMYdoPJyRSKtGrkiqHLmQf4fXTiwX58o3VeEaWnsC2tFScZJCbhMYWYkJqBRJzGiVFFJkEEFRxKpxeHx47U+C56ZtmUesYirkUueQXCTfvxYStNnsW3yZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOoD7Bmj; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOoD7Bmj"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15354aa70e8so8599c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511491; x=1792116291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J54/gYCI95envFrHsdO+xt+CtFLWckC3t7mEJfXoeZU=;
        b=tOoD7BmjF/mNuz87C+YFpm0oMR63G1pH+KuaNu+QM8FIrPhYJ+TCB0ThVZzFAI9WnD
         KzDJQh2TWWSrqrg9nqUl1MWQ39Olp1udqg/UpfEkFSb/Uzuo3SiDG3llfsIsgvcCK89N
         c4/yfIOe2T3+A+yuSzhfXumtwMPQroBvtdJFcGGqiL2cKJDYyZ+BrTG/XgzW8G0IyUPV
         /lRa8jiUPBFY5gCruZ+ImMUVSl97WVCRUQOSjhxkJ1aqnNERCq53vKPnv+gjgXB2qLLP
         L9rB+lwa+/Og9MhXV0KgjbqdKSbfoZ4iUuk5RegNLnqXHSJz1O42xNo/3KvlPo1Tss9t
         QLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511491; x=1792116291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J54/gYCI95envFrHsdO+xt+CtFLWckC3t7mEJfXoeZU=;
        b=B6ACyGMbh+lTAi2VY7hhmTgO2Pw7rHwDtElKFFa+oBaEsk3/t7J6I+1d1byAafX7H/
         Ffn1ga6yxCMP5nFnqnwq6B/Ow6IamD0lbLTCzYdty1euscb89xO/c0FAoWjg1Bkks8c3
         mPVYDECHn7VI77NfAtdASOBN1Ldmu9fcN8a6h53+MfwQ54Pw8jJN+Eqdlb2pPPWJHe0V
         B0Niwq1zNnax8h1o0zDXTkSN0ELvvmrdkGyFyNkREB86EzxUyTtOvQzBJ0/KZChD6fDQ
         lFCkBugRmD88ipomLIRGeqdQoZVsUngoV8LwMXICKELUg6aouFpQ2/4/pVNxsDd8G7Cz
         uXbw==
X-Forwarded-Encrypted: i=1; AKwUvBy3eqJduOOUSR/70ai/OY/3dV40CO2B1bQz3q9Q3s2i67p6wrtCTmkk06GtHtfoVrqH6brlLPMcOvwrSSU=@vger.kernel.org
X-Gm-Message-State: AFuF++lHw5Gzt931KNK8coXi57kRqZ2wecaI6+l9vHmhpMvu+EPu8/kv
	+78llWEjBTvNU8IFhVoAHVP5IsmSj0jBbau9/y71peNJVxSqKtdDjjOI
X-Gm-Gg: AYBFou0hAvSOEOC3najyA4wWQrHaUeBKNSLp3enTrWB2F3ccNOQaxJwIiUCpxD3k/wi
	OHSGT2jZXKVzhDqzo0W6Iku0YGIDFurFvgIa/bx//PifYbwYrtkv+1DaSUCr5prMboHvTVPPIbj
	1y+UnZarAIbN0Th1StLG6kVQ4d218rKwI+qr937mB4Q3+X9w78xwzZQ9qyFM6Y3FH+fFFRnB7MR
	3M+wz+KO5i8OynXGeABRM2ii+F+Iuy54xQhm8LATU6Lg636SLSYHoG68Axg5f5+wZn1k6kzBIMZ
	XgnpFWLV5RczU5IwnfdPyqnydgK2tczIdvtMLXh5dCZZYFFrtJCw2qJMkw7YoGaPt0/TLGCHZU2
	lbkmsxxv3RBtL44zFO9fCrdQ65kMeEmvs+wf6LfMwyNwl3FhR/PXBHAvdDrgS3eZ8dWjrbBLIJ7
	M4g/2sYNXBkEb/8TnBD0d7mwbk93Ja6PyGsus4KBix7QYDahZPgjGz1T7pijYnPwKsRg==
X-Received: by 2002:a05:7022:7f05:b0:149:49c:22b with SMTP id a92af1059eb24-16a57733270mr571517c88.1.1791511490964;
        Thu, 08 Oct 2026 19:04:50 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16996eac537sm1970743c88.1.2026.10.08.19.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:04:50 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 10:04:38 +0800
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Unmount the bpffs that
 cgroup_hierarchical_stats mounted
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-2-f93a111da992@gmail.com>
References: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
In-Reply-To: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Yosry Ahmed <yosry@kernel.org>, Hao Luo <haoluo@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

setup_bpffs() mounts a bpffs on /sys/fs/bpf and records in mounted_bpffs
whether it did, so that cleanup_bpffs() unmounts only a bpffs that the
test mounted itself.

cleanup_bpffs() checks the flag the other way around. As mounting on
/sys/fs/bpf succeeds even when a bpffs is already there, the test never
unmounts the bpffs it mounted, and every run leaves another one stacked
on /sys/fs/bpf of the mount namespace that the test_progs worker keeps
running later tests in.

Unmount the bpffs only when setup_bpffs() mounted it.

Fixes: 88886309d2e8 ("selftests/bpf: add a selftest for cgroup hierarchical stats collection")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
index ad19d6d41918a..cc6ab2c263da1 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
@@ -110,7 +110,7 @@ static void cleanup_bpffs(void)
 	ASSERT_OK(rmdir(BPFFS_ATTACH_COUNTERS), "rmdir "BPFFS_ATTACH_COUNTERS);
 
 	/* Unmount bpffs, if it wasn't already mounted when we started */
-	if (mounted_bpffs)
+	if (!mounted_bpffs)
 		return;
 
 	ASSERT_OK(umount(BPFFS_ROOT), "unmount bpffs");

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658003;
	b=mV3gu0Oz2ouPWgUgpz9xt8FIP/XcvmDd/svozWWy44gE8JMbLAfFvRRxNbeL3WZV8FAe
	 Kb5rxedIj8M5/hrJmt5qGip3+GD5e2EkfPXSRxHD5K74BdgJobo9xkFIz0PV1XO9YyxEW
	 1qE67uOw2uVM2ZdlwPceKT7aLvjF2zUvinAjBa6xlGHdA18JAgXHG+ZoO+C6Y8liX+v+S
	 jTe9ajqw+obG1R8zGeZLAD+h9Z5qefONhwGouPXspyQ6a/+9FbA3OwGucxq40Kur07fsn
	 XNEHgfhJli7Afwxx8KDO2/zLAzzq1fn5k3qfdhus3P/SlRsBmua6foWyFgf9VvpKgFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=htbP1Be5/tb7LgqEiuAX137LQm3n+SjOO/0MPt6z5aM=;
	b=o57CP2wE3FXm840vl/YZKa8qfFDovFvNNvGHmb6/j7fxXHJ58TVP9ubuYJRStvXg+KZ7
	 b0WgqnOjEbDVaQMbxZ1X41FZPMOZ8QXOq/zYZ3wJniVQvpU0Z4mT1NK6KixxENDp35iHU
	 WsEicSqy1Bx/PQhuYOvD0tlKH/KGTQsxtqoHf4Y9fcqqUJyLWwvDMF7RQzrSS85KzO2sR
	 POFcp/VYACGMSfOhr0qETzfnUu/SzIf9ZPmkOwFWpwFUiKuiHtSFdvKh0J4XhN6ZxQgM1
	 iwy85I9al4H1i8ccffqgFg4IahZjyFwYdWTO/2PwO3Fok/WkTa4C5+hBgOMZU/hOq+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZvbmRVbB;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88807606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88807606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZvbmRVbB
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1266172a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792658002; x=1793262802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=htbP1Be5/tb7LgqEiuAX137LQm3n+SjOO/0MPt6z5aM=;
        b=ZvbmRVbBIRxBLMdiu6sXsqn4FUagcLZYqMBg7GsnI33T70PtyPdF4VG6wkFZLnBo7n
         Fh8b15/yDRJfZwdsvWRIRyG1Eo4LZCR7/BDQJET+hY/u8EocLSSkSB8s1hJ4GNiDitta
         r51I7MMr6PVnw4CNUYZ8MY1HQVzwu2SHXV7AH8JABjHN9w+1onISaV/8sDcRmztxYmUP
         +euotQWgKrZY+fAkv4OuSbyrAQH8MRutJHhBa/06gXfGS3yEeHd2CDXW3PNcmvbIres9
         jxE5lIU3/8VxELzYklGO2zh0pWc3DQ3z/bPgRN4Ka28NJRa++/JzMO1CZt5pLYKPKFYT
         Vfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658002; x=1793262802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htbP1Be5/tb7LgqEiuAX137LQm3n+SjOO/0MPt6z5aM=;
        b=T+I+HSoi72FORLCdI4FcjkDxXwYx25GLbfmPRpuCv9GiGFK8GvUaANT/2VUjc6rF0g
         QWlM/rY9ATM4e0cMlsdqZ3akH3rP3l90GJW782Prk7xXaM8FFGWOjIqhJIc1E1+3xabV
         Xm5PWtnMSDVPguymspP1WKZCMTN7A8ONOVhftmoL2wsjGPAEJDC65fMHmQ7qOzdwkCsd
         LLah1zUnKvtD+PMJ1E2KinfPBROA9KRXBElI1ffcnhUz616tl9TpLQwMc8AKOqxK6VTo
         37TPCrW1huqiKdtdLgqy7br0TGTfb1pWjH3ATYZRcILhVvchzMZxf96UVfKyxqCU1vAN
         06nA==
X-Forwarded-Encrypted: i=1; AKwUvBwHG/F6HPKUxQwAWBsS2M3Tq//ouoktVbkq67q3KxjEdiPXCjvwcMGOPphDllvg/ELQ7jMIUaFKFR3130Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRRGrfNKrP9JGX04kxcH4S8orkCVaE11nACHFkmQ4nceYCHSmv
	5fksQ+PQgsIWBEomNZy5k/nJgpg76VFc+wDCKm5sQEG3ZIMV/ZC07dA8unkc3/Sb/yw=
X-Gm-Gg: AYBFou1vx28QKlseel87e8VAYoVTwwKivbXeA1tXd6miaV1vJq8Lcn9yGW6c6nfkamw
	aTEtzdyvmzaKFhOBQmQDNQpXOmbUGomD29hruyjwbQojhvU+sX8TZkkSter68yuNZ4GV32/CQoB
	izK3RySCV+9Ickp6QxLiSNT47Bdn17W4i/UuezNJZ6AdgAviwriBj8pKdYmYJeGiXdF/wL3D3le
	gbBDtAEfVa+MzEAA/Logc59WoZJtWqmk2lQP95KsPDexzSpwZzAQh4K/CTlaekq1HfgvwFEi1qK
	wyQkMZIoxYkKxPjnVRpaKU8WM/OiBO+KzbX2ZxWGwT6t8hDeB4nXYY/tVZOjv6j2qsOgwzmWGNe
	MMiguB5JhaJKD89ZkVNXRvQ8mkGT0c/Y3OZnU9KTvUSKu3C6XI9snd1DY7S0NTr81DobwNJQ4e6
	Mi4uHaWt+UvL3AteC2ZfUjm9rAJcc9abNCFrjLOJhYyP/wxKf1fbsxv8+TJ3dUxef45J4dKzYdl
	yo7fLTpXgS46syuLzkfjttrCpyHaNLJgEWtD4kzRAvmRYGCSUV95etS4rKjr5tFJUwJ0i17OnL5
	xmAtMNxqkRydTR8n+w==
X-Received: by 2002:a17:90b:48c9:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ad8708b8demr3966898a91.49.1792658001786;
        Thu, 22 Oct 2026 01:33:21 -0700 (PDT)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm3302053a91.2.2026.10.22.01.33.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 01:33:21 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	zong.li@sifive.com,
	wangruikang@iscas.ac.cn,
	debug@rivosinc.com,
	qirui.001@bytedance.com,
	cuiyunhui@bytedance.com,
	guoziyi114@gmail.com,
	samuel.holland@sifive.com,
	ben.dooks@codethink.co.uk,
	cyrilbur@tenstorrent.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] riscv: Fix SR_SUM leakage across context switches
Date: Thu, 22 Oct 2026 16:32:12 +0800
Message-Id: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

__switch_to() saves the sstatus value of prev and restores the SR_SUM bit
of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
set in sstatus.

This lets next run with user memory access enabled even though its saved
SR_SUM state is clear.

Use csrrc to save the sstatus value of prev and clear SR_SUM from the
live CSR before restoring the saved SR_SUM state of next. This keeps
prev's SR_SUM state intact, while preventing it from leaking to next.

Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
Cc: stable@vger.kernel.org
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a77166971..628b85e3915a7 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 
-	/* save the user space access flag */
-	csrr  s0, CSR_STATUS
+	/* Save and clear the user space access flag. */
+	li    s1, SR_SUM
+	csrrc s0, CSR_STATUS, s1
 	REG_S s0, TASK_THREAD_SUM_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
 	REG_L s0,  TASK_THREAD_SUM_RA(a4)
-	li    s1,  SR_SUM
 	and   s0,  s0, s1
 	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
-- 
2.39.5


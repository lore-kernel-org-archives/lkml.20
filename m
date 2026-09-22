Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A873D9557
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049310; cv=none; b=PFrSW8kUmZgrUzqoU6bK2kqB+Kfc2KHb06eIFzwMuvT/xHK1I7uSSo2120VCAT6UWzee9bPNpG7qkbSe3x4zvx9tl38Q4kSHmmMO6ncbHAB9QGzCcTyEygUW+KraFxCFGgqtvk9h/+DG1i6OccY1amtf3azicMvu9OqE72r/0p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049310; c=relaxed/simple;
	bh=9O4BS/2LCjUV4na/Pf4a2/cIXigBAgNbXGVfyGhz3cY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WA9FCtY9R86N7ny9rKzcp+GN4QB6UrR4PC20FLS9nmxCQC8tMVeeNkipsXEbJARBx0/2pAX7yv4gDWrJ0S88CgRMzMSM70hCgYfAjjlEXsypi4HmkFJ5YLcOgINzPran91jcx3d2l5ZIcU4iZEwGIArM1km0kQyV3Gc3EOSECY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EnMiwqNP; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EnMiwqNP"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BygUDatlIF1iDxxLJ/FKhjR0XU9vdmKuayXfRgYRzrk=;
	b=EnMiwqNPZZH1KtU3QXl6eSSolMSKyPdOOyHkkHliNHfp1tc/Z/1xYkadMBN8MYAMbh3hvIoNB
	sb3y/QXkorWi5FFwPSEb3gqP1sc4oZy883zBRddCdQJi78oAiH4l+YAuc//znWnbiQfu4KPMduE
	SMZ9O9fEQUlMavMZ/+YBsec=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDL2m4Xz1prLc;
	Tue, 22 Sep 2026 11:44:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E060F4057F;
	Tue, 22 Sep 2026 11:55:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<vladimir.murzin@arm.com>, <tglx@kernel.org>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <ryan.roberts@arm.com>, <pengcan@kylinos.cn>,
	<kmehltretter@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v19 08/14] arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
Date: Tue, 22 Sep 2026 11:55:04 +0800
Message-ID: <20260922035510.1090299-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Introduce a helper arm64_syscall_exit_to_user_mode_work() that
encapsulates the re-reading of thread flags and the call to
syscall_trace_exit(). Use it in el0_svc_common() to replace
the open-coded instances, removing the duplicated flags read
and making the control flow simpler.

This aligns the arm64 exit path with the pattern expected by the
generic entry infrastructure, which uses a similar
syscall_exit_to_user_mode_work() callback.

No functional changes intended; this is a preparation step for converting
arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Can Peng <pengcan@kylinos.cn>
Cc: Li Qiang <liqiang01@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 7 +++++++
 arch/arm64/kernel/syscall.c      | 9 +++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 696739f5a250..3e4672ab4a4f 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -123,4 +123,11 @@ static inline int syscall_get_arch(struct task_struct *task)
 int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
 
+static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long flags = read_thread_flags();
+
+	syscall_trace_exit(regs, flags);
+}
+
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index e778aac6fab9..0061fc63e7ba 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,16 +127,13 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP) {
-			flags = read_thread_flags();
-			syscall_trace_exit(regs, flags);
-		}
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			arm64_syscall_exit_to_user_mode_work(regs);
 		return;
 	}
 
 trace_exit:
-	flags = read_thread_flags();
-	syscall_trace_exit(regs, flags);
+	arm64_syscall_exit_to_user_mode_work(regs);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1


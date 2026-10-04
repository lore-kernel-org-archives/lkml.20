Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821C33A6418
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121268; cv=none; b=PkJM6+qfk4vauS/OnVJcBeZPqHxV2Goyw/67geiBkIJcXI2joYwPFsFX8g4ICBmGiVeZZZt49zT3hN5GFEZwFqw7WoxFTXygYfdw3Wxht0UJxpKYKD4gVg72CqoA8yODEoy2fq4fmWugU3B7k0vaOAXhzTBEbK17lscNz6ICXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121268; c=relaxed/simple;
	bh=1BlqLPKzLUo6inqf0BaCZQOm3RM26OQqRAV2zy42MzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmKVJh5sBEn39bHrKBoLTtNUcDDHPjVS2+gBiChgtvvndAkrH+xXxuCFXnYxN0SCYi2Uryi54qgf9B9lfa8Z62iy5b+M5rsQTZrI/FBSumQpYgYHPn7R/TELS4ryfNhHgybtaH0tB9i2GIY9Y16eGw3XTy4ZejqhS96Hn4zJ7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8Axj9FoV8JquYYSAA--.54257S3;
	Sun, 04 Oct 2026 21:40:56 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAx2c1gV8JqfWUoAA--.19823S2;
	Sun, 04 Oct 2026 21:40:54 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3] sched: Update the THREAD_INFO_IN_TASK description
Date: Sun,  4 Oct 2026 21:40:34 +0800
Message-ID: <20261004134034.3622868-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c1gV8JqfWUoAA--.19823S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFWxtw48Aw13Jw1kJw4kXwc_yoW8uF4Upr
	Z3G3W7Gr45Ar4F9rWkJa4xuFn5Jrs2gay5Gr97J34UK34xGw1jgryfCay3Cr15Ar4v93Wj
	yr4qg3sxWFWqkabCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0L0ePUUUUU==

When commit c65eacbe290b81 ("sched/core: Allow putting thread_info into
task_struct") introduces THREAD_INFO_IN_TASK in 4.9, the only supported
architecture is x86 and thread_info only has a flags field. The Kconfig
description said thread_info should only has the flags field but didn't
explain the reason.

When commit c02433dd6de32f ("arm64: split thread_info from task stack")
introduces THREAD_INFO_IN_TASK for arm64 in 4.10, its thread_info has
more fields than a single flags, and arm64 works well.

Then commit 37a8f7c38339b2 ("x86/asm: Move 'status' from thread_struct
to thread_info") adds status back to thread_info for x86 in 4.16, and
x86 still works well.

After that, risc-v, powerpc and many other architectures all introduce
THREAD_INFO_IN_TASK and their thread_info have more fields rather than
a single flags field, of course they also work well.

I don't know the exact reason of the original description, but obviously
it is wrong and misleading, so I update it, let LoongArch and some other
architectures easier to support THREAD_INFO_IN_TASK.

Also improve the try_get_task_stack() and put_task_stack() description.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V3: Update the Cc list.

 init/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 8583d9f06c52..921f2fcdcb30 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -210,11 +210,12 @@ config THREAD_INFO_IN_TASK
 	bool
 	help
 	  Select this to move thread_info off the stack into task_struct.  To
-	  make this work, an arch will need to remove all thread_info fields
-	  except flags and fix any runtime bugs.
+	  make this work, an arch will need to remove the task_struct pointer
+	  field from thread_info and fix any runtime bugs.
 
 	  One subtle change that will be needed is to use try_get_task_stack()
-	  and put_task_stack() in save_thread_stack_tsk() and get_wchan().
+	  and put_task_stack() in save_thread_stack_tsk(), get_wchan() and any
+	  other stacktrace functions.
 
 menu "General setup"
 
-- 
2.52.0


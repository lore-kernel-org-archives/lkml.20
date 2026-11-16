Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852300;
	b=16CY7rCf34bMk/ZT2P6CFkzSbFnLHEG0oQXHaz4HOWOMiChxW0oQfDE+CVVMWkCR0UBQ
	 8cpHOolcVSG/4Uj5HcNyxmY2exxBw0ljuKOrWAmqrQmbSpA8s7MkOyko5wvK7/oo2BNUc
	 JJOq3gTtDD179nEzFE4IpmaBToQ0SDx3TgrX2yXMi4ek/bpA/Lo6MdTB7tXmyRsZFMp+1
	 r3z2XbsZU+av/ehQFEJj2XrPfygkUB1Z9cKITkDQsoER8mNKVg5KFbI91uEbZ358rvzXC
	 XKcOYTJvOWnwuZZdnXHd0Ssv+f+RogLq7mgHyW+hVkD7VpGyXCWboKwUtoTIOl9LCYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852300;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rBdL7/NEK0gS4E5sLQz6+qp95gj/p8G8f/44Hp03EyM=;
	b=3h/BEkliqh+l30nm+48krRl+0/M1JHeQq3IQso0rdkhlWX331/NtaMDKa/7dquTH9FuD
	 Yh0Vark+vaM+/6kSKs9zZ0JjSldP0MgG1W8c/4f95pqtpQGeoh//U90twuLaArkSw4Zfw
	 SMd/QIGl4NmGwPDTLef7Ub4nQOp9NxHklC6JzQEaTKnW0VnlOhzfsHsEODzhD2PyyPD9c
	 D9//3Tvvq0WeBFNk7sDjYXLjEkgggOzmaoHXb9djjiA8n7xzQQJRiWLgATWKAtApyM0JR
	 JPCVHr/rS5tY31Mny0/5sFN4ysHH6BBW3U/+vsr1hzyHMZFVakI19LgWistuVx0fjkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UigvgyQ5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2FB606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UigvgyQ5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D711F000C4;
	Mon, 16 Nov 2026 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852299;
	bh=rBdL7/NEK0gS4E5sLQz6+qp95gj/p8G8f/44Hp03EyM=;
	h=From:To:Cc:Subject:Date;
	b=UigvgyQ58nzOynrScpwhO+BChiVqk/6H+4dcLO3qaKG8AHX8h7B/NkUP4KleBJ1WG
	 +/IYDIZQjAnqSPWo0KZWFlJyTMEGGoZR4DI4d4ylD+nz6K7HRVkK6jbXaw2W4NlUPF
	 z/nSMg247MjcDBvk+T+8++bg/KG8TIJav9jIqAVu3d8HQy38/8Tf/yfH6tjzf8Cwjr
	 OV+sgSb2DfoCUB6C51RUWTe+0MCtg0gQIUNH70zjzULdiTdsDeKpHN579n1b21v6qa
	 03GclzTL+eZIoCKualLLGgFXpPrzvMA1sYWyIx9NZOvetMPFy8NNr71fh9Ilv9nsF0
	 e1coDjrEncyPg==
From: Sasha Levin <sashal@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: allocate the signal page at boot
Date: Mon, 16 Nov 2026 13:04:58 -0500
Message-ID: <20261116180458.3432038-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

arch_setup_additional_pages() allocates the signal page on the first
exec, without any locking:

	if (!signal_page)
		signal_page = get_signal_page();

get_signal_page() also picks the random offset of the sigreturn code
within the page and stores it in signal_return_offset.

If two tasks exec at the same time before the page exists, both allocate
one. When the task that picked its offset first is the last one to set
signal_page, signal_page points to that task's page while
signal_return_offset holds the offset used in the other one. Every
signal handler that returns through the signal page then lands in the
wrong place, nearly always on the poison that fills the rest of the
page, and the task gets a SIGILL.

Only handlers installed without SA_RESTORER return through the signal
page. glibc always sets SA_RESTORER, klibc doesn't. With an initramfs
that runs /init with klibc's sh, init dies on its first SIGCHLD:

	Run /init as init process
	Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

On i.MX6Q SABRE Lite the first execs come in parallel on every boot:
the two SD hosts probe at the same time, each requests ledtrig:mmcN, and
the two modprobe helpers exec together. KernelCI hits the panic in about
1 of 400 boots of that board with a klibc initramfs.

Allocate the page from an arch_initcall instead, which is what the other
architectures do for their signal trampoline and vdso pages, arm64's
sigpage for 32-bit tasks included.

Fixes: 48be69a026b2 ("ARM: move signal handlers into a vdso-like page")
Cc: stable@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

 arch/arm/kernel/process.c | 10 ++++++++--
 arch/arm/kernel/signal.c  |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index d7aa95225c70b..615a8fbd61bc7 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -379,6 +379,14 @@ static unsigned long sigpage_addr(const struct mm_struct *mm,
 static struct page *signal_page;
 extern struct page *get_signal_page(void);
 
+static int __init signal_page_init(void)
+{
+	signal_page = get_signal_page();
+
+	return signal_page ? 0 : -ENOMEM;
+}
+arch_initcall(signal_page_init);
+
 static int sigpage_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
@@ -401,8 +409,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	unsigned long hint;
 	int ret = 0;
 
-	if (!signal_page)
-		signal_page = get_signal_page();
 	if (!signal_page)
 		return -ENOMEM;
 
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 763e1930a1ea3..2b8ccebd33b65 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -648,7 +648,7 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 	return 0;
 }
 
-struct page *get_signal_page(void)
+struct page * __init get_signal_page(void)
 {
 	unsigned long ptr;
 	unsigned offset;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0


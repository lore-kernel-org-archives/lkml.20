Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D1149E153
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860963; cv=none; b=ucfb2Iqnxm3QgkE8hFTje1hRPraPiFYUKokLtowafQUxMBbIbPzim7cYCv7ekyVW1sW2UNiMSg8sii155awmpaRK3r/ktCP1uzUwy+eHSi3D1NCxw1gQA3kopEUYjTSWh+dGCTXoF9gLsQ7iDiCVuN3Qtepxodnhu11PIGXE+oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860963; c=relaxed/simple;
	bh=EwI2GMeLr7NGmBn3bi3YUvUUpF0IxEv9vIN7XOIhjBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSHhyCjDxN8ht4UDAGBIfuhTI3Z6IQYcJlphDUkcU5pQyidfWbmnju2zbY3sknSfIzqe7edYU8/jHxh+Jb18N4Z7+SVr1Hu8+ggRAJEcj7GGDJdI4vFvFJIlv4BXmHd6l2Azy8AO4f9T66wvJTCJZ7BICRP/N+WyLTGj+0oO518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=TDmSABuf; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="TDmSABuf"
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id 0062D20B7168; Thu,  1 Oct 2026 06:21:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0062D20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790860909;
	bh=GISBfCNPceIZSjVaURcaK2XPuYCZTPOv4jPbHJzoivY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDmSABufyhX1yZ1RR4wJ2LCnh2cL6ZgHS7YPAIQcLYNot3Y2Ljzc7exn+pd6dLj4z
	 SNli2qg4G8RNSzyZzOLJH5eu7VNcEQA9uvjAaCZ3YooNxum55H6LkU7touRKSf0vt0
	 hrCP1Rd5135XHBp3B5sLwjNuRJAmWgaUW7gWkhAI=
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] kexec: Add helper to report an active kexec reboot
Date: Thu,  1 Oct 2026 06:21:44 -0700
Message-ID: <20261001132147.1703600-1-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261001132128.1703511-1-shradhagupta@linux.microsoft.com>
References: <20261001132128.1703511-1-shradhagupta@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A shutdown callback in a loadable module may need to distinguish a
kexec reboot from a normal restart, halt, or poweroff. The Hyper-V
VMBus driver needs this distinction when moving its kexec cleanup into
a common syscore shutdown callback.

Add kexec_is_in_progress() and export it to GPL modules so the callback
can remain guarded when VMBus is built as a module. Provide a false
inline implementation when CONFIG_KEXEC_CORE is disabled.

The helper reports only the normal kexec reboot path. Crash kexec and
preserve-context kexec do not set this state.

Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
---
 include/linux/kexec.h | 2 ++
 kernel/kexec_core.c   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 8a22bc9b8c6c..827a5311d97a 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -468,6 +468,7 @@ bool kexec_load_permitted(int kexec_image_type);
 
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
+bool kexec_is_in_progress(void);
 
 #ifndef page_to_boot_pfn
 static inline unsigned long page_to_boot_pfn(struct page *page)
@@ -544,6 +545,7 @@ static inline void *kimage_map_segment(struct kimage *image, int idx)
 { return NULL; }
 static inline void kimage_unmap_segment(void *buffer) { }
 #define kexec_in_progress false
+static inline bool kexec_is_in_progress(void) { return false; }
 #endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_KEXEC_SIG
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index dc770b9a6d05..282c7b3c6c35 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -23,6 +23,7 @@
 #include <linux/hardirq.h>
 #include <linux/elf.h>
 #include <linux/elfcore.h>
+#include <linux/export.h>
 #include <linux/utsname.h>
 #include <linux/numa.h>
 #include <linux/suspend.h>
@@ -54,6 +55,12 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
 /* Flag to indicate we are going to kexec a new kernel */
 bool kexec_in_progress = false;
 
+bool kexec_is_in_progress(void)
+{
+	return kexec_in_progress;
+}
+EXPORT_SYMBOL_GPL(kexec_is_in_progress);
+
 bool kexec_file_dbg_print;
 
 /*
-- 
2.43.0

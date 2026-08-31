Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A33C1D4B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159866; cv=none; b=a7nfpRLqbHkWVbF+YULm0Kl5UhBNaUS88qmyb92uNMXCWgHKB/zANHnfC6uNcxyLRMPrTwGXlX0CBwDEplqmGPfu3YYBGyo0e4Zp3I9WB+KIa265j46dPgTlzgEGsGx4sRP73a59SyjpkywjwlFz8U0yO0djPhygzwW4irx1UfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159866; c=relaxed/simple;
	bh=mAD24BuE8vaGJ0loXycbTB7KWlsBNvDzMvt7q56tEgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMMmhHeUcYAlMwP0LzliKWMBrQ7sGlPk8qWBkQdn37LSWUFChkyfJcrPjgTI7WhFWa3RD/FrDLe2shYjyhs7dCed+7cUH3VCOAsll5Wt+xcYO9MwfTLqtB44l5soK35ENdyeklK3qbncMb2BgH12VBm6wG15GuQjSr9QK88kzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZN3QoZKm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZN3QoZKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C0C1F000E9;
	Mon, 31 Aug 2026 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159865;
	bh=UgoNySTG1VkGzv8m2Lu7qXZrUu7csPOej6EJf2W9004=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZN3QoZKmZhEFSj/Tx/fN4HRh9tRmgf86GRTFhT8Fy+s7tvi7jDFzvrbSB37Fgf5OV
	 1Bt/Ry3MsQ3ssoudnmrk3mGiHwrq9ceDqrDgxb1x7491tztN6gNzhSr4RPPpVWWZBZ
	 zPbEdVo6ha+nkLwXaRS52V/7oUbOikax4mWPwgmxglvVzZsELxKHQzpeAwC9GIcQ2O
	 WTsbLaTW6p2fdmPEWHR71pQTOyuAqvKPags+g/Wm5/44FDQl5xVk2cKdet7UUzK8uF
	 6WrToy5TGU0cdFRsTtgK0WVTHi/Z/dCBWjYNMGUcbDwo5Hp4ZPqpmJjTKy0eK9ZijK
	 1CYOoXX1tc9PA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	tzungbi@kernel.org,
	tfiga@chromium.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pstore: Bypass loglevel suppression for pstore console
Date: Mon, 31 Aug 2026 07:03:46 +0000
Message-ID: <20260831070346.3490745-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260831070346.3490745-1-tzungbi@kernel.org>
References: <20260831070346.3490745-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pstore console largely serves to continuously dump kernel messages
to persistent backends (e.g., ramoops).  Currently, it inherits the
global `console_loglevel` constraints.  Relevant verbose logs could be
omitted from a crash dump if the system uses a strict log level to
prevent spam and bottlenecks.

Unlike physical consoles, writing records to RAM (ramoops) is extremely
fast.  Applying loglevel limits to pstore provides no system performance
benefit, but sometimes costs engineers the crucial verbose debugging
context leading up to a kernel panic or lockup.

Introduce `PSTORE_FLAGS_CONSOLE_BYPASS_LOGLEVEL` to allow fast pstore
backends to capture full and unsuppressed logs directly regardless of
the system's global loglevel setting.  Opt-in for `ramoops`.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 fs/pstore/platform.c   | 4 ++++
 fs/pstore/ram.c        | 3 ++-
 include/linux/pstore.h | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 1d76c9d92056..88b894163b25 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -421,6 +421,10 @@ static void pstore_register_console(void)
 	 * calls may have changed settings (specifically CON_ENABLED).
 	 */
 	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
+
+	if (psinfo->flags & PSTORE_FLAGS_CONSOLE_BYPASS_LOGLEVEL)
+		pstore_console.flags |= CON_BYPASS_LOGLEVEL;
+
 	register_console(&pstore_console);
 }
 
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 2eb0d4fa2186..945dd55be97a 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -825,7 +825,8 @@ static int ramoops_probe(struct platform_device *pdev)
 		cxt->pstore.max_reason = pdata->max_reason;
 	}
 	if (cxt->console_size)
-		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
+		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE |
+				     PSTORE_FLAGS_CONSOLE_BYPASS_LOGLEVEL;
 	if (cxt->max_ftrace_cnt)
 		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
 	if (cxt->pmsg_size)
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index fed601053c51..34b4acfa21ce 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -206,6 +206,8 @@ struct pstore_info {
 #define PSTORE_FLAGS_CONSOLE	BIT(1)
 #define PSTORE_FLAGS_FTRACE	BIT(2)
 #define PSTORE_FLAGS_PMSG	BIT(3)
+/* Bypass loglevel for fast consoles */
+#define PSTORE_FLAGS_CONSOLE_BYPASS_LOGLEVEL BIT(4)
 
 extern int pstore_register(struct pstore_info *);
 extern void pstore_unregister(struct pstore_info *);
-- 
2.55.0.897.gb25b4bd76c-goog


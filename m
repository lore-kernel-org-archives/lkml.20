Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D046EC96
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116189; cv=none; b=drTl+l8TKEYaGjFM8f6ZhQ6Zwc10nfdgRwtmNlEqyANKubj5GFp8jRzUcf2AsC3MkRSB8/L7fzAEVlqmsRHzQl/9jAfKKtRMOTeYi5zZMUYIsXnbo/u655SLLTNKpkyNfbkjJGEg6FXfnh/Fo1t/yVUUmVttIRfy2llEGQxaJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116189; c=relaxed/simple;
	bh=HCONgzhemd2Szyz15WSt/f+fVF6I/v9uEhenMnKK7uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWAxYHvjrrq2TvcK0Q++5CQUYfuLQolKaISJ89Y655tqiqLpSqCCvvARYEWbtg/icz9Rt+JkuWTDNlmWUunN5NLgyo1lRaLyQkDQHqouA0VgMBMcZ9SbKt4PL9sAic7H8V+xVwbUDYhpaq/YdCfElwZ84p8SgUTKiz0ZUHbr2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5333921B8B;
	Fri, 11 Sep 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC3BF132D3;
	Fri, 11 Sep 2026 08:43:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LIM/OBm/o2oJFgAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 11 Sep 2026 08:43:05 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 09/17] x86/msr: Introduce sync_cpu_after_wrmsrns()
Date: Fri, 11 Sep 2026 10:42:03 +0200
Message-ID: <20260911084211.3149957-10-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 5333921B8B
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

In order to allow using wrmsrns() for multiple MSR register writes
introduce sync_cpu_after_wrmsrns() which will then do a CPU serialize
operation, if the hardware does support the WRMSRNS instruction. In
case the hardware doesn't support WRMSRNS, sync_cpu_after_wrmsrns()
will be a NOP.

Suggested-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 arch/x86/include/asm/msr.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 91d6f481732b..6ae8a49f9c07 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/percpu.h>
+#include <asm/special_insns.h>
 
 struct msr_info {
 	u32			msr_no;
@@ -362,6 +363,12 @@ static __always_inline int wrmsrns_safe(u32 msr, u64 val)
 	return err;
 }
 
+static __always_inline void sync_cpu_after_wrmsrns(void)
+{
+	if (cpu_feature_enabled(X86_FEATURE_WRMSRNS))
+		serialize();
+}
+
 struct msr __percpu *msrs_alloc(void);
 void msrs_free(struct msr __percpu *msrs);
 int msr_set_bit(u32 msr, u8 bit);
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023897;
	b=iSm29+mkMgcd+hNeIhQd5vOCjqVyawMUGttzfRDai7pWFvuIq0hgm8YdSccLDkCYd4Fg
	 1TKaAwuyFk543F6w7dOEyPHv3WtXSBEYPzKAjjn2y0c+K4i7AmEq3LGNzqcwLpq6aagTn
	 WXhUvUbmmBpMj+ArbrBbZVGYE6HXuMnIc299xDhn/s3lJKogzF7noZf0cT0mq+a1Ifeaw
	 NV50QIwQ0oECjRKnXz+FNQ29RV6MVyNm7P4jAh5hLuv6BoTMyDACO/OK2OkikiBIZsGhv
	 f+kewXr/5GQWf0C1qjiNTw28BSNGSCq9AOqjhLnz5LFzd6/VOquYBTiQlJogtfEBCDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023897;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=Lmw+Yu0krC+oou/idYnxcbQ5yqEFkFsf+u9zFzTMwD0=;
	b=aSzNi8Nv0UFk3J98VwuBzAqDuaStEUILX+/Vk7uXBbiPSaJflKnC3lLQHw1V50KtsSS7
	 R7U8mtIVk7Y++twY5nxCUuaC7ydjwN6pTnLrskLQsqWxl3/QVGcg7nFZibhXfVL+9YazR
	 5uvIUpIzXlnrg0fMdwnjXbdX1bxftcXY7dIdayQLFRjCnPUGbcirQuMHZN9S96xE4DhkP
	 6a4HSKKDTKPEeKYYzUGXiK/dEId0ofQGsRCmKKtyak7kwHZg9rjSFnHCneRfu7z6kpYPR
	 1rjPlU4gLcaoetYBnjNZ2gysSv2YjNLftm1p6Ucc2Il+1XiGVUf+FoBCTs0g6tjnjGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19843606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19843606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A8801F7F0;
	Mon, 26 Oct 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E513113319;
	Mon, 26 Oct 2026 14:11:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qHVFLZZf32pBJQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 14:11:34 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 2/5] x86/msr: Remove native_wrmsr()
Date: Mon, 26 Oct 2026 15:11:17 +0100
Message-ID: <20261026141120.780172-3-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026141120.780172-1-jgross@suse.com>
References: <20261026141120.780172-1-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 5A8801F7F0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

As native_wrmsr() has no users left, remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 95761803c2e6..bfad2b96a892 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -95,9 +95,6 @@ static __always_inline u64 native_rdmsrq(u32 msr)
 	return __rdmsr(msr);
 }
 
-#define native_wrmsr(msr, low, high)			\
-	__wrmsrq((msr), (u64)(high) << 32 | (low))
-
 #define native_wrmsrq(msr, val)				\
 	__wrmsrq((msr), (val))
 
-- 
2.56.0


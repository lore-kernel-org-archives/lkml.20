Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845013;
	b=M8+ACPCeIyM6WeramlYVd3URoefAMJFu54jjQklYDMGwQvN4aQb+fQvNu+R1zYCT8txN
	 YEWmTb6sSWPX6PbHhmFSvpXSPTaGmd4wKME9h+5PxAPqq3tijYSsdZPuNI5CiSq5vnbui
	 vz4XIjssq3ooTy3k9l9PxxcJt+rEURRBWkY9Ob44m47vuEDHdGTFrJMZ/MSUNRmd9E5WE
	 gmAJRabulAh3LD5d9+9p8ViILXbqDfKTsAPk9jm967GuGFJnn9isvO7G9dpOOu0mUOA4p
	 gUuBiXkemREDrRds70Kfl7ejRLqBo0H6d2CfvfNgvzAIePm7fiLkBwvMdutQJ4XY1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845013;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=PCR1dfBuCyi4j9Ex1YrBVtOtnXdJ51S+UwcIuHoQVfg=;
	b=Hq9EqtPROP4ouBGvbBujczPAMA53o0pI6QzdutdRihZHUmaEzinkdiJvULcwg400KlRJ
	 dnwknE2REIMbs3pU5YhjkmlMgR0DRzjEWz2icwtEPh9c6I+wwHOYi5m6oMqKhCXZFQ//m
	 8DU532b95BalwXTuQLPHiO5/19T7CdjGj1ywZnM2wi5purciw964INrECIWGhUfqHnYmR
	 alqyhib8u337xy9Df2qIxqU3Y6rDCpmBZHIiVqPQuor2CZC6EmdGSdgM7QkN5R991VUgM
	 58ccihPMEHbVxD2V5nT6xC8cXCittUT7mlcEFaJHj7j17fiqo/0V+3TwDcRrexhS8xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC35322311;
	Mon, 16 Nov 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7333A1334C;
	Mon, 16 Nov 2026 16:03:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tyGxFFMp+2qwUwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 16:03:31 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 5/5] x86/msr: Switch native_wrmsrq() from macro to inline function
Date: Mon, 16 Nov 2026 17:02:59 +0100
Message-ID: <20261116160259.1579333-6-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116160259.1579333-1-jgross@suse.com>
References: <20261116160259.1579333-1-jgross@suse.com>
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
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: DC35322311
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

Make native_wrmsrq() an inline function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 7bb5bf408fa6..3b33d432bc24 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -88,8 +88,10 @@ static __always_inline u64 native_rdmsrq(u32 msr)
 	return __rdmsr(msr);
 }
 
-#define native_wrmsrq(msr, val)				\
-	__wrmsrq((msr), (val))
+static __always_inline void native_wrmsrq(u32 msr, u64 val)
+{
+	__wrmsrq(msr, val);
+}
 
 static inline u64 native_read_msr(u32 msr)
 {
-- 
2.56.0


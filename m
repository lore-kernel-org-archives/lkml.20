Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023916;
	b=CN1PNaM3d1yB+pyeEOWula2C9OtIg2Gou8hb9XZVb1Fvc+ADGT4lW4XC4joSTY0DcyZ+
	 hUJMV1GyVDDYB0O85uVtYN/SFtoLaie1LxofiJ8Gt/j3GbT9MP/YRJ2x+M5xkcWYdlSFu
	 rjG8La1ttWYjOpNJQb8uDpd6vA5/gcXU9vxtDYaQ7nfd4HIFr/joSECfNQyJEdJ+T3Hwk
	 3rNTKpcGr8asfTuti5Q9n11VM/jogPp/XJp1+vbdOo2SOf1B1iR20FR0rnEhTuIL21svx
	 ETsuKAxtnqgKTD9Pn5uFlCL2hx3kTAz5LcV5a1cf0N35nOH+pPhUXbXQwXQ9C7ycwsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023916;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=PCR1dfBuCyi4j9Ex1YrBVtOtnXdJ51S+UwcIuHoQVfg=;
	b=5djG1LPjqG8b7dPQKqlekTOZtSN/JClzVX5aRIcAFaswhQHs2pjMxwvMeWfZCBckhYOc
	 PwybEnM4Ovq9Ys7RHknKorTe/VBaQ+Q3h9gGNDiAhSWfcpIozfHA4mWPqq3KMV+LJG/1K
	 20mOj3Ba7Csje3nexiw4G2PUCKW/MZVr0HtXbFGN8yM1rXTVbDQimvVz2myYAaFaIEPyY
	 V4gihGn3cQ2UX0OEboiweM2pLz7XyYMt4MkvblVThvv+DE0zmXAsU9HiPtAIgfW31ohn4
	 39B3cP+KJsU0F7g6h0bA2NNY7bhlXeguZC/ZdgGRfykPn26IVEGJnZdVnOEAPjTfiQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CPEiwmzh;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CPEiwmzh;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B1B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CPEiwmzh;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CPEiwmzh
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 744491F78B;
	Mon, 26 Oct 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCR1dfBuCyi4j9Ex1YrBVtOtnXdJ51S+UwcIuHoQVfg=;
	b=CPEiwmzh/3p/WhUnaIko+bkBMElIoemkXnGe7JGlGfci0uBJvcQLgY/f08RMOrFhdvSJiH
	mF1HJBSxUKNJKQaxuhAOLoZSgYuZErSl9eMJHfs3bDcTxIUMDRDFQcaymx9INtyIhX450V
	lakJkjSfsp62BQwNeRPpKth+ejyHGLg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793023912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCR1dfBuCyi4j9Ex1YrBVtOtnXdJ51S+UwcIuHoQVfg=;
	b=CPEiwmzh/3p/WhUnaIko+bkBMElIoemkXnGe7JGlGfci0uBJvcQLgY/f08RMOrFhdvSJiH
	mF1HJBSxUKNJKQaxuhAOLoZSgYuZErSl9eMJHfs3bDcTxIUMDRDFQcaymx9INtyIhX450V
	lakJkjSfsp62BQwNeRPpKth+ejyHGLg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F25013319;
	Mon, 26 Oct 2026 14:11:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AI0FNqdf32ryJQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 26 Oct 2026 14:11:52 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 5/5] x86/msr: Switch native_wrmsrq() from macro to inline function
Date: Mon, 26 Oct 2026 15:11:20 +0100
Message-ID: <20261026141120.780172-6-jgross@suse.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80

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


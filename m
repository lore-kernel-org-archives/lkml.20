Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844997;
	b=gBpyfFJ+DBhjnkjG8uw87xgHVe3o1CWHaDCa5nEjwxax9i+X3lfDBTgzEs7fK7LjDSeO
	 RrpJ4mr9U6LxVtbQ3f1YK4BjZQA4V5MTZ8xGngbuvMV5jJ/QeeKpQDDepzYdgQQw3RBsD
	 aMXLF3uLwJgrSeFXhlxA817HVGYDeDDA4Z2BYLwWuMfhUwrZFUTMqw0j7mez43AE3bW26
	 D5qWrW3EiMQVOwB+0Z3PvCZ8IlBWU42AvnC31NIKbKcSrxBU1T/Pqm+7syinWfUxY1PwE
	 6aETwzQcpiPmowBcUb54eyoHDx+cOM/qgs7SDXhwVaU73lXsR4vDzI7uPhfdx49aR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844997;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=Lmw+Yu0krC+oou/idYnxcbQ5yqEFkFsf+u9zFzTMwD0=;
	b=DF3ciO5Tbdoqcsy3hodSW2qklRQkHzoE65WIn3eOlfMOEf5257dTxnro9XH+hb6Y38Uk
	 PbgixMb3ORxVpQ0IJhCpkxXxznLwphe3tGhMCVRT7KcJyFXO4FVPweR+sqK7I4MOKizMT
	 Bf5aB8/gMF6Az8eP/nsrFYJXbTqb1vyd/vxTsE47Ltmk64FtkJWtmwzyzYR96JpWC4irW
	 /3lE6wQf19O1TTeQiUpCcNmumz9OnwGnhX0EDEsQnpKwOT6aVVLs9j5zuSDLAtjZGxDI2
	 kI1O96/9E7XG4YyGzNoVvsr9mrtQnd6Jx7/gNA6KwQDoCpTiyepfl9GYciWPBt/PoFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WwroPtWh;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WwroPtWh;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA7606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DEA7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WwroPtWh;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WwroPtWh
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9D9522310;
	Mon, 16 Nov 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794844994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lmw+Yu0krC+oou/idYnxcbQ5yqEFkFsf+u9zFzTMwD0=;
	b=WwroPtWhbMnpjQ2x59oP1sEsbjvq2lqYERbDHUXJmLJcWftCsYoTjw9cYzvwxR1LoruTje
	79TODrpHsLUm973JdkTBPpJ+dYHPIslrs1F7v2TP0nsdDlKNKRBSG9iIb3AxINrOBUPEpn
	ItbsYpEeCEKm0z3IUetJvSqqZxvlIhg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794844994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lmw+Yu0krC+oou/idYnxcbQ5yqEFkFsf+u9zFzTMwD0=;
	b=WwroPtWhbMnpjQ2x59oP1sEsbjvq2lqYERbDHUXJmLJcWftCsYoTjw9cYzvwxR1LoruTje
	79TODrpHsLUm973JdkTBPpJ+dYHPIslrs1F7v2TP0nsdDlKNKRBSG9iIb3AxINrOBUPEpn
	ItbsYpEeCEKm0z3IUetJvSqqZxvlIhg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 547A71334C;
	Mon, 16 Nov 2026 16:03:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9pRwCkIp+2pqUwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 16:03:14 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 2/5] x86/msr: Remove native_wrmsr()
Date: Mon, 16 Nov 2026 17:02:56 +0100
Message-ID: <20261116160259.1579333-3-jgross@suse.com>
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80

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


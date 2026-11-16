Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841343;
	b=jU3sWC0e9WxawNEgFPUJnSViP7jaqyE+l33wGsNoC6KgbephjXc3GpwWwenR/PXpk7x1
	 QRYJsruTkasXO1Nw/R4crBv0NiIqOo5ETasxCQgsehFoB/qQiP/a8AEXvvakdHnnEXuBc
	 P66f0P9vFBr8tFtKDMuMzZs0MPBTWn+M9CzVzPgux8T7AonRPdbvsobWIzNk3fq/nEYqy
	 0yaK1phcsv2n8JhORuHOdzqP/MFVIH+2LWL6XZM4omfTT37cYFPXXiwyEF2Xr81wk1mwQ
	 gcnOGeInfk13zqI9PshQQhcCaWSuy0kQau8Oz+Z3bzlTvs2ddGaDQqqk/tJqGBAqFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841343;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=dj9INd1966MK8ElenDXQ3eNxTO2GkekngrNAvjDnjLs=;
	b=VlaD7LYIzitVu8JFxgg/856fbtjrWDSCHbaLQGb230ekCLmwx781JYqWdivwJLfrSK0d
	 LEynxXNOk6cDthc8iS8WTP1VjsfzKdlk5y02xAGu39OyiJnfI03WRZufkYjLnVHHXdhtr
	 x2WKgmQ1G84SZm/rRjZ13JUIRm9WhLhAuJC9kK9AN8smMtqwQbgXI27YkBD2jh6VTqbu6
	 EFbRd/rtLO9BeDG0WOQqiN84/e+GaJ4Mq4Fu7A+HS6eHZjWvW5qyulg7sskQnhFGTjm8g
	 HIPcclYNfl0JF9hNNbKD+nZDx1W6murVuKI6/CdnQsjzQ/+NsU2twtvcJ/6XzZXeFeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=JS+zl3SY;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EEXP9PcJ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC400606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC400606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=JS+zl3SY;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EEXP9PcJ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF4151F818;
	Mon, 16 Nov 2026 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794841340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dj9INd1966MK8ElenDXQ3eNxTO2GkekngrNAvjDnjLs=;
	b=JS+zl3SYKqkJuI/eMztRmi17CljCvPx/0nXvG06RERnuADkKJYLsbprONtsEprNGkN6WyG
	Cin8EwUUjb9MCknlhrzeEPtVFeAv7xt2SCZiw7fgVLwAjIxwT+rSXGrcjt+iNWx2kBiSPn
	1hcM522cgG+1ZOZ+38G2gD30u9TfV40=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794841339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dj9INd1966MK8ElenDXQ3eNxTO2GkekngrNAvjDnjLs=;
	b=EEXP9PcJDskaj3ZZtGDCpg63ORuKDRTTI/PIZhO1+MKPh/HaaYnykkuwYYZeIkt9M9W1Te
	nE9aCyTOZv8U3ffYbz4oSRs508p9FCdped1gj3NQ+HIx36Z3i3l3c4rNwbwy720UN7HwFE
	n16UU0Hb49j9Q0pL+uKitrfqLfgvNvk=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71C0213408;
	Mon, 16 Nov 2026 15:02:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kMkfEvsa+2qxDwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 15:02:19 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 01/12] x86/cpu: Fix coding style violation
Date: Mon, 16 Nov 2026 16:01:57 +0100
Message-ID: <20261116150208.1572254-2-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116150208.1572254-1-jgross@suse.com>
References: <20261116150208.1572254-1-jgross@suse.com>
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
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

init_transmeta() has a style violation, fix it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/kernel/cpu/transmeta.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/transmeta.c b/arch/x86/kernel/cpu/transmeta.c
index 3e04b5d01bf8..35d498f24e34 100644
--- a/arch/x86/kernel/cpu/transmeta.c
+++ b/arch/x86/kernel/cpu/transmeta.c
@@ -24,11 +24,11 @@ static void early_init_transmeta(struct cpuinfo_x86 *c)
 
 static void init_transmeta(struct cpuinfo_x86 *c)
 {
-	u64 msr;
-	unsigned int max, dummy;
-	unsigned int cms_rev1, cms_rev2;
 	unsigned int cpu_rev, cpu_freq = 0, cpu_flags, new_cpu_rev;
+	unsigned int cms_rev1, cms_rev2;
+	unsigned int max, dummy;
 	char cpu_info[65];
+	u64 msr;
 
 	early_init_transmeta(c);
 
-- 
2.56.0


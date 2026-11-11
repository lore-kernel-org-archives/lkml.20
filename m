Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419494;
	b=rhULUt7cZUweQr26tjAqEyVenhUj1/PrSDaq+5dbJm4sVFWB2+ZI/rsrfb02oVjySNa/
	 Fhx+shqEeijm3OsupqjIWUIFIMHZVtOdV79Sc4zAYVaetrha3OzIq56BgCKqtyF45qu6Q
	 HYjvfcyoaAgjuWSmz1nN616bBCpNqlw+Yo33sC1KKMWjjyKBWJe6y9lyf/w7K6Ec9xnIb
	 FIprG6xpPo90KVqRVSDOLXYHJbq9aN8vYOqWYHt+tYHetfpeLMM31ZVJ5oWl8p1cONZ6u
	 sOyJD8WyFG08bwsCXk7GdzW3S+baETx7lqaH1HCpqAINJhKvbr14YWKOkZJyRXseUIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419494;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=HkqMEXHssYjLLBNIwiF5Pzm915kgvKjB+ro7dJ5uTRg=;
	b=y/QBN5wTptxa2qO6chKefi2OORG01LiN9na3okiwHxvQXXl045oSfyE+N6eZhNwPXCjO
	 amFU9cqpAPcRkVyr4sOlYF7ZWBtFpsLP9yoIz3mzDSxBm6hilsf97imZt6yfqPofN9H72
	 h2vrNO1bEBK6aC/mIHtmauDyol5fdX1TnnhjgBlY44wcJ3AZp0uce/Ueuj5JhqYrduIQ0
	 d638dhNhw3N5iDzzVK1BrWOLgD/0Glx2U4MrQoib7o+qEQg4p0gLPVCBTNNxNTK/rRrf5
	 plypm38ZaEPlHOfULHZoV6g6Ve1hTBNxDJCQqNk/TzInMXp+M2jyic0kW2wCVZD12ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y7keX7SP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C1TEaLCw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y7keX7SP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C1TEaLCw;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DF60A2611
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579DF60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y7keX7SP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C1TEaLCw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y7keX7SP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C1TEaLCw
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC93A21E49;
	Wed, 11 Nov 2026 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkqMEXHssYjLLBNIwiF5Pzm915kgvKjB+ro7dJ5uTRg=;
	b=y7keX7SPlHlFUo6cKdBAdcnfjBzt4Iyk+kjp0mmeAecFN9wqqsqrBmj+xIQXekl2Phh1ZO
	klF8NSfcK4x7pQSxmS55Mhqov1yaeReA2Q+cV6GOA7o9ljgWIE03GgRZ65WZDb6uinfklC
	Z/ZSrwSzQtW+hwD/RKRWB8WBOyfcwYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkqMEXHssYjLLBNIwiF5Pzm915kgvKjB+ro7dJ5uTRg=;
	b=C1TEaLCwrWEsa0rzeNwh6O0ENQyi5rCHq0SjTPGgha6bEzGzNdpQPrtaMSVZc+p7rC6/Pn
	sHP4c3rR0DQ0PPDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794419492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkqMEXHssYjLLBNIwiF5Pzm915kgvKjB+ro7dJ5uTRg=;
	b=y7keX7SPlHlFUo6cKdBAdcnfjBzt4Iyk+kjp0mmeAecFN9wqqsqrBmj+xIQXekl2Phh1ZO
	klF8NSfcK4x7pQSxmS55Mhqov1yaeReA2Q+cV6GOA7o9ljgWIE03GgRZ65WZDb6uinfklC
	Z/ZSrwSzQtW+hwD/RKRWB8WBOyfcwYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794419492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkqMEXHssYjLLBNIwiF5Pzm915kgvKjB+ro7dJ5uTRg=;
	b=C1TEaLCwrWEsa0rzeNwh6O0ENQyi5rCHq0SjTPGgha6bEzGzNdpQPrtaMSVZc+p7rC6/Pn
	sHP4c3rR0DQ0PPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B14F1339F;
	Wed, 11 Nov 2026 17:51:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +SJmCxur9GphXQAAD6G6ig:T9
	(envelope-from <pfalcato@suse.de>); Wed, 11 Nov 2026 17:51:31 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] mm/khugepaged: flesh out try_to_unmap_flush() comment
Date: Wed, 11 Nov 2026 17:51:21 +0000
Message-ID: <20261111175121.1328383-9-pfalcato@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111175121.1328383-1-pfalcato@suse.de>
References: <20261111175121.1328383-1-pfalcato@suse.de>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL8d8xedm6iu8o66torxsk6bwd)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

Flesh out any correctness concerns with try_to_unmap batching, flushing
and its interaction with the rest of collapse_file().

Signed-off-by: Pedro Falcato <pfalcato@suse.de>
---
 mm/khugepaged.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index accd8b4895d3..fd947e698ed0 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2597,8 +2597,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 xa_unlocked:
 
 	/*
-	 * Flush before copying the folios, or releasing them in rollback.
-	 * This is a no-op if out_unlock already flushed the batch.
+	 * try_to_unmap() flush must be done now before copying, regardless
+	 * of success or not. In case of success, folios are about to be
+	 * copied and collapsed onto a single large folio. In that case,
+	 * stale TLB entries need to be flushed out, so no racing write may
+	 * get lost. In case of failure, stale TLB entries need to be flushed
+	 * out before putting the folio (which can possibly free it).
 	 */
 	try_to_unmap_flush();
 
-- 
2.56.0


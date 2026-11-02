Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615768;
	b=IqkhAeaKOgX74wWB7Sd2VJA4UyttSRpAK+x9+Z2IiRKpBbMEbP8Vn2h6bUzKg7dA/mBK
	 A+0ThFf5GZ2OO/bmWw4mUo/2qfSHyMS0Juv5fVaxYtEdGcP54jKalktqjFfbntQLm3REK
	 Wbn1E5oycku3kEQbxmcI89b28hhMwoeV0eq8yEMbcMw9FNkDuygmfr9lStAvjKqOaw4nT
	 oEF9fm+I4fnBp6yQUfFe6GA+Cq2a2rS/LZlepPswAUnDKc+T+ZczbiFq2i59lC0hJPKXV
	 8spJhycVxJh//RtAWBHPE0bmOBLi8HD/MUJRnMzi0JzSTouriM9Df0vv0qOsrouHt3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615768;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=TRhzeJj1YK8/7h9dIIOem89RRPtC49dqxALnXhljlDo=;
	b=lu5MjQsOXVvZkaGCU6MqqeXkNi24s3alBveGSKyooPmSQl7XQTP8b/WKpa+2YiA1+hSD
	 PQyQu2HSmnAOpQNL61NBjm555rbqr/tSpUZ4UKsEKek4wFz74x7KdEXbFKG3YfqmrgkzN
	 Rmb4SWvgZH5wkiXeSJumizEZOJk7uCynh7NhfkzvsO99w46jgnZTRDNQEjssDhoAaxo21
	 fJVyOKu/WNZF5zFEwdUAztBOV9DYI66xW6BBwQPQ4mFG/5y33xGD6ixto3t/e6rvMk6VQ
	 OKgpPiLf2QYbc6RNanLVDLh7ZIX/8pPMqFScPy0jsBD4Hizv60/GLhPc38/E2RE3IzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n4K1m0W4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="cDqlMQ6/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n4K1m0W4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="cDqlMQ6/";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA6606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEBA6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n4K1m0W4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cDqlMQ6/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n4K1m0W4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cDqlMQ6/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 154E121F64;
	Mon,  2 Nov 2026 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793615766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRhzeJj1YK8/7h9dIIOem89RRPtC49dqxALnXhljlDo=;
	b=n4K1m0W4gEt+08pZ/ke7ocpeaWfykHo95r7XJVroWkyjbiT4hlZ8tSZkZ2CW8G+0uB/pcD
	Aso+EIUrHnHFdEysbLOTX6wVNdgNWeaoy4+l/tktODMKf5ksKAxcl7dTaQgfNTRiPn3agK
	MpkvITq2jcJNlb4zq4Kk8RL96nTyZNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793615766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRhzeJj1YK8/7h9dIIOem89RRPtC49dqxALnXhljlDo=;
	b=cDqlMQ6/px5ct/Lw6LJDpmI34aSvq3eKoIaCh8tYokTGUyPVgmMIL91f/zDsWFcoQRneaN
	BGawnmfF710E+uDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793615766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRhzeJj1YK8/7h9dIIOem89RRPtC49dqxALnXhljlDo=;
	b=n4K1m0W4gEt+08pZ/ke7ocpeaWfykHo95r7XJVroWkyjbiT4hlZ8tSZkZ2CW8G+0uB/pcD
	Aso+EIUrHnHFdEysbLOTX6wVNdgNWeaoy4+l/tktODMKf5ksKAxcl7dTaQgfNTRiPn3agK
	MpkvITq2jcJNlb4zq4Kk8RL96nTyZNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793615766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRhzeJj1YK8/7h9dIIOem89RRPtC49dqxALnXhljlDo=;
	b=cDqlMQ6/px5ct/Lw6LJDpmI34aSvq3eKoIaCh8tYokTGUyPVgmMIL91f/zDsWFcoQRneaN
	BGawnmfF710E+uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22684134B8;
	Mon,  2 Nov 2026 10:36:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p7mnOJRn6GrtOwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 02 Nov 2026 10:36:05 +0000
Date: Mon, 2 Nov 2026 10:36:03 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com, 
	Songsen Yang <yangsongsen@insta360.com>
Subject: Re: [PATCH] mm/vma: read anon_vma carefully in validate_mm()
Message-ID: <auhnfQg8aS30V70B@pedro-suse.tail5790ac.ts.net>
References: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[10e72ea5747737bcd2ad];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[insta360.com:email,suse.de:email,imap1.dmz-prg2.suse.org:helo,appspotmail.com:email]
X-Spam-Score: -11.80

On Mon, Nov 02, 2026 at 10:25:20AM +0000, Lorenzo Stoakes (ARM) wrote:
> Commit 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence
> KCSAN") rather clumsily converted the read of vma->anon_vma into a
> vma_has_anon_rmap() without accounting for the separation between
> assignment of anon_vma and later use of it.
> 
> vma_has_anon_rmap() is intended as an optimistic check, so doesn't need to
> protect against a torn read in vma->anon_vma. The caller is expected to
> take care of this themselves if they then in fact access the field.
> 
> validate_mm() does indeed then reference the field, so resolve the issue
> via READ_ONCE(), and simplify the code by separating this into a new
> function validate_mm_anon_rmap().
> 
> Finally, add a vma_assert_stabilised() to make it clear the required state
> of the VMA.
> 
> Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
> Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6ae78418.6552420f.2a0efc.005c.GAE@google.com/
> Reported-by: Songsen Yang <yangsongsen@insta360.com>
> Closes: https://lore.kernel.org/all/20261102074414.10902-1-yangsongsen@insta360.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Pedro Falcato <pfalcato@suse.de> 

-- 
Pedro

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3142983C;
	Sat, 10 Oct 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631395; cv=none; b=BiJr8gC/S77rOVV+W9s6hj+C9zwZYFA+rJQ88RsU1+p5R9pblkps1b55m4AL2T2zcVOb39xhEJuER95CacRjnCvKrzUCMAYt2xojjoMcWuxKks8nghdrUKBI57n620PlqLHyTcY7sabbhh931ZZ7Be1taoaj11+Euf0p6nF6RBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631395; c=relaxed/simple;
	bh=HZdGxYHEMkc4s2cbkzkUKI/D+Gi4K0+BehyAne9iJLI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HruS/H77xipE4+aTlTRJVgvN0CC7U6Wq1u2z55jYweXdAMi5TjvlCD3btY/6Xw8vGDV3S8ceSviQ0S6qemxuQYeqB3UC+7HnpoVEgh9BoIm109864VY5mntOhkZJYqxWAbdA6q7cuIUaU8r8ybHWn2CyZwzEjjmhKBxqhrINx1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y7Gx78H6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ZtKG6hR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y7Gx78H6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ZtKG6hR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y7Gx78H6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ZtKG6hR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y7Gx78H6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ZtKG6hR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FBF51F461;
	Sat, 10 Oct 2026 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791631392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cAYy05ANTMfAPFULaHW5G0zg3snyYlsrcQdFO/Z/Jc=;
	b=Y7Gx78H62yjO3OY/4Km6kEieACATZXkGjU6HBXx4gvOkU7g01NvvCpLWV0BKaw0+zRWWoo
	iBDibuDtdGgzfBnVGWshd+hrIyqtHSRKEHllTb2InKcDF2TSa2AYuj6OFiBN05q8iQXOcL
	eL+aGMn1kDTLnilNnz1fOOTnQlw88AM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791631392;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cAYy05ANTMfAPFULaHW5G0zg3snyYlsrcQdFO/Z/Jc=;
	b=+ZtKG6hRM9iDobbub9EoS3XyjSJG39WTU1cRwU9g7RjLRqMyfB7hcE9Rv7CsjAiPrDiDkV
	d0p4m6P73QEBiXDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791631392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cAYy05ANTMfAPFULaHW5G0zg3snyYlsrcQdFO/Z/Jc=;
	b=Y7Gx78H62yjO3OY/4Km6kEieACATZXkGjU6HBXx4gvOkU7g01NvvCpLWV0BKaw0+zRWWoo
	iBDibuDtdGgzfBnVGWshd+hrIyqtHSRKEHllTb2InKcDF2TSa2AYuj6OFiBN05q8iQXOcL
	eL+aGMn1kDTLnilNnz1fOOTnQlw88AM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791631392;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cAYy05ANTMfAPFULaHW5G0zg3snyYlsrcQdFO/Z/Jc=;
	b=+ZtKG6hRM9iDobbub9EoS3XyjSJG39WTU1cRwU9g7RjLRqMyfB7hcE9Rv7CsjAiPrDiDkV
	d0p4m6P73QEBiXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 198071326D;
	Sat, 10 Oct 2026 11:23:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TF6dOB8gymq4FwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 11:23:12 +0000
Date: Sat, 10 Oct 2026 13:23:11 +0200
Message-ID: <87zewliyu8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH] MAINTAINERS: add entry for AW88399 HDA side codec driver
In-Reply-To: <SN6PR19MB2303FD862C95299D7F386F0BFC912@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23036B2EBA9AD55D12961FA0FC822@SN6PR19MB2303.namprd19.prod.outlook.com>
	<SN6PR19MB2303FD862C95299D7F386F0BFC912@SN6PR19MB2303.namprd19.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[outlook.it];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sat, 10 Oct 2026 11:56:41 +0200,
Marco Giunta wrote:
> 
> Hi Takashi,
> second friendly ping on the other thing I forgot to add in the original
> driver submission.

Applied to for-next branch now.  Thanks.


Takashi

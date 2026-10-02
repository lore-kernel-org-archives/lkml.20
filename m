Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA30457E58;
	Fri,  2 Oct 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949461; cv=none; b=VbQaTSUVwyE8LfWwItLKSOkNGJlFgpt3Ua+ks5utP36eWsFe265Ivn+uY15ZMXQVG1LNAshWOPrc5SUmvtbCSRaBkXHtaXNEQSp0TJEayT0eGUrH+4rfsf2BH8b83FslvmD0sy1Mk15/mjVgP0Vb3ielwQ8KMe0K2bjbZl5OP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949461; c=relaxed/simple;
	bh=k2uxlChvQ2NnlebCYB56wN5MgdlzmSRU4AH3h3jTEME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UG9sAyDm14f/eGRowDrwVyW5tHY1imHiAJnj5ulaz+b+oLn8FcycGJdOiPOoHnrQxQNj+OC42nAirZax+s8qSelzkhn3h32No+NL1YgT6j2yb+fKr0f688Qpjc/9KPAI3iZsN8RPtn8jozszOK5FhCXinzJdaeCQQD8xBaZyIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W34q5BBr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMUiDQZR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j5We495X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zyKZe4te; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W34q5BBr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMUiDQZR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j5We495X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zyKZe4te"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A984921E9F;
	Fri,  2 Oct 2026 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790949452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u6FN0QHFU0Vtb14gCCiasyJen64Jekf4XhIxOqa0Yj0=;
	b=W34q5BBrH1zDMFRUy1CjvvJ2pb+P7RMgzIRvIrc5J79M0poeZSgGXuhSGwzAUUDZA6Wf/P
	xYkLBVhZteIl2KD980z/l+KAxdcpnWjSQr+Cf7XbIYw96378gDgTKhpU+YrW3sgAXXCiIX
	oYvAgTUTPq2b0g5D+qXnzBreuyeCHtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790949452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u6FN0QHFU0Vtb14gCCiasyJen64Jekf4XhIxOqa0Yj0=;
	b=YMUiDQZRIuPLdwc99GM+Ga4PoxdfXSnGHwqq2l0lz7DdUS4E/pfJ8TCaUlNhtiVX0Z62mc
	0m1zaKKOEuNkMXBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j5We495X;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zyKZe4te
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790949448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u6FN0QHFU0Vtb14gCCiasyJen64Jekf4XhIxOqa0Yj0=;
	b=j5We495XDu5kYR+dhq9REs4eanM+NcOdlR7nVTG2yvLML4F0aGDVC/nHx+gCby2ShfX4rl
	yBQmCfCI2Z2mARz5fAGJMw16ubqy1cUuuAloYcvime0Sj7YBJiubhEperIDkp7h15tdNrS
	pEcY7zHKe3uqCayqssEvJPCWvf3ilog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790949448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u6FN0QHFU0Vtb14gCCiasyJen64Jekf4XhIxOqa0Yj0=;
	b=zyKZe4tepYuwohYHVtTK/uemHfiiHHrt5WJI/wtssjWJzTuxinv1HdOcvMSEj0Q19dHudV
	BxtrQydPmK6pUoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54E43139AA;
	Fri,  2 Oct 2026 13:57:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UQbEDEi4v2rHHgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 02 Oct 2026 13:57:28 +0000
Date: Fri, 2 Oct 2026 15:57:23 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	Maurizio Lombardi <mlombard@redhat.com>, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] docs: kernel-parameters: alphabetize NVME entry
Message-ID: <93169412-7884-426a-bfa2-4d9cf8b72b1f@flourine.local>
References: <20261001213229.2399120-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001213229.2399120-1-rdunlap@infradead.org>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,infradead.org:email,flourine.local:mid,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A984921E9F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, Oct 01, 2026 at 02:32:29PM -0700, Randy Dunlap wrote:
> The list of kernel build options (or the legends or keys for them)
> should be kept in alphabetical order. Put the NVME entry in its place.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Daniel Wagner <dwagner@suse.de>

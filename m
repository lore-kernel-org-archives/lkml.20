Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDA49C4D3;
	Thu, 17 Sep 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648652; cv=none; b=eFUU0LLwdU80YnOt+ZJpeTZttSymT8hd+0A33QpgbgOaUCKdj3fAAzXxVqU5nijEaXPp9zX7QfIfTqU/+Xb23W+yRftoDPbD6hfV1INy3V8t8jclzVhywud0SDXciCYlE86GmF/DwJzvlWrGwWaqgDXk2VdOao/cWm3nwLAa9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648652; c=relaxed/simple;
	bh=cdlHw7kaZBru7Db0ys7AceoZFYCOW7iYpbcZggcZFgY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnH7G3HadP2kc/PaTjxC7I6BWVkrlgrWUBJ/XSPKT8nnczgMRoqnhkn0d3qSzWKkQiv+wG5r0Cumjem6NRPnxB3RqXJtNUKqzkhY/lv2B0gZcshakWP29sXsPrN5v1ipOwr7W3qyQHCwywV/zWp3ddvDLN9zzgCv9QYdZ6na1F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BkaSSE+O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgxwyj0X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hjv4dpIL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pg9pc5dp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BkaSSE+O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgxwyj0X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hjv4dpIL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pg9pc5dp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B04B21B07;
	Thu, 17 Sep 2026 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789648637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWc3jf84fBt6+w/a5ZtwrpnpqLcK2LtnBZ8g5jbNWrw=;
	b=BkaSSE+Onrb0jnDe1fLtNKWo1dTmBD3s6bl8+OSwGpDJ2vJ52VGeU0ml3jq4l+kKzFRrV5
	KERv7loJZ6pQwinQmShmhs+rNvObAInRkhZjKueypBp9v3h6OTgvCemFDaO7D6B7i+vIHg
	ka8rLsT37qNtvjX1MMG49c97r6DveqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789648637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWc3jf84fBt6+w/a5ZtwrpnpqLcK2LtnBZ8g5jbNWrw=;
	b=tgxwyj0XquTo10qsxSkhVcvkYaQSjYnHSMcSc1OG9L16hzFFv8jE2Rri22B4QhF6jQlkQD
	dluhGIVuayY7zSCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789648633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWc3jf84fBt6+w/a5ZtwrpnpqLcK2LtnBZ8g5jbNWrw=;
	b=Hjv4dpILuakX6y74fztR6lgWopixPzIYoCyw9wmgjpn2e4I6sfqiQ84jhAwxNOlyXSbH68
	6kX+2JpuaDRqPmOVueSe/mYfWda8avNlGXHYcxAa4GzHlL4ky3bUmpv70eKimbieAhlaRi
	lWKY6FBp0SBF6E6Eu4zzyiat+KmmYXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789648633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jWc3jf84fBt6+w/a5ZtwrpnpqLcK2LtnBZ8g5jbNWrw=;
	b=pg9pc5dpQb18XJfusF4YlMkc7Ge9VIEwTs8TM3sHQc6p8Ox9D3TNqp87oIqypJSzJVm8XR
	6YikXtsisbYs3oCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 201BC134B3;
	Thu, 17 Sep 2026 12:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id d7p9N/jeq2oECQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 12:37:13 +0000
Date: Thu, 17 Sep 2026 14:37:12 +0200
Message-ID: <87mrtggikn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] docs: sound: hdspm: clean up driver doc.
In-Reply-To: <20260914195806.1544938-1-rdunlap@infradead.org>
References: <20260914195806.1544938-1-rdunlap@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 14 Sep 2026 21:58:06 +0200,
Randy Dunlap wrote:
> 
> Do some overall document cleanups:
> 
> - add driver name for clarification
> - fix some punctuation issues
> - correct some capitalization
> - correct some grammar
> - convert a few words from German to English
> - eliminate double use of "note:"
> - unindent Precise Pointer bullets so that they are not part of the Hint
> - drop precise_ptr documentation since it has been modified to be
>   "always on"
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied to for-next branch now.  Thanks.


Takashi

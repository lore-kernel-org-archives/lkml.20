Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B34A99C5;
	Mon, 28 Sep 2026 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595283; cv=none; b=QPN4Coa5clTbz0P5zVjfE6QsrMAxG1/SZkNvnLHjTF+lEc31TuFhPP92nrpzqL4YLrID/I4iIdv1kHlPUft7zxt+x74fp9P/MVV6l3xFgE/V8BLqRzwK5gSdX/b8M9/dN22FFlnx/1hV+qo45+yltkDKXgjWHMA0v7FCJeDrfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595283; c=relaxed/simple;
	bh=TnFi6lSMFQsW93Asy0psJXcQ15/CcBvJj4sm/8ZKQMw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADg7gQZ2gwljb7w8HAze5d9xa1Y7B1oRz204qijDEl8geaHx+Ph1Beu43WfL01M1BVOe1IR8A9UzzEP+IKHO44jGuSLUL/sLgQSbGXsFlhNs2VeNHyaFcuoNV82O3h04SOqxmXYlAcJRdlPOAiNh8HblCkkbQXYGUNKBsO4al48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q30Hgq/G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HDoHEzcM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ga79Wsaj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3iftR8Gj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q30Hgq/G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HDoHEzcM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ga79Wsaj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3iftR8Gj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2483021BE1;
	Mon, 28 Sep 2026 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eLjq9AWxZbmQufRM+n1+wW4GV20hmTq52SU1sfNQ8Ek=;
	b=q30Hgq/G9jOI4IUZj+5ndgaAEI2NNSDsWh1yJDStQ7iLUFmSfNzLjYCafovyYc+4N356rA
	cL+oy75zwJzXh3o+mckhQpe5vMM1DumqP2wpaybaOkZcSPIeGn+tWoeGeDJuS2i+D+n8ht
	7M6DykqFtBsK8SPn9jzhTCtYZj4vkzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eLjq9AWxZbmQufRM+n1+wW4GV20hmTq52SU1sfNQ8Ek=;
	b=HDoHEzcM5h4dq+nn+XJ6V1zshEpTiujV+zBMID5NXsXfdZwNlXJlPl2+7RspDqi6flQGF9
	H/4j23wCp0N6vdBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ga79Wsaj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3iftR8Gj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eLjq9AWxZbmQufRM+n1+wW4GV20hmTq52SU1sfNQ8Ek=;
	b=ga79WsajZksrz33c6gMca0UCNM8kgJojsBWevZ5o/3LK0tVV+H6bMgmCPnsU/eQf6zoLkG
	2cYWEyXumTnHQU3iKGB0puKz3wn5EQmcuIP2E4AER82UoIPCAUDLR+mddx8Y3zmudBNImr
	XV7SXmVVbeYBBgWHKgh4CN3AS0Y5lOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eLjq9AWxZbmQufRM+n1+wW4GV20hmTq52SU1sfNQ8Ek=;
	b=3iftR8GjmZ+PpugCUl+MnXPfEXJDHcPP6zeQyHYYF7Mo2amNp0ybVK7tfLyOd68yH5on27
	oUlsGjbTcj23M8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98F221340F;
	Mon, 28 Sep 2026 11:34:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G/k7HcdQumo6QwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:34:31 +0000
Date: Mon, 28 Sep 2026 13:34:31 +0200
Message-ID: <87zex16248.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Luis Banha <luisbanha26@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-ec1xxx
In-Reply-To: <20260921230105.16844-1-luisbanha26@gmail.com>
References: <20260921230105.16844-1-luisbanha26@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2483021BE1
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 22 Sep 2026 01:01:05 +0200,
Luis Banha wrote:
> 
> The mute LED on the HP Pavilion Gaming Laptop 15-ec1xxx (103c:87b2)
> does not work automatically. Add the ALC285_FIXUP_HP_MUTE_LED quirk
> to fix this behavior.
> 
> Signed-off-by: Luis Banha <luisbanha26@gmail.com>

Applied now.  Thanks.


Takashi

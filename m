Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158FD46D544;
	Mon, 14 Sep 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402267; cv=none; b=gT2yeFPMONmekJLXVrCzex/+vPB/cI8ZmhjePX4yFF87oHE/97vmx6O6vV3QepC0NkMFJ2+vFQXRESDCYjFURtosp9wucxxuLjOVRzBeXnnk4LHQCQmNhi7NqvFrrfOZO4k9e4bo38LDNplSHIpWCVZR+jIVxknOLNOX+u0l8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402267; c=relaxed/simple;
	bh=5RRBavUJ0timaMaKS+k0GzMYIX4BOSFvHZqhaqqS0BE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ae5jtYirguZptY1pEmFVkho1k8EVNzdyIzD107V8gcoiXGhWIhPUuG/wn3WKZUVODaTPhQPO+e1j0qqUOpo0MvR0nw4oUwi73Diaicr7CAkxjge2fJRC1pZElGwG8WTdRgf0nWS7jc2wKRkKHW17AW7G7wLQY6/a2Mxf300Ro0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SX1Kqvig; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FAzZJAh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i534KoYg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4/oOpJ7c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SX1Kqvig";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FAzZJAh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i534KoYg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/oOpJ7c"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D55271F7CC;
	Mon, 14 Sep 2026 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of+XjyFzsQp3zOI6qt6xqGznyLfZ7lRUc9EZVS0rrIc=;
	b=SX1Kqvig/CSp7UczvAmedWDajnTXlFgCtMgku8tnu+PPM9c6oRiHWtVqUdQ+r8YsfjdtnO
	1K90gU+jjvHYFh3b7Nl2ebd01NUnntXl4EHPyisiYeYSuYsYRGhJJ7HvDjLy9Uq1n9RktW
	xkyGXuWUTz7R54m2ryeTo563/fP5M/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of+XjyFzsQp3zOI6qt6xqGznyLfZ7lRUc9EZVS0rrIc=;
	b=6FAzZJAh4q0/u0TVZyH8NrrIGDsUa97EhiMtoHJd2HnVqmm2Wn39WN3nvuBMO8fJd3mWOK
	wtmWsVB3wOBi92DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789402255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of+XjyFzsQp3zOI6qt6xqGznyLfZ7lRUc9EZVS0rrIc=;
	b=i534KoYgJQR/GFe5sMSlCpp++VWu3izw/b9vfJxGqUGPWKXLqe2IwcV8xnowDVNRYUxlkd
	POicrELnRzN3zbev/apGqJMvSINv1DAXYkf0Pp1X6CKqR+YqLKy5nbpw4YT0vs/CcLVV4f
	Jf4GeC47hdHCxXJighGXDcGz5FQRG+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789402255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of+XjyFzsQp3zOI6qt6xqGznyLfZ7lRUc9EZVS0rrIc=;
	b=4/oOpJ7cfV+u31O3SMuDa/yoq1YE+03UzijlPP9aqaYYoNtK0qsD7x9b4fz/a4INap6v6U
	Qas48yfey1piKGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87C1E13515;
	Mon, 14 Sep 2026 16:10:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Wlu1H48cqGouGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:10:55 +0000
Date: Mon, 14 Sep 2026 18:10:55 +0200
Message-ID: <875x07oltc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: trace PCM open only after assigning a stream
In-Reply-To: <20260913125154.109944-1-bolin.liu@seu.edu.cn>
References: <20260913125154.109944-1-bolin.liu@seu.edu.cn>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,seu.edu.cn:email]

On Sun, 13 Sep 2026 14:51:54 +0200,
Slavin Liu wrote:
> 
> Stream assignment can fail when hardware streams are exhausted.
> Move the tracepoint after the NULL check because its payload accesses
> the assigned stream tag.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 184865085b88 ("ALSA: hda - rename hda_intel_trace.h to hda_controller_trace.h")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>

Applied now.

I think I wanted to track the error state, too, and that's likely the
reason the code was put there.  But, judging from the current code,
better to move as in this patch in the end.


thanks,

Takashi

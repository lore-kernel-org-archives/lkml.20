Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1065644725C;
	Sun, 18 Oct 2026 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316060; cv=none; b=LBTXrcGBJODE0WkV67Ydg55jMQoztlvrvXdArzPvN1NKYv8HR5ZXtHNk80n9o3Ak3INOzXNljU7ZZagDTonV4AhHRXXivXIuoV1LvOrzHeMMrlWInTx7n8tVk9wRWkWPRivaNcUuwEEgxoRghbXIgPMjPqIOPZGeyKVYDIgiG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316060; c=relaxed/simple;
	bh=K7URSFqeOOhxmGzr8p1MgGgLM6weHBvz8IRI8NwAg2k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYPb4uehBZAJjmXd5q9lWHEOozLj/cjDfLPyDArkSh7m+8wG9QyZT0/uqDeZzwDj+zNg9s3+jWFEoT6Dgc6X/dktwTN4wIZEOpVMzV6xfWmOJ7CnFsGkOdPaQGuw52ZQq4cyrKSSP35eqIwbKzRJUXJDneyp9Ci9BwR2Imd4aMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EPaEtH/d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ivqci73t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iwj41htA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jCGkltGP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EPaEtH/d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ivqci73t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iwj41htA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jCGkltGP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5E5521CB3;
	Sun, 18 Oct 2026 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792316055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqOkGU0BbBD1hERTPjMJq73uQ6ZdLU+dztkLydr2U3E=;
	b=EPaEtH/dlubTVowIAEnCLErmqIQAEEkK0NSIAhN/mQ4IQB7PCoP7S8ZcKZtvoIL87tU+NH
	A/6SWG0cbuKllWBUfv2RnfMuA+7u7DtX4tK2xnA3yHu9M988H1IBDTra/gdJz3XaTD30CH
	jut3r+VhwARARff2/VmcwXWpPtV2tUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792316055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqOkGU0BbBD1hERTPjMJq73uQ6ZdLU+dztkLydr2U3E=;
	b=ivqci73tEHitro9g6dmrVob4axFV+yp8hwaiyU70cosebvPP/WZQeNNoX4RaPCUB5lTJRC
	LofK6e4J6j4+QZCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792316054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqOkGU0BbBD1hERTPjMJq73uQ6ZdLU+dztkLydr2U3E=;
	b=iwj41htAOlKmRh4mil0cx2XQ5CM/Hc5JlZ0wqkABmblELP/O6D1FHXtiDSy4QL4/YA7T7v
	jqVtt4V0/LBbIGzyeL5y62R4TkCgEavoPczl2SyxnsmpyTakRwtJdOnbyWWiDLPS6yiZJ/
	LAv32aTKlTNknEZA4rCmJnxm2Xx0c6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792316054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqOkGU0BbBD1hERTPjMJq73uQ6ZdLU+dztkLydr2U3E=;
	b=jCGkltGPlwNW+Zwf1DoPITPnHCqVGulkLe5oe6U/9HZ7cfpUZjzranITUAbm+8HMwkEq0Z
	hctfG7iCpj+dJ2Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3359C134B3;
	Sun, 18 Oct 2026 09:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vec7ApaS1GrpAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 18 Oct 2026 09:34:14 +0000
Date: Sun, 18 Oct 2026 11:34:13 +0200
Message-ID: <87wlrfz71m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Maksimov <nickstogramm@yandex.ru>
Subject: Re: [PATCH] ALSA: hda/via: Apply runtime PM workaround for ASUS X55A
In-Reply-To: <ffd3e030-c056-da1e-0549-c41d7681abc2@basealt.ru>
References: <20261017101257.215166-1-kovalev@altlinux.org>
	<874iej1k7q.wl-tiwai@suse.de>
	<ffd3e030-c056-da1e-0549-c41d7681abc2@basealt.ru>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,suse.com,perex.cz,vger.kernel.org,yandex.ru];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sun, 18 Oct 2026 10:50:53 +0200,
Vasiliy Kovalev wrote:
> 
> Hi,
> 
> On 10/18/26 11:33, Takashi Iwai wrote:
> > On Sat, 17 Oct 2026 12:12:57 +0200,
> > Vasiliy Kovalev wrote:
> >> 
> >> ASUS X55A requires the same workaround like other machines with
> >> VT1802, otherwise it loses the codec power on a few nodes and the
> >> sound stays silent.
> >> 
> >> Fixes: a0645daf1610 ("ALSA: HDA: Early Forbid of runtime PM")
> >> Link: https://bugzilla.altlinux.org/45606
> >> Cc: <stable@vger.kernel.org>
> >> Tested-by: Nikita Maksimov <nickstogramm@yandex.ru>
> >> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> > 
> > The addition of a quirk is OK, but is Fixes tag really pointing to the
> > culprit?  The commit is for forbidding the runtime PM, and I see no
> > clear reason how this commit breaks.
> 
> I followed the precedent of your B23E patch[1], which carried the
> same Fixes tag. If you don't think it applies here, happy to drop
> it - let me know if you'd rather remove it yourself or have me
> send a v2 without it (keeping Cc: stable).
> 
> [1] https://lore.kernel.org/all/20210817052432.14751-1-tiwai@suse.de/

OK, that looks like a failure in the previous commit, then.
I applied to for-next branch now without Fixes tag.


thanks,

Takashi

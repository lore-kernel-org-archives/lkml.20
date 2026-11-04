Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803498;
	b=FXe/+Ck386NrliBKTgEjkO/Cic2JhCh48ZTzufinidUkHls7JmpQLbKSVcJfpiagi5e1
	 36g6jPLhmrcNZiyKXBMVzEJuDEwgjR630C0FJCMzbmQClchzXQzDLMsxzjOy0VEAuUlLY
	 HTrZA7780yyE+9NKN2B6iPGhl1uqrQJaM5t1A4dAnCB2UhhvrJnAcGLKDBHF1d6nM+2ru
	 A/zXLGrmeTHtytHOhAMf0akQmJhlXXo2+KvmvHQ6dZTttD51I4m5nWrurJeaKogUG5zZ+
	 mNxy7Y65jNEwfF4JYxJqA+bv/9OkWB/nYxmWvyaBrAEiE/PI4O1nrfvf+Yxj4knqS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803498;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=z+ocxglX4x6lIElIhv28QGOEK//y3x55gjU+CEeqUd4=;
	b=mp08vJcco/OzsIAflt4M4vcTDdEz+puTSJG/zPHcno+e0hDvhepa5Q/JE/k9CLJ2TSVh
	 TGQrX7p7ohTzS2Ll10k60t95gDiOpTJV7Uk3IzDvKxqJp7XM4DjAFRiRCKixCwcvtUQGd
	 1ROz8enWDHEFTHUzdcbNMJdPXDfAqfE82y8QughEnIOlZaTH1IZr4CtlrneHycq8xu6aH
	 mJFPqfJz6Un4KYKSDAX9NOHVyq6zqvWCsBsp0uNyuZVPwdCsHVDjqhbulGHGS08E+zWgU
	 YnONxzbzd/J/L9qvcCYh9lX1B1O9jJjKSsr1epyXYw12T/jLXymtd9huS5q7ZNdT5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g4Kbsl7I;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rdMtxS+G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b53b3e1I;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gGIeCN6I;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9D606A326;
	Wed,  4 Nov 2026 14:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B9D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g4Kbsl7I;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rdMtxS+G;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b53b3e1I;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gGIeCN6I
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4E6E1F79A;
	Wed,  4 Nov 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+ocxglX4x6lIElIhv28QGOEK//y3x55gjU+CEeqUd4=;
	b=g4Kbsl7Igd4wdLVbMgJHKsKkMZIZdJUI3pLs9mQMgfgjYCxjxhBA4whDllJehOKr96NH2A
	s5DFFv6gw1usm7mreq6t11ygDV64AAXyaQhDxRD/BW8W/HJsdvkJSyJVWFGkgl5Kz3DB7x
	rid/fK6ojJb7CbtHjVLCERnICSEwdME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+ocxglX4x6lIElIhv28QGOEK//y3x55gjU+CEeqUd4=;
	b=rdMtxS+G3SnzoUTugQpVGpeqCXilLMK5+JX+pD9WuFX+CdFcezScmcCbWnWXRWNfDlAD0i
	DvIiiMaFu5ng16Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+ocxglX4x6lIElIhv28QGOEK//y3x55gjU+CEeqUd4=;
	b=b53b3e1IQ+WAcKH9lsjaP4u+TnfwYohrhI+U6cmHz/MYdF/Exe0IWB2pFQas0HbGv3luT/
	RI/Pky6JqLYJVhGIE2qrHv2oxm/DdvRncfXJEX8hZMa5BaSuCm+IIW9hOvfsDrPTYeTTZu
	I5PCJZ6ed7ZJ+x0+uOXVd+4zZUXVm2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+ocxglX4x6lIElIhv28QGOEK//y3x55gjU+CEeqUd4=;
	b=gGIeCN6IMRh8R1NBy6Fkxbs8YJly3KVXOnS0Pbc+qEJObXrAOirhmQpNSh077MEMYcSJQG
	UwerUp523RNvZoDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C00E134F0;
	Wed,  4 Nov 2026 14:44:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kxEeHeZE62ojfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:44:54 +0000
Date: Wed, 04 Nov 2026 15:44:54 +0100
Message-ID: <87tslwu049.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: cs35l56: Stop cs_dsp before calling cs_dsp_power_down()
In-Reply-To: <20261104122337.1072468-1-rf@opensource.cirrus.com>
References: <20261104122337.1072468-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 04 Nov 2026 13:23:37 +0100,
Richard Fitzgerald wrote:
> 
> In cs35l56_hda_unbind() call cs_dsp_stop() before cs_dsp_power_down()
> if cs_dsp is in a running state.
> 
> cs35l56_hda_runtime_resume() calls cs_dsp_run() if cs_dsp_power_up() has
> previously run successfully. If cs35l56_hda_unbind() is then called while
> in this runtime-resumed state cs_dsp will be running. The code wasn't
> checking for this and was calling cs_dsp_power_down() while still in a
> running state, which is illegal. This is currently fairly harmless for
> the cs35l56 driver. But it doesn't comply with the API, so potentially
> could break with any future changes that expect the correct API use.
> 
> Fixes: fb78d73dde2d4 ("ALSA: hda/cs35l56: Call cs_dsp_power_down() before calling cs_dsp_remove()")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi

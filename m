Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575313;
	b=Pep1ppUkAziSEQG1kE4odU+jDC6lQfr3iZdYmEc7sBoY68ErYtC8fEb3ORqupMFCL8VL
	 a4U+A9G7Qnst0oFm9mXLvcaWqOCiyJEGBDYX0hN/0xKN7T826+6cbYudYTjUUwcrLXs6W
	 8WkwC22+rHsTBmVmML0RAgfrfEvnpac7Sdy566xQ21FXgPb8p4mQN50Rkn0k+8DV5Tn2r
	 7My9xBC6OOMF0hCUInMl37mgTVeJxOYbPiUHF8OIMbFudf2Yl7jUKLRacM6W63nBHMSVP
	 PG76FOLtJbwsqL8Ej/bl0f5AY6t+YmJQBou5+apDFB8Od9DGQG6Ph4VHCXDzl0kofjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575313;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=nKuov3Pn6qMbJLzHgiAE+bIUlq6GZ9Whr5Pmhk5wcRk=;
	b=Q08393aFhWX69CZnHrZZVhuT688LcaP7raoFjhu3hOkMfr8EKO6VJdyfg72Di+AeKexa
	 nTbjWpneeAUTw/JluSIk4+WHpKlRSYQIUkknW2MrWphbslqJcz0RX/7jHrnPdRwtgKMH6
	 gHesWi3+aW+2uGVEfWDYWf5Fihd/4H7Qi9wIQIs9bJ06Ebq8fTZ/yzzRxNccW8LLKpW95
	 LRSFPbXRqDpwabQ89tukbwcjJ8cgjoO7GZ15ZONlcA9gl41x7GhjdIA2lt55fD90pJ02O
	 zHY+DBVp0+cZOze6oewXK2vVAGDj952sTAchuzrcLpuJ+zjIegT9U2KQhtuZDzN5vFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oktzSW1k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Hq/1E7dp";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oktzSW1k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Hq/1E7dp";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEE7606A319;
	Wed, 21 Oct 2026 09:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEE7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oktzSW1k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hq/1E7dp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oktzSW1k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Hq/1E7dp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 999B51F461;
	Wed, 21 Oct 2026 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nKuov3Pn6qMbJLzHgiAE+bIUlq6GZ9Whr5Pmhk5wcRk=;
	b=oktzSW1kAgcWqSYe1E6U+7+v6espfMynGKNIHKRLVeuNqMA5GwnPtAr4A5TTUVKUZ+PmxS
	Af9ir4tVbg76vCmMWpa1p9XLxnXVvW1RsHnMNcsH6dSk4zEIxSjIw3u4NCHO74wxPcraRY
	SjViJdGrFDZIHEjeE/IKHsdSeWFLcM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nKuov3Pn6qMbJLzHgiAE+bIUlq6GZ9Whr5Pmhk5wcRk=;
	b=Hq/1E7dpkSxnRhzcPICmQQQ1Q1AddB2RsLCgQR/FNXJSDb1zP+Am1tVh3XPXwEqFnArH63
	7apBtwR5sT3tXXCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nKuov3Pn6qMbJLzHgiAE+bIUlq6GZ9Whr5Pmhk5wcRk=;
	b=oktzSW1kAgcWqSYe1E6U+7+v6espfMynGKNIHKRLVeuNqMA5GwnPtAr4A5TTUVKUZ+PmxS
	Af9ir4tVbg76vCmMWpa1p9XLxnXVvW1RsHnMNcsH6dSk4zEIxSjIw3u4NCHO74wxPcraRY
	SjViJdGrFDZIHEjeE/IKHsdSeWFLcM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nKuov3Pn6qMbJLzHgiAE+bIUlq6GZ9Whr5Pmhk5wcRk=;
	b=Hq/1E7dpkSxnRhzcPICmQQQ1Q1AddB2RsLCgQR/FNXJSDb1zP+Am1tVh3XPXwEqFnArH63
	7apBtwR5sT3tXXCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6490A134A5;
	Wed, 21 Oct 2026 09:35:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ne3JD0+H2GoRGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 09:35:11 +0000
Date: Wed, 21 Oct 2026 11:35:11 +0200
Message-ID: <877bjbflbk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: pci: Fix spelling mistakes in comments
In-Reply-To: <20261020151503.15855-1-sarkarsubhadip604@gmail.com>
References: <20261020151503.15855-1-sarkarsubhadip604@gmail.com>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 Oct 2026 17:15:02 +0200,
Subhadip Sarkar wrote:
> 
> Fix three spelling mistakes in comment strings across sound/pci/:
>  - sound/pci/rme32.c: 'informations' -> 'information'
>  - sound/pci/vx222/vx222_ops.c: 'hander' -> 'handler'
>  - sound/pci/echoaudio/echoaudio.c: 'contraints' -> 'constraints'
> 
> Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>

Those have been already fixed.  Could you check for the latest
sound.git tree?


thanks,

Takashi

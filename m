Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909AC376BF2;
	Wed,  7 Oct 2026 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791411623; cv=none; b=iBOQfEI312Wd7bLCHqsxiWwetsEtVPObI1bud26RjLd9wAyRJ9n4utf6W0F1fz6TH/hBG88xO56EyKAQ6fcdQMyrImqUntAgCARVEWrbVz2KHW5sdnBZWg0pVDuSBb61fSl0sYGVP12ZnqHcLESl8XOdyDLC5qVpIr84HEWwKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791411623; c=relaxed/simple;
	bh=HtNlhB3h1TF0TkN/vpDx7CxV8odnhp0UciCdOWXVMOk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1c2/2q3FcEvmjPHAyJhR11GDjSMvvZQ+8T/a1UZLdmgTkl4oFtyo4bL+zvtl1kNtD8/U3spn3sZt/8UWN5N1oLPeKcz1Ompgvtccf9eqsvucTZbSYpCZTMz1Kympwz65AI+7n+eLwXOgJ5nMVwDadet8PzIp30LdAOPnFlGxvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kI15uHd8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6oypePWq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kI15uHd8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6oypePWq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kI15uHd8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6oypePWq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kI15uHd8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6oypePWq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B89C1F74D;
	Wed,  7 Oct 2026 22:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791411619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0jZ993pzyrIqqjcsEgIlIlWkEQaKIjstnc09C3/Ftg=;
	b=kI15uHd8Ha+8l6Lvx/yhBltWHOaRHmw0w/fKV65ZBAFhKOAN7as+tyA2pWi+d21FHq3hF4
	SX/dgeGhJY9UaZ+K6Z6gJYj4CZzSpwpbTAGgRKoEpTGeBjTRqtBLGJ2J04U7VoZExEHf0e
	coKV8K9GxTu7dgVSP1wk107HcagFk1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791411619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0jZ993pzyrIqqjcsEgIlIlWkEQaKIjstnc09C3/Ftg=;
	b=6oypePWqB7t7MxUi1eDuYOc42XxYgaes4kf6VOWOv4QOhRqB8HKm/CIV5t6sp+zlOnQPeR
	Dd5iXvi1KZA4QGCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791411619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0jZ993pzyrIqqjcsEgIlIlWkEQaKIjstnc09C3/Ftg=;
	b=kI15uHd8Ha+8l6Lvx/yhBltWHOaRHmw0w/fKV65ZBAFhKOAN7as+tyA2pWi+d21FHq3hF4
	SX/dgeGhJY9UaZ+K6Z6gJYj4CZzSpwpbTAGgRKoEpTGeBjTRqtBLGJ2J04U7VoZExEHf0e
	coKV8K9GxTu7dgVSP1wk107HcagFk1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791411619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o0jZ993pzyrIqqjcsEgIlIlWkEQaKIjstnc09C3/Ftg=;
	b=6oypePWqB7t7MxUi1eDuYOc42XxYgaes4kf6VOWOv4QOhRqB8HKm/CIV5t6sp+zlOnQPeR
	Dd5iXvi1KZA4QGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B15713312;
	Wed,  7 Oct 2026 22:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3rKlCaPFxmrOPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 22:20:19 +0000
Date: Thu, 08 Oct 2026 00:20:10 +0200
Message-ID: <8733uh6tlx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Avoid dev_err() at probe error in vga_switcheroo handler
In-Reply-To: <20261007213728.155092-1-tiwai@suse.de>
References: <20261007213728.155092-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]

On Wed, 07 Oct 2026 23:37:25 +0200,
Takashi Iwai wrote:
> 
> The vga_switcheroo handler azx_vs_set_state() calls
> azx_probe_contine() for enabling the audio, and if an error happens
> during the probe, azx_probe_continue() releases its associated sound
> card object at the error path.  In return, azx_vs_set_state() tries to
> show an error via dev_err() with the card's device pointer, but since
> the card object is already gone, this can lead to a UAF.
> 
> For avoiding the unneeded crash, replace the device for the error
> message with the original PCI device that is passed to
> azx_vx_set_state() itself.
> 
> Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Scratch this one.  It turned out that this is no fundamental fix
(although the change doesn't hurt), and we'd see a more serious
deadlock if this scenario really happens.

Will submit a better fix instead.


Takashi

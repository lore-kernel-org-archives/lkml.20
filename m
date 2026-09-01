Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8247DFA8;
	Tue,  1 Sep 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280005; cv=none; b=V4Xo6fTUSu7Q0eGOLo5LEs3r/VEUPW32SPFGakdzVmmfDwGitsYppVb/E/WEL/UehnlmARDjPtkHkXiLZWf+wPwcpg9fuphD9gT0TxgfpY1BUevfcCjfQXKdJYEdvrelxnEXnN2fdBPieKH9iEplmtBYN0dOJWLa95vNha//KIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280005; c=relaxed/simple;
	bh=BPCKR5mN+62ZnHVk1LreiCTsOx+lGiOOggh5AhLzZfE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k7jivbe/ysuGn3XjCMvuCZkM9PZ/g9X1iRsQAOTaeZvpw1jgJvdl6Lb3ANPI2HrJ6Fbt0hZm3PbZ+sSwAbceG7ijhZr2soRWTRa3A60ebvXUi2JNK3y5cJIluGjYACj/gxAiigu/SpcWR34yduuGTDOoEavEIrbVylpkL2kL8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UNz7/4ef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lzbvpF7O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jq5Nwayx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bsdnaNOj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UNz7/4ef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzbvpF7O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jq5Nwayx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bsdnaNOj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9567E2255A;
	Tue,  1 Sep 2026 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788279996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mxm9av0PXPgxx6UA+iIsv4ebYcGBHIjzx2qzcq9BcqI=;
	b=UNz7/4efzrTKXnrGyLpUE0jEL+T1qBpMgy9ZkOD18fokOum3W5FOUEp1K+PajST2Q8zRle
	EugT5cIc1WziqGXAMrnnwxfSL5CT3cDziA/8uFGaAxBcEK2bUnl5Rrw1kPFeikN+deodv+
	lw5/cVWYa9b+7vXJh56d8Q8Yf/t8+ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788279996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mxm9av0PXPgxx6UA+iIsv4ebYcGBHIjzx2qzcq9BcqI=;
	b=lzbvpF7O0GRRH8REfdIYuDjXOHNws5/b+/yW2au6HDcJsUkTI00B4fVHAIV65oRpNBmZmy
	vp8xvnYzQ2i1phAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788279992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mxm9av0PXPgxx6UA+iIsv4ebYcGBHIjzx2qzcq9BcqI=;
	b=jq5NwayxeR1/CaP1yRnmmHdbF6vaY5/lqRaoLB57nYgVVTBNNulvG/OKJJWDrLsjaEM0xz
	mLW4vcv0DGCN8w/mXKbftOk7AUOcEgLCzirS+v4b3RAKdF9CMdgs2lA8JM9GrHh44iwbnb
	+JjNUpvxQh8ck7RQgm4RK0M9PzjrZaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788279992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mxm9av0PXPgxx6UA+iIsv4ebYcGBHIjzx2qzcq9BcqI=;
	b=bsdnaNOjZI12Q8fjpYC5pAjkBB/lW4G+OA86qmzWb/GoX3MM9Wkzddn/H54ML/g4WBmt61
	18yCz/iHsQVZnzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 536451369E;
	Tue,  1 Sep 2026 16:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b7/8Erj8lmpVaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 16:26:32 +0000
Date: Tue, 01 Sep 2026 18:26:31 +0200
Message-ID: <87tso9aqfc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: dummy: Report a change when one capture switch channel moves
In-Reply-To: <20260901153921.3971-1-sammiee5311@gmail.com>
References: <20260901153921.3971-1-sammiee5311@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 01 Sep 2026 17:39:21 +0200,
HyeongJun An wrote:
> 
> The snd_dummy_capsrc_put() builds its change flag with &&, so it reports
> a change only when both channels move at once.  Writing a single channel
> stores the new value and returns 0, the control core then sends no
> SNDRV_CTL_EVENT_MASK_VALUE, and a second reader keeps showing the old
> setting until it polls again.
> 
> The volume put a few lines above compares the same pair of channels with
> ||.
> 
> The mixer selftest already reports this.  With snd-dummy loaded it fails
> event_missing on all five capture switches:
> 
>   # CD Capture Switch.1 orig 0 read 1, is_volatile 0
>   not ok 13 event_missing.Dummy.9
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied now.  Thanks.


Takashi

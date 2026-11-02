Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622292;
	b=EXs/Opk5PHejiZE8re5shtMeBfSm7BWoiD0JabCdqY4YnGbpIRod4yo+ETI9c65wMvIY
	 eYZwEJbMNk0omDqkwNA4Me6yaw+rdRFKhQcJUSxHCCA8KE59Lp2W7xGhRGNWVLLrSNtW1
	 OpQ0iUvgKOIf+2awt4MYzzxZtunSfCanvnXQpslxh8IT+TcwoiWTcvPW65UiTPfB2WFHS
	 jH78gfw/bTwv9ctYTIrjemXYSP3En1VWVx9mlAjSPTDGCqnbAUZloGdEPp9NYo5rH7Djm
	 6DU/pXI1V7fdLzWHDAZhsuXchR/Jl9/xKzAZVdpMi1IdTYNvyFgUlnCafAiC68y1riQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622292;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=2xFOoTDkl208/ro14QedT6AkaLYzI8AOsqWXQGPoZME=;
	b=Qjg1b2bmGILsuX6M6CBAZe6uPAuOxV7P6t9W59X2ewA8769hkXHCb73J0iQC9mks/qrn
	 4VHOLm3KWMPRAPI5GMkJoqB3QobeOdBcpzhV9mgLUPZq0QNvHL3GoU+SzkTBZ2GtO7qH9
	 I05zXkBfXtupkR6GgTMMpGjjHgqJiQ+7AHydlfwJ+3NO406leFxkROXDbJ7Va5hAJJc7Y
	 kOLDrob3SE3u0nAQC8WyHkcMutqSgprmufzBDSt6jAIoOas9x87L8UOBGR1XOWRnhORwn
	 rxTfDoM7z9LYGTcNuzg2jk9+u5zQGCH05xo80pNpfoO1yZud5gLsxXGHlckDvSYSQ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=peHVHvAf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1ag8IsTJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U8Z0eo5O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dLdfreHX;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF1606AA2D;
	Mon,  2 Nov 2026 12:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DEF1606AA2D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=peHVHvAf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1ag8IsTJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U8Z0eo5O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dLdfreHX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77EF3220AF;
	Mon,  2 Nov 2026 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793622290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xFOoTDkl208/ro14QedT6AkaLYzI8AOsqWXQGPoZME=;
	b=peHVHvAfOc0HjtnrRHv8I3DkdQJtNKUpgalpIUzyjOKqZau2+Y3mhD9MleqH9pXgNENVDu
	WBQkmIltyiLSz8UO7xcS7qmjY6541ZKxOJRGK5DptGM3p/2yORb4JOlWXc66y1A2ueyMas
	3b85xqPH+qv1Yh4hmruX071ChnGhVjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793622290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xFOoTDkl208/ro14QedT6AkaLYzI8AOsqWXQGPoZME=;
	b=1ag8IsTJ6zw2E7Tklod5WwWgDio/pTPZpdQLQSovP9/VzXe99j/A0dIMelISHTjXlARUy1
	KKXK6FFxq6dl0RAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793622289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xFOoTDkl208/ro14QedT6AkaLYzI8AOsqWXQGPoZME=;
	b=U8Z0eo5OAKq1C/kTBUwAeMDwYFKPwHtK6jhxg+4L26p0tpWE3475tMvexavXgw05zZ+jnO
	5/Egi2H14im6bmu8NRS4y0pahs8x4mrDk968wZlHbxIPMYvj/4STcBWBbKa8e5AGstVrPc
	rLdC0fK+D6cE9jVF2/7M+6rgbrH4z28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793622289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xFOoTDkl208/ro14QedT6AkaLYzI8AOsqWXQGPoZME=;
	b=dLdfreHXe98GKqOu+z7f3dGHEoIIFWrOFnPltnU7s80m9V5+0HHTzoAH0rySjvwXXCa0n1
	ju8RyEWzjwrsrzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E4241351F;
	Mon,  2 Nov 2026 12:24:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Mv51ARGB6GqzNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 12:24:49 +0000
Date: Mon, 02 Nov 2026 13:24:48 +0100
Message-ID: <874idza0a7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: ice1712: Make chip_init helpers return void
In-Reply-To: <20261102093824.3123528-1-ingyujang25@korea.ac.kr>
References: <20261102093824.3123528-1-ingyujang25@korea.ac.kr>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[korea.ac.kr:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 02 Nov 2026 10:38:24 +0100,
Ingyu Jang wrote:
> 
> snd_ice1712_chip_init() and snd_vt1724_chip_init() always return 0, so
> the error checks on their return values in the probe and resume paths
> never trigger.
> 
> Change both functions to return void and remove the dead checks.
> 
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

Applied now to for-next branch.  Thanks.


Takashi

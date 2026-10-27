Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086814;
	b=FJJZXu9Byf6r4LvdKn/ZqAwQ/vC3LK/To2kAiZtGvozUtCdr1uj+pS+ew1Jb/E5701ig
	 o4gQehJt7G2nQENdV0HY55Mp4HEyRyQoyW83nRkktp4mbBCaIyh6DRP23XyB4VtMYYrAr
	 ziUi9TE91utYob9xpgmgqN4WS3j0xbdwg3z4AkUhUcDnl45nyzkPaWRBRZMtNx6WYqn0T
	 +PJru5BsQPJudm+V8vZt17nFdh7N6C32LoKbz+7Je1e0kKVtpLgVZgYetsowkj/nO9qP4
	 h4NbtEMfg89oPw69kIsyY1NXZZ+t2y7EJz5HGXhH3NZ5kM89fErJU5JLsXgo2IRxW6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086814;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Hr3Ctq3ScFskT+ytjfhbh/XrMuuFrUwkKqbPYPO6tfI=;
	b=gP2NLC46xuU9FQqXyAEC8QzvXZb+RlMrXF+JI2cPFGi/5k0pU5/MZ57wIIQ6OjlDGezu
	 QU/cn7vxlcaeu3hpckjtnO4LJ4qRMf3Ry7MrYji8+vaLZ0KpH69U1+hLOvVcilGi4xcfE
	 ib5qA5wYswZYTyXfI37+Y2Wq+RNJmKXjqKL/C1hXetRLMzHHcifxJ8xfoWptxUWJeHFRe
	 L/0KBZ+ZIfeKvOWTtRavFQcFJf7zNvpTkPX4JPlpZ49Zs4hw10HRJz9mFmK5SNT9xjK8z
	 tizzOSKOoTLab1706kZLRF7+JJ9kc7NR0ve0Ha3lI+mPF5J7gQj8XQ/97hrhIUutt5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wdfRSfIl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UGX7wsP5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wdfRSfIl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UGX7wsP5;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115F7606A326;
	Tue, 27 Oct 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wdfRSfIl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UGX7wsP5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wdfRSfIl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UGX7wsP5
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E4A321EE7;
	Tue, 27 Oct 2026 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr3Ctq3ScFskT+ytjfhbh/XrMuuFrUwkKqbPYPO6tfI=;
	b=wdfRSfIlg0DrdnALzT3eV5o68gjEgSFghba98SLwiImTClwaHF+FrBEMMu+mvzuPkxvqn3
	jvPtJ+cAjxXi29FtYu74rMgqRjPaSzejagQSYgNkWDSyMWOqv3GbNaJ7K9hs5arFpTnceK
	kyqVsnroWWucjbQkIt1eET2zf7xWqGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr3Ctq3ScFskT+ytjfhbh/XrMuuFrUwkKqbPYPO6tfI=;
	b=UGX7wsP5NYVT2G6lStktDwVPRuvAC6KFU9YuEuz2yUhodcPWFQrBGVCADrsrf2OW8TDRSX
	774P+cJbypSga7AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr3Ctq3ScFskT+ytjfhbh/XrMuuFrUwkKqbPYPO6tfI=;
	b=wdfRSfIlg0DrdnALzT3eV5o68gjEgSFghba98SLwiImTClwaHF+FrBEMMu+mvzuPkxvqn3
	jvPtJ+cAjxXi29FtYu74rMgqRjPaSzejagQSYgNkWDSyMWOqv3GbNaJ7K9hs5arFpTnceK
	kyqVsnroWWucjbQkIt1eET2zf7xWqGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr3Ctq3ScFskT+ytjfhbh/XrMuuFrUwkKqbPYPO6tfI=;
	b=UGX7wsP5NYVT2G6lStktDwVPRuvAC6KFU9YuEuz2yUhodcPWFQrBGVCADrsrf2OW8TDRSX
	774P+cJbypSga7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A461213319;
	Tue, 27 Oct 2026 07:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BVX9HVtV4GpCXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 07:40:11 +0000
Date: Tue, 27 Oct 2026 08:40:11 +0100
Message-ID: <87o6cf382s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Benjamin Pryor <programmer2514@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Andrew Udvare <audvare@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66 Raider 11UE
In-Reply-To: <1ca10bd0-0452-4411-8577-9753ea50f56c@gmail.com>
References: <20260909193104.26508-1-audvare@gmail.com>
	<2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
	<87fqxv8pif.wl-tiwai@suse.de>
	<1ca10bd0-0452-4411-8577-9753ea50f56c@gmail.com>
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
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,suse.com,perex.cz,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 24 Oct 2026 10:58:26 +0200,
Benjamin Pryor wrote:
> 
> > Could you submit a proper patch for upstreaming?
> 
> My bad; I'm still new to this. Hopefully this one's formatted correctly.
> 
> - Ben
> 
> ---
>  sound/hda/codecs/realtek/alc269.c | 50 +++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Hmm, that looks pretty different from what you showed before?


Takashi

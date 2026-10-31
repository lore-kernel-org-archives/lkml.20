Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461428;
	b=sNMo90afHXxC2zvqk3zey3trq4AVltYiBi5d5eFOEEFBHDmBvGd7W/Ga35w5gS8GMfx8
	 KYbunF3qX41IbU6d+MbKGt4C/c073JhRl5zD1WtwTg0tyqDePqhtcajmDEmcrpP9gdTF1
	 C+HiXxENefRKdHQ80ZRJCOZDBwM5zbcbrrZHRavZUwKZ5cgS8RmJgaQvwxMyJxzGVpH+d
	 hCKrnbtO2DqpCrYU+v2nTVAFMV4dRxy88R5xbzu+DnUm3C0qNdK5Y6kBMEnuScY6Fjp2M
	 HukuNG1+E9aMKpvOlmRnD/ErhmRfTsd6xSUAGN3AcOumL8Q4YI6McrBtt2GVZSo6KTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461428;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=bnH4J6z0IFEZARKEd79W5NrbUkY8SRwIOuFp6jS6D18=;
	b=QrsOuddgnVn0ibyXgiZXT7TMN/Klbd+dc55UqeT+mpKChIjzhB30dCcoDUDgG/D7tMko
	 DeVZr9wy1/xOVf1FdKVxCRHakEH3XHULYNAAIBxxlVSZcEL4mE7oVhTJ5enrMeXotMMPJ
	 zelgBligZQ6IbOudRjVNi1heHmHIKyswE0RtwbuzQxegF4W23KT64kcchDH0l9VAKsjXm
	 fMK3l1Bb5gkLCIa/y2YLibc9SIF9RLsLFUmRyzhxd+8GYJApbzDlPLA3tf9tXUWvJc0nn
	 6saMeodBt7TjfrNzvilksxrZUAMV8k0OGxr4deOV+cZq/z9b8xvwdc+eJxPvw4U+QTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pSCc+W8K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zu5oqykL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FHID1f4P;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d0GtMeD6;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC28606A31A;
	Sat, 31 Oct 2026 15:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pSCc+W8K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zu5oqykL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FHID1f4P;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=d0GtMeD6
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4DFA522314;
	Sat, 31 Oct 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bnH4J6z0IFEZARKEd79W5NrbUkY8SRwIOuFp6jS6D18=;
	b=pSCc+W8KoXBAWrJLI0rP7qvlQNKsmifuGIB5l9tFcrs/iCtYijS8JMhpb5SjFeTFlgkffS
	qHPkBy6LOWDPL8TwGZ3yTez4awA4u9rmWMr1dvxdjqnbTpLNCYi4yErFAc7pG08ii+nN32
	/j1/LNUetb63vZWB1ijJDTFwM1hNwDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bnH4J6z0IFEZARKEd79W5NrbUkY8SRwIOuFp6jS6D18=;
	b=zu5oqykL2DmvaoIkG2M/nEImUJbB5pSM27+BQAb+5JHEiSgT239TPKEufwphs8ruU51vm6
	4IrMU8rCUWRTCQDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bnH4J6z0IFEZARKEd79W5NrbUkY8SRwIOuFp6jS6D18=;
	b=FHID1f4Pi/ggYDsuP+K5aYRXa5Y5UHUfNPRloVShLvb6kQucPOsLtBG/znlIcejNK9ORGr
	GfgFoU6P9/3M+O0JOkT3aY+0R+hrczCsfLqn6dCiUUd5oA5otDRy0vtSrY4AhKc7n8NEPg
	XiJ3+6pV0Epg4pahCEQoRhTk+UaWxco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bnH4J6z0IFEZARKEd79W5NrbUkY8SRwIOuFp6jS6D18=;
	b=d0GtMeD6Wlf9S0GgBiMg7g7AjX04RMHyodjYfBUgW32CPdTkNaXmXIRVB3MyCUkRY0hdJS
	w/oEbGi+6N1sMKBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 033CF13432;
	Sat, 31 Oct 2026 15:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KZDkMrAM5moGHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:43:44 +0000
Date: Sat, 31 Oct 2026 16:43:44 +0100
Message-ID: <877bixswnj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Benjamin Pryor <programmer2514@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Andrew Udvare <audvare@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Extend ALC1316 fixup to MSI GE76 Raider
In-Reply-To: <20261028132951.1253841-1-programmer2514@gmail.com>
References: <20261028132951.1253841-1-programmer2514@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Wed, 28 Oct 2026 14:29:51 +0100,
Benjamin Pryor wrote:
> 
> The MSI GE76 Raider drives its speakers using the exact same ALC1316 smart
> amplifier as the GE66 Raider, but under a different hardware ID. Thus, the
> same speaker dropout fixup should apply to both devices.
> 
> This patch extends the fixup that configures this amplifier's silence
> detection to apply to the hardware ID of the GE76 as well.
> 
> Link: https://github.com/thesofproject/sof/issues/10475
> Link: https://lore.kernel.org/all/20260909193104.26508-1-audvare@gmail.com
> 
> Signed-off-by: Benjamin J Pryor <programmer2514@gmail.com>

Applied now.  Thanks.


Takashi

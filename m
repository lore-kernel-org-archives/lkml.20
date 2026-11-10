Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290558;
	b=0ciqZjt1plt04GHHQZ89qSn2/O7wR14ncbXjbe+jhpLCjXsd0+ve7A6vP8yJOc3fcubp
	 QvR7ta5um/pLbRdykTdiZBVtxn6XiBRphG3e1U/l53e1rWV1ss1ysfzP1jy15l4ICXy6q
	 2sObSw3K9ig8am7ruMOEbQjdWbOXo6T+07s9zisY8TYpZmHOXCRByWEFcsPBwB0S388z9
	 yqOpAFbhCipFyyHPPKfMQDBZjPGi7uX+r7wqB0TtU6E179ZfuLotuLj4xfQfq0ibK1kO6
	 iSR/3JFLkicN2itQmXM0pwZ0Xl9JNe/qM/1h7bie4xrucRdco2sO4PLxAbmO8ylLBRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290558;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=hlKSwbDaSVH7Fcw2T/jklK3nMnUgIQIhV1V2VLCXGFM=;
	b=EPI9CWRvpd/8keUQhwsn95pgD0pciDykuVmAUsWl07VeqqviOjwkqtVw15Mcb8tURJI8
	 2WyrvIXQLgyqVS/ck1BWB8KMU/KeyRQEyliMHKhSY65B5AiOAg1Oi50TNoZ0d3Y97FdtU
	 Y/dv3QFJlb5IBszp7w4BB6ZuZxEmkCkzn4wppCHXBXANJ+eMl+IPbZwIlLtDMDktZgMkO
	 k9XLryQNZPd9D+2TrcBK04+iXgMh6zIZmTykOrpZ2eG+Tq1jk0rGiIl3JmoDEFmA/qUAA
	 Wje5j0Wt9A8YjgVi7O4XVPt14W+2nLMuw/ooxifcsL2Z8HMA9htjsRnl194pt892o0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="S3/EIgPs";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FqoQYn5G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="S3/EIgPs";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FqoQYn5G;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E390606A325;
	Tue, 10 Nov 2026 06:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E390606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=S3/EIgPs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FqoQYn5G;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=S3/EIgPs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FqoQYn5G
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A89C1F441;
	Tue, 10 Nov 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794290550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKSwbDaSVH7Fcw2T/jklK3nMnUgIQIhV1V2VLCXGFM=;
	b=S3/EIgPsJ9kX+yOdzUiPuKUBuOl6GUgUxc0WF0Zr1y9+60kVdegZOg6g+/APHN0uBblfk9
	HTfQnNMLIAXvyAYXjdRLsivNuiRCgZDRc+wjDWH5+mjP2mkbLZjrSzAhPRlWoWXyY7oezO
	4AAUtNzXAZ0sWCY6ZiXnZG2TMyRXzbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794290550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKSwbDaSVH7Fcw2T/jklK3nMnUgIQIhV1V2VLCXGFM=;
	b=FqoQYn5GHhY0liT1iBzPl2O6QUsuk43C5BWnrnLj4YnG5l2jM2aG9UlXenY8KksvQlSvTm
	fhUnhXHxXuLkrSBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794290550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKSwbDaSVH7Fcw2T/jklK3nMnUgIQIhV1V2VLCXGFM=;
	b=S3/EIgPsJ9kX+yOdzUiPuKUBuOl6GUgUxc0WF0Zr1y9+60kVdegZOg6g+/APHN0uBblfk9
	HTfQnNMLIAXvyAYXjdRLsivNuiRCgZDRc+wjDWH5+mjP2mkbLZjrSzAhPRlWoWXyY7oezO
	4AAUtNzXAZ0sWCY6ZiXnZG2TMyRXzbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794290550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKSwbDaSVH7Fcw2T/jklK3nMnUgIQIhV1V2VLCXGFM=;
	b=FqoQYn5GHhY0liT1iBzPl2O6QUsuk43C5BWnrnLj4YnG5l2jM2aG9UlXenY8KksvQlSvTm
	fhUnhXHxXuLkrSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0FAD13479;
	Tue, 10 Nov 2026 06:02:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxNbMHWz8mpXGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 06:02:29 +0000
Date: Tue, 10 Nov 2026 07:02:29 +0100
Message-ID: <877bilusui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Angel J <iamanaws@httpd.dev>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
In-Reply-To: <5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev>
References: <20261103150336.507675-1-iamanaws@httpd.dev>
	<87wlqtukxh.wl-tiwai@suse.de>
	<5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev>
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
Content-Type: text/plain; charset=ISO-2022-JP
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 09 Nov 2026 18:58:47 +0100,
Angel J wrote:
> 
> On Tuesday, November 3rd, 2026 at 23:15, Takashi Iwai <tiwai@suse.de> wrote:
> > The code change looks OK, but could you resubmit with a proper
> > Signed-off-by tag with your full name (also From tag, too)?
> > Signed-off-by is a legal requirement.
> 
> Hi Takashi,
> 
> Thanks for reviewing. My understanding is that the guidelines require
> a known identity, without necessarily requiring disclosure of a full
> name. I consistently use “Angel J” and this email address for kernel
> contributions. My PCI fix, commit 8805840aad73, was merged with the same
> author identity and Signed-off-by.

Is your identity really already widely known in the kernel community?
I see only one recent commit in the past, and I can't see it's really
"known".


thanks,

Takashi

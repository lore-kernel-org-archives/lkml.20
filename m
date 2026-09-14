Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A174825AD;
	Mon, 14 Sep 2026 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403179; cv=none; b=Ao9sBAiUb2IGzgBzt1TBmDBOLu4OhPD3vn/Vg8kPgWHwL3q78qWr2w8z0YvBF0IpESokcY7gLxEEVJ7AIsczqG1ZAcDC13HIx3hM806aG7if48yFIT3J76jNlo8qAY4eaAqcwphIFibCKjVKVO8FHTkuIjH+tMGZHOvWFbJE2DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403179; c=relaxed/simple;
	bh=ZVwpZoMSfrKNjux9jXh1ZVzVg8OHjZ974tS9tzN9B04=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J9MCOAKs/5bJDqTRz7JQqKqqikkeRLz0qKHctTCAzdVTrpeet74S8xG+DE2wjD/TjfbNJRPZ0D3ciGL/sMcyH616QK9Bbh2s9PV5qGdgphg2ne1zQgA1nbh4TCoS6Em/O5YkUIuijSDr9+dO4L8CrLrpMu8vZ/uGul1Qwcl6MgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MC751B7Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6jXjaUAi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HEleylj/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l1IkWKJO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MC751B7Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6jXjaUAi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HEleylj/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l1IkWKJO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 012E91F893;
	Mon, 14 Sep 2026 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789403172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec3SjCvHqmYzNp3GziZzwaven0ui4pQiwHACFg0Dz0w=;
	b=MC751B7YQIP51aU88k+GB2VZ+g1VYZxj1IUuSTN0fEbtrwgSprprmdUap0WGVhDFi1FcfR
	UL7QUZb4cH9RMCIrn7x2sHzNjtCGflxZKZ0KnoWm9s2F/fAhJCjvi0wJIZzgh6CGXvSHEM
	LWuClMuDJjmRNqhRBCRm91Ft4JIqv9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789403172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec3SjCvHqmYzNp3GziZzwaven0ui4pQiwHACFg0Dz0w=;
	b=6jXjaUAiRbPpggxzWdJQozXmvsVC3IJnh9HPj0sDae2gUUBurSAAHtHcL9XMo4Dso4pDRB
	PL7qYZ/ITvvwGRBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789403168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec3SjCvHqmYzNp3GziZzwaven0ui4pQiwHACFg0Dz0w=;
	b=HEleylj/6ZI4petHbJLgAinRpU//qnUt8+/twVfnYtu8tkn6GaMKpZIFLmZHtAgdcUb4PR
	Zl0lLiq5nM3eq3OWVxODEs2HDIR+/F9+VvDRYrHs7sNHQTJefZ1TDOFjOBU9MynnCuWUCH
	eXVeo7a2dmtQf1eRkGMBMuRo3MwYGGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789403168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec3SjCvHqmYzNp3GziZzwaven0ui4pQiwHACFg0Dz0w=;
	b=l1IkWKJOO7gFJE+bNRN4GHBd8Rp0b5vO0VXBFcQLkgcaJzn5akHs99hD6g+PYyH0OzzB2U
	oaANhnby61w6PyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7BD813693;
	Mon, 14 Sep 2026 16:26:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ngKvJx8gqGpDKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:26:07 +0000
Date: Mon, 14 Sep 2026 18:26:07 +0200
Message-ID: <87zexjn6jk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nicholas Hobson <nicholas.hobson@outlook.com>
Cc: "clemens@ladisch.de" <clemens@ladisch.de>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: keep MIDI input running for Roland TD-11
In-Reply-To: <MN2PR15MB3472557AF39DC3A4CA9E753FF8BD2@MN2PR15MB3472.namprd15.prod.outlook.com>
References: <MN2PR15MB3472557AF39DC3A4CA9E753FF8BD2@MN2PR15MB3472.namprd15.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,outlook.com:email]
X-Spam-Flag: NO

On Sat, 12 Sep 2026 05:28:42 +0200,
Nicholas Hobson wrote:
> 
> From cbb4e446c3278aa99b34e622ac7ccef3e6d98d5b Mon Sep 17 00:00:00 2001
> From: Nicholas Hobson <nicholas.hobson@outlook.com>
> Date: Fri, 11 Sep 2026 21:58:09 -0400
> Subject: [PATCH] ALSA: usb-audio: keep MIDI input running for Roland TD-11

(Those lines look superfluous.  Please avoid it at the next time.)

> The TD-11 hands MIDI handling off to the host once connected via
> USB. If no MIDI input port is opened on the host, the device itself
> becomes unusable as a standalone instrument until its input is
> serviced, independent of anything happening on the computer.
> 
> Add a per-device keep_input_running flag, set for the TD-11 in
> snd_usbmidi_detect_roland(), and check it alongside the existing
> opened[1] check in snd_usbmidi_input_start()/snd_usbmidi_input_stop()
> so that input is started at device creation and never stopped for
> these devices, regardless of whether a client has the input port
> open.
> 
> Signed-off-by: Nicholas Hobson <nicholas.hobson@outlook.com>

Applied to for-next branch now.  Thanks.


Takashi

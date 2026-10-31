Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463166;
	b=2d1Cb1tBzlFboUbSUzY9POrT27qcrBGMQ+aLbeKVXe+j8mX4E+9OTgL8l6LUggHQlQf4
	 BYJO+Rdtnp7CE8FskpJo9aIRCXUzTWmeVADWeS7Su2U9V/E1GrO/KJuefmp/H7Sj5rtb+
	 W63tXdjzyIGDrYfcDGy2sckhiQ4W1cbXhf3U1dcmlqbWrvXOVwJRX9UkShnEnmeNLGc/6
	 UnNjl3pyZok8AGj8Fsy/Z1WwPqYAM40qP5Xuwn0jWYu915kRx0XZbtBLpsmNklCKEL7u4
	 /1d/raVKXYNG3e7PSvFHUjXbyER8fhHceB7UHpsfQog2qoRKnD4dkMWXcor54z4UEpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463166;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=xBoX79OpWddKrpqAhV9tUfB+7WiEljXgY7LiZaYjpCY=;
	b=INPQeJKLpQX2uOdRmhhtqyhFZqHGutvjBbFwZm74JF5YDH6LzXwUF76dKc/kqhPbkZR8
	 Mo9qY7XVjHT3fJ2bNoW0sNRfKgJETiiO5zdv5iOL+T3ypVFmgZwWm36drtWd32SXLfb7J
	 c/QTuC3YauU7zgbuYukKkGj2uHUvyFRfvAWV0cIRzF54cG9gojYYRmpG2SPtg2Qcp4Alg
	 TCfsRKoVAMF6DQAxpFlTF+U6hALfFZ07GVSukx4DiOH3U/eysfwLFHkWgcXNzkKbwI1Bp
	 WBG9+d1lgsL6SHtvYbhFZ7SxHIIlygSY1HmO05UyJydSGO4q87O6PJouv5ABxYxCyVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QarhRRpB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BmPcZSWT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QarhRRpB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BmPcZSWT;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE75606A31A;
	Sat, 31 Oct 2026 16:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QarhRRpB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BmPcZSWT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QarhRRpB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BmPcZSWT
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 293201F397;
	Sat, 31 Oct 2026 16:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793463164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBoX79OpWddKrpqAhV9tUfB+7WiEljXgY7LiZaYjpCY=;
	b=QarhRRpBwNdwSwhtkvZviPpO8/29Iaamue8maIxLz9ALmCZsfeDJu3WezmK7VMK2DQ5KF4
	PlcXWytQ2LbfbY2YBki75HlX712Yy3/WUb8/SQdqBbmhR8ErgwORFAA1sTdv6b+am1zokg
	vxANbeDEl6HGntt2BfIvNMX0COCi4us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793463164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBoX79OpWddKrpqAhV9tUfB+7WiEljXgY7LiZaYjpCY=;
	b=BmPcZSWTah/mwJuywX68srf30QmIZJii1d1iI3ohayL4FairHPw1LPUBOk6Qa/cnQp8yuA
	5+bzS+zOUGqgUzBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QarhRRpB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BmPcZSWT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793463164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBoX79OpWddKrpqAhV9tUfB+7WiEljXgY7LiZaYjpCY=;
	b=QarhRRpBwNdwSwhtkvZviPpO8/29Iaamue8maIxLz9ALmCZsfeDJu3WezmK7VMK2DQ5KF4
	PlcXWytQ2LbfbY2YBki75HlX712Yy3/WUb8/SQdqBbmhR8ErgwORFAA1sTdv6b+am1zokg
	vxANbeDEl6HGntt2BfIvNMX0COCi4us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793463164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBoX79OpWddKrpqAhV9tUfB+7WiEljXgY7LiZaYjpCY=;
	b=BmPcZSWTah/mwJuywX68srf30QmIZJii1d1iI3ohayL4FairHPw1LPUBOk6Qa/cnQp8yuA
	5+bzS+zOUGqgUzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1E7E132D3;
	Sat, 31 Oct 2026 16:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9eG1KXsT5mrWOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:12:43 +0000
Date: Sat, 31 Oct 2026 17:12:43 +0100
Message-ID: <87jymxrgqs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ahmad baghereslami <ahmad.b1995@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3
In-Reply-To: <20261030045626.1608040-1-ahmad.b1995@gmail.com>
References: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
	<20261030045626.1608040-1-ahmad.b1995@gmail.com>
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
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -11.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 293201F397

On Fri, 30 Oct 2026 05:56:26 +0100,
ahmad baghereslami wrote:
> 
> The HP ZBook 17 G3 (PCI SSID 103c:80d6, codec CX20724 with SSID
> 103c:80f8) has its speaker-mute LED on codec GPIO0 and its mic-mute LED
> on GPIO1, both active high, like the HP ZBook 15u G3 that already uses
> CXT_FIXUP_MUTE_LED_GPIO. HP's Windows driver agrees: chdrt.inf sets
> EnableGPIO0MuteSignal for this model, and MicTray's MasterMute section
> for SUBSYS_103C80D6/103C80F8 sets PlaybackGPIO = 0 and CaptureGPIO = 1.
> 
> Use CXT_FIXUP_MUTE_LED_GPIO for it.
> 
> Tested on an HP ZBook 17 G3 with Ubuntu's 7.0.0 kernel: with each GPIO
> held high and low, GPIO0 switches only the speaker-mute LED and GPIO1
> only the mic-mute LED; GPIO2-6 switch neither. With this quirk applied,
> hda::mute and hda::micmute follow the speaker and mic mute, and sound
> and the microphone keep working.
> 
> Finding the LEDs (the GPIO tests and reading HP's driver) and writing
> this patch were done with the help of an AI coding assistant (Claude);
> I checked the LEDs on the machine.
> 
> Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>

Applied now.  Thanks.


Takashi

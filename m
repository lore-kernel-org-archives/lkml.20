Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776564;
	b=C15OZcTPYD/j89+lM9Bg8k4ZubMRvlwA2/vPkz2focc4rYnGoxbiLNIYo2xugA0Oobsn
	 N8DxbQoIRXcA/58lXu1JARQ6Y8QgikmD4FaUslIorlAz8ygRXjwSpbleiFsougzvmmigp
	 zrWhfbG9lZdg31QHXSQe2v9fE8q3C1XnoBmvfADByv3i2ieBkVuNACNSFhCP+olrm1/0u
	 Z1VpQ03t7JkHEm21lmtTtTlkiHjbErmDQe9y5grdZGcyPzECAd01EdlfN6RzMJMCrmf+f
	 okkGf1v7mog0UxXt1KoqYXXCKcBZYZ9xCehXS6z8CNtR27yYCPRAH66sR2qzBINNWew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776564;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=QjJ65ZKmDP/fLLNIH3WqCv9O3bjqoPtm4BYDYYVZ/F4=;
	b=qUCTAmi3mlVGOFH8LVP+K9i9DwJl41NEBPqQSChAJPXEmiTGXVOmi2jMX/J44GdRmoV7
	 Vlu2MDrIjW9WkH0mQ1Uba2ktaSyAOmhzzFW7+pAxUiUp9qcmQU9iSDEvfeMKZSEi+4wyF
	 bsF43c56CsK7oV0SOJzjviwyESIuPuGc3LxxnCRewvuJ40dwzETQgluD6hfEIWbndEp5g
	 INcqlzxCtdYNESHLWtj0sEF4THkwk7CLL84G0guJySPWAo6Z3YtYbLrRJ0QBAkm5u+pei
	 vOVPe95UCyARKzPzLXotORWpi+8jVRvgQn3yDFimS/MfU/h1z30w+BEj4zI/s3Opv+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="rGapP/Pl";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UrD9K+Oc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="rGapP/Pl";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UrD9K+Oc;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82103606A326;
	Wed,  4 Nov 2026 07:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82103606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rGapP/Pl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UrD9K+Oc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rGapP/Pl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UrD9K+Oc
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A66291F7CB;
	Wed,  4 Nov 2026 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793776561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjJ65ZKmDP/fLLNIH3WqCv9O3bjqoPtm4BYDYYVZ/F4=;
	b=rGapP/Pll8UbfxK569tA+1jF0swbl5gxRuP39MJK+me0//oSxXMlrTYdh2The7f4SsyFTI
	LEuAq2E+U2nWUjbpTCKLFI+eE6r6sC67pw9zQRw44XbKt2+q0HR+33AI9cQelAtGa9nFEs
	vRkCuOUw/2vbG8IXxCHPj9/7yrTMBhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793776561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjJ65ZKmDP/fLLNIH3WqCv9O3bjqoPtm4BYDYYVZ/F4=;
	b=UrD9K+OcaMQw3VfXc707U1GxV5vqT1we/RDoWLR8fcVT0u1aT61Q9D1i4j3QWfXItV8853
	VQ2EgCDfu4xJBtAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="rGapP/Pl";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UrD9K+Oc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793776561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjJ65ZKmDP/fLLNIH3WqCv9O3bjqoPtm4BYDYYVZ/F4=;
	b=rGapP/Pll8UbfxK569tA+1jF0swbl5gxRuP39MJK+me0//oSxXMlrTYdh2The7f4SsyFTI
	LEuAq2E+U2nWUjbpTCKLFI+eE6r6sC67pw9zQRw44XbKt2+q0HR+33AI9cQelAtGa9nFEs
	vRkCuOUw/2vbG8IXxCHPj9/7yrTMBhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793776561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjJ65ZKmDP/fLLNIH3WqCv9O3bjqoPtm4BYDYYVZ/F4=;
	b=UrD9K+OcaMQw3VfXc707U1GxV5vqT1we/RDoWLR8fcVT0u1aT61Q9D1i4j3QWfXItV8853
	VQ2EgCDfu4xJBtAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3258F134A5;
	Wed,  4 Nov 2026 07:16:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NJpBArHb6mo+LQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 07:16:01 +0000
Date: Wed, 04 Nov 2026 08:16:00 +0100
Message-ID: <87v76dukwf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Slaton Christie <slatonchristie@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l41: Add DSD properties for ASUS UX582Z (1043:1a8f)
In-Reply-To: <CAGFOuqziB0ofUbCeJB4y72gmpqPo_DG5c0LdedCbWMCpQZAG0g@mail.gmail.com>
References: <20261030170354.7427-1-slatonchristie@gmail.com>
	<871p92x9di.wl-tiwai@suse.de>
	<CAGFOuqziB0ofUbCeJB4y72gmpqPo_DG5c0LdedCbWMCpQZAG0g@mail.gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A66291F7CB

Please no attachment, no continue to thread, but just resubmit again
the patch with the proper Signed-off-by from scratch.


thanks,

Takashi

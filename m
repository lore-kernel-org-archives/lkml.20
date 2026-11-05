Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865092;
	b=DdtVmQ9Jp3VOvsvOnkbdyXjwBe15XlDvGSlzrF15zOtr2W0UviR4wIB0YmFHMpdP4OE2
	 dCXCyn5IRtgEKLjJHwW6ArNrayHmVANbe0Os42p+RqleieYlXC4TOPghx2DkZvX7ezSWP
	 R4y0fyAvsu7O9ny23LGpSLcTBuu27P9NP5CAhH57WICfUmaTgsZruiZae904B20dqfrjm
	 HDMslGYlsrPBumbsGnQmoI6tYHYrSD/F7eY888I2iWKHmQTLFRQgnED5A3N3f0pB34mdx
	 GcCdINRsH2vHkZo3j2x97Udg+zCo7TVYaQ7NBhsciG2uuewGB+IOJjChQvYFw4EbrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865092;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=+Q7JgkSMoctEcO8fQ96DDbIs0tZvAmYtUcMJCiNoz1k=;
	b=RNI3kJftTD3Z42FhLVz8JBGG8IjNtWEvnhMwNiQeyyoN700El8rAOXGSg1cW30fOJSkn
	 d2fgBsM8aWNPLsC+ttDZXw2hXHSyvAfgKCkI6UfklMW6bnnoFfzE36NTlmYF5ZVxEs1w2
	 vBM1zQI2e45l0uJdh8TPk9hvkoietO/fO6sWJiSNG+v0am52DIVo3HVYFKCZfv6CnVUnm
	 me9EY62dPb9lG63PJBTNNm+KrXTtJALKPA3wNmOl0GptBsrx5zyCGWVJ03gFrH83DGWq6
	 lBkZpoLD6IVIgQ/Yq+2Z6Khvqe710PV/KZTM+IOz3bMyDATy/5xtaeVmmLg7G1pq2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EKE9qgQp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HkXB9TBW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EKE9qgQp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HkXB9TBW;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF122606A31B;
	Thu,  5 Nov 2026 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF122606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EKE9qgQp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HkXB9TBW;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EKE9qgQp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HkXB9TBW
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1711B1F458;
	Thu,  5 Nov 2026 07:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793865090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Q7JgkSMoctEcO8fQ96DDbIs0tZvAmYtUcMJCiNoz1k=;
	b=EKE9qgQpuLHVGjkI6jYIzSs07m2+kpVrGFzPqy3GaxT2/Y7rEy5jYJIZ1wuGErlT1WWHl7
	Q5oPEhdAPfRNWooptI/9xG3Np3zrivf5a4JXo9MmXhXTwiFAL7AHD76U2b+PQdUkQpphtF
	HTNRgtRjVU5j4u1OcL4E83o2XryCwJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793865090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Q7JgkSMoctEcO8fQ96DDbIs0tZvAmYtUcMJCiNoz1k=;
	b=HkXB9TBWc9ygafJgm+uAhST41NhmHEdDFKgHSieswHsVGriKRx8O7GpRX6L8bwya/zbzms
	CDKqQXhw3MChbIDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793865090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Q7JgkSMoctEcO8fQ96DDbIs0tZvAmYtUcMJCiNoz1k=;
	b=EKE9qgQpuLHVGjkI6jYIzSs07m2+kpVrGFzPqy3GaxT2/Y7rEy5jYJIZ1wuGErlT1WWHl7
	Q5oPEhdAPfRNWooptI/9xG3Np3zrivf5a4JXo9MmXhXTwiFAL7AHD76U2b+PQdUkQpphtF
	HTNRgtRjVU5j4u1OcL4E83o2XryCwJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793865090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Q7JgkSMoctEcO8fQ96DDbIs0tZvAmYtUcMJCiNoz1k=;
	b=HkXB9TBWc9ygafJgm+uAhST41NhmHEdDFKgHSieswHsVGriKRx8O7GpRX6L8bwya/zbzms
	CDKqQXhw3MChbIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C249C134F4;
	Thu,  5 Nov 2026 07:51:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g2iUJYE17GrYCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 07:51:29 +0000
Date: Thu, 05 Nov 2026 08:51:29 +0100
Message-ID: <87y0b7sola.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Use inverted mute LED quirk for HP ZBook 8 G2a
In-Reply-To: <20261105025647.1116662-1-chris.chiu@canonical.com>
References: <20261105025647.1116662-1-chris.chiu@canonical.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 05 Nov 2026 03:56:47 +0100,
Chris Chiu wrote:
> 
> HP ZBook 8 G2a (SSIDs 0x103c:0x8f40, 0x103c:0x8f41, 0x103c:0x8f42,
> 0x103c:0x8f62) use the Realtek ALC245 codec with a TAS2781 amplifier
> via I2C. They share the same hardware configuration as the related
> 0x103c:0x8f94 / 0x103c:0x8f95 models but were left on
> ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED, which drives the speaker mute
> LED backwards: off when muted and on when unmuted.
> 
> Reassign these SSIDs to ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
> so the LED follows mute state correctly.
> 
> Fixes: 9afbbf490322 ("ALSA: hda/realtek - Enable Mute LED and Tas2781 for HP platform")
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi

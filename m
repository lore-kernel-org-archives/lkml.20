Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9297441F379;
	Wed, 26 Aug 2026 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758093; cv=none; b=Of/gGMKXm3Lw0NgLGy02DQqmZv93nK0BZ8ZQTjbtweHBSqj4qqOlHVT7h0CTUZVAg7PUsW2QG/1AlU01dm6L90qdjn7IUcEmYajPxwVkNsg4eIn+dEZEF95aw+wzPvWf2OqMtiUOIK9YIE3CvIRW3mROVtQqyz7Qyls6rNs7ZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758093; c=relaxed/simple;
	bh=ql5L1X5B1xrSd16oOT3rkSXC0D1nE7eZWCoMpLA82IU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHvvtxHZ9oOGuUl/j3+rhXme6VB5ESIuxeQPs2s33z9O4FbWhsZzqCs1hN0U3YCInoWywOdMw7Vl2ChcfeLOX8VH/VgYPI2ls4m4NAI+ONmkaTnplaXaakJ9tWh/9mKUwYNxaCa/skApQshBh21PhYZJwmMT2gPAST+3FGKOYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EDX+cuYO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7vSRRno0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fg6Usnuk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Oe0xy4MX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EDX+cuYO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7vSRRno0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fg6Usnuk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oe0xy4MX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC08721166;
	Wed, 26 Aug 2026 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787758082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMwM+wkM9+AtG95FmkryQYWLFycbhavz/ozUdsBzMJI=;
	b=EDX+cuYOAcCiVfuz74SmQtep5L5GNxtBUDrwCcrF57JXON57toHtU9QCs1ys01ReWLQ/XP
	RUuT6DBXz0WwsYmN8VqKMj/TJ2O0V6J5QCA/Jy5M1qmRI1udYafn8VkMwYH2amVbSf897S
	7ZzvI7pfOim4B6OF2lQrH376IYBrmPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787758082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMwM+wkM9+AtG95FmkryQYWLFycbhavz/ozUdsBzMJI=;
	b=7vSRRno0hvB1ANZroc6KqQdjf5wF2Vvb9RZprus+ZEu36zVZZ4K0CkpCP4VrAp3cALAfp/
	w0dMjMvLJhRoMOBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787758078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMwM+wkM9+AtG95FmkryQYWLFycbhavz/ozUdsBzMJI=;
	b=Fg6UsnukFAp106JOlRCCEpskvIF5AVzYyvhAuHRCAlCTmF9ZCMW4MiZa4tqS2vS2vKUKNg
	Of5SN4GuLx+yAW3bV9sNA8V2kSrf4SYMJRnSYXgOmUkgc04Z+XN/b4ih5TjPS/4pwfyDIE
	KZv3ObC19L68+bEVmoCU3CuhKu8AXEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787758078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMwM+wkM9+AtG95FmkryQYWLFycbhavz/ozUdsBzMJI=;
	b=Oe0xy4MXEJnF8uM1X1ZvQhB4eK8L3FThm5OjGK8/Fu0pmtFjp7olaH+jyjdX2GaZFL8jVg
	9xMk5l9jdbaW8TCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 834151361C;
	Wed, 26 Aug 2026 15:27:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Bfo2Hv4Fj2qJXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Aug 2026 15:27:58 +0000
Date: Wed, 26 Aug 2026 17:27:58 +0200
Message-ID: <87wltcgav5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/conexant: Always enable the headset-mic pin on plugin
In-Reply-To: <20260826115344.2128835-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
	<20260826115344.2128835-1-songxiebing@kylinos.cn>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.982];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Wed, 26 Aug 2026 13:53:44 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> Rename the function to cx_process_headset_detect_plug_type() to reflect
> that it only reports the detected plug type, and move the pin control
> write into cx_update_headset_mic_vref() so that node 0x19 is always set
> to enable the headset mic with the 80% VREF whenever the mic is
> present, regardless of the type detection result.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>

Applied now.  Thanks.


Takashi

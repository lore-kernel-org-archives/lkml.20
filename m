Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717360;
	b=KrbXHogmUjqju76fA2T9a9lIOOIw0WqPg3ralTrMHg0jTa2iE/ybHGQtZFFJg3KrmVGO
	 4oRz6fqIaU2qioabp5iICis58d6wiXh6hrlZ9xZ815SYLcHbE9BxlV3PUwS50UfbDRmn9
	 1y29SLJNSqai8uEM3vQbIBYbQ56LSCMmiiaCLijNRN/2yCfdXVHvFDnP5w0XjHO8KWl4C
	 9V3DCjcSn5bXchUDeaImOaMCcgJ1fC7np6+ay+vT8hEehJbv7b+jNPoUpgJDPFvl4N1FW
	 AqvjMDWmmvmm5nWXI1GjvsHq2Uj00d3aOXMPpd/5ODyYlV403ZaiFYoCQSy7SZRS54Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717360;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=sKL4AWk3aQHkfahsd2AXRwfJvzDoIl3j2nZcbsfE61E=;
	b=3yW+fv0PkVg781UjepqsrlpIGmg/VfaF8W0ccN/zCAMNHZlcClEgotIf8y/OtZ4P2EQX
	 bWANUkRK0mRAFGsoxPHu+1pCC8bMcri7wAU/uX06Crcq5jbs2yq6oEjMoFQ/xMW4Ze3no
	 2/CDBqAc6kZ+6+6Yt6b44Ffl+tHykO/DtKMeX5M5BeVgVZdukX0qZn400xpDtSWRG8vMy
	 L/0Q/zQaUXeaWIK2eVxUhwr646eKjinDaDKCJnsf6sc7gLUj2RFZat9AaeJo6SjKekSoX
	 SjQ3sLyhJV6GRtroRbCs+lDEuCYbaPIckUlpLm31rotamNZo2YzCap7XNsbm5jV/k6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CY8ulVKG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=swWAfaMD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tImlbgSy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZrXLH1BD;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7C606D820;
	Tue,  3 Nov 2026 14:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C7C606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CY8ulVKG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=swWAfaMD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tImlbgSy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZrXLH1BD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC21A1F769;
	Tue,  3 Nov 2026 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKL4AWk3aQHkfahsd2AXRwfJvzDoIl3j2nZcbsfE61E=;
	b=CY8ulVKGImMbxVXZn1SNOy+s9C6dwHEYuBFLDTmHFKpdFueLIVzlV1zKkmIvifgUy9N/le
	35NGlCoVK5CgaNdNraYONOiymtu9jZtBYOkXmfGgK10IrRmYNO4ICFIz6Cmx7cDKbq5Uft
	8uqKeBbLWknRMRf4kJ6lsR5Oh4xYoNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717358;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKL4AWk3aQHkfahsd2AXRwfJvzDoIl3j2nZcbsfE61E=;
	b=swWAfaMDtHomSRR9eWwM41lpodzM2CrprgWLMG3zJXHVXCzTZiC0xzJMB9+LRFX2xW2oDt
	9E8S4AfEFOXfFYAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tImlbgSy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZrXLH1BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKL4AWk3aQHkfahsd2AXRwfJvzDoIl3j2nZcbsfE61E=;
	b=tImlbgSy/RO6ItwfZ3sWuCoYpLVwmBZq/ArawrwrchVfoOnqTZqGqysVkk8ZxgOw2nQvU8
	oVB6+5f5upu8iE+9A1bDwfna7RHS72BJBOEhLheB+UJ1NPT0hrbthslbWb50bsYpMHnYvg
	NmSmDjUAP4ofwW0adDl86Ld+za0sHUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKL4AWk3aQHkfahsd2AXRwfJvzDoIl3j2nZcbsfE61E=;
	b=ZrXLH1BD3vDq7aHgLEUL/VllhbW5RgApINjgt/Icrug796ERjLN3P3mnVcTkdQbQD+pYdL
	gOZKDAAdN8GZiZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6298C1350A;
	Tue,  3 Nov 2026 14:49:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KMsrDW306WpRFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 14:49:17 +0000
Date: Tue, 03 Nov 2026 15:49:12 +0100
Message-ID: <87y0bavul3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: tiwai@suse.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	perex@perex.cz,
	baojun.xu@ti.com,
	kevin-lu@ti.com,
	sen@ti.com,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Prevent throwing away custom calibration addresses
In-Reply-To: <20261102174052.1216670-1-lkml@antheas.dev>
References: <20261102174052.1216670-1-lkml@antheas.dev>
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
X-Rspamd-Queue-Id: AC21A1F769
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux.dev:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Mon, 02 Nov 2026 18:40:52 +0100,
Antheas Kapenekakis wrote:
> 
> The V2 UEFI spec for per-device calibration data in TAS allows for
> manufacturers to specify up to five custom calibration register
> addresses and values to optimize per-device in factory.
> 
> A basic description of the spec is found in a comment in function
> tas2781_apply_calib(). However, currently, for the condition of
> p->dspbin_typ != TASDEV_BASIC, if custom calibration addresses have been
> provided by the manufacturer, they are ignored and the ones listed in
> firmware are used.
> 
> In case the manufacturer chose to change different registers other than
> the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
> UEFI calibration data to scratch different registers and cause the
> firmware to misbehave. This is true in the Xbox ROG Ally X, for one of
> the firmwares, where it pops and has audio dropouts after the
> calibration data is applied.
> 
> Therefore, add a new bool to indicate that UEFI supplied custom
> calibration addresses, and if so, use them regardless of dspbin_typ.
> 
> Closes: https://lore.kernel.org/all/179122346529.6.9250312386131579603.1671009695@8alias.com/
> Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Applied now.  Thanks.


Takashi

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803439;
	b=UckAycY7FUcA3f0WmeWhQHGZ9DfVJmfxIzdXS+SCzk/9VRVKnc1insX1bKAQxqbMXQlC
	 RMOs4ESuyQ1j/6dkxruNKsld8TEoibVdjDjt4ecO/WZRlgOEUWHRDdU2B8J9LYR7Tkoms
	 dms/BKARzV/IVUG3nnj3BxHlHXzSbC4z1P9CKd4QBBuE6o6qnW14Z8DoDmiJlEWdbOzui
	 Qz6DXRq6ovFj30QsbQhZcu2xklUA0rpZbl+QsC10Agl9ImDFlEpEX9mRydIyx4U2uuG6a
	 W10e9rEeNZuPYy2k8BAiXh74NUeXnm9+YmFFek1fz6J2WZ8LPNZvJAFaKk1mjEpNHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803439;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=vpf2Ndrkr6JKsOeock71oKpGQ+vYbkjqktDkHCPwcr0=;
	b=Vh8YVzcgEA5jkrQg/3mpVdt4Q0z6NZyRcy4lUONJhd5oR+ZnERsMaNBp5L3B5x/vf4Aj
	 NTi8kTu1Tl3c0CYDDaZB699wTnPHkujcp7ojwx8I4nuezC62cHW79Q1SLNPfyC1v32ZY7
	 nrffLPOec1F0Bl7l22uu9eSfD+CSXgNtF36kCIdXEl8mtopw3ueE6X6CfA0Sa9D9oaU/T
	 6cRKrsxhiGk0EmE6Py1Y1qvYxwEfzH7fVnph1mxLy2LVfXQgyU2CUm2xOmmYI0cOFaCHf
	 ifJTAlQyJeuryYxD+ebY1a4klMnNjuqNggtunRohWl5EcfEyLA87uz6GJ2LjqpsL3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="r64rg/TM";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eURxD1Lm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="r64rg/TM";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eURxD1Lm;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FF606A329;
	Wed,  4 Nov 2026 14:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3FF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r64rg/TM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eURxD1Lm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r64rg/TM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eURxD1Lm
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 965F51F7DD;
	Wed,  4 Nov 2026 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpf2Ndrkr6JKsOeock71oKpGQ+vYbkjqktDkHCPwcr0=;
	b=r64rg/TM9kY4ZqDEi3l+7ImhyZrSqe7XSLZfbtgGj9sIHcugf9Ek+FR+uyli+JaQR88iHv
	qiULgWDKsSgGD7xw7SjOoQYsx9OCVqMA4KDOXIoI/iv7rPmiYP8zZhgC3C72GToBriMDsF
	s3BzdGAwYNE6JrU8R8NXJ/pEa14H/6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpf2Ndrkr6JKsOeock71oKpGQ+vYbkjqktDkHCPwcr0=;
	b=eURxD1LmstCE3y5MNGOw9jnx8edQXyk/qQdcsFxq/eEvC8qV75JzLi9W4o+jzypP/pxkKB
	HfQ0icJzj53ncCDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="r64rg/TM";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eURxD1Lm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpf2Ndrkr6JKsOeock71oKpGQ+vYbkjqktDkHCPwcr0=;
	b=r64rg/TM9kY4ZqDEi3l+7ImhyZrSqe7XSLZfbtgGj9sIHcugf9Ek+FR+uyli+JaQR88iHv
	qiULgWDKsSgGD7xw7SjOoQYsx9OCVqMA4KDOXIoI/iv7rPmiYP8zZhgC3C72GToBriMDsF
	s3BzdGAwYNE6JrU8R8NXJ/pEa14H/6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpf2Ndrkr6JKsOeock71oKpGQ+vYbkjqktDkHCPwcr0=;
	b=eURxD1LmstCE3y5MNGOw9jnx8edQXyk/qQdcsFxq/eEvC8qV75JzLi9W4o+jzypP/pxkKB
	HfQ0icJzj53ncCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B6DA134F0;
	Wed,  4 Nov 2026 14:43:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id idMSCaxE62o6fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:43:56 +0000
Date: Wed, 04 Nov 2026 15:43:55 +0100
Message-ID: <87wlqsu05w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: cs35l56: Fix mixed cleanup and goto in cs35l56_hda_fw_load()
In-Reply-To: <20261104111121.1054077-1-rf@opensource.cirrus.com>
References: <20261104111121.1054077-1-rf@opensource.cirrus.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 965F51F7DD

On Wed, 04 Nov 2026 12:11:21 +0100,
Richard Fitzgerald wrote:
> 
> Remove the gotos from cs35l56_hda_fw_load() to prevent mixing
> auto-cleanup and goto-cleanup in the same function. Replace them with
> returns and remove the goto cleanup code, as there's no need to "undo"
> a cs_dsp_power_up() with a cs_dsp_power_down() here.
> 
> Two previous commits added auto-cleanup to cs35l56_hda_fw_load() but
> didn't remove the goto, which leaves mixed cleanup and goto.
> 
> commit 0ff22680e51f4 ("ALSA: hda/cs35l56: Clean up with
> PM_RUNTIME_ACQUIRE*() macros")
> 
> commit 185841c94accc ("ALSA: hda: cs35l56: Use auto-cleanup for firmware
> loading")
> 
> There's actually no need to call cs_dsp_power_down() here. On the
> CS35L54/56/57 amps it doesn't control the DSP subsystem power (that is all
> managed by the firmware), so it's perfectly safe to just return if there
> are any errors after a successful cs_dsp_power_up(). As cs_dsp_power_up()
> was successful it is valid to leave cs_dsp in this state, which matches
> the state of the hardware.
> 
> The two places that cs_dsp_power_down() is called conditionally have been
> changed to check the cs_dsp.booted flag, now the fw_patched flag is not
> a guaranteed proxy. The booted flag is directly indicating that there has
> been a successful cs_dsp_power_up() so this is more correct anyway.
> 
> Fixes: 0ff22680e51f4 ("ALSA: hda/cs35l56: Clean up with PM_RUNTIME_ACQUIRE*() macros")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi

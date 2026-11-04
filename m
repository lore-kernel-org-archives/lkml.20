Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776525;
	b=JMdXRhi9mMSBAg/NYhyF2aNCVV6ghPvSHPXBy77V5DCMgCdm/HRLdmOqFB/qjN9vzl/N
	 4mZmfkZIvBXK+k3MkJ6g8UfgA30B0GR8rEWRHaGA/gx5i7CmdM8qy4E0LPoSAddNGeVwX
	 QrjY7VGJyo1ZpnhUOAZKxL9U1Q39XOB6z2qfwsWyAxm7P1w8KjHEv2+UOTHX/KjbsNmxE
	 aUsvldEdgTcEMOLdoDDwWsEjWrXAN97yhDE+GeTIiXmX5Yhy4xEC05exW4rf6HYtplR79
	 hTKpctYd495cT/qH1+qEpbaKvidNTCtjDCfdZpeUE3QMwgeJCvoM70JvJ4oAuNuNKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776525;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=wprdT2KqhCtODkXOFxv27UkY0+Zgs3tvvOxIGdvhzW0=;
	b=eA0mnngYa2OJztynDD1WwWVCvSc4otrhSkPJtBJMh615DR0Rkc2mSSY5u7fzr8w0fiTz
	 At3hYmv7GCnYgELr4RS5xWrmkAbQH8E80VGd2iIcfX7zKmDVQjsis3ZwdkRF4Lg21mc1G
	 cAeV4V3b6wbvW7ypVHAnM/25okNUO7E+QiDupgKvXXLUMWwDWsQxy+smbnZHeaZOWMb8S
	 YhBK5uh7MkxvU/QTHEFj9gdDGfqUm0+0297hdyUS6jdAp/scZYNbGcc8YF4vBNy9CHpiF
	 fkSyUNaFaKJ99kwrAcoAURLgMOy61oq2pi42iJGcIqFRvGVtsBxC3c9mn2BVyL6aOsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="M3/q4067";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HIZEbxCG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="M3/q4067";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HIZEbxCG;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF1606A32F;
	Wed,  4 Nov 2026 07:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EF1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M3/q4067;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HIZEbxCG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M3/q4067;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HIZEbxCG
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A858E21F99;
	Wed,  4 Nov 2026 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793776523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wprdT2KqhCtODkXOFxv27UkY0+Zgs3tvvOxIGdvhzW0=;
	b=M3/q4067n9DP9qfIBzAEz3TTxklPIFUudpX9zRGyMHUS0Vqn/tgh7NFN7t9yXsytt2bc/c
	fZH2Z9tAuF4tuI090oWeoBrbtqMZaSmeuXaMDTLmjyB75UzYLULbgxIw+qzhFYDOknxLoP
	9ndDGEkZtCM9oKGZXvv+2Dpzdc3zUNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793776523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wprdT2KqhCtODkXOFxv27UkY0+Zgs3tvvOxIGdvhzW0=;
	b=HIZEbxCGM4sWfAmkcQLvAoZwzgtkgLWtZ6jSxHNjFMDQA+0bzasgGt11uHjsYblJxMifaz
	6WSOYzSD8QPpy5CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793776523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wprdT2KqhCtODkXOFxv27UkY0+Zgs3tvvOxIGdvhzW0=;
	b=M3/q4067n9DP9qfIBzAEz3TTxklPIFUudpX9zRGyMHUS0Vqn/tgh7NFN7t9yXsytt2bc/c
	fZH2Z9tAuF4tuI090oWeoBrbtqMZaSmeuXaMDTLmjyB75UzYLULbgxIw+qzhFYDOknxLoP
	9ndDGEkZtCM9oKGZXvv+2Dpzdc3zUNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793776523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wprdT2KqhCtODkXOFxv27UkY0+Zgs3tvvOxIGdvhzW0=;
	b=HIZEbxCGM4sWfAmkcQLvAoZwzgtkgLWtZ6jSxHNjFMDQA+0bzasgGt11uHjsYblJxMifaz
	6WSOYzSD8QPpy5CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D965134A5;
	Wed,  4 Nov 2026 07:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4uj3DIvb6mr7KwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 07:15:23 +0000
Date: Wed, 04 Nov 2026 08:15:22 +0100
Message-ID: <87wlqtukxh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Angel J <iamanaws@httpd.dev>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
In-Reply-To: <20261103150336.507675-1-iamanaws@httpd.dev>
References: <20261103150336.507675-1-iamanaws@httpd.dev>
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

On Tue, 03 Nov 2026 16:03:36 +0100,
Angel J wrote:
> 
> The Dell XPS 8940 (1028:09c5) has an ALC3861 codec (0x10ec0899).
> Its BIOS marks the headset microphone pin at NID 0x19 as disconnected
> (0x411111f0). With no external microphone input in the pin configuration,
> the generic parser creates a shared headphone/mic input on NID 0x1b
> instead. Headphone playback works, but the headset microphone is silent.
> 
> Override NID 0x19 as a front microphone without independent presence
> detection. This gives the generic parser the dedicated microphone
> input and preserves NID 0x1b for simultaneous headphone playback.
> 
> I encountered this issue on my XPS 8940. Similar symptoms were also
> reported by a user on Ubuntu:
> https://bugs.launchpad.net/bugs/1971232
> 
> Cc: stable@vger.kernel.org
> Assisted-by: Codex (GPT-6.1 Sol)
> Signed-off-by: Angel J <iamanaws@httpd.dev>

The code change looks OK, but could you resubmit with a proper
Signed-off-by tag with your full name (also From tag, too)?
Signed-off-by is a legal requirement.


thanks,

Takashi

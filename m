Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4031A07F;
	Wed,  2 Sep 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340285; cv=none; b=NbpANBbrYSXiJjbFbRChBT97rRUtlty8t+gdkrAP/BYLol/t35tQY36orQInlui5yThchs7SGjKHCgjpS5EDyQB5u6sJ8NChOMkOJgN/Q4ZzEiiBKGFmckcKN9znxFA2pRXLO4vQFEwz+e9kpZjEVLjLnkApzinZfBIyYCmmCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340285; c=relaxed/simple;
	bh=qJWN6Wq5T8flaDmAqqHkcpPpWcVi39r5BgzeANhg6z0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sl2TZJT986dYeZx5NSqUKOqr0zbsdw8Abec/5q5xSVycNcHYXs8knZlma2hotBwJhcPBn3MtEpqVa4PYlokDZqQL6Zv/GurR7O4zXdTiJcFgezDu16JGqx8sZ/VxhWDugSacTruMOlu/L8USm5WOvUHiopXWQjZmIWbwjmeLvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uf8JXPEe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JaSZPZ3w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FWb66rhL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qY03jlPC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uf8JXPEe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JaSZPZ3w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FWb66rhL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qY03jlPC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0E471F7A9;
	Wed,  2 Sep 2026 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788340277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vjZy4uR2CGrgJVwM2V91ndQZRu4WgGPvBBnDUNOnw+M=;
	b=uf8JXPEe7IwCsdADgaxMZ9izFae2tmhB8/+0/bTPNU0hMKgbqD1R73zqfTf373dsIDNala
	Tn6qZPDZvFQ2vjUJ8n2t9QDmRLXZuBGjFljRcXkTYq5xVQg7fub36vHWputU+VPGT1Xj54
	g7xe4n5D5/80p0Fk78tLos0cBJQUZj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788340277;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vjZy4uR2CGrgJVwM2V91ndQZRu4WgGPvBBnDUNOnw+M=;
	b=JaSZPZ3wRuEvSqVb5LQmdlG5B0WEn8rwl+StIxZC3PQyJi4QN+H+giDHnWDtN5YtzVBpVN
	rcVmgM08JxzpbNCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788340273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vjZy4uR2CGrgJVwM2V91ndQZRu4WgGPvBBnDUNOnw+M=;
	b=FWb66rhL3cv6S48p86pie4q6tPOkKI5TGRBOJkVkM4STV1Yp7oSGF9rFzGHzXr7nuk86S9
	vio3XeX7xNmCpj9iE1/g/1kxCeZx4NVhVcKMv9McoyV040ktxjC7JEztRaaoWb1NDPdTm9
	IpNXq+NN91HOH/axo0SfJVAORm+VlY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788340273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vjZy4uR2CGrgJVwM2V91ndQZRu4WgGPvBBnDUNOnw+M=;
	b=qY03jlPCMjeK1M9qV84AfBWWdAUsCaSovxqquej9KR4un/He4n4HFuyQjSccNjQXVuragz
	1uGpuCPutnPRfTAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8009D13515;
	Wed,  2 Sep 2026 09:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gy31HTHol2rzUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 09:11:13 +0000
Date: Wed, 02 Sep 2026 11:11:13 +0200
Message-ID: <877bl4auha.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Qingyu Zhang <usupergate@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: ump: do not touch legacy_rmidi before it exists
In-Reply-To: <20260902073918.880245-1-usupergate@gmail.com>
References: <20260902073918.880245-1-usupergate@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Wed, 02 Sep 2026 09:39:18 +0200,
Qingyu Zhang wrote:
> 
> snd_ump_parse_endpoint() sets ump->parsed on every exit, including
> error, before the caller attaches the legacy rawmidi device.
> ump_handle_ep_name_msg() then treats parsed as "legacy_rmidi is live"
> and calls ump_legacy_set_rawmidi_name(), which snprintf()s into
> ump->legacy_rmidi->name. If a UMP packet arrives in that window
> (IRQ path from snd_ump_receive), legacy_rmidi is still NULL
> (KASAN null-ptr-deref in snprintf).
> 
> Guard the legacy helpers. parsed only means endpoint info was
> parsed, not that legacy_rmidi exists.
> 
> Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
> Signed-off-by: Qingyu Zhang <usupergate@gmail.com>

Applied now.  Thanks.


Takashi

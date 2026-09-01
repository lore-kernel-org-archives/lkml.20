Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98794772BA;
	Tue,  1 Sep 2026 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259125; cv=none; b=Yx7gEI/SOte5LUG6kBz0Q+wD5Bn0ejDg34+OQ9UOh11c+5k4dHUnlO4kQYyvH9ReWnLd9TiAe1gTzOjVlJWePIxMExCxA+lXJNDpPA6wBCbsPQ/uo2LIlHuJMPOoktencshfK8Jm4z3TUCOz6Fhrs4Ohg69LiZwfcjmewE766VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259125; c=relaxed/simple;
	bh=oaWczQnGvSSnR8wxKQp6n3QLjZWe0NuB5uPQAX46yz4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhvDElu/wmTGk/HNEO3QDubazcxXExX2TXNh7Y5P6H3r2cELt4gS6aHr1OcZVHwzfD4nnljoyTcgg/h+T7daK3Zs2Q1lp52kabkVIpfFnwM71lymVYn/4oLwp1tLdjauyM9mmtUevIBlSDTGBMyVucnLcAqivA7BtFdLntnCqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AkhUR9yh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n7IImI5A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MyzPm/2C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/du5xpuh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AkhUR9yh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n7IImI5A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MyzPm/2C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/du5xpuh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A01151F82C;
	Tue,  1 Sep 2026 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788259117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZ8uAID95kafUlS3Ut/6c+yQndE4Jq/ifMQnwEEg3c8=;
	b=AkhUR9yhsO5k0MO78S21B0kp6hod22q9KxF8g/f0fKAvUDO5fsfPLzc2bmRc9haAo4BT7A
	ijgvp9c+pVVuY9aJ3auqEtNaeq6QkyB8Sh78joO0veFVZfYscdRM6LaGIBweIkOVoE3MVz
	TAX2x/mpEZ2Jm+/lv19Nln1qvOmB9sQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788259117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZ8uAID95kafUlS3Ut/6c+yQndE4Jq/ifMQnwEEg3c8=;
	b=n7IImI5A8VBqDod0CTVItI+zqv1dxHW/pStZNXqibWpT+djLw76B4q1gkcGjNamSCkAWNb
	ZDR/VOoYb+CYjkAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788259113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZ8uAID95kafUlS3Ut/6c+yQndE4Jq/ifMQnwEEg3c8=;
	b=MyzPm/2C83Dk0VXBZMyMcflW63Qv4Ao8VLxOI0GX1W78DTHxSRRQpGEBF3uFBDTQh6iVph
	0osLwlt5jcAieBO9+WOhgsZWbNwELOqyE8zq6nuERXC201Q2/RTNfIfQxFVL3yz3KZWRpz
	Oqi7PctzilmrIrIf0WlmMcayCxKmhsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788259113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZ8uAID95kafUlS3Ut/6c+yQndE4Jq/ifMQnwEEg3c8=;
	b=/du5xpuhKi/PXaeIaD6mucAwXT1dW6cdyqWiC0NjTjwcLPaeHM0QltcisJRHnLUjtnUA1K
	Ljq3cMT68NGVLeAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 510EF136CB;
	Tue,  1 Sep 2026 10:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ApoxEymrlmpMCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 10:38:33 +0000
Date: Tue, 01 Sep 2026 12:38:32 +0200
Message-ID: <874ig9dzo7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: restore MFG widget enumeration after core split
In-Reply-To: <44809B8FF80DCCA2+20260901034024.2407783-1-raoxu@uniontech.com>
References: <44809B8FF80DCCA2+20260901034024.2407783-1-raoxu@uniontech.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.996];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,uniontech.com:email,suse.de:mid]

On Tue, 01 Sep 2026 05:40:24 +0200,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> Before commit 7639a06c23c7 ("ALSA: hda - Move a part of hda_codec stuff
> into hdac_device"), widget enumeration selected the function group with
> 
> 	codec->afg ? codec->afg : codec->mfg
> 
> and read subordinate nodes from that group.
> 
> The core split moved this logic into snd_hdac_refresh_widgets(), but
> hard-coded codec->afg there. For an MFG-only codec, codec->afg is zero,
> so the Root Node is queried and codec->start_nid/num_nodes are populated
> from the function-group range instead of the MFG's subordinate nodes.
> 
> Restore the pre-split AFG-or-MFG selection.
> 
> Fixes: 7639a06c23c7 ("ALSA: hda - Move a part of hda_codec stuff into hdac_device")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Thanks, applied now.

(Though, I've never seen an actual hardware with MFG, so it's likely
 no issue in practice :)


Takashi

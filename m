Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655614A60F;
	Mon, 28 Sep 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598755; cv=none; b=mu87h5XkJVSQowUBSEOXCiw5Ys5hZ5MdKWYOGjI90qZYPNV2QczKw4UcSFD5/d3jobccmDTmBfLy73/uk1Lp2xKdJ+8ukGEbCu+0BMgRQ85cxLy0dxakTa/Xc9sJPnisvTg+ExWzhIYbxjz3MsEpvaEbZWIyv2F1wtLfP4p2JO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598755; c=relaxed/simple;
	bh=VKHGwjATVv2qo24fwCxBTuXt2td5jC31V3pkTaPuMCY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fitRaVNWnp3UVKdTp5j/kbLW24WjCppnUMA0FW3QwlXtGXpTf1W4zDKglO5zqH9tRKjfYuDVsnw9iAtkGPhi9mqmCJ/qUVcaedGLQdP3O6jVRhG9uyRMDBSuwWIYP+RlIR0T/SQs9UD5Wy9+nPmucS6unPIkGAeHOtZZ95zh+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NfFiAZvL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DG7/eIM4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QsCYo+nt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EnakfErx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NfFiAZvL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DG7/eIM4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QsCYo+nt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EnakfErx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7840D1FB30;
	Mon, 28 Sep 2026 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyo1ye8iFfz/6i0pBA8NwUyA1gHeYxlway4s/c26CZk=;
	b=NfFiAZvLFV5vJFpp6H5PNouJ/r96zoa4n04lDPEYTdZDkvj/ibGch3vbI1xQ39hGVbx3NX
	rIXBeyK2q9U9lSr4aPG3IJgArpaqQN6CcKp66z6aiHY/lTUH/bMbZrEqAgI8h3SmTpvQbY
	3VjFcs80CUYkJxVqG2jVuo0Wh/aJMzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyo1ye8iFfz/6i0pBA8NwUyA1gHeYxlway4s/c26CZk=;
	b=DG7/eIM40Y/RqzH7rf5PX3FxL/OBczcca6UJ8ZcB4WzYxBu1y6hV1ZA4mU3s/RAV7nOnax
	/rFoDHLrIv/VUEDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyo1ye8iFfz/6i0pBA8NwUyA1gHeYxlway4s/c26CZk=;
	b=QsCYo+nt1KJK5zWOsfw0/gtbvp5Z5VpI49TXWdWOjTyGdu+Bavknh2T2uBII+rbhckNIo3
	GbmIRCdNTFY8cP5se7xsmDxT+sisBWm1XyfmrOREdBIgXC1NrSEydrkn9rUEb/oC1qmfid
	U5Ea6trLpyexge4PYHkfTnm4n3MXISM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyo1ye8iFfz/6i0pBA8NwUyA1gHeYxlway4s/c26CZk=;
	b=EnakfErx01i7+Cy9O7ez1rUhNy/r/M5UFEpjg7AE05TxxBsuo539JF9l4mWC/brBJIvSOB
	byqW/TPEOJxBbHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E706133F1;
	Mon, 28 Sep 2026 12:32:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3nsAOlVeumpxfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:32:22 +0000
Date: Mon, 28 Sep 2026 14:32:21 +0200
Message-ID: <87cxtx5zfu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	thomas.weissschuh@linutronix.de,
	Thomas Gleixner <tglx@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: dummy: Move pcm_substreams check out of the loop
In-Reply-To: <20260928021823.6517-1-phucduc.bui@gmail.com>
References: <20260928021823.6517-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linutronix.de,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 28 Sep 2026 04:18:23 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The pcm_substreams[dev] range check does not depend on the loop
> index. Do it once before the loop instead of on every iteration.
> 
> No functional change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied to for-next branch.  Thanks.


Takashi

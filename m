Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F5448BB2;
	Sat, 10 Oct 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631381; cv=none; b=jC60tkW6zX5388JU9hCjNbeY4YhfWbw5mPcit1NkzljwUo25+8zUwiw2mham+jGc59bxKjbaNZ7VFeqK5RYDPkfUP0VAZ048KwT8muHdYg0hyRCAEL+mltqG8P3+dti2EZS1iYywBO00OnEkOpJf82Haui9VsiJFCINKO1mEayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631381; c=relaxed/simple;
	bh=yq06gb0eXsDx/gH9qwR8GI+QZyLQnTTfQDDJVACsECc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bLuZ1NImjHc0jX/939QDNjx19gTUAnlaHFtMAjGe+XM6b+fHg4kryjjNMgZb3Y0eXjWgo30vlBMTN0CjiZ/im29v2jsuZ60YoQY3HvUhbPztgZmY8AxwKikofV95mLgT8sW+5WiL2OaBL8AQpK68HP9zL5hTBuunufKV/o0C8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=khVw7Jzi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fj0WwaQH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a7gEalz5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zAyj6kwi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="khVw7Jzi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fj0WwaQH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a7gEalz5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zAyj6kwi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F084E1F457;
	Sat, 10 Oct 2026 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791631378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ta2rtPC82IMMiP2UgG8+lUtvBagABP45FPdlCMloucE=;
	b=khVw7JziJlLNqML0S0UPnjTyU9M7KXzHczrrxsBTetKW9fKFSsqVkKKDkpSwlBjulnIEAi
	SPMqTt2LSMqzU8FtO9i65bm8ys502wYKKhb6bDvoiDR6948uBzdjpf2ybYFC7axYVpjve3
	R8crp9wnV/bF2uTbRuYP6CtcI9ACudY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791631378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ta2rtPC82IMMiP2UgG8+lUtvBagABP45FPdlCMloucE=;
	b=fj0WwaQHpoQWhJVD01n/n2nUDU6ixtdIw6uHE3WW5Ep4w22HGg9bdBv181T6gbu2AKjGB4
	wFDfhKaHu4+VSPAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791631377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ta2rtPC82IMMiP2UgG8+lUtvBagABP45FPdlCMloucE=;
	b=a7gEalz5KZXTkXe4MuEG6duycOKRGfSDBFF9evJB/cHGzbEMDHUlYUUm/F0DHf+ao922n7
	bm3HY2HMD7mhfegKMRztzse8qHAH7BkNuEWJIpfsb1fYj/+e2AJ5eGA+W5fimCNLNiryN9
	JGDFIXzfcPit3D9WKh1NW0+00YRRpsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791631377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ta2rtPC82IMMiP2UgG8+lUtvBagABP45FPdlCMloucE=;
	b=zAyj6kwiy6bvPOrVqUpqsZ6SlFa4D89wjZgkZfj0sP6NEzc0NuzSmOv9kQrAod2utm0Uou
	mRwqmV8V39wKvBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA7E21326D;
	Sat, 10 Oct 2026 11:22:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZhdSIBEgymqlFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 11:22:57 +0000
Date: Sat, 10 Oct 2026 13:22:57 +0200
Message-ID: <871p9xkdf2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/scodec: imply SERIAL_MULTI_INSTANTIATE for AW88399
In-Reply-To: <SN6PR19MB2303021FB731E4B20F2283B1FC912@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BF65050B51AE7217BB9AFCBD2@SN6PR19MB2303.namprd19.prod.outlook.com>
	<SN6PR19MB2303021FB731E4B20F2283B1FC912@SN6PR19MB2303.namprd19.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[outlook.it];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 10 Oct 2026 11:44:18 +0200,
Marco Giunta wrote:
> 
> Hi Takashi,
> friendly ping on this one-liner (I forgot to include it in the original
> driver submission and it's been bothering me ever since).

Applied to for-next branch now.  Thanks.


Takashi

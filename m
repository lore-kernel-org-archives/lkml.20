Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD9F33D4F0;
	Sat, 10 Oct 2026 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619277; cv=none; b=d4z7o+j/hKBN/n5ufzzht3GBLSgNzBrLsVhnN15GofN7I5HaAHxsWUFHbJeF5j5bZ0QiucRUZfo4TQDybx6jnHV0oMveBu1W+D6rSMEqTHXR7F/WURKOi+w7sisOWxtL1am0M7HO/EmoVtCuasTNLRe+p5RcrabnBHzZ1oWOq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619277; c=relaxed/simple;
	bh=l/FWsI2kCLwgcrbaqEsuvBzXXeNxS5X49Es1ct0jxss=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMZmOoVZemJ9sTXJ/ERl3bpeHyYJN5keYbY1DcIyR1wctnznR+tsZ9M+sos++WbURaY5X7mrx/PfdHR3agn/HhYPcl0TZZ7Q1KgJyK/Q4r5P5AfVWbYNGfNyiiHZqtgxTXgGl3NFTgMNn982llpYXZH7EtWfrdNe60ABLymx/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wQ9a8k3F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O+bUWs9/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t9vhAgL4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EFiC+fU1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wQ9a8k3F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O+bUWs9/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t9vhAgL4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EFiC+fU1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE2B11F461;
	Sat, 10 Oct 2026 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XU9L9TA2PRCt3z0+cWUgNTxYdPkyA00QmHMMU/fPnMw=;
	b=wQ9a8k3F2em4rvEbTheK0Z1/Ewsx9byq+Nr0AF8j7qE4VwWPbxQxmu1o3OvoSAbBHzLoSg
	ClPP+j1mMyblTHU0oNfT3sNryYPNi2vxudJPozuJyzCKkR/3FDR0ZV+uELV7/gxJ/r2isB
	u9ZyFHaCMwxTd0QHoBX/4HLTalXjRkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XU9L9TA2PRCt3z0+cWUgNTxYdPkyA00QmHMMU/fPnMw=;
	b=O+bUWs9/F/tT/T4/Xz0zP/lGLcuiLdYkioTvdQ/E3TYJ69bE9a6zFlLxMNqzj09WnS4WUU
	SM1KbJ5hQK4EiQAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XU9L9TA2PRCt3z0+cWUgNTxYdPkyA00QmHMMU/fPnMw=;
	b=t9vhAgL4uNw5tvmvraEnl5Cio0QOBAh5mglEk5VbK+IWrkPq3TFeF7RoWWpTKV7oNO8xbt
	/8YjpiXS+ylQv/unmIG47b28jaDgxlU/Ople5nBteu1DX15Pz7k7efgMjji1qT7IHJMA0o
	Jr2H+rjwGdgDHug90GhJJyYs2YqsxuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XU9L9TA2PRCt3z0+cWUgNTxYdPkyA00QmHMMU/fPnMw=;
	b=EFiC+fU1YtCLZrrCejb0Co6X54ROXmtAp4zJq5wI/h3LXOTdrO2tectwA8RkAb5CfKF3/1
	43v/agDTVs5J7PBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 743F8133F6;
	Sat, 10 Oct 2026 08:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lA8sE8jwyWreTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 08:01:12 +0000
Date: Sat, 10 Oct 2026 10:01:12 +0200
Message-ID: <87o6d2j86v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: D_de_Vliegh <taoyi.sh.cn@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2
In-Reply-To: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
References: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 09 Oct 2026 23:53:22 +0200,
D_de_Vliegh wrote:
> 
> The MOONDROP DAWN PRO2 (USB ID 35d8:011d) exposes a UAC2 RAW_DATA
> playback altsetting, but ALSA reports it as SPECIAL without the
> DSD_RAW quirk, preventing native DSD playback.
> 
> Add the device to the raw DSD quirk table. With the quirk enabled,
> ALSA exposes DSD_U32_BE and MPD 0.24.4 outputs stereo DSD256 through
> USB altsetting 4 at 352800 frames/s, instead of converting to PCM.
> 
> Tested using snd-usb-audio quirk_flags=35d8:011d:DSD_RAW on
> Linux 7.2.6+deb13-amd64 (Debian 13).
> 
> Assisted-by: LLM
> Signed-off-by: D_de_Vliegh <taoyi.sh.cn@gmail.com>

The Signed-off-by tag is a legal requirement, hence we prefer having a
full real name there.  Could you resubmit with it (also align From tag
with it, too)?


thanks,

Takashi

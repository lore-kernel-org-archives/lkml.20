Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA8C392836;
	Tue, 15 Sep 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470513; cv=none; b=UGPu8ufFeVW2+9+NouyjDb4F2jR2R+62/5L/B0wlU9hKj8vnDtEPWV4UAG9XuOfVzRdR8N57oqXsoKeXIXhiYHf/holkgwOC0thCbBidAeknJ5IXmFpfUUQoXhnbUPxu6pndwo8XsVPBu1M7mr/PiTCq6EiMAhsDNMuM6JdAgUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470513; c=relaxed/simple;
	bh=8QyQ5+bP6owd7vPzlJFIprmAxPRGeZYkO3IKs6ibc0Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHwzFrEM93D6RLniPT9fURCnSJqEouEyacuaI88Zc4TwydWz2q1XRr5Z7YBl1nbg09u/IoidLLjPKCspPPxKmVGyf8Q5X0/6fRQlV3ddBpWwz2lKTgF+uOkoi8UYWf2YQN/uVpdN6V73O/UBHSVp//KI/bKcog224hQWv6BANrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OLW85onP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IUQl1CI+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uwek3Vjh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=83Qwtxun; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OLW85onP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IUQl1CI+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uwek3Vjh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="83Qwtxun"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF5DE219CC;
	Tue, 15 Sep 2026 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789470505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+FN+qlaCMWuGM6tCzcvJE+t7ej3vRjXYqU+o3xsk5I=;
	b=OLW85onPeZdUssHXYgvbDUs0bwhcMUq7vYZIZT4A7YCdn0H/FWC+375A2O864rXOFxTd+K
	dNY6ockOtBd0et0NR9byWZkVUMsglPYkWXFLBN11+0nozAPKAUSNn7tuqpgn8uND5WJUKy
	Uukj32BV3NxYpcwsa939RZdGQ6HbCD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789470505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+FN+qlaCMWuGM6tCzcvJE+t7ej3vRjXYqU+o3xsk5I=;
	b=IUQl1CI+D9XxAibXHyxt3XOMiyYBWQg/+0sdbGZpE0ofHjR8gNmDg8fFyO/5tLur9Wyuv8
	sebMvgY230kp8XBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789470501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+FN+qlaCMWuGM6tCzcvJE+t7ej3vRjXYqU+o3xsk5I=;
	b=uwek3VjhyHCus9OXqBc9Ht1UqkvzIQfwZ56fegeR0/2wHYtc33zk39NUq40Fvh8HMmLhav
	wUOKTmRG/a67tzapZF7xqKG4WkXlxAR5M/kGTX7PRYCPmSstTq3xzItXs6jzFp861ev+c5
	2VnlFzF9Xf0rreHFQNCJbU1IYcjdt8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789470501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+FN+qlaCMWuGM6tCzcvJE+t7ej3vRjXYqU+o3xsk5I=;
	b=83Qwtxunp/PO9zsGxcwGWptZ7jEitFZepLCzRHqok+p3NaE2VW+aoeVsRrc8jxWjQci5Tj
	QNxkUCg4osTUeDCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DEAB136A5;
	Tue, 15 Sep 2026 11:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Uc67ESUnqWphVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Sep 2026 11:08:21 +0000
Date: Tue, 15 Sep 2026 13:08:20 +0200
Message-ID: <87bj9yn55n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
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
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,zipdox.net:email,suse.de:mid]

On Tue, 15 Sep 2026 10:54:00 +0200,
Zipdox wrote:
> 
> Hello,
> 
> The USB Audio Mixer Unit driver (sound/usb/mixer.c) sends audio class
> 1.0 format control messages to devices, regardless of the actual audio
> class version. This means audio class 2.0 devices will receive incorrect
> messages, stall, and cause the driver to error (e.g. alsamixer exits
> with a broken pipe error).

Hmm, for UAC2, UAC_GET_CUR & co isn't passed as is at all, but the
call is translated to UAC2_CS_CUR and UAC2_CS_RANGE accordingly in
get_ctl_value_v2() (that is called from get_ctl_value()
conditionally).  So this translation path was skipped somehow with
your device...?


> This patch implements the GET_CUR, SET_CUR,
> and RANGE control requests for mixer units according to the Audio Class
> 2.0 specification.
> 
> I have one question though, which has to do with the get_cur_mix_raw
> function. It states "channel = 0: master, 1 = first channel", but as far
> as I know the spec doesn't specify a master control for mixer units. I
> implemented it so that channel 0 results the channel 1 value, but maybe
> some other solution is desirable.
> 
> From: Zipdox <zipdox@zipdox.net>
> Date: Tue, 15 Sep 2026 10:12:01 +0200
> Subject: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and
>  RANGE
> 
> Signed-off-by: Zipdox <zipdox@zipdox.net>

Could you try to reformat in a proper patch format?
Also, it looks containing many unnecessary / unrelated changes that
make review more difficult.  Please try to concentrate only on the
change you really need.


thanks,

Takashi

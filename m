Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140F2D23A6;
	Wed, 14 Oct 2026 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958049; cv=none; b=QbZdqJxc11nl8q8IIoqhsAGEFH40Dc9c73CMPHbXbjV8MQGuowFgOaus3CF0/6/GIm6z2Hrizoa88b99RPoP6xQQCYYMltopjmFz29o8QzHKdEH0LrUqH9BNz9127pCABbQNFl3YPXJ89SVlV0+hLuP/7pN6gh5bFTG+f0xQ7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958049; c=relaxed/simple;
	bh=YLuxe4kXKSCF1irC4rSslijh/MQKR/cDFXsNh+caGoQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=blYF3NQwjV3goLsrW+YGaEmSgvk/KSKsQ8j2+m36F+uZSH/JkKTcVkTOmA/xQlSBQUCVZc5wN/dwGdK2I4+bQnLy0FsxXskzPG0LEVB6oUj1fKezzBaEWNTdlZYqppA5OIjN4gxHCPTHMiQ4SO8nTWBxo++2UXRHvj6yDF8YyYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RrQ45K3h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U7dCiAG3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QS7oCabv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SCkpAW7J; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RrQ45K3h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U7dCiAG3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QS7oCabv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SCkpAW7J"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCABC1F7C9;
	Wed, 14 Oct 2026 06:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO7vwAcCk/msCs+3xoHTDahcN9frsbtEyGUGgN1CU9A=;
	b=RrQ45K3heX+NsLIFEq/sWP4w3LkfU5mOVTHIA176fHUe2XZDSnLdt4LE4uS8+2urqskFXJ
	ZxJc7468q7BS9jSyVozD0VrhAsoFbd93SF27I9ILKRzykAED+vONMCmLvNgnYqJ+tzrlc7
	OdilmCFxJ1LFs28aq8Q1tq08sojo/kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO7vwAcCk/msCs+3xoHTDahcN9frsbtEyGUGgN1CU9A=;
	b=U7dCiAG3qsexsYrME/arWBW65CifUaoDmKkQbCW41CmSPk7v6NHrvszSHXDKXR/jwEv+f3
	l4oC413EbWUF9gAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO7vwAcCk/msCs+3xoHTDahcN9frsbtEyGUGgN1CU9A=;
	b=QS7oCabvfX3TyYnDPk3EE+YT56oIbFbF/rfnWprliM2h3RCoBeVnymOYn1t01RC0siPFGI
	rr0zseOkF6bxP7KJ8/OHFyP8bVlXj9JGFKmzT5mQuc0B03TTyweYoJl8iBH7/Ii/0hdjzN
	wbTVhXYADGQ9NLAGzQi7+YuRBCVXwi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XO7vwAcCk/msCs+3xoHTDahcN9frsbtEyGUGgN1CU9A=;
	b=SCkpAW7JZcee/jv7/OpSC67Ybs/fLUV2oOFp7h02FzasAlaxfpZm3nzBhZd4lQgKEQ9sH2
	/QyN9c/PGv9pZUDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 988B71368E;
	Wed, 14 Oct 2026 06:07:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6WucHR0cz2q4HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:07:25 +0000
Date: Wed, 14 Oct 2026 08:07:25 +0200
Message-ID: <87fqy8g6hu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: pcm: Fix driver_tstamp value reporting
In-Reply-To: <20261013164256.4949-1-amade@asmblr.net>
References: <20261013164256.4949-1-amade@asmblr.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 13 Oct 2026 18:42:56 +0200,
Amadeusz S³awiñski wrote:
> 
> In some cases (system32 and compat64) due to incorrect assignment wrong
> value is being reported. Fix it.
> 
> Fixes: 3ddee7f88aaf ("ALSA: Avoid using timespec for struct snd_pcm_status")
> Signed-off-by: Amadeusz S³awiñski <amade@asmblr.net>

Applied to for-next branch.  Thanks.


Takashi

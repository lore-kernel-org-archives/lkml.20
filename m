Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7DD2264D9;
	Mon, 28 Sep 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599311; cv=none; b=CAdlhJbBlqyWktUMuXtj+zsT9Uqq/0bSVu7iUTQvrxTG/IUoohunVr07sO6o/CDSr/gZiLSMh00PfxlTMOCIervSl0c6lTpIkzpCeUEMF9gKlo7BFxoDr5fgQEpkg+dVEg14lg3O/d94tohxX5HcqyI7fARj4pO40FZH1jbIidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599311; c=relaxed/simple;
	bh=nKwRYTf4ZLYZ+b7NzyvEObTFYIoUEGIT9O6G4cFQmc4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6FpYSVQFGJlaiqfjx2kxEgYwNPCWVpQmM5ZmnlVM0jUIpt9LXvgLmyUvzM3R4aL3lwinQ8CFKVE9m3kEliAgppGPmv9eiNukhfcm+lOPnrjM4ZuYq+UGENdml1P7uAkYsGwG3L4gK3eYle+ghqT4UwdKGCbnjR7VfEnbl6bvWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lSN7ZfS0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1OP3vtHG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BYaP0Er0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jmbw2zFs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lSN7ZfS0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1OP3vtHG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BYaP0Er0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jmbw2zFs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4B261FA99;
	Mon, 28 Sep 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gyQXDjjTLuOVa40FexlAa2Yg+sfzT8Wgi8Lf8pKdxYs=;
	b=lSN7ZfS0ePw2fVEYmkZtE4Q4lvpoIjGrDK0SdBdq1ia9Lgx65eP/zXrrBlh6p1dJv2b+ST
	BQ8OC5ObhdOvZp8wspslJc4lrr02YfyEneisZMLfBUt7zrw9VTdDwK85XHjb5do+jZg8Dh
	up0plm7hk3YvPhmoITsIpKp1h98V0fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gyQXDjjTLuOVa40FexlAa2Yg+sfzT8Wgi8Lf8pKdxYs=;
	b=1OP3vtHGmPqCkPHGCJbS6vPM34XOt+Fd5FnXm/+jiK3LUO3qAMpq57eqS0uuJjkvC7XX0J
	5CWqDDOlibieaaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gyQXDjjTLuOVa40FexlAa2Yg+sfzT8Wgi8Lf8pKdxYs=;
	b=BYaP0Er0kD4ncZmxDPOZtCf97yirl6bRr4+A+w+dtQZTeo3FH6bo37PaMX7w0Nk50VeqfO
	LKN0pWEBQd+rHqngnEjrc6ZhcqgJdssAHvb/Bh6Q2E3zSQ6beWSGEq52zGLdPOkqlK5Zw/
	/kp44Tapttpj6NeUEiHngXEhMIAu7eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599299;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gyQXDjjTLuOVa40FexlAa2Yg+sfzT8Wgi8Lf8pKdxYs=;
	b=jmbw2zFsPbjj0QfBo7OuvgmSZ07oHGf0MqwIqzhxP2JtU3Hb2iLl19W8P3fCPqk9d/3Mr8
	oHSTPmU80Ilvl9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8256E133F1;
	Mon, 28 Sep 2026 12:41:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zmhYFoNgumqKCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:41:39 +0000
Date: Mon, 28 Sep 2026 14:41:39 +0200
Message-ID: <878q4l5z0c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bartosz Brom <bartosz.brom06@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eh3174nw
In-Reply-To: <CAN3WbsTf=MYcGC7mCYtAvtgcwXpUQDSG6VRpmVZ-s-erCaP19A@mail.gmail.com>
References: <CAN3WbsTf=MYcGC7mCYtAvtgcwXpUQDSG6VRpmVZ-s-erCaP19A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sat, 19 Sep 2026 13:32:28 +0200,
Bartosz Brom wrote:
> 
> The HP Pavilion 15-eh3174nw with an ALC287 codec requires the
> ALC287_FIXUP_HP_GPIO_LED fixup for its mute LED to work correctly.
> 
> Add subsystem ID 0x103c:0x8bc7 to the quirk table to apply the
> existing fixup.
> 
> Tested on an HP Pavilion 15-eh3174nw; the mute LED now follows the
> speaker mute state.
> 
> Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
> ---
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> index 5127a111c..2956e666e 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7581,6 +7581,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN",
> ALC287_FIXUP_CS35L41_I2C_2),
>         SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt",
> ALC236_FIXUP_HP_15_FD0XXX),
>         SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> +       SND_PCI_QUIRK(0x103c, 0x8bc7, "HP Pavilion 15-eh3174nw",
> ALC287_FIXUP_HP_GPIO_LED),
>         SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx",
> ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),

Unfortunately the patch isn't applicable because your mailer broke the
spaces and the tabs.

Please correct your mailer setup and resubmit (at best with git
send-email).  If you are unsure, it'd be better to try once to send to
yourself and verify that you can apply the patch via git-am correctly
before actually submitting to the upstream.


thanks,

Takashi

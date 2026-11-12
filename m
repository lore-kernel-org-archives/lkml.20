Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489939;
	b=iQ2vI1HWg9NTfnrNMjY79P42Sw1KHls2BFJLTNbuASZKuRk3A1qCv4i4I2m/4lcedt6G
	 2w3c6lfNdOrQJyZYwTEUzJmcSnoSPzejEXLv0DqCo3NBc1LuIik424u1V0HFmlIxwNqFj
	 c3AsM6gx9DDNATYi0lpLp17p332LQyYEWo0QgJtQObYiIR5hQQv5fOpVIAz7/PXuBneVA
	 50sbYSEBC39A2HZVElutmEliFe0tI4Hpf5Qvbsmrhjt4K1vHQV4nPmSEmZvfYYj7O+aBW
	 tSlarOgmmE2R8I7GjzqmPRvthhM18dMNYSQd5P8TbkM0XyQIO2uZeNMc2wfdlTRrPyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489939;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=Jk/i/VroaKwQDJ90liEs00wHp/eY+m3wo5qQ69i8G/U=;
	b=ETo3U5+GGNZEOs3MeO76ABO4Dn7u7HuFoF43cJx7AFPxPS22b1QyvsAaBeK3KhwFsO2b
	 RFpj7Rf/BPILEeaKAes3co4+FCDGPBkr4BAKP1+guU+pvCC63rR0Yvu+ZiDn+V/wt9laL
	 aJ9l7JbH2MAVLdgzlZwfVfeX3WuTd1IsmCv4mawI0EpuO/bBEY/v8nrs61l18j5zlqjqt
	 JacFBBBoQ2idycRXM4Wgj8YXLA8GxOpCHYqZb2un1rcsR9Z3Gd/HUWy5YY9wF7wuv1HE3
	 BRrCBdjSy5CPXmtB13yJ0I3c8fTHfeazBBrpP5HK/1bKLBn2OBJfRIsYZzKHTADVjsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="hPkdsS/M";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8gcRTW2T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="hPkdsS/M";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8gcRTW2T;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A484606A323;
	Thu, 12 Nov 2026 13:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A484606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hPkdsS/M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8gcRTW2T;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hPkdsS/M;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8gcRTW2T
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E7241F444;
	Thu, 12 Nov 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794489937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk/i/VroaKwQDJ90liEs00wHp/eY+m3wo5qQ69i8G/U=;
	b=hPkdsS/MPM60Ne+j+QQSV8MbJpDRjDbE7WwRCOIJX5qbUROmwTAnMb4la6yETewd+i6I6o
	x5FhZJSkOHfqsuSeH6XsOMyLQYpwyfqmY5mhnxMgiEIFzE2VaZID0LX0VVrR4AQWySWcUB
	S5FdTr9wO/aJtc4t7gPs1hHJbjQtKLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794489937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk/i/VroaKwQDJ90liEs00wHp/eY+m3wo5qQ69i8G/U=;
	b=8gcRTW2T0KMFSHjEZSNHpq+kOHMxYpwsndb+lYRr5+jinaJO9n0iNql1/q83RVcXix/4Ap
	t7CGKyi0g9GkDRCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hPkdsS/M";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8gcRTW2T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794489937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk/i/VroaKwQDJ90liEs00wHp/eY+m3wo5qQ69i8G/U=;
	b=hPkdsS/MPM60Ne+j+QQSV8MbJpDRjDbE7WwRCOIJX5qbUROmwTAnMb4la6yETewd+i6I6o
	x5FhZJSkOHfqsuSeH6XsOMyLQYpwyfqmY5mhnxMgiEIFzE2VaZID0LX0VVrR4AQWySWcUB
	S5FdTr9wO/aJtc4t7gPs1hHJbjQtKLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794489937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk/i/VroaKwQDJ90liEs00wHp/eY+m3wo5qQ69i8G/U=;
	b=8gcRTW2T0KMFSHjEZSNHpq+kOHMxYpwsndb+lYRr5+jinaJO9n0iNql1/q83RVcXix/4Ap
	t7CGKyi0g9GkDRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAC68134A0;
	Thu, 12 Nov 2026 13:25:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4Z9wK1C+9WpDfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 13:25:36 +0000
Date: Thu, 12 Nov 2026 14:25:36 +0100
Message-ID: <87cxsarxkf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Update quirk for Acer Predator PHN16-72
In-Reply-To: <20261111172108.30011-1-faiz.faadhillah@gmail.com>
References: <20261111172108.30011-1-faiz.faadhillah@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 2E7241F444

On Wed, 11 Nov 2026 18:21:08 +0100,
Fa-Iz Faadhillah Ibrahim wrote:
> 
> The Acer Predator PHN16-72 (1025:1731) uses the ALC245 codec, but its
> mic-mute LED is not enabled by default. Replace the existing quirk with
> ALC245_FIXUP_ACER_MICMUTE_LED quirk to enable the mic-mute LED chain the
> existing ALC2XX_FIXUP_HEADSET_MIC quirk.
> 
> Fixes: 34e08ad3a8da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN16-72")
> Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>

Applied now.  Thanks.


Takashi

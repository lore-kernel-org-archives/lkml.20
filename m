Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461548;
	b=Yczf2bTro6C3ZqqSOE0HKxWjMmeDXqF0Ic9bJrdYCPi6HId1Otd+KuC5SglsoqPMEgMD
	 Ah1olDrdUIqXSuBV3vAqJ+FNS+HAK1Vook76oCE8fKXSwBr1IZJXm8QDQ7WKQAD976UsZ
	 ITxYEeyIquwXNl9QrG2duYxQjAAW27xxmCPTiBN1k461wB7lgz8MbpsYjBWMe8vp+91D0
	 I8UdG6XiMaTVFhsRwWKjzbeerQeTtD9CwfFurrleTwrNoEML7th/7+UZY/wza3O9xUBbb
	 GJFMAkAS1CJefsO0kzqwp0NdBc81PqRIWPmYgcz0bRTCuiJo95e8b4eGiNG0FG4GByg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461548;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=ca267VqEbYMtuXi2Gi3oswFxvzLMLssQOZvc6YMLV0U=;
	b=ltZaqfpkOWFq6zAH5FfpUmloyrZEsS+V+j/lHw5qudEcLLKaf9VrP1EZz9FtDyiF3vJn
	 H6xAWDeqaHZtjA8rUzjErKM7ngGlEIBlwhwWqK4+QvfblsdaAZdZRwqOe5xmnKTmMhCYg
	 mKSAFvKneJKwlXSTV/v/+ssk7PvLzjWR6iUVy62TgxsVBG8lzgBu/c7PO3TzW4jNPckSc
	 H/XCxeiJYGLQUD5kU97iHjPhysStdhf5hoiJSmS9TiXpXseebxCE510hcRuc9xGceJYF/
	 /Fj6a+3YpZ5847GgpuZrs9Y+0LGfET3srL6jrZ3XJmCMnH27oUY3s/xqsnVKgmxyixA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=COmGo+63;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="fHLY/itc";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=COmGo+63;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="fHLY/itc";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B747606A31A;
	Sat, 31 Oct 2026 15:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B747606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=COmGo+63;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fHLY/itc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=COmGo+63;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fHLY/itc
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 39E251F786;
	Sat, 31 Oct 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ca267VqEbYMtuXi2Gi3oswFxvzLMLssQOZvc6YMLV0U=;
	b=COmGo+63kWRBCrrw70zBH7BFbZTZV0rMXvON9M7SVkqDSryGGpH2vGyzwCaHEVOSArpV7k
	ivC5Ct66Za863tlCsxV8JECrvU9u6T9uzZXCqb5dmgZ9GLHg8/jpSSZWgpjTrCtvXMXK8x
	Q2OheDAQPU21hPymK1F3o/6q3ovc77M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ca267VqEbYMtuXi2Gi3oswFxvzLMLssQOZvc6YMLV0U=;
	b=fHLY/itc0fP9P1j5tFVuaQ7cvDq6iRMy3BkZA2WodrhNj0FpbIJfdw8gPm+y7N+DvAGmog
	6eX8AgDIfexzCdBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=COmGo+63;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="fHLY/itc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ca267VqEbYMtuXi2Gi3oswFxvzLMLssQOZvc6YMLV0U=;
	b=COmGo+63kWRBCrrw70zBH7BFbZTZV0rMXvON9M7SVkqDSryGGpH2vGyzwCaHEVOSArpV7k
	ivC5Ct66Za863tlCsxV8JECrvU9u6T9uzZXCqb5dmgZ9GLHg8/jpSSZWgpjTrCtvXMXK8x
	Q2OheDAQPU21hPymK1F3o/6q3ovc77M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ca267VqEbYMtuXi2Gi3oswFxvzLMLssQOZvc6YMLV0U=;
	b=fHLY/itc0fP9P1j5tFVuaQ7cvDq6iRMy3BkZA2WodrhNj0FpbIJfdw8gPm+y7N+DvAGmog
	6eX8AgDIfexzCdBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E423113432;
	Sat, 31 Oct 2026 15:45:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Vt7sLSkN5mpEHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:45:45 +0000
Date: Sat, 31 Oct 2026 16:45:45 +0100
Message-ID: <875wyhswk6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for HIK camera
In-Reply-To: <20261029032856.7100-1-ki.chiang65@gmail.com>
References: <20261029032856.7100-1-ki.chiang65@gmail.com>
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
X-Rspamd-Queue-Id: 39E251F786
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Thu, 29 Oct 2026 04:28:56 +0100,
Kuangyi Chiang wrote:
> 
> Audio control requests that set the volume sometimes time out on the
> HIK 1080P Camera (2bdf:0280).
> 
> Adding a 1ms delay between control messages avoids the issue. Apply
> QUIRK_FLAG_CTL_MSG_DELAY_1M for this device.
> 
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Applied now.  Thanks.


Takashi

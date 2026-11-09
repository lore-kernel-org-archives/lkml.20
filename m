Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234812;
	b=nmzKB/1wReQIDnH8Dt3Qw+Ac2i6jlM1y2JpCvfevkCb/Slrj4LPKQ9KlzPEthrK5kQV/
	 yF54NGRz/a51pCoV1Uzq7TvIiI1uQ5JGJ46pvJeMQntarJoFKsIjeWfBjV7zjzKw1lyU5
	 QmBVJjs0qE7Y7NaVL9194x5sAwuqikOkjwLHrlVp9702JlGyBnZtpmW8QgYyD4Bs8d1Ih
	 rK0hirmKji1+oFjkuMnkpJ/R83foF9Y3rAXIFOKRRImhQvIbpv9UtKgX13zwLTh1zd1Al
	 +MMiSOdbOLYrQ0UY71tQqrje1bvgRiyhuJCkMzDd0onNG4toZlZxXQGHlw72fnt94SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234812;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=bBGqxjmzqkDB/ZJoDfnvjI+tyW+wpcpZOlixh/Co/1U=;
	b=jI0oBcvI35Gh0uVeLQ7slHkcZrf3TooJwuz3wIIoQATdL68YM4QC+HTKgxbujTdUbJRR
	 I3NDa5bGu7ZXyiFUEQcl+3nyoNYjKSL7xvMCRiPERkW2tWNwFaDoIM81A6sMmYvCuPCR7
	 7XzXmONYZhJ/raAYlv6pX23NttHaTwbY/QA8v7Sge/ZvrGAHHw2/SM/9ubfFcpSRyDjh/
	 7Cegkx/8hqTQlD5XIuzf2v8x7/3te4BgS1lEfgCs2eEEiJooReiiWf9fgyWkmtAHAnpQV
	 WCXt1X2jPfv5DNngFnuFZhRqorACZnFbvSOw4V71jdppK1XjwJVCUa/0qFhtUcPvScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oGZcB9dz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S7JRBsBA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oGZcB9dz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S7JRBsBA;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87879606A321;
	Mon,  9 Nov 2026 14:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87879606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oGZcB9dz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S7JRBsBA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oGZcB9dz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S7JRBsBA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FCDC1F83C;
	Mon,  9 Nov 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794234809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bBGqxjmzqkDB/ZJoDfnvjI+tyW+wpcpZOlixh/Co/1U=;
	b=oGZcB9dzPA3TjkHE9dPh8z6aIB8ZaMAbQIHHM8IY38y2fzV1sbPL28jd0kkDXTj8mX1qq1
	ZvqLbTyXnYb8VzRXhpj90A+IEjYKlyvbMeCjV2s0Fl5NxAKhtCH/EYcwq4OU9djQblJb7N
	tIqOTxFmJiHt51K4HvP6FV117lIN+Qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794234809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bBGqxjmzqkDB/ZJoDfnvjI+tyW+wpcpZOlixh/Co/1U=;
	b=S7JRBsBAHSbwY20tPCu8hV+JJc66Eka3QH8lrxorpSGn6sWIJL07boc3gb43CF5jejFgAO
	HhptU25QBAnvXpBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oGZcB9dz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S7JRBsBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794234809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bBGqxjmzqkDB/ZJoDfnvjI+tyW+wpcpZOlixh/Co/1U=;
	b=oGZcB9dzPA3TjkHE9dPh8z6aIB8ZaMAbQIHHM8IY38y2fzV1sbPL28jd0kkDXTj8mX1qq1
	ZvqLbTyXnYb8VzRXhpj90A+IEjYKlyvbMeCjV2s0Fl5NxAKhtCH/EYcwq4OU9djQblJb7N
	tIqOTxFmJiHt51K4HvP6FV117lIN+Qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794234809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bBGqxjmzqkDB/ZJoDfnvjI+tyW+wpcpZOlixh/Co/1U=;
	b=S7JRBsBAHSbwY20tPCu8hV+JJc66Eka3QH8lrxorpSGn6sWIJL07boc3gb43CF5jejFgAO
	HhptU25QBAnvXpBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 444FE13302;
	Mon,  9 Nov 2026 14:33:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9K89CbnZ8WocbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Nov 2026 14:33:29 +0000
Date: Mon, 09 Nov 2026 15:33:28 +0100
Message-ID: <87qzguulaf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Fix parsing of numeric fields
In-Reply-To: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
References: <87zevjwmrf.wl-tiwai@suse.de>
	<20261108124832.3058-1-sreekuttan2156239@gmail.com>
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
X-Rspamd-Queue-Id: 8FCDC1F83C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Sun, 08 Nov 2026 13:48:32 +0100,
Sreeraj S Kurup wrote:
> 
> parse_uint() passes the remaining input string to kstrtoull().
> 
> When the input contains comma-separated fields, the string
> contains both the numeric value and the following fields.
> 
> For example, with:
> 
> device=1,subdevice=0,name=Master
> 
> kstrtoull() receives "1,subdevice=0,name=Master" and fails
> to parse the numeric value.
> 
> Stop parsing at the next comma and pass only the numeric
> field to kstrtouint().
> 
> This allows numeric fields to be parsed correctly in
> comma-separated input.
> 
> Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
> v3:
>  - No code changes. Retain the v2 implementation after
>    comparing the alternative approaches.
> v2:
>  - Add the Fixes trailer.

I think a bit more easier to understand the code flow would to make
each parse_*() function returning the substring end position, instead
of the next substring.  (BTW, this fits more with the function name
find_eos(). too).

The main loop in set_led_id() already treats it, 

	while (*s) {
		os = s;	
		....
		if (*s == ',')
			s++;
		if (s == os)
			break;
	}

Both parse_uint() and parse_iface() return find_eos() value as is.
parse_string() has an extra increment for the next substring, so we
just need to drop it.

That is, what we need to change is something like:

--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -451,22 +451,24 @@ static const struct attribute_group *snd_ctl_led_dev_attr_groups[] = {
 	NULL,
 };
 
+/* return the end of substring pointing to either comma or NUL */
 static char *find_eos(char *s)
 {
 	while (*s && *s != ',')
 		s++;
-	if (*s)
-		s++;
 	return s;
 }
 
 static char *parse_uint(char *s, unsigned int *val)
 {
-	unsigned long long res;
-	if (kstrtoull(s, 10, &res))
-		res = 0;
-	*val = res;
-	return find_eos(s);
+	char *end = find_eos(s);
+	char delimiter = *end;
+
+	*end = '\0';
+	if (kstrtouint(s, 10, val))
+		*val = 0;
+	*end = delimiter;
+	return end;
 }
 
 static char *parse_string(char *s, char *val, size_t val_size)
@@ -491,8 +493,6 @@ static char *parse_string(char *s, char *val, size_t val_size)
 		}
 	}
 	*val = '\0';
-	if (*s)
-		s++;
 	return s;
 }
 

thanks,

Takashi

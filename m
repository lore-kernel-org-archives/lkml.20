Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865017;
	b=0ScsGUOD06Y8yCXuhSXDFH4n2f3rFZlLPjBjUfDP3qGspXgOmePvIz+xuAeSsJ7AMtcU
	 BVTe9bs266qh4ff44k7LkD905qxZVN6sxN3miffE7RuQV6PSO/mYfSWN5Gu9EgExtA1hR
	 ACvKfcurU3H46/eWfe9AaJ5GIM30WGN94lo0tCKEqU4WSXt3XOHVyha5nq0PFHdD2dunb
	 2g4MF5V+Jclp+w8I45Kwwj2NyY7X5/NFE6loAJ1622xoz2s7Ne1C/kd3IhxcOes/2Yl00
	 393cc5zEPVrkuPqjWOYliTMBUThEeNv1oXNlV9Sdc+5W0CKxlnmv1G00ck/ppskRZIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865017;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=+QDtnKQt6ltOg2kXddxF4StBdIhZXBVMFf9sIa9Sxn4=;
	b=dl6jw4m+qhLHg7uiuBPwP7LzWuWupfpuTS7yt5QGs+H2YZMh18i6aJTsbjUzDP2j6tRo
	 IhpwZwJIx1Pp4bmYDI3ekVBTGSOwz1GGBbSZi2Np44zDNSxKjkAiwphkxdjvIGD0IaLvi
	 Uiv7B9Csc15YSW3Up3OgsYdEpgWLya1FxYNDE1yc2Fx2ING+8NHlYmbIs7s3+Ot7PpFdr
	 D+FoeX0VnzDLgnfvHJPNPlnTchHPXe+T4ZY4iUxWKeEF+ZAUqIXfwMuozDesey7JcLHp7
	 k2uhHApt6IoymVLrzkvwvXcTSzo6pDx3uApLnFBN6qm3nUw4URAWxVLVmJaB47OoDVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eWbJ81MB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=urwHM39M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tjllKrnG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+bbK7ZYi;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFB606A31B;
	Thu,  5 Nov 2026 07:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CFB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eWbJ81MB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=urwHM39M;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tjllKrnG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+bbK7ZYi
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B7021F45F;
	Thu,  5 Nov 2026 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793865015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QDtnKQt6ltOg2kXddxF4StBdIhZXBVMFf9sIa9Sxn4=;
	b=eWbJ81MBy5AHCbqoy3Q4ITBNoVFo5qoII678ph3+0+NpHUPI09uaFLWe/RgIQrdpz5IZZD
	2QnsRPIT5zFs3v2kFhiy/dTfUVPrVPAeZtUJndQ91rHtfMT1FHt+cndQMY4wHpAcdnKnfB
	rWaqwuHAvrkAC6gQvdVG83qFTv3TaOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793865015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QDtnKQt6ltOg2kXddxF4StBdIhZXBVMFf9sIa9Sxn4=;
	b=urwHM39My2GviJxSBkaCCJq4o0d+fIkWSiOEuz9tDaPHWubC318Co2tXF5gUL45rdR+Tod
	KQ1DvYapKGlBphDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tjllKrnG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+bbK7ZYi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793865014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QDtnKQt6ltOg2kXddxF4StBdIhZXBVMFf9sIa9Sxn4=;
	b=tjllKrnGqiuOpuzXMnC1LAqDkrHHS66n28nJ//DOBuUV/fTRkQm94JTmgo79QkvBbuJj3s
	08PlX/ZkDx9+BZlUWmPSvkX3Yqj7As4luHv9iD9EVu6FQ9G2XIeAjAXyyz5F12kQHfdtu4
	MQZXrfrdddQN1waRoL0tb7MIX/sQ6Gk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793865014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QDtnKQt6ltOg2kXddxF4StBdIhZXBVMFf9sIa9Sxn4=;
	b=+bbK7ZYi4aPg/RJuPKnbGiD6GuHvQmF8U6qBqXfLUti52XDx4jZPW9LjW3++zq+xMKA2zQ
	R9NDWMRlCOetGeAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1496134F4;
	Thu,  5 Nov 2026 07:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4BTRMTU17GriBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 07:50:13 +0000
Date: Thu, 05 Nov 2026 08:50:13 +0100
Message-ID: <871p8zu37u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	robin.traftec@gmail.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l41: Add support for HP OmniBook 7 Laptop 16-ay0xxx
In-Reply-To: <20261105014535.47907-1-zhangheng@kylinos.cn>
References: <20261105014535.47907-1-zhangheng@kylinos.cn>
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
X-Rspamd-Queue-Id: 4B7021F45F
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,vger.kernel.org,opensource.cirrus.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Thu, 05 Nov 2026 02:45:35 +0100,
Zhang Heng wrote:
> 
> Add a configuration entry for the HP OmniBook 7 Laptop 16-ay0xxx,
> which uses the HDA subsystem ID 103C8E13.
> 
> The laptop has a malformed _DSD which causes the cirrus,dev-index
> property to fail to parse, so it needs to be supported using the
> configuration table.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222202
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi

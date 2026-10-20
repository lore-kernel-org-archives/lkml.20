Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485691;
	b=g3NubTLuzSumirVwHN8ebe87pYb3vlcGTYgvrEwK9oUkf4fvU/6vxUsE3H6kP/M1C28I
	 Ta1GKw4npbLfRMbsDZKQwcg2stE1at+nyKcu0zQb2SOVaec8dS/l+sTU+MmxKUoNphy63
	 r2pFYzHjiU4EPnD/SiPZY9G7/9LhZ6PAgY5tui45c/+5tB5BJXA3BG7AcsDUqofyMKMyb
	 +XalGI0Edzzm1llAkSQ0A8uxtKO5aw6qec3g/dtUeFcm0GR8dBcioFqWOBZYC0NuJGRu9
	 YSikYs4nGosufGtx4xOBneJws/K7THvDNi6nGFLOS1msGORlQU2/mz7Njbt2qnKOxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485691;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spamd-Result;
	bh=6bn4M6YeN2g8PEYJ8AzJWKAPmNUUfpbov7oAzbUB368=;
	b=VPL+mGL2KmHrIyfgVlBTbvPxb/TFAht1F/ptiLnhl3d8xmTCN+QKRQR5MW34tCkLwFOL
	 A+iqiDKIjWcDyYK+s3pRaLseT7qlxumfYq6kMZG6AHe9dl6ZInMlRSm2UCdwwBTWQXE58
	 gxo+w7Rm7GMU1oT+8IqC3qJJ5dBjr43rzpKQnt09nTqkNLw0ASLsXl+KKBSoZWs/vszFw
	 hz4knj55wiUXFAjsvVS+VVnk9gk+JPqIw81ARNcgHtHv5PSMA8mp4V/qycnwq655mAVI/
	 4xD6y09rBxm4MfgDH21E6uHMDgkiZ7EmYXU9aciNapVgxG2UhfrKALZhNi08DdqrQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEI5579Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gZpLRX64;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEI5579Q;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gZpLRX64;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF2606A31E;
	Tue, 20 Oct 2026 08:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEI5579Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gZpLRX64;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEI5579Q;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gZpLRX64
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA47121D81;
	Tue, 20 Oct 2026 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792485688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bn4M6YeN2g8PEYJ8AzJWKAPmNUUfpbov7oAzbUB368=;
	b=XEI5579QHP6V72aSSg8VC/OwOoN5B6oREWReR7r9zMq2hj5NghkhTloZbeQV4s4Qp1rbN7
	cs+S3ETy5Q2zqKrnk7aOpcb0PeTalQ23uHsRmeCydsfxGy4iw32lq27E2o30sZDq0dcUVr
	MMVqBTP3SfYhaV9kXhbM1FFPajdTiNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792485688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bn4M6YeN2g8PEYJ8AzJWKAPmNUUfpbov7oAzbUB368=;
	b=gZpLRX64IetHgnxPwbXTkTZ/0n9RMj5co4d58vXXsJhaFmlQ9f8d7gYAIP467m5JsmlKhC
	8tFMijQUI30qlNCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792485688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bn4M6YeN2g8PEYJ8AzJWKAPmNUUfpbov7oAzbUB368=;
	b=XEI5579QHP6V72aSSg8VC/OwOoN5B6oREWReR7r9zMq2hj5NghkhTloZbeQV4s4Qp1rbN7
	cs+S3ETy5Q2zqKrnk7aOpcb0PeTalQ23uHsRmeCydsfxGy4iw32lq27E2o30sZDq0dcUVr
	MMVqBTP3SfYhaV9kXhbM1FFPajdTiNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792485688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bn4M6YeN2g8PEYJ8AzJWKAPmNUUfpbov7oAzbUB368=;
	b=gZpLRX64IetHgnxPwbXTkTZ/0n9RMj5co4d58vXXsJhaFmlQ9f8d7gYAIP467m5JsmlKhC
	8tFMijQUI30qlNCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66F78136CC;
	Tue, 20 Oct 2026 08:41:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y78lEjgp12prSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 08:41:28 +0000
Date: Tue, 20 Oct 2026 10:41:27 +0200
Message-ID: <87ecdkix1k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: webgeek1234@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/hdmi: Enable HBR capability
In-Reply-To: <20261020-tegra-hda-hbr-v2-1-6968017f585b@gmail.com>
References: <20261020-tegra-hda-hbr-v2-1-6968017f585b@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, 20 Oct 2026 10:18:14 +0200,
Aaron Kling via B4 Relay wrote:
> 
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Tegra HDA does not set the HBR capability bit, however every SoC since
> Tegra114 does support HBR. Override the hbr setup function for these
> SoCs to unconditionally enable the feature. Since Tegra30 does not
> support HBR, this override will not be applied.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied now.  Thanks.


Takashi

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891330;
	b=iANAYHMRnhUlIvnfabDRXBSOmWTnYDlzTQF5cq8xlXeSElv4YfsXL70kNQObk1isbmHW
	 wZA+6cHomJwEmVQUEmiP9YhdEb+FOk4N+a32w4T+JLaG9IA3H5dVdK6Syxjo+Z2dHs+En
	 M3n4h9xMJvX6rZKtNQ8f/4NJbL8S1O3tdrpJfDZ80gGTqvUaFvWJ3heRTFuFlEKnZKkQS
	 L0lKba0Y6PGt4NuCC1b3+F6Lgsbd1HerX/OF8s8U/Q3xk56V1v4dyRvDSoxj1reEK6/h1
	 dTEBTgtmji+0VQfblzAEdWqobZbqBAh4FTpwi1P7qwjubhuxgPjr44cJf20Kb/d6JXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891330;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=7eFf2CITff9Eksq3nGVZMh84m3mWYD0BE0cCF//dr2Y=;
	b=BpDf5p3rCLuzCR4XZqKim5Sd/KznxkX1cYN5yF4dfXLAoxnExUA1me6SN4ojLoU5maLs
	 UtIM/jvIqrjFNxFdKDQ4EnD5trUrmWKGlf0npbRKGrIlnz2u85uQcvIhwbviiy/NjRIin
	 6isozEFVt/GMocT6OB/9Jx2KX1i9fUloAseuHQHn82brocpj1zhMkEmZwanrTe6Cx9Bpq
	 dH32W6LoSQY7jJJar3DjWD9QKRNx/GYbR3UPtaed5EVQOiDmvELs7mhjbU0v4fqchM3Cy
	 vWU6nFfH9iUTLOcOXWZ5Lx5GCIdN3sTJzeuhiCSUkYZ/3aOI9fn0JC2RHVU3Cb6YR/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CbrBS8EM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhj4RRcI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CbrBS8EM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhj4RRcI;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F81606A31B;
	Thu,  5 Nov 2026 15:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F81606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CbrBS8EM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhj4RRcI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CbrBS8EM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mhj4RRcI
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9D4A41F787;
	Thu,  5 Nov 2026 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793891328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7eFf2CITff9Eksq3nGVZMh84m3mWYD0BE0cCF//dr2Y=;
	b=CbrBS8EMjf3vIFjGjPr7O0PF95UQHh8JWj37c4KRmdchFolTFD+WRFx6LaUMuVueUtSOUt
	hosjPAwPNhVZztpX9L6XaEwBMbQ3rYyICyc2COtunGEcvLDrRFZJmRb8nM620gSnSDjzcq
	IyFQuKClwd+6n8ciyHCmtWSm0A3wRhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793891328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7eFf2CITff9Eksq3nGVZMh84m3mWYD0BE0cCF//dr2Y=;
	b=mhj4RRcIXGY8daUtunDdLnFOg6Wgle80WgSBQB2OPIiM+2LfBYgb1h274OETxHFhsjqWz8
	sZAgT3qdbIKibKDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793891328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7eFf2CITff9Eksq3nGVZMh84m3mWYD0BE0cCF//dr2Y=;
	b=CbrBS8EMjf3vIFjGjPr7O0PF95UQHh8JWj37c4KRmdchFolTFD+WRFx6LaUMuVueUtSOUt
	hosjPAwPNhVZztpX9L6XaEwBMbQ3rYyICyc2COtunGEcvLDrRFZJmRb8nM620gSnSDjzcq
	IyFQuKClwd+6n8ciyHCmtWSm0A3wRhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793891328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7eFf2CITff9Eksq3nGVZMh84m3mWYD0BE0cCF//dr2Y=;
	b=mhj4RRcIXGY8daUtunDdLnFOg6Wgle80WgSBQB2OPIiM+2LfBYgb1h274OETxHFhsjqWz8
	sZAgT3qdbIKibKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55764133F6;
	Thu,  5 Nov 2026 15:08:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P+c0CwCc7GprUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 15:08:48 +0000
Date: Thu, 05 Nov 2026 16:08:47 +0100
Message-ID: <8733tfs4cg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: linear: Check frame count for all channels
In-Reply-To: <20261105142226.3079-1-sreekuttan2156239@gmail.com>
References: <20261105142226.3079-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 05 Nov 2026 15:22:26 +0100,
Sreeraj S Kurup wrote:
> 
> linear_transfer() checks the available frame count only for
> the first destination channel.
> 
> Check the available frame count of all source and destination
> channels before converting samples.
> 
> Use the smallest available frame count to make sure that
> conversion does not read or write beyond the channel buffers.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Well, the number of the processed frames must be identical for all
channels.  So this is superfluous.

Or, do you see any real case hitting this?


thanks,

Takashi

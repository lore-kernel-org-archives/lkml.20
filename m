Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74163783D5;
	Wed, 14 Oct 2026 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791957328; cv=none; b=ULP0hW9EIxcQHU6n5sJfMa++Xh2T0djeZbOl3o4oT+NNi9rCHx7cu2q3VT6yyRetNDI6qF6xNVn5jQszcWkOWRMcO5XbH0uzPet7VfptrW6ie/Jw90b77AXkxDvf1z/maadaq6H9Z22TN3EmTGb2gYOZUJ4414SomBKhBO66Fow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791957328; c=relaxed/simple;
	bh=xMusnSmq7X17FmO88nGfTxeBvxXs0FBIyvelidrhwwI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XopTn6Bjn2yUZ5KtSFj7e6thED6+AiLGL/40IZubgbO1rjq43svFN3FAZDOF5N6UmQXB3gSV9TMVddKN5NFjYkBkJlCSsQk52GGRiww7iKZ5KUj4rXhEn5pwpf+dIjRdYJv2WESaPiXhS68GAq0koQPnP/3yWouSWubBqLMgndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y0EWY5an; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iLYpj8rt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FgxF3GWk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s58Obshm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y0EWY5an";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iLYpj8rt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FgxF3GWk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s58Obshm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAF2421E6C;
	Wed, 14 Oct 2026 05:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791957325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFYtpA/Cs8aARD1jOtOIy8DQlx2RowLARWyS7E4L59A=;
	b=Y0EWY5anBrqxX2+gGjXSrR01bhCfFcXK1QFGbdpBLfdrQ3YdpYVJ6ZcVPWmjZiraEZVEOp
	TMHDZ4YJ2uKjiKlXFiCAhoPkWmAbF5NHqh1I1b24IEaz3sd1K6rHvpARdl5aAEN6Y8AvIu
	LRN9yMBcGDQdykpL+HdbfYek3xvaGfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791957325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFYtpA/Cs8aARD1jOtOIy8DQlx2RowLARWyS7E4L59A=;
	b=iLYpj8rtnWY+rrM5HhVrHy3ePreybAZdAuDPaEtvzEs7Uw/qcQq8JxTz+RXVIYiUwFqAT1
	xPfXPkwp4aB8jJBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791957324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFYtpA/Cs8aARD1jOtOIy8DQlx2RowLARWyS7E4L59A=;
	b=FgxF3GWkGhm28TiC8nTeytz8xCdSM1GuKYLFJc4cNLG2b98WBQSzIpNcodGsSeWyjF5nlQ
	PWf6901Wh3uonh7Dd3Z5+NZlafy2J7aKxAOU7Wj+Nfb1AI07FM9lBsqCFYGQSYxuuB0+LN
	+w2YLLW97zSvXpo64cvH0iaOkd3v1mQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791957324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFYtpA/Cs8aARD1jOtOIy8DQlx2RowLARWyS7E4L59A=;
	b=s58ObshmHr+9AlQY5w+jwo+nikbvBMHeRMnZcM0SP5bmfrf/reYBNW+0crMz+6bcn1FQRu
	CB3XHZRfPci8jUAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49F1E1368E;
	Wed, 14 Oct 2026 05:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qUYTCEwZz2r2EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 05:55:24 +0000
Date: Wed, 14 Oct 2026 07:55:23 +0200
Message-ID: <87jynkg71w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Oster <philippdev5396@outlook.de>,
	Georg Wenzel <g.wenzel@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/2] ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data
In-Reply-To: <cover.1791895478.git.soyer@irl.hu>
References: <cover.1791895478.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.de];
	FREEMAIL_CC(0.00)[ti.com,perex.cz,suse.com,outlook.de,gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, 13 Oct 2026 15:02:19 +0200,
Gergo Koteles wrote:
> 
> Hi,
> 
> Georg Wenzel experienced a regession with TAS2563 amplifiers. His laptop 
> lacks proper calibration data, and due to a bug, the driver failed to 
> apply them in the v6.16.x. That's why they worked.
> 
> The amplifiers operate even without calibration data, so the calibration 
> setup can be skipped if the data is invalid.
> 
> The first patch simplifies error paths in the tas2563_save_calibration() 
> function.
> 
> The second patch skips the zero UEFI calibration data as it is not 
> necessary to apply.
> 
> The previous patch for this problem
> 3bc4fc135ec7 ("ALSA: hda/tas2781: Enable bass speakers support")
> should be removed/reverted.
> 
> Gergo Koteles (2):
>   ALSA: hda/tas2781: Assign total_sz at the end of the function
>   ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data

Applied with the revert of the previous fix to for-next branch now.


thanks,

Takashi

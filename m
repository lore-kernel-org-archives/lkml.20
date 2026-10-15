Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA14718DE;
	Thu, 15 Oct 2026 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048809; cv=none; b=STMr1dR+xHxN9SntlYnKVGHMBTqloChLFB/hoClKEnRxa26N+lNoF5cBo8np2dCBvF1sMsFlysEvoPDMdAhVdUWN4LHjhdII0zR58UMklCAej8ZzGdUaMujLZNaEpuimGErn0+uaVIwZ81DmSjEU5ByfP++U/8kE3fHSzMb+XzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048809; c=relaxed/simple;
	bh=7cPgA+U7OYo29MasG8HnapJMsHYt/eD82KhNdGVMocI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIdghCM6N97TXtuQoLyhmrnpfPtwiPqlwl7AzWaHF5+OEDFqZ7PN65jTuabC/SV8WnLPh5Relm1F46uit7F99lhGnCJAUaXC9dkkDTipgS3mcNiMPc6+RAKa0LZw4Q3xhZk83Tl44rRqtNtDVkeJs09C0DHNu+o5njJrt4B4UQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vsWiNWII; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bqaxEF7c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DkpP4XZL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vAc2vmHg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vsWiNWII";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bqaxEF7c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DkpP4XZL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vAc2vmHg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15F8E22345;
	Thu, 15 Oct 2026 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792048796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBWP4mmvvDFg2BATo4ww7p6L/O3ZN/KTcIIvk3tuQSk=;
	b=vsWiNWIIil0cYMnwJgJFk1U6o8n+7Dpzbh1js5oM8tVcpsOmqG13gu+36M5jlCsVO//eNO
	5g9TRmyfvOHmMEK/Ofv7fk2z4l5vPwKgNf0F1OGRPLYLX9XOX3LyUImu41oCgG6m7LVDhe
	z1JpZftxB7IpgJNCQtu4bx8zNVHLJlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792048796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBWP4mmvvDFg2BATo4ww7p6L/O3ZN/KTcIIvk3tuQSk=;
	b=bqaxEF7ciT7US0eiqwT0oMAJq1F+b4OxlpAJLcpj2MR+66tguw1Q/YWc9YekJKcgtJ95fq
	d+a9ysgg4jVn0mDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792048795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBWP4mmvvDFg2BATo4ww7p6L/O3ZN/KTcIIvk3tuQSk=;
	b=DkpP4XZLbfgVHlSJJCBHP38vCYxme53fHywbUkssrXBavyIHFYzhQZyDV8nIDMLlr4IdhM
	yWW29LQObFkWQMSSHNPQdBBlHRbaTZzfoo+Y+vwFxG26qVEhWb5Z6ih5L2yzjSYpU3XZLl
	mJGsDr1f3+4YZieju+wJKpAeOBs6XCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792048795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBWP4mmvvDFg2BATo4ww7p6L/O3ZN/KTcIIvk3tuQSk=;
	b=vAc2vmHgjBEO6vRiF/KpXqeLn+07dg/ihUIzSAOOJPuLxSg0VBOq40OuGhnAvV7b2L9y3r
	tzVtttNPAGbu65BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCEB41373D;
	Thu, 15 Oct 2026 07:19:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m/YWJJp+0GokOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 07:19:54 +0000
Date: Thu, 15 Oct 2026 09:19:54 +0200
Message-ID: <87pkxbmnvp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Limit Line In boost and ADC gain on DECENTA MATX03
In-Reply-To: <20261015021210.106392-1-wangdich9700@163.com>
References: <20261015021210.106392-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 15 Oct 2026 04:12:10 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The DECENTA MATX03 (ALC897, SSID 1e0b:1297) exposes a high gain
> range on both the Line In pin boost and the ADC input amp. Pin 0x1a
> reports nsteps=0x03 with stepsize=0x27, that is 0, 9.75, 19.5 and
> 29.25 dB. ADC 0x08 reports nsteps=0x3f with stepsize=0x02, that is
> 0 to 31.5 dB in 0.5 dB steps, and defaults to 0x3f (maximum). The
> combined 60.75 dB analogue cascade overloads the front-end when the
> source level is high, producing audible noise during Line In
> monitoring.
> 
> Add a new fixup alc897_fixup_limit_linein_boost that overrides the
> amp capabilities of pin 0x1a to nsteps=1 (max ~11.75 dB) and ADC
> 0x08 to nsteps=1 (max ~0.5 dB). The total gain drops from 60.75 dB
> to ~12.25 dB, eliminating the clipping.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi

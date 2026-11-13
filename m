Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556458;
	b=3OCLEh6lG4WGhOqjPkCPQrAxMVkf4iyGb395r7fJNhTUUgujebrJaILDqa/pBA/lDr0B
	 XbcLoaGmYS3DLloorfdbOUol1m9VKgxqgCytalPlCKO083Fh2HqiyFfXRoGQPVb6/T40k
	 Ogp1CET6pC6jEAuOsPJVaggn4aERxOrMjxIKhCUNLHDk2L3cl84E/X5Lho/sFHcOiwcff
	 9bLHPP58LYuSLXQHUGS7xTdsSrl1r4/OLBtRKkqmd5pmmxclGK+u7cOmQ75dK80IwPZNk
	 SGQVDLpmWDM2fPX6ExQDMgirDmFAHvfXt5w7TLZ6k1mGOi8V0/n6M3uVr6kZIj6vddA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556458;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=dG7DDofubIl/Um35C3xhYzab2ko5VA5wYn6OtnDjOYA=;
	b=D9V39TvZObsU3fNf6ca8F/B5trsepS6zIqTzPjPU4u/ofmsKmUzuBUVk8TwTKmKz+n5K
	 jXIV5MrNrWR/uBUXDOwbVJDnYlA03/BxO16FkWm1zq0r2h3DRQgCcKj+7IE/KZfXIEKBZ
	 B9S8jAxXx4BEFypdm5YoVPKAv98cs7upG7VjRtKhm8ztUMh+wzjIuWDShtSI8+QO4NWtM
	 0iFqBRq0n1e295dJp80//AZmtIvz7ype/lQKHb4FZmWvUV5wAKHk5V2NjNoJXMaQfh4Is
	 RyljLq2LQjCoc9KhVTkkU7J52f2xTmiohfXijvCYvqqPeSaqcvhjLwxQfo5F3EoYe6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kRd7dtVW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ocxDpiMU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SjoRv3M1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hE0rU43X;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95374606A33E;
	Fri, 13 Nov 2026 07:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95374606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kRd7dtVW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ocxDpiMU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SjoRv3M1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hE0rU43X
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 83AC91F769;
	Fri, 13 Nov 2026 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794556455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dG7DDofubIl/Um35C3xhYzab2ko5VA5wYn6OtnDjOYA=;
	b=kRd7dtVWQEd4F/l8K7Z68dpzgaNHOe2GaxNoVwKdZGUUBNlTyUJ8eXJR9HVM4NfRWvrz4/
	dle72arPZNcW0jEObpZIbH5rXDm9bitOdTFu2EQbX9Hbg2rFJAgq2Bt7AYGNfkEX7vi+T6
	6A5BGBbatm104OzisgOwV5pHub/y1Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794556455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dG7DDofubIl/Um35C3xhYzab2ko5VA5wYn6OtnDjOYA=;
	b=ocxDpiMUPsTeaTbFhDXdMJA4CT16CFoAvoDEVXzRWtLVjmtyrn0iXPe0SI9WfWxZq/zr1z
	gTjNFS4NUGOMKsBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794556454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dG7DDofubIl/Um35C3xhYzab2ko5VA5wYn6OtnDjOYA=;
	b=SjoRv3M1+YKBzVouP3ynq5YKTNRZmb2Rld9+dvM5UyoqD6pF/ALXfHyoGswcL8aibUjbf3
	jH9qeUXyPDf3QLeWb0fcbjEVQCdSRwzPk67wUCuPhLi9SCCUU4015ElG3mZI6yYKH39JmL
	IKehIBsoYQ4tnHbBz0l6uoZu7LnIa54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794556454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dG7DDofubIl/Um35C3xhYzab2ko5VA5wYn6OtnDjOYA=;
	b=hE0rU43X15MS4ub+qy0CzFbFzRFeFYnkyQVyzoaixHTusnIU0eK9A9xa/S5sYv3i9BmPL/
	rJfPls0ciKi+i+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C20C1344A;
	Fri, 13 Nov 2026 07:54:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ntf+BCbC9mp+XgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Nov 2026 07:54:14 +0000
Date: Fri, 13 Nov 2026 08:54:13 +0100
Message-ID: <87bj7tqi8q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: Gentle Reminder: Pending Patch Review
In-Reply-To: <20261113070339.2750-1-sreekuttan2156239@gmail.com>
References: <20261113070339.2750-1-sreekuttan2156239@gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 13 Nov 2026 08:03:39 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> I noticed that my other patch has been received, but this patch is still pending review.
> 
> Patch: https://lore.kernel.org/lkml/20261109092249.3559-1-sreekuttan2156239@gmail.com/
> 
> Could you please take a look when you get a chance?

This one is postponed because procfs is being largely refactored
recently in a large series.  Let's try later once after the
refactoring is done.


Takashi

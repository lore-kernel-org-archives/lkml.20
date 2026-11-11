Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387416;
	b=yPtUc6qq4KmjBbtxNrlqU5MtPXsBFTkMutoLZ85cuwJl/a2s2ySiC7gn5a3Df8YQV8dB
	 PgnKkm3iUkgzoZQNp1s29JICDodkrbyIsmPj5NrY3cSrOXkVm5paW3axFK34VxI2VoSod
	 hs2zFRfChTpNLLiymnWAMEEyhoMSEeQam2n5hTX2O1Pem4RheLoQhDtvHmWncllcrRz4W
	 8BRhUzp8m2y06bCvzZCnNyg2qrU17dEbekfL1lrJoKw+POHnHSHb6yLtR9Ln997gJPw3c
	 kZ2zDkbdlxeoEFCzkK00NZMn5fVl33doul494nkDbaJx/6a2nwE84r6C95iZdWszKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387416;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=iTH2PGuf8s6V32nzIWF9ox5EmLsqUvV2utYTKjzqkvM=;
	b=mxDH7iKXQMJcaVA/ibbVlVayMgzhTHmvYxM2hvDRAmII2DCi1cJ3iTAbU8B8bzA8CaLq
	 /IlcBzSqlWdLydN7OS/SWQmDISB1evGaGKuba8MORKhgwTRlkdKdkpm2jnJyI+sVvR2ca
	 lWz6MXBFNJMZlBf0OZvlB0t9l3Kb/QkEy5giVbJ1Ld3VsfUV8VRTsfFSJrYgcMb8yE2qV
	 3jz/7bQZlxuNCddXFo9KIfnO2JrYAYh/K93+y1Prn2C1UWIhu4sbWrIZkgsFIpfsoUZ2D
	 jUQI0tFWWa29lG0Qq+ELJbeY8kVUc5As2GZnzC4A459+4TbKHv4mtcYcDoCj511X30Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TrdxllSs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pc0qdu4B;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TrdxllSs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pc0qdu4B;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DA9606A321;
	Wed, 11 Nov 2026 08:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TrdxllSs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pc0qdu4B;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TrdxllSs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pc0qdu4B
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7068221EF9;
	Wed, 11 Nov 2026 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794387414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTH2PGuf8s6V32nzIWF9ox5EmLsqUvV2utYTKjzqkvM=;
	b=TrdxllSsGc1EnpOTMyWud05vei+GCK2t2KSnCPPOPfIysR+RtzEeWjewbxK0ZxPTkUqwD7
	eZbgXosgTfmYI0jHG1T/FVnuFMZSgnPF70Ym1I9oivLRRtC4sn3Bud41Ys5mMEjQq6M9Eq
	4zRJr6w0ukQSZKxPm0YxCFg8uYZCmnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794387414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTH2PGuf8s6V32nzIWF9ox5EmLsqUvV2utYTKjzqkvM=;
	b=pc0qdu4BZHF7HH5sZYc8RxFZZgNWNoZd9CR54IO61oTwG9JvY4VGHyA+Hz9//Ts2sB1vxh
	od2ZGTZ13L4oxVAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794387414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTH2PGuf8s6V32nzIWF9ox5EmLsqUvV2utYTKjzqkvM=;
	b=TrdxllSsGc1EnpOTMyWud05vei+GCK2t2KSnCPPOPfIysR+RtzEeWjewbxK0ZxPTkUqwD7
	eZbgXosgTfmYI0jHG1T/FVnuFMZSgnPF70Ym1I9oivLRRtC4sn3Bud41Ys5mMEjQq6M9Eq
	4zRJr6w0ukQSZKxPm0YxCFg8uYZCmnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794387414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTH2PGuf8s6V32nzIWF9ox5EmLsqUvV2utYTKjzqkvM=;
	b=pc0qdu4BZHF7HH5sZYc8RxFZZgNWNoZd9CR54IO61oTwG9JvY4VGHyA+Hz9//Ts2sB1vxh
	od2ZGTZ13L4oxVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 114081339F;
	Wed, 11 Nov 2026 08:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jJ+0NtUt9GpNMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Nov 2026 08:56:54 +0000
Date: Wed, 11 Nov 2026 09:56:53 +0100
Message-ID: <87ld6zu4oa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Validate element info in compat ioctl
In-Reply-To: <20261110160510.2697-1-sreekuttan2156239@gmail.com>
References: <87y0b1ug39.wl-tiwai@suse.de>
	<20261110160510.2697-1-sreekuttan2156239@gmail.com>
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 10 Nov 2026 17:05:10 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> The validation in snd_ctl_elem_write() happens too late. Before calling 
> snd_ctl_elem_write(), the compat handler calls copy_ctl_value_from_user(), which 
> uses the type and count returned by get_ctl_type() to determine how many values to copy.
> 
> If the control's info callback returns an invalid count, the integer and boolean paths 
> can access beyond the fixed-size integer value array. Other paths can also calculate a 
> copy size larger than the available kernel buffer.
> 
> The read path has a similar issue. It uses the same type and count when copying the values 
> back to userspace, which can result in an out-of-bounds read from the kernel buffer.
> 
> So, validation in snd_ctl_elem_write() cannot prevent these problems because the unsafe 
> accesses can happen before it is called.
> 
> Using __snd_ctl_elem_info() in get_ctl_type() ensures that the type and count are validated 
> before they are used by the compat handlers. It also reuses the existing element ID handling 
> and access checks.
> 
> Therefore, I think this validation is necessary.

OK, it makes sense.  Now applied to for-next branch.


thanks,

Takashi

Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A58F2652B2;
	Mon, 28 Sep 2026 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599640; cv=none; b=aD6nGvK/yPnxXE3jgay/x7DniJZJK5PlPjIgVARtD626u0ml68kizdiQok4DTqEVooxYAdxM14cUX5FwxhUcESDazxCswAsvRjIIgZscxS2A5nynnM2W+Nt0EODx26VN6YjDOdY6UeSGq5aB5o0mDopFrCHbgar7vC6L2CWia3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599640; c=relaxed/simple;
	bh=MvFN5g+pw6Vkyl3QOhGeR2sHdIm9vG6MipU+U48Szuw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgBmT8WiTdhXfhMDpiLnX0oASiGgIc1rPob62HBHC+fhHyRFkfPBX424Zkg6fYlejGC6YcFyKDC7E+9j7IwsFLAv0uRMLxVKeqZMBo7PBn4HpTK4/p4g7oERzveSGb0M3NdOjvQxHZHdaC9mL9GaxVTse32mcwjjpJDqEYeVDYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xwvpQiAZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kVRdJmP9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0BwcwKlh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZbzlQ4UX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xwvpQiAZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kVRdJmP9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0BwcwKlh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZbzlQ4UX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64D161FAD5;
	Mon, 28 Sep 2026 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mAvwvUVRnCmj8Eb059n3cizyO7VpVwy5gXBoK5N80bs=;
	b=xwvpQiAZO1Uj4fnNknT/8HWN2+3cA3XHXrIfA/ZbYVdHBCDI2xuqCwICkMpd2DqDnJlgiv
	x/cW9rAvnWA98ux4WmcQBjUQkfCMrvmTP7BfpwXUJqsLtsieo4EMSq8ikxGH4in9eC04mb
	OkeQWzbg8VK45C1TcLfULo0GCwFaYNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mAvwvUVRnCmj8Eb059n3cizyO7VpVwy5gXBoK5N80bs=;
	b=kVRdJmP9ehS0vsGhhCkS2CfU4TrOwnQfilcJ4/iFUcjy5Sfevtu+l7JhKEAf+snVH+PexF
	OvcJ38Y/tHOQkcAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790599629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mAvwvUVRnCmj8Eb059n3cizyO7VpVwy5gXBoK5N80bs=;
	b=0BwcwKlh8tAf+nyGL5rsZX10x4ts2OP57Hogisj5lvT7JmgAC8P+6ztro07bG6HIwHwpYV
	EtZGkpoNK2xqQfPfXByxJyy94Z8BB6/hPjLt7HBtM+LnUv4O0+Ri8IWJU8Dya1VP5xJskY
	Xfp0hq848jK/UpEKgjfS/Ki7Ch8B4NU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790599629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mAvwvUVRnCmj8Eb059n3cizyO7VpVwy5gXBoK5N80bs=;
	b=ZbzlQ4UXcUGRF1B5vNeFf0aNlni9we04cUt+QOVPscJKSkRwb4LOx8B5ErCO+wUnz5187Y
	4nHrqZlqcbORs+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25579133F1;
	Mon, 28 Sep 2026 12:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wF6KO8xhumq4DwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:47:09 +0000
Date: Mon, 28 Sep 2026 14:47:08 +0200
Message-ID: <875wzp5yr7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add quirk for Lenovo ThinkBook G8+
In-Reply-To: <20260921124450.639601-1-zhangheng@kylinos.cn>
References: <20260921124450.639601-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 21 Sep 2026 14:44:49 +0200,
Zhang Heng wrote:
> 
> Fix Bass Speaker volume control on Lenovo ThinkBook G8+ by adding
> quirk 17aa:38dc with ALC285_FIXUP_SPEAKER2_TO_DAC1.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221799
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied both patches.  Thanks.


Takashi

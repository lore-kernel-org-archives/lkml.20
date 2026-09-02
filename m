Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4E48AE00;
	Wed,  2 Sep 2026 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358218; cv=none; b=cpIA/0WCMNuhm67TVlWnqwRyYEzhH+ceMAOUPqkNzg0lDk+znhnPjo0PUqhSi4HTDVFDZrsmt3A55LzgWYNkJOGFG6CT3kk6othFfncznWdyN9n2OEEfCXjQzbGeD1/F78X70CmPuHhIQqdPAcqlasy/+TFRDc+OV/OBMOgWOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358218; c=relaxed/simple;
	bh=0n6J8d2tbFL7ga6GssFj7mwqgAlKt9GThZ0gjGLW2vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ronBQh2zMKseP2AmHRNpk6mgzJTGMc8QqcKXulrR44g8uTeBRu1kufm6JIUG1Z56olahTd3zDmlNbpVP7vLzcKrAHf/ehCqJS9ed49HZfhpJt8iiYv8JgzsTHx99NNgNAmUfnUDxWVb15yusV05h/+ThCQTBNBgOBdA6FeeX8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=02cBZjr3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Tb3/fEYe; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2kgGy09B; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jVRKKD0G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="02cBZjr3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Tb3/fEYe";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2kgGy09B";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jVRKKD0G"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A153821D1E;
	Wed,  2 Sep 2026 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788358210;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQOX8mC9KXS6/HAfC7JEqeQ+pfODV61QEAOmpHiR59o=;
	b=02cBZjr30hPVIC8Mo3orx3wuApnivWCmrNRH3+4RUeViLigjljaHgZ8tAPnGA45KSHNYb0
	Tq1+uT8/0S3m2fKWMwVCO/4+/uJ58mXtmrd3/2yWeaaXUdcNBF+lC9DrjywhTgIaSChdRK
	WWVQAvncTw8hmWk9fK1i00DcL89pNyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788358210;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQOX8mC9KXS6/HAfC7JEqeQ+pfODV61QEAOmpHiR59o=;
	b=Tb3/fEYeEbRs0W07j8g6Tuj5KECDlsy6msrHTMb2txer6bGQ/noQrrp70H7uSKjaOWyy7t
	GfzU0TbuRYGa9cAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788358206;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQOX8mC9KXS6/HAfC7JEqeQ+pfODV61QEAOmpHiR59o=;
	b=2kgGy09ByLHKEIZ6l/3elsPx4p8e0tWc8A0FDz5OQ8WcJV1bm7D57xFPItDo+nil3y7fX2
	8Nnpom8ZwAZixOvXYDunKVX56mF2VFmiSzbSMy6HMYgL5LQGRUXukEchBwj4AIAlm79MZv
	x1vurtqn+MOxFPYPhYwgw/i2ZbVMOOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788358206;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQOX8mC9KXS6/HAfC7JEqeQ+pfODV61QEAOmpHiR59o=;
	b=jVRKKD0GdV8TMbN37WOzXFXg6Ud7FzIcLLznCyj7n5lns/qmMbe5V0CfSBKrEufqhanZZM
	DmWAmPNMMgAIa8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7975E136E6;
	Wed,  2 Sep 2026 14:10:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jlhyHT4umGozAwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 02 Sep 2026 14:10:06 +0000
Date: Wed, 2 Sep 2026 16:10:01 +0200
From: David Sterba <dsterba@suse.cz>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the btrfs-fixes tree
Message-ID: <20260902141000.GJ9053@suse.cz>
Reply-To: dsterba@suse.cz
References: <apf36908zqybr8_0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apf36908zqybr8_0@sirena.org.uk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO

On Wed, Sep 02, 2026 at 11:18:19AM +0100, Mark Brown wrote:
> In commit
> 
>   590b991274881 ("btrfs: scrub: report the failing sector's address, not the stripe base")
> 
> Fixes tag
> 
>   Fixes: 0096580713ff ("btrfs: scrub: introduce error reporting  functionality for scrub_stripe")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

It may be hard to spot, there are two spaces between "... reporting  functionality ..."

Will be fixed in the next update, thanks.

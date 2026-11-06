Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974433;
	b=N1R69VJPCVLb3FJdb7Avgca3DPtHoVHFG19070euL/tXL3e8GRURslVY+WZxxJ2SGym2
	 X85nwkzzDlMf8kedpTZ/57Fk45xFduQORO4Wo/VrBMYI5O4FOlcJwaKbONfUxiElDwlWL
	 UHHPZJNTZdxcO4U5oLKYutNoWqy6NA1xnEjkhBPqxK9dAwaifAKYoFZgq8QmeR6ZSZR73
	 EdTtqTIoWyMlbYIbrlzORSWMtdedbQzPlrGkS5CR8iqgCUEjz/ecojMrUGLExbzuhM7la
	 16GLePI8Nfq0Idz6X92Bw30TwfVXNo1i9ZIL04egrTw6fwBieu3eFxPm/Qmkzs6XRQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974433;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=DbWVk74jXjpvpjgKYrK4/CAQhS2u1tHZBMZnBzvHIS8=;
	b=NJ8rkXPeDLzHkUnuqtVnFj4vaiPYn8HK1SWyqTG4BGMAO69ald56DkcM2ci9khCtXei5
	 /Gu8JUJnZR32SLp4t69U12mEwJ3xmW8GISvzlg8xTBYuI7KDQAAyaDQkKl63GZ0UrR1e4
	 Fqr2rXVEADCy5hg5HfvVeb5lMe0CutcMnoUSPvcOWdB1yX3uVynjiHIkruLdLQMtlWzt+
	 AQegRyL8ArImDhD3l1z8ZR6paX2PePhqVNiENNYZpjL4n/auTRB7f894EEPfsGG3ogN2a
	 1SCuKdkWQ7+z9vMMUnqB4N/KgE5aI4Znm8kh0wtUgVLuyz6cQ7f6SdKwvg2togmlmtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b="pvRI/D8R";
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AzVXIHVV;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b="pvRI/D8R";
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AzVXIHVV;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54171606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54171606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=pvRI/D8R;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AzVXIHVV;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=pvRI/D8R;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AzVXIHVV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A268E22130;
	Fri,  6 Nov 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793974430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbWVk74jXjpvpjgKYrK4/CAQhS2u1tHZBMZnBzvHIS8=;
	b=pvRI/D8RopcbFtgNPfW+iZ2eH21pmmfyjNXaTBk2vE1ikaUyi5ZiBfpUI9DBHxSg056LZ/
	bgaYzzIfmdjyGKdvkKYDTONndhOEEdBNMQoBgWoZ/a8TN+unCtfVpYKTENumVFgNiyx8PU
	jzG6MUyNuwxCdK8tH73YdFpwQlrjj68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793974430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbWVk74jXjpvpjgKYrK4/CAQhS2u1tHZBMZnBzvHIS8=;
	b=AzVXIHVVE8uagLfECKc27F9aiHHqwykOgSHiYeP032HqnsmkIBLN0HR+sxphwH+ZhZ+jLJ
	ogoAPHclIxaMcyCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793974430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbWVk74jXjpvpjgKYrK4/CAQhS2u1tHZBMZnBzvHIS8=;
	b=pvRI/D8RopcbFtgNPfW+iZ2eH21pmmfyjNXaTBk2vE1ikaUyi5ZiBfpUI9DBHxSg056LZ/
	bgaYzzIfmdjyGKdvkKYDTONndhOEEdBNMQoBgWoZ/a8TN+unCtfVpYKTENumVFgNiyx8PU
	jzG6MUyNuwxCdK8tH73YdFpwQlrjj68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793974430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DbWVk74jXjpvpjgKYrK4/CAQhS2u1tHZBMZnBzvHIS8=;
	b=AzVXIHVVE8uagLfECKc27F9aiHHqwykOgSHiYeP032HqnsmkIBLN0HR+sxphwH+ZhZ+jLJ
	ogoAPHclIxaMcyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AC9C134E9;
	Fri,  6 Nov 2026 14:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ao+wFZ7g7WoTZAAAD6G6ig
	(envelope-from <jbohac@suse.cz>); Fri, 06 Nov 2026 14:13:50 +0000
Date: Fri, 6 Nov 2026 15:13:50 +0100
From: Jiri Bohac <jbohac@suse.cz>
To: Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kdump: Give crashkernel CMA areas unique names
Message-ID: <au3gnsckVTK6tUs5@dwarf.suse.cz>
References: <20261106104309.3669583-1-zaslonko@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106104309.3669583-1-zaslonko@linux.ibm.com>
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, Nov 06, 2026 at 11:43:09AM +0100, Mikhail Zaslonko wrote:
> reserve_crashkernel_cma() names every CMA area it reserves
> "crashkernel". If the requested size can't be reserved in one piece,
> it falls back to several smaller areas, all with the same name.
> With CONFIG_CMA_SYSFS, cma_sysfs_init() then fails to create the second
> directory:
> 
>   sysfs: cannot create duplicate filename '/kernel/mm/cma/crashkernel'
> 
> and the error path removes the sysfs entries of all CMA areas.
> 
> With CONFIG_CMA_DEBUGFS, debugfs refuses the duplicate directories as
> well:
> 
>   debugfs: 'crashkernel' already exists in 'cma'
> 
> so only the first area shows up in debugfs.
> 
> Keep the name of the first area and add the index to the others:
> crashkernel, crashkernel1, crashkernel2, ...
> 
> Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
> Signed-off-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>

Thanks for fixing this.

I don't think we really need the special case for crashk_cma_cnt == 0 
and that "crashkernel0" would be fine. But I don't mind either way.

Acked-by: Jiri Bohac <jbohac@suse.cz>

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia


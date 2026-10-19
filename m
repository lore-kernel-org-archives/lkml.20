Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426691;
	b=uOZQdlCOpx/Mk93zqChfjg6c7bzP6FcFMW4pLKicysEOTWeXmLtV2XZupFVFLEgdBMV8
	 Y+oLPwiHGn76kVdz72NpyE85ciIcci0/W+Ns78L5TUVYdDNKr5g3gabeN/6lkSJQellOA
	 x3HlZwe54SnsZeCpWaM43Zl93vMbl9kwtsZPKcFEfia7JGOZpodtXGl/baECnLgwo3gjl
	 51pB2UUTHJpi6aDI4PJ+5g/bzKjiALc42hkSgnPtufTOXn+ilUGm4xXi/IjaPzlFvPXf0
	 6yM2HO+X/OceJ2vBCcT4ZHulPCN65MNKZl8nYU/VGHjWBhyb7RQfqvqKPuA2Z2pe4xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426691;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spamd-Result;
	bh=BoY4kFq1xTE2soRWfhV3QnUWiJD903xadYDoRPjUcwk=;
	b=MIKviHQFZanWNjASvSn7+DIkgQ0xplQwAeo3nfBH/2JC0IvaXqiaujuxl7EH2ATp2JWI
	 RvhvFIkUN2URM0OV8ebjrQWxfgDa1AOSNRfnDEGxDfMleoAvEczz8rYTrfMYEjGuQmr7B
	 Er0XWo8dfWbLu8NwvT6nGrGjyMrs9IWRUA2LaTU0cZK5VCxWW4CEz8oDqgZ/HQQGApXS1
	 Kms1SqmvPP/Qp8C8NJtTH/avkn9BAGPpRiiosfl30YrW3aZhXYuErbd8DIcQqkpYP04Fw
	 q5tuwnW+76fa90TvRckYOyOq97qhv2GwPbeV8XRhQ98NbtOCOU71o5E8TxUHDQSfijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hf5Vn2C5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VouBd5eY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hf5Vn2C5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VouBd5eY;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2922D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2922D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hf5Vn2C5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VouBd5eY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Hf5Vn2C5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VouBd5eY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 623061F7A0;
	Mon, 19 Oct 2026 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792426689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoY4kFq1xTE2soRWfhV3QnUWiJD903xadYDoRPjUcwk=;
	b=Hf5Vn2C5R4Arlr1GMdoOQlJKsd1hCxXJMFFQYl9uC+/yzq+PQlAiEfcX1SD20Y1mh2vSVJ
	n+4WKV02mY7kGbkufsLS8Lsx6zQOw0hVSOVXo3fFhqgWnycNo+myJCxXLDlOcgSusaaj9b
	XcrDAJivK94NX4xXHNVgx2osPSFAsSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792426689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoY4kFq1xTE2soRWfhV3QnUWiJD903xadYDoRPjUcwk=;
	b=VouBd5eYuVv+39qauP4gdyTSNJIb8OzY0blYuzN5FtWML7M55zAaR15+uvwxSNjbzkZ9IV
	Phc4iVpBYbBr2aAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792426689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoY4kFq1xTE2soRWfhV3QnUWiJD903xadYDoRPjUcwk=;
	b=Hf5Vn2C5R4Arlr1GMdoOQlJKsd1hCxXJMFFQYl9uC+/yzq+PQlAiEfcX1SD20Y1mh2vSVJ
	n+4WKV02mY7kGbkufsLS8Lsx6zQOw0hVSOVXo3fFhqgWnycNo+myJCxXLDlOcgSusaaj9b
	XcrDAJivK94NX4xXHNVgx2osPSFAsSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792426689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoY4kFq1xTE2soRWfhV3QnUWiJD903xadYDoRPjUcwk=;
	b=VouBd5eYuVv+39qauP4gdyTSNJIb8OzY0blYuzN5FtWML7M55zAaR15+uvwxSNjbzkZ9IV
	Phc4iVpBYbBr2aAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D06B136CC;
	Mon, 19 Oct 2026 16:18:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g6toAMFC1mr1XQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 19 Oct 2026 16:18:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 04/18] nvmet: Implement CCR logpage
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260920182936.2317916-5-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-5-mkhalfella@purestorage.com>
Date: Mon, 19 Oct 2026 18:18:02 +0200
Message-Id: <179242668212.3619480.10236174568142270641.b4-review@b4>
X-Mailer: b4 0.16.0
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,purestorage.com:email,grimberg.me:email,imap1.dmz-prg2.suse.org:helo]

> Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
> Reset) log page contains an entry for each CCR request submitted to
> source controller. Implement CCR logpage for nvme linux target.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

Reviewed-by: Daniel Wagner <dwagner@suse.de>

-- 
Daniel Wagner <wagi@kernel.org>

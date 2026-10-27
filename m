Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093002;
	b=SWhglei/43QHw2mDhsD3OdRqjSnkbS9bCJA9Z2/Wnjb6pSSRbmYAIHMfXfAtz1OQQanM
	 QFih4BTT1kMvUr22K1B9Msh8WmwDI0VT0xZB2mKSh8mEDR8dFmNr3K2c8FMUDqA8rZP2z
	 h0RhS9lI0bxJQRGZevMQcWR2MsA9EPvuuuimuSb4gr8eOZBUeOATPKCVyE6C520Ff3+iN
	 TwB1VjRNXwDjJIIrKGIu8wZTvQsWIZgO2JbUELaSRi9QnCqGjKzwvjmxcLt5saHxdeTPn
	 4fmCuA0hAOzcAdg0PSjaRJjeGixKtC/WhPsEeYyV1kWvi66fcmnMBF9BqeoSyT1xpvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093002;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZpmrUqEHskHm7Yfzl2QMlE2cj/pVeGl7eiRLC9pfoCo=;
	b=AIYazZwm3CfLu1LEgOdg+c6UKw9vltPZDtgUU3UiD3g4Qj9a/5phaTd6ClKgAR7cZFa7
	 HNzJNZkMWR2uipZFA0djPOjpmBRyuPzQIcdofyegfw3+27AF0ZwaATJmIA7ktveNK+efJ
	 vYdeje8+vLrHg5NmYtRqqiierD3bJrdX4GhOx37Xoqv81J81uRXPSsnJxVuE3LAx3zrk7
	 j+6Izdnuglk0El5pWLwt3Imvq8JPPdBAnlWV8NOwrUxcWDJXa9FqsUWl6At4rPTew2hf3
	 oKHbVuiu+N59t61lJlJWS4a48fR8UwRMOWFWOOpkUHLpIxsvdsNlClM6AjSRZsgayEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpfbwKG0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACAB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EpfbwKG0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2202D1F031E0
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093001;
	bh=ZpmrUqEHskHm7Yfzl2QMlE2cj/pVeGl7eiRLC9pfoCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EpfbwKG0eOtmWr3qkD0KLNU4slcgf8jGwVDQBLW70jgfx4I4/AgaXkSpdWaLbKSZ+
	 xp7Z0oZnETGKAnQkwbXb0MV3QCyA/vpbC8m9aC1KzZg0Ctd9qit0ZjqQ4VBiZ7yelp
	 2g+PpZHmQ+2nN2W9QqTEj7mpz7fYt4b9plZ4I9HRmgB7PnsfaeNY3kbDOV0ey/1liO
	 ojb2CwIHuw4vuUkqNmStVCzYrksamGf1HSCW7dlJwMGR/aBVO1R6QVM/xc/BWc2PQb
	 mng5wuslyXcIiSq3SVPAKtN+XaA7QbPkrL4HYIKCiC1vCggXPvEoXWLZ9um9SUISgv
	 ONGmlIWwKquXw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c45551fa84eso570020366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAr3GT0N0sUIycIXKH4ENi1zLjyERz2jTSrs/1xKXBafJWMsmt6SEI+i+l3V2QYz99DJgMNahkJIoIXGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf7ZpF7inut3H9hQNRgDiLFw/JMlYyuHK0EBwxJWdKlazlOd6F
	bykbKBLNsVRD2V4gvcoLcV/w0IMN2sj4++6PVMBKU+R8vRMktSas2IuM4tyqViqqRCxn9CnrD+w
	qNhaYF01qF1c9tw3j1ZlkbXtPkxixSUc=
X-Received: by 2002:a17:907:3949:b0:c49:9231:5518 with SMTP id
 a640c23a62f3a-c4992316908mr380586866b.21.1793092999740; Tue, 27 Oct 2026
 02:23:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
In-Reply-To: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 18:23:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Pbf7r3YF2rOZpo6sOX-3UbbNr1h7KGQJ0fh9M03UMeA@mail.gmail.com>
X-Gm-Features: AclHuK_w6Ld8kHOPNQuIC5yXLVGjtNE2R34EhtGj44KaJOMahykBSf3-rMwBjrU
Message-ID: <CAKYAXd9Pbf7r3YF2rOZpo6sOX-3UbbNr1h7KGQJ0fh9M03UMeA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: Fix error handling in __ntfs_create()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:43=E2=80=AFAM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> In __ntfs_create(), if ntfs_init_acl() fails before
> ntfs_mft_record_alloc() is called, jumping to err_out frees MFT record
> 0 ($MFT), unmaps an unmapped record and unlocks the unheld
> &dir_ni->mrec_lock and &ni->mrec_lock mutexes. Call iput(vi) and
> return ERR_PTR(err) directly instead, matching the
> ntfs_mft_record_alloc() failure path right below it.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Applied it to #ntfs-next.
Thanks!

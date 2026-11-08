Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794141150;
	b=5RJ2AaA4+liALLUr4RNqPFGxIVR9gOwkpK0x2aJ+FK6HNfpRUF2g0gU2dfWuzc+aNu7C
	 pJi1UiRHqy6UoTgd20pDwQVckwo62DBrBE39XbuUF9/5vCtdQWxcK5/L5yOlwM/K5TA/w
	 OGgKMpABpYcS3LBQ8f/Aoa0++9HSrQsUPb4LtgyAypWoAjEZUpPCyXxedSSGYvbv2CBNq
	 NPHPlAoZ05Q0dgcDpyQC82mQqYdvXHQ7YKN7KDjlqeL5TkdHbCta7/JUYkpSMGi6ygQs3
	 XV4GONFvNOAhayNMlFqONjx7QrrC71IrsgqJitA5UFvS7uKdKor6mCj6jHCosN3S1DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QWdpxBY5f9SrIiP9qlqTJHu1UmLoydUe6EBqvkilw3k=;
	b=vlY1f7zP1GJXcEqDR0AxYU8A2vcrzAktx62kVLCOQhEt2YNO4W9Zuzu79i79bSikuHy+
	 fAfF8D6+wm2zTVNyoxasMDglqbUp1IIgeINCsf5CzO+i5IZf2K6njkyMuJn0C49pPOcuH
	 ZxcTmClLILRrQardJF7SJRvoiMPwpaUsMY66LNtHCBPb/U9Zj9+AwwlQUbEE5cbOeT4rF
	 irZATfRLfiP2VMONk4S4mFxMQc539XsuO1m286pyt6L5XvPTV+Int53F9Gbcv6ZpKzyhZ
	 LdFHNJkUKDoDPMcNffY9T6/GO2WucA5SK7AEYRLZdgM9Iz6Na2pdeyugEcBH8juDNeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRwyiFCH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8162B606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8162B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRwyiFCH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so158651eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794141150; cv=none;
        d=google.com; s=arc-20260327;
        b=TPB12TJc1N+MH5tCb9tLb1N0vyh1WFP5gWGDkYGWgiDxlQaS5HdQ2nNvzGE8gdgPfC
         fE3af2azkoTEgPhj8KFZ7V3XCPZGOLiE6PXwxXDNdEeqULlvOKR0qYQ4zG7bwazq52EL
         HyvbKslWPZmmKxnPjwq9GfDs3cBbNtBIEGO/h36osQajFEPpSKRkbOpiLmEh9BiStvim
         h/VTfehoRnEcT6zwOyJ1JFL//DogTzlvwlU8GsifPvkfUtcCe7T1S6gSKwXhEqWLwPV3
         n37piPiaRmKTVX1fT4vynn0/ZtLwlpHHK/0M95+sAFqZnWY/L3bp04mtRmC5GF0ADNRp
         5wKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWdpxBY5f9SrIiP9qlqTJHu1UmLoydUe6EBqvkilw3k=;
        fh=CRZBw8iWwEeEN/97wwJW53TNDd3YZF9EMR5Y0bRSkQ0=;
        b=Yqof7DW9dStKp+NCHpRbBE9Un6Gjq+DYnuNgtDjlf/Gt2/dHRBUdgOuyRqzenZS+HK
         jLhBUrDEAlTCwKhErIh78zEQP6QN5Q5iQDAJs0ITkYvxg5KI14BcxQ63UdXYuqnN3KkE
         VVCqRmxXkbezR7vrpm5Hk8hUAWHNLCyQnOMfa7UmsLvhMiW6JlFhIP8zMvDosCCBsHnq
         PTOm7/SsAqqN1Ck2Z+vR7hO70G1o5/ZtL4pP5u1EGuyHKFunF2tl0lDsFiBkkRZv4zOC
         5v9zswYoG04KqsfUl/w7uR9WqNzoSXcJ14q/pwpczesmFdZw9rNPnpr39VQsJAKaEI9Z
         cFIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794141150; x=1794745950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWdpxBY5f9SrIiP9qlqTJHu1UmLoydUe6EBqvkilw3k=;
        b=VRwyiFCHsdY3Jpa0rIAYOhJl7wrp0P3/eYwNVbjsLivYJYE3+6CsRNAdl3rZAwftQw
         l5u5RvFU0L9kJpV7mJLpNPipOqYOlPZy9OGAwPTgFBLeRPct3RnmcYf2T5qREXEtRt53
         KqfGfsgZ0EYpyDNaQ0nA/Hg5HChetXfPD//KZ57e3HLLRlRXZCqecLY/NT8LxTR1+g1T
         dsJ7Q8O4LjHuPRrUj2b8iMSNN3z/TXAgAiS3KUqSTJ0DRjLEBZ8imi9fLzKDJqLxutQt
         8rPX75rYRvq4JgfVs79jcu8mz4NFugvxaBm50cBC35I5PpaSU7Lt72XAcae+nz6v4NNQ
         6XJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794141150; x=1794745950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWdpxBY5f9SrIiP9qlqTJHu1UmLoydUe6EBqvkilw3k=;
        b=TSUtxfpc/SObIQIpzm5dqNH/4VtFXzu1YTxbA3qCXZvTVnWwXKFCGxB+nhr0xIfWbU
         rzNFOGYVyUU8DunAlWxd8auKigG5FKZvofkqGJXac5Sd6Rntx675KCTrRybxwX3ytvbr
         23vBXwyNTq44tofnWBxUvInaoaRlAmnawYwHuDFzN1arvhmmNPzGsyScqPj0EtkPowl5
         P6JQHDdf98lbw/JYfLla4CNW+4B5oDJWXT8/js50zmwrldMCL/xcOvR1uJejBCGagYxi
         8BsqLgGJGC6/NwnM5bxJAJxIZBA1kd0pfgk7dh++JxyWJVyMpN3PUPMQfnPF1+8QLKp4
         QS/w==
X-Forwarded-Encrypted: i=1; AL+hErG4QXIhmRrGIodEzltAkguX1kpTbniG0z87d5Sg1QzaO53AkSGn9art2Ff1iauKZILhw8P27p0YKfdOSec=@vger.kernel.org
X-Gm-Message-State: APuU4Z85/eN5Ule2wbvRe9PJJhONztZmugecgRo9lUlXdOZCvvmyAjHx
	IWiyOuVwN7UUCCPItFodRFBMDohYIJftJL2KfUr9q3Ue1sHJ7fOcWS4gHP2Maft2v2KdynB0xba
	ok6zAmHGG7065AXHrSNB+vGlMbdpy0fE=
X-Gm-Gg: AYBFou2A4mZPWhD3xsxHIlOl5I0ks+5k3FLxwbAnpYPC16kTsv3boucdNwrPo4JnOI6
	+xv6FgkdGpwVoBG13Yix7JlsASbacuouvgvv8vzRnVjwRhGevaZADRL7QS5JWU3jUN+lEFSag14
	5mQvPZ5sUrhLKtVo1BDUG+mjX9QuDzcxDoGXE6pvUgR4U7HfH3R5ZeuFbETXwwvRZIbVoNIICzd
	w3HcABUhZ4OIPViH3Q7ZDu3/UzJjZuvdOwrMlxodRw5ysEBiabG5Saa8Cv1gikKI9edtjig/ZvQ
	2UEBfZUp/4nWwf8dthzz/OLp9N9ra1aqykljHTBVWzAWYkVRGDWGaDXyR02Mwl363jqI3Mhw8vA
	Blx0MrlNVzkfyPrtpHyUSdrCzTPidaplFHBDMwVZzim4Od/K5yPhp/3vv5xl+VQmM2j8/EomVPl
	xNDASSHKwfWJZBXQ==
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id
 5a478bee46e88-37256614c62mr2989725eec.8.1794141149593; Sun, 08 Nov 2026
 04:32:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108075848.257145-1-hj351016@gmail.com> <avBrPjvw_5EH_W5r@kernel.org>
In-Reply-To: <avBrPjvw_5EH_W5r@kernel.org>
From: khj <hj351016@gmail.com>
Date: Sun, 8 Nov 2026 21:32:18 +0900
X-Gm-Features: AclHuK-wkJTST75ujvma9IGtuUWYkl4oaDisXKEz5d6-YrVvIkqMRKq-RLJUzHw
Message-ID: <CAGr5VtNphPZtGC9MSLQcMCUWBKUYPC_ufqpb1YZ=WBPm=oZb1w@mail.gmail.com>
Subject: Re: [PATCH] tpm: flush timeout work outside buffer_mutex to avoid deadlock
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Tadeusz Struk <tadeusz.struk@intel.com>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, renamed to 'flush' in v2.

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 9:29, J=
arkko Sakkinen <jarkko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sun, Nov 08, 2026 at 04:58:48PM +0900, hyunjungg wrote:
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > tpm_common_read() flushes priv->timeout_work while holding
> > priv->buffer_mutex:
> >
> >       mutex_lock(&priv->buffer_mutex);
> >       ...
> >       if (!priv->response_length) {
> >               *off =3D 0;
> >               timer_delete_sync(&priv->user_read_timer);
> >               flush_work(&priv->timeout_work);
> >       }
> >       mutex_unlock(&priv->buffer_mutex);
> >
> > The flushed handler, tpm_timeout_work(), takes the same buffer_mutex at
> > its start. user_reader_timeout() schedules timeout_work from the
> > user_read_timer, which is armed while a response is pending. If that
> > timer fires and timeout_work starts running while a reader holds
> > buffer_mutex, flush_work() waits for timeout_work to finish while the
> > reader holds the mutex, and timeout_work blocks acquiring that same
> > mutex -> deadlock. lockdep would report this as a circular locking
> > dependency between buffer_mutex and the work.
> >
> > Before commit 9488585b21be ("tpm: add support for partial reads") the
> > timer deletion and the work flush ran before buffer_mutex was taken;
> > that commit moved them into the mutex-held section, introducing the
> > flush-under-lock cycle.
> >
> > Flush timeout_work after dropping buffer_mutex. The timer is still
> > deleted under the lock, so no new timeout work can be queued once the
> > mutex is released, and the flush no longer runs under the lock the work
> > needs.
> >
> > Found by static analysis (a checker for cancel/flush-sync of a work
> > performed under a lock that the work's handler also takes) and confirme=
d
> > by code inspection. Not reproduced at runtime: it requires the
> > deprecated user-space read timeout to fire while a read holds
> > buffer_mutex, so the deadlock is established by inspection rather than =
an
> > observed lockdep splat.
> >
> > Fixes: 9488585b21be ("tpm: add support for partial reads")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> > ---
> >  drivers/char/tpm/tpm-dev-common.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-d=
ev-common.c
> > index 6569212..f9b18ef 100644
> > --- a/drivers/char/tpm/tpm-dev-common.c
> > +++ b/drivers/char/tpm/tpm-dev-common.c
> > @@ -132,6 +132,7 @@ ssize_t tpm_common_read(struct file *file, char __u=
ser *buf,
> >  {
> >       struct file_priv *priv =3D file->private_data;
> >       ssize_t ret_size =3D 0;
> > +     bool flush_timeout =3D false;
>
> Rename this as flush.
>
> >       int rc;
> >
> >       if (!size)
> > @@ -164,9 +165,19 @@ out:
> >       if (!priv->response_length) {
> >               *off =3D 0;
> >               timer_delete_sync(&priv->user_read_timer);
> > -             flush_work(&priv->timeout_work);
> > +             flush_timeout =3D true;
> >       }
> >       mutex_unlock(&priv->buffer_mutex);
> > +
> > +     /*
> > +      * tpm_timeout_work() acquires buffer_mutex, so flushing it while=
 that
> > +      * mutex is held deadlocks if the timeout work is already running=
 and
> > +      * waiting for the lock. Flush after dropping the mutex; the time=
r is
> > +      * deleted above under the lock, so no new timeout work can be qu=
eued.
> > +      */
> > +     if (flush_timeout)
> > +             flush_work(&priv->timeout_work);
> > +
> >       return ret_size;
> >  }
> >
> > --
> > 2.43.0
> >
>
> Br, Jarkko

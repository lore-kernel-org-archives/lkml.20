Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D884BA1F1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600585; cv=pass; b=D5065EO2vYvXMOh48QvWsnAtMUk6q4AQms/wXXczXf7hULDmFI+VApE2bv9751xQkhoodM1sv1Kh/Hc7pKMMahQXqd9XOkNPD+oeBu5PwiCceygmFM+RIEG1F8Ka9Q+jIIzsvn+ZCqyptMypeILF0Y0GNKsmb4kWVaQUwzkWM4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600585; c=relaxed/simple;
	bh=PGqCNKVZCKuQE7jwiEPuuSZ/IDgGiFbjWnBb1wGsCq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b55ocFl9ouFjlXfEJyyU4qNd1HRuI1eZ24umkqiKOXLjvJsngEvJXRcxW8EvsVfxXKvTef/TCl6FaaB8qZvG3m1F54g5gx0rTFK3zWMIquFTo6UvwMndAtTaHj/X5UmZVgy77+G35Vj+J6WCzImopP5dv7oIdg741AXciQIf44Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=UNsMKJo2; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="UNsMKJo2"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a306a4f797so2407191fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789600581; cv=none;
        d=google.com; s=arc-20260327;
        b=LwXEykhjdrpjPLyp8uCIvZJp5Fws27b7rc9xAv7cAoJxwy93I5nW7FdKrD/5WNYZrY
         8g9YbzM95CDBXsjiQBo/jofgShq/YtB0pz259X1eIB56yiENl+CDAdQxy/kbu21bDe5g
         b7cLDwY+1s0qw+e7xoMoImJlyTvCTIttwOPmhFTvj7UU+Kjl+QoCEbDYmuKdXztvGGaY
         wTjXT+HsI4sBR+Rufk9vBJaGvOuejjyGJDELjjY74EH1VMd4wuzLygsovqW3STwln22N
         7YJ2B3GeybYuYAi9BFsViZ/g+7gp+ECWv6M0wc+GCVpDMISAehIBRsK+gXJLXn0igctQ
         CCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XuO1Ijt2sJ14x5nHlyhOYgW7+udniPE80quffc8DQvg=;
        fh=876F4gtwMbGAB/Vo2nGJbBXmALxRrVQ8/HmEoZWV1/s=;
        b=NIiB/Lxw4yVw68XU0Evaw2JSh5KpX6Bb2x80jpaVZF3RoP9CheRpv74BJjKTfQCFty
         QMCIDetilbc01A7zvXBBU0mDa/RuCloHV/fZA680CWpyFAjNAqpLpvU/B2ilGKuGLKtJ
         +BWRxAjf80+u7eEB3u7g7UQEKpvnlVy3t4gK2tIK/l7YVEKIi0vmYGSG2fevacf5jvzH
         T18hc8GFmptnlLgAxb6X9MulgDlnF/5hLLIVznl8djgiFhq8ZiJGVP9x9j9/fckphWsM
         omDRCnkc01kV2YY77zWWo/z7DRjhwsfUSDkBX2K9HTqfqQzj+F4TUMXCL0ocianufb8C
         7Elg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1789600581; x=1790205381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XuO1Ijt2sJ14x5nHlyhOYgW7+udniPE80quffc8DQvg=;
        b=UNsMKJo2T6wCVhfzR26gvQPxMH2MFDhqPuI/hzcovTS5zs6CWJ+2olJEkH57SFtFCf
         zWTufsKEyJSmXcNom+NICA6udCi/cb6EsKlWZe5IH8uEJkMIWsASwxE/u8dk1qB395Vp
         O6r3li8izs13s3JHUW5DyGOwh1qssoK5icXYBlWJ86W3FyuOvi79ZxLw2qbw75a5hHTs
         22bvvOfGSRs/aUIaMEuwfjYbO7vHKzOxF2dcy7k9baG8XFnC0ON6gi383zGpQ9WYaZxK
         BLW3thCFFj3D8q0pRX68Rr5xvKK7/Ws6dIzEQyJVqtSFpvZ/ZcmS2CgJY6PYlmtlWZD3
         ODsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789600581; x=1790205381;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuO1Ijt2sJ14x5nHlyhOYgW7+udniPE80quffc8DQvg=;
        b=DPf4ARzPjl192X0IIMsnz0r7S/nZESBFYiAKShNFEvSTNZyFXO2ljAO5j2kwAqaUbv
         CgSZRF/ya9jhoqTuwDpF2iOsTMs82SgLaux8SJVpsoBsVjHBafy2PmRiIomFUrebcb2n
         mV0cMhREHLs3PorcP7vTfz07Ixygf7olA+erW1+vgK7WLVpVFBSYTOoEblNRQ73/Cskb
         3LkfLYPWTyl46Nc8XeXDNbBUWiG4O/gu0pxiG8KyfUDQ53F4K+S804P1P4OT6debUR2f
         584O3Xdr2tm1JkV/7FZiYtPRCiMxHoEnUTVR9vWGp+9JleysLDNfYGUind4QOi6Z3SF8
         4DCw==
X-Forwarded-Encrypted: i=1; AKwUvBw2a0JxjzYnWkOwAixbbU/3Wv55cZlNk3PTHigigmRDm7GIMFWFSD5vy2tapIQteBaPEy5d5sJ63ox+Gic=@vger.kernel.org
X-Gm-Message-State: AFuF++kw/AdTITt4eLF7rKy7B7JX5p9YVvwhPCwMqqb0MF3lsLNC+jZI
	UsvHIJN5uNT+hLmnP+kuGjwreuuRce+3F8ABtGHQ1TMV9IvVhHBXduA9fltIsqfKYSeToE++d6s
	iBA1N2DULCzJQXbfCUtVBbr7ScZrktXUw0DbDlvjoi9iws5S90b8=
X-Gm-Gg: AYBFou1QinD3LZ7eKF/xSBSzg2Sy4vWU8iukNruQ4P7TGdr1kHNz8eLNHsTVzNuM6Aj
	ej3/gPdKnc4Pv66wS48jzcXMe/cFf2SZvn4iPJ+OqXc8vXwWNDZZW6ZHJ9fq8TsWK0xj46BzhkT
	0WAt+ktbIamJS2RRJXPUhZ0etNeWoVpWFwHkDhyEPsZlhuxYxTMsKveVV79csFlfOGGp0mB6mc+
	TRgccWGoeUR8uG3NjW14Gv5py3BkE4yA9OMznKx+7WJBJxHaUfYI959MGbq0iOlA10o1oWyDIW+
	Cgnv9hpFytPLJtcr0JuxvCmESR8jZDG0AB97mhxSqJCk9W7QhVCD
X-Received: by 2002:a05:6512:1192:b0:5b6:1a7c:59cb with SMTP id
 2adb3069b0e04-5b8b6643a3amr1205595e87.37.1789600581075; Wed, 16 Sep 2026
 16:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913193815.2862366-1-mikko.rantalainen@peda.net>
 <aqcmz5uI7PgN5CT7@casper.infradead.org> <20260913235145.GY25906@brightrain.aerifal.cx>
 <eeb50cae-87af-4a40-b9c6-f4fa9981425e@peda.net>
In-Reply-To: <eeb50cae-87af-4a40-b9c6-f4fa9981425e@peda.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 16 Sep 2026 16:16:09 -0700
X-Gm-Features: AcwNN1XX9temToosIZFGFf0_oya4M6aRcGTN4rFbjsWI4-f9wQoGiIGursSmD04
Message-ID: <CALCETrUgLj4Dz0s6PMofViJwausRWCvNvJphxWHUeWCCaRBtQg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] close(): stop exposing non-retryable EINTR
To: Mikko Rantalainen <mikko.rantalainen@peda.net>
Cc: Rich Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, alx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:44=E2=80=AFAM Mikko Rantalainen
<mikko.rantalainen@peda.net> wrote:

> NFS and devices make the question more interesting, though. Some
> implementations put meaningful state transitions into their close path.
> Tape devices are an obvious historical example: depending on the
> device/mode, close may write filemarks, flush tape buffers, rewind, etc.
> Those operations are not necessarily replaceable by fsync() before
> close().

I realize this would be complex and maybe a can of worms, but maybe we
should have a new improved syscall here.  close() is indeed deeply
problematic.

On the one hand, we have the actual task of closing an fd in the sense
of removing it from the table.  This should really be doable without
blocking or without side effects (except possibly for zapping
old-style POSIX locks -- it doesn't really make sense to be able to
close all fds to a file while still keeping it locked, especially
since we report the pid of the lock-holding process).

On the other hand, close has actual *meaningful* effects, many of
which you've mentioned in your email.  IMO it would be really nice to
be able to explicitly *do* those effects separately from closing the
fd, maybe even asynchronously via io_uring.

Would it be so bad to have a new operation to do (possibly with
moderately fine control) the close work and another one to just
release fd- and process-associated locks and drop the fd?

(Hmm, for OFD locks, it really does make sense to unlock when the OFD
goes away.  For old-style locks, maybe we want a way to release an fd
without dropping the lock if it's not the last reference to the
underlying file in the process.  But maybe specifying and implementing
that would be a nightmare.)

--Andy

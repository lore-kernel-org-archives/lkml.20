Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCBA46D2A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143471; cv=pass; b=R6ncPibhtYUnKBIm6OeAbOfi0bnU7cSit584QJG0giwJyChKCmKNxG/SzkDKZCPA0unpQSxTiej+LjSPPLfOeKbZ2p9kUt/vDufYRPFqgRtVhJKWLrYRpgRFQmrnVyHzCC0XKzCfeG4UoOTo3ZW9yvUk658nKattXkZrTCPGF2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143471; c=relaxed/simple;
	bh=CCqz5HPpG93l7f8Cn42O1c4ODT9r8PrlcLsz5Puc844=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNFxLB8c3ADQgrNzVeqLBbaqSL+BAh9coswREh8lY6aMex9Au1Fxktx4bdT/05i0eVyNwDt/3x6sUIPYDyqBnJ4xW672sBdVS67BHj+/Cvz4cflG6pTLzEQsJAGLn4voVLWqRpMPC/o4d3MCA7NJNWAxVfhatSjjJneXij9H3kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=g21dieDM; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="g21dieDM"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-141395927feso11989864c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792143470; cv=none;
        d=google.com; s=arc-20260327;
        b=OOwiw6+MJUaVgufHL38Oui+XlamNR7vds0OkJUFgpBFdCtqsL/k7NjqHH/XfSKkZmo
         K+h6VwGldvXFs0Yc2V/AkBUGjM7UlL7RpB9g1GLphurJDDYIJ+lkmdSej9bovvK9niQU
         YqFMH6XXYXPASwyZf96vsgCUiovrOa1bHltCSqdyKVaMb9LXSp++gE97IlcWtndWUIok
         9+vY2QWNTrFPfImawhvt3XBaM3DA3IkdyW5LT6JHnnf+32y65jtKO+JUduMl+Ev+mXmd
         HcfttKsanEBjxfJ+tV6n/JemIlz8KfS7wij3DNGa6RThACGXYLsDaRyfCAhNFfezftqv
         4FLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vCLaDxJTvic5a6eu6i8PyS2B0rw8U286RI8yG0wvAF8=;
        fh=3bWeNTR6WM3DcWNF5nBwx7SUco1cNXCkRzgXgJPQ+CI=;
        b=JgIAEPfmb1jfZyjjKJXuj5SBKiE4Xx40LJu2r/zwtp9ofONtrGaDe2FR7LCn2SBY2r
         dI5gfjFFQkyCFa8GclJnQNcGSaLhoLJOiWDfab9+JpD8EE45OFCXF34oS1fHIvVPkMJJ
         li9MQr2wkJRAxWv3myEnAeaXIqrbxCzBHGanwp3h2LDcqp4y/maeDxDIgh1WoyGRmUAr
         D9qMHqGxldePh6tSRkJhIGuHJ7bVPEnNEPjK3T58uM3vKkon2HnAeaC9i8G1dkjJGXbr
         ukOoa/ELcx5RX4cJl3uFP6iISZp1hBiMGoIxe5LDKxQxrq14MgqQMQOTD0glFMTubWkr
         EHFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792143470; x=1792748270; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCLaDxJTvic5a6eu6i8PyS2B0rw8U286RI8yG0wvAF8=;
        b=g21dieDM/hmtPcZooHRZqqd7tXcXv43J8LFgYm04u94lM1AARReVujmj71n3fOfGVp
         X6oP7wROILEPS0BGB/YcvQKmy4/PV8MjzEkNzEr4B3blBiwK2HaR/nWqewZrV2f1fqb+
         9cxO4ZqjrT+mVN1gNVq5ZXIFNngXktiLDGIug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143470; x=1792748270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vCLaDxJTvic5a6eu6i8PyS2B0rw8U286RI8yG0wvAF8=;
        b=ZZYCaaWSPkMz6RZ0sxf9zdXHAGPtQtOj14O7e/kyx4MhjjHnBfZwjIiSBVNNdbrmiZ
         hRW27Gf9RCiMPrYQDVyX84F6nJt6xYThwCE90R5q9p8+hR/hxbWNCjjr4GgWjnt6g8rM
         5dqk24Nh6euOmWq17+KpQDNzjzFZjgANX6w8d3/MdKDkgesZGKsbUj8y18rezus7fPSu
         1x5kVX7wd9Ie5PJ02Nm7f0uWF3RyEN193q1f5JUpEmw8p4qBYLFmBzmIjTXOGmcWYr4l
         8aiT+mvc64+SG4lh2xU2yYt0PqynJ/4VekgUkd97M1eXBh5zyeOglGWmCgCjpiWVb19r
         fCFw==
X-Forwarded-Encrypted: i=1; AKwUvByCCWwRKzCx5jHxIZn0+/qF68Fh1GbuLWbgaygLGFEeIDNL2tX+8caW4Tk7o3DGjd6p+rnLe/qirO0iuvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdKiIyM/5go32JE1RnlFZmiMnta9YJNVpVccGEg/imMikHlZot
	PBbcmiIwPJSt/cApdnqtE8LT0xm4dFx3jRxW3uhqvYfsCr9uBSNHzTa6Uug0PDYB5SJtzmvguHj
	EOXWy9yK9Lsmjo3QNrL+yzLMgpWBlTTuFxMBYRiXqow==
X-Gm-Gg: AYBFou1L8Bblzm13OOfpoieFQDtCtUvaULa90LgiAdWULyn7k7MRTdpvGzcoDmcz9MH
	i2Mg4rTQVb/iMsPwKrH9D4tqboP5Saz+6GLpXdnV3taH8diBHNQ9FPyApcd0bawLJnAigjPnKPm
	3zWReFUtlFpUZEj2Jm+7JZ7nRB+2mocCtbdAcC+DBwPLRoymuBepx4GubTpiPihC4CjRyLdWz0M
	Mbjm0HwUj7hAm5jq1UcEtp5URUB+63xGnK38eqdtbxUdKo/mv1Ktu3063mqDuKJdb9ytnPkwVZU
	RNzxNWohKaofFDJlRHUVyYFxsrZRDjBEQ+vEuhUlWhS+VhTKs7ZxBl1IKCoFlQ0Hwk1HXgVGjqO
	vi4ZYYYsbgKAOwoVZUw==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id
 a92af1059eb24-16a5eb5248bmr26677656c88.19.1792143469725; Fri, 16 Oct 2026
 02:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929032927.1451259-1-neilb@ownmail.net> <20260929032927.1451259-2-neilb@ownmail.net>
In-Reply-To: <20260929032927.1451259-2-neilb@ownmail.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:37:36 +0200
X-Gm-Features: AclHuK90baevLdZyUbmceJ73OjlsJVPDiUN_j3whqpwfuH99OUIsIo6LPDruDMI
Message-ID: <CAJfpegsUg7E62ixTrb1UJ+mFW4sKLV3pNmL7ouWSJBC_W6bFkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: don't d_drop() before d_splice_alias()
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 05:29, NeilBrown <neilb@ownmail.net> wrote:

> d_splice_alias() now works on hashed dentries so the d_drop() isn't
> needed.  Drop it.

Applied, thanks.

Miklos

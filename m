Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129623AFAE1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155713; cv=pass; b=PxrehDrzWi0qNbOLNDxwXf5MEgfPL7CYV25i+/O8HbwrvKk8y8pxLygC/i6Jdt2WHZ7CJGyZGyTZ3eBsEtr5cSAEtDcB51EVRhQWoU3hnPLtP9HmMhekIVoibe93L9EXANU7/VxVHOH/5s8gZe2cvfS9BSRo60AWpaj2iV/ClW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155713; c=relaxed/simple;
	bh=avFXt2NwZSaJmZTlq/99ONsB7S23gzDNnpMAoXMT6+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMo2bdELig/8WEoWjG+JtlMai5NsJJLPnu2WJcjQqAZGCAt+2LG6etnVjwJLw/HZ14da/BmxRQPuzKwif21KhFLdBqgi4YpZD/rO/7Cg8iwKdkZ3KyL3oQ/IKuXxhzw4B0sJ75BtMos9Rdndczfr6s6eSoVyKg4R2RQPOBJWCbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H55fAUK5; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H55fAUK5"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso27215001fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788155710; cv=none;
        d=google.com; s=arc-20260327;
        b=agZp4gvnaOLgkwX0dhCcGP145ltY5gKoB4vS76eXPLpsNKkjVhREAsMsuUEuEXSltu
         3HkBhBqbmOLJiCCbfkeMw4CEUz7FZKvL98Iti+MT4LBhN+kNwEY+2YMvUyWo5AE4d7XX
         Ym6RephTwex36AMUUGdDHAF9KxZKOEoJ0PS/6ozImHqrt0mI/HDXuR1vQCcldP/aJxnH
         cXrlzq570Q+c0tVzVbkXa2HPDm6af/WlJp7/WKRopiHY3ngbqbzDgX8ExAlY+1BdR4dH
         7jl/IsG/znOMhqpOIy8sd21X5+UQsg7QFHpxJNfZTxZRbOvfCSNGIpksfyIAr9rrpB/x
         SxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7sLw2AeV2P6KNEKrsx6930m88AgTvdoPZQBUw+YeVAs=;
        fh=oQ+Jvq6OP8QWeQRp80Me8tdlvEsS8mXwzXIOs/L5J20=;
        b=NUbKmxlFDq/qYwCi/c2MagVH2w+gTnFOBp3woX6KvuuSy1h8RFu9VFzkxr412WkEvJ
         Yqs/zySJZLbVXHOS8+zHX1LhtSjhItl9UjiO7pUFJyo/kPRTMIYYe12j/cWV1mNefJ4k
         WU6tgsxNVkPqirjuxDTzUT4ZRzM8g4/D5u9XVFHqxZoSyXBgCizTW6S9fuZPrOaQzBg/
         8JVBHT9YObBrdUqclPXby5wGH8NlciQC2RSxb12/NkpSbBtc16W4PDOoCUQON2Q94YkU
         hbmv0QxB7TR1yBuARlqyjikEzQgVeS0Hn96wnBr5DwA9M6e3FeJLA1TjYB/aZErPSjCt
         5SBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155710; x=1788760510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sLw2AeV2P6KNEKrsx6930m88AgTvdoPZQBUw+YeVAs=;
        b=H55fAUK5hkK6c9NN+g31qhVSnq5HfyGnNKZgu5I8gEBjXDsUDhiru9/OqBdTZWeG/W
         +dGcqAIMYJ+gDxV1KdkoISP4Q6zuzMicaKL4FOBEKTvyXQpT4NsVnWLOaVeAsblBBhTE
         28SrqwqLUyoAgQKF/DlwosFzYr6yyDAUs+ucjM2gXKTPeINtaAvfEkKWJw/P2N8E/7sw
         c/ay4Tkbcc5wb0ewEuhVO4OY5ntmMXiF4QytF68wbxeu342HDuV4OiM7FYrn616XeKtb
         yJEFG2nfIUSiwcNBOgqB3zHol0Gh/VdaJ69vK0v3YIzSqe1x9LROuNlaE4sTdzbBBLb9
         DVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155710; x=1788760510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sLw2AeV2P6KNEKrsx6930m88AgTvdoPZQBUw+YeVAs=;
        b=S8Jno0WeYTUtyIHk9AbW5hXVYpl8WOkfZY2dT6pL+kp+O0JWwN0g9uUWIxWQ8MflNK
         CJIU0LIyk4WsdArZlA0IK0qPYOlV8HhIAyZlKFj96Ng5UCZtgFFqpYGjlGV1EbR8FF6R
         aF9QPoOI//gIIvXiZ6BBXDgKylldzg3XFnQhgTX5R2G6qDNrg6jnW4hoF3bGucxXUDYM
         tavm/uwn9YqmikgeWHt4fs5/NZf/6HQhhXVc/No9M5yNY78bFZu8hooueXIxNQinIQkn
         P9ENMDcnEeq7mmGfBY7qEIarEgf/eHrU7wRyI81Jy27jtob3jaDqVS0gJWX5MCfq//s/
         PvdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3RWJxpvTliaQSO1NfJWqGjER7oMQwbaqFkPqHGruxomqiLMnRye3oIidJrVAjPznI6gLZbIu43zo0ScI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNxt84T4m6ld32IFURbxD3Vd0v7HpEnomJi1eDQsBwNDGVZy++
	AlzKWApXEKWny0J6J/6AQop7+dI64TcvTpXAjU53R0QV2V6Zzuyd4gN57wpATl/FxTIhcAcbEoL
	uAvVea1QhIOJbvdF6C3TiomqAkzvKqyk=
X-Gm-Gg: AYBFou2VH6F64uJy3CoQjvSvK4NeTRbxhnNVsOtgsqan9RmljofywIZVywi0lah9LR7
	JChqkNc2rILsKy7InZ+npJJgVNB6V0UvDw4naRsuSVyaRfxS8QDXzuf8onKEHvZP1badhzadnNK
	i2Lofcd7WiozEqDb7aGDUuuJukHcBFdYPS1ODP8nsqZsay0ugpLDa0PioKm2zeBqxKAmPBcy1fN
	HFFs6fQJc0x8/333R9vtxRcHnyoqzbFpSvrghPM+Qd1r1fHsLGrhoOqdYKLJLzmxyIhi1BI5x6K
	p4TNVJKP1/YCZJhd7N4sTkoI5s5sj6ifamPNvHOnAH8j
X-Received: by 2002:a05:651c:1117:20b0:3a2:522:c75 with SMTP id
 38308e7fff4ca-3a301acf03bmr40336271fa.4.1788155709731; Sun, 30 Aug 2026
 22:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828061607.240845-1-zenghongling@kylinos.cn>
In-Reply-To: <20260828061607.240845-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 31 Aug 2026 14:54:57 +0900
X-Gm-Features: AcwNN1Vq8QdxtrNHIaWYU8Wnk45GDQtB2EcUMzJdPzNM04Z_J89xYwtm8Deytzk
Message-ID: <CANFS6bbkTT1eXQ0DC5Xi1NW8LFv91Dv78ebg-nXecAZ-v1OLWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ntfs: take invalidate_lock in ntfs_setattr_size()
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 28=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:16, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> ntfs_setattr_size() updates i_size and resizes the on-disk attribute
> without holding mapping->invalidate_lock.  Page faults take the lock
> shared, so a fault racing the resize can resolve a VCN against the
> transient runlist state of ntfs_non_resident_attr_expand() and fail
> with a spurious SIGBUS, and can interleave with the size-change
> epilogue (truncate_pagecache(), i_size_write(),
> pagecache_isize_extended()).
>
> Take invalidate_lock exclusively around the whole resize after
> inode_dio_wait(), matching the fallocate path and other filesystems
> such as xfs, which wraps truncate in its mmaplock (=3D invalidate_lock).
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

--=20
Thanks,
Hyunchul

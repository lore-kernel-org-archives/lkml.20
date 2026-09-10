Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B833BFE50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021358; cv=pass; b=b3FE6aNlpvhtvKkXeZy6lGSKZfdFBOy0Myj/cwbzbPdFjo52QtrCNfnRkluv75kWVlkh4NaOHlTVfnrowEGIRbxQNu2qgvwWAHRMK8SZtzIaYIGIU9sX3SuaDsXO1pbCfg/ln6TVDVUiroEXom3+fsH4yJey15juFESk2mtiYvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021358; c=relaxed/simple;
	bh=Npr5xBNM8mmEGyjVYurTS1oA81vQ9Wr3AxigeB1wQ6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpmoTq7HsAVmAMjXWLwUarnOhUBpEwXNQ3B+mS0g3sYMdyWKp2X1MSQH+TL4wS7NyyLCPbeqpkCpz0KUQ715f3WEOwyGzrYM7NEdPj0Cd+k0+E2SfX+4+AOzW0igjgSi0piRuO46hZfux6ZrfqqKrMz5znU8AY580zHnEbs4g0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/evHftU; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/evHftU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1824516a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021356; cv=none;
        d=google.com; s=arc-20260327;
        b=Uw732RkEzlo0f3CxzHRw6LunxZv35KGWVEwXoGnqlFz7JNeyHkvuC0ilkWO2htCk4M
         LNjdomap2jBe6oI07W6UT51hXpU4D+d9vhjb1AjuKLHpoWd1oIL4iMsQH5O6AcGP19Fj
         MsX3jIdV405kKUiH/VLmvelwrA1RHgBdPdDp//VWZ4Q2ktA6Gr5dkz2BXbnFevULWLVy
         /ZXufvmTXs4ylgABJG/AH7i8fhQLhMyhdfkoUgzmUAR0vlC9dV2A0VufPhbeqN1k5/I0
         Sz2ZGTCKmVoUKVrpTPTRi0lHTIt68KokWRAbVm1HD/XOju8xtcpx65NQMp5XwxLEf/wq
         6Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=;
        fh=A0KJur8mBwItaDuOU4qV26wXxnGZqNBEDcqPHNI62cs=;
        b=G5+jUuIyjxn5uc3vHrFq9ZGJhEztUkGFFiwp6qgTpbxZ3ohuvHStI3EVRJ1K5OBzts
         PD71QKAburD231MjbO53BM0G1CG/bMSRzTyX6WoaisUHLKVm5Zmiwj9HHrqY7trJKu/z
         XeMzID3f0kmMDiCbMd5E+zZ0He5f7YI6GZwZNQg6/ji+hGpa9WuOEsag46qr/UCpc0Ra
         Jvm2vAK/draI1THRpXoFR1Nf9o54Xp/bHemnAkQN9piX7fhWZ7XJ5f2JfCxBV2hJZJNM
         B976QC3kgql6nb0GzagYBjGdi4Qa4f7OEFmgwdmiGatTNLshMg+4W5kJeKxHHKgZkPDg
         KKOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021356; x=1789626156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=;
        b=X/evHftUcINrM4xrnadCEoxkWPgRt5zQDH/tNdl4gwc7GSdc73njxrLKRUsTudNLDE
         lbofoZDHl+LM7TEKwUgsbpK+Nphet30Pm7E+PeZzIFHnkdd2GJnpzOzE9RBZHSuhOwX/
         ZhZvPT+KSO56YeQ7EXmGFvjfG4DNmSJF8ETYri9C12tzXhwtU81Z0Uk7FB3Iw965V2OP
         XZCgLI3vAf/LnKgYyf1FOCTZGODz2V3FD5mAZVH/ZdUa2rkeS5e5jgvj3t5iheO0u1pd
         FbFR6KliNdX4stJ8IICe14Rt1Ts43CFRSH1ympP7rNdCmDXl7qwpTlM8unfNtyXEYrgf
         bLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021356; x=1789626156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=;
        b=ahC5jysMFd/nbjKKgwItWVel7DMixkI2Or241H97z0XfKIvIXlQ0WPcTLw0pdu3+n9
         5STssuiMzxaeLgij94VkZI9d96IhJMyBrCQhoW8o7Rn3oJYtg8cFD0iX9OjE9xb3Hxbh
         hOsg5Hs8D3rlCxZNGsm06B+mCsvXR+pkcZ9YczlFApoASxrAzPtkxIWU1iWlVWJVyO8h
         Slgt12B+qa8mFuYmmNJV1tkC7KWCJHxhjBkjG6i/GvJmcJU5bWCYDgVkmRcT1p7EK2Vm
         R5xpfN9uit//8P1HIxD8Gc4fLNbofZd0t0UAPpXH3Nz7FPEqtcTQDxdMWxX4c5ZLyPNl
         bPvw==
X-Forwarded-Encrypted: i=1; AKwUvBynPUHrhrRnkHSHUINGCZz8YvRObCPCNiVfDYljC9fDSdGXCGUUdyh7H5SF/gfZOJ3UQTOQ9EQeEo0tzBo=@vger.kernel.org
X-Gm-Message-State: AFuF++loJaN3frBOP5q9mJYnEd3shSJ2s1NyaLRO477W0pTAQM0c7QAX
	YrYYWeAp3fcC2gfEmppYi8Dti0dKN6IXcNRTNbFVV28AkAqF3GIF/1EdzncPdsP6+Y1eCFFOP5J
	d50b86DTwr0a/DwX+C5j7ZUINsfPEvGY=
X-Gm-Gg: AYBFou0HSAdf006njOgs1iJPMaSEmn12+kr9MBgsbjwKE4t5BiT43LbvNrshlaTrsoy
	h1UhZzUkhLk7jjtmA5KsCwfYKShSPKhj0IeCE6RUoHVubEjyjBW0uMSSPSRGMuyRU+kbIPDd5yH
	7cUXdmUF9joBdy4OhcTIX51Fid8NJ1Cv+YcX3zm8ZeU5CexJOCODZGyYvTc59WriWapjCqWX6Uy
	Bs3OxSk/Ou4aH00HGky1KXGRssefCxbTX+Cqws9dQs4eJWFzdXUOvp8zUyNoEJEGyUyn36VHCE5
	pUbwd9Irta2Dgev+JMcnjmGS/yCkBVz+A3s5QZ8FuRCphV5BsmbCeu/FYJRoJuIw8v2J2hd/pEi
	+6xiy3Sa3zd6ZSzaN2F5V/4xglCeM3aDW1AHXzy5LSQ0/tAfw5uT115oEnWOHX5SO4II=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id
 98e67ed59e1d1-39bac3c452dmr16420821a91.18.1789021355888; Wed, 09 Sep 2026
 23:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909045450.16176-4-phucduc.bui@gmail.com> <178901787314.219967.14642070814356568514@kernel.org>
In-Reply-To: <178901787314.219967.14642070814356568514@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 10 Sep 2026 13:22:24 +0700
X-Gm-Features: AcwNN1WuPv7sSiyeJm2_sYNBm74wkTy0S0_3POKTQUNGnsRp5EnocmR5Vn7LaC0
Message-ID: <CAABR9nEGBohTLYGh9N7z5u2hMAwY3ZpU+zTpxi4_imLat8PgBA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: xilinx: axienet: Fix IRQ error handling
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	horms@kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 (2) =C2=B7 Low: 0
>
> - [Medium] Understated impact / missing Fixes: tag.
>

I've seen different opinions regarding the use of Fixes: tags in some
of my patches,
so I left the tag out to avoid unnecessary discussion.
In fact, some of my other patches did not have a Fixes: tag but were
still picked up for stable later.

So I think this is ultimately up to the maintainer's assessment.

> Pre-existing issues:
> - [Medium] DT binding and driver disagree on the ethernet-node
>   `interrupts` list.
> - [Medium] IRQ mapping leaked on probe error paths.
>

This is a pre-existing issue, unrelated to this patch. I'll keep this
patch's scope as is.

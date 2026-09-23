Received: from mail-vs2-f27.google.com (mail-vs2-f27.google.com [74.125.227.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C058413D69
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185309; cv=pass; b=re7qghTCaWjigF14Q8t5ToOw1GfeWoUVz7RcFg52hmaALeTatQ2uQG4m8+GLD1gPpiHP0ACJyUBhNf5I6UH7ZKHD9gM7Kw88O0G6HOtDeTkCWqZ00d1VckZxXBMHqKhl5OfineQ9u1O5eaqjqKer1yju0EgcD7buj5dV/Lf1FbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185309; c=relaxed/simple;
	bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqbnu8V2NIhHIY8tqbUhKM9YA4DplO7WicxL1nYntb5ROKqsohnNuuwpp7n+BWxYWJbuosEGdQtZPmJph4Y2VSvwdZaQ6nj5tg1uKT+jorQsvxm413lLI3LF8F+g0Q45Sba+cmODLqvgVp9YHahfAQXRoaeZLIzdWVTNOc/h1YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=pass smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b=XbqwyzBO; arc=pass smtp.client-ip=74.125.227.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b="XbqwyzBO"
Received: by mail-vs2-f27.google.com with SMTP id 71dfb90a1353d-5c963d7503fso510686e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790185307; cv=none;
        d=google.com; s=arc-20260327;
        b=W3G88DMcjmwIlbSlY049M2uUZ1BYuTM4IvXXqJYEmqD7cWmUMWGLVPCEZWsaXKr4GF
         fI9KW33arkAdsKuXozUaRWlDSiUwqZecjtDc69x1VAiTrOCnsw0tCaIsQRO33a21u29R
         +nKACnA1zWUrITkg3otaBYluon8tI8/0i9oUlhv1ae6044RG1wEKN5pvjjPnJE5nbvWW
         z8pTfb/4l24l9JYKJeC9SBa+A5LBv4lQSOxbEjXxQGBkUH4scXAGlfagOUEnpyaIO40C
         Dt2Bcoc6BBBZO3lmKMrnFqkgv+wfth7rc5icTPBzfhjt62qbNyUyGBMNKDvQCfmT4AN+
         wAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
        fh=I1Z3+fG5o+el4RTuBZ+g1jgww8QbBas9QRsUf6fkL1g=;
        b=KoB4VNtp5/3zIFNIfQ/mdfqwCVSIhiQfsT0aFeGLGYI9lHYkDhrdmS71xSQsQggIkw
         S4YJGvgOC3T0Z6gaTTxzAVowVpNglhSuxLuZTMvsZm0BoCZVoX8U0oPXf2Ffc/gUZ7pa
         VbQU80bLo3ps91X/Om9xVe2V3bL7CHOwiKgJWRogj+XS8+e3LicEbNMwBtaEPNZ3SHhz
         m+Z1W/GgyvvnLpdUvBx5cZXg/5jWwuzjaWk+8phqw+rtPSEzQo5How2zCjAW4LQl+Xyl
         HUSAYUwpE6NodL2daRV0mx/SB+JraEelePWGucZWwavtFHJmY8C0wt7RQLCEj9eHptUF
         +w6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks.com; s=google; t=1790185307; x=1790790107; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
        b=XbqwyzBO580wnwSqu1bce/6Bu7P0NuoV8UcknY8G8wgjWYDJzy8WJFPYKSAvR5WLNN
         SqrYwX/vHaHnCxWbP4Ex5w22EI8A0pyLqJQNBsZdFLomS9iqC5VCddJE/fPNmlZDNhDM
         +2Ue5+9yYvHCksv/eRB7xr59f+5m4qTTqDjfZOhvu9JVdCumdDupcdokUjLxYhBPjHS9
         XrDYAkaI+aAkaw0VYacR0l1a5k93WLyl79yINDtUn94ttjq78d/JhMcYe1OXsBpjYeAr
         sHZ1u89SuJ6QPi7YkRW3h/8fm2u5Ukrxs76FAr2lGNW4yWn5FW1Ll+zORPHUolQ3BJC9
         Abxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185307; x=1790790107;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
        b=CqkqYlfotPwMHYpPLCXxdRZSxoNBpwua5V6LYHEQdJqT5eDQqaxyGdSNi6emQyHaI8
         +Eb7IDgWcEVOWiv7IMnsPOHEH9Jjh1kBQ+iENmBGgx1EgqpI2oerHAwj2ai9Ft2org7i
         OIxNcEdN2WujgKblqa60uLFynvSKhmTC46O5STMaJ3oOvkUnwFf7RO6TYmbTDBgeSRlg
         g2HnTGm4vcsxju/8VrIDLbqzS92T4KmTfVoiBV5PwPOrEk/P2V71QjryY4vyGAC5AMmj
         UUkNJ3w6NdWf1LxNh7P8c8cXkKeqpqcQtGoUQmPZ+fPuTz5U/KkswEFRq5p937oVK7zA
         PLgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvGoXDH6YhpIhZFcpmjyJOQJyt/jQMUbyLzLNx/hY2iZU21D+7GX5WkaQhOGKniDwKFGuu1vileENGRek=@vger.kernel.org
X-Gm-Message-State: AFuF++m2NWeD/DERVMtyOh8VrtdTJIdtj0v8HCchPsUCrjNsCEZL+Ihy
	MNS23mJQK0Qwvkeht1yU5RUXQxD6sGtJrfUb1chBvrTlERG99QrJkG6N8Vwr+J5/83nOF5oGXw+
	XZxW7TJdeki2U20UqRAQSpHw6l/AQHwKOQ/agsxUucQ==
X-Gm-Gg: AYBFou0TXgoNn4O8lGvsFQklhIJ0MvzGKvB4AdZaewUXRlfBWuMFsb71r/ElsC2zAXQ
	kRtNweVXcJ4/TNu+PqF2nKXiAt6NT9n9KXwSaYBtyX5KW24RRZHwedF4tl4op0pjzrFmehrPQBc
	13aPiAHGDPVbal2x3uKttru3EkhOLmes7dVAWakpQugsU2sUepF7xEg2DoQP+CpOL328ut2fENi
	UQsTgJhL20/jEVdkUA3mCU0TsjzNh4pJ6tjb7JciGKabx1CI/v/e7HIRxVE2RarAWnaVgRClw1Y
	9FVkwHYsBCFBNDK+zeBcBMf/y20W/hZgnk7xpTkS878l8Akbaj3UFQ/vVZfj0l4N2A==
X-Received: by 2002:a05:6122:2207:b0:5c9:a60b:e5d6 with SMTP id
 71dfb90a1353d-5c9f167b9e1mr4151746e0c.16.1790185307262; Wed, 23 Sep 2026
 10:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912180643.1426488-1-main.kalliope@gmail.com>
In-Reply-To: <20260912180643.1426488-1-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Wed, 23 Sep 2026 19:41:36 +0200
X-Gm-Features: AclHuK_YVE_M0LMnByAXkUpK3TPaTMcOIBWbPB_vF5KvqXaURtUamsR22WrjU-Q
Message-ID: <CAM1=_QSGvyph2hUcf4xD0gkNeVN5vM-ragecigyy0dGpr3ZU_A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] bpf, mips: Add BPF_MEMSX support to the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> An out-of-tree
> fixture strengthens the signed/unsigned load comparisons and adds negative
> and sign-clear loads with dst == src.

Consider adding this to the test_bpf suite.

Tested together with the other MIPS BPF JIT series and fixes. See
https://lore.kernel.org/bpf/CAM1=_QTjcyMtMLawSFnCt2c5wJJ-if40GSfo+o-CoZqcgx5wYQ@mail.gmail.com/
for test setup and results.

Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan

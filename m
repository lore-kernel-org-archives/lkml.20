Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5AF36E48B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329841; cv=pass; b=LbT0f7qZzZ580L8u0Y/9lVYh50i7IwpI4wZDBoPKnDi4PAy5688VJvg/tw/AYqFGAgQ0DOayZfWClQymqcKajm5d0Sxhu+cuirEnIntiVeOAVA0dzrrifKofvh6Tn48keCP+PfZd84O37fCGxC1/ZVqbBVtowayphfXFGie3P3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329841; c=relaxed/simple;
	bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fg5pO6cItzFeQJPOk0uz1qtAmVAxoOX7yBxor0dr/harJXP1vfPtzQ7KMxxVSugYcih3hr0gR7QNODB2L+VreUJoj6Ja2/RgFCaJbB464RptMCp2mYcsZ+6lHaYXh2KcYiwZ0ENeeYCUl+HsPOB0EkyMhT3p8vGZQKgDKQy1gik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/Q/Ctz6; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/Q/Ctz6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1127153a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788329838; cv=none;
        d=google.com; s=arc-20260327;
        b=CTBCNMHhbnJPbIBJNBvjDV4ODJwUT1wo+7JUdEW2JFZOneq0m98zVgNFcBadTEdKSa
         qTSCUgn2S3QBjZUQfYIOG1E8t8daX+5UzfFiCAbagYgdWbS4rz9dcNEhD/pCeS9UuSFu
         SQJrdmxjl6opfEY2j6ui/ylbm9/ias2B2GlMgMTpHDoiialxgfXW/469w/WCVewHHrEa
         irEsydgNu+plWRcKouDV8XhMFJb37CWPwVYZSjJMm9ui774DNRPYk/Hl53XvxtFePJSX
         4PFJU2xZNmnkeMCLzuD6jInHLxS2pWjiHP53Mdtxas2FQ6sPO1eLUycl6MyB8rNpmDu/
         0mkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
        fh=tkQlSq0T/a4gWjbPjBpy5geq/C/dR6o2RbEmrt6ZyX4=;
        b=h9MoYR3BZMdd1jGgdM3kiHWGh53cIEdpp4ZaOIyeI99ySjKfO9PARKo+GqraCvmNah
         6E5E4HxJp7cIZUMeHmMwH9isUSUCzTjIxLbzXoooP+PLZ/4wXk8w+3eIswQjYHo3qevw
         Ak4ggAyJUqnasZQXYz4TjJ0bK1q/ZUFktpgfv2uPseSfOnvPMa+YZ5lw475AyvL3gI6Z
         y9PlVSCleIYkJ9gWY54OaHyenrpGHOvYL2Bla50Xz+eV67bh/VNLey1aKShyprsuUkJj
         V1UoNL5o6lP6joPWvOtvg86kisDVl0dVq8aor12GHT/wSJzGJI0Ky9X4K6esNdULeKu+
         X1kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788329838; x=1788934638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
        b=D/Q/Ctz6poVKiOIWjOL9kyluA0opf43BI3EGxQI/jSoOYyxNhdITVsdcpWWE59XzHS
         83QUkgo5n9Ew/jVvkkHkDlcGZeEmQd40NabyO+Yozswdnk7NOFq3vTXZdDAFqzEmRJPR
         gHwZcxA1JI0iSAo4g1HgqmNUeIFjs1p3HLT9d0z0bYKohrtWXsQeCT2vKPVJuaNMooZ6
         BPIeDche9FVqGv59d9b60qZqSzJiPhThFv3uPP53PzFnzt3mvemA9+ez9QpIWtUsKZeN
         pGvWg133ygjvW1BXUbZJH09tv2UwYb9aEfHLlgHzfxPjliWwxyqOWRiGk897aZzCcjB1
         Is+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329838; x=1788934638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j3td7v5wxG8neXJQDCf2nWFgrTb+LYj2ojmXpsmKeE=;
        b=nTGbQTCWDX4HzPZnFG30wsck9HNTEiTro3e4/635q2Z/QBeNBH+7Nh4A1fogJoj6Qk
         oCD99Q06tiPevU0o9Dx5Qb2PFd+4+rsGVHAsbjr3mQywD1dGncj6tb2sO5XscjoesqeX
         D8H+OQGeI+U0b0msNczQqxc9fSBgEZ+UTXOXgZ74qi5cIIxy6XLZMHTzYn8oJOdCoVRL
         U/biuRkpPYy60+IHgrURI9K6N7K7SktItLDXv2mHkIREO7nEF5pc341yjdAQMGKMCaBv
         dvnGM/6Jrp4Ln1GQz53MGan5rW5p1sqPcrZp1/l/qLou1w65tOhIMeiiwZpO4z5N+c0j
         xQCg==
X-Forwarded-Encrypted: i=1; AKwUvBx76jeBnbcKwgud5SzEvrGhSiyJSAp0O07eiKqSGUnd3pyfEXP4w/n3bTH6wx1/Ma17OfaTDasdHhNorfM=@vger.kernel.org
X-Gm-Message-State: AFuF++nCA3rnU81dERnkjeL2KkRoAV/wgU/zJH/QyNrWK5/afVbSVMxT
	UMMyHRUmrdxKdpdsuIHpkJ5iE46oejhsQy9IT7GXAPTpmZCHNSWwFY+g5K/5FDi/RrZMVt3ILxQ
	GG4VaZ1ySwIUTywmLto6IKA6cpdThPfg=
X-Gm-Gg: AYBFou1dWgk6OJdVt3efOFwfOjc4u+QaWz7tlImWVlPnMD82yJTHNhZy3TI7JX19edH
	mdC9OoiMnnKu8VtvNQov5rjDNdh4YKGlJasONkkr1Z/gtYUZTbts9fC+V5SSLqvGzvNfMGJ6ZEq
	q4hyj/oMycEwDiqSoC9TH0atlbvHpWTB8VVV3UyDaBIOa6D/kpDiZvQs+4DzO6jiw3+sS45wIAe
	nIqrN238EbIKphwz9/rEmMgzmYzVmk5kRS8tHwPlSlJwYpnT2sOYE9dIxKj6DdaIl7s3RD3yvqG
	OWFucJcRGvIhyH3jzLUsvUhKRr766UYjPtraow3AeWV1XOFZNBvSxhNqiyAIEGyFbGhwiE7gWj/
	Ts5UG/Q1Y5VKTU5DeuvBtDi4Hc7LxKZg=
X-Received: by 2002:a05:6402:448d:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6a68316aa76mr1514950a12.8.1788329838070; Tue, 01 Sep 2026
 23:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <bb81b54cdc536e3ae12b27b477d1299bacea9577.1788277742.git.mattst88@gmail.com>
In-Reply-To: <bb81b54cdc536e3ae12b27b477d1299bacea9577.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 08:17:06 +0200
X-Gm-Features: AcwNN1Xg-WyM-tYp_hd4EfI05lmCaEjRGIsdt2nb8QdlyNFL9Xm9i8YisuChGTk
Message-ID: <CA+=Fv5SKm_4htOVPhFASQLzf0VYsj2_K2GWz4_=LNWWbHQdhng@mail.gmail.com>
Subject: Re: [PATCH 07/24] alpha: select ARCH_SUPPORTS_ATOMIC_RMW
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
> provide atomic read-modify-write capability, and already selects
> ARCH_HAVE_NMI_SAFE_CMPXCHG.
>
> Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
> RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
> locks rather than immediately sleeping.
>

I tested this on an AlphaServer ES40 with four CPUs and
CONFIG_PROVE_LOCKING=3Dy, CONFIG_DEBUG_MUTEXES=3Dy, and
CONFIG_DEBUG_RWSEMS=3Dy.

Both the mutex_lock and rwsem_lock locktorture tests completed
successfully under contention across all four CPUs.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus

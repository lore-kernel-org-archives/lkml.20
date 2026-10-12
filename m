Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C873F5BEC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813566; cv=none; b=YE4sfHWk86wxO49DvU5Z6Em/Mm1b8+AD3WxMXEkc7mTEYSVCBcwmBq0QUUF0JGFgxOGxLVTXRsJbtmH9VgVIOs4zRuelq5sVhpLACdKkYXuT5V7BTehREAhfp9UUIJwp1SFTKh48cV/BX1/L9oXjHb5/qvm64PIePKNaK70gs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813566; c=relaxed/simple;
	bh=pWTSTX0GSPdxaZvzMxPH636vuYSYn1S37Hd7tEchJtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4EqEpWiNc5/+cCSBRbevlcOlBu5qoxnnb7661NdKtl5Po5ylv+iN41yJqaBr92IKR0UDxjTkR5Y5tww1VnAQry2THDNxy5A4zbY1aD/BdMcZ/c4bmKE7bVI9RCdWHQxD4xNsyw2lCEDD+iEB3YR8GmFbb/CM31uj/AnHj5tEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsuKPWaM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsuKPWaM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d04e4a943so961195e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813563; x=1792418363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSXHZySapaE2VR/MDamnyHrHMc9ONj9QB+o5hS2C+wg=;
        b=fsuKPWaMljMf98cbVyZfhbk7qxRCwe1wERFKUEOYmBXWUP4DmFpMuh9MtOA+y1S9LO
         46iUPhtomAiTAmCgN2sqDA7K0s+z2lUZn5Pa55291OZdNcboCsAzgFKxNs6h7Xe7Ypat
         Zyn1I+loDXiWeVMQkfcqPtdaQbbEbS2MOev+9jpNwnkRF0jzzeHhpdE5EF67DMwiyf3H
         GBAr3wunnqfCCU/pGMbqMGlMVX8z4Lnlwf0AwCB0CezhuHeTfxosi06PJzJvOS+iiOR/
         wvRWXHswDuJUlgSEjZGo9gcuYQCGjQCNOuBQKblL7QExUOS8LrtUB0Hxayiv84Ok19bR
         Pkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813563; x=1792418363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSXHZySapaE2VR/MDamnyHrHMc9ONj9QB+o5hS2C+wg=;
        b=b7TkHIqM22f49a584aHJfVfn2l/6IadXzN9FnwNxB53GmanxjhP9yeHt6ElNofHInc
         Rzaf9lsRw7LVAGmIny92PJqj9NPA0N+DV9Q/q+aLVwMZxGUhKyca5oi3+oLS3STy6ljN
         N307hCIf2Mc0U9Yc90jCjM0jZZF0iRU+juu/V//S5AAz85Yuv0T8meXuxI2aqKij0WWr
         VtsasGW9qxaSgj8BtTK5OCy7HTBMaxJh68rM24SJJnWVTlA9bPCGwsCtkEIrRtzL5OQ7
         PKTOqhSyWROlvJdYoAWiv9elWXTj5d2FfUfwBcZpDGSeUFB+7ol7BUNSTf29xZBUyH5S
         xnSQ==
X-Forwarded-Encrypted: i=1; AKwUvByt8ssia9s85xKlpKA6NQzGn7889gOLojG/VWLvFMoPeTCEFEwmauGuR1VRW6K5ppfgA7gGUO+8rYFdqqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsGVbyaD0iOG70E3aVLynYM8alkWyr44dQ//88IDaaqLhyKhlF
	hkGZ6NVXdg6RvVxNVu18etqziXjsadOFRJq1lZ1xLg55pteMJaaRdnS4
X-Gm-Gg: AYBFou13/03lUv+iFRMw80q8DZzDk+G9ROLpZfzufKPyhB20lXdOeCqHdATBS/qIa3C
	+8Q+46DB31rzGJphMmWT22unmmQUIcE8cU7eB/dgywl8YhDoH43WdYb7JoFT9I8wvuWND9yPqFr
	y7E/Ar15Pc4IDMvKnG9sFcC6uHjusCtsMHgc7aDAzumKlSFONl1L5sKv/+TO84qsPddYE4iBCi9
	qKHdozcIYMHGPYr7xr42bLWlb4/S1ekipE0PlzP5eXn5x8TPgBdC+SldwpvPJ8qI7XfTzxbwAzJ
	JOQr10g9/GHEX10kegAaRYi2pzN2bBzyGbtLcpYpKI7WeKwa7mzQNd6scD4leIrsqBsvR5r2WG9
	Di29b6qZkwXXei4aO1L2Qg02Mwowa3bcUAIpFgdKDO66i5PZdwWBwREUssPOg0Hv/7RNjzAClx+
	jbtfvMhVJCkdkuHfyQx11KJtxS3dU5ZpDw8XNodteW8Tx5+KhKR3bOuqVveN5A5iqd7rnwhZW1/
	w1sLzx3dsBUhQYDrUwA
X-Received: by 2002:a05:600c:4e45:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a18e47e330mr171917755e9.2.1791813562803;
        Mon, 12 Oct 2026 06:59:22 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm290621675e9.15.2026.10.12.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:59:22 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sh@gentwo.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
Date: Mon, 12 Oct 2026 16:59:19 +0300
Message-ID: <20261012135920.3247-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtC_DjYGmnHuV8x9HEoea87pfrpfNWwHT=sGeSP8UOL2Og@mail.gmail.com>
References: <CAKfTPtC_DjYGmnHuV8x9HEoea87pfrpfNWwHT=sGeSP8UOL2Og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I don't get why you need to a se->rel_vprot and all these changes . If
> we want to ensure that protection will not be re enabled because of
> rescale, we just need the below

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 5c98d8dfce5d..e83836fe44ef 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4951,12 +4951,15 @@ static void reweight_eevdf(struct cfs_rq
> *cfs_rq, struct sched_entity *se,
>         update_load_set(&se->h_load, weight);
> 
>         if (on_rq) {
> -               if (rel_vprot)
> -                       se->vprot += avruntime;
>                 se->deadline += avruntime;
>                 se->rel_deadline = 0;
>                 se->vruntime = avruntime - se->vlag;
> 
> +               if (rel_vprot)
> +                       se->vprot += avruntime;
> +               else if (curr)
> +                       se->vprot = se->vruntime;
> +
>                 if (!curr)
>                         __enqueue_entity(cfs_rq, se);
>                 cfs_rq->h_nr_queued++;

> or the below which is even simpler because vprot, vlag and deadline
> are rescaled with the same ratio but it implies useless div64_long()
> when the protection is already canceled

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 5c98d8dfce5d..5d1b16780b52 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4936,7 +4936,7 @@ static void reweight_eevdf(struct cfs_rq
> *cfs_rq, struct sched_entity *se,
>                 se->vlag = entity_lag(cfs_rq, se, avruntime);
>                 se->deadline -= avruntime;
>                 se->rel_deadline = 1;
> -               if (curr && protect_slice(se)) {
> +               if (curr) {
>                         se->vprot -= avruntime;
>                         rel_vprot = true;
>                 }

Here:

https://lore.kernel.org/all/20261001164609.244156-1-kayracizmeci@gmail.com/
https://lore.kernel.org/all/e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com/

Because on_rq can get false. And alive protection complicates things.
And this diff alone wouldn't work.

IDK what else we could do to fix this both cases cleanly tbh.
But there could be a cleaner way.

Thanks,

Kayra



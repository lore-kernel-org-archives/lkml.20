Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD230E0EE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184372; cv=pass; b=J3DM4JJPL31/EpeJimGhtVCgh6dHlywuK8qfGl3TDgtK49aKhpZJq1NKqGoaNZ/RPFSMoTmNhZy5vMLoDYIMig5orjM+e35olnYQI9vEWratBV5FQapJ8lXc4RQnV/p8unC/o/+pYK/Y+Jy4pMTFUJkcem6e2jirjJS8UNxRz7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184372; c=relaxed/simple;
	bh=0gAlBEipPZBKRrUqwm974maAwlf7zgpPnUeo7CeAfKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIbRfeFnT0nNUWKlhduTVEPcKXQ3J8K7n5FuFCR3v2ZDBRPFLz96izSzvs/3WYkrmLAD8iL2JJZwSyRMxf9MZm235QQnyq/eeRhA0dPOdSo+YWpJbtgA7NtvIm2TzLSo82N/2SET47bvscz1QVnnahj329sm6wHqhWCy2e0u9d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRgVPPQU; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRgVPPQU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so683065a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791184371; cv=none;
        d=google.com; s=arc-20260327;
        b=V/+j+HiWhfp6u5i55hRog+OKfDy7aCYqe21azJLkBD2xeaQi0b/g6WKWhf7xrfrMY6
         jlMxeFC1cy9gtjqIPf7BG+3RoOQbUArKyJK5ckytiO/Tl4o7ow/lVICeWt+4+w58A/Yx
         dP9yJX0DV7eKnbZRrBRbZjZ4UYp1N+L9yDGQKnQznDRx8c02u5l+Lyiof46mdoTNDdWh
         vR6m0sNCxdgQ7K6g4VHTNw0H9Ov4sSNI1ezBmSpFoX/kVjlW0CCSTs4b8LuYeQ+w1WGQ
         PNXb0hY3CvD5fjtRUcD27Ltvwx7cXHLWW/9BAwQgMuRDbUNJyR1iJD8QCCbe7zAZmh9e
         6iTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        fh=igwXfoa0g74+6Noh4tVA6Hmi5Mk5s7XwNMxZlc3Bk0E=;
        b=Bjo0EhfHYfc6Fn5zql871SxaeAmioLzTkQHUq0dzxHAOJp6tT5eMX+QCVOU0/x6Uvz
         xR/litTKvPsrKlXxqct62eAmOPmyVnjJPA9WDxkxQhtvriSBanjzEBJOGEPYA9fUxtB0
         uqf9bvWFpwo9MEcR8dF4yw5RnXGqHKni02rmeY56X7R87j9bUr5567M3uuobr5xwy9Og
         cGU6j4apQ7KS2Aq7Wjfgp/JE/3HGyUI8XJXcHNZMEhhLUmNp+1nC+NuZ/+TnW8xbRaVg
         NydThwqyW398kW4kEM/fTY7JHJ7ZDRtIQ1wk9bUOPZdPEl4seVT1tEcEGRxdLI/4yZcb
         TKJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184371; x=1791789171; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=MRgVPPQUa/00pwkNZJyU+AC/pFVmcKWX68kYKkS/iN0/LnuNqwy+LC4ke5pxjknVzr
         mhkqSnKzfkMytUJ/jyr5bKFmjrX+7qN4RJwVeOrZiXA8Aoh/B2IHHOsjdwrMRJVfUNOj
         Nx8hJy3cOJSY4jNS0uMSHLH78OUNThJZt8sL9zwvytJW5WIbzURG542OwuAbshWT3qEw
         Xu8witYY2zBkl+zlIDsiRtr0ExXzXPwDkLDOGQpwt6nnurw3TFpAwicY7n/4pvsHreEc
         R5pgCExqcEHUTe9f0mo/O6p0U/dLDWqR12dGxk9Q4N/WRM+cMLNTp51M3V3RN4T3omDi
         MMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184371; x=1791789171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=IrlgC4Hj3JAaTBxOb8fMedQ7RV54TAemecnfZHse9zjiVnpDXAKZC/rSdwXvZdZHoi
         yZg2D1wvlQjUMyuvks76xWCUCQ2WvZ7/AWZTwKDNPglfsBtWL4GdVuahq0I5FBuU1/Wf
         a7jTLhnuiY/RWOt197COyFaluhmSRDXVdTaYeffMytev8309EjYH6ZUtt9id2gzjMhky
         jyHGFzA7LRUPIPWqIo9HPkSUa0SKRrFU8BQAtcDmMaWtHDkkChfmCZVvmwyOJgpQOt7d
         PMOIzBeiakRg2vhpBS3diVamjWpIvAvauatVRguh/+lIDoObrwlqDSOVtu4V3UvXNFbN
         NSJg==
X-Forwarded-Encrypted: i=1; AKwUvByK1EMo+eD11GKnV3iWHGAo6jfuv4dbrKjjPK6fMmy3iXo7gD+nJ5eSAswW0QP6jkLNl626szIPJVrw1EQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJj90mLf9lRicnBZRrKLJsnpyg4JdVmZV3O2k2Gh153/3Pk1If
	EWuRO5B18t5G4eGXHwzF3Ns2/krS1VJ1mTh6tYCMp9f4Lde4HHafccEzo31u+1wAhPvY6gA5TXU
	krK18CjOgAD8tBSxLGSdqM2hQqwVYd/I=
X-Gm-Gg: AYBFou0vA2AT4RCXpmaEOGVNgSJVm3agTBvulPKlzIEQ5kCN/dz0uaP5JuORziBECWT
	Ot4ub2UO/O0abfyFLjM/8pSxQCDzKWMiZBoDGe1SclYWqJSdF5r+C0VHiS+5cAbaGxmZ5EawDHw
	RqOD4PFyWSMNXdKsv8i3DByRFJUhyc+2felXiHMVLqmM8B3gc4pLEt1nNQBDlEgHB1YwyyzHp/X
	0EY8QADuVfE/EsE1dbDIovwEGyMZs1//eDuRvPJqJUeV2gvWcNM/5REPWr4kdEs1HzQdfTChtAd
	XqFMVZpeU09RGjrlpV79wox7Wu7uCgtzr+/myLbyEv81WgKU2PsYwAdhBMQqlHqtQD+ckB2PffX
	FL0RQ6BTK8MvA16dUqpGeDc1nU0qB4WhupZx4nWxmHV2VNytvKSNZ2fGDj5Hb9EkKKCxgrWUVjS
	BMJw==
X-Received: by 2002:a17:90b:514e:b0:3a8:10e2:ad05 with SMTP id
 98e67ed59e1d1-3a810e2d610mr1367843a91.50.1791184370925; Mon, 05 Oct 2026
 00:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
In-Reply-To: <asKt42FgsbhSbQUP@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 14:12:38 +0700
X-Gm-Features: AclHuK-Et_fC8GWEQTaTqwFWDt-VY_3yjba5DhCZkN25S8jgTJ6mltQqi4wer9o
Message-ID: <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> > +     ret = snd_pcm_hw_constraint_step(runtime, 0,
> > +                                      SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> > +                                      MT8195_MEMIF_BUFFER_BYTES_ALIGN);
> > +     if (ret)
> > +             goto err_fe_shutdow;
>
> This will return 1 if a new constraint is installed which is not a
> failure.

Do you mean snd_pcm_hw_constraint_integer() rather than
snd_pcm_hw_constraint_step()?

snd_pcm_hw_constraint_step() returns zero on success or a negative
error code on failure,
so it does not return 1 when a new constraint is installed.

snd_pcm_hw_constraint_integer() is also called from
mtk_afe_fe_startup(), and it can
return a positive value when the interval is changed, zero when it is
unchanged,
or a negative error code on failure.

I will change the caller to check for a negative return value:

-------------------------------------------------------
ret = mtk_afe_fe_startup(substream, dai);
if (ret < 0)
        goto err_clk_unprepare;
-------------------------------------------------------

Best regards,
Phuc

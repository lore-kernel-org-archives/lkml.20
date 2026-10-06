Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1313B83EF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285521; cv=pass; b=Oso4nrgnhnyFpeGCrG+632Lyh5o5rk6FxUF3DxyLqlEK5LRvI1A8B1qiHU1gFAY80x693DTFdzJo5d2RhbkO6ZJpheth3W8v55NPsOmS30cRR6+cm7rYESFMbuz8eFtuUsPXq9HI1axfkEgJS2bGOsIif+ZeYmlN7Qc6nReor5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285521; c=relaxed/simple;
	bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enOphT1Umo2ZlUSXrfxOvC96WPBFvKOCTcPEKkigYYjjToY8Wp9C0BWdkBwHyykyp2EYXo1v9ZeivepWw1QKWjuKBVxWRj/+UnqIn5jg3q6xwOVNZR/qc472N0XBg0h//NiByJexyShLvlhf5qG+0f2ZJOalpGeqEsCz1ejFLp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsSn5THz; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsSn5THz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1694556a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285519; cv=none;
        d=google.com; s=arc-20260327;
        b=qJ91jTXTwW9IWXhVRBmL+sPZREby8PPcxgK8rPqrGIpnLAiQ1dvtvN5N2Ko0SQ98zW
         bsvDZDffDSNCBMkH5CdAQXVPF0CxH5rLaC7X+93gQ7wtav8qCQTTZccQ1F8AWRDhalNv
         0QgP3eCA/ao9RIHDRnuChdBwhSOniTvs8KV6hc5i5/m9x+XU36BP0yn+DvfjDj7sZo7p
         0m1PToiiYC8bpiZJRemamVr8ifvx8bJ1mDiplX1vfqecvIgE4xpESx4ziaFx09POZhDz
         /mPK4/JRC/qezOG+DnElS1llmCL1ULzQpefH33m7JeDP+4wNWaEbTWl0wy5+3s9/gAG5
         j1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        fh=opRJJgnaP2RTxoqvfW+nmnjS8fZFmJvWovXtnKpGip4=;
        b=VfE23iG8Er0w3w1wmQ9h1Np/129iA8Z+pMlMe239Q69mo0nWNTp7xG9pF+QlrW4IOx
         mg4mE2PmlgAPkpcHnn+Ne8dbdPgndAUZbgLkuC9/iZ/C8EqLQEXPsfqrQlvbh2p4Qrd4
         FKRq0ruKdArNHpUpIR1xLd6vl8yvIt1Arep0XgYpuslzZQm0j0gBPxiIj0tRwVE/n/2L
         UfJUWPETIqDyeU+5lLhmBTEqFf6ujVv793YzKDCHCx1bUEoJ+usdU6GouIxfqVjov79V
         XVhKoRVXql8rQxrpYxZDBlmi46e8413cRJf8yILjrZn6Q7oY2LZQWswFBERuGEia6ZiF
         KC9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285519; x=1791890319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=BsSn5THzP5ZLvVKnQkDrqGmTBeh9icY8yeWOz6b/qjBApXEsNP0q0OJnhPMDgOtVI/
         zIrvEqFz85AIeCbUWgUrQkJwXYI+lPZ34X8VRDmD2Sh4Wn72+EobfHkSZRkvQipLCAmB
         h/Pwk8GHSLK/nJS9mkho1Vuu73tipIqRm9oZE4JjiE4MjFPElPAcxOoxAKGajwQVZa24
         HxfK91pi1wNXnlbvahayz7SHgG/9wwVohZBcPI4t9ZtZCY3DOMw3Rp0ZgusACwZD62Sj
         9fhu0N2jFGJBlsXJscx++yFpKTpEYogaF1rRQt8PzwKNVKMHliurh/AMrBMMriElG5+C
         GOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285519; x=1791890319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWeQSA3iBk+D3X8mD2yjU++uYsFdGNeCCEs2kF1ghcU=;
        b=vl1Nctuw1W41Rl+FRsKMKn3hFRW5TegpHSF0rODqCe2lpPXu/mWRgLwDjtedzIeHFf
         CvpWmcRyql5cWELmijW+ry6O+XbTiRlvgY7z1h+Cpy44ZMYezbRF5h7ZCmiHZMXEH9kO
         Xy32lUiFiVrQ7zMtTgke0IQN1SDZD/FGygtY567HYL9PgXqpqfFOwZvB+mHxPH3wN/h9
         dX9dato8plh4hVQITjk2DQgZ87sy0heLuc70DbClSQibO1452kZDPAU+KPbVRAqTNn3v
         ytIAqhbDU72c2DEa2rgmEEoDf2NK7C8AP5eV0QoZ2NXq3AXGqGxCYzAxTSF642nTk2wq
         9aAw==
X-Forwarded-Encrypted: i=1; AKwUvBxXr9cR0eANiH8I00M/AMKiYrsaC7/OAIPtV+88JrE1nYBB0+uoNadWX3JI0a9J0Q1Qh8+P0N14JLzMZIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2R4SsH197sM0kTWyqGBHY3rK16vet/vvia08akj42x7YfdD+y
	aKKCPtHy/MklcgEtCCspobPGtTvzVsQXgSQf0h1jBhosTTceavlj1OQJyWuJnji/4gouZlPiXYT
	Bx/tVFNGrh8tz+Bfz/GQ0FyA+MqpQ5yM=
X-Gm-Gg: AYBFou2aUGVp0AcAJkzayKsnkMa0dU3sLOoiLjUY9+YEOgewqlkLDvx0YrXxlER9tx+
	NqEqoOeSwQ3FcDKCy4fbd3NxtFh2hVLISYxMtqN87mkwCmigBTg42/VtZBo0R4zSTtYJ8byWdX3
	vjUD4thU1SIe2CKSAtNNxJwRyeIAlD0go94VL99Ak+F1FQdXoS64CF1VY+AQ5W3Hg4zNh7D+sI1
	T9JhtpDobCt8fvKJSurZu1EPeylrWo21N8HPoaOZkB4TC2DaKcjHob92m3QQtDlqOPn+Xd0jtfc
	JwFvSmu6iHUx3Mvpf8LkN9kHRNiCToS4pCOqXa2NHbwKHTHmVucmhzvHyjC9NpFbQlxrIpkdCCM
	6CdBLIMtgYAo2VdZR2YtKD4Lc+8NzVoBzYWLi+xFKnyhojI//Npuh+bGdo+CK8LZKWcs=
X-Received: by 2002:a17:90b:2f05:b0:3a0:b312:1fbe with SMTP id
 98e67ed59e1d1-3a873517948mr721042a91.23.1791285519572; Tue, 06 Oct 2026
 04:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-4-phucduc.bui@gmail.com>
 <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
In-Reply-To: <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:18:27 +0700
X-Gm-Features: AclHuK8llUKr61cpB9foKw2h-ehaYs9R91uCOJ-HEm_z8nUdGQwIllDsJU3R1JY
Message-ID: <CAABR9nGYB6vyR4AraotegkQzt3Xd1s+uFMF12GQdjY69nJiZEg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from
 mt8189_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

> Nothing major here, just the missing space between 'mt8189:return' in
> the title.
>
> IMHO the title could be made more explicit as you're in fact fixing how
> the snd_pcm_hw_constraint_xxx() is handled by the driver. "Return 0 from
> (...)" misses the point.

Thanks. I'll fix the missing space and update the title to:

ASoC: mediatek: mt8189: Handle constraint return value in FE startup

in v2.

Best regards,
Phuc

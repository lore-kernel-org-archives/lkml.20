Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D346AA8D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196503; cv=pass; b=Mc9IC3inu4NyeB8KvBUphndejWiJERgsKD6wUb90pgY3a6ox86uY0Z1HHzeKDCX69seK1wr7x4WR8RmzuLJbsLgIF4kA2h0jRMfaaDCrWuPhS61gT/YJuVgV+PkYVJZq5LENfbDAA+/rU4SW4HMqNc041S+qdcEd1Jb/ri/RMe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196503; c=relaxed/simple;
	bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MT/XLZHErZiYC03dCrQW8ZO+osGwK6bxM5RrG2jZKI1s+KWyWWQvr1u3yvwJ30gJogyQ3oT8nQTYX8eh4vsmJvD70YGcdJd04I+K/s92hCt6kDbdj1ejHeFgUe1bQmrjx/vBZubZaFEpzh7ZVI324GESUyqbvinmBGt6TDjrC1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUtBeRCn; arc=pass smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUtBeRCn"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e4ba8555fdso4847185ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791196501; cv=none;
        d=google.com; s=arc-20260327;
        b=caL7jgx9eUfeYQWZvLzzepGQkPKaLbFMr89NPhwHF8i4wqP1C2VRHNdBq+Rztkv1Rn
         PLwnMkLK7QsmTf6dLRtLkP7pM5Ng311ljjNPOxibR7IX7tliJ3O8JY3Usats/rATeHnX
         NcPDTKyFg6S9i2aPZgRbxql9dcsV6rbfg9zMINH7yJxRajhBzgbgsmJY2k2rUX7MBo5I
         ht3Ld4N4PglEi4AzjsFstRPAVswKkzwjBh05a+mWAZkiQGKq/g0AFGniMUhxzGQYrHin
         q5+iM6TY8DZym3lHQP5hvMvmmhDAjhsbHVxSF9Axqn/+/wCYZkXqwIQPhOKiQQZYwnd0
         M/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        fh=NIp17T8M79xGYGEBtAfrdY5Az60AnnAsd2vJ6vxNsP8=;
        b=ZKtpg+EBuBmcG/eZ8zq59MGP/fMurSI6gZzkVVVjbtjBjGvO3u9eU7M/y8kTL5SIkN
         YJs1aD3PztV+bzJtsfzR5lnj91x4HX0hBMaZyyfoJ3uwZnL6EMXRGCrHBxuph795oq11
         oPI+6N3klhJ46sVR6dL2NWjTuNktz93USIAfB1M/HClWWim6WmcG9tlR60zUUceZbKfj
         7VoY8aWK5xxcxZJPrsj1NJI12SmCA3STLcrDRjb+Oso4R+U0q7fvxj5jXEjDuXMh3FJh
         84eLb2E4fFuKCxn0Fv+VpgiOVnDJGRMiZV3MwwF+3/oI3lc820VmQTHqPgEQx4UUIZY/
         X4RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196501; x=1791801301; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=PUtBeRCnu0CHbPiuimt7q9Cc7TG4ogrIJCvcS6wmrdqkHDPwaoCoAvYIxOlnlaoMtl
         rXva7qlqgWWHqYDJTFKdZx97YBPWiYIxrtvhIUmXIIh1ace6JHB5V6y42DbE4pWEAIuM
         Vi192RvrcFTvp7Yj5iBOXaHida7G+/ul9GxGEFH8ZVZh8wg4TP07xfsFqug5nW9diYK5
         ccqZOSYEtdCp3gTe22sqJwQTdu8T4IFOaC5ITaYDob8p/8mnJK9V5mG+Ey384Q0Fb/nD
         I2oASzZTjtNYZPOxWkhMlghtO2TpVON+unzev9JBDkkuPY9Zh4kSMTok95zDpRvYKe92
         Aldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196501; x=1791801301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=Bc6AUPFH4dx0PHpoX5K/4umJSUQwB+BCzlkfbehqrLoJIwSTg65GM7aoDssP8DuNVa
         eE07Ql6hJn/IyoNx16SY/Npxa2qP3Zdq71GWGKN1JGu7hioKm/OYnxJvPC+jylTkWyhV
         LCW5kHrmIXgHR9t9FYU/47NngEiJWth43s5r1HsgV9IzW5OUusKOJuaibmbmJlVu4YOd
         iX8aMvfATkgZpG7IckB9Jtth4HLnKUpcEfPw44oYXCHcH39a6CfjUv2lKqGHaH4UC9mB
         uhQ6IO+Te5zSxDnM2n4SAVMP2rrM8f30axfqmJtFcTq16w0P+waaHo9Rsexn2JkcaoPB
         NEjA==
X-Forwarded-Encrypted: i=1; AKwUvBxkIQa08ySgKL2nA4yoNFI1FiYDhXvtMgc81KjTbPa+IF6esaHrDR9TSJwDEqkzb2MOXcuikfNFJkCzz3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMhqQAE/+6MCthVFaGLfnnHnhT2S5tbsFAtlixMjrmgfxjyS3Z
	Ftn+DI2TapRjYrJQwdIhz7qbrX1fVNHj3gR2j76XKMpnZQEMZWCju/t4OtmAEws5H7zkJDEC6lD
	Mg13Bggu5MOvNqgxHzrlWCUmu8nbHN6M=
X-Gm-Gg: AYBFou11HubKFm0K0MMa0RcpKSiNIKLuZtYXKCrWCgXMh1OiA68h/ipXrp3J7Cqoj7F
	bWHCJtXZ+RKHbx/+kpVCsyWApQg5OWhEcSr6U6PfxHMK8c/EyR1qm4REgpThhMXFR8O99GfwHUl
	kxA/zBElAtdFKBZw0sOIQPf8D9vTLiCa6Btk5s9TLa5o39CNT0ZIbnDfQE/WyzA671pG82PUzRa
	MVh6pkXdDuyQYL9dbY/2/SIGvU2tknHPfK1YDq4Lrum5Ww5rNC7SqtumrnrwfebpLZ555f9tr7w
	TiaskzWgtvm29EjZvh+rKSJjw6LZCgDlZQ918f9yUYDqJcGtXP4PMV1xsj31Bf3b31g2Mtp7QJj
	DI3eWR3ljIb1Hfmx/zut4p1UPLa+6mQ6ghVhX7/KnplPLwN4gBZ6Auj35IwQE9RFBpDs=
X-Received: by 2002:a17:902:ccc2:b0:2df:8aea:7d92 with SMTP id
 d9443c01a7336-2e49b7f79c5mr90908515ad.47.1791196501061; Mon, 05 Oct 2026
 03:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
 <asNbjSrPYVbeqSae@sirena.co.uk> <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
 <asN8HzfxSHmBjfu1@sirena.co.uk>
In-Reply-To: <asN8HzfxSHmBjfu1@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 17:34:49 +0700
X-Gm-Features: AclHuK8Ugc5AChxqexu-mkihhLXhmwiRf4SISUAZ4NMYY9zRq0-VJGBtciRXzWY
Message-ID: <CAABR9nFg2mPOA65Q-9SEDwmEoJ+-YUQqOi=c2nspSYF=UBejYA@mail.gmail.com>
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

>
> > On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
> > it calls soc_dai_mark_push() only in that case.
>
> > Is a positive return from startup intentional/allowed?
>
> It shouldn't be, no.

Thanks for clarifying. I'll send v2 soon.

Best regards,
Phuc

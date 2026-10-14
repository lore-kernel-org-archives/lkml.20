Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0815616A6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995937; cv=none; b=OyVzPJ2BIAEuMrA0VslUmzIa5P2xyeDjUosIfEaXDkZitc2LlTfiw1NRqmhOW91USPIdIhm2aZ6OVEciKZmMv2sfH3ODLFdKF15kNbefmti3X5gN++0RjjKLtrZhxCnFuvuCkNz/FMOBFOYM6sSmgjgoskpWCwbMurfLDqI5mPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995937; c=relaxed/simple;
	bh=APYxkuDM9hHLS1zuQd0wn4SyxD7eEgKQxzZw7XzMkEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKRS3fzJAm5AuLnlOy+5zhCY4i3qRy1RTZQ6lizpSYc3FyBTAe+gEdV0EY8SFTQmbxk+iyXTuSHMSFVA38bArVlwQAJbkDO6Yere2s4xymnTgw+XRaBUffl09cDs0X00bd2r/qibjPVnIMlARDRgJh1DHiF479J9UkZLU4a9HXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2igTe3x; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2igTe3x"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2488469f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995934; x=1792600734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APYxkuDM9hHLS1zuQd0wn4SyxD7eEgKQxzZw7XzMkEQ=;
        b=l2igTe3xny5UQgcBVZ2yiFfkTmYgMrTrC2Xhy0uLvwLqQEHZtm3b5Us2K0z5k/Pkwf
         S6ozpzGUcAj96RDIF3iW3viR0sv20/oP745O5sb5zmKxUz3KTBv9e6LMsiQT3VhiWEqC
         An9aphrgI0cQT7mtoPUtyOWkwmt8gSSpdQMsHaH4YZ92PJ21RLcqjBOBwcCxZAZqQGuE
         sw5OPbZcoAL7JxVv92Qo1mVvBvQHPLAHll8bQ7vk1kB1UIJb9oT0sVhNy4DGl3XoV1KN
         SU30naVYCdxUR7TrSwnIH188shX3zL+vIf6fyE/7L8oDiwUcYDhZcHp9bwOf8lkd+GqX
         OCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995934; x=1792600734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APYxkuDM9hHLS1zuQd0wn4SyxD7eEgKQxzZw7XzMkEQ=;
        b=wLBkNsc2sgeohNmcMtEqax0gd63nMXjqfOKP43XNrIb+Orx15x0QeBnIBrgZmc0Muh
         FofrJ7ZMrJdXVB3FUT/P98azwcbnVTJSfqG3rn/CkovjQEmDIjGzrAcbTvRFemLyNqnF
         RgYJkq1ZAiHkWccZ025wtIf5LPD0NYc3HjuDVF8po+pSCBx52JRhHS2URp/n91+NX9zp
         4CNBpSKJrgg/teEuffPYD5DN1WiBuvuP2tayn59kaEL2TJkVIKvThDwPrpZGe1obli8t
         t3XWd2UvK7zmliba1tyV69K54r+KVzMuKWjFj4q5exU7ivd2WnJ1qX98e/Y8Ar1tcVvM
         iZag==
X-Forwarded-Encrypted: i=1; AKwUvBywBf9pNZoXNNuJ+vVm2ris2xKS+EcIHmGSd7ipkWBmspNgtxuoz5Cq4fKUTX5nmGqF5nhJCBIr02R0yoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVXyhEaogCcNowlcHPl0AMHwgoxd4eVrZcnabIC/u+aGjYlkdW
	0vUm6rtRlJg9I/hgm22Ut3YWyMj77PzwmSzWIxQ0TkW1KkAoMkZEFNZU
X-Gm-Gg: AYBFou0P0mpg66JwWoov7739NwkwExGeTQhwZiEFCy6J54LsJfc1KrGro6jhrte3TxY
	Y2JJFbCYBzau54JzpE6N/kjhzCgxAW8w/E1vT1YxAieZ3UmUk7M+AY5bgbQg+ZnSMeV8kldW+Qi
	NZfo3Rz5Rz7I0D3JnvoPlkScmTtjZPQYRa3lCTwdzpRudpWD8o6EJ6tAc57F9dE6edCVi7gtge9
	yVLl3LCNLk+VkwEQp2ZrE7mzECdcvX0/KC5EUwBHwSeRqGKJjZW/8/H773T7ZGXAOW3htOdzo+z
	bIAXgmvbuYUCWycb7AnUjKjGU0pgUggs5Mw3RuehMfbfxF8qhmu+KTnUZI8Y0rNK2aJJxwWTbw9
	8l85J4WEIbcUDBMht8sTBZ98SO8Ly6qxCN9PrLRh81lWIHENhts9HwmC6Yu8M13j822ft4V2beU
	MCRWDqCaixu9g498FRN1hA5+hLuHHhSjibDXAbQuYOFugXKf/7nqjLqK15wdsj2qu3F3srvptD5
	pSeopo8piZPfqqth2yUj1ZbTw==
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr23419177f8f.16.1791995933978;
        Wed, 14 Oct 2026 09:38:53 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded185de7sm4552774f8f.31.2026.10.14.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:38:53 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at prepare
Date: Wed, 14 Oct 2026 19:38:42 +0300
Message-ID: <20261014163842.13124-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net> <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk> <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net> <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org> <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net> <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com> <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net> <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org> <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

On Fri, 09 Oct 2026 17:16:32 +0200, Luca Weiss wrote:
> Is there any new info about this? This seems to be the last blocker to
> upstream Fairphone (Gen. 6) speaker support. Without this patch, the amp
> doesn't start up and audio can't play.
>
> Can you suggest a way forward here?

One more data point, and a possible way forward that does not touch
q6apm.

The OnePlus Pad 3 (SM8750) has six AW88261 on a TDM link of the
AudioReach DSP, with the IBIT clock of the link voted from hw_params
through the MI2S clock control of cc8495c1d45a. It behaves like the
FP6 and the VENTUNO Q: the amplifiers see no bit clock in their PRE_PMU
power-up check, each prepare gives six "start failure (-1)", and the
clock only shows up once the BE graph starts in trigger.

Since the DP case rules out starting the graph at prepare, I moved the
start to the codec side instead: aw88261 starts the amplifier from
.mute_stream with .mute_unmute_on_trigger set, as wsa883x and wsa884x
do. snd_soc_pcm_dai_trigger() runs the CPU DAI trigger first and the
codec unmute after it, so the graph has started and the PLL locks right
away; a prepare without trigger leaves the amplifier off. On the Pad 3:
no start failure any more, all six running during playback, and the
trigger that starts the stream (graph start plus six amplifier starts)
takes 52 to 71 ms.

The patch is here:
https://lore.kernel.org/r/20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com

Luca, Jorijn, it would be great to know whether it works on the FP6,
and that it does not change anything on the FP5.

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)

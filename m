Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F524E5340
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558999; cv=none; b=A60r3izFT6k8vpFuhpi09xoQJy5ej3vWTi1/u86HlI5tE/xKVIaO8uQo9sJKPh1RV2zh793b5fGtSQvQuynMvX9IIjOek6208UmgSm17W8lsOepISqYCQW2golyUBl+SpvFQJ5V8o8LWB4yB3tRJ79ZLfA+SOXwQOrhnVKRyEIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558999; c=relaxed/simple;
	bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pdQrTaWf876GA1qqUIMm8fAigI9WhLo7HULWI255JKKxDD09a6FzoLA6xkuw8dg3ZoVP2Fpli/UYgRyBYOXg5YLGeUffdlwdSpuQYIRJJwFxXgqnaZ1DI6gFUOLwU5iuw33yMIPItq23BviJ7OwBPkaFKhPDqBTX5CYBQZcNw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LMtRaOke; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LMtRaOke"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e6df2742cso644373666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791558994; x=1792163794; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
        b=LMtRaOkeyn9vl2q3+mxGBqw2kTPPBgIP/2aF+Zfw1a3rsklLWnOl3FiTFmej+J2bn8
         noT9U7KdfWRliQ0fsIu2GbI6QhPyKALhQr8ltkkTpBCLSP6Fsxoqo41zq/jRkO5cPZRu
         /hwLhHr1s6ig/lrTez5fvU3FcAi1sJyfEuLtGuj60nXV4mK1v9WmzpMRw14cYRn37WiB
         lGUwVZjDPoGfM/sN2mSlRzS6/rfxnRqeqwsZS50mgtNvqqOy/NtZSDhihOTfIXTEDIdU
         BqhYDfO15S0dr0WTtDhfuEoxKbLYVRaLjObcmHALYs65YQpem+OgPl0wW/+68E25JIeT
         aQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558994; x=1792163794;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sAgxL0wPdCqCJ80pJnO7SaZPtxN1SKLnKZqrK+Wndo=;
        b=bIGlpvE+67vcdvnzISYgqt+oTPjX0WDuXfCzIY23JNl/OoveUepv0W94CLSGv3eomk
         FwddJ6JhYoPXyPv6JUK5yEXo1ZIP/55LeBu1t/ddoAyXBdcnIYlM2LqwDBm8GAnpuUES
         +6INNP9IWiJ02p0MQMMUyNtaKB/krAf7bOnNQRS0BXNtdDREAuhyi+wE+I6vHDGPVk2m
         F6vZE6e+qKr5tOeLvKlJYbUil1QUxMM1QRR9Fi7kxXlo0XKCBCfECiEnE/3KlVT7Va+t
         LIA22G8FhFoglMEMPKtXCuKlr+fkuK1vzeBDCXyKXHMC1Fql+B2N0ojWNX40ncxABme4
         u9rw==
X-Forwarded-Encrypted: i=1; AKwUvBySKXguHU8eLJPE7VPVSeahjTeVX01/11Dw1lpjVtd36dpaAq67KiqheFDDRvjQIjJbir+5YogeVkptGCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzRVUuizo0OiR8RrHu7PWgpemQ7Qo6phoFwPMbwB4yZWZJBdmU
	aXQnospR6sNlolBmmlekVXUssEO9qMdDJKX0+Yx6IfmqTsAOWYbtXfgCkjOww+0bwEErntfysQR
	ikZl1RqE=
X-Gm-Gg: AYBFou3ZSxhY57eRDGhgTQgJXd1Z1DO9XMcHsicts0sSOMA0iPWd43TLki1H6dUYSKO
	AEs4MMLRIArHoAJ0hz+JEFryxQPR9VsbhPC+/cLheXE85eddj0Z46p6JRuSQXOLKr4ZQ7oIeYPM
	veInM4HtlYPoK/whUJ4Jv5vqNV1YaSd+ZxQGuqywHZpl1f0JQQb+9eN1n7ll16wxWIOiH9qEg9k
	asD7837Zi8iYehwKL/JwWcpugWB06O/9waL2GMMTTPJlu/hL2DiHksoCUiXK01xZR3BwGvpUYXU
	oGnf0aVaz8tTbt/SRhKbe6/xyS+qPZ+PbrneTgw452zdh644QZIFh3w/JbdOJwL+BrDeWssbcxD
	GNifJoXuClE4fbHS7Y/x1skIK1IOqgBaTUKBDCVmBrWrHDHO4ndNwYwZnfF+PDEer6zxY4Yi1pf
	1JU+zhwUfmNcA9V+wKcg/5wNxy0r/AUqUraToPO7C1zIh3Vp6tz3xDHMVweN4lnDEjPA8V8msp/
	hXGxYPa5LKlGORv5fW6pzLH/WpEaiXqmZgzDMalr9I=
X-Received: by 2002:a17:907:3d4a:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c31a9fa1d4amr241370966b.15.1791558993759;
        Fri, 09 Oct 2026 08:16:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa14f8sm111219166b.53.2026.10.09.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 17:16:32 +0200
Message-Id: <DM0ENR5MK476.UJSB8FMRYN50@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Val Packett"
 <val@packett.cool>, "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srini@kernel.org>, "Jorijn van der Graaf"
 <jorijnvdgraaf@catcrafts.net>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, "Mark Brown" <broonie@kernel.org>,
 "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
 <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
 <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
 <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
 <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net>
 <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>
In-Reply-To: <2545fdff-7bfc-4897-9185-34c45ee01bdc@kernel.org>

Hi Srini,

On Thu Jul 23, 2026 at 1:02 AM CEST, Srinivas Kandagatla wrote:
>
>
> On 7/15/26 10:19 PM, Jorijn van der Graaf wrote:
>>=20
>>> This week, I will try to pull some wires out and check that on my
>>> hardware too.
>> That comparison should tell us which side to look at. If your board
>> does drive the bit clock from the vote alone, I am happy to dig on
> sorry for the delay,
> I see same results as yours on my VENTUNO Q board too.
>
> As per DSP team it should work, let me dig bit more and see if I can
> find what it takes to enable it.

Is there any new info about this? This seems to be the last blocker to
upstream Fairphone (Gen. 6) speaker support. Without this patch, the amp
doesn't start up and audio can't play.

Can you suggest a way forward here?

Regards
Luca

>
> --srini
>
>> the milos side; any pointer on what to check next would be welcome.



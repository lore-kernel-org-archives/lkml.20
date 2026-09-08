Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46474CA292
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858911; cv=none; b=IuGpPtitUuPKkMjSyk3Oo7E2b1moZiZ4ACUvJ4oQJ8k8yT4s51U9pretfZwBXWPRxtMssHaHORRsYmtZLuOvMZzB0U4Zqu+1Q9FCgXvDnLoEwmzmPwb3cgEjRsv84oTazF4LQd7jp0y+wJ9Wo8D7ZdJ4vQ2bcEQX6zCkCKsOWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858911; c=relaxed/simple;
	bh=t/xxnUmrNfICBiCkOoksIKEwk12retoGdTtWu0AOSdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MW/IaSO5i1f0VuMGQ6GMDpESHYR1qsSTzt1ZdBa4V2+foFpWjHA+yXGwZnrsTxHTIsTF+KF2xYWWFHTaTcux8zh8NHx6UfuHVUBOW/g3TD3CpzjT1bUCMpcjMQoRJ4B/SLSZNsZxSsN/loTgv8WGcAb3P7rjy37ZH3/QHHSsvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XrmMCm5E; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ebGZO4g1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XrmMCm5E";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ebGZO4g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788858908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nNgGtNecSlAmjqV28TTW1q4l/anKAb2D0PenLdi3DMs=;
	b=XrmMCm5ECDobMICa1gPoFVy3lnvpwze3KHj47LKS/cMV9BZFwgcBoV4Nh0K2Vzu53dlRgu
	uCWcvXzpDPVILRv3u2t8CJigFAPPaZ+MKJWqLdxOXEOrWGMfB92Yyi3DR3l/uS99MdSYH/
	BjKWTGR7huk7VQDi2hiyPEZYXCa5S4I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-fO2Z20k1OJGjttsnmmd-LQ-1; Tue, 08 Sep 2026 05:15:05 -0400
X-MC-Unique: fO2Z20k1OJGjttsnmmd-LQ-1
X-Mimecast-MFC-AGG-ID: fO2Z20k1OJGjttsnmmd-LQ_1788858904
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso33516405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788858904; x=1789463704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNgGtNecSlAmjqV28TTW1q4l/anKAb2D0PenLdi3DMs=;
        b=ebGZO4g1ChA6oglwIE44xl2P4JpwETtFkLxAyDYLU3o7OyAmB5gGxEGHWYR/zfOaHj
         HuGIzuLwK87kMtMcm7+8I1iFLPzuxV1JcL4Jx2lctaUTRTqYv9DCbUGAxJ29XRRqJBkF
         iR/Zwd+DIlBk/my7bmhbCpZLk7RZfLQML4atJQX5gEvPMVeCuz36fq7MyIfmGCljHhnt
         17TpX1M7L/239PQsWTI15nY4S1bpiGXX6ERr4lf6rMu8lIjmzBquazemqp6RXr5WBR4c
         HTuF1Et1yCLDk/5326OaY9tXHLeVJcr0YEJ6PlHImRbL6nRHhlYXV89rAFjUB1IrYGHk
         92iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858904; x=1789463704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNgGtNecSlAmjqV28TTW1q4l/anKAb2D0PenLdi3DMs=;
        b=l6ofpEHOfMZ03BusEsPP1G8yPb8vWeHrwzrEhbdg+TsV2hbuI5pvrx5gTeAerHl9XY
         R6Om6VFWq8/oNQO6bdVrW7Cfvn7a7wFPW7PriRU65HdYimJoV9TmcdGe7uYYgiobCiR6
         MKVgz8vGK4Wb7DSmKSi8YKV+o699ZzkN9iDi37Eqyu9dJ5GytWTpNLK8IrnYcGkLhzqR
         NpBtpKmYWHgIPVCtA5PcgquhRwFtwvZa+hgKIcbN1i7ZJfKjZBWF0vuxRQauVEeCTK2O
         1GssBgbvzDFFLXH6pmGgpc2rlV25Zc0TC4yz77FlfsiAMyDmorkLthpVESrzfU1T0hTL
         7iig==
X-Forwarded-Encrypted: i=1; AKwUvBwbLnGe9oeViosq0Z5XPOTOWKl10PcP9VI3ynEJEp97gFO59X2QLUcR/CVlSWLeZJcMQwUZyaEkcpYPkfc=@vger.kernel.org
X-Gm-Message-State: AFuF++mIG3E5CZ530t/r3Ilon952Zv1tstfa/WdL+6iJIMx4xzE8r/Ex
	5bhRlU68aHC+nhVGVv+I1EUrcMgtdTDg6LBY/JN/wuhFZMv2UcSdw0t/Abwgky9H6Qietq0Rzx8
	EeZ+hjcaHNAMjDSRuX5eWqpMuL8uK8aGHqsTj2Y7OI8p0FOKL6jWgETknhVCJu+AdkQ==
X-Gm-Gg: AYBFou26CVSAqA99eXHBqgHw1lV2p+dDOQKChsQNfiUreB3z41KreoBx6x67VMotUFX
	MYtOqnOYDPXqCi5doTTvz7ac0EDelEVTwuXG9raDSBDV9U8LissDd3TtKRNeO7SnG1CWa6A5gP3
	Ex/FPj8y6hDMgOU/FNZcq6HMY7JUD9+SQYrV/kukc8AyeUgcPciKY6rrv1teT55RT4H0rOHfTvU
	p4JvjLn+wYdVSGvbDn6Y/fvHUc1Ce7STrhVcOmdFzYuWHVRM/RzFnWchtSZKflSz6mUGyHN8tKO
	Sly1ZB9wyXuiFlv/6nbJcAc2ia19MtzSNN6bbkkjJ7WvSkJOiYglqWv4R5Wh/A1e8t/lDLpxOel
	Zw3CEW6Iw1ViTI6EsWjky2OpGYY6gJNHDRINFfjzAeMPKdM7a0Tmcsi95f5A0FVp65ec7sYcTNQ
	==
X-Received: by 2002:a05:600c:6298:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49d17d4d6e7mr44236065e9.23.1788858904235;
        Tue, 08 Sep 2026 02:15:04 -0700 (PDT)
X-Received: by 2002:a05:600c:6298:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49d17d4d6e7mr44235535e9.23.1788858903823;
        Tue, 08 Sep 2026 02:15:03 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm279283445e9.4.2026.09.08.02.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:15:01 -0700 (PDT)
Message-ID: <349fef66-0513-435c-815a-23f2b2df829e@redhat.com>
Date: Tue, 8 Sep 2026 11:15:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: marvell: mvmdio: Handle errors from
 optional IRQ lookup
To: phucduc.bui@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 u.kleine-koenig@baylibre.com,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260903074638.345952-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260903074638.345952-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 9:46 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors should be propagated so
> that the caller can handle them appropriately.
> 
> The existing code propagates -EPROBE_DEFER, but ignores other negative
> errors. Propagate negative errors other than -ENXIO.
> 
> Found by manual code inspection.
> 
> Fixes: e1f550dc44a4 ("net: mvmdio: avoid error message for optional IRQ")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>  - Add a Fixes tag.
>  - Add net-next to the --subject-prefix.
It's one or the other: no fixes tag for net-next patches.

This does not look like stable material, stripping the fixes tag.

/P


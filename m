Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3194A7C8C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637688; cv=pass; b=Ha/A82ivB4zbCl12b+i+k8NDOBI05J/nvd3AtQAMjH1t0aRJweW2NF4wMtjdyJXHF73Dj2yrmcJCGM/otBZwSvxyI1eiIHm1N5M6iyy5wIxxG+Mlfp8No0ZXIV/jkA0250Gj00lFbaKpJNQ4WTgSpmciGnw1ZSsoCnacLs+JX4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637688; c=relaxed/simple;
	bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFucjT0YC1si/EFZ7bDhjG/Zhz3iti/vNZEBFE2NFkmgKR3sIy7zUqlv75wMPJYCN4qQwdKeoFtmLSdeJ/jNg/JNUitYOaLN6CcWQTko8b2vhAiRZUV8a7pJ7eWuAnYw8oS1/7nAmGgef/Es7EoYTg7fktU/6NQFqbOUOZAVldI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFtnxtnM; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFtnxtnM"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a777d4f321so6002821fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791637685; cv=none;
        d=google.com; s=arc-20260327;
        b=poOL9Uv6TMVF4Di3TamYlIo9EP2n0pbCzp6c6wAHBp87VRZnojapRE9BZjQQBTEsDx
         Rm2S2iWJEWtMMfoxZ+z0j8wHEUOxZXSbSFvFmfrLkVe1l+bakVokD81LSKzh9Het4z8f
         V4LXqBsr22uWviiu+ReM+tRnLqgnTu/g/JuH5RrKusF2Jew/SG12/16PGngNsEEm45vn
         iaFEHEJD93MNp5ZN+LZH2bMuWB4oUK6RTjOT15jXjl3IprVFHioVkGlEDHnyB1D5oixH
         GekUiKKs2YTqhJ0u53zNKA0qwo9YDajfPBtEDUr0Z95He8BUXXdU8rgTDiNnZx7U2+Iu
         LnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
        fh=JQNHKZ5D7sg6GNWaJZ5e4Po7bkRBkD+W1H/3fHU8OYI=;
        b=eD7adVYsIixphKp828YVB40HfxidhnAkw9bOWrlHNSolOmmevhlLgknDPs1AxcnLtR
         zjW9bJTwxIipJrzNLSw3B8z9p82GLUp4nqpGIE5a8X2bCNWBcVmiGrC2YzzjETw5ZzIL
         FrlgQ1hd80e9wR0MMk68ZMnuUEWyltKhKz2uIVAuNd9TkgPy2MyqmkylNM84pmKOSaj+
         On3mF+vND7peMsZyKjKNmhclyP1bCN4eu3ul/IZPts1470LJmH3Eb7niD5PdQPJrvZSS
         s1MoyXhlP6s5wcdJnNFqR2GReNgrlYXDZAhjqFOzuMOvf1C1yxfWoQmaPJUHOuHXB+l4
         acZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637685; x=1792242485; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
        b=GFtnxtnMvNaq4SJ1WOB/2/nknKlK/HIOBMPtnwnullEMOFW50Ww9QBWYCmB7X+EGIm
         pSLQif0Qbv3ZdpFrntpTwOaGWMdG2C2o0JkHvV8sXZbSN4R8XnWffx3vOLx9Dwokeqbo
         RDvwQ5hWGi4WdxmfelLKMloPxsce1/vqYNjqYxy507UttrM7ivmtQ86x9kDDa1k/sZoz
         tAZO3IZWS6q7oTC041c3vaFT/UaYF0XMJmFX4Ni9CfgYrAWUdyoE+/YprAdKvfUG9Sy3
         t3Cu2WHAEEx/gI2LXBurteS1cJLERNUo02TzfcKj6ZsXzVAnsbbIT/u8w9dCMfKb64iT
         dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637685; x=1792242485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
        b=Vg9daG4dLmjYhGCYSMMvzVPuOC68MsjoAeGhPyrbDX47bW2oXcGJCuvfqFygpFsFLe
         ploJtyH9131YLpeywCP4/6QhbFkU+qnJqJ0fboY5x5akIf/+4dfVHYEHjqmN8M7+PZU2
         JGYJwUCH0sEejBu9tg9lqV4aD4dmAdSCTd03CQO0V4/njEALwOHyCbOnWG1NmXMRoz+0
         WfhpHcfXGrUnneMS67oSmmXVtwGN249FCqwVlor/mhxJPPSKLb3WykdfdMRSfOumWooF
         gBGXXx4pfcipVJwE/ai1Av4zIR2Ex6xcorrUQ7DzvUV+Jmz6qXOy6f8c6No+fdpoisby
         5rOw==
X-Forwarded-Encrypted: i=1; AKwUvByIK/fTfOLnUDFjIrq/YRklEc4/iyhjQRMT+ZjZ2PlR7TkVsSGNsMkfnfD7MRiXLW/pRp+qCwfZ75tPcdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx6WGFKqV9Y+YqlHKDMooA/tRJyTpH7TU++Ojcug2ohMplQx3W
	yDs/KtUofRQe6P0/URU0HSD8WwsPd/k4R4Mnur8Y/Gort6hJr3y+FOews+3tGH8GA2zDczqLY85
	IzMtAjnQHlQ4+2REt+Eot022h4uz9zRmqLF99cA4=
X-Gm-Gg: AYBFou0Ft+K+iTXY8Jqw2wyzvDSrVvnrBgT5B69TmUtyyz1pd7ge4f1iMTjf9vqfBj9
	LJ5YRZNyryFuSFkDq5ZN4lP9e27c1B+62ydmq/+0QiU/Rv8rHjEKaONR4PUKwQPVRn1cqzH3KBJ
	zg5ahdvmSZr9+BdjjN0ebmQ3YeITgC9GBBKpRQ2H/Y+jaOYf6gSxV+PTHIEMh1M0msBp5cCr2cg
	7l+zDuCFKrx8eBGdeyLqtRaMR34s9+7dEAdrveCBUFpIZtP1VLIt+5vcuCc/kzwm+T/YWPWOsx1
	M5fGgr69/ptG4oZJUT5aBF/m5pTGszEkZR/XxLBx1Nw4j22ytJSo3ugJBXW+mh7JPfJXLGmsa9L
	SwxbcfuD93drHClWK7+gtm4SrqIKU3JgVjbl/fOVrWbxe
X-Received: by 2002:a05:651c:54d:b0:3a4:8913:a259 with SMTP id
 38308e7fff4ca-3a9c56def06mr10678081fa.29.1791637684541; Sat, 10 Oct 2026
 06:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007115821.11332-2-sigefriedhyy@gmail.com> <179154712848.434549.1887332518398499959@kernel.org>
In-Reply-To: <179154712848.434549.1887332518398499959@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 10 Oct 2026 22:07:54 +0900
X-Gm-Features: AclHuK-XNxBmVqaX_AVuTKFXpvUqvVpdQ0iJJw8t3L0zVc4v9El00m3OF_1B3Gs
Message-ID: <CA+7S2v+hTzSacfnSJi4V2A-oj5woKA+0ffOA2cY1-7iC_LDX8w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Should this have a Fixes: tag?

It is working as intended, already discussed in the previous patch review.

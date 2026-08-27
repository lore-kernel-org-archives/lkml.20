Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4C337F309
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805683; cv=pass; b=fe1kjab5/hfahWoDuA8Yyqsv8+CZyD1TO0Sv9Qx4T8waE68cqkZUQZh8wO7BWr7PZVCPYV2McQm2sG7sXu9UoYP2bfPkF4ZU/A8BeQm5BUhKAmJYza9FPulkobDuUvhi+K+d8aeCFLNm8b2Q+whZbG/Vj1Yqv732m/Us5QLgv40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805683; c=relaxed/simple;
	bh=wmJwsWhJWgGzixLWY98cQ4oV4zc1Rfe63lrHepreMXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyVcoxcPUi2slXdL43UwEWEuILAQJsS6sr+0EqBGVeB2h7cANMbxxEYubOu2BlTZcq+iHIllE1/z2XJBCgWTRuDVlV51IOWBHLjlmq9Mnw/fHZurCObyCePlbk2NvelkXGGx+NLv8EAdtc1HA7CRzcmmoop8J25is2MmIdUaiLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxRKqIAL; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxRKqIAL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so429267a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787805681; cv=none;
        d=google.com; s=arc-20260327;
        b=q3sGpdyXHK1LNsjdXCgCZkGxjQdN4piIaitjCAbEFdq5PX9xiua1OAFZVTdOunvI7f
         2bDE61hzGynr09zvKlAjQlvpWPEuRD8AQwZRI1L682eBWFCcpCd5ssguFFE2cGwwiia7
         9UnCXmFoX+gOR/CVR1ZmshgHgPBqIzteqarbWHBEPvg45Sva2wTrSMHR9iHG58qmjvjJ
         aybBUQqXiYre3IDauA/62Mo1tZPQcS0yJAajXXtpU4toCNeCR9xOMBaPQecYLKyOsIAC
         wdnkJfL6oSdp0cSuSDzlSxekrNJyf7ZZzqsmxe6YwS680krURJbRvRmoTwjdTVq84JcB
         zJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmJwsWhJWgGzixLWY98cQ4oV4zc1Rfe63lrHepreMXA=;
        fh=kvM4L/q0l/xORdEVQxkigLvQhsWc3rC7VkyrMT7CWMk=;
        b=HBWn56IaoXSpxU96BFx7RUTrBeiT4VyFbgPRd9hx/8N5diSQ4LhZvSAiMeRErKHbSB
         Kpja3m7cqTEI0PvceN96Y+p/zomiwoCI3oW/pbC975oLS6doBMqZr1eTBVAHAYkdB2Y4
         HSG4NO0hpk5Ydf0QylNPaJrGDrhzCmkZ7pvQX7J/IpIB66aj9sWMLK+UYrgx4ZVWD83B
         cPJ9OfmuaSMy0hic19cBZlergOqHwca/6EOgI/PsACfe9xSFeIhy8JQqU8aHeX5EYgDo
         ZCPMFZdLs6iLEC/noOPCfFiCgljSRBT/1XZUPD81Luxk+31UzdgtVF7POTFPcvBdxxhe
         3Qfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805681; x=1788410481; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmJwsWhJWgGzixLWY98cQ4oV4zc1Rfe63lrHepreMXA=;
        b=PxRKqIALGDu1X5boEPBCMxLqob8BmVlSTuUfVUnhYJQLeuk3ACkAZV0XI+DQLk/BcQ
         V/MR3dtnaRyKvYWqa8PYw1luNTySzRvWMAweSszL8fnhtk7FsSeWnHAXQOBUbpJDDLD9
         U0lDUGWVFDKky90lHVFrvJiwmfEiD+zdLnwhRaPJMSoqhEGhVDy0V1ipew+9aCMwjqpy
         Ea8YaICxbSzDz6veNAnqb8vZh6AbNC0/9XESvh/p25Ducrjv9q3M70Ja+am8AIO7alRd
         gL/IMnSPLjvsSaGVZNa4d0KsVOVOt2xWpoBUtQB3D0KktNmuqCZI/eBsFOouL8Xkln81
         AgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805681; x=1788410481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wmJwsWhJWgGzixLWY98cQ4oV4zc1Rfe63lrHepreMXA=;
        b=MLq9B63EK1YV8em/BV/niSHctsTksWwVVMwJ31iKLTDWXTeWxCyHcOhvitzRMtkw3v
         TyLFdC7RYIjIESFfuG/KTxZ6E7V8pTVzkMeHpxAwBNhwN6R4CUAzimabozB6+5V5Dt3r
         f4p4IC9xdgPDAONd4S8n1zPcI4pTVSCB7D/1wmQlEXyON5S2x1hDLQlcXsGK/Us0nPBD
         af1AYjAcIjIDHYxjsO/BUsOoEpNlCgcIXcroBGF+35LTfxz3zhbGdziL3PDgWANM/3SI
         7RD3lPeWVMLaW4IGSo8fxRbYA2Ysy3BPCVNhPUM88/c2gef/yT1pgWaM71OqaZ1kpElo
         Tp0A==
X-Forwarded-Encrypted: i=1; AHgh+RqD2NhzosXGvkU3gUOx+xtYPgBPmnmO1ZHAjq09TVS1lSH6twFu9ndLWIlzRZC9Qba75e2IfGja7MpomDA=@vger.kernel.org
X-Gm-Message-State: AFuF++laQnxBeCDrSVz4nu/tqqfdNR2wxMnP/2wixW2/0Xrv/bUD8AsY
	0SgPNlM1uCGBV6hju4ky41Xq5N/w0+RWc1KfGCopfK0UOTPApSsD50ZTHvQBlAa6lFXAyOV/W8+
	uV51cSnJeDnCqlM/I8R35QEp64Lajv7Ru4Q==
X-Gm-Gg: AR+sD13yP6RdToM38Fc1wopdd3i5WeE+fxgCX7L5GGr4fF7LdBfIgY4hyRjfIcrrrxi
	YbFmZPUOoV2BdlHOUX72f6EmdlE8RUaIEOcG4YYh5RJHSfP2wKYj27Ux6xQMjsSGZAHU7Jh4Yg+
	PiMpH1LXTzvXsf0GJ6we9xGmXypaE+C70nIVNno6gh9sPmrgyyb/DZetoxpB736hxDTz9FLFizH
	4bb3Vwn6/kpae8aDxWKglYbql9Xc1veKragSBzB5WNaBC2BN/Tu7GdF2iBfOe7nHHbUDusGG5FP
	8nfFODhvy2Mmcr6A9msK0mOGdfxC/XwtVtWg3x7Vv/KlhnnHSQ+3xhBG3nTW4ISQUp4sl8WubVL
	xjTccfaZEqkuSNmxH06uYf8eHkyi0M9UJFKUqbm9boljVXcfSNk4vPY/T
X-Received: by 2002:a17:90b:384e:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-3966d4232fcmr23112080a91.13.1787805681332; Wed, 26 Aug 2026
 21:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826052055.19201-1-phucduc.bui@gmail.com> <r2rpiqlkgw33igh262cieoyoeqdv7vd3vh3swjasdf4vdjgyss@e2rrpfe24oub>
In-Reply-To: <r2rpiqlkgw33igh262cieoyoeqdv7vd3vh3swjasdf4vdjgyss@e2rrpfe24oub>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 27 Aug 2026 11:41:10 +0700
X-Gm-Features: AcwNN1WK9q1v3aiUsd6wEufY4owd9gQ2pQjo_-u6uW05Cc3kPxSZrk-cTDoPriU
Message-ID: <CAABR9nHVePW3YdYy-6j_pSPR3-V4t80vXYVx6S=K7dC_iNR_xQ@mail.gmail.com>
Subject: Re: [PATCH] chardev: check return value of kobject_set_name() in __register_chrdev()
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Thank you for your review.

>
> Looks good. Feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>

Best regards,
Phuc

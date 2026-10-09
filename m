Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8B371CF8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566027; cv=pass; b=R5d7AVSY9IzPMoMsCwxkXywi3yhNtXmJ4yo+/zhi7YuAg7m8ejMr1aisDaN7R6uUN7xPO1voGkPwbek3102REaTzSj3iyYpMuQCxGQJWYpJPitCmb+YAYPLG4RCazcy76vOWDdCp6GdMYplSZ5GVny0hNX562JlODyhnjEH+peY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566027; c=relaxed/simple;
	bh=47gdQDFWf8dlWju6MuB5759dpExz8o7voslUXT7xk+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TD+SeTNqGpc/Np6fNBxJ0YH2HXIyNz72C3MFr69UIYArMzvy1/xw70VH+Uf1dDXZZfSoS6CtjSab2hVYa+iPa/gJG4aa+BrctJfKnNvREaR9oGNHztn3QhYvOjrAHaRsU+BG6yCb94CiZWcsqLwar3tvfXjO5XBhxsnDTcvrXlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTJAzKk2; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTJAzKk2"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5339381b46eso41449251cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566024; cv=none;
        d=google.com; s=arc-20260327;
        b=p8a2esJ8nGsi35S/QL2/M7+RAUALGmw70X8bsQhLt6qT4wuaUYQbNQCGJthsYQb74s
         lgruJ3FT4dQUC6C69lHeGV5KBGiGoNWc9xW73kK7XGNLVqqCK/egoepXQhqVOCwpeFIq
         ZN9jaKENHLDASW5eZJGfwZcSIUgg5Zdoz/b6i+p2QIPjkEodR45GzIdwIEHjdb0MIIW7
         2j/pR1bVKzcFwLW5+SMb14zBAdxjmIgss48LcvR/+CL07s0CWMVWoZiWDzDpLdZ+NMTW
         wzxfw86iLh5rfSW6xAMUmuEu0iXxOUDFlM6RoZD8WvjtCZ/0vgVBDfrJRWhioz2M5a6q
         7d+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=47gdQDFWf8dlWju6MuB5759dpExz8o7voslUXT7xk+E=;
        fh=qpAJWMMJZJwxtO01aDEiJVYzPW4P8fGmwrTJ7ZPg9yQ=;
        b=Ff9N884jP/XYFO7QM9SvnXwppo6hCDUKKLUNZVJUrjQKfga8O+8a9HWybxhs49pBnW
         ehWTBNMFbRm2wzZioPJ3dDeubN/WG7lCi/pvazmUs3yVm9EchhrMbFgX8u0pH3TpKxK9
         PWMPR+x+P6e3Sy569lezVteJoWNWNFkn/2rL7IEVi1L4ElwWCJsgHzKAQ7G8D8ztGVDA
         NfobJR7Gbylb1vYatztp1vzuM5UT/tlNwvvUoQrLmaUqqeAj1P6fHRq9vB9QVyeQCEGP
         kBkVVXjlUTnrTKD8phWGnODRLBP1Ou/JQqG11IwHb5kfTTqffkpHAsP15FEQ/8ihU3Qj
         4g7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566024; x=1792170824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47gdQDFWf8dlWju6MuB5759dpExz8o7voslUXT7xk+E=;
        b=DTJAzKk2ijwAOcWlAEBQzd3p4A4bxIyFKy/Ttnn2R5uKRaBV5H2kqB2h2R2uW/zsPr
         bO40shjkrnObSFR5p4b2TIINvH+Mo71kq8frjYHnF6XWUrAThFqmnxql4m0r5pscJAvo
         E3T9CQ62vwQ9JdByt6i7KL1Uc06jcjgtkUZ8eAuKcXykAYS8TsXz7W3zUJqv6Kd83sOP
         QACOju6Rpllc6lRaHvd4n4ksG1waP6CUZnAWsXg/8yDMMnEf3kPF/An2Delo66qLnKaZ
         9A5Sw0uwFmZRYDp5iYvyR8LLpArAUMyQai2EDRiQjRMZkATMNQvZxFCAR4B4WmCgxIzs
         9ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566024; x=1792170824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47gdQDFWf8dlWju6MuB5759dpExz8o7voslUXT7xk+E=;
        b=eefhFQ09jxP0G8kC+mMmDe0AR6MMjSgc5vaXoCc1coogyl0Qsfq9R1YW2u/xQYVifn
         qpBTl2O+BxCog2fcn64FmxLF2FRjpwzG2CDGNbWXsrKMPsqnKeLaSHdJ+1mwhHLBwgoe
         4A6MWiCBizIDXSQ9GwQD6EW+Y6rEiDe1h+dILcVdYg3887lWiTkdRwP90wSvdJRH3sKf
         REYUbdog5Tu5xHlVG5Z9jMcaGeyf5kcUbl59EJwfTK64d6NnnkhZmHXsPWYUGhvX9MDn
         7rN1FbX7d3N540ngUyFE2zN5xEbJl7kXyy+GKb54oDJUFYUXhc+0ljUMCc4jeL/oDkdX
         jn+A==
X-Forwarded-Encrypted: i=1; AKwUvBw3rTa/zG627RE13Z7KbU2kKbMk2yITvZA7yCFUq+ofLbg5J1bRbnVk/3Fi2p/N77NxlUwVOKtYETljlFg=@vger.kernel.org
X-Gm-Message-State: AFuF++kWsYm5h1U9is2DadxE1ZYxJoD1s9pAejVGTJGmsAHtp4u3cQa4
	XgoBSknFgbm59RQOiguTn1iOIaVfaGXd8e6mcH2pF5doSYHHmIwurXZNtGSNVgv1Gfip0ygMNbL
	jY7Lj5glv14eXt8odTT9RCQjZcczp4NU=
X-Gm-Gg: AYBFou26htNAalWU5a/IM4p4bvk1i6xK/25OoJ+YZKitUSBd+FPaSiTVIRpfFGljeNM
	OhhQq0FcEsN7+ExMS53kHHzDUcvxlP3HLaRp1C1AJQN8oMa0XmHBmqNh5wUH5bQzFK6rpVGSe4/
	kj/TbZFojKngJ3tDuHWydCt7R8XkSQy2CyP4yJlHBHOCWtB9A/I4Xy+FH/m/kKPm5JP5zoBrYlp
	KV4oBR+uIiwh9HzONRgbG+cDeJXu2lxagJcqwMsG+N4wTTfiVw49E+zmGqGBTRJiYHxXmWoa9Jk
	6PFmM0/IKF2OPLiiZeyYH4CUx1jTFAY0sUGG8J9welPuVpNIcLpJ8II=
X-Received: by 2002:a05:622a:1c16:b0:535:2447:3d03 with SMTP id
 d75a77b69052e-5359fb5c03amr34252771cf.35.1791566024366; Fri, 09 Oct 2026
 10:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009133609.579046-1-code@aayushk.dev> <20261009133609.579046-3-code@aayushk.dev>
 <20261009152832.4dd56def@pumpkin>
In-Reply-To: <20261009152832.4dd56def@pumpkin>
From: Aayush Kumar <aayushkmx@gmail.com>
Date: Fri, 9 Oct 2026 22:43:31 +0530
X-Gm-Features: AclHuK8Cf_pTAReQN4C_uRO6oWVAIIlKzzjvwsi3ymyeQXQQLnif9HVikKVivDs
Message-ID: <CABXOLKfQnuzGK81g1MP_BZaR=TJ2hTY5QQaMee034rQxMS1ipg@mail.gmail.com>
Subject: Re: [PATCH 2/5] spi: lm70llp: Use strscpy() instead of strcpy()
To: David Laight <david.laight.linux@gmail.com>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 7:58=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
> So strcpy() is arguably better.

Fair point, I'll drop both the strscpy patches in v2. Thanks

Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7091547054
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389376; cv=pass; b=Yx3wK5Yqw+qBWxfUueuiaoa+OEZkE1+SCm9jHHTwPM33S42dGKytfjbAc2eWlRUqf130tSzOmCXMvmg0vOAq0MzhjmijGiN3+XN5G+cPn+ErxXttr8RiTNibmzKNVvVJX8PpKIUrTlfN6o7GuEuDvhFraqpLpnf37KRLTqafcCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389376; c=relaxed/simple;
	bh=ttUqta9PGbTX1cLeWkyGruVCwYrxrxBN57lkJEb1MDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GnfW4jziMxYYsiTPRWWDMR1dKhp/dqsOIK1+gDXrtIYXb7Dt6iuKD7wmh8X91b51CpLKyziIo5mlS+VOJZd6PkBWCKJ5GCjuE/z1O6h8RTZ32hTP2/LwWRTvSawzO4wAuGoskbs7RB8ukPLwhSEX01z4aN9bclz7WFpSN3X4E6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+eQ6JI9; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+eQ6JI9"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso3340223a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791389373; cv=none;
        d=google.com; s=arc-20260327;
        b=FYQLScBHOii1VfHNYo9g2s1MvY54OpKqP2B96uicWByb3gJ/pMGISTRSJHxtRPIRMa
         Q5UXw+MQag15ZNA6Gep0Z69QF9oiyE/o+xd8wDYE09NcTFxqXKsZV7t53IkBkzPrhtVr
         MvgRC07oCWXwG80qCKQB/Qf9iCKzsu/Y67UjZBkPxnpuBl5WPjBD8/8tA8/dfNBJs+lY
         HyfNBbu6UkJZ2EqLv7xhv8mA/0UwUI+8HBSDCa43I+tJzTP9fJV2QTrus6xA2O6G9oki
         Z1IxCVz4tq+LCeIhnJEjMIRW0ELhAvM/pGBd8Mjr+uu+lZbqXwiv3MVXiYdcyWUqcn9H
         JDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ttUqta9PGbTX1cLeWkyGruVCwYrxrxBN57lkJEb1MDE=;
        fh=BqlbTUNEF3qPJQTCZF87NoZvTSsCln3ZAFLfytENF0w=;
        b=Eath4m144D97TCpDQg16ZR9+uGteJE3G6haJ1NHXU96bs4L792A8LSCduI0FBnNF+b
         brYDPyEAu5tNB+PJbl2WyhPVWR96gY3OoVINQzVTUnG+IDG88of/y19ILUoNRQzYBf5g
         EaKqGqNCKUYvlCgCKw4SASjV0odtLBb4/6PmGlFO3ZjTueMInwsuHcnIreoqrsTkjkXh
         x1qEnvK5nutA6RUbjzx4osnUpf/QTl2Heevhe/YThH/1yzK/R+vjMthhodWocEMItl/q
         BcXPoRVjSN8FCUuttqdERTGFoq8nyTZDkBx6Ne9+dQGX2TH6BDhsUL1LS/3LkLvNxpLa
         CYcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791389373; x=1791994173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ttUqta9PGbTX1cLeWkyGruVCwYrxrxBN57lkJEb1MDE=;
        b=B+eQ6JI99shTilPYkPz0/5ExNCDh554HrDBqDiiYEq3IL/8y0R2qnd+hmKqwFmmxiz
         b5gUt0ReAH0njscgei3XjR2ag1gdlHZYliq+8mBASo3/8DjpYC76zWLq1uiu+XOqMkUG
         0kw0cLkv6UjjqD/tSvEHfEv9dHZGWn+oRCdS8MzEgbe9sGX/GgIfO+aj2WDNe2IbIZBb
         HtAqyv/n4w8PT0I7nU9UeFQCnt4NhnQicZikFlgzu39f6pvwmEz80czPRlwL3G9tOsuZ
         yYghrlNnwd9DgvsqRpe8B40+pXjQt/GBofo8yk+Dc995gkXzGuBvFCYz+izA89idGUB3
         /k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791389373; x=1791994173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttUqta9PGbTX1cLeWkyGruVCwYrxrxBN57lkJEb1MDE=;
        b=kRy0uxgjbVe0B6UhfULEbNwlqLFJ3kjQ04ZT/RWBYMhG9SiEUAa8mfODAiZFE6VDaP
         QsNnapqY63XV6g+E5CxlhMf4sFVnevp2Dp1kDL0onDvI/JUDJDkyzQKRvQhsJH8/KgGe
         +sWScezbKi6IEATVe+WG1SEMRdYhGfh/psvUPErPFbgjSzpLo7e13a6yrlR4tfVkoAWU
         GKUJz/uwEEb9GBnEh0CBHnJa4bxs+6PAmFnPRnkp0FkClNsq+KBxTv9iCRwvxOnTAqt9
         vuVDiYT8Fvb3u0CSOcNQHaNJk2FRo+iUvNRG9Uzfw0/1iVkRCjfiZzOw88bzuZzbWK9F
         H/gg==
X-Forwarded-Encrypted: i=1; AKwUvBwTDVXxQCLShsiMNyQS0xPuo1giM8Oka7Fxgz79JlN4mz3X0IHJGRltgSPoneGFQWJXS/mZQUyyTbqwjrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5+jEfy0SBsdaTzG74PoKFefJJvhxa1OVXMhHpZTQ2PLT3J+6N
	JdIHILc8bZZ1jx/eD8d99xlLZ/2DeeXxf+MG6gfZU7fH/EUm6Yg5oGf0vIjFoDYz58lDsS70j0/
	qHzMJPTTToCqmbeimiZ+eSO4bbSxiNMA=
X-Gm-Gg: AYBFou2ti61QdXREaAXLDLjS8UFqyvcJWCPk8r26/6nKcZGnOMibRd6hCjggoAUv8t4
	haAhg2CYCF1efSwoiEk2wrPY5qeiqgJ6zheMojKgfgjX9O+DH4dXPC99cXB6i/k7iZZey8o+GwA
	0w0PaAIvcVU+amOYUR+JeGLPzsPQvsaE2MsL0mh5lo5Erk9uDy41HwuFWdEAdEUdgInVUZiifVv
	W61q04nwbwlhf9er6BBI/7BIG3wKrZzQ3X8OStQMqryew2LEf8J2bA6avLrwgnvAN/DGf1m0Xmk
	Wk3+uprUdiM2pTvD0N1Ham/mh7S7qnBjkjuR60JNdypib0ZE2df6o0B1tjF1p/uT43aVW6kLoPT
	/fqh5FJwskV4Di7SPAM+Zf43hGpHM4D9AihAotePuqw==
X-Received: by 2002:a05:6402:5112:b0:6af:dc4c:5f28 with SMTP id
 4fb4d7f45d1cf-6aff455444fmr2701133a12.37.1791389372670; Wed, 07 Oct 2026
 09:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927214334.886582-1-linmag7@gmail.com> <20260927214334.886582-6-linmag7@gmail.com>
 <2b6757c5-4cbc-488e-bc3d-42a79c7273f8@gaisler.com>
In-Reply-To: <2b6757c5-4cbc-488e-bc3d-42a79c7273f8@gaisler.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 18:09:20 +0200
X-Gm-Features: AclHuK-43SsAtTuiKbLSF6aEake8k_sveddO-CwzpwJVeaZpYAnQmihwoGLUUn0
Message-ID: <CA+=Fv5S69bJDnhugt4AF1BRHkhhsvfpCmt29Ox_ZrvRW6L+ZVg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] sparc32: move early memory setup to setup_arch
To: Andreas Larsson <andreas@gaisler.com>
Cc: davem@davemloft.net, sam@ravnborg.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Wed, Oct 7, 2026 at 7:48=E2=80=AFAM Andreas Larsson <andreas@gaisler.com=
> wrote:
>
>>
> ...and does not apply on top of that.
>
> Please rework the series on top of the for-next branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git
>

Sorry, my bad. v4 was still based on the older relocation
patches. I have rebased v5 onto your for-next branch and resolved patch 5
while preserving the sun4m/sun4d probe restriction and the updated
phys_base diagnostics. Sam's Reviewed-by tags are retained.

The series now applies cleanly on top of your for-next and both the SS20 SM=
P
and LEON/HIGHMEM builds pass. Boot-tested on a dual-HyperSPARC
SPARCstation 20, with Imre Kaloz=E2=80=99s SMP futex, CASA and integer-divi=
sion
emulation patches applied on top.

I'll send v5 shortly.

Thanks,
Magnus

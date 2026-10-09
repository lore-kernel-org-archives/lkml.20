Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852D49B464
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576993; cv=pass; b=dNc5wh+vV5saqKMoqX/Q61rEZSS1UMm5SM7kBJaSZhioSwLao2ffbLC/WUGy4SO4yEUFe61+phRj5i3KRMog7Bd+53f/bN1r7rrU6EEAXoNymJw1YQXLs2VaENrsRnO1pyOIoo+Ifx1sFZfaA0i/hvhx67EsXEziUChxlcjmx0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576993; c=relaxed/simple;
	bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3XhT1ZQq886Gu+sPgPrpdTExNU6ifo1ueBTiAvm1jjxAhIozRFXMCPN5nm9K/F6YInprpu8mPGBZO50UZmOUf/S6KBbZC+cb7NMvm9GfIZpAb5nPAd89X2YcgIWIG+kJFXBMzWW/tQhiZ1IQtBgmh2iNnyl5uDaZLz912LPJsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=J2PJsXPj; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="J2PJsXPj"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8abd68b3937so429527b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791576991; cv=none;
        d=google.com; s=arc-20260327;
        b=Kqg/JbMcFAZEIXZk40LmKdh9wwoc23Pc4w1kl3I6CcMzuVJ7as5D/Lxy4+GxiCU1NI
         vqS5FKBgHnEM8KlSeIbacBR+wjKroV988piKN3WYpd1YG9M/WUMXa6uPWlCBK4OzXoxx
         9TuxS8ZW3k0q7VsWfKxmQn01O9tyaA0hsjPaImmMr+YBIa1FuIOgXV/1B6OoTmUshZeh
         NX0MoFttWTY31QAj3AeBWwWdGIo3LmwxIFJyW3B47b2P5bf4ugEvZnn/EL3XcaAIXL3Y
         PFYau572e1j7rjWQmLv5w3ciWsO95R6w3+MCesc4a3bkkiM5wgmLLfG95gDLNnz1sCct
         b+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
        fh=agkJ17yoBRzHPYxyseprQdJU96k3cSSz6qOfirt9dh0=;
        b=WEFSY5NtgtfHysu7Kg6SkNb8I7QVTWq34GGRCvHN1n4tiGhtBda+GFioufSnqLzcaq
         qexMfvV+cPf4Ou3NUZmD18VgQu/N+dHgWcrgjBGVLU6botV6PJSRjEMkpSYMahjg5cB+
         chgeAf4d464NwyYb2AHE95hNZytbGGPwmWhbCAwzsqM3eOrcy6rjVJ5NZSs3zrCSkJbE
         vi+UnFmUw3Avy/F/nQ5TDZdbrbFYop73ncMoPhTgpMJ26+SlMJoIb4Reh668P6Npm6He
         lSEkAtvP1m9PRbWvkEAjCFdh9T3UVIKvVB8suhNHE2skAxt4MjmPVbgPNJUg+fUoLYhx
         LIsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791576991; x=1792181791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
        b=J2PJsXPjVseJD/FlS1ey3Ik6q6O/j9URIcuzNuHvqwAAHUIdkHiTbCsZYMoNDZxVyx
         CqsHyrbhrIwLF/udZUSYeV6KwoWW5PRSyZW359Af3xOlvMX/qI+BPXz1J07q25rvTVeJ
         wFu8WbOQzfdR9A/0FWTtr2WyXZq40SjQ/iom4j+52+gjKu59BWljoJCMhm51OKojrjg/
         iRa94YEeowQF2FRNep3TLaVoT936kzrZ9Cbg0nhRWiJ0LvMYhvK9TIRerF6pc/JRFTOg
         Cv54jBZTDLUC+2yZJ6u9QdTSq3pCvFTTkEycQAfDqMws1Yq/lTmZYJn+Pe4UGR194c0V
         2IuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576991; x=1792181791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
        b=btYlhoEEGlJEKa+KvE49AdYRtHZ+UvHsYjbhLud/o5WyJevaR2BIPJIBzJ9u/EERyC
         eZ2cAaxvZMofhss6OKIvqYifTbAo/nUxXSi0K9YjA0zCVJ48BBRARkZIgvaO4Uq/jWkX
         PvdYIzudg5UoCSRLKAjIMpwZ8uHHsYT9+XRw4Lnn05ck2qy404dt9Z4VD1KPfnpPVIsN
         HDdKXseb5jxkryxZb6CpDfrApfEWTay2w3MOS8kcLJGX3bq0Gf6+ghxxyvsHsExz949Q
         5XwzZBYEEGn+kkcZcWOf2i/A2jztafXORBVr4+AVl2s462DlhmGSsYuOAiDxSj/fPs5e
         DuKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw161C/j/Gpet+6bdstd5ULZ7ezmkGpUup7gcjrJFSQOgBb0957RjZPaOoz0V4KIdSRB/fGmm8iORF/vgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLNAoeQ6lo/mObCCFUmSmAOBlVwR3izyaIkYUyxo5YGFcfosay
	oN03+z0+4gJZEpwPFT0H61vdRDuLcpT095GYox+VUC/UDGWElDNFmPNaUqLTMXUlTsxR6EW60Wa
	hnvcfbhsHjKyITgqnWIqbv9a5XUGNEbacSiIHd9zVHQ==
X-Gm-Gg: AYBFou2Kp5X9IH/zW8AVBaYkwo6JdPa3ZUUxTCEfldZyo2s6V7xzSRUall7T1jkJA5o
	MKxvSgumtBI4rF9sEwSJexoHIByolukbjxlg81fjnTchhiyFMhYpH+hqBs4aGM/dTl3hsbhtM92
	ERcOqF4GS6q+l9VFswcMOB2urIgTHWsbo/syk5cUIU34bZyUiVxLZi76r41vtgYnjSxFTNOvtG8
	UdmfAA9S0RpP8K9uVGpqINdxhUXk4HPdbgo+CdhiXCWMF26QTCtignrwhVGx4hzxQVObMWHtVWy
	Vqk9U4OLCZ1qXIpv7bhEPeXxWOT4Z2YwCkB+DYK54PnG29oOpj0vx4U=
X-Received: by 2002:a05:690c:7483:b0:8af:5430:23f3 with SMTP id
 00721157ae682-8b07edcf030mr14065407b3.19.1791576991277; Fri, 09 Oct 2026
 13:16:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai> <20261009145800.rc-reply-0001@kernel.org>
In-Reply-To: <20261009145800.rc-reply-0001@kernel.org>
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 9 Oct 2026 13:16:18 -0700
X-Gm-Features: AclHuK8NoU9nFQdsnoGWTbzltxdeCAjZZJguqpmO0Y-nucjuamlvwsTRrY9h3TM
Message-ID: <CAGYn4vzAM2RVv3y5qW1C3P50qYN5J7UKmj-LsMDv9EdqrX=G6Q@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "i2c: xiic: defer RX_FULL until all trailing
 bytes are in FIFO"
To: Sasha Levin <sashal@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Siddarth Chilukuri <siddarth@nexthop.ai>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

Thanks for handling this.

Best,
Abdurrahman

On Fri, Oct 9, 2026 at 12:01=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> > This reverts commit e6fe3ea04f0113fe4d47c03d76e03805a4768ca7.
>
> Thanks for the report. I've dropped e6fe3ea04f01 from the 7.2, 6.18, 6.12
> and 6.6 stable queues.
>
> --
> Thanks,
> Sasha

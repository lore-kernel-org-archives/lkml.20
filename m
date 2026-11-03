Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793674800;
	b=4oLM59rLNC8VoDR4ptns2mo2NXPBOBxNs8N8kINLw268ztahLcGISJIwUBXwnU3FQQLC
	 NcKeCD9AcgVEvMn2rdQ4T7wp3xRQkreVJHTrvXs8S8dFwa9AE+EeUWugLo8UbujZOvXyH
	 64EULT7wF06OLHHBv8YLF9YdHWmpUOoinhF996a3V1BX12iluFHZb3Y95ytqht2xNDJqV
	 OrY/Qj25owL8tzYzuhqqHHtSAk/tYUfXYAnj90I2Py4LjlXS6BoJDF0djifhmYx6XpHxp
	 tYx4RT8Zg7M+PvUvUBRcBN8qSaB/2vv5tBPbdQcmFoS44e64l3Zp8f1+yuLg1MMws2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
	b=iTo9fWt45S54Y39WSCDWfvDdxF8uRX5XNX+gn5H2q1/cBsMpYCFp1qLej5lLImH4zS6Q
	 4H+MiaEakyxjscDhUkjAhHzul32vQgJa3VkwNjamkUplSiKHauFc1WglNbolHADCpmCLl
	 aQj+WSpMHhbCZcMqhblA6NlzTu37MehOffI25BkEqFPRO4qVrYGUSCe/4qMfjB+E2ohzY
	 i/ppmptESvMZQ23S3JFNx9eDLaxfeQZnF5V0dJrZHEY1HY9heA2OoOsaO0A/D/sk39uLJ
	 L3Lm6JUKfUl3Xmg1dNoGsPyXOn37Unm5UXsUOcCfH8VQNOOl9pKF9WIKfi2Ys2AZLCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaMBHAtc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A379606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A379606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaMBHAtc
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so2825891fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674798; cv=none;
        d=google.com; s=arc-20260327;
        b=Adv7JW2pmyE85aVFOcSNAgcfRzjkdMuX5N6PWXMFTBeQLFyal90sdse3zHqer2x3HV
         mm8H608RDMZlWdpd5MfCnMtC88tiV8fgpiXoPwtUDWqkA/kjcIf6rTyn6iwUDLwajIYs
         YrZwoGQryEVwR2VzFnaXCBlpI1ZFoAUzFvwXq0PEjAk8BPE6PhQCP8gXBInwWnzkKctw
         4EwUMoAK0qS5PwFa2XmQ0mG9mtbur2kQvWa0noN4nUuEV1ifYLnijjTWZPdgflxWz244
         tTNM525eVP3v3MW+1rW5rLPge6+j/RR2ty6DCiF0+h3zPSOv5IKNvGXhIJrxQWbjHJOE
         atZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        fh=m9MPyh3fCTSYS3JA9b+qdMLOad63rR4M4iPa3OBUuzA=;
        b=SVQHc33G+uRaCa7Ma9NlhjLLaY7Djudes5ECs1hIjKXpG+QVgcL30H7rP5/u4vQ2B4
         uf3tuYhwG70fKV5gErrUeCxzMeiw1N37SR3uXduDXG+2jC2vc/hQt2bNv6KRpTcMohcc
         olZL0OaSJK+5OMynGC7FbVEbs/bSFNtc+H8m9AENV0vuqq73n53UnRsqecmRaehBBsy9
         MBgvJeWntd8Ut2i8ZRQy3d5XiIPo0JaFPJTMvBYBPBninQXCUMpazqzNHstv8r1674xZ
         QY+tqtMuE9Sl8Qpcmg1RUlxbU3oCxNSHBQZ7eEzknqqnPZ4sZt9qNF7qdpOiawE6AhL8
         B2UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674798; x=1794279598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        b=xaMBHAtcgObBuntoHugcBxOLoUrHT2YIGTntbFYY02LjeRx696VZdOCXQJc7RUlHGQ
         WicxPxCoIQt8eO2DyQwNKvexJveUUxNzN6gasKaLm0EtSkMWigSBdxDhZUKv6XcpUM5K
         Y93t+DNvYnLqzloo9M7jUJebky4EjyYaJXhv4OqDnNG4iEfmOQ0kRn0vjbFyiyMltRf+
         6qOEG63pEBR/Z1FVPqHbDteIytOeTLXaVm2Dy2gKHGjA04yf624+iCE8iz2WPzamhE48
         SqDztXrglog9gIw7p1baheGW9fXAcHTAnldQ73PMfzY7n+MUh/AOI6KnmoZrsqXryyWX
         PYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674798; x=1794279598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        b=tg3dGitOncZ/dqEI9BkHtBXoe3RBUtlSV5qXkGlBNZV2T7iS19F0PNcTIG/mEZuRD4
         RlFXyRxYn414762XMOAzuySrbh6O5JrnBUlVLz2P5lyciwGDpVAgI3/nSZkSy4U4zXU0
         nma9Da04XGyPeK+F/kYMHbh1iJCO/gEExUUHbUjmG0lOOCNm2yrDXOKdzjjoV9ss33aZ
         fEbC8eyAADNHv6n5wuKSMtXuEvMw4F/lYy+SpcckIf75nPBJW8XHrlJXx/Q7T8sPNvVX
         p525wd71IToqL/rhnRFQ7oKCkZ68A+LCxjwEC4LzfGTegXZUNXKaADmKss+TZCnv6/DH
         h7EA==
X-Forwarded-Encrypted: i=1; AKwUvBySftdzlARH0ruRsX9X3jjitwQFEZT1kw53ouwQSy+JbQc4Ck0o/YzSKdP/XGb4SaGsrE05Fje7ihIx0Ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z86QvD5pfqjh1HAmJADjjbQbBB7Nj5l/ASq4ndHqUaer+4RMRGz
	3olRHdDUhOv72J41O8Ax+6jnvrHUgLA8V7rPJMZIV3pp4R89Pd47IAR5gTcF28jSikFXHOYNqQg
	cutFc7U7bhWU7SNtXh7Vuztz6Jt5zcSg=
X-Gm-Gg: AYBFou1Dzlk4hbMVA7I+j/yY2iU1T/fRaq39jqjIhE0Rk8hgE04cc/5FdEQ+g7UXk+N
	HGOO4fPnMUijdkpGoz16MhiQ5yUVANNuVrY5snExm/PmsKMJjSNg9+Flp7Q309GqHITTpvDiRJL
	/3GNnkAV/DAstn8xQRgK9KgrxHV6PGG1SrlNePgzrMrQ2lPHISFx3sqyFKj8PpcnN1qZm0I+pwB
	DjJFtxnS1ycsZbQ0uCfAmr7WajtQHIUk+pc1tMxtvxflAH+ta19qV94y+SNEuuywQLuEXv6MlGc
	SPx3wVyAxdgtK7a1czT2XbQ0lO64+EZMXeI9s0oITa/0jeeER946XjR2FyoQ9vNwEWcirCmUH0m
	uUXgR7BGslCoxS9btfVcvONcaF0Y01diyvKEYz58=
X-Received: by 2002:a05:651c:890:b0:3ac:4f4c:8da2 with SMTP id
 38308e7fff4ca-3aca5812ademr34312701fa.17.1793674797546; Mon, 02 Nov 2026
 18:59:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <179260197668.3127.18219777718091081046@linux.dev> <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
 <179286358623.55649.5397316745104390556@linux.dev> <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
In-Reply-To: <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Tue, 3 Nov 2026 09:59:46 +0700
X-Gm-Features: AclHuK89EtRkVz-OsObyYnxQUnt0Uu1dpICeA0ah4MC2QsH7LZxgTCAmcbRUiEw
Message-ID: <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Igor,

I've tested your changes on an AS5600 connected to a BeagleBone Black
over I2C2. Everything works. I'll put the details in the v7 cover
letter.

One thing I forgot to ask before, the registration rework in the IIO
abstraction and the driver is your code. Are you fine with me adding

  Co-developed-by: Igor Korotin <igor.korotin@linux.dev>
  Signed-off-by: Igor Korotin <igor.korotin@linux.dev>

to patches 3 and 4 in v7? I don't want to add your Signed-off-by without
asking.

I will send v7 shortly.

Thanks,
Coirul

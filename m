Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4AB4AF14A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378050; cv=pass; b=EswQprA2/f5HiqBGS1UiiIdocI8ZIedCvdSv4tX7K1Y1/lldhZiL8j+qYZ2/O3cDfOymY838Upm7KYzBGjII065nkYViyaKAc/ynRiTek9ibbQSTh2n4QySgeKR+jPFCJFXPghX/QYfM9W/qf+qg8M6EVX8pMimOaM4PaCJc4SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378050; c=relaxed/simple;
	bh=eLHTLx0sDJsJ3UdAPIBmpFXK0Itit+qS5fZpvv0jeas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfbkoh0p7JQCEz7ZFH+/0fO9BxutHgP0HWQQgvkSBsg9/GTBtl3wydejnOehbRhpkY78OuzMUngCfQX14ANW5bTqceBJxJF9Y/All6sxo4ZfC+bNIg4iRAOIKDPUzGdibYHyJcupQyIqoNJq+TjnKL7itNfKH5SOxaZIqHxoqkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUWb/IbW; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUWb/IbW"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25ee9d1264so56105066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788378028; cv=none;
        d=google.com; s=arc-20260327;
        b=bO3lHAG9BhgV16AMcq01+QvtivbWGRWr2oGF+dn0waoPTcQxLWl4pWuSNWlNJusRhv
         Jjz2X8WY0gKl4TAopqulaLJghDoMUGOpFt1Y1wXBllrqZmOVpxm8yDlpTDlvSBh61Sva
         lh5bL+nhsD7nLMFTCIDHLlMwVC+7WvfqAz2OUxMXFZpjP5WSvO6tmRMTGZ2ygEQVxBMB
         bTaTM8yYvmQEeJJZMpZ/0dgdoLpnKpgMIhPbDVtwa6OqwriaXrlbGWlAM2tkCWWLvraX
         zWsLT2ddP5oGTDZ6KrILHOUO9x73kAFyv+0ifTn0vvC0quWJ60ms5B7DI+kJcdmuwJpT
         CuUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        fh=Ns0pzws0sw9EMydTo5H1j9vfeiWY0srgV7ANdi4mRRc=;
        b=Emx7DM1brEgmStdqRg7RZXXr7qjULqOp8oh+UxpqVnaFT8RT+8Ws4JgAMxVQtNVyFo
         8kPHGYVe+rnY4Gj0yb0zwUuBBq5L0E2ZQJwYvyfWKImYk+zbgYE++ufnYt58vNK9cf8a
         27FLtunrs/drMIg68YBSF/lsnVbbjJzg9QEgSBC89ecqPZqaADzuOQdcTXqQNP++rv6V
         GoVI8p9aXKM02JzjjnW7P9AsAw5IF0zvKzwoyrP2FxuYj/ao9m+kwnflFnn3pa9SnOd/
         bwqRG/0dwGoCVr+7K+kXVyQIGIXVBnAPF5qHOcQ7toF3E75b2SgbCE206W32kGMllP0A
         JCDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378028; x=1788982828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=RUWb/IbWnwRrHbpmkQ/geuHNzbmDZM3cbIFwkfhuVSlkzDe9K+TllRV9sa1zWSFFNs
         P3UEISuLLof4pQVZAJksf7DH0AF2dwvAhkVTxtsCHL69q9dGK1yGxrjV89XvNvcLbc8m
         BqOrHpBBJttj8/slVhrpqfoXgq3JnYrl9wRfF1IvH93PMsBNKVxTqg9Lw/MoDl4YjSST
         WpmBUs8pxfEhgA1UaWwT/3P7AXVuaTtrPumsRcCwNtWxsv1UH5u5Ez+omICA2H14FPdm
         aU8Ee3Gi7M3UfMH3RZa+aoQQrTL0LbBcJBfLlPI1DdLYXaw/ofFUs/TXgvK/a5X6VzOl
         QgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378028; x=1788982828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=f3oMRZ1/FMUPmRrK9rGxCTOLuCkH+eRCqMYHfWKHshVek/qzklqlH03mzhWX0YOZrR
         SSfvdTLb2DSUCgZVDPkNlsrnDX5G/iT7/peso4DARpPRVMvFkIZzHREmmiV7ADa64v8r
         aBVG+TATSlXcAcvGNiOijNNd6UrvupRRnd2rluwLwYlPRruj0WPUdbncGIT+w9WILq/h
         slAPXz8Uou/212kxewKIyIwqD+rVMuyH4KVlnpwY63GgUI4sTmUi4USUeVCQ2ZDXb6Ri
         +suofmiJ3mUHvyVN5K9Kn+Tw4AT4b7blxZUCCoUAsERYDf9/j9owO3QyECNZ6p4yQFU8
         A7tg==
X-Forwarded-Encrypted: i=1; AKwUvBzNXvPZrfRHP5K/0jsXXsZsogzoWNqth+z487T0B/Q6wrxi0CDu/tkFLPYymehhE38dDmTStXZdalpv7UM=@vger.kernel.org
X-Gm-Message-State: AFuF++n3FwVSjFjtAjn/RWg1TQvX3i0S+EYdT8mME16eaWeF7Nyv3vmC
	dx4dzLCNnxwK1YlZTPbiyVFU4USEMjwjwyw8oiIljlkDBl2GeNu+eI0TX45FDMRk/RQgkCg3Z8c
	4RLCWyJIFiOhb7onE9tpeXhbHb1lzWxQ=
X-Gm-Gg: AYBFou2DTcRfNFjV2X3JBu5U/HJMZ2yd8SNzH9Ioxcrj02MtDZWWIEQQfP8O2KBv007
	gTaZtxIv+FrqqCRYFcuLfeGk/urE6mHSQvupix1hStsBIm6jmXEh4cXmdkkvk40qxJNnGmblFMw
	mSVq4qDuw9HPcwrqzRN5viPQS9DzVyrchdyiARifenWP5ldCy1XpCflgKKjQRY6EzwobEnQnqO4
	0OJ0MPjaZPiuap1ccz9ENrSiCF9UAopo5VfUIeqkhmHv1oWGUyU777hy36LRRnnjS9XrZ1/qOds
	5JlT4zd0jTX2vyNzuX9at38WRHCAvcwTu2j9xLBcATY=
X-Received: by 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c25d53cd18bmr358830066b.7.1788378027879; Wed, 02 Sep 2026
 12:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260902154616.GA2133376@google.com>
In-Reply-To: <20260902154616.GA2133376@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 2 Sep 2026 21:40:16 +0200
X-Gm-Features: AcwNN1Ue5U8Nrt8IK2CbOEno4dpAA-gcYG8T0qYRXxkQ6nYlNe8G_uXeI7qiNIw
Message-ID: <CAORyz2Kt=rKSJW0Q9pFJiBsa6nPGhHdNrsTsHcE4Qxpq5RsSaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What Acks are you waiting on?

Hi, I did not get any Ack for the regulator driver and for the mt6392
dtsi yet (patch #8 and #9).
I just submitted a slightly revised v10 [1] with an improvement to the
main mfd binding, so I think it would be better to "renew" the Ack for
that too.

Thank you!

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/T/#t
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

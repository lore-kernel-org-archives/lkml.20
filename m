Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8A3914E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456586; cv=pass; b=uoj7j3RcgPOHe8hf9VnialNu6h84FeBpECjVxa4jQl9cxmmgo22aMvucJKPgxTfXgad5qxSnvu7mHlQvjQ8iRa9lcsXHJ5LfbuAsMs8+egb5Z9QyxYnwloEzxR8dw+y0E/K8iT1HsEUQCfvzn6MIozf5NDHw285/7+DjnB7EhXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456586; c=relaxed/simple;
	bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeW8Qwzs3uSu25MCDiNFYZjlfXpJ88PIcvuCVCD0q6zbOs6OZf+Eex3BSk/kO+Xw5oGrNum7SDER2O4aq+xBksZZw5qYz+YcetOcz7CEg8hG+G2du+XHGdE6SzSi6f/zLujgVRnzUgyx/q28C6nsVOO5I0xgAU+6rfm6+L23iFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0tLDTUo; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0tLDTUo"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so7205248a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791456582; cv=none;
        d=google.com; s=arc-20260327;
        b=Bs0NY+bzzCfoAwxJm+6qnVmZDIuXb5OZp46p6SQX8Ho6McwAsVslO9f2WpcOUZmuVE
         wuNk/dl46pqaXvVsUwNpI7WXo1Jgt6UU231+0cO4mMRFQAN9TFMFckqRapDPJKC4Rlvk
         /mSWdkk9lXeUbacYp3kpbKxAxmQ2mo0A0u/o4+DstAFE5gPXZ8NCATzxKkCIsOpgDu+N
         iFg9f0GIFf/uchotbINYf7oI+cE4z+iaB6bjqiI5Z2+zOJ694RShYvWcD7HNQYNwNGmi
         Ezav/YzDyRZWD4V9mmPgF6hStyBnECq2ffRp05SiimhjxmreXm/5htossYUNpaa60Lox
         xzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        fh=Ci6mln4fD0wabu8KYzl2H8kV2KRj4KyvI8AWfeR+l6w=;
        b=iRYWr62FD9rWEm30/w8BEg5SEo7gKklxM3F5gVZYvmgAPscdFi4QrEMcSqv7lHhpSE
         1fWpZyqSVfhGi+/xSeuekFKDfiuqlxQyrP66gN0qehw3uQJL3eQU227IcYrpLl2nM/ZG
         4EDqkma6WmBStquuacPkc73jaK3VYeBj9J8S9jh6iL3y6L/YyxiT6YKdNWf+4ydPeJJt
         8XHA6vX26prFZW6w+7wT5bX+H3M4ZQpBMmiVWLtgDw086PFPRvWP20+VXXxwySqOjL/S
         ad+p8Enzk7UHDsDcXizEapaWAA6HkwKyiMON5WDziwjMDI2YX1Mh65OJ96WstEwClVus
         mpKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456582; x=1792061382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=I0tLDTUoPKoyMunz4I9sOPhke7R3WJmC26R214stz14xyi3OyEkGQPq/NJ6FrR354t
         Vd6An2g2rsK44LU2qTLQhiBa6Tm9nZgxNb3Ag2eBw27BdzToCmKren2pMuTipCb1v9ws
         ZqLTdYOKiR3ATkNujJktAfA11VtQHYBEh2261JGqO1cjSt9RN6+BtpLp2gTNk4guTs6p
         dopO3hOUPfpocp5DYcCZtr1Z06ZMNSv2daeCJ7IlLb8s8uWPOXiL1rIMK6EP0fwd18H4
         4P6n+j9TZOX7GbHvPiEWUIsBgfuTo4+WYCxyBIoklvuL9nkfNgzpi9Splmglb+OZ5z/I
         1BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456582; x=1792061382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=SHZUe/n12Flt5ixzLFtoZ5ZX9gDVLiX0kiJ0s5h4PhcQ/JrraAR1JfpgKbOdYnlbF1
         sTuCDG3c9CeUNFQh0FGHZTX5HfoXy8TNlqjrZNPWdXcS+0KvPTNyhf7YaDod5702kTlM
         NXxkkIWIhWS/pRfdRcKugYNKd3X9OwvREIpIE4RB73IN2CQxoRXcIAZPa3GLTTgx07tG
         c1g8Z4Mv3JbR3Az+25y1ujTu3RnVDnfxHGUdZs4mKYDvfcnfY9kOguNNqwnBJoMhjfwn
         cgxVUhygQwPd3ZMZNCg7hrkZxNo62SrlkR8xQQ/uwRptVgPL9YqbYQ3IriGrEGiMxk1f
         rXkw==
X-Forwarded-Encrypted: i=1; AKwUvBy4hzB/RTJX+UMmcV0yIqqWZ8Hfktu1E2molZEzy1bqpXDvArZfHwfftHUl4xXiCUZA31+ZbyAcRwl51bA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZjMNP6s6TxudIqi9GhlgYlYYdTspDtZZVvR4yxeei6dfekr/E
	bu6I5vspTTcnaD1t66p1R72Oi/6cI887VkbQeJ+kRil5lhqvJ7rK8bOR4OzL1hC8E6ECvaZm8eN
	kaQHGrK5qoiHVvJpe+T3jNra0xoR6OII=
X-Gm-Gg: AYBFou1biJvgVxLns90Gyr9Bk7ygVtkUkJebBdfU3Es2QepPY3Me3CuzMvCsEvxI1j6
	2vYlVFnFH6JARl1bPJ6qZO/VBx6bgViSIpYu+YQrelQ8/xtJH5DLRKFYbkXj7VVfRaAADOKfy8i
	JShqROg1t+zFJAPO3LSs/cYZ4wfOl3JAuAd83jk4xMuavxLfhxm0JqSjNObdz4BSjz6SAexY4IZ
	rRnEjlbbqbDP7NAVlFeJVAAAzZxCcaEbMB/QnXa6nSOTrynxJgiBs6jPWK8sLors2UkqMJdIK7O
	GMLjZ/S31o02sd3kOrN+V5P0ZrbBs3RDMSXblbl60Nvubkqa1XuwMFrJjuh7gvi1ag42emWb/n8
	5yFoElv5YXxJmvTKIRwsn+eeqQwpqKfUUfRrbKV97L8XrqAOYCLmJeqTjgE8Ojzbr90g=
X-Received: by 2002:a05:6402:4019:b0:6ac:afa3:6f72 with SMTP id
 4fb4d7f45d1cf-6aff3756d74mr4800849a12.5.1791456582185; Thu, 08 Oct 2026
 03:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007110858.509341-1-phucduc.bui@gmail.com> <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
In-Reply-To: <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 17:49:28 +0700
X-Gm-Features: AclHuK_fTTXIpKAwLFkuMWapY1wvxwZhKpPugkOpZYUioKYV77e-gJQAnEgFPDk
Message-ID: <CAABR9nEOBf18aC3yUx9-d4TdUYdpdoxuXeNSu76Y3B1HYXytJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in
 FE startup
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary.

Thank you for the review.

> Thank you for the update. The snd_pcm_hw_constraint_xxx() finding is a
> good catch.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I actually found this issue thanks to Mark's review in another thread,
where he pointed out a subtle issue with the return value.

Best regards,
Phuc

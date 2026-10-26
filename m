Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989421;
	b=LbJbpRhdS8SjX+qDUkFx92JqZU4AEvD0jQa9wIvHD6v+OZbkhZn2KtenOKkkSK4w7eZQ
	 y7ty8WOW1lWR4MyvSoimbORUfLmuaQAqcvTb3FHYycRcVzaC6LIFD6WveHGNAeas7d9ZB
	 2CJ7EVklGnPA/VWMwkI48+UIHQ4cmWTERO2KjjHEYLU8nDu0ozns1OHGux172ZFDCsjPr
	 p/g8l0smc0kNIhOdHf3q9scBsa2AQ9IwnBubbxefOWOEsGjt3uen2C3qO6B2HUzhERO1O
	 gAVtKbeFJLnL7NdBUZ8D85XNj5IuShak/+eXkiaLEQ4t20U95IymwCgFdGhd6D2CziQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
	b=J5MnlflQvysEAegpgsRMe9Fct/Uf4cvRgji7baJ3qtZ5N7feEBenULj+yi+MVH3iUG7R
	 2Z4TQYfzBTP/WZf6QJpxyN3r/xqtbwGgxcuuI5HwncwW5vGEXak68jW5BrJWx46Y4mCzp
	 Z24B25AkDNFcU9a7Oi7sFzSpMJO3WXm5s9xczrVrreKaP5p4ZoEqdKIlJdxzKqVMrg9mY
	 WDzdwmBgTRBCW9iFhGoU4wx/YgpxSEBuSMthAiAI3WoLwXwug2P+SAJEWnJ4AaHI3VGzI
	 DYOP8V2+kaWVXW9avwRsYN1vfj4j1lHP8U4Rui2uExiUAE3IgVhn5tHCLJMgOjiJKxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkzC4rpU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B47C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkzC4rpU
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1bfa1c11bso322957a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792989420; cv=none;
        d=google.com; s=arc-20260327;
        b=pFaW9MknJzQpr3eAYhAK5eUMnyEMkqU7xs+OmcdCLdt+Z+LgUoZLOa80OsTx6+DT+R
         G1ux1iY4WrgRkeYFBaJgvSNIZu+0AWfk/UBRE76sdVlVIX4kFUEASrEVjJ9MIRDQLUjD
         p22dCTM1Bs/QVXkCZQIpmDMLwLRmVveak58HWS833xbWeb6Daz9O6ZIpno4h+dDFX1r/
         hHgp1sqesrQKfwoWUDkzGqPgjWvB2/EL7qkFFIYCNOALgPyJ2563utLnuYktt+aKDjWT
         ucdOrfLILUNsLiXDrB52CBSRV74YmIT7Jnb9y8SNvX8Gx4bhXWygdh7AdFhcWGim14VT
         241Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        fh=C7A6SAzQJLv97D87k4v/XlOnPnXm7nA4agDOeDplgeM=;
        b=h9+qJGU//ENEJ/M5mXX2MQfFVq4P12rwRhOVRpUB7Hmnce7sDFaLaxb9zx1oJNV61Y
         ONJp4tX3iZS8zKzFseNlgQdmuDht38uAWzay1Q0oSDgxdApD8q3anAEyoocbR+FhR9Uk
         mtCzhqHrDbpFvBPvWnRdAPmzVfMjh0megBWPo7KDWHdkQBdUpPJSjfnuvLcvXvKJbrFo
         qUDjMZaYQgCVbLk2qlliOB5Dbt1E4t9XhqAQqqNpFj+plb2ofwfE7QjBQU+CvPpU24jT
         3IL/es2zahIIXDViomHCuMoUmB96gpYgDJxL4ngOE8W1g/gUNh9hGO3td5hG8Nhy9oMD
         5ixQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792989420; x=1793594220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        b=AkzC4rpUK3bYUZwJzVPhKqqrxL2zGqsAS8wRIrKEPZKO1wEZE8tk3kBYgfLw/u17zS
         lHV2RvOEg1Q3ZCXERQPJjk19KgjJuiT7/oKdueeGVyF4uN4CZ1o5OFRhThBeRjwM4z4C
         0YlmTlnWX64ZFMrstWYTl3JFqzM6+I5Z1PB2XYpZWWaN9KbFHtysFz4SyFawM06se4im
         cA/v0zx8StaXlJxxcbjJH+Pte4EEvh4h6DtvgCVgN7U/MrxC/AIyXQUILYtB+/kdRzs6
         7TBT7ZLETqzhcBtjWCZWlKML7+DPgyuWxlzEwxxq7P4/c+YOhNMt7FxQY4yQTX5SDr8d
         DBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792989420; x=1793594220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        b=MqIcqIJ4ouzgvFzL0pjgOf2dmXkgEYzkVt8F2GXFrdImHGdgPZM7La1K/EzFyZIvS6
         zolM7vWNNWvBLteTd51eF8zUH/yurSfTV0NmpuM/9egErkFsRYvBqL5xF8BWD2aGytsb
         CT0vruzPC/3SYAgdp/wyNZpY48nFlZSULZVIY+vVvz4aH7TSkLmDrV3yw5t9cLM8h9LX
         7AjTdtsPLXHbHdIIldq2yZXJ5AUvzfvG3o2NzNYplWbz7zIgk6UeWjjZtf1S6x3eVXlC
         4yTs3aD+BtV/th86/xi+RXWcT4v5BYRxCTnfCIpTpzSi+sAdYegOpZHHjk4wcLWxoILI
         Vfhg==
X-Forwarded-Encrypted: i=1; AKwUvBzpGfy8lw/YaOVIDTxc6l6JUdQnLPvECHmjR1bEc0fwIcDEgPgdU+02G1c0vA0o11k9B6QEndDLGITE1JU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2KGQ0jP6Z5d8PONKYqh/EbO1zu9t4MCFMnndHr1sksQRppCai
	GJTZfQjMxodGnIIKJVju6e9L6T6A1GYp7ApJwpoNTCMdrU1hE3QdedYDBZNw2MayIpcGXxCetso
	opvvp/qLOS0+Onb+MzNXpfSDZMD5x/Jc=
X-Gm-Gg: AYBFou2pK9cSN21H/iUGQ8xvm2C68WN800fJBCA2oKTx8bZNOmzGQxdwrrWy4AO+NF8
	fqFzFlxLoPkeCpklMfiOLpoJInu+oDxV4SkcY2B6P9Hf2NQ/ZrCR2MKYILWCb8Mf3mALDp54K3L
	8GQoXOUC45wwROniQnfhUBX7ER8nCFSQY06p1zAINv7MjQWd46pWmCFMGMMY1IuJTzDyXbjmZ9K
	6P7gjjSofdE2Pu8S5bFt48Qc/jZqqPk8+R30izR0AONNjUsSr/HuYF6QMeTpkfc/EpvP//6aHa8
	/IwfMfOqmCpdrgWrf/XlctrhNSiKZuaHzAvuE9rNXrUI0kkBENxzqTOwKA81TqIWKc2sEn7xo51
	Tf75gC1i6kZ2iBrLwb+TOtqq+1oJ9kLf94N2d
X-Received: by 2002:a17:906:100a:20b0:c25:3ec4:9e43 with SMTP id
 a640c23a62f3a-c46bd90669emr681750866b.0.1792989419265; Sun, 25 Oct 2026
 21:36:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com> <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
In-Reply-To: <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 26 Oct 2026 12:38:40 +0800
X-Gm-Features: AclHuK8vZ0KWZhabRgBdGgKek8QAVY3LLhkkHh4HIG41oJjGA-gl75AkOIcoHmw
Message-ID: <CAPwA33LZRPs4O7ihinyorahAQiWY69C1pxWnhVE-gTUA556MYQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Sorry, I missed this one.

> Would you not be better off scheduling a work job when you know both
> blocks are out of suspend ?
>
> That way you always have a known sequence out of reset ?

The two PHYs share the BIAS block, but each can be used on its own.
For example, while DSI is running, CSI can start and stop streaming at
any time, so we cannot know when, or whether, both will be in use.

So the block-level setup is done in runtime resume. The runtime PM usage
count makes it run only when the first user comes up, and a second PHY
coming up does not reset the one that is already running. And in this way,
I don't need to maintain a refcount in the driver.

The order is also fixed: the phy core resumes the device before
calling init or power_on of either PHY, so the block-level setup always
runs before any per-PHY setup.

Best regards,
Jason

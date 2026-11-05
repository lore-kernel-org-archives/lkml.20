Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839373;
	b=26UP57RbexyDxlpTbB7PiFj6blM/GwuDk0BIzg5mJwaDOFuW6FTUvTlJWGQrZkYE7tIa
	 KPhlIWQZ2byu2tMxNmjiJ0TidTUTx3UUn6eunUG3abSCRPwRmAIxMcLGYb8ULHi8I+mBU
	 oJqKpCO5zVSPemhprqfCUQ33fD5IT0hvdWnlFoUS2WMQA90AXk1qbYE2BfqPRUWWU2FET
	 ErFA8yJragcYFfv09v2ZRjatrfuca26v1pXfPXAqP0bCrNWhkLexFJRJkp0OZWTo19A6K
	 DY4cRZA5PY5ISoiGHSFw5hQhx6sguaABXlFxahKuYS4Z2rtSTl88+Atcd+BZQi5ZjUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
	b=N4drlxyZoICXy+/jqSX72B2W4q7Z5X29xbnf8DpYgY54CjfsUMXYbRxm+6W7/Ynp4a21
	 HzCCwuOMit4SgUDyZ0j7mQewqGkiYrqMlBPy7Md16WNzi5AsO7B0cuo9iPCbqDdkNsySG
	 GH0xka0lYuIvoWb+HTkqOM9eTYjwTih6ckixnM/91TnaLdFlG+I4h6tUgr6sGLNcOllCC
	 YRAkQL54eiunqtlnoqZ1uPva0IIzdrju5tOipwqng7K8WB7bS1JgdUXgsa95msj5wTuFd
	 bWehOPCpoK48Agubgx9gyfPVulYozLQhTpIAurkRlHmfzHAROyM3b7gThvdOBsq94Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B732606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B732606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed08b07213so5393385ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839372; x=1794444172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
        b=uY9mbbxnMmE4IaVOJ0VIkOgoTWFZ4P0rJG5dzcNqlENu1Gx3F1r3s8DjwhEOogEIaS
         dQsSfvRjQndZAdiwK73/YgpHyiygdWPdr6OvrFiA9EfmP6c6cpk7wwlbZ+YJhltdJY1X
         vnm8TgFdCdUi4WBpdx7Hhftzn4Ex1xG3q1lmrrtKuys5RO/HBgVSdlipenwc5weYZG5s
         e4AjL5AeXitEsWqvrjsqlollwMWPB720Z7WXjcDGyQQpT8e0mGCuMFp0fSqm463PBzFd
         6l4L1b8ErmhYBbej3r4FGwUsc/mpfg0mYR2m34VyhauVl+xaaE8vguDn5bFxHzHNSYEt
         qTyg==
X-Forwarded-Encrypted: i=1; AKwUvBw0pKD/H0VtaUm29zPKgR6wHLJ3V1CfKyXJgY9yfBY5CawQOyoNdOltI2jJMQw0AdtoXtqmUlzQdka2ziI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2KOT0G+i3PCnE3WMas2IuqMdpkoLcD2fLc2DXqFhW3FtG80xw
	QEQtVs1kcF9kePTqYJS4FpxOnlPLIjjBul+8oomP1XRKveROQhxWsWkCxpa0KhYW
X-Gm-Gg: AYBFou0f41N5w7T54gXDyuAF3hM9goRiMpK/Qtp62I9UfdvH2t5hUMoF4MhNXqn81An
	G5U+jgnZDU15EzOY12aFleRaxuqFfRFZ2e7939xkY3TfokGh5M/E9uypsY+WBU04Zt39jCywo3x
	z5ZpzTudMb6N9bvbkUYHEta80odduSEhpA4pD/eCK0/t3M9/JG0uMh04NhGemaIZvnhm35VKhSq
	NHBsXNBrucOzQotbdcL6ApE7kZ4C2lOlmOavAcSrWW3fVarcUYrmDqrW5bSqS6ehO8CsMvK3IYu
	HjlESZWWzsSzmae6gq7TsKDy2U0WUJFwvc1q91Ro5sS6XPXdQyqF4ym6vLlXAKAwvkmIlNwT9ub
	H8BSRHbauhpMfhWqHSrfwLNzJfJPR7RfW0fdEQMZwcOujD2QIeQ6UzGuDeLJA7jGbT77A59S+dm
	moezgTNjQPAXM3gF52VrszdZaCXq6zPCDPltfTLfKa2tAJsnU9DOaDQxLKZfern1kEjHn5vT5XF
	aOgHrGfD+G5XCocjtim014KNCfoTSZBTEdXuDosOX9Jf5fgVxgkgoOilRSCjA9La3ulbPZSAOGy
	CFs/7jUToOMzKGjuPmQt3jZL/lFV64KedxYTuYK78n3jtFCuKzkREm4y4XrrIuXBxQ+8vFP2p54
	sCk+yb0Ovwbgr64gyFGM+8oXfIE+4GVdm0dumfrJ0qHM=
X-Received: by 2002:a17:902:db07:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2eb363ffa7emr179256045ad.9.1793839372283;
        Wed, 04 Nov 2026 16:42:52 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd5202sm11665735ad.6.2026.11.04.16.42.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:42:51 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a18fc7a38so795054eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwHxYNS1ldw7I1jD0IinUJU9CJ2t3q+DuXSrvHwN77ErPK+GWbrZEFwUET21Uge6DS8TSrKNJP0xrJlC/o=@vger.kernel.org
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id
 5a478bee46e88-36a423e52c8mr30753485eec.23.1793839370626; Wed, 04 Nov 2026
 16:42:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <20261104-judiciary-fool-05c4157a7cc7@spud>
In-Reply-To: <20261104-judiciary-fool-05c4157a7cc7@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:42:39 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
X-Gm-Features: AclHuK9UIWS9fpedIq3oDi0GN4EX_Euc3hJiZbuLEwPXjtpIZ-TUvM_M3RT-lRw
Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> FYI, these other devices need their own compatible strings when a dts
> for them is added.

Understood. v2 describes only the SF19A2890, and support for the others
will come with compatibles of their own.

> > +  reg:
> > +    maxItems: 1
>
> Move this below compatible.

Will do.

> > +  ngpios:
> > +    description:
> > +      The number of GPIOs available on the controller implementation.
> > +    minimum: 1
>
> With no maximum?

v2 drops ngpios instead, since the compatible implies it: the driver
will take the 49 lines from its match data, and the binding will take
exactly four interrupts, one per 16 lines.

> Please fix the ordering here too.

Will do, in the same order as the properties.

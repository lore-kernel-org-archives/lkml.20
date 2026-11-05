Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912461;
	b=KZ9gHMxENZQ4hr4plTCNtJa7KOlkrgvI/YmmdIMOYafv/hO+8nbfPWZStmoOPUcD2qfB
	 z3rnacAgQcAfNYp0BPI1hhcw54Tc2JeA3ChUOD6QJ00u+VnYOB4bGmd9UltxXjko7ktUP
	 x25Py+nn7hRX59r1VPtEQzMoPk09OffFWlVvXBkuYXeafTttDkWHGyf/Jlbs36g+hMdiF
	 3PhRGwBC50OcmAESU6waKtPiv/tZ/+79t1hdZcjse2NWsmYflfxkwzNfkaQ6T3YwFrqMj
	 l42Hoapj9oFclVHVXFJN2mVebwb9zmChi2vh/ZizZRQw3YsrVdxWE0KCtEHZYSuZwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912461;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7b+CfX8248YTc0cB7f90DTUeLWviHqXuubKAwrMY9UM=;
	b=pRmSZEtB2IyQRI0NzB9jqSgu3vdpp7Kk0pyJAew5CeSSPxCrpPxAUNf+HFN3RwQT3ByF
	 FVmJhuqyxcGRvKoPMUyLdQXu557VW/nIKf4wubLd3slDLUV/Mt0sPalOVQvXsx21i2POf
	 3hnsq6K0e7GXtAfYZK9H/hSXeNjG+Yto7Ync8KhwpyEVf39UnGgIJWc1frGuajiFIQ407
	 +NM0OOSlQs8kmIoeTrhxGX328U295RmjzD+HbXUKTIWxM0sdGnjCK0k9NWjqJccD6Wa8a
	 Vst29fGcZxUUAPky9FrgJ8y7sDOl9Qa38w1Q39+Z4b0ciqGgxG33eKLGD8EURHmGoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4492606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4492606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed0890476fso12899685ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912461; x=1794517261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7b+CfX8248YTc0cB7f90DTUeLWviHqXuubKAwrMY9UM=;
        b=LHlgcG+Xj/tBe6thBnQnYrm4PzTarREMC8MIZCyj9wMgpBzWxRErTMQIr6zNiLC1LR
         2dn7McQioQDovlyNIEx262HDMyuljf7miTIFSM7eGO4OCfClE7hSVA+ftqJDrfH7bCCT
         nmuX5sG6pfkXhYIwHly1IOatvAarRYLuwQ9C2LjZ5fgVrE5EqBd0PVgwtt6z/eehXBde
         rKiGlwCcESod3+iVjdrvHpVyHa1OYu7eUIydZzH7JSZnyx4w6k+eZXADP2pbLCXlJQtY
         V0vaMd271bK0/7pwc9mQ3kZ42ZUVqmQl74WQWbsspR8cZ82Z4DIfg/4QeVrGivQd6ISJ
         tw7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFeY+5wdgXkxZ7HM1fT2Sm3FtTTQxGzvO4V3JLvc8YaMJs781/3t3jnSMP/Rqf58LEUQXc9TT8wah3E0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V6TxeJ21qcr2xHy7MD5wEfc8ubEipWMr69zix6adEuoZFzqxN
	GesoxLyUYth0dCYHCzEhHcZywZudrXzdPrKbeDL9J5Nz8pG0j+s7P+y9C5lyWLdv
X-Gm-Gg: AYBFou2VLi1dt9Pif9v7pCL++gcAkJtp4kPC10ljlJL3la7+Truzp0VYz9Sv5RO3lwR
	Lm4LBM4LB1yLIMtv61L+XQaEgJW8efxUHLC/KMHK38Ev3+TOiHgzrohvIWIfC/khIsOovoYm0iP
	WuyyO+T6I1OwbTyBcATif6qw/76cbpsepdPrKSAZK/hrgKbxinB/Dov1zf7KbJRj2C7fRopJu7B
	c00Zm0GBYFTC15MbkPCFgNrOdE8SIRJBXJd96ObhAv/llemyvr6GNOwRyJEpUaTulTCE/87UC3R
	ccwpm7GjVdVvRQMzfX+VVF1W/hwoV1/cQ285ambJZL0JWmpcf17GRRP0OZMO09nDh/SKYBs7ve6
	7nGXdX7OjDwXS2Q+aMbKpLOUXPr/At1BBEf4Cg75OyjY5EfyF0YtYTTCVOTg1/a7kJfQWD8FY+G
	qHrNYzK58NQuG2Pr0/Y3whNBRtJlUZ7by085wYd7oL+7Sy5hVNCNyhH+KcBBdExMmUf74kxse5+
	qnev33qkq9O/WnRXbVzHeHo709/blmwSqUbkLMCOaeRG5CwQ3iMT4UewxhKpq/zgdKfCTomX/Ea
	FWjH00JW+g7bIzI5nxwq+MoIukwUC8yW8Ps7HnThZXslTuvqkNZfwBze5t9/FiaHg367+KJhbq7
	Wxq8VK7UWRU5qDqhpBbiUt/0S7RaKUnwMntPsHOxXzHar66M6mUrKl7ZhDMFnHDel
X-Received: by 2002:a17:903:182:b0:2ed:74a:6722 with SMTP id d9443c01a7336-2ed40c45a3emr8939295ad.29.1793912460927;
        Thu, 05 Nov 2026 13:01:00 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0910faaasm20454175ad.47.2026.11.05.13.00.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:01:00 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so160093eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByckU4iebVY+wt/t4AB87BLyHXp12ODe6MDG5K1G6CXGfvCw9gZDAIbPOIAeGMsZIJ9lUxStXy5XaIoBtQ=@vger.kernel.org
X-Received: by 2002:a05:7301:7187:b0:36f:4569:7392 with SMTP id
 5a478bee46e88-36f77103af4mr423739eec.41.1793912459132; Thu, 05 Nov 2026
 13:00:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev> <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
In-Reply-To: <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:00:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5kwLxQZCRF9+ywSavP0G3K0ytvB5+NbmrWGrtLbOnw=Q@mail.gmail.com>
X-Gm-Features: AclHuK9lRGyMU734A3a1_3WSwAPLqlbO5flD8SV-l9TZ_P6sYsnX4mVcOu8Aedc
Message-ID: <CAPY4CJ5kwLxQZCRF9+ywSavP0G3K0ytvB5+NbmrWGrtLbOnw=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Since these two resets are always toggled together, consider using the
> reset_control_bulk API for both.

Thanks, v2 will get and toggle both with the reset_control_bulk API.

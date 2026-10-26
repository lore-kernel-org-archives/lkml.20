Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001565;
	b=bqEnI/YqSqUxIpgcQRoPP7AiJx7ZeS0Ok8W4Az1tlzjhGrI04IRj0TxoEYVmbSuv54cY
	 jZUMoSa43lzPULVzFY2uczv5WFQljSlBGH6SiZV2a2cAyFZd5xUGoXYN/E6svGu+T84C+
	 PmBerv+xoMkVAd4ce5NYUfI/VjMnhhvCwk2nc2IcqUHcZS0MJB+Pr+5Ky/xVe91uED7Zt
	 wzZHHLr0uAP2BR7IpoMBSH39Ib5kL0AaEgjdl5WfdWknQdCXhegmAYdeGkeeJbZ1jMlLz
	 gXNTLZz5lLAtZ3cGq0naAKXbwHEi8eXLj3Nc/HGY9EYty+0bPnYU7WbOojbqxjF/7OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
	b=DnU8k4bQW8RpExeA4mbXcetIZNpbfGxQQTPOjOYeQuykZ6NfyPNqKQx++ewbSGGCxXoE
	 tdDTCfw35X1TjZJV+UqzgO3kwsLi/SEgyOqBHQrgNbg02+TXmSDff/Y0mxutzauEDFZB8
	 5AYtKnXbq1qoiKWJ5DBypX3MRDAGX74dZfvIYzRjhbLNpBz3oZXZx1XiANequ9oE4oYqq
	 CGfUVJ1NDWmIWYDBJrpGYkNSVsdUjv68MDuB5MNmrn54I9tjEDWHn0HM37FtRKnoz839p
	 BGBWz5YnfLQo+250VBMQBlbHA4PyCkf/e2qpvZh7Q7eetUbU5tmR6z5/SjcSCw6p0gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fIWLwUjS;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D76606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fIWLwUjS
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so313131a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793001564; x=1793606364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
        b=fIWLwUjSVrWJI3wikUnFLH1FL37y7awEIQpbjUF0+kCdV/0poPM99W6vvxtOxLiBmE
         CR3sER3AOL59DbSSPEtWZpUSZmDBa3E5pbekMX+O8AEKbmesec97aEemhuUQDabDKcGq
         UN51w/83eHfogO2fo1OoIXq8HfaAhv42Vm07kOMX0041mDHFVaRx+3j5LmwzF6NL6Xg0
         LSjWV8xTP+jc6wSpS4UrUanbN7gzwT1g9OzdkL0993m+F1jUCO9t5fC3A61mpksHYE1a
         c/f4RhZjsqZYl7DDEjwqJe8Flaf/ElkrW1BTdyyrXwPnO85RC6ri3FbyhOdA0cbhAsPU
         oT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001564; x=1793606364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vbNRlDHh+WVWhm3sA999nt53xsF4EJNCqmMp50Sjyg=;
        b=NEbEuFWavi9uZ+TRJGGzc6DzY19tC+RXNKG2j/mzLsbIA/6xTWP+yfAmUqEkdnAl3A
         oBQ7hE0Aj9p1qUmHN5YU5JSobXxZtLhkSkDEZHbKCqOg4ftnTvO6Bu+kU1ljSHGLtVG3
         x/2ii4FH2wNCQjcxuj34GUOkVHL7r6GdN6ILEXMUMmz3ILxMrq7K04vRxR5SM/+A9lla
         vkGLA/N8n6Ch7N7sYjbOyQhErPRIZRWZ6rkVNEvMI0R7ccACo2T5JeLQvltCzDPHx3HN
         SPfyTBf3GJhmeXifSBf6IblEGBndPEgdjK/n6f+ic77qFh3O+N87gqcJpX4oV26lpnts
         qCHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2m2BDgFaHQZCAsEffijAZhWW6diS6Vc0FJxHMsu/zdaR6BzQnPdax4PuU40vg2IG2FMrMmgit9zDZG/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5e2Ol07QORYw+9RUGinknHg+zXH6NDkgerl9m22o9GeQ9bEYC
	myGx/FpNeVYDCQgJXnJbrizk20hW2Tdv9tWxY265KZR3ZgvUWEhuZYOz
X-Gm-Gg: AYBFou11vi+r1aJITxDEX+YXKxzyrn/dqAH/CVnMhieXccSDgK+Dtd4NWehkku1s0hI
	CLqBjgo6wuSN/+gIma44rGhxAFFLxsmKoQceMUHn2yim7Yrol4B4ikoPmW4qQbayBVSKYtRyzUR
	S+szfffo5Bcc40GQTC3Kztdsnnr5H2tpwXH4jSSTRbVtBabxlaZFCA+wYMb2UE4DtRE4C4zdFoA
	cobDL0UqiJEpLxadRYQ3RiIW7Ra38IlW2gznkG4L6nzqflJQPVTkncIiJbx2IorYLyzF/A1XzID
	6mLgzsoUOpbX60h83K0XC9lXOKrcR2G5uF8h2RsYATQb/kEfqI5OxI5JWvDieSzd+OLtUxV+Rff
	47v7DaGZ3CoAU7Ze10MZBHdbh8I+FzmX7Ya/DsCq+buFHS+P7e7u0rThX6j+AA29tP6ExBrTIzC
	s8C41dY/XeYiC1eF0lOQ5qtHT4w97SMTzZ8TS/uAjxxOHQBrydqy7OskxK+558ENouG781lxx/w
	Pf1uCnPp+SG6/cgv9M7YrX3NqfgKuHIV8GzaPl3ASE5t5bKPToX3AEIRGE1/2jY8uiCMhmT8Vmj
	j9B2
X-Received: by 2002:a17:90b:2d84:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3adeaf9ce48mr9020240a91.4.1793001563928;
        Mon, 26 Oct 2026 00:59:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7490258a91.12.2026.10.26.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:59:23 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Mon, 26 Oct 2026 15:59:14 +0800
Message-ID: <20261026075915.203854-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
References: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 2026-10-26  7:08 UTC, Krzysztof Kozlowski wrote:
>> The ArmSoM Sige7s is an RK3588S-based single-board computer which
>> shares its hardware design with the CoolPi 4B.
>
>How different devices from different vendors can share design?
>
>
>What is exactly is shared and how did you verify that?

I confirmed this with ArmSoM. They purchased the original CoolPi 4B
hardware design from CoolPi and confirmed that no hardware design
modifications were made for the Sige7s.

So the Sige7s uses the same hardware design as the CoolPi 4B, rather
than being independently designed.

Best regards,
Jianfeng

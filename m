Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838900;
	b=Q9zv+96kIy8vvkG+QQCx3mEV7Ivz+oasjJfqY1WLD8C4nmw65S9d5a5DixkI4d14XEBr
	 1uXBkQscjjxJWCr8YZ0U8Lq5KP68CEHbGfGPXGOlf0dk99S/HUZLZ0W/KwrttBmrbmyng
	 4QLZ18nAyoQp8qbudFtjaE23eToxzsH3+2KlVGqHWg9Wuf16APUnQjWmIzj1fOIZ2NS6W
	 4npu4E37K1WkqVzyta3ajGKqTaE1RCKKQ8HCsH25nW5xIoyH+4qbZOV1j83qeJFAMyvNv
	 y48Pl5d2RIKPottNI5Oocejw+UVvpuuMvLRlnuc5sZKwUqiipSpYEWJQLKRM/T/b5RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838900;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
	b=Lhzssh23a5HVL4vMQyC8CxBxRVMcfiNHc4hBAYSc9PmJ8AkqmGBy4CvZUGwl2NCyu4ak
	 H2q/K4Mtg383HR9IDQQ/NaO+ujZNu6Tuchx7uUGHGKIXaU0hJnQPqNG8hkVxjowNQbq2Y
	 kRnL46QaoPEKfqDJSQi0ipmCd+iV1eEBqcD7Z/QsQAdEDW94f2H3auD8t1rakzgbx0CKV
	 8K2WS5mOEcGWkKBat2J7Zu1nFbarKMiOQRTFfISZAboB4wFpUOl0fXI9oQraKFvpphfHh
	 yfKE3KLak2pkkCNfLLzjaWP0SqMwKiEjEeicsUvE19f75fog4gaFFE0U7CO0WCgddrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60B8606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60B8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso705157a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793838899; x=1794443699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B55JhhT59YGsjYWJgV+XXad7EG0ayDNShVoZf8DxBWQ=;
        b=ZVGNAQiDrdg1OTJpDlQZlKbj0zzi6votkMD3sWb8CHz2yRT4vRI2dAGD3AQmg6oU8v
         DR4XaMKrrMIV2w+in78Z6VfMfTuG6L81QBKBwzoLwWkJmizospZW4vd+fHlf7oY5JLFs
         LAUD+wSJOxe9AnlN2juxqHBg6ZK0VM5FEWfQxUQ8nCLwJhtWuJ0T1Ix3emNC/lMeh4vP
         T7XVXwtz+E+8A4vFFyeC4yn6a/Y9L5J0unhjkf9N1M1DJt9Eu0kjpqjafleyEV+nhR9z
         ZlMQ2uYjWlq+yXErGJmcEoyPp6FD5b9poOg8D0FWEHw6cCe2/S5SyEZjU1sYfKLGgQRv
         spgg==
X-Forwarded-Encrypted: i=1; AKwUvBwWZJHgjllbWVeU36/lhi70j+mupr9eJ1ULrxbDyK7NXi1q1dplixguwAT7F2OFO3E+8g0wSZHVKURSuqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EYc4dPM72Z09kY2xWq7L7kkUFDi6+WRqU/9M8TUgFAX3hIzwf
	w8hWaty1IllqtZxJwCgH8EiVrkRlgofG/pSk6mwwfDbAaPtKFlryHxlCRXrW+m4Z
X-Gm-Gg: AYBFou1UudduWCgxjU7vHdCzDlcIjJmjcI9JAFOuLM+pNOyiSXZHq8AYlEpMWQYTXgc
	PBQeDDJKmQh53ASpFTMeH+fGUrXeIprGgvcN5jJJP+hSGjDXItjQkcQX4lRbVZoaE8+zzXcMQho
	24WSlyhRrrWRAKIfPxs1rQRxSA04+N7f00h5EtQrYdABGZEqEiLYgMj4ovMnca+Ti/Co4Hswl3f
	8qGd0TJKh4pn0+bE/BAMDrDsFsgWNl+RSLQqy4jYq2kIC9iOzEA4rIl7POR4P0fzUfwQtXncN5i
	awaB853tDKxBRrUyjzDiFvFNEB32Mr8/BRN0/olnt5gy+vRaCkxcHylR9NNrmP9OT+i3iUV0ZHE
	HFG3WibpBqv/amZT9mEvIxLOBhy3Mt4EgwvLIG4Gyfy7/mxgls7b/owSMT0yWsskw9dLGBefH+Y
	jWMFZ+C6/mCbBsiS4ez3QA4fah3rOLUTr4EUoVW+9fQrpMVUW9YRKUJlesiZMuY8SnH5UObwABp
	HrpjHMvJfUIFtXturWz5KxwhNZfqwADQK7Vv1CmL3iTaEVgSLvFs1MBZScPmYRBywxX2ompn0ix
	3UlURxvvCwXWLSZOTarzGExCPgKsD9zS+fDEGgpfxSLHdAtYdmwO4/iPwcSzQuzAiTXvpanomvz
	/9eeO0EIEesT63+2QOaIjY5q6FirLxBS2JyeUS4u85nn5tjuVUbpvQbyyCPDdBkua
X-Received: by 2002:a17:90a:e7d2:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3ae89869ff7mr14648956a91.61.1793838899194;
        Wed, 04 Nov 2026 16:34:59 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb467f665dsm1579101a12.7.2026.11.04.16.34.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:34:58 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3550c917fd3so1943092eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByr6Y/NypHuRRv4mtBtwVon2QIVUoO10tDsBHF1Ya2wTOamI2Q1csS29sZxz3etigbdoVtU+IfjB2dCHvE=@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-36a4244dbfcmr25290212eec.20.1793838896251; Wed, 04 Nov 2026
 16:34:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
In-Reply-To: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:34:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
X-Gm-Features: AclHuK-1vO168WRWmJd07mz7tA0jKpT7PGyfi_yQuj1AayEjOBkR4gYRSMoaS_A
Message-ID: <CAPY4CJ4RRuZcsObkF5r_bDacR3d0yjP4e6GWESksDPKHxK2u2g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> They are the values the vendor bootloader programs, and I checked them
> against the hardware.

Correction: they are the board's factory calibration, stored in its
factory partition as 17 and 10 steps; the vendor bootloader leaves 23
steps in both, also inside the measured windows. The rest stands.

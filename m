Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830804;
	b=eBlJseJfWS3MCiY4DpsiU1Whg6UHGk5rYZq3JvRVF9gPQKzWhUzxivYkT/NCg3Qw3kTm
	 C7CXgpzuhcB+f/xBcuoq5gIdvky/Gz7rlm7DyG9ieZdH7Dl0vdHx8MQfl3E3ajZffco4g
	 XdwhhzthbqsIzTbMdn/ZncJPWHuuCvmZZ4bcsReIqHzPObVD5uWUp8iq0nFtpc8IjzQci
	 N3PB1f9dDsTJyUlWHqSDzIbhYsfZZyb+aUgFGLRsW9RoX0gPXdP04ocLlPMi9jqS/CfED
	 EQBZ27sK2uPX2I1tJs6XJz/qGKhjEMBu92UbMCKoiV4z9O/DqMnCSUOaO+lBtgDAbxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
	b=AesqO41iN7ZjKvqyPihfuAPh6Wz38C3+F/RX31TGxdB+MMxTqXG6oreBuhhvV+WX8xrp
	 SjqxgCuR6t8Ugxd5iGDUdI4qu7rTIfSTmV5aPIpP32pNhRvuFwlB79RyYEPvZO7j0av73
	 cq16LY6RNAe6Osc2Bg4HIC1O9S2oiBoNey+NjNRy5vsLpa2/FHe0uff2wmnZJV4w8KHh5
	 gAP7gM7s9jC+tb44L6p/FjbLG8xdeFpkqFcrYpZzg5rPMAgnxKZNq1tx5WNFY9rvb3J+n
	 tmZKn4iXpnJFhBUtvb7a8Dju0cHDSHprTJ95Lg0lllbF2h+UGu2UH/2s4+QRLHZstYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690F606AC14
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3690F606AC14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso557470a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830803; x=1794435603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
        b=A1L6Jn9WdIBzp/DmT6GnDN3fP4yn8xJxegl1YcMPg7Nlp5QuLIBYg8rryg+iEOm4Ye
         vnVojV1qncyxOKHc9FIsv55DKlAR861QgASt60LvqMbmYDW6cR9wzCUfm+qxxLg5i5dv
         Gba/KViwBD+vkav/8vewO0lZ09JyGC9Fr8T/2Hd6g7AJeUtpvy5NR13r8WvmaoBDDV4S
         hRCrH1vPoMK0nKr0s4527u+gx/l0YVmWHgzH7pz3ABlj/0Zvbf5USV+HEmgIxpb64mmV
         lWYc2tXVa6bl6KjDBYXRZezRb57lUtIU6ekdU5eVVNF9AhusDm6GiX+T+WyFUtpY4b8i
         lkpA==
X-Forwarded-Encrypted: i=1; AKwUvByHvg3SrQxUr4acAL/6HMGvdV6ToyaJMt9Imb+sC8v81HGcjKwvrbyRYmd/s/h3h7Vor5e0uwMWeq3whhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O2lyP+yeoYLuB/Y12GFRUfVqHNPNBfypfwpyy3jZp5on31VJv
	QaV8r2CeBFLM3PdnbErcfAn/WwdTPamlYZlsWAWiblpRxlN9NrvkijzI7C2rk+5o
X-Gm-Gg: AYBFou1IUh1hdkcI6eBSCSVdysdkCMY510MK1DXGCP33Wpc5tT6h6Q4LvYt1dhWuoq2
	hrDjQkLhN7PhQUZfrJhkLZwjvjEku/pLORi4AnASv1gBrFskD1LGiUR7wLHRJbK8V3aFvdoWGv/
	OP8IyRmAKKkFscwa680CSgoV4kSkn0FxVb+9ebE03LlUPDDwj9qr5ScZp1w4KzDJrZ+GAO00d/t
	T5Dt5fDhNfZukfOftaQVLs59SwZ38YStCEF9z6N19mkj2bbGp4u9qhruW0YdXyEQQk/JSmGGrfA
	5RFZ8/+TdhgJ9LbclON2ap1ha4ODl5fESOHaxWIeI+CaiRYCsb9FC+UhOel/7nrCnpMRB47NnbI
	MNOnykaLv7JeEUXKTpFFGhmTP+P7ivLFeLMtLSHMEz9nvoc713pDjgV92pQ/DqjaopfJdpAS8Z+
	VsWQoYf7jZHp/nBkbWnNnE3ndQezJfvqsCLGmxM4Qu/sGYaoPCyNgixKqFdW/BbW4Ix+Ij+Jzw3
	O62ZpVpCXgKjgq11IQXO2r/BW/QzXiSi3/WkOeKlbGyFHvlAdaaX8rgfU6N9QW6NxaYWNUiFUIr
	7D+gGC9RgCB7zDsaLw9+fy9IMzHJfDwvcEgoTh05S8+88dOElZSgqQy/Ndirjy0CmTssdmNDnZM
	51eo7ADL9HQ8uwnCf59B/1lPIytuKBBZFC9FTjUF2C6k=
X-Received: by 2002:a17:90b:384f:b0:3b0:b35e:b373 with SMTP id 98e67ed59e1d1-3b0b35eb423mr561628a91.4.1793830803446;
        Wed, 04 Nov 2026 14:20:03 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0969eeacdsm2822322a91.4.2026.11.04.14.20.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:20:02 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so678993eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:20:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwOT1wlxN5ZL5/oKWMevat0Fh4zmIb0DL63ej7M0uRhKATV5wT/gfTnvv9ZJuR7vUzrgeaYqyHc1COJKno=@vger.kernel.org
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id
 5a478bee46e88-36a4243ab94mr30254394eec.35.1793830801788; Wed, 04 Nov 2026
 14:20:01 -0800 (PST)
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
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
In-Reply-To: <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:19:50 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
X-Gm-Features: AclHuK9bkkUrD9f9kOIMS4d2kgzS-vT8Hn9jZFXbBFoDFm8RqLepOJdYmZqvzqI
Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
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

> What does SF19A2890_GMAC_RX_DELAY_EN do? By default rx is 0, so the
> delay is not enabled. Is that any different to actually enabling it
> with SF19A2890_GMAC_RX_DELAY set to 0?

RX_DELAY_EN switches the RX delay line in; with it clear the line is
bypassed. I checked on the board: with it clear, the link passes
traffic at every RX_DELAY value, including 40 and 80 steps, which fail
with it set; with it set, RX_DELAY applies as measured in the sweep.

With RX_DELAY at 0, enabled and bypassed both pass traffic, so any
difference between them is too small to show at 1000 Mb/s. v2 will
explain this in a comment.

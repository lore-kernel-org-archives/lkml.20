Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781125;
	b=bD3tJ92389nax3e2i0yUwmK7aY82ZIllG9oLxLLENqK6uPKsgac2RNb/eYOt+704cD4U
	 SFljyYjlopaSqCvP0U7mK6XQ27C3HwButawjgTJBdpISBVMKELfqITShi+vlQphWiKwWX
	 DK16/QQp+5nZiStolaMekaDWdEOunNi9JjM4jHSb76zVXIS5QYxAUMZzAtqUNfD99C/1o
	 tKbJvTOHSMxzlrJKdI85cZWNTSRYXeBGbyN+veN28M1/yEIvL8cPVMv9YcJrEXEekiJ5L
	 qLtt8eN9QQ5b5f8pv3TnQyYBurJMe5fss+w3b8ZwSdLgFR/PAtBUk0CBqZv0DyOISeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781125;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=;
	b=hYHdws2CEO5mVCyReThFcCsq5qfQKuWTB04dwCLomVfUbmOsabYA+6vZrnn/0tl6krW7
	 fXHcnwxpAvYAiSOF9ooR/1bts5U/Z17cHhZYkQ13MxIWgT5KtpY4EXHtzrKyJypWrTNHm
	 96Yz7jGCvNvqBeabDUbG+Oq6ErN1TxYCcVNiwx6GrGEuuK1/kidCG0CGFf7KJih1EdM5t
	 tPbXXSMiwLk9ZLUbDKW6jaZCwDN3d/hDOXqDNPYCSZ6uvIR3o+wLv1NtY+oDawzsgPPF1
	 /N++UsUWAiuU4EFM1/4zvFOGmDfdbJChbI1NDBOTdpmQSPwJlp3WopF1/VOPjFKyV+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFA4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso260693137.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781123; x=1794385923;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=;
        b=FUFm2ck6nDp+I7JV3IMkD3Hu6I3qjWhIcPPFDv6M476Iwk1tAe/820aDY+s7NtmAvk
         fPJ9l2x7hnF+n/7yc93OJ8m24uoJMkDm5BHTMv4S0M2l6YhkLNALx/vHGCrvGaDQ2ujL
         Sv8tOhzaz8YQ8z6LE7PdElSO6bhy5Rp8pu1tl3gf6OAE46w5UlYMMUVLEQ8ymIkpNPlW
         EooigCQr5a+tTk9Q/QUdH+y72X6HPqTx/SguhckMwpxPBjF7XRRUfAGw9Z9hFdUoC/Qz
         DAcaBzL0GvKCv1jO1yx5CmzPhEXyzp9o4r+gn5RDGJPayKr/ArWxGJad6IAdWQQLrNfe
         PSNg==
X-Forwarded-Encrypted: i=1; AKwUvBw8rG5MQFy/+1OeCZq331AiT1WDJ39cxe7OrqiPMnsfjEBtP3YGnzl0oAMNbnJ74f+nWTqBokw0pyf1Pg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fE7pFWF+H1dBNLVVK7VpvSSni+J2+oUJzcvLUKMuFAT98nxoq
	6Hi/j4TtVBCHons7CNmyN7XEqQjk2i4dE+hSllNJNaE6sDuKxksfzwK4rAGZlYZb
X-Gm-Gg: AYBFou20OQbhQYUEY9+fBYGPomze/bfig7H6nKT6cBVJG3D5iDhEFvmw9ae610nXIP7
	JoUudHDYIxxV0GnGPRjqkEjnF91iHxV6zfi5bwtxJbMN5T2KiAWpxi9ZtO5tDPo8VSW35EurK34
	vtMPb0QpzxolWgg9s7dD2a0Zq/sfMdpYEKS1eQGdeb7zg/CXfBl2JxDKy5fB7w5MjeXe/MUSTzo
	UvnHeTrJm4V+7ldmgdqwsRekCS9d5DOjWQzN0iG0rCMXbi/rsJzmlihfaffZIdVDF8JWCo9J4wM
	9v6Eod8GdnGtiTniQukC0H8k6peMCB42UcBvXbgMgoNBB+R6Nc2gLCj+BKroKJdYvJO8JC8+Qu2
	F1ssVUqCt7yuZuKo+cuIUodMEr37Ok6VKO3XX+DUMSi6j43UrSeTo3PVAgcpO2PQ1h4Z4J3KgWx
	PaCMo57+V2pZ4qCVZuLp+l+NRD7jpTqZC75Mk06uWtdK6lmlhg2vQVbieNH61B/Ufze/+2yG4dD
	5p99ON6uzXAr7wOe/KvCmEJFw37LlVOfb5NjlTwB+oL+Fp5Ndtyj4VP3GdsyN5ENKzQdo8UGHRu
	jJzw1wGnSId/IpjRUbvscxgR1kEGFoaewIEYxxZhEizirYyxAC0eEV5DJtJ9W9AvSA==
X-Received: by 2002:a05:6102:b11:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7d054180f2cmr6766539137.15.1793781123627;
        Wed, 04 Nov 2026 00:32:03 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d8afc268sm1336133241.4.2026.11.04.00.32.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:03 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1099540137.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:32:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxBtWsXTzoLHN7KWV2Kn8nZKLqHuThGUZuFFTkw2RpmBkI2hrUpt23sWn6R+siKDHhRK+ezxJaY8HnLLJY=@vger.kernel.org
X-Received: by 2002:a05:6102:c09:b0:7b2:becd:1179 with SMTP id
 ada2fe7eead31-7d0543be60emr5897841137.44.1793781122974; Wed, 04 Nov 2026
 00:32:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:31:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
X-Gm-Features: AclHuK-YthVrpSjlZVBQt5vi6FrwMySVDZUmcMVvViznIkVXiwSHbJqQx6qRLRM
Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Tue, 3 Nov 2026 at 15:52, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.

Now propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

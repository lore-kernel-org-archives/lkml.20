Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733941;
	b=urZ+g/9ohwaBv5n2OGbnHUnzD/2vHyCA6BM3D64s7HA/QB5O+Ko+x0XmUkUJ55qWNldk
	 w6OIBo5gFxHwfaLNhc12FSdAJJXLT281Nlz8hMiBJ4JxiMvxYM5poTBCq5Zv+b5Ght5UH
	 8LasSV79t/kppumdVdYfAtTZ42o5WUxW91w3bdgrWbrPiZr5hnMuaNbXmknUHdS6pbDTs
	 eDSEi+QRyq1gZfNxB+9qkaf93JJ588zk7JuW2oSpxR9YIzCSpkyviXVrLQu3OLV1eOuty
	 N/xjM79Sa+WJCd5GCAtzASM+9rUY7v7GSyFJ/VRvXOnRej1KtP2dBYOm0jeYHrDbHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6WJFie4wHwA9g4ldBNe7rVwQP1AavfCmBkfuHq7pLEg=;
	b=hpS37LeLQkFydiLj7LymAVAjwU4qyTDupeZOVJtqZpv3XQmUgnPms3zoc6KDlsliDkzv
	 zNW7/0wMm3T4gsjEcxOBLoAtdMYIiVfDRgFfOpWqs0TBp0F1wS87g1uKpbwa+hyD8UV+D
	 GQPgATeTwwMx1xviySHON1j+xDBf4gtuY0iNQwMo/7v4yYrovWTr0jbNWbqkShteuKVGN
	 T6EpCOEYew9sasQfdhFxrYuxRT850kcXyHw9fuglNG2Xbd4+llm9qVOfWilG4l9wrY0ft
	 PaM+Oir5sSfWmA2KG49UgW5jQ8Mx6UBKY4hjncW8ZlWDxdrdNimNVYNQ/A300VFFv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzHX0i9B;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE27606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE27606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzHX0i9B
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso28202505e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733940; x=1795338740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WJFie4wHwA9g4ldBNe7rVwQP1AavfCmBkfuHq7pLEg=;
        b=dzHX0i9BCl9fHZjLEe0FI/ndyZH727+QrlmQIAOgcpaTXlggmmPcSiMkO+gy+VfKCc
         BzZOT8jzySWnASJ+GRVowEmGRRIQIg1Bu6M7tDWfFKhntKbmAVUorg2IGjUhLk9gjJbc
         o06Da8Oq7XIwuNX3ENH5e2G4IGQRmbKW93Hsd2N3D8auejhX5E+3LbPtyIsfPZ2YiVS/
         8cEGlBocn+nzgDgcfKtbg/peddU2CY8cQKTnXcE/ShzYCJ8FMtBoP1dR7dlit78fb2so
         ADlewt/ihhvpkGxQGkaNbAwmnpw/M28EDLDAvCgu/v7XeQ4KuEH9scf+XPDMYwWrasWd
         SZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733940; x=1795338740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WJFie4wHwA9g4ldBNe7rVwQP1AavfCmBkfuHq7pLEg=;
        b=kwAeBQb8fxwQqkjy64CxPmuOlftc2e/fS96B9LPgRdpehb2z210Luj9kxyuj3DjvYr
         KdPCqr6xt6Qd9IYkuPfe6FuSjzrmiXDbj546MHScCEOFAqzk2KYg2BqJyk9k/Uefb1VY
         u7ZoNQw/ZJINrOYHczxoTC24ryJVRMN+52Dibet+p5VFn7n+jUfEVOlF3dLfg9oDkxnd
         N4K9O1YLtZ8v4iGExRaYOr4jb+g7zdwy+ysMrqwzXpwzzMNypvWoVOh9jDM+i6ZJZaNf
         4ji5N+EzVOGR9WZCn9EkkH92U+/9nNJ23Gf0tvs6xhVPNKwhFFsljbH3+csSPFzoLRVl
         IJYw==
X-Forwarded-Encrypted: i=1; AL+hErHJxY+IjoypOS1XCdsux2pBdKBQCRoJJMeTAUy0rlhv2zykhL6NV90aGKppPoN6kZCQxXMHj7wYE6igFug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U8PevY8c2KXxkqHVdrCHFs4tXjKftA5tSRhyFIxtepJSoF/Er
	SqLxsz0qFohH7FfSVyN1ioYPW6F1xyOEelljUextGXHZtq6O5vqafjhjHCubPGba
X-Gm-Gg: AYBFou16E/KBV4ZnJbmGMDUdcvyENW1Ny5X/FuzZiQv6ZV3hOf6vEnThFVFZorNe9LG
	q16gXVGPPgIaAYM2En3JhI+WzKqRrWc+AolJ+6vIZCEJLDkix4izFfbuf7EiSCy9rDfs5Y7/SuS
	6HqwtJ2ivZ4T+/bDXkaDoUIUs0EeSQPIQS09T+uRg6b5IN0ZM1yg14BkKxnsWrgktMdJBXhhxgs
	EYsJXOxe/394igpn52WhbyoCbzKbjYW9eAN9OJePiJ9D4h+M5qR0ibaIBfuIGBplG4r05S0yedn
	RrREPwUuZ27Jquu0HRccmkyvhKGgqykT/xfb/RQ7KQm6uUwTZ4kLv7961XjeVt5yjstgumnXBpD
	SqJNU+03pTCNvt2uM7blfBXED6xniRgcxBw6ZbjKVLYMtt9SXG0qMA9+M1GqGsHwP8jXwMm/UWC
	P33KlGDZmXYCI4p7Ek+sHPEy22/rPTUNa854cutSlBoeNW25p4rKrIXCk1UyWjo4myaOvzd9Nh4
	BXQnSkxm2h1sDJ6V/e6cSAtIrGMcGZ5WDI8hG8ryd5cWmxhtNFRc7IH3yeY2hKuadNdBsW2YJSz
	C2fRRrpo4f/UyHKCdYa+HCWP+DNH18WBuQkuqimuiSoMtX9hS04iYoAYIuBRnAeFEVLOWJR27oX
	vuPu7YMk=
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr50816565e9.11.1794733939838;
        Sun, 15 Nov 2026 01:12:19 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm15778446f8f.28.2026.11.15.01.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:12:19 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	tsbogend@alpha.franken.de,
	oak@helsinkinet.fi
Subject: Re: [PATCH] m68k: irq: Fix irq numbering in m68k_setup_user_interrupt()
Date: Sun, 15 Nov 2026 09:12:18 +0000
Message-ID: <20261115091218.433517-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113143731.167962-1-graeme.harker@gmail.com>
References: <20261113143731.167962-1-graeme.harker@gmail.com>
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

Eero Tamminen recommended the Hatari emulator to me for testing the
Atari caller, so I have now done that.

Hatari from Git (4894d9a), emulating a Falcon and a TT (68030 with MMU,
68882, 14 MB ST-RAM, 64 MB TT-RAM), booted through Hatari's LILO with
its tools/linux/kernel.config and a small BusyBox initramfs. Kernels:
m68k master 8c9ddebb300c (v7.4-rc2) with and without this patch.

On both machines the two kernels boot to init with the same kernel log
and the same /proc/interrupts apart from the counts:

  Falcon: 4, 8, 12, 13, 14, 15, 21
  TT:     8, 12, 13, 14, 15, 39

all on the "atari" chip, ERR 0. That is what the code suggests:
atari_init_IRQ() puts atari_irq_chip on interrupts 1 to 141 straight
after the call, so on Atari the patch only stops user_irq_chip being
left on interrupt 0.

The Sun-3, VME and Apollo callers are still untested.

Thanks to Eero for the pointer.

Graeme

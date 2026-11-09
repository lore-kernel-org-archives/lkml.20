Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223395;
	b=I//H5mPW0yve4atpbsvGwG3359sgITy0BoSN2owuqiGK8ffw20XhmQhMrIJ5juEVplDi
	 7yQFdZFKpzvpPu1rm4rqJ8dzzHphE1vH2gxCUi5wVlTHHENw2ZuN+Rfla+A3+GT3US7o4
	 zlFFaYkKTrTDETuapQhc+ww2CPhOL5O2yVMP8z4frkkt6N37qjNagxWmV+iWWP72duGu9
	 iqO3PYJrZgvkD/ZH4lN4gSVhz94IkX3rXBbovBgJoaeJXRiFjUg71FUPI4tC7RQywCJcK
	 H0cGUUG1bBTI/T6Sn9C/QjO2LUDs0CBzYGbny6zMq4IKlGcs75H8WnA2QTSJAVWqpZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ug9suDDMXCYm5zIIS238Z17j/kqNhOBIwrfXJjx/zS4=;
	b=DrwfhQycOyVbQEttihkQrKpiypRIE2shHNl5mnee5W7KMongOglQRtFPkPkbJMpzP+us
	 octukUXvQnyNFPZLqbNu/QjuhpCLWbg2T30W1Qw5GaxzvcpxNxBgW6wgZEJXvlIirowd6
	 eRr6jbgonvY8cWwPTdEVvtrgI1nS9yj8iy5OK1JceKI2rt3yy6IYnRMzF4YNfmL9Blnnh
	 jFBAjBpmwp4Di0kDAFiiaBzJLjXsJ+M6wWLBz2NzkLdd/BtzBbZXole3Fdpw1PktSzGYp
	 YdpoH/yTveaGFol1pYDUYfi+vOYcL9Tg7m0U4E1SMhr1B3H/QCehNYNvosW+zB2qQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqIx9bfX;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqIx9bfX
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso234583c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223394; x=1794828194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ug9suDDMXCYm5zIIS238Z17j/kqNhOBIwrfXJjx/zS4=;
        b=JqIx9bfXAd4VH2Rnnaq2Yml6+m1m/OKu+/zbPwFwMYnAHPBpLF/CRES64cqaFzFg6M
         EyiBi/qB7+7X95v76SZh/bNlpDiPagfXhMmtN5la/5ZsGVjnuEQbXrogURHIHV8r07Mk
         X4NatdTHBYQ4doLhKhfkjQxsMaVFphz2BZUQp9j5KDEZ9If0fAFUglMJVs/vbzLXof0r
         axjQNUCnSgmf5Xl8HkivSIy429Pe4wR+CBhLD7XiC04meLgzlk5Ne47WSf7hIiip3rBS
         fWs2ISIRrgw0cvGa/faDlVudMB86u5Tbs82nFLuMunkzuxPRszg3npwhOuXqkVoLGRGn
         pqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223394; x=1794828194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ug9suDDMXCYm5zIIS238Z17j/kqNhOBIwrfXJjx/zS4=;
        b=pwnFutfMlT1pfpL0sEx8sVsEfx25cFh860nGgBGC6eKZkkCZtpNhRBhi64Ns8Zq2Js
         CvHVJPTpWH3U0r6m4HG8f8t+B03oBFZ1YDDtX49e/Vcx9ic7fGcstN3VDejO6Qe2Apjn
         ZamVABwa08hBWZOcPXFonY3eTRvwAEW8RcqnesEVBstGkMFdr2kSlGpa2jkBErmV9E7k
         4O5wDfHs2sJqYBCJ4L8fythyQLD6ouSwEDeuTo9yXwqYav5z1ojN1Qq/LiqnEdFK58dE
         ZBo3HYKwHsHJxFOSfvMs2HCpKN6oDVKY10kmLr1XFnRZP5QZRl5I/798uDHAe2gyL9bg
         OjAw==
X-Forwarded-Encrypted: i=1; AL+hErFWaf1DVTE5ztkmCc33FU3MNk2WBzVTBawGOCRoAXDqvBiO1dKXCw85GD8/FjWDmJVuBdPGYka+h8UHqyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PLNUO2WrLD2NNHkghtA8ToAdw/90e2lIssbIgZ4h90OpApQBP
	pxsgkjQ7PzsqjZ9zKktnuuoTG6pznXkJ/ioZx+GZ8a+94WBZwYSmWKuQ
X-Gm-Gg: AYBFou3rgOcHA06rHWsBkrcvn4d8ibJuIOhXdeIQ06hCXnVwCftubRYQEEWXDLXGaQA
	EkFS6wxqvb9KxkyZe0KdTTIxeSF5eSFoN/BQev9l9XLn9hqAoebkjbCVh7bKqzje8qwHoXkzY53
	N5ValkKawlguS7MHDeQ9CE4Mkdv6G+v5184wbW9Euk/Vm1QSEti3W9+Uu3U+R/ouWk5PlrQ4QYu
	FN86bHOk02RrcZG/Q35nb2i2UP/wgiE4uDLdkmi7NmbeC9mbmBm8X0BDcqVVHtkce3GB7q6UCdG
	0GDFuNxbk4U8YZqSU48RsekqcEU1bSMfz3Bzhomg4bJDS/bjJJ1Qi3/2sB7WgN66PivJMcrqd7u
	aWbJyeTgl8XPYv3BfBLBnfKqBKNThJ0CdncAYOK59p2TRxKpDIWYIXtGHTpfMmgGlmca0XheO1n
	Z4Ar8m/BppiAneCfi2Qb7LPfI56NUUYS2/mUyT/Dar6o0Exg4+JGjz2UC2r3vK535SHeU5eN2LE
	j95cnb1CvQbFT9/d+cSIf8VX3o2hqurffTbXFxjv+ynsbqvPGkZujYdISUySwPlDoWxJEDJgAZQ
	T6/TZvvfxZ2yCDE1KTrpL+vHYr8GwXSkg1+/4K2xLT2jtnU++IRBTkhVpqKIgPEvUhP3FzeAw+N
	u5Q1nv7WWpep1gQ==
X-Received: by 2002:a05:701b:241c:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1b39feb90f4mr5465372c88.30.1794223393699;
        Mon, 09 Nov 2026 03:23:13 -0800 (PST)
Received: from chitransh.. ([2401:4900:93b8:dd7c:3c58:450f:7886:86ec])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm13449164c88.0.2026.11.09.03.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:23:12 -0800 (PST)
From: Chitransh Mandhaniya <chitranshmandhaniya@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: switch to devm_mutex_init()
Date: Mon,  9 Nov 2026 16:52:37 +0530
Message-ID: <20261109112237.424875-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
References: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
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

Hi Ilpo,

Just a gentle reminder about this patch. Hans has reviewed it, and it
still applies cleanly on top of for-next.

Please let me know if anything else is needed from my side.

Thanks,
Chitransh

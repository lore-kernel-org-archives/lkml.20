Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601065;
	b=B3al9iL0+anuxZRNMYuVoziax+o13ivaJ7ZTrtYrWRpZhX2MRaj8RlcgG/paUJi1aAn2
	 gYUEOdfztG3RKeuwM38Vo+4Jxxv/vC7OeOmfTpGxkdR7CgaCQYeQFPOyq1CRL3JNOQqww
	 FT6W3xn55kUJmtCXwcpFM8wUxI/9jequY9wL7uFNmOkdTLO+g+UiMEYq8ZWoLRpZEgfnD
	 bD8lOaSB/2OVqWlqKy3G7e2P8IT+QSzs5dH/BPj3jGnmRpDZ031x8c21HqEG+7VCAXdgX
	 LL/HB2qipTM6jTz9UfgOTkpJOGMcxNncLr+m0sNG+WZA0jqy/BvucVQ6sw6jmXNk5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FRvflSbgl0Z7xG/0mliZyvs/63qm34rb220QxXX8xtw=;
	b=2+W98in7oNpm7Cs0P9XPHX2h0k9Aymw9bwQ6MFbmEGeGDcqnXxW+nCPIRsN4PveuGLwi
	 boxxwvkCMbmcNZx5zsI9RPM/e0JnyduBhZXeViuOVMLLKhlOCNdMLKGc73FvkpABE/0x6
	 eYf/y0xw7w5m+WXvCCrEOSDdpRENj5+BkIFhjunTMxFr6nQ4ZbW+/rja+6c9r0l4g0UNW
	 1Ftqv8GieGfhXbBttJZU/12j6su8aRzXF8GK2+uFgVF+S94DeFPSLVNNZJErPCiAQwHLN
	 fTj3mJ7c9rdwuCGFHO6VNaIQPKZ+vgVlF5GyqzemdLSFb7tOrMwhDaWTUEsN40396/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1YGr27B;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37D606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E37D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1YGr27B
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1701638e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601063; x=1795205863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRvflSbgl0Z7xG/0mliZyvs/63qm34rb220QxXX8xtw=;
        b=f1YGr27BGAiQ1k/7gbgyOYz0GgvQ3N7ipameYPsZdesh99WEUSAbkcBhDjBq6Il8LT
         746FWwOQ3Ho6AMjFQTusNWvN5ZB5EHzHEyfhczcIvJqqK80ikUBW59sz31xozQNdWj5G
         JDuvGzoYJ/qrXxMOgoKdIEq16R8NljXiwjD0awprbDdDBB4gRpyGW1Nf9l15RqzSWrqu
         4BJLuUlRLLiT3KX0kEViASA19UexkpKuPWjDVJXfvqFOm5igU+SEB4/+zksxzSIYV531
         iSlAIVleXN0eRXl+/V1kcB7Oz9661sEjHZ1CgQpVq25/8CAkotXwUsoZvoPdeHQUUTOV
         Wr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601063; x=1795205863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRvflSbgl0Z7xG/0mliZyvs/63qm34rb220QxXX8xtw=;
        b=Ql1LSpxD22P5PWtgtL1e6oXeswDH63stCmZoNzd0IpfP6Q8ni5HQWROR3m5MZW+klK
         UcqSq5tfiCFu04IrcnqKTjatiJKxR7lIbBVbZBxIsktAS6uAtEWhwF/QxsSJ7JJB2Voc
         NszrOrSodzW8KYvRc2H7KqWLUZVCm2hU6ar4TCabI95kdH1B9sJe/U6jrPuQMaVvuUqM
         2TgMoGKKTAi1h/ewzW1ZItCYteJUN/6WnY4/fksz0miWa2fL7fy1ykKaX1CWUzTWU9yl
         ZRXPieHckprJKsTU1xjUD14nN4MkpwUIFNcrJ6hmcbDC+M3TIKyjxmsc3i8YiI8vBNrp
         7pHw==
X-Forwarded-Encrypted: i=1; AL+hErEc2E4TGu2GOa2EdDpGc00gEsgnLstxvVvtFHcGD9DoeSs4sg4W4svKCwEV51xsq4zszetPWNBi3j9sbd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ziAn2Eojw+dmU7xMup6Z6MxLV24prkRRPWfZF2XebnPOeRQRG
	6fMicUGIipebK/SkuPMuuTVaQ08dgBlfwRlFAz397u1+68xRkcip28c0
X-Gm-Gg: AYBFou3nWvbLG2mIshWHjJzWWUFFu//UedN42YIiEhK+cp6muGbSEhB58xeBPqNN6uS
	cYVItcX5SFgYtaaj/bPGfZS8dWaHc+FO5VaA6ntlnpFDBlvcbe6s/s8Lov+Gs0DuTzUYCtaU1at
	zZ5/2CBN+uIfd3SvR6RvwvsZq7kyqdvNTiiReT1qFd6RlvboF/Dm5UE9TTmUzkwTYvjaXPXkrnp
	+0kDHqrKxgRdN88qIAxxHqt5ynxUKK76S3XMJrLnXkeL4FRVxuYE35CCDkL7G7DmWrhRPyvPbAY
	1cu9wSNEJhsxqlqj3vDS//Fz6DLLJZX1OepBLu9DQX9vF0fLOdYBScVGDBV33mQqrM/0BAoqbWU
	mcv/qHerUeZgeMdl3w214EYiaP3ePtWAVniPwCgUDUFIMA9z6UZqLWlCfcALu0dQUkccRkpqnYY
	UzbT1jDlq/21mISLysHZiVDxmd242DhUo13DrBBtf5hQ0L95j3bSDCqYlZ488GVSohQS/bhLeiE
	2QlR8dQsaECb4s9cx5zkWOQmkIfJif2G5HHPEatImI/4coiQmtfukzMqSZoXUg6Eco6I3K/UHmr
	f8a5SE9GhDcOlRqCKQK7v8bRrWozpcfUjUUnsAtNC4vh2lUOUZfJkhm+tY8u1QvzmYr9av3CMHy
	XuUk4T7cE8NpDfwoYMnztb8RzsdW7yA52IV6SGw==
X-Received: by 2002:a05:6512:3e29:b0:5bf:a193:7a5b with SMTP id 2adb3069b0e04-5c1709c2eeamr1739274e87.34.1794601061732;
        Fri, 13 Nov 2026 12:17:41 -0800 (PST)
Received: from yantra.. (nekmmqsrubyk7w1qlch-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:2fd0:3310:f4e5:7f91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171346e7dsm1057729e87.49.2026.11.13.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:17:41 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: kapoorarnav43@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Fri, 13 Nov 2026 22:17:36 +0200
Message-ID: <20261113201736.58553-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112214929.497589-1-kapoorarnav43@gmail.com>
References: <20261111195118.36853-1-zoone.rupert@gmail.com> <20261112214929.497589-1-kapoorarnav43@gmail.com>
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

On Fri, 13 Nov 2026 03:19:29 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> Maybe I'm getting this wrong, but isn't there a case the new path
> doesn't cover? Nothing reads a temperature at probe, so if a pressure
> only buffer is enabled shortly after probe and the first pressure
> result is ready before any temperature result,
> dps310_refresh_temp_locked() finds TMP_RDY clear and the pressure is
> compensated with temp_raw still 0.

You're right. After a reset the chip has pressure ready about 3 ms
after measurement starts and temperature about 7 ms. On my board probe
takes longer than that, so I could only see it by dropping the first
temperature result in a test build. The first scan then reads 1.2 kPa
high.

> Would it make sense to do the same here with a flag set
> when a temperature has been read, and wait for one temperature in
> dps310_refresh_temp_locked() only while it's unset? That would cover
> direct pressure reads and after the first sample the scans stay at the
> pressure rate as your patch intends.

I'd rather read one temperature in probe. That covers direct reads
too, costs a few ms at most and needs no flag. I'll send v2 with that.

Thanks,
Rupesh

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530164;
	b=2L75FINd+oONTEQvznF68QNRi0kSxBh8GGyYPj1hvmTGilpwFijJP7hcjGoxDO0KpXmb
	 1cJJttU9Nq1hFC9hg2RxvnChdjmECii3zNcQTMaPVjMqjwUGRozjK7omvX4zpi9rEd/7k
	 Xa+GRTyWvHBs4Co7U81dby/548LgTqwtRoZHaMfSvk5QxkVxLMDuFv2bw1ZEcPWAH+xqW
	 pdLO2JvM33gv5nrq9At6wqaBsRnisEFItay+gYeyjkHQtnEAFNo6WGOhUlriX9ye0ZMnJ
	 yL7zsmCLxYkN4W9VvzC5SyVDftC5dAliyGAS6hS9Z+LojCaM9ZFhJeAFDbe0qDErTHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
	b=hU0NUFKLusPe5o+Y2tcfI5L//9IlAJjbyyh6c2M+F6Tx0svmsaOKiBBtyXTfA+wyRGaZ
	 Nswlftx+ZSYPjuILKNt9cgZh9iLF5AhbRogdaEOpX1iawJALgZ7uC0jZzTrUFFOm8eZOB
	 u7cbtvSrmBU7tOuvRndAhmH2zGwT/dPeP0gMcYkw/leoHTQVD/amZBIjs9Xm+PXYpe9l5
	 PJ0MdA/GBR8CpdM9zfXZWzj+bDH8CL04jBl2uyKaevGCHJ5UBJeQ5poKuu4MKdZMXq2xX
	 hBTW0z7qNKSKnuS2QGB1hOfT63LP0re5F/Mo48ZpNNNr9TsCLc0Z5YVFFbyWc1fqEbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nCsxS/12";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569ED606A8AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569ED606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nCsxS/12
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2525975e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530163; x=1795134963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
        b=nCsxS/12HM6zIm2voL6T0fZN9ba/jyGuCSu6/T0qOz6MES+nue9pT69TRSZHygY/6G
         Zuommhdrv7QntgQjMhS4SdD7u9ir9BR2ccu62h+LrEhRixUlvkilIxUpyuUilN9tGQ9h
         oEh6/KXSG1xXfYP3zVqD5GdeL6mRoUpc/HGayhc5xozEP05w7y9qs4NbW0IQRCBJKQaD
         oJUTgVvfXRglAMwiunYL47KNTvK+JK+BEMIzcsFnYQKG7oDKO89NTglKVk6nQpRe7q4e
         /QYG+WAeNqCnqctcBN5vFJKg3dmvrBo96jCrkwZiAOCRMbc6zYnm7S7aoNs+6F7keeSb
         2N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530163; x=1795134963;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
        b=uVCMJm7l8lpHnY1H9sYf2Rf3+uoRbGl82H8RBsI6kQ8jByyJD0xKK2I3/N49vvp2yW
         qaWK5RRrUJapZ/uzrPhZOOIC2sXHhF4CozpnHpI2sGxEkYxktmN1kX3JQIGC3ZSt8T4F
         HIy3eRYUjZu1RJNDVTrTv14irV5v6Ppb82j6vZ9KcOi7BzCzdaF/o46GlnY72D1QtliX
         ssPvv/k67cqP5xEMk68xJ6rVmWcqhmx8gR3r2lzoLuJyBISnbMaBo/qaK9Tyje2BPodc
         9DBZLuYU9YEkITmwCX+vDvtCwDdyFeus1217ql5ZkEwErk0Y87qCFBkCKJJ1UbkGs6UK
         eCqA==
X-Forwarded-Encrypted: i=1; AL+hErEApQW3K8eLYCpX+vtaTKGjEaYOb1Az/5cgY/UHnz6Dfg7Wj61Sr1el/14T6A9mzxwS8fCbsVW7TR6M1/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/qCuCsrolkRf1kanerCTuAmlEYpbD4Me2JEA7jYxyRfaePCfv
	gh+TZjF3yaywyGhm9N+Pr+Yrgz+lNxDuCpHSLWtMgRnD04S9xnBX3D7F2WHB/9oyqjA=
X-Gm-Gg: AYBFou12NDsZwvQB26HhJeUfSd78VEH2rwjaLPSIl7uqp39grVnW3mTmsehtfQeEzIp
	nohUSYSlNQCYxUZKj61/9guLFiF00ZWbMYA2Aei4zG/63TrWTLdG4jbqdMiljNfJP9wQXsnD2cJ
	JdfNJ6TqaAJZLFlJGOUxcbyAVCiFU+nEauuoZQcfHEq1xWOPYUc81cg2hYDWSojGqHqKoz8PyD6
	bkVcFui42fUgPAJisKw72tn+3G0S3g33UQ4kNEEjrxdutOdsF9s+Jh7uTEhgMFfcadzMtuym2gc
	p4EtAe2SbUxEVFV2hm3lY9OeRh6AAfQWB+iKVmXg5d0+MUsdGPfS2CfwCyoPJrY90t+FSqp6IEd
	wq+q9BcHI+RSKRhxdNqY00ugJVwBjUQiRtTFZUFssslBxxbRy02tCf6ivlZBmHAKtGu6S35X1UX
	LdXYrb9q0qz4vaNTgszArpAfWam+jsBneeKwhSTImuE9B+9hJ86nD8apuUtQ+1YKtK5UHGMJoB9
	Ls76H0wp58w5CCyJHB6mdAOSt91Y2SlzSqgj5Fcwa4OiVUTnNCE7AYfExPqAGLxPZgi43J/b3J9
	JIWv8E2/FiAPrtGXN4JjoayiVLFw1jXNEhc4x0yVmz7yqTNxnr6wvoNX8QNW/rtTg5mFYe3vVTC
	fR73tZvIL4GsKIUw0ztJdZt0SQMMdZ15Ydu1bIRt/8HPhSP/opROMXQ7CeenrcGZmYMRNfFaBeF
	oH2tkSenbCzo7bT4SJTg==
X-Received: by 2002:a05:600c:870f:b0:4ba:495c:3798 with SMTP id 5b1f17b1804b1-4bb55af1377mr17409355e9.35.1794530162764;
        Thu, 12 Nov 2026 16:36:02 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm2145402f8f.6.2026.11.12.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:01 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:36:00 +0000
Message-ID: <20261113003600.3661907-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com> <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> Fyi, there is also Documentation/devicetree/bindings/gpio/gpio-mmio.yaml,
> which allows you to put this directly into the DTS without a driver shim.

I looked at it. gpio-mmio.yaml has no clocks property, and on this SoC
the GPIO bank has a register clock gate in lsp0crpm. If no driver holds
that clock, the clock framework turns it off as unused at the end of
boot, so I would rather keep the small driver.

The other open question is the IRQs. You and Linus talked in the RFC
thread about whether this GPIO block has working IRQs. I have not
tested that yet and will reply in that thread once I have.

Best regards,
Navid

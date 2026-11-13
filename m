Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530239;
	b=0aZpsaBQ9cFv/Bl5Ac9xdj6v3v50wueR3nl92eC//MsrL+YZhCKQmD8UqhLVX+7WnXUk
	 IvoDuw1i2IEYCqUbVGdmkQRH2QzMJYBESu0FClBM9DshwBvUIDw/rb/UvnQuMIbS9+nS4
	 VzjvvNOfY5dHAK8g3UiQXFNg7QqhoJszzNKQ2ji7vpO6DBIn0m2Ih4P+QV0UohWhAYDHM
	 POoPRIojtEtEJoxG776Imy33NS/sLdl2i5juzLyChOFp0z2AIKzzu+FDihofYwMgE/yxc
	 DKvyg/TFcE1hzaYO8qQpvI2o9B8Asn3rRX4Fsp6qBcLECndV+sdAuVg9qM0j9VTmWug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
	b=xHrA+EA9FAFkO5DW994vpb0N7oCYaVc7ZD7E+ZU4XTONDE/xuvCrEScxcxx4JM02WdFv
	 4O0Zl3JdWzX7EFR7f5uHWFysuGP5L5b7blBdF5nNlj/4dM55X2BYU96eEcYe6r2n+cXGH
	 R7F17O8dBBUispki/SJQLdvaktnhBtm2TJvJBBnSGrpCgE+lwozV5AxL7nPAL4mmW2W3f
	 7AoFELHqk1WNd93dOCnBIOsKfHiF2UCA/+9aLd/Q5ZmiVuLcmdUfFwlVrIhFr0iSzPybX
	 fQWITAp4tq/Z5Y/T3HK3v80I+q6f/jpuojYDTxTsRhTWols/LC8oWpN6j1zx8twS+aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOayCD2S;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D35606B554
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D35606B554
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOayCD2S
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so253213f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530238; x=1795135038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
        b=TOayCD2SBEBwrAKAt2MXAD+N+85uu8xaIa48EbZSRV2rG0IIkNrWZc3cxvUbwD4E59
         2cM942obilajBJm8B8olOayUossndYpHM2udVgTz4IK5Fn/25cNTJ7i9tCoW1W5W3TwU
         U6CDp06M2b1JhqUbeDtgQNnP+4PsnMWu7FkvUaYKzdTbZTIc8izEDrIuYYIfj9OhZj8h
         zMX7CV29tkN7QvrfKCrJNZ+ohmktdm69N1YB3vR7QJ8o5Zj1eZykKDYV6GjCYPpNaAWT
         jgeX8zFePd3PU+9OEKZLN6UFrs7bMzlN50vSPRQeEDOhOd4cPwXLdX/WTNPEPcM7K0VX
         AbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530238; x=1795135038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
        b=M5aTdDzEIyG1qPzm7ELlaPKuZaxGYUiyZLcp4KRC/dWVkax/ZdiZi47V2aQb4CRUDE
         AuPQ7kEvTqB4y3fEtnM3tDVp+pT9sb4SVzWmReKePduF4Cwv/i0uXvc1M2eU8H8ooPIO
         s0SBacAsDjq8UyZuWdEPmc1DIGITMofhz84exXqtBGMn8ee0rfJ393VVLalLn612CqMS
         gfX8Xsw1hQxC4a4TwxnVAQrGuGcll2fVdeRpmnKqNf8S0A+sX3mow6+4N491NJswUWA4
         bAFZ+Rvs+ibKAmj0oijRR1Kl8kThQQwYTX81hAa1x5xNELffyRjS8sOiJ2wzCqo/wn4A
         3E7g==
X-Forwarded-Encrypted: i=1; AL+hErENk8ska1/PfgexE24BlJREf9BX2XRVR5jwlhjC0fSsa2qcf/Yr6qn3aCLihedqNUpdzwl8U3KBGZU0uSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4wnk6z9MF0USVvlRCfNka3e2XGjEzAFc+3+PzITXKeF/mODOJ
	mpHZLCbhQ568kZElF7ec+pE0UNVrvZ1L2VikFtWMvIg7KWIY2q5Pl9RU
X-Gm-Gg: AYBFou1flNmFz8/+ZOxn/60xRLvXkvrioP/YoelpEgm6PMaJcpVmcJWiPuA0yAWmlaa
	MxrneT4gXyiq2kYFfYPGclwA9n2ZIf5DFCyKrEUbWvVDiCNAfvCOmTsKgGwZlJQylwti4eqy+4D
	/5pwC8//Ewbd5hEPg91CspCT+TkzNFLpcho2nDVZFxaqCJJ2OfmFSyPeexv4Vy9K69vJAvsgj+D
	miZA8YquD1O8lUnr/jMe7EMmGBMEZXJAKxub5uHHuOeNjoZr5TaRXpa9HZjNQdbmGiYpbQUZ/oo
	WKyEJyliWFRjVs1wt1/lqvlfivTLwy4vyK/8UzXCwAZCaDWI6vweIVaV0i/Uv6XAY3C68pv0vnY
	0SipWlBz6Ln20xORFhMZGyVYg/iOZZsaWhrIbsre87f9wrfGq/Co6+3CUwA7COMDdyXunMHYNb7
	oKqYKXgOC0KuQLAz+N+zq8YTdQU8+EfEDa5B1qQNAMH5us+recuMUeJ5PDLWLCUQ1Fbst7GJ7Bp
	PfcvI5kVzsHPGV3SOsawBBkNvwe8KvN+o+njbqasLC910kUwb8K7Tp10Ms5qiZnL3xKL8u6nYV4
	1xqHqn5pZqFUwcvACI0S804CD4SODAFEkfxzZltSMv/7SozgBBfoMjNffqNevlK3NMF9i8jyiuZ
	gLlLsXXbuqWZnlLRx6HEKM9ckrtK5yoAk7ZBIt0C07O28Wx0CCKDjK9rVkZi2oP53fzSMcSmRRJ
	UjDlAUwysJLd53FWGsl5gha6eLgnK7x0+6XuqiCg==
X-Received: by 2002:a05:6000:4b12:b0:491:1468:a504 with SMTP id ffacd0b85a97d-49c70cee81cmr2469854f8f.21.1794530237680;
        Thu, 12 Nov 2026 16:37:17 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm1937527f8f.21.2026.11.12.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:17 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash controller binding
Date: Fri, 13 Nov 2026 00:37:16 +0000
Message-ID: <20261113003716.3666756-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-khaki-gibbon-of-persistence-a552df@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-20-ghahramani.navid@gmail.com> <20261015-khaki-gibbon-of-persistence-a552df@quoll>
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

Krzysztof Kozlowski wrote:
> Where are all other properties your driver is using? DMAs? Resets and
> whatnot?

You are right. The driver used an optional reset and the rx and tx DMA
channels, and the binding described none of them.

> Did you actually test your DTS against bindings?

Not properly. For v2 I only validated the binding files with
dt-doc-validate. I have now run make CHECK_DTBS=y on the v2 H3600 DTS.
It passes, but only because my SPI node also leaves out the DMA
channels and the reset, so the check could not show the gap. The
binding has to describe what the hardware and the driver use and not
only what my DTS uses.

I am dropping this binding and the SPI driver from my series since
Stefan will submit a driver. For the rest of the series I run make
dt_binding_check and make CHECK_DTBS=y on the board DTS before sending,
and I compare each binding with the properties its driver reads.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word binding.

Best regards,
Navid

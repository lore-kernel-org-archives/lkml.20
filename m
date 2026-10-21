Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582476;
	b=vYkxjxE44Q/yLAkXKeyNjLpbJmHTinbg+o2JAH6EYs2Au/seOCDAUpmHxYPFYmSs9nmI
	 ElPmUkMzIrxHgt/+1hCwfpgGSXFDc/kn0T60pgxr0rGMf5uF6f5t8PL8Qek38w+6L3DSf
	 smjk2DGnCH2uZCIRj5xTvhcPYVNK6Zw8QlRhoEfeyS01YyPfP/UfXgc/BGTmg4MrtzpZ3
	 acvGbe5i2mCp4VyUZc7QoDaMfIem7+19/RuXBnJOo9iy5ZuUJdbZueM0nteaijsxT+C6P
	 SX0rQoZdn7uQJSH95MAbBiyLLl8Pom171GxVaTwOoCfgnUO4fXC5VB4/GP501zAjdrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
	b=XiJ8YcPmSXDxydTeitfPxYI2XgU08vFW+dPCWOZzds7a5+rNvEII/CzCZ4TTyFXGWRHJ
	 P/212mudiWsEvYrbrq9Wsxyiq0OXsasSjZAGMC5H1XtaAh7CDa2w3mtHG5hOHP71U2SYG
	 fCuiMEc/9WLH+d6S73+XIDx0p97hRMQNtYIGWQums2DqYn6rL0jQjEE0K78uwB9SCFap+
	 MvOwziKXGYdCihFHZXQW6JdWXJZXrn6GTnmGs89QAF1wya6/1MTxF4o0z4nU8dO36hwnJ
	 fwuyzLWrJGsunwx0U5htsItNAhw9y7MU5580wgoxpafacIpcjOXuNNdis31cHOIiEIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ra/IZ41H";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D56606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D56606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ra/IZ41H
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so464566f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582474; x=1793187274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
        b=ra/IZ41Hpm6RTmSY67bSqqFGQAqsRwPm2xdKmwPlFt2eoCzqB/u3fQxsNKwxH87N4D
         TC0fn0lspl6/p2aBdSJ7lMtzul9crMCLtm1ZjF4Q6ro9+/11cyqlZhqSwz0juFgaB3sM
         TE1x32Gd75RVcSdyDibRlPkjclmKQfLad2ieU3gjjVEOIacXgdbWjFNyBoMSGnvpuqYZ
         5ePfbBIGII/hfQCxF31N3ikSHknBNYv9EUuXGYJmct7pfLCv6bb5IHATYE5PwbHPwv46
         Mz1t3rAg2/zH1n1suaJ6RzJy+9P9evvK6uXJ6c2pdATLzsCH8AvqWNo+a+DYve6kXE5J
         bTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582474; x=1793187274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHsDZwM/Gs/gFIF/naPFtYX3jQOjfXxPpGz3L5UTFDk=;
        b=yMMaSDiypYNXwc+L+bGXjvOgpfNg3Gu/QHiZ94dhjj3wHgOGup2Rr5/LAgEoHN5m+r
         eDjwasLEKRcn3lLxYiw9Ju6lCom1FlG93iQad5kt5APS3A8CoV8kMs4XMJi1TmCRGRgY
         EoaOxtspjcgOgDSs5jMCvvjHZgFv0N3Jz4+4J/aZCzZ92HpELJMwJccsB6oY8ZinFQTm
         QZlFZzb4adlZAWz2e9MvziJPxX4rsGv1vd0rfQP+p9OeyD2CcJmqh4MKOEtLp5oSbOd+
         bE1romK9Mo3EoL4W7ojc2zE78STSdBKChkoGEw46CW1ZJYjmlA1NR95vw4/tKSf9VU1g
         E0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ1hweGium2I6bhobHwPMlMRYV27CFYPad5/DkETnhf4Rl/vEgJRccTyGStBoLs6G19peq0SA9eUWT7eY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ8uNYmmgVyQTAeiWhhRqA9AcFvucyxcwCgNmALwvjXnXbWSt+
	Q6EKI+oHXw8Wf3s+Mk+7oSejtZzI7m1fAwXErOmtUcLrH2umbRM88ejy
X-Gm-Gg: AYBFou2F3sNy9f5d3f4+9DZlRiHhkW9SCyR+k4jK0/Zzm2CsRNyedOPvKiQaU2Xd5fB
	akA0JFl6zrq0HjW8YHe2NERWx1fYKHhzh9viYXltLMlUslPRWjxXUy9o0VwR+Z7bDs9OI1Zq5LL
	8KZkMXRAh6IfxceKLbA95plBJx1vhtnM/bLOX3JFGlOMI/BSlv39XDDnZWjRM/QoE1mBII/K4lE
	TZ9BPIrfPMi17uN1E/Vx5OYiSC7pxhLnn3xjKjPsr3ROmlvT3zSKzwuUzMa/Vavp1EVPbfumbaw
	s5+SUo7XvgTCkxlwXuxOigCIHB8Nr+TTUVllJpKTtR/8bXRhnK7g/misQPH3/uiwNQ5sdSSHs6+
	TCcOkvkktskGDhVRZMj82Qh9CNdlqBGPTT4YGofeL55tJXh1Ktrx38LwYmI2UZpGc5iznFEnFvd
	AoH3lCjypxug591mSjDQDihFOQINgvMNrNVxsigz36yl0qXsZsRexvVq5HsKlcLGtt+K7IZ4f9K
	l3sOQNBzyf5967scB4ejvi2PF3PK3FbnjWW2CXHzqpQ0sO5XL0Ge4DYCl2wuXwAXfHp3q56CInc
	pQ3UBJGEHhgibjanX9kZGWTaN8LxWGy6y8H2oBtAvE3uX3FaKxDu/MPbcUkt
X-Received: by 2002:a05:6000:4553:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48e264ce5dcmr2487077f8f.19.1792582473710;
        Wed, 21 Oct 2026 04:34:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm5068768f8f.33.2026.10.21.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:34:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/2] mfd: add Airoha AN8855 switch support
Date: Wed, 21 Oct 2026 13:34:15 +0200
Message-ID: <20261021113419.283015-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This is a subset only specific for MFD changes for Airoha AN8855
switch support.

The old series with all the patches can be reached here [1]
Changelog is included in the same link

[1] https://lore.kernel.org/all/20261009161102.38961-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 579 ++++++++++++++++++
 4 files changed, 770 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0


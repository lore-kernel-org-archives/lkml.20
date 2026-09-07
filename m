Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4102C11CF;
	Mon,  7 Sep 2026 06:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761514; cv=none; b=SRo13MD8LMjedxLSuXWhdSKUryl6wVRvQKQvTrVTYA25PWANNRaH70NaZcV953CuA+yPVOnYW3528mq37PvIEvwwrnFRU1hzx9tpFKSthw9mIe9rC0tf/5+nXVvPoI8sT9GYS2rB+xbyJsYixrJ/DSVjAYGr4H0QV5ZwhJdxG1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761514; c=relaxed/simple;
	bh=wGPay9A9qATNnqppqo4cBmmU5rAf4n9Ajlzx3PExD4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HG2tLgbPF4opp5o3bXugpBU2V2Qk58ggotKaeK1MSiZBT0MTkhdxcw5c9PDRslkF4wQWpZx0dAoXnQSWHTovP48Dgrvo0wRRY6JKq0gQ9RY7dDbfuxs+miJWuD5QxcxnE3KuPv65w9UtEQLXDhLz1LSnTtQjg/txSAXewyaRofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=n4+nhmX2; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="n4+nhmX2"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hdcCh18ZLzMlCM;
	Mon, 07 Sep 2026 08:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788761504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGPay9A9qATNnqppqo4cBmmU5rAf4n9Ajlzx3PExD4I=;
	b=n4+nhmX2YrLYMSIb6VrVETQrp1mPvyUkA4grZShT815sCyb9F7viXZqvAhM2VbXXG3To3y
	U6IfYoTQf5LvCviVaNSsT/L1l9dZknpKg4EhxFFsYPbmWM0jQo87e7kqxM5xJdZKplbk+C
	MpEkiftx9rTFlJmEYJueUii3KyDyk8EpZBiALcKDkzGNs4o1fi99GMvK4k7HVXJRH0w/QI
	+SVATSHDRUrtLIx/jNGN2WBpmI5DaT5z08XWmXoDoaPuEEP+hGNDrLnjunr91UTteeaIB4
	mQpjp55cPP9Cf8nZA4rpv9BFp26QItE65sNP/z36cdzg0RxNw/eutwaL3hCRbA==
Message-ID: <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
Date: Mon, 7 Sep 2026 08:02:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3rtxcznpykrpkofi3z1e1xdqpbddtpj3
X-MBO-RS-ID: 7c43c5405db0c7d7e45

On 9/7/26 7:46 AM, Shashank Maurya wrote:
> The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
> rail to be enabled before any I2C register access is attempted. Use
> devm_regulator_get() to obtain the vcc supply and enable it at the
> start of probe.
Which power rail is this ?

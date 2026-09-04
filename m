Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB4503BCF;
	Fri,  4 Sep 2026 16:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539997; cv=none; b=C7HaSdk3i3HFoEiB2areqhjUMMhO5dM9O28bNk6Dq0nPnih2M0CdCpyxBqOz/rp7D+7MOz1IM+vXtJnUc09BKTrXeea5Uoq+VHqxnn4O6yJ5nkWF74GLcPIdFc54r7ZuvT530b1jUNvKNjFt6e9kkd+BJcnpU2lf9/F6gpqjOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539997; c=relaxed/simple;
	bh=eLcIG1CDS4fNnXKHOTIQDLLSdwcHjpfJv5wJJ9Sl8mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBLCZMpMj2SIl7PzMSAptrBwEBQAFMIjdUQVeisidI9SY37ANeQKdMpOVBg9+w/2quhTYTzIVuAhJVV98MqlsPDUTXYBLLPr4HNETg1BRCJJ4bkNz0Fz34cAqiHs6otSDw81HDQkiqKwxxvZs1pFMsdFqXaZeJ9zr2LSDj3Vw8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=f/4uIeeM; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="f/4uIeeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1788539993; x=1789144793; i=wahrenst@gmx.net;
	bh=eLcIG1CDS4fNnXKHOTIQDLLSdwcHjpfJv5wJJ9Sl8mU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f/4uIeeMwZjyM/RbGJWXXmrbYIGotAIDKX5DYvyilP8okhlWc6Tn/Pf2fjLrD9Dg
	 xzmCIwJZA3E4JYNmQ/GltJUz4aEcnLepnkXbhRp3ULE6jpUTf4PaZh+MMoS5p9Nt8
	 A26Wc4+Fq4io+r6Ju73Ez233U0oy/G1Z242odIl9138mmAVtK0hygZeptcSNqp5iH
	 CvPiJA5sypoX7mb8nNYAEu+2QCUZQASrj6IWaq0uYqJo++Hh9M1tsWt8iWZ99FwQp
	 BI1FNun94S6Lnm9ssSPfTohidgMjbiksVAMoMr7RLsaF4Pd3EpzZJoyexGZHb1ODF
	 Ze0DKgQg+hRzaF2lBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1wjd7k44r6-00w9jZ; Fri, 04
 Sep 2026 18:39:53 +0200
Message-ID: <20a09866-27d1-4dd7-b61a-c0533af17ac2@gmx.net>
Date: Fri, 4 Sep 2026 18:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] firmware: raspberrypi: Add reboot mode support
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
 <20260904-rpi-tryboot-v4-3-fdee8bc53ff7@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260904-rpi-tryboot-v4-3-fdee8bc53ff7@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:g/6/c2eS4Uc57lTxFQeg5Zd+3fdinY2sk2MgSPjBVv4Ph4mTg5H
 UjoWiYTAe+MG/UWravVWfbCeEm11rHhzHnZiVq4guO6mrOufMI89AsbPkhwnxdipm8ZY9Cd
 6a3H4aZE5SZa/FJMpxHWZWVh+QXpf2NF7zniW7H4OId2ykLLuKCx1jGVeNmziiGd7+YSflB
 YyDelrZqnxZVBKLBSoznw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YM7ql6wY9FM=;cX1cPkkWkkk5vb+JZpmHJPjloLo
 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

Am 04.09.26 um 09:46 schrieb Gregor Herburger:
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This can be used to create a A/B update scheme.
>
> To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> message must be sent to the firmware. Add support for this by
> registering a reboot mode driver.
>
> Furthermore, safely registering the reboot mode requires adjusting the
> teardown sequence. Replace the manually called rpi_firmware_put() with a
> devres-managed called (devm_add_action_or_reset). Without this, the
> cleanup function of devm_reboot_mode_register() would trigger a
> use-after-free error by attempting to access the firmware context after
> it had already been freed by rpi_firmware_remove().
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
Tested-by: Stefan Wahren <wahrenst@gmx.net>

I tested with a Raspberry Pi 3 B Plus i didn't see any regressions

also the code looks fine to me

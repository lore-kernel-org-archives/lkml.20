Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600714;
	b=qHvCwT0jJHsAMuC4C0Av1IZA9KWwY9HpgWshorePH1tfuAkIptBxILIBDFsNRgOzeiHd
	 7bHyi9CnSO7y2yu16M37VIBmr8AIjiC1TaAJGJmHbs4CbRqoMhOTSbl96ov1b1DkQL6hp
	 Z0qyKBAC2VdkI66a2DDjcEKJHQb2PVr90jrTZ4k+AMZRG4TE61pQZI3GgkTR2wL4M/5c3
	 EwmTSqKiYUh4yEudvPHqB0lrhB2/d4QmIsL4cjFR6Wu9m8k8MC7bKIX3hkbmDnHbtxxHl
	 EEYzvN9zA4X2074uxqsQ7xFsrEfqZjT9UZWy27gYwi/6gKpcG783jBWaaJHSfE3wFDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600714;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=C2WIUAy49gs6vfvzT/Qt5wlTvvXfJdz0ejU2p9NvaAc=;
	b=G0dbE8Hexfgb2LQ92bq2G1sUcTx6Pl3tD19ywTAzH6awrPwFhvGwXNlKfnAAq+cBo+Wq
	 t+uPIAxi9L7FPJAh793LTLadj4rN/gzy5tLOSOuLoV2o2Bg7pfNUrkXQOqiPjB0czIe4E
	 jz4nZ8/fj9Do0VOIBdX7N9833ZRQLLRN5CP8/Cy5K933LYSjncAP+RizcgiWsZ+Zp6ubI
	 M17iVj+w6zvQO6XSBB14lwG9pV4elI/5ZhNKUn/AYLiX5eozBvgIjsEfC4k0SXtQizvbD
	 +LrgQRs1h2xKkDGSUMbkmoxbzYBIoz4LaN70aBCWDq3o53REaIZPe3kRtgpsTBx6yBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VugT8O2x;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5475606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5475606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VugT8O2x
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3354F4E4125B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:38:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3392606E3;
	Wed, 21 Oct 2026 16:38:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3ED2103289F5;
	Wed, 21 Oct 2026 18:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792600707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C2WIUAy49gs6vfvzT/Qt5wlTvvXfJdz0ejU2p9NvaAc=;
	b=VugT8O2x9nWAg/rEXGCa17ZUQ6lahSz+Sl2WieyEiJ5IxxzVbP6J1H5lLIC78yFSJKFVHh
	oPSXnqtRW6U6/nqUSg0ivNHBFQTeSYF5EU7FNHOkPf4vAUD528T4grFxWzoUVHgGDijnff
	DiJoyGIa83mUIW5AR9CTfjl2gJaPFz4wEX1++7CmOMQz6/LyYTM7M3Wur1puttKXJCkCi7
	u9HrDApj4JeLpKGr3HDAzggZ1bt5AbjOImw6jDskwkRyQewuTJS8FmItZzhKTMTGUw6vzV
	ltaAmn17PKXcbCSe/4MOK+V6JD4eUlg3jwtQE7HKNKQe5sYwcnhdo9sa87AJAQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 09/28] mfd: cgbc: Zero-initialise version buffer in
 cgbc_get_version()
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261021121245.3111563-9-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-9-lee@kernel.org>
Date: Wed, 21 Oct 2026 18:38:18 +0200
Message-Id: <179260069841.1125687.16461366525950099809.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> If the Board Controller returns a short response to the firmware
> revision query in cgbc_get_version(), cgbc_command() can succeed
> without populating all bytes of the stack-allocated data buffer.
> Those uninitialised stack bytes are then copied into cgbc->version
> and exposed to userspace via the cgbc_version sysfs attribute.
> 
> Zero-initialise the data buffer on the stack to prevent leaking
> uninitialised kernel stack memory.
> 
> Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
> Closes: https://sashiko.dev/#/bug/linux-8c473713-527e-4619-8404-689f28c7654d
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
>
> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index edfac2b60718..7513ba42eb96 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -461,7 +461,7 @@ ATTRIBUTE_GROUPS(cgbc);
>  static int cgbc_get_version(struct cgbc_device_data *cgbc)
>  {
>  	u8 cmd = CGBC_CMD_GET_FW_REV;
> -	u8 data[4];
> +	u8 data[4] = {};
>  	int ret;
>  
>  	ret = cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);

Yes Sashiko complained multiple times even if I already explained it cannot
happen if cgbc_command succeeds. Anyway I agree that things can be improved
but I would prefer in a generic way:
- add macros for cmd resp size (eg CGBC_CMD_GET_FW_REV_RESP_SIZE) in all cgbc
  drivers
- cgbc_command() should return an error if data buffer size doesn't match
  the number of bytes returned by the hardware, it is not the case today [1].

[1] https://elixir.bootlin.com/linux/v7.3/source/drivers/mfd/cgbc-core.c#L194-L195

I'll prepare a series if you are okay.

Best Regards,
Thomas

-- 
Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

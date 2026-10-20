Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482901;
	b=zbtOLhHMEFifcjsT+lqEdFCmeV0Bfrq9Lyzbs+a5MuWPJufngdc3XartAeF2bN4WhISc
	 naqhX3a6HDUy0XBt2RqI7ndvQ++KsaDaAl/3uTrxettLutPAw6BxLSxWwoXBanjlC4KUc
	 0tC+ltS4AwhwE039qgGESGKe41ypybrMDAmY9XAjIBlilZtb3BJb2Yq4RYovuipPIWP0O
	 jixRqg8mhb+QkNiOSx95mDuewolVjcPMezRD88T9QhDkLN3PaN26RGWqUVKCXhCw8loG+
	 B/poXi74G/Gzix7KgX68eIJkjeMhQrUvX+l5AKJcvPlf7k9Z5R4BTbu9VMeF4ysrvAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482901;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=3UPy3zoBO7A35TfMLAMleJUNfAjC6tVhi20GJ3EVf0g=;
	b=PnQK2Ktc5XQFtrOCZ6/N2CLzwZrueDCw8kxHgTDPo1khSfejxOCs9T5X8baEov0sT+Fe
	 O7MqeF/dYkEX30Gz8dEHRK/AFVNoGrJmASbTSq+LvuIWg5Viuox/G2NqG/p1PFO8QCikR
	 yGUrhhH2mhb8Bpf7aLPDzJFMbTxiuBzhkyfZ1WOtfj25aLyrIpzbmAor8HkpjYJmtCArr
	 DxugxeUbBWEtH+U1wHG4ea+pe8z59b/nOyvjlHzDp41wrQDASS8jOuikhT/xKnYATtg6c
	 tMY4IdhbU6lraebTxqkUkKJaPWCTxgzVMbj4NDbY53fmh95kCFDZNryuQs5joPvODZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SiiV5HAk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C260A261A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650C260A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SiiV5HAk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18A7B4E4128D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:54:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFF1260393;
	Tue, 20 Oct 2026 07:54:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5FEE10328D1B;
	Tue, 20 Oct 2026 09:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792482883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3UPy3zoBO7A35TfMLAMleJUNfAjC6tVhi20GJ3EVf0g=;
	b=SiiV5HAkT/1qZ8yaPxx7UXhSXoY2I/Y+GNzkqW4uRl129GW1iI/Z83TlnB5iiayrBO23LA
	p6o6t6/y6ryrm7ytbgXNrhqY8OOGJAJ36uxuTk6EnsupwFj6z33D5CqcVnRZmjlDCiDoPc
	IorC2YGlEHlhzXf/XG/yGSpMlFIdcC0Yp7Y9UE+kZT608Yvr05gsGlFnY67qPCow8Pelt0
	BCPG5BJN/ysH1D0cbR9VUGWsFxvlx7xW1lgqSudmQxrk+5nY2gDlA8LLJXmkXcaU1R3GI7
	seuUH8bHZEW9LOu8WeR3fFnOE5bidaG6S4KBzj68tGLsT6J1ChPc1Go8Y1Kuyg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:54:41 +0200
Message-Id: <DM9I5FRJWCIB.21BAQCFJQAQWC@bootlin.com>
Cc: "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 3/6] watchdog: w83627hf_wdt: Convert to platform
 driver model
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261013-w83627hf_wdt-improvements-v4-0-b6f6b60a9566@bootlin.com> <20261013-w83627hf_wdt-improvements-v4-3-b6f6b60a9566@bootlin.com> <atY1zCt9YWcaxeAo@google.com>
In-Reply-To: <atY1zCt9YWcaxeAo@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Oct 19, 2026 at 5:22 PM CEST, Tzung-Bi Shih wrote:
> On Tue, Oct 13, 2026 at 03:58:47PM +0200, Paul Louvel wrote:
>> +static int wdt_probe(struct platform_device *pdev)
>> +{
> ...
>> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to allocate memory\n");
>
> dev_err_probe() doesn't print anything on -ENOMEM [1].
>
> [1] https://elixir.bootlin.com/linux/v7.2/source/drivers/base/core.c#L509=
7

ACK.

Thanks,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


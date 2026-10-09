Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054352FE55
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914119; cv=none; b=SdGhw3voEwT5BMIuKZQk7Y/H9SvdjV40YTX10Da9shkpViRbmmIvm5/lFeduCFsG4O6hJ6ofPp21OZ7NWmG9GhsIrculZdDIEEtcMiFVDbmL+VX1NihbUdrwbbWYYsXW8dspXafWxm2cYiXraGOrOy4jQq2iAPY8Qr84qfcEZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914119; c=relaxed/simple;
	bh=mWSUj4RoFLc0FXHzBFMNertWwoUBE5OkDnbtOlOniIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i5aVSp9apU67epdcAp/hJ7WJ397Rt2EE887tmpp01NebnbqUAH6eGuS2mfAjWTgR4CHSYvTjtX65pnBsJAAHzQkhii/EiUZNngaqPbgC+Lqd9OiGiUyEpAKCY1668i98UbgpQ6PwkHMgpPlvkSkhT9ezy7rcZbcvGVSTLZfLkv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hI8IKQSd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hI8IKQSd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1149DC653FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 653B560362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:55:16 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id A210E11D718AB; Tue, 13 Oct 2026 19:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M/HrYacXXjLYQbAZGPtXWCfSlciS84WjgdSaTYtaAQU=;
	b=hI8IKQSdKaysCSFkXMSyK7O4XiiQ84DXIUZ2n82+BZzyBjSfhl9y5f1gJOEpp1Sc76K2zl
	v1r+tAxptNrsZctyeIr0Ugc1Ne8MCb7xvddIK9NjgwdaqLyNLybBR+gHtpliFbwv0mDxUc
	EamScVPT9tLAQjhaXOq9f828BVDy69ZmQ0zCFBCiTPdmfq4WTVEz8zPqgRcd+xgy5Alizv
	6U8owE1g7Op/vUwmvWqFo0yjLUNujgKZr19ikcYk6MUV/NE3UBiR+BupPLYC5fBuMjBkwr
	geMVbx8SDh/Kvk2S8d7mYEZmGqQLEBuy0kKAwVu7xdNWvn/4UmZ7i+7fDoZ+CQ==
Authentication-Results: mail.galae.net;
	none
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 16:16:31 +0200
Message-Id: <DM0DDSTMFXRZ.29S5EXLMD7MHH@bootlin.com>
Cc: "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 6/6] watchdog: w83627hf_wdt: Report all
 initialization failures in probe
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261004-w83627hf_wdt-improvements-v3-0-8e27b518595e@bootlin.com> <20261004-w83627hf_wdt-improvements-v3-6-8e27b518595e@bootlin.com> <asUE9eMeey5C42L4@google.com>
In-Reply-To: <asUE9eMeey5C42L4@google.com>
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: A210E11D718AB
X-Spamd-Result: default: False [1.37 / 30.00];
	DATE_IN_PAST(1.00)[99];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.03)[51.65%];
	RCVD_COUNT_ZERO(0.00)[0];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	ARC_NA(0.00)[];
	BCC(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,galae.net:url,linux-watchdog.org:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,roeck-us.net:email];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]

On Tue Oct 6, 2026 at 4:25 PM CEST, Tzung-Bi Shih wrote:
> On Sun, Oct 04, 2026 at 02:12:54PM +0200, Paul Louvel wrote:
>> @@ -549,12 +549,12 @@ static int wdt_probe(struct platform_device *pdev)
>>  		}
>> =20
>>  		if (ret)
>> -			return ret;
>> +			return dev_err_probe(dev, ret, "failed to set watchdog timeout\n");
>>  	}
>> =20
>>  	ret =3D devm_watchdog_register_device(dev, wdd);
>>  	if (ret)
>> -		return ret;
>> +		return dev_err_probe(dev, ret, "failed to register watchdog\n");
>
> Could this patch be split and squashed into the earlier patches in the
> series?

Sure.

Thanks,


--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

text:
Return-Path: <paul.louvel@bootlin.com>
Delivered-To: paul.louvel@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id 8JqdGEP3yGoblikAtaWaaQ
	(envelope-from <paul.louvel@bootlin.com>)
	for <paul.louvel@bootlin.com>; Fri, 09 Oct 2026 16:16:35 +0200
X-Original-To: paul.louvel@bootlin.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7709111D70695;
	Fri,  9 Oct 2026 16:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791555394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+6RbIlULZXUp8nBwvQCiDE791qoyPgtSl8eRr5UTXE0=;
	b=TqowhqpHs1FQoD3nipGC2madeVxQD3oc3Ng2IpD/U/sSYSKZ3g+vnXGZ4KRn4Re6lyQJ+m
	Cp1hBJXMjN8lYN4cARINL6LMT3H0tN/gw3lQr/nkeyna4iwi7cogoExl6UyD88FEFaUwUc
	WPPSs94sl4xDd6cAgg7xKZW8ELFldqi9A72hlZ2M3zcC9thyho/hQ8WfY+zcUs3xwQPYSH
	l/SDzO6rnpa9bNotmiZ7pi2YXR4If2E0981cxs5vI+WltPymbmIObao11ADXhb8bTnbVXj
	7/f+MOesjPFoaqEQCFQe9UgkrT0VtZqVS8FPfCV3K4M/h/K8p7guAcbuq3ATiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 16:16:31 +0200
Message-Id: <DM0DDSTMFXRZ.29S5EXLMD7MHH@bootlin.com>
Cc: "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 6/6] watchdog: w83627hf_wdt: Report all
 initialization failures in probe
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261004-w83627hf_wdt-improvements-v3-0-8e27b518595e@bootlin.com> <20261004-w83627hf_wdt-improvements-v3-6-8e27b518595e@bootlin.com> <asUE9eMeey5C42L4@google.com>
In-Reply-To: <asUE9eMeey5C42L4@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 6, 2026 at 4:25 PM CEST, Tzung-Bi Shih wrote:
> On Sun, Oct 04, 2026 at 02:12:54PM +0200, Paul Louvel wrote:
>> @@ -549,12 +549,12 @@ static int wdt_probe(struct platform_device *pdev)
>>  		}
>> =20
>>  		if (ret)
>> -			return ret;
>> +			return dev_err_probe(dev, ret, "failed to set watchdog timeout\n");
>>  	}
>> =20
>>  	ret =3D devm_watchdog_register_device(dev, wdd);
>>  	if (ret)
>> -		return ret;
>> +		return dev_err_probe(dev, ret, "failed to register watchdog\n");
>
> Could this patch be split and squashed into the earlier patches in the
> series?

Sure.

Thanks,


--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


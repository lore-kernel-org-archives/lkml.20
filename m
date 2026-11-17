Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911782;
	b=uCg/ieV9W6mys5b+OKjNawttwtEL7QoKGGvyrzuJ2otvpOQXkGNsqZIwyv1FCuHLx0oo
	 mt5cF7dtFnG98xpPRtk5O33QlcmOYh0nmc2c245AyZdwcmzMJLPQct4RhS684pU+aFm51
	 sHPwpkwtrnuTsfpwsIRF4XjXBH00mHi7A/uj1RS0tM87lB/xvPdB4FlZx1c2lxecEiDC2
	 u6ikk7mRj5EsUQ5qO4HStZHNzLpUe4YCyWvFVpbYxUL34+8GMIgFD/qQbpYEJCDGgg0n8
	 ABqYCTKUD7HmMGXDGUzp0vRBtHkrhxVwxe77fvSliJM+aUD7uFYa6uwd1bMxYRA8eAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911782;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=9vdN6y1G2nELn9LraDSoLy0IYPDjkvIY23fxYzj6Ado=;
	b=ba58LI0xx0A+3/NsunPuLXQg9bzKs7nQr51XhA8uDOOH3eBNC3q/ea29/Ta+xZPL8kaW
	 mOpp2gXUuiY/oQWDPFtLgyZegw7TAkHX9AA2N/Y1hmIcC+GCosNnIkY/hpH8a+XFuoTSF
	 nihmltXGJ0ffYRy8kWjIwPVTe78ZmZgYNyGy1jhW2Kz4QAdS473WdJvRa2ltl6SkkEdNJ
	 ncgYYGOhxIaVQ6Ld5GMkurZtt1pH3VxwLI9VkrtJqUZe7f4iiYhcVzm98MxNYETo3mfck
	 kOFr6hPNhZ38qWbgqvJVqG9yTjJUgcAoBK1MDbCI+a+z8FYp4RZ9US3ADOZJL919Epg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i6NcTrGo;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20C7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i6NcTrGo
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E3FEBC4CBCA;
	Tue, 17 Nov 2026 10:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D29D5FC81;
	Tue, 17 Nov 2026 10:36:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C43E11BC025C;
	Tue, 17 Nov 2026 11:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794911775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9vdN6y1G2nELn9LraDSoLy0IYPDjkvIY23fxYzj6Ado=;
	b=i6NcTrGoY7UUepB//+4GFB09Y0oI5v7K8Byc0ZULOw9hUAq/sbQFEUXqiSKnjz1mW9+T+r
	5rRf1wiTOS882jFl/tlWk3LHI58J82gY68m679bG32+DyiWWSIKy9TJ2i5iw8ULft5zRGp
	pMXqKHDgCzlXrjSO5BhOvoy5+4ztJ5h/iIpEY77sE34kiqPztW9soyJQ0THBugomPY0b0Q
	DbVwZ9YvpWUsUavNdi2sQ5KGmUcVTcX0rVfAsr4Sa5PITgnzSpcc09vP0NkI8imPLsNjZy
	NAAnCQfQD7NbIHgRVxWo7nAUdw1Lzvthy/3r6b3dCrPwk64MpU7Ci6dPYqMiQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Brian Norris <computersforpeace@gmail.com>,
  Alexey Klimov <alexey.klimov@linaro.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a
 command times out
In-Reply-To: <20261114201054.975225-1-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Sat, 14 Nov 2026 21:10:54 +0100")
References: <20261114201054.975225-1-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:36:12 +0100
Message-ID: <87a4n7n3s3.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

Hi Mehmet,

On 14/11/2026 at 21:10:54 +01, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> Hi Miquel,
>
> Please do not apply this patch as it is. Sashiko is right: when the
> timeout hits the raw re-read in vf610_nfc_correct_data(),
> vf610_nfc_read_page() counts it as an ECC failure and returns 0 instead
> of the error. I could reproduce it by forcing the timeout there.
>
> v3 will return it. Patches 1/3 and 2/3 are not affected.

Thanks for the feedback, waiting for v3.

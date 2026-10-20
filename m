Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482885;
	b=mkJR42HEaRz+zYQgPYJyCgesN9zdbW1QMXFCBciEownXvINJ3dn2uG/ZvMaWe8g/wawJ
	 JRokSin9Rxi8S6rQ4ZBcthmyB7KUpFnIivvxcFvt7dArP6pBtqIagDiJccAF8sjUiqRcG
	 HMEkFM+7L0T9DiH8mS4ggqY9idwRcMUExft8xYJmuIhsFB442ZWdgAk7ciVD21FOm51rQ
	 AxKmlm31MckYWsEKDIIBy/Y4Rqs4NyXiNSoE5R+c5/3amVak6/clItLyr5b7HICz7TQjZ
	 abCmCydcI9N7U6GNom8aypichsJxAQFtQ8wvD5aUOPlIRslDtVgZhmm9FuLuXl+ftNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482885;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=nhRD7+nxyHeCKS+xkeCWsLjCOGr/T5riYo2YwiC+rww=;
	b=D0tP75Shl6EoJnQ7It65c3aLoeEX1Th+Z2QbMF/TppILk378YGDk/nqNhO0PHzn0rtQD
	 2yl6d8FvkqhoRl34wFRVMR75KlRoppVoXJ8/Q/amayVN1/43zPp7DsAQwLan0S3RNk3Mk
	 alS3y1pAdEBwBui3TPGY5YYj9iu506cU1mvoGPvAtHanNFhU3D7I6Xr+Gwb1RfgaSkSeF
	 tRWdRmPGBELg9M9oXRhf2dGFCSCdF1CVBATV4jycI2xu2Y2TUs9z0+S45dtEE536gBdfS
	 PWffMMwOK+ZBN6nUVGq8UIibR1vYOL81cN6/KPCfdJt+TfbjoIJVZ8+Fkm/Nww7Ti+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1N3mKuZI;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88760A2605
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF88760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1N3mKuZI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 442301A129A;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18B2E60393;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5448A10328D55;
	Tue, 20 Oct 2026 09:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792482866; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nhRD7+nxyHeCKS+xkeCWsLjCOGr/T5riYo2YwiC+rww=;
	b=1N3mKuZI0qxd6NRMVyevLU7abiuW3foNzamZpUF5nc0LMuS1ZOv15zGssSgmZXSG8Q1Zwa
	fMPrPkw1e9Uv15TxnfOzxDAVr7ostyN/wBesKDLV0V1qMabUTrwp6Ep9HPvr4WCC+wI+AH
	ppXavt/nePP1bqqMOLBqoxyt69GI3F8VzILWjAvgiRTLE++hJttq3Iftsj+LOyWoeJ8kQ0
	aWpIy12aYFolytX6Vo1kKUGRHvQoohidPZv6mY8cyttHXb+ryIB24IgHFv6UlfZwCNsrC2
	E6L1oUccqE0dEnQ7I6ilzrz/QmmCgw6mmnN2FyklD+7nP9xFEUqm5tfJHF/kkg==
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
Date: Tue, 20 Oct 2026 09:54:25 +0200
Message-Id: <DM9I58934NW5.OE48MSUCM2Q1@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/6] watchdog: w83627hf_wdt: Replace magic numbers
 with descriptive macros
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261013-w83627hf_wdt-improvements-v4-0-b6f6b60a9566@bootlin.com> <20261013-w83627hf_wdt-improvements-v4-2-b6f6b60a9566@bootlin.com> <atY1rXhHo2RJbDrF@google.com>
In-Reply-To: <atY1rXhHo2RJbDrF@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Oct 19, 2026 at 5:22 PM CEST, Tzung-Bi Shih wrote:
> On Tue, Oct 13, 2026 at 03:58:46PM +0200, Paul Louvel wrote:
>> Raw hex values for Super I/O register addresses are difficult to
>> understand
>> without constantly consulting the datasheet. Use named macros instead.
>> Also, replace macros value that contains bit position with the BIT()
>> macro.
>> Remove comments that doesn't help understanding the code.
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>
> This looks good to me.  Except for a weird line wrap in the commit messag=
e,
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

ACK.

Thanks,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


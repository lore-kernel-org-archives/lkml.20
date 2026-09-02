Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D34A3877
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360536; cv=none; b=SisvpsRL2oFj96EiWQq3rDx/MKF1o18GFCVH96cBrr+2AYCpBZ9N4xtT3l+R7pDPZTw2ywJNUzyFAjJM2vVnjTMAkjGTpR9Iz3bOxiHP15mdknhVBzBl+SIoleZlRRmc0YXpUnweLBkv+cHF8HnukeFceBRLMq5+G7z6Tz6O1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360536; c=relaxed/simple;
	bh=kKyP0KBxakTaDA9ZOZgXWO84xJnxt16TUKmmMmMWZ5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OSMlcBlVdZJFGr6HE/KwVR0DFlq1/Fj6C9dMAjYQZTH8qwuBAIY1vksq2UGuWZ9jXIamUi642QoHBr7sK8IGUgYUvauApyfEBR1BAkiZFKHu0OIR5dAwKm7okF9h7xWShgKYEo8aThPbjfFBanyZ+q9cmRDAXlZbYRZ1aamYXpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cFage9wx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cFage9wx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF7B14E414E4;
	Wed,  2 Sep 2026 14:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 906B96053C;
	Wed,  2 Sep 2026 14:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3940111C792AB;
	Wed,  2 Sep 2026 16:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788360524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kKyP0KBxakTaDA9ZOZgXWO84xJnxt16TUKmmMmMWZ5o=;
	b=cFage9wxV+lKQQXdLrZPivLydFioAXSPdrLl0Pf+32Fetbt/c5BEtAhB+vPCCYWgMVmI8A
	PLatga4yHA5lIzIKK7WujwrK+Fj3zEZLkcQDRumqloRMOonQf7JFjEULM1Gcyo6di/x7KC
	wnESG53ex/2gbearIlyjse8Gdygg7vf7+32f+yLOEUIkBOX7mIAach54O8aqrkr1xJPdao
	DmYyisTQ3WnBZDubMVgixx4ijrWmhrBQWd3VslYqgJrIVC1iQMzxocwI2nKc4gmPv0pcyv
	S7DJFHF6+lH8ge3Cmkm5eVfhiXq4KY0Tvjg1f8ntvIp+T4Rxo0Gri5CmyltJ2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <corbet@lwn.net>,  <skhan@linuxfoundation.org>,  <STLin2@winbond.com>,
  <hsinyi@chromium.org>,  <thomas.petazzoni@bootlin.com>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
In-Reply-To: <4d7597839fc542ea846fe0ddb3eb6683@infineon.com> (Takahiro
	Kuwano's message of "Thu, 20 Aug 2026 06:15:08 +0000")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
	<4d7597839fc542ea846fe0ddb3eb6683@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 16:48:38 +0200
Message-ID: <87se3r7lq1.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 20/08/2026 at 06:15:08 GMT, <Takahiro.Kuwano@infineon.com> wrote:

> Hi Miquel,
>
>> There is an ID collision with the chip of same density from the JV
>> family. Both chips are very similar in practice, it is mostly a matter
>> of electrical differences (mostly power consumption being lower).
>>=20
>> As a significant difference, RV chips identify themselves as supporting
>> the new SFDP (rev F) field which forces an alternate write SR2
>> opcode (0x31).
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>> + cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> ef4020
>
> ef4021?
> I think you copied wrong log (this looks same as patch #12).

Correct! I just made a new acquisition and fixed the logs.

Thanks!
Miqu=C3=A8l

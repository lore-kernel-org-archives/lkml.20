Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D304BFE7C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044036; cv=none; b=nxo4SDMaWparoeQBTlynyGFvRGu6zCJQfRkurH0sO9iUzQRSP/KMTMzJnkrUFTJrGR6LGDHME0E5/q7N9KYL/bj2RJ3rmPX8SyynCwK+nrrIjqBP7TujVam0xEBERTgzOQMJWbnNSSl1Vr1IF69ZWo1mxKuRmXO9b7gSRuJUfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044036; c=relaxed/simple;
	bh=8hZmNbR+rogSnhO68yricdlUeOrgITPPveXT7tAaH6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JLxxLwWm3FlL1nKjLU2nbS2IN7E5zGQqvmm+HNXpOeqxKmWUdPBy1ujjOfZuZs9oHbdqLP6JtRWy83UNTtYUCv0dPksbENqgkKwoL0I9wwf8QWDrGz5A+s4hRdq3OZ30Sh2zSPQyCCQJStvuIiAPYuP2GUhbC0+2G8PJV5EGS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Kx4zpCyO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Kx4zpCyO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8522F1A010B;
	Thu, 10 Sep 2026 12:40:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5863E5FA2F;
	Thu, 10 Sep 2026 12:40:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E72711C78654;
	Thu, 10 Sep 2026 14:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789044027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q4jTORQ7x029cF9PeX8n/NioDl8L2Yhv88fNsnF4ayc=;
	b=Kx4zpCyOG53XEf3HMLST7rKS+mfAVaNUO3fvyS/l7cJ83O5PSzos9Yfs2Hbnc4vTat2Knf
	HELym89Lqk4ji+WaBzwMvwnlNKMyP1XAQCch7ngiNsBPrrMGrVQ0YR85e/FNJimAR5sAg2
	olufmZtFuYMLlg9Zqlf5NROxAqlgpHLMrJlFOjajCjWWLoHW+iCUCuFwapYw6fG9ehy+5e
	zGnNY0hScJ6XUlow0RmeORodkqkqkEhI6EGgMUOEZiST0eIrPQkL43VVE4y1CYMnqzK38i
	tQKfU9umBXVPvwsctGQLi53i0p9LpLUMV5y4TuxNegr30iWCLTlVR88xa6ykhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sagnik Sasmal <sagnik@sagnik.me>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  mikhail.kshevetskiy@iopsys.eu,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Do not update the QE bit on devices
 without one
In-Reply-To: <010701a08b180a21-f4b7e929-ff1c-494e-99ec-c563bf7c92f4-000000@eu-central-1.amazonses.com>
	(Sagnik Sasmal's message of "Thu, 10 Sep 2026 11:33:23 +0000")
References: <010701a08b180a21-f4b7e929-ff1c-494e-99ec-c563bf7c92f4-000000@eu-central-1.amazonses.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 14:40:24 +0200
Message-ID: <878q59s2iv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 10/09/2026 at 11:33:23 GMT, Sagnik Sasmal <sagnik@sagnik.me> wrote:

> Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
> steps in one single function") moved quad-enable setup into
> spinand_configure_chip(). The new code only determines whether quad
> mode is needed when SPINAND_HAS_QE_BIT is set, but calls
> spinand_init_quad_enable() unconditionally. This clears configuration
> register bit 0 on devices without a QE bit.
>
> That bit is not universally a QE bit. On the Winbond W25N02KV it is
> H-DIS, which disables the active-low HOLD function. Clearing H-DIS
> enables HOLD during single and dual I/O operations. If IO3 is not kept
> high, the flash can pause a command and ignore clock and data.
>
> H-DIS is not restored by the FFh reset command, allowing the incorrect
> state to survive an SoC warm reboot while the flash remains powered.
>
> Before the refactoring, spinand_init_quad_enable() returned without
> touching the configuration register when SPINAND_HAS_QE_BIT was not
> set. Restore that behavior.
>
> The regression was reproduced on a Jio JIDU6401 with an MT7986 SoC and
> a W25N02KV. With Linux 6.18.44, sysupgrade failed and the following warm
> reboot hung in BL2. With this change applied, both sysupgrade and warm
> reboot completed successfully.
>
> Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in=
 one single function")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Sagnik Sasmal <sagnik@sagnik.me>

Thanks for the report, and the debug and the proposal. Sorry for the
breakage.

While your solution works, I believe it would be cleaner do it this way:

--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1797,11 +1797,11 @@ static int spinand_configure_chip(struct spinand_de=
vice *spinand)
                    spinand->ssdr_op_templates.write_cache->data.buswidth =
=3D=3D 4 ||
                    spinand->ssdr_op_templates.update_cache->data.buswidth =
=3D=3D 4)
                        quad_enable =3D true;
-       }
=20
-       ret =3D spinand_init_quad_enable(spinand, quad_enable);
-       if (ret)
-               return ret;
+               ret =3D spinand_init_quad_enable(spinand, quad_enable);
+               if (ret)
+                       return ret;
+       }
=20
        if (spinand->configure_chip) {
                ret =3D spinand->configure_chip(spinand, SSDR);

Do you mind validating this and using something like this in your v2?
This would avoid to check the same flag in two different places. It also
keeps the spinand_init_quad_enable() minimal.

Thanks,
Miqu=C3=A8l

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BEB3B05AC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132893; cv=none; b=lPb3QTbWzWoBtJoA+FGr4cHDju5lkz3z7mOpWRwrOE7AK/sR1u9XeZJC9r36a9Zc1DjsUx0N0jjLNbSoTlmOrEEmyDrLFqSFcpkFbcojnqYTNim9mAaYIivGsgWXG1fyVr6QP2EOc0OyPS4Oje7jMblgw3S5+0jgxIRBu1xH97w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132893; c=relaxed/simple;
	bh=UBEuAqu3oXIvzyO+pcIzQzKxV2Q1SL0eWZzTzGzuS8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XTJ/d2hyuyC/KE/Uv2Bgwwk/Oa6UA668uFEb00T7uX/A/ipBTZ1nH2LzevlDI13Zs0v+TwbLDionV8FfvYvwF80S3xkjDahKDe992Z5s3bxwq8t5KlWPs+aIMg5BGvShccl2Dx77IpEAq+OPgOYYxDRVnCstilKU8ZereWGLkew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPRr3b0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPRr3b0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9823A1F000C5;
	Fri, 16 Oct 2026 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792132892;
	bh=TuTQOSuTkKq45lRXM4loOoRWaAqprlIEgvLlkpt8on8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PPRr3b0cSD5zqpgRVQHzjZwE5jejcP9MmWs7+bzNj/rbpCUnSgwHaRj/ZKul16wwb
	 tTjlfdcMGLlg5pC/m9KMGJrdkPMvcmi7QBUucRxsiW7jdRWVhVeFwZ4j5cc5HYwvpS
	 Lqi94ZmGDwwFckP63xCddrgoJLup0+FHfPKg5Ifb63FXzbyADJ3QM7rBk/TQYm54by
	 JOuvukrDjZI02TcIIYugcliG1McoNUnMALrdLliI2SX9+S00wwB0yLdIgnvkAWgH0u
	 K7uBwtnwmW0Wdaa5Rb/Y8J8EhVMW3M0O0+A/2sl+tZFkZSwAhvXbFKfLotFuIOdtd8
	 5C9PxQVQbCjjA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, David Laight <david.laight.linux@gmail.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015113209.975641-1-mwalle@kernel.org>
References: <20261015113209.975641-1-mwalle@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
Message-Id: <179213289035.1140554.7029307612793893706.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:41:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Thu, 15 Oct 2026 13:31:52 +0200, Michael Walle wrote:
> Two large spi_nor_flash_parameter structures on a function stack
> are really too much, and this can exceed an otherwise reasonable
> frame limit:
> 
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()
      commit: d7040c620d8b22f839af7750860b96e39cc58b7c

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


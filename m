Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925395;
	b=HPqVD+wDoI36+g9dGRF86XuIc/5AX4FjsSD2Jtlrecu7FJZ+jiHSc5QBHXZtupkGpBbW
	 N8m/c0ADYx5phj2mjhqH/7ovvSfcJoH1UY+Pf4iNGg0MHXAYFT62+oT12TIh+8w01mQ7I
	 5r0Fj6H4TMzSp6CY5c31rumQUy5x4FQwMxSkeyLQ8OGH+AwFGsdOW1RsbvNyxz3hy/m6t
	 uNr2bMWhWWl/WkJr6set+O63UTpIqpa3wlUDjtkDJqSGw2tQKpU7Xj9h1DarfNO7uvTcW
	 /7uiPLyTje06QzEYvcr8niKP03fxoGhwHNTmgxUqTABKmWsrskIG2KivK2alk5Br71w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925395;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=zrWoECbha8X9JRX7ekZ+k7/8LWlVHPYUraFEer9XzG8=;
	b=e0xTadGNLdDEd8fnADdEfo14QsawyP9etQhSd4YxhiQqp9sWWvV1hMJuFXWgZfTffOaC
	 ITG1o8aTlvlP+CqPR6YB0vRGZeK1UW17eqbLNw4os8ZHPTommAyWM6aZMyMdPQRaLHrhU
	 +kETIgmM+dLAAzCbirea6EWewloJUurCA07WHmBUe01TQGbTRV/i1MKydhqVg+PoKkcsc
	 ESQNEnW5K5yJjqd2DYoz8KRCQbtmeN0nP8g27asfZWjIXGfZk60EZoZgH6nuJBJFE3Hxa
	 dr83DomQL8SnKOiGRaoqG5dM/6ciWAtOSUY5axiq0sUGkZA9XwOiGbsL0AqtJVXiwrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cCIqqaj0;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F5606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865F5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cCIqqaj0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2180C4E4157D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBB7A5FD6A;
	Tue, 17 Nov 2026 14:23:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4261311BC0024;
	Tue, 17 Nov 2026 15:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zrWoECbha8X9JRX7ekZ+k7/8LWlVHPYUraFEer9XzG8=;
	b=cCIqqaj0+C9IYVbN9b6tKoRe3UqF/1LfewzM8nNUK589zDX0LK/1Z5IYzx/qnU96ByTe8D
	TkwwCTFDjmj0Pn6QJSlu3K2kncmrsx6uwp1WeuQvMPp2qZc4AYV65Vuf2wjYt18UcWL4Mx
	4sXFVrJv3f8JxFAIn0Hiq+KbizlsYhLD6WrEPuujbhAVCrOqHP5JnmT9gcVazkC1N6r7gq
	rS01nsqf0xw43KqTUDzTkEsIryUetX8ylGfxF6ClPWbIa+KOsMuLjt1nvRYOcXKp0eLE8s
	vmX8oeCKvz3ciTAIHtrEBD/wjRDmFLVtXzAI56oKyWNIwL0wambgziuWFmUNKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, tglx@kernel.org, kees@kernel.org, 
 Mihai Sain <mihai.sain@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013094339.7285-1-mihai.sain@microchip.com>
References: <20261013094339.7285-1-mihai.sain@microchip.com>
Subject: Re: [PATCH] mtd: nand: bbt: Use pr_fmt() for consistent log
 prefixes
Message-Id: <179492538991.2259780.5651031170487195541.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:09 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 13 Oct 2026 12:43:39 +0300, Mihai Sain wrote:
> Define pr_fmt() in nand_bbt.c to automatically prepend the nand_bbt:
> prefix to log messages. Remove redundant subsystem prefixes from
> individual logging statements to avoid duplication and ensure consistent
> log formatting across the NAND bad block table implementation.
> No functional changes intended.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: bbt: Use pr_fmt() for consistent log prefixes
      commit: 178a317fc28509d7360419629a1f043a23c888a1

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


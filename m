Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC769501F4E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543516; cv=none; b=fSCiAntugt6/1mPf2siFjT5SBwzpKBlYuN2etlPf5TZKjt4xiA9efammqdgb3pzlUEPMd4LzMAYc1hPzCR/czkBNrihsasXfh6SiEbg7A7kV+nDs0sjEdKPtxa9HxSv/uArEoiLVUOdD5OlWkANBqORlhxwsh2Hnx3wfJMxXUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543516; c=relaxed/simple;
	bh=lifHjZN1aqDQfmeVrNKMXvbGZahlOK3Xw/10LCY1w6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dZ+PaFEQUeCdrfJCDuEAXxEl1sq8f+pJN7YDe3dVki19VyagxYP8X/+p3D15MqxbXyNZ5hISDl6wDaBvfoRBc+uXkHYp4D6fyjZXi05ZUIk4wwqdwdAHf53JBhDV2pi1ViuN4doK9v5yyjQkV04Qs889bPgGzCB/+k26ZU/VWZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jh5kpaIx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jh5kpaIx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 655F91A19BC;
	Fri,  4 Sep 2026 17:38:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 314736057F;
	Fri,  4 Sep 2026 17:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E99C11C78767;
	Fri,  4 Sep 2026 19:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hndf6CwZf6nS1IlGj0wnHD6ulaeGCFM5KFckNuUCVuw=;
	b=jh5kpaIx11p1NK1l7kdsvZdSCcrxYsimt3irEFP/sAH1V1nf0V7i+f2ZRUXJEt+5llgIPT
	UKbQViDw0uDYHo6DJPtH8N8YTZ0e7HJvN6gQEOSikM26E8UsN40dVnw6ENjLbTfvc7t/G1
	AP1/3BzGthp1IWp1nTfOIWNrtXfVKxO8itxHoHPaSA1mURvZJHCB0G3WcQDCT7GXMupVdl
	hp+4739LkCYx4SYW5oYQzQUVwPl83h+OlCRJVM5VCEv37rC63pY+0sQtHHrO+BwGi45A3g
	nGDsRc4Apl6gq9tboDQuQoH+dC6bpN8Tg+AO0kYwtiskVQMfUGs+C0Br9KVBvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mehmet Fide <mehmet.fide@screeningeagle.com>
In-Reply-To: <20260901073907.2443698-1-mehmet.fide@gmail.com>
References: <20260901073907.2443698-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH v3 0/2] mtd: rawnand: vf610_nfc: fix reads on chips
 with more than 64 bytes of OOB
Message-Id: <178854351111.1467647.6175697246102601569.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 01 Sep 2026 09:39:05 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The driver only implements the 64-byte OOB format the controller
> transfers, so chips with a larger OOB (the Colibri VF61's MX30LF4G28AC
> has 112 bytes) stopped working when nanddev_init() began restoring
> mtd->oobsize after ->attach_chip(): the parity moved and every
> ECC-protected read failed, including the BBT and everything UBI needs.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
      commit: 1400e88023f4551032df6a3397a376dcdf67f3d4
[2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
      commit: 8d40b1261e2c967173b88c2f5d1c97cfeed1a2e5

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


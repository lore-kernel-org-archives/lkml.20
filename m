Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474420E030
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163643; cv=none; b=O8VtP0m7JOVYhFe+2oSUo4ls8MY4utl46MrRrTt7hV+uhpYaVxzvMHA8aYLPjE0zvxqayrlkt+wlLUtFX5gxyuh28j1nVPxseh5pnWvDYJp27l6a80xegNQIs/JuX69hogcN0vEHP2i26J99kON95hpIFiSjbTx1toiulcmook4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163643; c=relaxed/simple;
	bh=CX1WdLvxKwHuhwVifTZGUobLmn/2NrYDlUWYb3YMFuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a/nG0C5S14e3bNB+nfxuI6tCGO1arUdI3Wq2ZKIi2wmcEyg/x9XibWIA9dV2pTBxYkt2hgpRuBjXNBjzxr3EMHsiuIa6xwzgFumFCADR64P3OLpZc93EHVs7bicLfCtSukrd15E+4FlMou9O+L75UgYp2p5ESFPgP5BQsnrmXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c8CkxFxb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c8CkxFxb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7407D1A18E7;
	Mon, 31 Aug 2026 08:07:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3ED58601E1;
	Mon, 31 Aug 2026 08:07:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8737711C783B9;
	Mon, 31 Aug 2026 10:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788163638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CX1WdLvxKwHuhwVifTZGUobLmn/2NrYDlUWYb3YMFuQ=;
	b=c8CkxFxbt7rff3WTpvh333rN+gn5h3MeU2JGxbvWFESup7CI4/vmx+SuPVbI9Oh07JFwk1
	YDD/UFPG2IH3jdQI/Of+2uhRtSp2RhJOxGYcwgYu/AfSCr/hAoS4taJKArKYpmxvgfe8/1
	If6HB9iFDnHKLy2BKVSVq5px1peNlcJbScOh57zPjDiPc/NpNxiBunEkxWNNPtM4Y0GWNP
	os3WTcne/vUoYW6+o3IpoC2pISR6kqjKco0T/eTJGTyHo59cwufnwBFRZcTO9wgyqwAb+j
	xpr4+7kqyRsZdq2Hd6ObMo2RaJQ4BADWeyqbREwC0XQMUzTAGaGJs3FDhcwXyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with
 more than 64 bytes of OOB
In-Reply-To: <20260828085337.3916199-1-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Fri, 28 Aug 2026 10:53:35 +0200")
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 10:07:17 +0200
Message-ID: <87pkyybtmy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 28/08/2026 at 10:53:35 +02, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Sashiko says:

> New issues:
> - [High] Kernel heap memory is leaked to userspace during out-of-band
> (OOB) reads when the NAND chip's OOB size is larger than 64 bytes.

Probably right, to be checked.

> - [Medium] Integer underflows occur in OOB layout functions when the
> flash chip's spare size is smaller than the required ECC bytes + 2,
> leading to an inflated `mtd->oobavail` and potential heap buffer
> overflow.

Cannot happen.

> Pre-existing issues:
> - [High] `vf610_nfc_write_page()` completely ignores the `oob_required`
> parameter and fails to copy the caller's OOB data into the controller's
> SRAM, leading to stale data written to the flash.

Probably true.

Cheers,
Miqu=C3=A8l

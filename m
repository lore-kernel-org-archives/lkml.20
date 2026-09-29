Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EDD3A4F30
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670200; cv=none; b=mtrgNeoPKx1VLqwGSF1bVbi1vxof2JePi2APi67RF6yk1ZUv6p+/ZlBdk71jnEy5OJ6OL8AAdNHwKVKLyb8jc3zM2UXbKmrwPdfek+8FIwMQiyHF+0mLnIa9kD4DLwNYa3sYOtAt7l3c7Os93MExnEcJ6Ue0BFSZIhkaZw7bCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670200; c=relaxed/simple;
	bh=1y9Fke8rC9V8N/NzK5xLdB7SpFDtZwdMXiFJX4Q4qKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gaTTEMAdNC+sFmAxtyq+3ieHcBg6dtmZKAftfNgNvMBy0ZY3wgsnVnaBUo6TVxG9m3lY+iKkKB/CM6Ra4lcFhqwVp1typxQjr4dbwzWYiglKNPgtoXlwK+w/5eo6tHdfj4UQscfftWcEUsvncfNjW/SfR7+9u+4+8ynrNbPEDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2agg/1bA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2agg/1bA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CF1E1A0FE0;
	Tue, 29 Sep 2026 08:23:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 430D0601BD;
	Tue, 29 Sep 2026 08:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB555103297A6;
	Tue, 29 Sep 2026 10:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790670194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BZho5NU2J1k/6TkVIQ7kSNkpmYeTDm7thl3IqkMW6R4=;
	b=2agg/1bAAnLOjBulIJEP+QXGD+D9LPaNS3t8wqnOKJ/XDLim/A5G+6ux4a+Mj2aygjkwAw
	4TtKXZJh+jN3sx0z0MgTHuOm8cc8/Fps1ye3uu97kJM1AMyjB0r4xCKdjXZHwlWmE+1Fjd
	AkBvge2Okp+fbkE09tuZJsFewDeoC5jTUAvadEfGUwO55FpmDwgH1hhtnCSkeHyOrnczL5
	98C11OOu2XPY3YUaQD+yOK2wYMmSQet6aGMf7tJ6cltLkraTFgajbPUZlwPPDQJPe/eE6E
	7G7diBC+lIsa5pxhrPMPL9bzOiCJ0i921wi3lmAkQmWhltQpfdo4sIFEffB+GA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@oss.nxp.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  michael@walle.cc,  Haibo Chen
 <haibo.chen@nxp.com>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
In-Reply-To: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com> (haibo chen's
	message of "Tue, 29 Sep 2026 14:53:07 +0800")
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 10:23:08 +0200
Message-ID: <87zex05uvn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35). In
> 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_type, but
> the resulting command is not a valid SR2 read for these flashes, which
> access their status/config registers through a vendor-specific indirect
> register space. Since spi_nor_cache_sr_lock_bits() now reads SR2 during
> init, i.e. after the switch to Octal DTR, the extended RDCR gets no data
> back and the read times out (on i.MX FlexSPI: -ETIMEDOUT and a controller
> WARN() during probe with Micron MT35xU and Macronix octal parts).
>
> Clear read_sr2 when the switch to Octal DTR actually succeeds, so the SR2
> read is skipped (a cleared opcode already means "unsupported"). Doing it
> in spi_nor_set_octal_dtr() keys off the real runtime protocol: a flash
> that advertises Octal DTR but runs in (x)STR because the host lacks
> support keeps its usable RDCR.
>
> Assisted-by: LLM
> Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status sup=
port")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> Changes in v2:
> - Rework the fix following review: instead of guarding the read at runtime
>   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at =
the
>   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).

I don't get that choice. Why switching when Octal DTR succeeds only? SR2
is either supported or not supported, I don't think it is anyway
different when entering octal DTR mode, is it? So I would expect SR2 to
be cleared earlier than that, once we know the chip is octal DTR
capable. And this must be early enough so that manufacturer drivers can
still set their own value.

I am wondering whether we should simply drop sr2 opcode in the QER SFDP
parsing entirely for octal DTR devices (Michael?).


> - Key the clear off the real runtime protocol so a flash that advertises
>   Octal DTR but runs in (x)STR (host without 8D support) keeps its
>   RDCR.

Are you sure this is a valid case?

Thanks,
Miqu=C3=A8l

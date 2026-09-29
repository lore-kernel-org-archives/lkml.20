Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61422357CF1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690583; cv=none; b=N7P6xMgH35Fgyw+nik4OL+30hvBwohGybQXV90enQ3IPn2FcOpqVChB+Xr/Ax9ivLn6g8mImxfbScDlDOB7Hb83B82vGefzrLrloMtMxh8dlUJWRHZd8ZdHIuFiPncjDqTraK5UqOMgBDA46BcDi0EfU3QVvMTF6Owupign26ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690583; c=relaxed/simple;
	bh=vEYJcnRQLuaY0mdAFhDvvDJRWBZW8fUyEinWMmWRoJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=TDpKzn1DALPitJDlal3qYPJnqhRbkGk9Y9G1S6ELvt2cKHXNN1tINOTjxzZAzjynAr6pbT96kUrccHaKYo/CXo6Hwqivz1OgeXDZ+NwfCl8X/CYFnt3e0KVZDqyoPrMpPMHWlcj3hhoOgbeb6rXxBWr7Rx0TMXIWj7HvdJDNlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=walle.cc; spf=pass smtp.mailfrom=walle.cc; dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b=Ipi6+qnJ; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=walle.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b="Ipi6+qnJ"
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E7169325;
	Tue, 29 Sep 2026 16:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1790690577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEyrhbB9+Ho+MuiqTam9bzcD6FBweD5Zjw6hJkXtby0=;
	b=Ipi6+qnJA4bwFtnIR3FEYB8ZGw2A5xMV6tzQlDPqh7Goueya5nRdqhhxIKEc1GoAhHaU3D
	jx4WRrX9vjhadSgZxTxxb96KStYeewuP10nsweOUIFjPpamWylXjiGaF7DNUvi+HmUvXFS
	XhZgPT8nFijnzzJKm9IyVDevmNaLFGLAthLjOH+1EIJFYYoU5cKvB/JExF6F1NsMYZSfdI
	zI4Pfm7Qr1myVCHNAVyBB/37UCI7mHggmlYuwI5AQGEErItTSRvPwyCdOTfwFnNWD5Y0xO
	Pr8oUij6e3nJMPV+9eIMOughm1xVkAe3Ew+yzXmAUaG2tWslSAjJma5TdIPGeg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:02:56 +0200
Message-Id: <DLRUTYCAPJW7.3KVEC5YRYF0HZ@walle.cc>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, <haibo.chen@oss.nxp.com>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle"
 <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Haibo Chen" <haibo.chen@nxp.com>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.20.0
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
 <87zex05uvn.fsf@bootlin.com>
In-Reply-To: <87zex05uvn.fsf@bootlin.com>

On Tue Sep 29, 2026 at 10:23 AM CEST, Miquel Raynal wrote:
> On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:
>
>> From: Haibo Chen <haibo.chen@nxp.com>
>>
>> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35). In
>> 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_type, but
>> the resulting command is not a valid SR2 read for these flashes, which
>> access their status/config registers through a vendor-specific indirect
>> register space. Since spi_nor_cache_sr_lock_bits() now reads SR2 during
>> init, i.e. after the switch to Octal DTR, the extended RDCR gets no data
>> back and the read times out (on i.MX FlexSPI: -ETIMEDOUT and a controlle=
r
>> WARN() during probe with Micron MT35xU and Macronix octal parts).
>>
>> Clear read_sr2 when the switch to Octal DTR actually succeeds, so the SR=
2
>> read is skipped (a cleared opcode already means "unsupported"). Doing it
>> in spi_nor_set_octal_dtr() keys off the real runtime protocol: a flash
>> that advertises Octal DTR but runs in (x)STR because the host lacks
>> support keeps its usable RDCR.
>>
>> Assisted-by: LLM
>> Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
>> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status su=
pport")
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> ---
>> Changes in v2:
>> - Rework the fix following review: instead of guarding the read at runti=
me
>>   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at=
 the
>>   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
>
> I don't get that choice. Why switching when Octal DTR succeeds only? SR2
> is either supported or not supported, I don't think it is anyway
> different when entering octal DTR mode, is it? So I would expect SR2 to
> be cleared earlier than that, once we know the chip is octal DTR
> capable. And this must be early enough so that manufacturer drivers can
> still set their own value.
>
> I am wondering whether we should simply drop sr2 opcode in the QER SFDP
> parsing entirely for octal DTR devices (Michael?).

This should probably be put into spi_nor_parse_profile1() and check
if command 15h (read configuration register according to JESD251D)
is supported or not. Would that work, Haibo Chen?

Honestly, I haven't done much with these high density NOR flashes,
so my knowledge is rather sparse. I've just skimmed over the JEDEC
docs.

-michael

>> - Key the clear off the real runtime protocol so a flash that advertises
>>   Octal DTR but runs in (x)STR (host without 8D support) keeps its
>>   RDCR.
>
> Are you sure this is a valid case?

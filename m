Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3214D37B7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829278; cv=none; b=jJKiZL5OYm2MB88BBNCrmbUS9OuuoXLw6wzTj/K1PmYdTsDgW+jA4yzuWfUq3VtIpjMTws6M/7TrKrhvkvFcZn3j/Wl10OAqvrnlkNqmp5odZePYv5LF0BCOWkBR2gMoIYY4xahZ6g9TJPKbQYx9ZZeXV0O3XP2Tj51mtYm7bgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829278; c=relaxed/simple;
	bh=9vv0wvrb8HHiXNkhOmWDxWTtw7+V33IyY4H7+aICR7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ytl8Swr3MkFzQst5YEjzh/4Hp8qzS6g07PnmjBGAXZGmvFwTsg1CqXrayTMFoNRcBmn+b6JuvRS89qdNp8+wK9DlNM73VMSFT90ckCIJHV5bU/GN98kIDP5ysJlUbnyMC9OuNE6oIBNL4uDsOMun4bCyAWI78OW3vepNZzu/lVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lk2NL9rF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lk2NL9rF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 790574E411FF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46A26601A6;
	Mon, 12 Oct 2026 18:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E6B611D70C57;
	Mon, 12 Oct 2026 20:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4S+StvxCrWot/Jq/df8EjklJA6CqyPLDthyRqelFSZM=;
	b=lk2NL9rFR8uP+JAGp/LrU05emFPH/y0gHIoThjy8l+VkNQwDIgnyGk/AK0GDmXgNmqc0T+
	cTfmtb9PvmY7jT5y3FUEeUbGuuuRIjM6nV78bpRfaVZNRW2208EnndB7YRQ1C2pCQ7TFWr
	in/mI5e5LGphEyur+pbzNGPKDAm0FWlC1Bd7jFHJfooBT+8Gd20pI8N/hWduCrGLcXmqP5
	ZMKahT6m6L9vhJhdn6EPPG9eib05skxecUPH5n5opoxea0/uleVpPpyHHhHvvRX8L8XYKc
	CQDzREfFB5n75N8DlGzUM0Zdb3qocvP/p4qpNhHHzYSeHDphXy3PUhyiwULVow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261009060610.3162795-1-vulab@iscas.ac.cn>
References: <20261009060610.3162795-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: pl353: fix clk reference leak in
 pl35x_nfc_setup_interface()
Message-Id: <179182927105.590599.6369377417023484373.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:11 +0200
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

On Fri, 09 Oct 2026 14:06:10 +0800, Haotian Zhang wrote:
> pl35x_nfc_setup_interface() obtains a reference to the SMC "memclk" with
> of_clk_get_by_name() and only uses it to read the clock rate. The
> reference is never released: the function has many early return paths
> and no clk_put() call anywhere, so the clock reference is leaked.
> 
> The hook is invoked repeatedly by the NAND core (nand_reset(),
> nand_setup_interface() and the NAND_DATA_IFACE_CHECK_ONLY mode probing
> loops), so the reference count keeps growing.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: pl353: fix clk reference leak in pl35x_nfc_setup_interface()
      commit: 1ce45f0e74d60e8279ed380c97047e6c351aee1b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


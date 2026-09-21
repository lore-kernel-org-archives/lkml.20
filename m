Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF873563E8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997530; cv=none; b=r5RncMSxA/MT9iCEno6u/0n6mxHDz+AIFxBrPc4RpYBjopxuKsWTQfkcO6JFdwhSQoY2BTxegsUsBBRX7S0ZdUBTiQEQn2POYc3ep0fUA98Yy7svZIOPyzacv1Gk6uJAaueZx9sdKUCf1UoHIKo6c2MHuDeRPxTWUTTkhn3XXzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997530; c=relaxed/simple;
	bh=kzl/AiBL6Hih5LTlvddhpwZH/7ehdetI5DDxOehsz+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fdBOX+Z0tuHED0bB0wDfA0tTS6YFIaT7kZeCKKt1LgvI8mvFHkQzZ5ZbJvqx4IY+rZQ5vBtCm3mZiTkdLMP6iu0UTl2eKc6WsxXXewUHxabfJRbnYEg1U6cCJP4b/acYMewCj/irympNBtIJmotwFskLlYCnuqB1Z+0q6VsoDxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWoHylf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWoHylf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B751F0089A;
	Mon, 21 Sep 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789997529;
	bh=2kT1ySt9JkJYQBPTTE0pBorw4nyIBwWt51Dmu6nau8w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XWoHylf7176FH+h0QPLJfEe71DQ21tZQ+MJuPSUFPzRvBI/aqO3MCOsiVuCr7dcVF
	 qmlTwpHNPhJ5lEhEDW95eIbqgWfmzDbtYzhZRRvHV9FgXcbLKXxqHHIpsxwZIusSAJ
	 FDSkmusiD6dSuL/peU361teDsi+yEJTqco0yUVtS/cEdDqeaUsWI3xeyFe4v1ygPG+
	 XFduhyY5rkYivlGHeiz16g0lGaaX4B3eJ0h+/Rw3yHY3RVfRVGZTeFh8I+IvMHkEoy
	 GIU6nTZzQY5M+vW+ERZHj2IuHth0jlyPHT7aERc3J0HCvSCCkH7/k74ghTI0I9A+Vd
	 9XuJobzroT35g==
From: Michael Walle <mwalle@kernel.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
Subject: Re: (subset) [PATCH v2 0/2] mtd: spi-nor: issi: add support for
 the IS25WX01G octal flash
Message-Id: <178999752766.3604280.10374097557984380720.b4-ty@b4>
Date: Mon, 21 Sep 2026 15:32:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0


On Mon, 14 Sep 2026 14:42:00 +0100, Nuno Sá wrote:
> This series adds support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal
> NOR flash.
> 
> The part is fully described by SFDP, so patch 2 only needs the flash ID
> plus a small post_bfpt fixup:
> 
>  - The flash has no Status Register 2 and does not implement the 35h Read
>    Configuration Register command, so the core's default assumption of a
>    16-bit Write Status command does not hold and SNOR_F_HAS_16BIT_SR has
>    to be cleared.
> 
> [...]

Applied, thanks!

[1/2] mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 page programs from 4BAIT
      commit: 68d7115d77a873c28d8c7d2f239c3d9ca83bf39f

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


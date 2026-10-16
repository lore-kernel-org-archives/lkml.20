Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC226C385
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132891; cv=none; b=Fa0RiN+0m05G8/esGxbMLGeCTRRc5hR1qj1Yzt4aD93rof4xsoM6Gp+3gHOnugt3UIU+dc72uPr4BOTUYolrIzHxV8HDGj6BVALQHjojnaDdqNaHZq6yW8NBBVOtBRj0XDAYclC39gQ25xxZ4BEzY6AjmhE85ttgesmgyhXUug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132891; c=relaxed/simple;
	bh=XhC+C7P1ZPZkzjWU2j2OrhMndNfDybVokD5ivA/sx9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ivk7cLaDGXgoz+jO25esh+OAuIxIBtOnno4PDLnQhGMxPFckCzeAd/WvZ5nBnl+294Q5js518oBs0Q2ftFk1FneWSfxv0azFknBd58zQGLERyCFi6zJTw3VsSmamQJP6GAY5k9nzRUEibLwuvO6Yxgnd7iKSQOTPG1e+blTgE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di2K7ZEk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di2K7ZEk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5AE1F000C4;
	Fri, 16 Oct 2026 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792132890;
	bh=VdouQ0ydHfSbTZsgO+bOmYzH+PNr65ZVU+s/MbMiUME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Di2K7ZEkf7s+7Q+o8I6cxtw3iGM3sFyhOI/i69++P58ngosuyS+0BwMLP8lIxi3lM
	 4UQnU36cdDnXs0O9uL3xoUmEstXF3G9oh5kGkKCFeMCzJw4FSVzuPjwJQtvKYr9PcR
	 MgfVNyKecl2xEwniZB6ilBPbidVPflHM/ugzX30rFWCPPEzqS+dUT3uUb2asw8rcyG
	 TTj7bu7pTeML+B6LCJkblz/Xw8axDz543wrat7Wv8hkNvGcUMVHS+VgIgAiezFvcPH
	 4ggZF4tNoOS+wcbVuy2dcBtlC+BP8h5UxzkNn2xHu4PomDXgu2aGvzCkvfpLSXpgx4
	 Rpr8/5Sf2ycdQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20261015084219.887963-1-mwalle@kernel.org>
References: <20261015084219.887963-1-mwalle@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: fix missing kernel-doc
Message-Id: <179213288823.1140554.3724392142186032224.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:41:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Thu, 15 Oct 2026 10:42:14 +0200, Michael Walle wrote:
> Commit 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into
> sfdp") added the kernel-doc but missed one description for bfpt. Fix it.
> 
> While at it, also add documentation for the return value.

Applied, thanks!

[1/1] mtd: spi-nor: sfdp: fix missing kernel-doc
      commit: 7dc9a4e7b9fcee871d021765c90943c4bab91474

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


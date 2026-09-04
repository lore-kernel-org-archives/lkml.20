Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207D4A8FF7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529240; cv=none; b=rI1VJb4RevB10rTeFl37QnVB/ji69qA1ZzLuDwpsVPaDJl1WNKX5zy8aLclN52o48JndDmzbTiekSA56oj0QGwMQCBj9Bp2yZTuGUKVzSgET5dPn0AcuNYIsKu5U4fI41hxA/u4W8lA0PdBGsZrqOD4sJDhIPafovTIaKURN1EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529240; c=relaxed/simple;
	bh=PTqqvSeFhON+Jt8RgtMNEFzjpFUeqXY2vM6JFpcRd94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o2NbssY2iiLXFlCpINVscl/Ps8277mF47AKsoe2Admnpo684Plqf3Psklfe3Em4JWB3dg2Nl+9mGF3anS2SpxWjEP9KSH1l4OYVfedU1XMQoU5sQoTJLK3owOJQ9Q3Rpp8LjhvnptFTrtugU5p/HwkeYe2bRk0G4xJUjST7i898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb6dn99S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb6dn99S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7431F00A3F;
	Fri,  4 Sep 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529239;
	bh=W3ARUUquBVjLU+1vMyfZoZfrmendLIctkuhpFI/Kg7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jb6dn99SHoZzyXuXQRPUgv51JwOKuRj63FzJ9QsNmwpWPZW59VzrQe5sLB5nW1ynl
	 52dTvtZco7ZMyjnJU9qFvzPwEbNainZpIq1STMEungRbCRJhe+QBtsGPDtpu0HfmGs
	 EeH69FrOq2ZGihfizt8SO766Wow/ZPu6WODJQ+4vzdF9dFPQb+LHNRAXFtpNvrW195
	 /RrHRwq8zLHsh/UMdFzvHuRPjZM45Ul4+Uk//1BeTneS0yrzhI2epLmcUs/eundO91
	 d4rgJnOHGIbufQqzttFBt+0TOhlOMbhZhzByelI0+AIHUE2skIgikiE2s3Zd+E8j1s
	 L0sFuzThX/NMQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Takino <stayer.opt1f@icloud.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260811064512.42520-1-mwalle@kernel.org>
References: <20260811064512.42520-1-mwalle@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: xmc: add locking to XM25QH128A
Message-Id: <178852923736.3340372.17741813626485935143.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 11 Aug 2026 08:44:44 +0200, Michael Walle wrote:
> Add support for locking to the XM25QH128A part.

Applied, thanks!

[1/1] mtd: spi-nor: xmc: add locking to XM25QH128A
      commit: 3c2464c70284eb5443a18ea7ee2f815a06d91a5b

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


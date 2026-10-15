Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA23B0592
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034207; cv=none; b=JMIKLMJMCro/c3dJvw68Gw4XdIEakCHOQQx4KxNnERJn41i8ojgBNDT0OlqpcTcNr33I59B5iDjCweerYt7UF2P9aocWotuWGmb+NFuqXpQwWuJHkLv7iT33LnOUsDJ7TzVo/nguClAlCvdtuUY+pN/erqx7DYiYB441g8dN/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034207; c=relaxed/simple;
	bh=T09o1sjKQrE8o0DmcmNmPyES6Ci4mQ3bVd4GcfAdC4w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QmBhVCX6fPAEuHjoL2s9K4iHzyC9FtYA4IO0jaFo+eWf4QG4cpaV7DehU1COw8IMUXhMseGLCpHMyPCA73TzJq4chEdLEPN2YLx6ZeCw6SePAx6kgodmdmN3DcPZwr6VVEFDmwgNgcyDoG2/wy3XA8F6yNfcisjkdL8ntyUFS2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHNK251y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHNK251y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E661F000C4;
	Thu, 15 Oct 2026 03:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034206;
	bh=T09o1sjKQrE8o0DmcmNmPyES6Ci4mQ3bVd4GcfAdC4w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=ZHNK251yUU4ayb5U+eINX6ogvnbGqrCyZAb9mq2bbZrgUDfxqa2qkupvDm5KChdzr
	 II+3v0VyGsYVzWztycmnPEJdis6q4mbJDRddhrows9R/FJYyUuVeAvk6cvlMX2nyb4
	 yBzUDX4NArJtwcfr9zHJWaxl40s7cd1M5YQFxzSh3HjBDlN9EZviN7uxkjcbZoziSF
	 dLaNGgHjfmJto7A2ssfG2dcsciB+7FA/C8BQMQRKcTOiGdURjdAGlytufzAKufH6t5
	 wmQgxogxCa4rD/cF2P0pMnIFtAqyXZ1fh7QtQTcc2+v2yrBA+g9gTcFPRRSvtg76Fu
	 E0sjdaRlNn8Uw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260817-b4-maintainers-add-spmi-pmic-arb-entry-v2-1-14659fcc58a3@oss.qualcomm.com>
References: <20260817-b4-maintainers-add-spmi-pmic-arb-entry-v2-1-14659fcc58a3@oss.qualcomm.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add Qualcomm SPMI controller entry
From: Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>, linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 20:02:37 -0700
Message-ID: <179203335728.5720.1355902119091037425@localhost.localdomain>
User-Agent: alot/0.12

Quoting Abel Vesa (2026-08-17 12:26:45)
> Add an entry for the Qualcomm SPMI controller (PMIC Arbiter) driver and
> its device tree bindings.
>=20
> List Abel Vesa and David Collins as maintainers.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Applied to spmi-next

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000360;
	b=AO76bmPDfTB/jj01ob+m6pWphk5dfn+nTMF1kgiEQjisAeVVFvLD2frXfSuOO5+/Kzyo
	 dqyg0sEmb4XqbN7BEPbDZzcw9lz7Odv6741nKo+cbJNic+AeV9e3iGKfcR5wGzzAcf5i8
	 e92o3CDI52osT7VzF98gBPVLeJ5QAsT0rD0aofUPTT971ONAg4LMcVVRQVz09WSEYlWsl
	 Ucf6yrjciv9QOc4lGcMy8e8x6VZ558VsbNwUr2RLDkTjDULF7vMrgF8KiyojBmrTMIPfm
	 MiOqyqPBZDdHkecW4ABtlJB/uX5wQlHPRxY4ef7ROHI2qTDgUcKM+zkuLf69IaqHnJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000360;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Djpa2kY/daWP4dKtfkZD0foLnhimThR+yxeYYViY4vo=;
	b=fA6I3RH6qPPwL6h71o1c4xJJdhcu6Qx4O2MymsUw01v1ghg1a0Xtsa9EB0IEP1TlkXus
	 KUjC5+Pk/lTf/lJdj5TeBYGMmLlw2NSs8xpcoeH5Mnjaif3hPTWv3CdNDjEJdHe6CJyTl
	 D3SjWleYXnXzhSMNt6W+n+aJ85Jb0eVv+TwU0jflyWatDlWxgvsBMCYmCgYONnLCYyo/U
	 2j9VtTjVFUjCkDstdCyEjhH03uj68d/V49UG6cuSNuzT8COm/kDBfmZUAwOqMgjL3eYnY
	 zv62uYOG2wpuDTslb3r/cTZIp872u00AhpfOI61JEP4AO2Oq8DchUQ9/nn3Fit0eY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Oj0Gu7Xt;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Oj0Gu7Xt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=Djpa2kY/daWP4dKtfkZD0foLnhimThR+yxeYYViY4vo=; t=1793000358; x=1794209958; 
	b=Oj0Gu7XtWkwsOOm6bfaMKOfY7ARQxogmLDEhzxS9nh+TgKh1gMxvuscRQBGzJDdfVhxz3khcCic
	QKfFXTeLIzep5oMn2nNd6sJMSsCbelP90THDea2FkfMrKyEhxEVTbaq2Bd+N1UcUu5OC863k0S4pf
	PMGMf1hzaKzvXc0K8/Zp+MZHM1P6m/hwTUhIeKSzzi8sxoj3g3JaExZnCMYp35ECzv1qF3NZ/IgFd
	C3X24nJYwi/f7ZNT4I/yZE7QZIa8kc3dd/YnDYsmbttl0mcdZCkcUty/QIfr7vtZP15rmnl0lf14o
	JaRREbcrhuC4abxcKb8ylTWWZFumZqTWySEg==;
Date: Mon, 26 Oct 2026 08:39:10 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] regulator: sy7636a: fix the chip name
Message-ID: <20261026083910.66c7dcce@kemnade.info>
In-Reply-To: <20261026003918.155321-3-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-3-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:13 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The driver header and the Kconfig help call the chip SY3686A.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  drivers/regulator/Kconfig             | 2 +-
>  drivers/regulator/sy7636a-regulator.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index be6b72daa76f..88ba2770e378 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1623,7 +1623,7 @@ config REGULATOR_SY7636A
>  	tristate "Silergy SY7636A voltage regulator"
>  	depends on MFD_SY7636A
>  	help
> -	  This driver supports Silergy SY3686A voltage regulator.
> +	  This driver supports Silergy SY7636A voltage regulator.
>  
>  config REGULATOR_SY8106A
>  	tristate "Silergy SY8106A regulator"
> diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
> index c44c445ea139..015227cb113e 100644
> --- a/drivers/regulator/sy7636a-regulator.c
> +++ b/drivers/regulator/sy7636a-regulator.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  //
> -// Functions to access SY3686A power management chip voltages
> +// Functions to access SY7636A power management chip voltages
>  //
>  // Copyright (C) 2019 reMarkable AS - http://www.remarkable.com/
>  //


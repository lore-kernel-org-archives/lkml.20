Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207796;
	b=J/GsdFb3pjcT99n07uGw4jOe5F67j9o6Qkbp/565Pm1wt0Dc1SQmZhBlPiD0KFmwTQQA
	 yjW3Cr8pn+3K3oMl2Z93jqnaE7nh89R7cABI8JG9lYNVW17SRz/mV2fMvNuMnVcGvXl2e
	 HWzV60mggXhz299cQSpzrE3MnUBsD62fSZuWH0dh48ynOlEZtq9yr8tnHtU9Yi756BI7W
	 uA/etk3Wa+eRWMARZlBl83OD7yQkMAD4Ki+r82AjhqVqMU5NokAFAWptTwpzTIdB3GBLb
	 ytaeKH6Jr5htbHf+Q6NTY3A6AtyBL/ecDFS1j8hVKA6i+w8A7TH0/DaE4TS9gKNFFog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207796;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=n6uuG2uPB07i0EMDMp6389WOiI/04+FhVXHCP2g9r7o=;
	b=GJHiOxL1TBq0FB10MtfziB1/VIUBBfoKZ5G1A/7L0+cibhwlpU8apQ2L0+6uF5qGT6Ck
	 8B/PcczL1ivqzbRBSSdQIXCyNCf2u2LtojFeuSYfWXR1dDdkiKlOS+auwzSVDErocRzXb
	 38oLsmQIyK2mG2/cx26KnUSlHoH43sTtpfWnalCMrKoU59ZrlVpzO9bY1Rda6ujXkJHZc
	 AZKZoF2f1Ko1VwnKDuKBB5crwYeyWykucLdHLnYpYkVEXhdGht3NoVTUADEAjw8IpvbSg
	 SGUIpLmPNalb51Y0bsaJq3G5de3w9GEWJzUexkIjKDof6c1L5yorvED2OeNSZafliLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="FUI09/nk";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A87606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=FUI09/nk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n6uu
	G2uPB07i0EMDMp6389WOiI/04+FhVXHCP2g9r7o=; b=FUI09/nkUWlAuWPONUzm
	PBpyFxvz/uvZaoBZMiRROWtgh4kAXo/iNQpNNBHmnyoC5VOoayHkypsy9YXg8p5R
	doZHakc+1UkQUcclrwYqT4Dw7uLw1AKy/Ol4DoPqIin7IBrDx8K78ga4JkQQDJ5j
	4WpS/zSLvQD58t/WiZgnEfwnzhciwGhgfuoLUzum5a3pyYKNu16F6EgCxc12OR4M
	oO1zfTqPBzFPXG8DgNMdNwNJq2WJA/J4Obkxc2oIryygANbp8/ngx9cdlmg+B7Sj
	baY6vQ3riQZuriQDZcCMmzCODNaqzY/Dny0LEAXeuL/ZlHyB1/pnABJfMLWL5QNd
	qQ==
Received: (qmail 3132570 invoked from network); 9 Nov 2026 08:03:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 08:03:09 +0100
X-UD-Smtp-Session: l3s3148p1@qpDxjdJfkNoujntg
Date: Mon, 9 Nov 2026 08:03:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avFwLctRcnJHtINQ@ninjato>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>


> -	pm_runtime_get_sync(&priv->adev->dev);
> +	i = pm_runtime_get_sync(&priv->adev->dev);
> +	if (i)
> +		return i;

Testbots revealed a smatch warning:

drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success

I will fix it here.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311440;
	b=wZ1TmRp/yQzX2yn1WCSm2A8xBwj0ZqdkeU66ggm9KoRgcVpBDFcGT/zBSBdL48waIrHb
	 PtvwfxI6712j4xZQayqeKVXApSgjbaXzVssqDU02y0RXc5O4v0SyY5eaFMLKpLBuKKENh
	 +rslkf//RKed+DNKgevSeGkNc8mbnyfwkp+bxBUrwtTxBBz5niZ3wJ+czeKZTp2P0tQbG
	 fDbHFylcz/czVPaV2ni0mjp0UxA6HMT583xb8BwcdKL6QrNM9X3g9YAiPvr8NgJG64l0P
	 BXhW8RfHuxPJ6f4Y6Sv1xgMYjy9ZCJ9Zt9GkE1kmeedfO2J+7KNg+pKb2QP009cofNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311440;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bcbyBpfKFotUtkK3419Whkt3ZqxnZWFJhglCb1Z/icY=;
	b=h2LyNEO2ZrNXyTLoZI4Wf/kW3OSlMfBcBumdHmUyiV5N3DDPkZUd1z3wan9+WAEqLi4D
	 SdEPK5nbjBRij1ul+wJMLU1p7cyMvl9YMi2F0E6dSzlxQ1ru2Ia9EzTkm2G/gHtt/0vqn
	 9+Xbv+75DJHmXPZKstlSfVdMIh5RFt4gnSkCF72qKl9oSnIHVYmmB08PEidEI/YL9l187
	 sEjvM1w8HNVn8h06th7Lvl8RmOneQOI7selFqYNdxRg5+vaJkpdKDj7wXJXOu/ZJMWGww
	 iw7BCpjvs/DpfRQ3f182vgSTSu7Ldrxp0nC7DpWlJ8vUUdV74PuK/W3ACoupc7E78RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BNYYiQQY;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233460A2615
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8233460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BNYYiQQY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bcby
	BpfKFotUtkK3419Whkt3ZqxnZWFJhglCb1Z/icY=; b=BNYYiQQYi75l6d9KoGPk
	Xp1iXzkmcUefxSNr9uIPQ5qfsWv/8sstBqUKea2N4o7mFa6b/bUalZQeRV6b8MDm
	2cg9PQPuA+V6dOO/eEguVjRreV4ekcHRPAAiI7EX8JSz7+bkIVxxNsgJgHkK+xMo
	+RWkRICJ5lvq9XSpjDUs/nIGzRrDHpPGUotTBS3AT7SZLui+axZHnxBz7p+vv2JE
	T23rd45mgIFA4cvClo4W/vUgnYGA5iWK2GR2MPtvihTKwxrXQ+V1vq1yyGiMJRfL
	k3AT57+twO3gFf2jp4JmyXmCyEdbgdKgF0m+h2QDAWfVcZafygalp4StUlKEUJ6m
	OA==
Received: (qmail 217250 invoked from network); 10 Nov 2026 12:50:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:50:36 +0100
X-UD-Smtp-Session: l3s3148p1@vc2+r+pfBJQujnsO
Date: Tue, 10 Nov 2026 12:50:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: dev: clean up registration
Message-ID: <avMFCwqx2X6pl4hP@shikoro>
References: <20260827102043.673273-1-johan@kernel.org>
 <20260827102043.673273-4-johan@kernel.org>
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
In-Reply-To: <20260827102043.673273-4-johan@kernel.org>

On Thu, Aug 27, 2026 at 12:20:43PM +0200, Johan Hovold wrote:
> Drop the get_free_i2c_dev() and put_i2c_dev() helpers and do all setup
> and teardown directly in i2cdev_attach_adapter() and
> i2cdev_detach_adapter() for consistency and to make the logic clearer.
> 
> Note that the device list is only used at detach so the i2c-dev can be
> added after registering the class device.

Can we have the last sentence as a comment in the code, too, please?

> Signed-off-by: Johan Hovold <johan@kernel.org>

Other than that, I think this patch is an improvement. The logic is more
explicit. I didn't like 'put_i2c_dev' having a bool parameter, for
example.

So, only patch 1 needs a bigger update, it seems. Rest is looking good
to me.


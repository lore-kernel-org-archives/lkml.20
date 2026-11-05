Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868670;
	b=PO7p9c1lEcCEZw2q2xLk1Fog+kFF92PqUQoAe/rvAgOvIIaa5ZIjA251Hdaxm57ZqZE2
	 4EpQNQEc9lyrsPEGp8IukfdCrhDG34GF+VZQBzBsrBKGfYT6/JSxN06aWcRZeEqAJJ6IN
	 ctFVqC4eccjwgJGkxYmjyDvH2uY4tdJT5VxhnVYpC7FPbrtA1L5yTcl9IW38jd+wGSqGS
	 niJVMmFL3wqYo+VKRLH7jVqdZT25Y5lDntxEr/krM2fzkPf325h1ec4HBW3Sjn2Msl3d2
	 4z32hwkVkpLy4JHvtAzcuQFsLPxkYicEQWri0Fh8IJZuDvO1xvLnQoYuHFtki948XoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868670;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2Kob7YlwVM+xHHu2Uvpi+NLog2cKg/RBxEB5tTCs0Yk=;
	b=Y2hCcTdGOnvrEq/bNnGoCFW2IohaxE7biYV7RLZXOpwyxnJc7FoVPyAIO0zDckaB/hOp
	 I9bJotIlKGM/naidNiyPNDTWKt7UMzrcfbX8CpyOQcPUBBU77lpV1QN4SIwu/b7t3CdDR
	 sW1Xn6UP+cnUoFzk33XODXfiFDKShsbvzJCon3M3BDA0DruoW1Yiq5fDmu7Y5rgaTQJe9
	 hQugAEC5OhSwCQUuEhpGt7iDCLLj6EJpTtm8N/dFvUppj7com4xuz2t+u0Xgf8rcOvvyp
	 +BlCzOipgLPJZFYKM/hp5Pa/nPOpeGzmYqKmctePyTtGeIEaIezu0ey0ocWb68AMHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=JKYwwhzG;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD75606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD75606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=JKYwwhzG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=2Kob7YlwVM+xHHu2Uvpi+NLog2cKg/RBxEB5tTCs0
	Yk=; b=JKYwwhzGpO7p0wD7j5WBusl+5uPKnIQr5LW27p1RaPjWrYpSh8yCRZb6U
	+TmIjyOpHIfW9RrkNOELPIWVswKCRT5peC2xvMKYxwo7Ng5WVknGYbitD41LzJMi
	3hQVAk4Cj9+lUC0vy0uDXkrVoNRuqCefqCT+K4YKSV5DGQGau+Ol4C2c78vMRz2P
	4Ps+kCSSiHIryaR1trBC2kNtQA1NZuMqxJenGosSjaGB0o8sTiFFUo5lqVseKLR1
	7GouPftCld2vLt1XOjEDx9/vbQBG78k62eQNNlgpQJRfSUkxQ7aPfmBO0GjFlLUR
	p214tVN9oyOr/mp7dTaacE9WY10GQ==
Received: (qmail 1074718 invoked from network); 5 Nov 2026 09:51:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 09:51:07 +0100
X-UD-Smtp-Session: l3s3148p1@BjyumINf3sTAwtcC
Date: Thu, 5 Nov 2026 10:51:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <auxDe0lmVCDu_iXA@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>

On Thu, Nov 05, 2026 at 09:42:02AM +0100, Linus Walleij wrote:
> On Tue, Nov 3, 2026 at 9:30 AM Dmitry Guzman <Dmitry.Guzman@mobileye.com> wrote:
> 
> > In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
> > the controller registers are accessed without checking the return value.
> > If pm_runtime_get_sync() fails, access to the register of the device that
> > was not correctly powered on may cause a bus fault or other unpredictable
> > system behavior.
> >
> > Check the return value of pm_runtime_get_sync() and it if is not 0,
> > return the error immediately.
> >
> > Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
> (...)
> > -       pm_runtime_get_sync(&priv->adev->dev);
> > +       i = pm_runtime_get_sync(&priv->adev->dev);
> > +       if (i)
> > +               return i;
> 
> It's a bit odd to reuse the i (= iterator...) variable for this.
> I would just add an int ret or int err for this.

Yes, please.


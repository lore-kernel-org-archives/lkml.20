Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B541BD00C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753597; cv=none; b=t6wheT+3GacxZEgzEYm9tzQkxEBnQY5cxCTTJsb18OaHAC6s/GNeVmRo6MO8TdeG8Ygws8xyVSCGjqr37U0c0qVRtZ2mJGS9FB2OHDbfA6BfGuPVL0Z8X/qC/SOhCp9EIqjA1tFdwNSlET/0aiiBRsuZ2VsLf0mQnhIqceCT2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753597; c=relaxed/simple;
	bh=6yI8YxQ3EE5smPASHXbAlXTcXxM0VToSCmQLgh2IlFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IO39xVc7zmitKU+S9TRdKEm7LWdHnEEwYNe4NgXnFPQuCgbJeRsiJBjE08mPKddHExh2lIL+sBvmYKXkXJ636UJWpe8uRY4uL+uu01vrZvm6EWwyyRkcJwoiEw4lPAVzvHM23qAKHCBJODD7Xzel2CSDsmQETQvXKaUAcxcQ5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OStRDcDK; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OStRDcDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790753585; x=1791012785;
	bh=6yI8YxQ3EE5smPASHXbAlXTcXxM0VToSCmQLgh2IlFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OStRDcDKLkDdiMUJ2cgISW8z7kDUhvQxZ4+3NyWr/F/Chy1vSAM6fRKhznpZCxHFP
	 xWy7+1cEdvKj08oXISlrkDUQTw6GQW30xOCQpkIGpB87n/fUdnBlNnYfx/xzYLtvz7
	 r3UOGAj72QbB65XEzZ+LIWAauEkWkIChVWuqyDsZvDu96OEk4ENMk/a5q3M85VhSq0
	 dqW6T89Ea9RnEHsgIS7YCnsov3q4hStWDluvgHgq7JzuTA3XPKXan+I2kr862Kc3cF
	 fKKZW81tEt4WLeIFB8XIMgK5m2unk+7HG2vu441vG8jZHz7oJuGjeFUZfbz6PYomGm
	 zLMtLobjVfKoA==
Date: Wed, 30 Sep 2026 07:33:01 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260930073256.56780-1-lsa.uz@pm.me>
In-Reply-To: <aroht8klOruSDBJH@kekkonen.localdomain>
References: <20260926080242.93628-1-lsa.uz@pm.me> <aroht8klOruSDBJH@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 3434f0124be63d2236ce20d291ccc0f90970ab8e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Sorry for the slow reply.

On Mon, Sep 28, 2026 at 11:13:43AM +0300, Sakari Ailus wrote:
> Is Documentation/process/coding-assistants.rst relevant for the patch?

Yes. v4 carries the Assisted-by tag, and so will the next version of each
of my other open patches.

> Please clean up the above commit message.

Done in v4.

> > +/*
> > + * Readout direction. The mirror bit is active low, and the value ever=
y mode
> > + * table programs already has it set.
> > + */
>=20
> This only applies to horizontal flipping.

Right. In v4 the comment sits on the horizontal flip bit alone.

v4 follows this mail.

Sergey


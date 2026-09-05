Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED83262FC1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569214; cv=none; b=EjOTlHjiYrvZG8QEoFUGfUFMoPrBs/ZQuOMIJXwi2kbNJ7gPQc7sJ2CpJHkYUXpgMwBvu7H6dALyRd387EP9l7C8ayAYMDd7botbn+mgB7Tr2GyVTB+RUwRuoYbZiTGO0c1I7V+pwmrVJyvjAX+5JEwFr7tPWNEdO+IbrbI/8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569214; c=relaxed/simple;
	bh=SwCh9Ld1JOdq2P1NYMKZndipV6XqTb9tvIWRkfYlK6g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QdHEpQqBTnft+ZJ1ROBPIhkply0hMP0mmdrvyrveq+OBx2F9xy0lCgA8Z5aQiTht+ege1KtNy5nRkFST7DsK3Sbi5sUMxsEJOLNjiIDxmAhjLetwV1AiU8e2cE2kUR4NizzQNdVVDxcf5/RE2Df0OhZZYackEZD6wXceej037jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=J96grHf2; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="J96grHf2"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 46CE9C2AEE;
	Sat,  5 Sep 2026 03:46:41 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 46CE9C2AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788569202;
	bh=SwCh9Ld1JOdq2P1NYMKZndipV6XqTb9tvIWRkfYlK6g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J96grHf2SOphrttK7FzcYLqiA882B2VNzMTii/hBrr345ASQqtHBDMTUkvNbT0aUA
	 4yDthPWWcLTeGrku7JDU0pwaDBud41inkc+RmsRtNv1pRD15x0h+q6Gdf53gTzFp65
	 9UCizr98DRVRJO9s6gaxjpiCKTvTiQLk4L2MCqOYHIyT7B7cCxhsRtQ3RknxubG2j8
	 BcEUtlmnCW9aS0py3srFk6Jyy2V4/3PhaOGzuhpE0vS+vo58SweQpT7lgP7ttuJeLU
	 wCqFvdPNK8iQepfVzwjkdmFv9MV9X4V1clIWRO1fugv6NfcpsjocyLDsKrHC5fUTsK
	 lWwk0eHh3uHDQ==
Message-ID: <bca904b69fbdb2a0bfa7afb1e3fd055184fa87b5.camel@rendec.net>
Subject: Re: Interrupt chip driver maintainence
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <pjw@kernel.org>
Date: Fri, 04 Sep 2026 20:46:38 -0400
In-Reply-To: <871pb9841j.ffs@fw13>
References: <871pb9841j.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-04 at 16:49 +0200, Thomas Gleixner wrote:
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
>=20
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.
>=20
> I've just marked about 20 patches and patch series obsolete due to zero
> feedback from the relevant architecture/SoC people who were on Cc.
>=20
> And I'm going to do that from now on very consequently. If the
> architecture, SoC experts can't be bothered to look after their stuff,
> then don't expect me to suck all of this crap up and then deal with the
> complaints when it breaks.
>=20
> I'm still going to pick up obvious and simple bug fixes, but for
> anything which requires deep knowledge on the underlying hardware, I'm
> going to just mark them obsolete when they molded in my inbox unreviewed
> by the people who understand it for six weeks.

I think that's fair!

For what it's worth, as a simple reviewer, I also consciously ignored
multiple patches that required knowledge of the hardware, simply
because I didn't have that knowledge.

--=20
Best regards,
Radu

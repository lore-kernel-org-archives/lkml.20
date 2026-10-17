Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E825B09C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202006; cv=none; b=hWMxG4eH1D5IB5lKB38mQjhnwjm1oE+AZcqQ6kEddgxz9dzsuZ7aIWgIXmMw2OmAte6Jj/LaAAix2mBEFyKxgOBeMgNakf/FJ5hYdVMbXD7BPXm+S/JpMm6edUwBRYUK96vsbhWvfGKs45f3TA6MtBArNCsyN7tJTo8i/754ZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202006; c=relaxed/simple;
	bh=9wt4I1OyBWUfUa935ZUq7lyiS+AkihPokCouR4spTMQ=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Fj5VA8KitTSpPtn7jKPvkoqpPAkDyS88slTDBJDwOAlgX0V6KE1ApizPTY5zJGjlUCVx/5FbRCgWWvf8+IZY0g4/bhJpjyQlfvSIwtQnIJZZJhzUWvEv2griaPjakEcUzZN/85s685XZOmc2TwdL067BDtgJOhN0YVTRd6brgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=NiI7jgII; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="NiI7jgII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=9wt4I1OyBWUfUa935ZUq7lyiS+AkihPokCouR4spTMQ=;
  b=NiI7jgII0pqqDKi7IPREKRsK53qrNZT6sHuoNB8UTfL3HS2ebUQJBZAg
   C1IwaX9Rx1PJAx7s0r0df0ZrYTY2CD8M4WVWNBQi2tV3n9KwWVrrY14Ld
   9zBlaqWlZTQzj+FyyPkWTJEyi+aZYXmr6Uf+3DURAuWc7SGKm3Hu8/XOs
   c=;
X-CSE-ConnectionGUID: 3ljZGwyLSL+6LRA4h36vsw==
X-CSE-MsgGUID: VVbAmgotSS6VKi7Btxy7/w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,162,1787004000"; 
   d="scan'208";a="160087304"
Received: from 37-167-20-78.coucou-networks.fr (HELO smtpclient.apple) ([37.168.20.78])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 03:53:19 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] staging: greybus: Align function arguments
Date: Fri, 16 Oct 2026 21:53:05 -0400
Message-Id: <C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr>
References: <atK4JxHU2SmM-HbV@user>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 rmfrfs@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
In-Reply-To: <atK4JxHU2SmM-HbV@user>
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
X-Mailer: iPhone Mail (23E261)


Sent from my iPhone

> On 16 Oct 2026, at 19:50, Yalagada Pavan Kumar <pavankumaryalagada@gmail.c=
om> wrote:
>=20
> =EF=BB=BFOn Fri, Oct 16, 2026 at 05:34:44PM -0500, Ethan Tidmore wrote:
>>> On Fri Oct 16, 2026 at 1:36 AM CDT, pavankumaryalagada wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>=20
>>> Align the function arguments to follow the coding style and
>>> improve readability, addressing the alignment warning reported by
>>> checkpatch.pl
>>>=20
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>> ---
>>=20
>> This doesn't apply. Are you using staging-next?
>=20
> I'm not using staging-next for this patch.
>=20
> Should i rebase it onto staging-next and send v2?

Yes

>=20
> Thanks,
> Pavan
>=20
>>=20
>> Thanks,
>> ET
>=20


Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A093F23DB;
	Fri,  4 Sep 2026 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499107; cv=none; b=NNlpDcpq8kVZ0lsaiNTzs8M9VljJtE71Axo2CeJUH7ay9QUJ6V0nM0XyLJ+ULd4WNKPQox3SkA0Zls2xnquTpGfmT0WaMUJp4xzb4vwJzgb4qpKmrSiJWa3DuAnyQWHleMmmniF+qc8YPxpzDM1riGFyAyjbFv5zfPMPR/VJ80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499107; c=relaxed/simple;
	bh=ESHJsvM+IjXiwq4CNcd7g/uiiWkagys2jYNkiN4MOWM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KOHdnpjiIkoiJjwTVerUH6mf+pvNkUUz3YZWHMqO23E5GR25O4FBWW+dMIl/tWnfd8/fjAfqMVFNlw2nXtZsC35Jnke0tFXxNAdNAauFwVBwi08ICSaaS5yL/6qIl8w3sCmvxKfttFzufawRuM7976DVeP5wJX2+Eb0toQ9tMEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z9zNNHOW; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z9zNNHOW"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hbl9S3YKKzMlGP;
	Fri, 04 Sep 2026 07:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788499100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESHJsvM+IjXiwq4CNcd7g/uiiWkagys2jYNkiN4MOWM=;
	b=Z9zNNHOWbWXKJkqXwhwLnLs+xLxssNWbvEMDRS6oPvUFiMQvg4LK7sLdsKaqpvoxx6BQoT
	Eqxp1UPJ3oiaxGd+YB1xcUHbhtb/SE90w27MqCvxNUvbddX8eTX0tcPHMweSPrJ+HMhHJ/
	Nt78KNxSVjRDqio3LiQhZXvaClLx8l2LcMvL4DTZLtpFp0S1/WMlJfM6vAzFcxqvo94nyg
	HVE4cf1RSggk09IiLcEABapAswYb4Tks/u0f3yzp3ZW8/J7OD7JE79pkJOsaMPGSSg76mp
	kvOlyu4bFIbOgffim7ONPSkMH3ykXmBS5vlZxY/ijNS5v9aTOtuz6Eb10QT6Ig==
Message-ID: <6ba88e25314a5818f8fb31dc3a2165f6786e890d.camel@mailbox.org>
Subject: Re: [PATCH v3] docs: verify/bisect: fix typos, formating and
 punctuation
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Randy Dunlap <rdunlap@infradead.org>, Thorsten Leemhuis
	 <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 07:18:15 +0200
In-Reply-To: <4c379bf7-e518-4a06-8b12-134f39a45785@infradead.org>
References: <20260903154336.732305-3-manuelebnerli@mailbox.org>
	 <4c379bf7-e518-4a06-8b12-134f39a45785@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ai1mdtu11ks7agtxsu3dssk4rrkm4un8
X-MBO-RS-ID: c40eaf41987a3eae5f4

On Thu, 2026-09-03 at 09:59 -0700, Randy Dunlap wrote:
> Hi Manual,
>=20
> On 9/3/26 8:43 AM, Manuel Ebner wrote:
> > Improve readability.
> >=20
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>=20
> It looks like you might be misusing the Reviewed-by: tag here.
> My only reply (to v1 of this patch) was:
> =C2=A0 https://lore.kernel.org/linux-doc/0475c09c-e165-41a5-b654-5c6aefea=
ab0b@infradead.org/

My thought process was: when I include all you suggestions and your message=
 ends with
> All of the other changes LGTM.

you are good with the result. Thus Reviewed.

I probably did this a couple more times with you and others.

I'm sorry and I'll pay more attention to this.

> and in that email I did not write "Reviewed-by: /me".
> Just because I commented on it does not mean that it merits
> a Reviewed-by: tag.
> I.e., a Reviewed-by: tag must be explicitly written by the reviewer
> for it to be included in a patch.
>=20
> Please see Documentation/process/submitting-patches.rst for more info,

I'll reread it.

Thanks for the feedback,
 Manuel=20

> or ask if you still have questions.
>=20
> > ---
> >=20
> > [v3]
> > =C2=A0+ incorporate Thorsten's suggestions
> >=20
> > [v2]
> > =C2=A0https://lore.kernel.org/all/20260902115121.687986-2-manuelebnerli=
@mailbox.org/
> > =C2=A0+ one more 'your' -> 'you'
> > =C2=A0+ 'it'
> > =C2=A0+ incorporate Randy's suggestions
> > =C2=A0=C2=A0=C2=A0 https://lore.kernel.org/all/0475c09c-e165-41a5-b654-=
5c6aefeaab0b@infradead.org/
> > =C2=A0+ Reviewed-by: Randy Dunlap
> >=20
> > [v1]
> > =C2=A0https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli=
@mailbox.org/
> >=20
> > ---
> > =C2=A0.../verify-bugs-and-bisect-regressions.rst=C2=A0=C2=A0=C2=A0 | 26=
 +++++++++----------
> > =C2=A01 file changed, 13 insertions(+), 13 deletions(-)
>=20
> thanks.

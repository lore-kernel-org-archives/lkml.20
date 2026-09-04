Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7E47CA94;
	Fri,  4 Sep 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533633; cv=none; b=my3dI42O9xYM4WSZfur9lhUCWDX/9ENPn2FmTiKIat5iW2HA5bOOjKciXEjY9Nj71GVaGmFycebYx7v1vGBOCzRqz5bytJj+ZeqKv8+KxP39/3iRwbKD4zJF56hOxlk5zk2Lmy0JXgUlrw+stln5EiEKwR1paC6zv4ylRfN/Y7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533633; c=relaxed/simple;
	bh=ZGTLtABEhINQzYngP28TMwkXTR8rlDih1VqaPGeKb8I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hW6EF6q3vWe9aYR4GwAhEcTk+4Ylum4NGOUfBu6MvgEds5kGUmori80HD5jxbAtrOqNW6zmgHlfjf9GGZdwxh8toDjWwPbkc1fFfP/73i+64P6MgIT3r+MI5bUbUlrtlBDnZopd5WkVc4yddkFU7ySkisdc7OGrY8IUPyja+4bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wrVmmDPQ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wrVmmDPQ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbzxQ5GBkzKrtJ;
	Fri, 04 Sep 2026 16:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788533626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGTLtABEhINQzYngP28TMwkXTR8rlDih1VqaPGeKb8I=;
	b=wrVmmDPQx+YJz2dw6TdmRh/X5iFY8+TLtr+OEGJe474CJ1CxU075rk21D30wOGsOVFLpsn
	BR5bbY53VUIpRZKKWEftnDVozUifLFv04P0umwtNn6NEqcB1nlyXYRKpaznkVwMmV670TU
	TfraKsL2XMJoj2Wh5aj2jGdac/ozwcuTkahdxztSk/l0PzccGyenxsEpCEY9AxF2ktrZ2i
	cB1k3c9ltOZf0oC5AqiB0J4YH914eNQ97CVnkQODw3IPl9w+Di0ETgrh/KdW0BhhxITYDe
	2aReXcQzoFHRh342gs5bS6V+hBlpz1lZ6bZgR2RVQ/xerekWSNiIBvKimMftbw==
Message-ID: <942969bc8813265290da274865a9290adf5f1f8b.camel@mailbox.org>
Subject: Re: [PATCH v3] docs: verify/bisect: fix typos, formating and
 punctuation
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 16:53:43 +0200
In-Reply-To: <874ig52k2t.fsf@trenco.lwn.net>
References: <20260903154336.732305-3-manuelebnerli@mailbox.org>
	 <4c379bf7-e518-4a06-8b12-134f39a45785@infradead.org>
	 <6ba88e25314a5818f8fb31dc3a2165f6786e890d.camel@mailbox.org>
	 <874ig52k2t.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 1ud5xehmb58doia85zuisgrhkiouiu1f
X-MBO-RS-ID: 8cc7d83d1837cd4444e

On Fri, 2026-09-04 at 07:59 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebnerli@mailbox.org> writes:
>=20
> > On Thu, 2026-09-03 at 09:59 -0700, Randy Dunlap wrote:
> > > Hi Manual,
> > >=20
> > > On 9/3/26 8:43 AM, Manuel Ebner wrote:
> > > > Improve readability.
> > > >=20
> > > > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > > > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > >=20
> > > It looks like you might be misusing the Reviewed-by: tag here.
> > > My only reply (to v1 of this patch) was:
> > > =C2=A0 https://lore.kernel.org/linux-doc/0475c09c-e165-41a5-b654-5c6a=
efeaab0b@infradead.org/
> >=20
> > My thought process was: when I include all you suggestions and your mes=
sage ends with
> > > All of the other changes LGTM.
> >=20
> > you are good with the result. Thus Reviewed.
>=20
> Just to emphasize this: you do *not* get to make up Reviewed-by tags; if
> it is not explicitly given to you by the person involved, it does not
> exist.

Understood.
 Manuel

> jon

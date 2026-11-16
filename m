Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821909;
	b=mDNjGx1608Ho6CJeK/taI6f/xqc2RI0aaTqhrrEuTMa7bGXQ8qBBUj5vnSt/Vo5xluol
	 tmjaKiX5nYV14QBYsLJUVm+PGAdns2MD4pjxSjbGNsidZf0F4x+Fj+kCU8W9x3iGlr1HB
	 7aRdQXjMyqvbGHIEwWGm0NGQTbL19302k0seKAF8P6ejnOGmS3nAgFntdMYpFoCuIX9lE
	 WPqouLXxgAOGKCfCdzoNPC/TFRymIa8Cx+UEtkfDkUFg/Y7hRvuHM+jx+Ju7gcDjtL1aK
	 ciErwujW//jNeO0v02B2MdjXyItiOw4SQEJoIc72qkjLwGpH/5pSJBJUc/QZyAD4FGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821909;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-ID:X-MBO-RS-META;
	bh=TdayhSyZh6vGn33Vc/U0o8gSJexg4CB/0stotZ00Gco=;
	b=GxsmRxXwHXpX3jMcyLQHd7giTISOU2UBtZVcYn8FU6MDq80hHmsxynZ9cYA3GJoxPCg5
	 u0G3lysmhDK/YySuz8fD58xQip3Chf96SbKJrvo6w1D+Eh+WqjcC4T004043ZoGEty61J
	 ir3sMKOVoSt/M1QNRhAFhoGyMGwfawoyElU6EfssoQ5mbhh43ivoRefJyjN7dsbmyFFXu
	 K0Uz/i7F90OzhOYGDhkEU4QyrCMaStOflPTnHivEP4GFhXD+4mrSFUqMF7F8mlhkWdSKd
	 ioshXTKCtJJhdGXymwNjasrvNlGF/5eJfy0MH/LpH0XAFjVwrTgel7ZCBmaeOzVoEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=NL3aj6k7;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33242606A329;
	Mon, 16 Nov 2026 09:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33242606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=NL3aj6k7
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jSjTl4tdfzKm6j;
	Mon, 16 Nov 2026 10:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794821899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdayhSyZh6vGn33Vc/U0o8gSJexg4CB/0stotZ00Gco=;
	b=NL3aj6k7IxOi/t++Gv0KJlHa1bM2usFwmgmUE84EjF7X8NSXNx2d8XGUqninLi4MriG/Ej
	JxMmGvHJCqY8KbxxUZXMkSlbERjnOrqbwLSHQsxIDGUWfeuhDBzgJeuquvcfCecAbutUzD
	XXzKhJU7wSxhPKvjobVhc4UmRZDqXqzjYmbqCYLZ4SbexUCYJ5he42c1E8canf31evwDtC
	BwjOtYK6O5/JssNm6VO8f+VwJBVZXkTekdYMt0fISqjMyNxSNdIkIWjqqJdo/rXF9F/Loe
	hVS463NWrNf4n197rLV3L2WPa+ITU2yRsHxNwFuktU+pIbQcsdbXyJkvbqSHTA==
Message-ID: <32a4976792275c8ee903ca99728bae12bb3b9be3.camel@mailbox.org>
Subject: Re: [PATCH] docs: doc-guide: add hint to review patch
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 10:38:16 +0100
In-Reply-To: <87ik1x3zwg.fsf@trenco.lwn.net>
References: <20261116082209.1100175-2-manuelebnerli@mailbox.org>
	 <87ik1x3zwg.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 870eb5400e0e90f9b56
X-MBO-RS-META: 4eonf97s57hihiejnw6w3ndz4yrai5b3

On Mon, 2026-11-16 at 02:10 -0700, Jonathan Corbet wrote:
> Manuel Ebner <manuelebnerli@mailbox.org> writes:
>=20
> > For the case of a duplicate patch, review the other patch instead of
> > sending own patch.
> >=20
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > ---
> > =C2=A0Documentation/doc-guide/contributing.rst | 4 +++-
> > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/d=
oc-guide/contributing.rst
> > index 46a44b39d6..ee2f896a21 100644
> > --- a/Documentation/doc-guide/contributing.rst
> > +++ b/Documentation/doc-guide/contributing.rst
> > @@ -129,7 +129,9 @@ looked like this::
> > =C2=A0The entire process only took a few minutes.=C2=A0 Of course, I th=
en found that
> > =C2=A0somebody else had fixed it in a separate tree, highlighting anoth=
er lesson:
> > =C2=A0always check linux-next to see if a problem has been fixed before=
 you dig
> > -into it.
> > +into it.=C2=A0 If the other patch isn't applied yet it's good to give =
it a
> > +'Reviewed-by:' tag to help it get applied.=C2=A0 This way your effort =
is not in
> > +vain.
>=20
> Should we perhaps be explicit and say that the person involved should
> actually review the patch?

Makes sense. I'll change it to:

into it.  If the other patch isn't applied yet it's good to review it and
state that by replying with the 'Reviewed-by:' tag.  This helps getting the
patch applied, so your effort is not in vain after all.

Thanks
 Manuel
>=20
> jon

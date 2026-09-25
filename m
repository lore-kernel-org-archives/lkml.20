Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D44CE678;
	Fri, 25 Sep 2026 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359857; cv=none; b=mrkKaQjqQW4m9Xgt0Adtz/A+jiX23YLIq841kP5fAinRVHdOqeeTIt7pNadoO+zQgGXg7jivXlp5rAYxFFYvpBsvt4whsqw1FvuZFDM7jliXE10BsPRSHY9FeTB5gY5hRhbidXpjgIsfFYjNGRgqEstttGv2fQnp7UDC0mjglNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359857; c=relaxed/simple;
	bh=Sm3lsq8ETBLHj1/70XM/qMmh73X+5vC2nY7sJJc3oeY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HZP2dnG/NjBWkn5PFQUgj7zULTWOXvfb13pUdjnmaS6P7nYeT52z4AHIQjT4Kx/ZITD46VH8O+FNolllK+PbsPzr1ypHPkLsjCNkGizRT/vl3AUUGqGFB4cICKvJQt8/RJst1gYfC5bGh399//qC1tRTVqG3tlgAjZHg0kx6ccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XMngUj0x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W9NKgYym; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XMngUj0x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W9NKgYym"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 1FC271D00085;
	Fri, 25 Sep 2026 14:10:53 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 14:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790359852;
	 x=1790446252; bh=AbgYRVfdETUW8J2BjIEzTew/DfjQqsywFyErgm67BFI=; b=
	XMngUj0xVrEHLSrg/OWTJKC+qFOlw+635UqP6vkCwGTKB1QLOYJjdeb93GbDO0Jp
	8yYsLoFLcv5usx/9IMQjyOXTJhJ0uy/HKxzvCBCa01TRaItq9Cf9EWTTGZc94tZx
	uYB3DGaZ9kZxQ1K8RNmfJ5EiazTi8V+KMQA/lFcTAnIIio1XPHw3eOj58ekjH8eH
	x/tlhSZgrrCngi8ppNgGCg6ZUuhnQ3VKszK3H6ynXqnUI/4pJgUE+eHK2kJL2Pqr
	Vc2c5XEwE81TUEgz86FoG4ZG+ZrdVRK364ViGkpgYgh5QnWM+2EZjJKd1AQf6rP+
	tGKfRU+qN+XUDJB9+bVnnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790359852; x=
	1790446252; bh=AbgYRVfdETUW8J2BjIEzTew/DfjQqsywFyErgm67BFI=; b=W
	9NKgYymUfTWlShYn9M8Ty/364iQgpCBbnu0VslCZukUHNgUcBh2hs9kDQTMt4kiZ
	5s7QMyDWJtKrDndEy8JCJwxzItjeJsEHQOALL+SoTQw5GKhIbfaaeZMJjmQqc2Mi
	YXID2rMNArXuzWZuqKmbCFpKbSlvwrAk8pZwUPO3gZMWcWmIJbCmZYyqk6asdN8y
	FJ+/YKUPjPc2iEyfZtI5ZUYnyvNi3r7Iade4/BBz0DhbUpX/EoxjYbC/eb7T5tKj
	f4e1f/45Nf3MxzxUV7xL2mG4TwkAG7pS2Jb8WkSjjooAJGL1QZ/1VDKOwWJ0bieV
	mWNaYdWBv1QZJy/jaAlJg==
X-ME-Sender: <xms:Jrm2ahivQQBkcbXmKdLMrcBRvJnBvxRCEOoRljfid_Y9gGtR-G8ZEw>
    <xme:Jrm2ag3x9TTx9vy42WNv0yR0Z2GfSaqf59gAfhWZmCXV7Y5quWvs24dPueXVkpNHT
    WSMsvqydunrsK-3CWi5zMLKouhxbWvRsy7J_2VsfqlFIYPSB_V49zIM>
X-ME-Proxy-Cause: dmFkZTE2hbpf+CQ5ChPNjunLwg7EyCAjp++DrpfGKlW7nUA7dc5JiFWjRn2DehzPQKYZT4
    Oty6MK9b1b75TSIr51h6KOlmSfzNZnOZ04lbRYTZj3Y9Qu6NvuKjlBC83Uy9GGE7L5oYiU
    7vA+h7EJrQQBovrlnGWLvHFABesuCoEEqnbz/Epr7+HNBoxWRgmqaUJ+ASXe7+Z1SW9dQJ
    9Wo9IDFnIWEM6i0KuV8hllDmEHshFQwawHxfejO/RmMnoF26lIN7Iwjzp51SsOfYVYjw1m
    7al4S6nPAytJclnBXj/aCY0auTDcfrOcNvMFZfHGKzVAdnY1G1nZncC7pLZ9F7VDwUbPqN
    DtjC3wXQgC9KDCrSjbgaQMtcPn/egDDGHKxxTeauzbLZxgHC0BUL/oDbBN1NRkgxndV9uD
    pjV9jmcJIbudVUomLHe7yp9zcrTKYmQH84CokAXMRx+jhVzzqMtAFE6RrdxHvPATA6+nOD
    YtljvG29v8+WZLbcc2H5sVuRnqAAkEI+0Tj06dQJt8yaMb8h1O8I1pKskoyf3vPQ52Yr73
    3PwUJn1KA+Chx466xKC6pKU6sOcTO/E9XNoF33+IL9S/zw80xDyQ0rU7sk+1DCLq+MYBtK
    W3s1cGS0VnJ56r+Zmb9LCgD5aLr+/wGtHFb12Sc3+rcfZm4/43jARPQN28kQ
X-ME-Proxy: <xmx:Kbm2avr7rRlU3vwN5J3jLhL8WEAJpQDFk-z3uGCwodEkV0qXHxJ-5w>
    <xmx:Kbm2aqljJ5IuXvK5TrgIsg8bgUvCunTJEV4bm5pb2AFNISO0-ij_2g>
    <xmx:Kbm2ashKyOqWOd84-Sfoci5tWV54tkVqLzgsi21Hrf-tAYw1NItdug>
    <xmx:Kbm2ahVRWfj16xsZ1eYl82Bsz7XnnMfdv5cU3KcXBhbkJ_WsJyX5cQ>
    <xmx:LLm2an6GMmaC0wl_DPErY4BsoUKHqR-VWk-_6Zsf6DDl5uHHdhg_b2b9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6D27032A008A; Fri, 25 Sep 2026 14:10:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0ku1qeKkgxR
Date: Fri, 25 Sep 2026 20:10:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vijendar Mukunda" <vijendar.mukunda@amd.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Daniel Baluta" <daniel.baluta@nxp.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>
Message-Id: <d2d25531-d469-4050-8d74-5c7ada4cb890@app.fastmail.com>
In-Reply-To: <b76e11c8-4f0c-4ef2-ac42-f6f062a1646e@amd.com>
References: <20260925131104.118993-1-arnd@kernel.org>
 <9f8e5988-ca08-44a6-b047-f5aaa133da41@amd.com>
 <b76e11c8-4f0c-4ef2-ac42-f6f062a1646e@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: fix building without CONFIG_ACPI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026, at 18:37, Mukunda,Vijendar wrote:
> On 9/25/26 19:02, Mario Limonciello wrote:
>> On 9/25/26 08:10, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> When ACPI is disabled, this driver runs into a build failure:
>>>
>>> sound/soc/sof/amd/acp.c:1374:13: error: call to undeclared function=20
>>> 'acpi_find_child_device'; ISO C99 and later do not support implicit=20
>>> function declarations [-Wimplicit-function-declaration]
>>> =C2=A0 1374 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdm_dev =3D acpi_find_child_devi=
ce(adev,=20
>>> ACP7X_DMIC_ADDR, 0);
>>>
> Hi Arnd,
>
> Thanks for catching and fixing this issue.
> As the author of the original patch, I didn't receive the
> original bug report. Was it sent to a limited recipient set,
> or could there have been a mailing list delivery issue?

No idea, my report is in the archive, and I assume that is how
Mario saw it:

https://lore.kernel.org/linux-sound/20260925131104.118993-1-arnd@kernel.=
org/

I only ran into the problem on today's linux-next during
randconfig testing.

       Arnd

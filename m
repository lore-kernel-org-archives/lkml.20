Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716259;
	b=ypqN3wcYc+igvlBFAudp4zDbIuYOa1ARDleM9hqMJSett79jE8e27AOgUujNEj54jCKC
	 r+sMCwGr++dcaQyvngCMhsuRuzfO94tOhLF8Ok1OCOioRVUmGgpxk5NLm08r+ooufGLXb
	 my3dYHCkWp9Xgr7FoVrmmp10bIi5xdnK+d8hVJwn2ff46WrbKl9lslvNTCmRUjtebDkCs
	 z77O8M2fjd1WPxGCRn8rh0w0sgXn9VQZ5t9eEcPsazqOgqqfR/gK6pV/By9fTraC96NfW
	 +SXqX3lO+OHYEcJgHzqSfvg048IJNuSLuRp1MCfg3qeRxlmEa3Lv52dot15nBXMDFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716259;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-META:X-MBO-RS-ID;
	bh=b+elZQCscZrGobKXOaY/mWgUTmREQTdwIAfkTbrm0+Q=;
	b=1BABexcgS9wTQJu1UvFFu/g/FsitTT9tf2mznCGOCiOUOIWCfLyMTblsnwGNK9JxjMZy
	 6kQdZ2m8YmXOQPsuy9g0Ze/vyjlqngUdC8ocp7lOaWUXs7qtDc4DWwfWZgaf6B/AWzA9g
	 Hb9YyG+CJvd0EHFSrqux/fW6jzvQcm9oyfCWGx2jwHlq5KnEw8RiXdM+TGNmLCta952KC
	 imuydZPQAZ6Xd/US94tSvEDFRO4DirT4tdu4xESEVVyHcgspKn1wCkLqsCNTAChbJqJGv
	 JR3kOb6bZ1DjlU0jxzE0aXV9cRWGSaAjfJeP4cMsUcBBG4xVfuYcFIVi6uqHrV1ZeIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kPFJmJBv;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C87606A326;
	Tue,  3 Nov 2026 14:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C87606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kPFJmJBv
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jJrbL05h8zMkr7;
	Tue, 03 Nov 2026 15:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793716254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+elZQCscZrGobKXOaY/mWgUTmREQTdwIAfkTbrm0+Q=;
	b=kPFJmJBvYyEEmoSwq2W3G4Dc3cjz5FrkiPsEmfDE8fB0P6neJC9IeLZoANA7LAl5drSLC/
	neeMwqy83SdlP9VVXTgcGK6n5DlwnHw0WqpTPK6V8EwSfyF8CfEe4/At3E6+IzLfCZ1DPi
	fwXr7IUdyXNnoaZOZ/o99Xf0QHBYUBv7tUZb9JbxFzcGfVgKnl35D/Dr9UE5DeEp+gYLDB
	nLmEBqXgXUG+v+gJzpspfoh84if9fXeiTrm14r0BSOy+WDobcadcGONslRdm58XIrnKRDZ
	Vwv4Bzn4pxVL1XSTEfwDfkf975/eZmdXNLhWXKX7LmIT0VwwAvg/y32CN/qO0Q==
Message-ID: <d9acc538014ab700affb70ae377b7c37aefcece9.camel@mailbox.org>
Subject: Re: [PATCH] media: docs: Fix bracket
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 15:30:51 +0100
In-Reply-To: <20260909135934.1365544-2-manuelebnerli@mailbox.org>
References: <20260909135934.1365544-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: gsgmxphfs4jznxaid3e7ndo7t9bsr8hh
X-MBO-RS-ID: dbd63b3b4ccd51a8b77

Hi,

Can I do anything to get following patch applied?

Thanks
 Manuel

On Wed, 2026-09-09 at 15:59 +0200, Manuel Ebner wrote:
> Remove needless '('.
>=20
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> =C2=A0Documentation/userspace-api/media/dvb/fe-set-voltage.rst | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/D=
ocumentation/userspace-api/media/dvb/fe-set-voltage.rst
> index 4d09ca587..d780e67d7 100644
> --- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
> +++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
> @@ -37,7 +37,7 @@ cable to 13V, 18V or off.
> =C2=A0Usually, a satellite antenna subsystems require that the digital TV
> =C2=A0device to send a DC voltage to feed power to the LNBf. Depending on=
 the
> =C2=A0LNBf type, the polarization or the intermediate frequency (IF) of t=
he
> -LNBf can controlled by the voltage level. Other devices (for example,
> +LNBf can controlled by the voltage level. Other devices for example,
> =C2=A0the ones that implement DISEqC and multipoint LNBf's don't need to
> =C2=A0control the voltage level, provided that either 13V or 18V is sent =
to
> =C2=A0power up the LNBf.

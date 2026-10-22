Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792679700;
	b=Qw6jLwMSud2mM5vfQt+tuuNn5PLPfY6x+ekXbGpFtOa9bVO2l40UWxktMZdu+UynzKu2
	 yg5PX7gd3p9XUKFjYu9Lz4ucUwXGL541h5qM+qNEw8pVgxMCoIcvmcJKV7rgD9DVG+o38
	 ax299OPuMSTJ9n8Jz3fL9kGUEhK9Jd82ip7UpzugPzqmGY5AfMVh+7ib2hBwLi+NiRho8
	 S39e08MtZn+CvilA48S9h80RNlxCJPgzOtWLr6p2xDam2xloAlZGNv1dF0dn+lSS0U6/9
	 pt1iwoqwtA1vE8RWF5UMf6erYkV1vA3xbxFQ2Q0dZnCgbgXj6rg95TQZINToK0c5UNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679700;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=CiYbETDM3/99XFeqTNdIV1Qyw9itrlKxFrcg/Q4L6N0=;
	b=OKac0edQVjcariai/ZG03fXbZvIZpRypeUiGvEUBbOGp9+TblhXRfMFdCB0xZyjAJVcR
	 1g7CLMiN/1vgXwb5cvvV3gVqE4SWYxxhpYBJq6v68OzZnSiXo3bBGrDXLkFdMVgTsoEi5
	 4Hnd8z2ju2SlA3lvZZCNBugYgf2q6mvI73xz9Cf4vJ3wjl8UwOQo9eOHmfg9z6zsyB3OB
	 urzbmuKqa2jZOtJ5AodQMEUqbWBjK2VJ5hC/l2bgalxNfqos1IYCBdfPcyuLYdXeSJQJq
	 wOnTXcTn+12aATO1EEzJuX0nUfj7oPoCVCJMd0MLnJZdfDrYNILWoBuz0i+z+Wd2jEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UBhfrO0R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5733606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5733606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UBhfrO0R
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2D14B2009B1;
	Thu, 22 Oct 2026 16:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792679697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CiYbETDM3/99XFeqTNdIV1Qyw9itrlKxFrcg/Q4L6N0=;
	b=UBhfrO0RCS2JiaK4B0QeR0gYc2X+54U+j9hyckN4mNv5mc4Cjg8anFHnzPZCJEs5mBsb8F
	OxNAI+vYYBCEWIfIx+og6mlo+7o6zRaPFJ83D5MMet1ffsLbbmlJzCd7/fCb4Chu9l2YuE
	aTHIc0tPIa+r6u5TtG2rHEzH2CahVDUAdwty9n6ObdDj7+YOEN433LYuIZDdbgcwAtjhUW
	MJs4moZg5ctVAsAS/SbSActp0M9fHnicln+qqc5olO6wU7J7FC4KjIIgie/ebNxZ0teD3E
	zGDdYCuY/HXLEny4E3b+Mf2Mo217ze67fiXrmQ6b+0iUH8nj87TWxk1Ey1+nFQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792679697; a=rsa-sha256;
	cv=none;
	b=bwW25FmH8uVB6/bjF76W76UohhzSIB+AFpbE9UjQslGxIzTDMHLIUq4JLFP03eFKH3EXnI
	VX568FntyIwJfA3Ch6d6Szxx/Bq0Lv8EPkNfB7VafFWO6fhUwFfn1qDMbxin/NMyAIDRGf
	TUtBrS4+tZXNgb9Bj1KGQOAivtOvcp6a8C/yP0bm764+4XNrNam1gePRlGnAwRH8bIAvmU
	nZmM5xLru+XEcJU8RC31eQEVoF7+0WZOtm11M7ul1QY8ZegfArYGadC3DvTg/JHMuiA7X+
	ygtkE9Mglte6X+X4YlIpTnJXZagH4Rx2bLetZiK7uCDg+EBXOqtwtozOEPfjHw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792679697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CiYbETDM3/99XFeqTNdIV1Qyw9itrlKxFrcg/Q4L6N0=;
	b=hDKaY0lo2y+Blbkx7udsTUakAzmwaw9+pqGg/sMO1nH/PAbLhpsPDH72lYfpPzLiIfiKgS
	fVuSAt1mpHwfF2Wua7mTWPbkYRqH7XucXYZI7WxTugeaARU86ZmQAQ5ev8Vwr0H1AY0iIe
	GOIQKXDTasP72pgG67M6+fHDWZcB5UzE6eeVQ3xSQw3eLkUXumm5WLDDCTfhbxpJ661HKb
	fdpyZXNVwyqm+C2twLYCBtQWQDDPEaA5PzQR6+DsZHc17MNo/Fgq0dkdv2KFaEJowAqRYd
	0xF6+TIf5Drm9eiF4evSDg0cEwBl2epM38q4SmvnqRqvcDdVh9hdJ9KUEGa2Zg==
Message-ID: <cfca068658eee0906bd9ea4bba6c66e39fddff08.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alvin =?UTF-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org
Date: Thu, 22 Oct 2026 16:34:57 +0200
In-Reply-To: <atoKa8JBszlQDGYE@analog.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
	 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
	 <atjA6l3H5kdrC6SN@analog.com>
	 <ee622e48006681f9a25e556e3db360378213a5ce.camel@pengutronix.de>
	 <atnZWUA9bc1btCix@analog.com>
	 <945dd21b3f5d286a4821af078de7751df6b4cec2.camel@pengutronix.de>
	 <atoKa8JBszlQDGYE@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-10-22 at 15:58 +0200, Alvin =C5=A0ipraga wrote:
[...]
> > > I had the same thought. But I kept bumping into the fact that the
> > > rcdev->lock mutex is taken in reset_control_acquire() while we are
> > > holding rstc->lock. If rstc->lock becomes a spinlock
> >=20
> > Why would it? shared_lock is a mutex, too.
>=20
> I'm talking about the next step, after auditing all drivers and setting
> can_sleep =3D true where necessary.
>=20
> As I pointed out in my reply to v2 [1], the shared reset race exists
> regardless of whether the underlying reset controller can sleep or
> not. Shengjiu's fix only applies to controllers which can sleep. The fix
> can be extended to controllers that can't sleep too, but only if
> shared_lock is a spinlock - since, in general, the API permits calls in
> atomic context. (Those atomic callers obviously rely implicitly on the
> non-blocking nature of the backing controller, but that's a bit besides
> the point).
>=20
> So the idea I outlined in [1] is for this shared_lock to be either a
> mutex or a spinlock depending on the controller's can_sleep. The logic
> of this patch staying the same.
>=20
> Maybe I misunderstood you here:
>=20
> > > > We could also combine this with the exclusive reset control's acqui=
re
> > > > "lock" if we move that inside the SRCU section.
>=20
> I understood this to mean "collapse lock and shared_lock into a single
> lock". And I was just saying that - with the above in mind - if
> shared_lock might be either a mutex or a spinlock, then it doesn't work
> to collapse them, because...

The disconnect might be that I assumed the mutex would still exist and
we'd just add a spinlock next to it, and you plan to use a union like
regmap does?

Either way, the point is moot if no (acquire_)lock is needed in struct
reset_control.

> >=20
> Anyway, I will prepare some patches and you can take a look.
[...]
> I'll send a patch.

Thank you.

regards
Philipp

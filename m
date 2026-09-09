Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A563557267A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960881; cv=none; b=ZRNURFbY45PzHcNVGQv/jvLfFuAvJQLVojRSyX3H939LiXaQHv6lPc05MDFgSjXswUsX1pndOEZwqg3EKfxjyX90cvwuYWv9UBmdbPFsszkSiPrmh0HgxPUsplO+T4Gx+F/MMRi/O6Ou4CeG4CecxX+2uUoJgmH7T4pqkYyQDvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960881; c=relaxed/simple;
	bh=BloOMKHIN/KX5c3cWXn/N38e2N+NLd78K9oN4TTWCdU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dl6g59otua4SoplISSGOrvHA7rhvx5W8Xr28fU7exAmaxsFXXKUV1qgneJ2L/Slc08i1079MIvdaaZkEwpB4P0DbnnFlDoMOImOZvt14akoM/2DZDR/lgLNsq2jXTbJfScl+u1dwgSw6S1RDep9m8rLQvPGaplWm+yKsjVwNZoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Yf31xWyh; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Yf31xWyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788960869; x=1789220069;
	bh=Tm20JErTb17gkaj6mhVlrMMtBoKmsO01Z2wpdn3c/cw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yf31xWyhJZzHCbS0hOo2W32g1/LqflvyhaClukFlkvsluTRfQCBVyU/HYcM+qage8
	 W1IwDF9Q9Dh3woyy9GR1AU/75FmpdX4xtSRBZnoYebZPPGeGFlxkRNLvf6huYHgrTR
	 YbRyOVABWnqK36ynYmmlmz0aNDNY2/lhZLQ7XU9mLX3vAmk1fmlUewvMQ+9JuHqh/B
	 5vkPBq0LaRuGU1DpqBH2sNmWEPU8CxzgyUIuOCjHgGvEAkTFjdjFHVFB4sQpYgx0o2
	 AGouPiyi5nOyf/CxsEq3lgBT9lK8aC9DQuwgwLWLH/h1GFVWo0ckoO6RTz9nY/jWqz
	 bPEyWwyDc5e/g==
Date: Wed, 09 Sep 2026 13:34:25 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: contectforbusiness@proton.me
Cc: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] staging: greybus: light: add comments to mutex definitions
Message-ID: <82IpRn2GeeiiJ7A0nu21Sh7caAUbiZ4W3Nu0hTGr5akY0RN5Z4iyzDsDe-AVuoVX73apT9o-1zS1fSZnluND46kDGLnMc-qa8gFPSwscpMk=@proton.me>
In-Reply-To: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>
References: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>
Feedback-ID: 147676893:user:proton
X-Pm-Message-ID: 3d02291fe725664cbdf4922232a49172afb0aaf9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

checkpatch complains about:

  CHECK: struct mutex definition without comment

Add short comments describing what each mutex protects. The
channel lock protects the channel state and lights_lock protects
the lights array.

No functional change, just quiets checkpatch.

Signed-off-by: Vaibhav Agarwal <contectforbusiness@proton.me>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/ligh=
t.c
index cab02b5da..a036fa2a0 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
 =09bool=09=09=09=09releasing;
 =09bool=09=09=09=09strobe_state;
 =09bool=09=09=09=09active;
-=09struct mutex=09=09=09lock;
+=09struct mutex=09=09=09lock; /* protects channel */
 };
=20
 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
 =09struct gb_connection=09*connection;
 =09u8=09=09=09lights_count;
 =09struct gb_light=09=09*lights;
-=09struct mutex=09=09lights_lock;
+=09struct mutex=09=09lights_lock; /* protects lights */
 };
=20
 static void gb_lights_channel_free(struct gb_channel *channel);

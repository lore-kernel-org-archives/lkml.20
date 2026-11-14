Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666375;
	b=WEWVwR0wBJBMCS4QcIiiQrw5rZXO0UsQ2vFxbyAGHLm5IPkINsdEf5DQDnide2UZsKlk
	 wgTvK415Ghe80/yDXA//GMiXXAYogswtUbh+88E+Pr95vMCrmyOomaiTt5NemInmEfTyh
	 54dnpPa4TIDQN02koBWo+VN7id8ZKeFhCXi3DvCIveIsOtJgsJh08y08brr1lyZNLiMhm
	 vP1adauDesMXP9a0Hur40RTS3ctImc4prtroJ8qOgJXvmDDkK6oO0alVFiP/CSHyyy9nz
	 7IcC9KjDwKT+3COpqyqbVrYYRUHedoT9LzLBZq6wudNOlzQhF8s+HbtAi2wVkEZQ0oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666375;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Queue-Id:X-Rspamd-Server:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=nFc4ZyC6n+fuujis8S18mAnKFkyieV8xRHo9K4366Tg=;
	b=39ptesQByPxoCTp/R4tGygRPIp89+FNKcdtRlXcHFsO9DQ2GBT8DN3rrf3FWI4rWnQ1f
	 MPdHF84uX9NqgpWDTVwOAEsfcf0XAHYUTwCyeGgu1quHMhr+Pd6JYfJGco7JEhf35ryqm
	 9CFobTbEPc137y51vy307mKbqnzlgexeahNAQ/rxthJ1ZHgWgvzhklO29pZHORAupL6qi
	 VG+9+DZ6LSLVnixZZeP5624kd4SrYo/ja3xvkhe4ANR2Md4cYveX9WXj5k7+uZtLM4X/c
	 u8J4zeuaEGMYXMAV5XrPBK6A2nmEfD01FAIZlyfZ3pl1hgTAFotAjhPOP+EsG4IqokQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B98606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B98606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 169ED1603E1;
	Sat, 14 Nov 2026 14:26:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id F1C1B20027;
	Sat, 14 Nov 2026 14:26:10 +0000 (UTC)
Message-ID: <61e4f8997861a1188935435e78682c575552d2a3.camel@perches.com>
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
From: Joe Perches <joe@perches.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: apw@canonical.com, akpm@linux-foundation.org, elver@google.com, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Date: Sat, 14 Nov 2026 06:26:10 -0800
In-Reply-To: <avhgY9t0KVkDfEZw@google.com>
References: <20261112151203.3129005-1-vdonnefort@google.com>
	 <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>
	 <avhgY9t0KVkDfEZw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Queue-Id: F1C1B20027
X-Rspamd-Server: rspamout08
X-Stat-Signature: qucs64fitc5ogo8frjtbptx5eqjo61bx
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/LQ8zw6azZLhiMMmzQv5QCjbg03dUmbRY=
X-HE-Tag: 1794666370-169095
X-HE-Meta: U2FsdGVkX18dU0Ms4JcAoOcgrnjtDlrSI/Ao2Iorwe+9WGTYsksrC+TVTztc2SsAP4nSsBxUgUikWDtQDiVOqLiDyYjL7EnQblqjyUNl2K7hFCROnrd+KoM86EC22WBpCKcK1mcyadBUjo2oGhlRxBUUbOPnz6mXZuJr+AyC/Nj2ifTA47vM8QoX9jsHztN6HmYa6WyC/kSE1JdQ0sIKXciDHpZL68p6Svifh4MF2nRuiOGR/OrahlChF0ejwgoOVeUCd8kk3zI3gVC4ABxcb3CX7PBx7TIER3j7Ta8pSM/2yp6Ya4IvozxzCC0Ils3o

On Sat, 2026-11-14 at 13:21 +0000, Vincent Donnefort wrote:
> On Thu, Nov 12, 2026 at 07:32:14PM -0800, Joe Perches wrote:
> > On Thu, 2026-11-12 at 15:12 +0000, Vincent Donnefort wrote:
> > > Checkpatch doesn't know about the context analysis attributes and
> > > misparses annotated declarations (e.g. mistaking __guarded_by() field=
s
> > > for extern prototype). Add them to the known attributes list.
> >=20
> > Nak.
> >=20
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -526,6 +526,25 @@ our $InitAttributeData =3D qr{$InitAttributePref=
ix(?:initdata\b)};
> > >  our $InitAttributeConst =3D qr{$InitAttributePrefix(?:initconst\b)};
> > >  our $InitAttributeInit =3D qr{$InitAttributePrefix(?:init\b)};
> > >  our $InitAttribute =3D qr{$InitAttributeData|$InitAttributeConst|$In=
itAttributeInit};
> > > +our $ContextAnalysis =3D qr{
> >=20
> > Are all of these from include/linux/compiler-context-analysis.h ?
> =20
> Correct, except __rcu_guarded, which I can drop.

Not necessary really, it uses __guarded_by internally.

> >=20
> > > +			__guarded_by\b|
> >=20
> > __guarded_by takes an argument so it should be
> >=20
> > 			__guarded_by\s*\(.*\)
> >=20
> > like the __aligned use below in $Attribute
> >=20
> > > +			__pt_guarded_by\b|
> >=20
> > And all the rest of these entries that take arguments need to add
> > that same '\s*\(.*\)'
> >=20
> > and it'll be fragile besides, multiline uses likely won't work,
> > any use that has another internal () pair won't work, etc...;
>=20
> How about matching one internal () pair?
>=20
> __guarded_by\s*\(
> 	(?:
> 		[^()]++ |
> 		\([^()]*+\)
> 	)*+
> \)

Sure.
Please add and use another variable so it's not repeated everywhere.

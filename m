Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156504;
	b=kF6/lwlOj0NfsMwhunPsPdDnekT1zJ+hfP685THddO3d3Y6sczkgtr9EZ3cf1IjYebus
	 t0lJK3p9zQeN5DGE2fWW16nEqZiveObJY3grT5Jo2co9uSerYHM6Yh3Pwb264738we2q8
	 UGaKfQn1cJLXCGpl/iIbWn4VVY8GsBgZ75YnUJ3duwGqBVC/xqMVh+Y3WfrLYhPWpj46Z
	 gMrx4GG+x8NBSTQbpf6QERbP4QyUmr0cB1GRZYw5sbs1bw2GKQZN61hOGbFvwFV9V6bD9
	 yXKFMct2cImrYBMDVz8UcRku3R4Me28Q9E2tOH8IL82lyiYjiukYv1pIOlU7TV3TSzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156504;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-ID:X-MBO-RS-META;
	bh=tsMiTkV/hqdop5IjaEQ8s8Y6MhRSBVR+eBSGwbhRukM=;
	b=X66yLRz14eNE1N2nti83+tD/jzBJbUi4FI/QiJYfKiE5mQHjnIrylkudgH5xDm8MYDfC
	 ur5bvC26TZmucG58YhtcurKlTQ6+q/ViHAqUYInpwhkUwnk8rHwTBiRoZ/zMWT2ZLnRdG
	 mJMBVyZCkUDhyUITv1ffuheD3bhpem3YpZYxTgEeAbhekCeLKMYx416EGnyVk57oYUIzz
	 lqo+uj+MrIqKRNbt+5Utwj2+ZfpKNoVXil5RevrY1NignrOPQXb7p9reOHCMT4UjDs1k3
	 U4q4Mxgj1ANafQa+MUBNZ+GxXc9855WFUTdiaT4YiKZHdItTruKiYQS4iDzs5wB5XsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=FFCFVjtm;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FF606A31C;
	Sun,  8 Nov 2026 16:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=FFCFVjtm
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jMzPT3ryczMlSC;
	Sun, 08 Nov 2026 17:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794156493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsMiTkV/hqdop5IjaEQ8s8Y6MhRSBVR+eBSGwbhRukM=;
	b=FFCFVjtmraFCoFTlhD4GirW+JMsUQvwsho/BOPpHsprPqVco50WPO7je+z6gRmCX/7IQSB
	RE8q6FJEA+zTZiMGENw85QKcsrVKITzNljdNAd8goxu6ubv2dAf2JPBx7ihX6VRt+1sVtO
	37cOk92lz3+KGEE9Wnxn1n2ShyZOhMYzbN7U9IAXJ+HjId90vJ9xJ4vRNOf4F5YlZaxKpr
	76zsFqIqsUrpUo1iOJ3P7bJXLzXJLuBHMVqjvJa/nqY81UhaIQa5gJ9vvSdNOaT3QqNJgQ
	fIkP5hplBhEXifbHLA9xVCftgDcV3aq04yWEwXbKe/mqYBHMLR1a4gGF7iLniQ==
Message-ID: <eb3ce9e09ea5f06c427247e8c93e6e1649ac77ba.camel@mailbox.org>
Subject: Re: [PATCH v3] ALSA: control: Fix parsing of numeric fields
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, tiwai@suse.de
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 perex@perex.cz, 	tiwai@suse.com
Date: Sun, 08 Nov 2026 17:48:09 +0100
In-Reply-To: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
References: <87zevjwmrf.wl-tiwai@suse.de>
	 <20261108124832.3058-1-sreekuttan2156239@gmail.com>
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
X-MBO-RS-ID: 0aa481dce6279afd2e0
X-MBO-RS-META: ychdem9sdqajdwjs5as7run3w4j7u1bb

On Sun, 2026-11-08 at 12:48 +0000, Sreeraj S Kurup wrote:
> parse_uint() passes the remaining input string to kstrtoull().
>=20
> When the input contains comma-separated fields, the string
> contains both the numeric value and the following fields.
>=20
> For example, with:
>=20
> device=3D1,subdevice=3D0,name=3DMaster
>=20
> kstrtoull() receives "1,subdevice=3D0,name=3DMaster" and fails
> to parse the numeric value.
>=20
> Stop parsing at the next comma and pass only the numeric
> field to kstrtouint().
>=20
> This allows numeric fields to be parsed correctly in
> comma-separated input.
>=20
> Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking =
layer")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Reviewed-by: Manuel Ebner

> ---
> v3:
> =C2=A0- No code changes. Retain the v2 implementation after
> =C2=A0=C2=A0 comparing the alternative approaches.
> v2:
> =C2=A0- Add the Fixes trailer.
>=20
> =C2=A0sound/core/control_led.c | 18 +++++++++++++-----
> =C2=A01 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 501387287ae6..3f54af2cb505 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -458,11 +458,19 @@ static char *find_eos(char *s)
> =C2=A0
> =C2=A0static char *parse_uint(char *s, unsigned int *val)
> =C2=A0{
> -=09unsigned long long res;
> -=09if (kstrtoull(s, 10, &res))
> -=09=09res =3D 0;
> -=09*val =3D res;
> -=09return find_eos(s);
> +=09char *end =3D s;
> +=09char delimiter;
> +
> +=09while (*end && *end !=3D ',')
> +=09=09end++;
> +
> +=09delimiter =3D *end;
> +=09*end =3D '\0';
> +=09if (kstrtouint(s, 10, val))
> +=09=09*val =3D 0;
> +=09*end =3D delimiter;
> +
> +=09return delimiter ? end + 1 : end;
> =C2=A0}
> =C2=A0
> =C2=A0static char *parse_string(char *s, char *val, size_t val_size)

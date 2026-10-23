Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.85.9.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785844;
	b=OXcVn9CgnLbeAmFgV0JRxmCfa0bRUA4w08iQSXpHGvJ2csiE7H4L1VCCPsLYtpheIsFO
	 wHZIrHzN2M2n8sIOIOigwvhAVPxGf5vzi05RR7+Ga5ZnttWo4Gwu3/ZkgEV84VzEZfW/A
	 EJtou+TPzGZofL0zDd65WQ/bUMf3qKRWUmvnXeZxuOejSTeIWeWp+zHSkXo3u/ybXyvja
	 SlerbAIypGZ4fpMbrpz+Sr1uLbfz9hNjo8JPdF8r5PVjYH696ZsQkTi4eWjZxPDa+Temc
	 xV8zd8WzfFOWof9qt5Spea9hdMdpn91Psf01N6XBeXxXeJfsJPdHLFFpKCuB+Pg3nrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785844;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Ud1j69Ws9rZuXftRz6SAeeTmqiu1ez39auQ4V2rt1+U=;
	b=Dp3I8lqMtqthpMe4w1ZB7PenrY177PbusTVF386Q9mSUJSARK8QRhTWNwFG4LRdkM0u/
	 dYJITn7lhwlAWIjP+1XOrRLg/dkGxdUYB4Ndux0jcI6uYIqAdVVdAEWeUX4PwkYg3hWwv
	 0/xk2hPlv0a34jcdXBoTBUO4QzSF8YVJdg+Y7T0fI5ck8P2nQfawq2Lc7mPX5qQmGPxPH
	 o4ajqm3y8/UadXB8pcAlttj+vWMrdkywfMKOfXlBV32Gttw5OO21FMV4Yl0NsM3CuWyFh
	 5b3+N0O5zwsL9N2m3GXyI1DX9l1IB8V5L8sxnsry31Xxa0not55UGl/cCHC0jtvn2Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=irl.hu;
	spf=pass smtp.mailfrom=irl.hu;
	arc=none smtp.remote-ip=95.85.9.111
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A018E606A31A;
	Fri, 23 Oct 2026 20:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A018E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68114.dsl.pool.telekom.hu [::ffff:81.182.129.20])
  (AUTH: CRAM-MD5 soyer@irl.hu, SSL: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by irl.hu with ESMTPSA
  id 00000000000807A4.000000006ADBBDAB.00022697; Fri, 23 Oct 2026 22:03:55 +0200
Message-ID: <8075e4d5ed4b5523a088840c5574d4c0e49307ff.camel@irl.hu>
Subject: Re: [PATCH] ALSA: usb-audio: Avoid applying boot quirk for
 Behringer UMC204HD
From: Gergo Koteles <soyer@irl.hu>
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Will Bush <will@willbush.dev>
Date: Fri, 23 Oct 2026 22:04:02 +0200
In-Reply-To: <20261019102347.2425406-1-tiwai@suse.de>
References: <20261019102347.2425406-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Takashi,

On Mon, 2026-10-19 at 12:23 +0200, Takashi Iwai wrote:
> There have been reports about a regression with the recent boot quirk
> for Behringer devices; it broke UMC204HD models(1397:0508 and
> 1397:0509).  The quirk was to just run usb_get_descriptor(), so I
> expected it rather harmful, but in this case, it doesn't look so,
> resulting in an error like 'failed to read device descriptor: -110'
> that leads to a fatal probe error.
>=20
> As a quick workaround, skip the quirk for those UMC204HD models.
>=20
> Fixes: b5c4823cf3e4 ("ALSA: usb-audio: Apply boot quirk for Behringer mod=
els generically")
> Reported-by: Will Bush <will@willbush.dev>
> Closes: https://lore.kernel.org/45162613-2802-401c-84c9-742f9c8c68e6@app.=
fastmail.com
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=3D1285896
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/quirks.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 4fadb1fdcdea..4ac4aef47dd7 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1790,8 +1790,15 @@ int snd_usb_apply_boot_quirk_once(struct usb_devic=
e *dev,
>  	}
> =20
>  	/* Behringer devices may need explicit device descriptor read at boot *=
/
> -	if (USB_ID_VENDOR(id) =3D=3D 0x1397)
> +	if (USB_ID_VENDOR(id) =3D=3D 0x1397) {
> +		/* the quirk seems breaking on some Behringer devices */
> +		switch (id) {
> +		case USB_ID(0x1397, 0x0508): /* UMC204HD */
> +		case USB_ID(0x1397, 0x0509): /* UMC204HD */

0x0509 is the UMC404HD

https://linux-hardware.org/?id=3Dusb:1397-0509

Best regards,
Gergo

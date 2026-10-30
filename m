Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371907;
	b=gfPdpUeoRiTFbOPi1Q7OM9UGNbKal5isTuGqHgOBlFoYWpQU/Wgx2MXr3JEmC1PcWM3j
	 /RKVI5xavt/fcDd/gehPM5WOMgxSYiv0W+6DB1h7ny1aFRz1lqkMTD5eGJrDwX/mq7xTH
	 pPHCwYmTcdJ6A1+Guy13yYEyCVGIQNvlYo6lkkifIHfPGIGdnTHsc+XO/jTpcrPZSXQKb
	 j6/pgZeoyKL7w5i5PRTUNseuNpUGBMum33FfxuJMRoJw+A5dol8NjWEdO8gK5GD89dkOG
	 tZEFYOxVylfk/6ZaV+anjlQPKG5DGG4zNfMFJKV06UuUMYbw2AISn0HmzU7+2M2uGTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371907;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=2HtbNoPaGhVx1oIleRCrYh9Q+TVpcVTko3WuWXqXEEE=;
	b=HE8Hhpwm1BZapivm6KMS36jozDorMGB1uPZ6LGhKuxaqmLv0QjbKF6meoMQtDTzzyow1
	 o4zdb0Bs4vfoRk4fB3n0hNPQZDHqMWMtpM6oHcaxpMBM0G6zrdWoD+6Jn1g3pZxJu0LEM
	 O7hqlJj4+ggZGBXb6fWZNR8+DyFWdcHqhwpl4Jd9shNojfFasXbUgi2iOgXAQ/FpAuvxB
	 PGxem1AnDziE48l8yEwop+E8xFuneI7wccj8DAuxYRDBLMWluidNBuci5hGEtrAWwaoJY
	 nvQ6hQk8vh7PikIDq/059Av7zgtLIra73gE8WuukI11ErF+jzS4Jo9qGJmB4v5sf7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IG002WtX;
	arc=none smtp.remote-ip=91.218.175.167
Received: from mta0.migadu.com (out-167.mta0.migadu.com [91.218.175.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADDC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IG002WtX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HKmC/zLtQ35zzhpn8XzyD4VRPec5/dy8PDlsxOcGW5A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793371903; v=1; x=1793976703;
 b=IG002WtXR3CahR9dJc7fQkF613xha+VIj85wMJAmnpxDyjG2MBwfsK5A9mA8a554UmeaMeZU
 +wxyeBs9vTKbHz3jT499XGFHJg2FXGBVvSFVi6293YEE1377/Dy3uLg/jTqDfklJQJjhcyG5HBl
 QiEy+H4cRqu6FQLtL5nKXflE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0481539a351a8ac5;
	Fri, 30 Oct 2026 14:51:43 +0000
X-Mizu-Trace-ID: 0481539a351a8ac5
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 14:51:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <4a555879477e2c5b8eb2f2cd430157adef580461@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] wifi: rtw88: usb: stop RX work before unregistering
 hardware
To: "Zhao Li" <enderaoelyther@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: "neo_jou" <neo_jou@realtek.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Kalle Valo" <kvalo@kernel.org>, "Hans Ulli Kroll" <linux@ulli-kroll.de>,
 "Bitterblue Smith" <rtl8821cerfe2@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20261028141904.8707-1-enderaoelyther@gmail.com>
References: <20261028141904.8707-1-enderaoelyther@gmail.com>

Hi Zhao,

Thanks for the fix. One comment below.

October 28, 2026 at 3:19 PM, "Zhao Li" <enderaoelyther@gmail.com> wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wir=
eless/realtek/rtw88/usb.c
> index 64e1c3420e0a..1d2759eb96bf 100644
> --- a/drivers/net/wireless/realtek/rtw88/usb.c
> +++ b/drivers/net/wireless/realtek/rtw88/usb.c
> @@ -1370,7 +1370,10 @@ void rtw_usb_disconnect(struct usb_interface *in=
tf)
>       rtwdev =3D hw->priv;
>       rtwusb =3D rtw_get_usb_priv(rtwdev);
>
> +     /* Stop deferred resubmission before killing the active RX URBs. =
*/
> +     disable_work_sync(&rtwusb->rx_urb_work);

As far as I can see, rx_urb_work can't bring an URB back at this point.
rtw88 doesn't set soft_unbind, so the USB core disables the endpoints
before it calls the driver:

        usb_unbind_interface()
          usb_disable_interface()
            usb_disable_endpoint()
              ep->enabled =3D 0;
          driver->disconnect()
            rtw_usb_disconnect()

After that usb_submit_urb() on the RX pipe fails for the rest of the RX
teardown, and a failed submit only queues the work again on -ENOMEM. So I
think cancel_work_sync() on rx_work alone already closes the race, and
the same change would then work for the older stable trees too.

Keeping disable_work_sync() doesn't hurt, but then the commit message
shouldn't say the work can restart a killed URB. Or did I miss a path
where we get here with the endpoints still enabled?

Best regards,
Luka Gejak

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239369;
	b=NSwbUT/lDy548/9P6xy8RkXgQDKCjQrz2yH5qqnR7CvVvazmaSRzi8qEmaNRbBIuxf96
	 zj9LxFm/ruvdDWXsWaKi6c6fJVnS8uXLQ8efi+OPzmXSSktlsEfimJdxGbEjHUvFWSsVt
	 /qZRbPpY87g31HGhT46RuIlscCDBKy8LV+VZGCsszLcl26zwfHjSqaVU1XZegnGKC5194
	 IUDo+09OYEPPOqiWV/jMZaODp0yJVpOHxUzQzhNV7srOc+FQjKteNxN0w8rN+22INhtu7
	 ftivsyObFfXLKwrXWOplpDMLVP8TEx0KuGmi7Wx/fkzDd/1Lb7rwa5j2QzA279AcwfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239369;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=szPidhG9CHp2L39FbLMQZ1B4ibterFBThTJb+QLikEs=;
	b=SxK51ov0U5Pwp5/UFiVfzCQoDd+Wd8e0Ii3R5dKsy6qFexXFGW2weq4l1vv8b5EUBk8k
	 +y+kDydYqqWyDP4n7pYGsDL0KPM9XNkIvkByO1Fr1PFOgDrW5Sd4N1NdQc2UWUNlevt/7
	 LJJxvbT3LT/ldAVS+c97qdCcaCPc9HituaE2sSW7QJ7DZIYDC00GJz7A8EIiJ6RzttueI
	 /CtXnmPbg6/NCRa3gKW2+AcS4+NBdOG0wNVwX/cTX2fqJGiMCwDpXUWiFkpwmoyNOH3IU
	 iixbmA4AKtchVHP/w3EbOKj/KDUKVLkFqN7WYIZQiwjWK8VXblEUdNdebi/KedokJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F1nLVN3J;
	arc=none smtp.remote-ip=209.85.222.99
Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC6606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F1nLVN3J
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-9912c47367cso575375241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239368; x=1794844168;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szPidhG9CHp2L39FbLMQZ1B4ibterFBThTJb+QLikEs=;
        b=YVplphTXgfsv62+lLLiKv6upAR348z7cd41Ry60Ber1rv1S+yBmCJz4x1dhW/i9RlK
         m1mlc6X1CUpgaQwn3F9xxEsOB0PzY0uZMhJ7IiWV2rZJvs4ZEHaCjVmugZHrAyZmIfHd
         CtlywTFWMg81MOQ5NmgHcpwJTxl11+egCq2Pjp6I+APqKdyQb3vG8Rfqhk5O2vyAl8KE
         Ta7dK2F2FQwVfd6YAZy40wDJk0VldivsIeidRJtY1KJHLPRlrnOiaDOf0ZeVPSjI4DEE
         oL30dEICXAMsI2t2XPz9juN5ugs2UQmX2RZK9dXjF3kFblVV4CNZiEx1EixdYMDuFqNk
         YD8Q==
X-Forwarded-Encrypted: i=1; AL+hErEHlXMkI1wghH56wQhaImlDVGxDumoQxbQ0G7rGuIZ1LJtKHi4OHgW0c422DBzU1SGM/vIO/jyLuxKy2Hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RGYQfQtuE4umoSOtcPZoYQ97xVVKsJ3/WJ3De22j8rgmk9eU1
	+wp81YDxlTPIc3/5Hre55qbi4e1cCqtJZBQvxJytGe5JKOS4GbLtTyOCGqsDhpud75ke9E9Bwmv
	iJ2liG4vWT3fcy4+GLoKXN9r+Nqdwku8wk8Pt4pdVAyHoBsoh4SFeMf2tbJkkp4RnFaNaIv2UU1
	cRexB1d50pSrqG9qNK6p0kcga6SjftS3GhOztOCoVx0E0sBeUHwN9BSTcpZFgnshFnECiia5SdS
	NVHAig9Pza8Y4g=
X-Gm-Gg: AYBFou0FoiZXMIR/pmYRZb1bGkKC9UKR0rzKpSabVpAT+jQes6nR1unrgJKgRHVh0cn
	HCTpL0Buo1Jwe/l2/QfrZjlvr3AHNIbNOKOcaLyV5fKObrBbc2j7VN9KKmbcWTmn/Pb212eERXk
	rvXBXyf8psBXwDAbNRZsWklCxIM0WRYK0h18UtqpARHwORcBo69aU8M14OQOr8UbiGnlE8EnLt0
	KXQ9NgJLAP/jpRvHm9kBD05c5JFfj6Ota3pR2kokvLftrf1I3AGIPosWLLj98Yx9ToQXm+rmufD
	I9Mw08U52E3OpQ744vees8/BVyzzMn1xoS8gMqecJVhyJ3x9qPerJESRtrYeFrIHyizQJaEdt3x
	FATsCHO7Usau/qoiEQwQL/lTxxAK2gCIHHDjg/20ghm/vtOOlp7lOgXoeRxarSe6Y55IzxNjxeE
	ljwTwyCRxEVNJbPw5+VloBbofPOKdl
X-Received: by 2002:a05:6102:5121:b0:7d2:ee9e:5373 with SMTP id ada2fe7eead31-7d2ee9e70femr691928137.26.1794239367376;
        Mon, 09 Nov 2026 07:49:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c02aa2717sm169139241.13.2026.11.09.07.49.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:49:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so196809585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794239366; x=1794844166; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szPidhG9CHp2L39FbLMQZ1B4ibterFBThTJb+QLikEs=;
        b=F1nLVN3Jq8VIDp0M2mFK3vgKJEXaJJE3aKTet7dzJwCRAU/yRP6JAZzE13OQMeDwlx
         c3d8qk5Tzuy6xy6mvXcVYVhSCqPmZvfnADsPDW6hjY1ycbxDLJQ+dyyprur09PoVYuJF
         CwUNqByi9/BPydwLx3MXs6+GP2tp5XBO+pvuY=
X-Forwarded-Encrypted: i=1; AL+hErGDibkdXPOyBzt/GPobzXhVba5nusy8bIrI3nWON1TpMZ0BZ0yrnMcJ2jzg3kaqf6mCFB1NQkRUPyzPyOk=@vger.kernel.org
X-Received: by 2002:a05:620a:6186:b0:93f:3834:31f9 with SMTP id af79cd13be357-94604d2d8cemr980589285a.12.1794239366584;
        Mon, 09 Nov 2026 07:49:26 -0800 (PST)
X-Received: by 2002:a05:620a:6186:b0:93f:3834:31f9 with SMTP id
 af79cd13be357-94604d2d8cemr980586085a.12.1794239365895; Mon, 09 Nov 2026
 07:49:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107100253.3543022-1-hj351016@gmail.com>
In-Reply-To: <20261107100253.3543022-1-hj351016@gmail.com>
From: Ray Jui <ray.jui@broadcom.com>
Date: Mon, 9 Nov 2026 08:49:12 -0700
X-Gm-Features: AclHuK8ArPPyVq2VR7a9J_cAO8JnxOht5cqOTTCqGSMKEEjFRnimUwpZuWxMamQ
Message-ID: <CAJ8Y1dQK_zn1Uea7F9BfMOr0j=UG-gXdUXOj-btBfWG0XGk9Rw@mail.gmail.com>
Subject: Re: [PATCH] phy: phy-bcm-ns2-usbdrd: cancel extcon work on unbind to
 avoid use-after-free
To: hyunjungg <hj351016@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	linux-phy@lists.infradead.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001adb7f065fd9e821"

--0000000000001adb7f065fd9e821
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 3:03=E2=80=AFAM hyunjungg <hj351016@gmail.com> wrote=
:
>
> From: Hyunjung Ko <hj351016@gmail.com>
>
> ns2_drd_phy_probe() schedules driver->wq_extcon (extcon_work), which is
> also queued from the ID/VBUS GPIO interrupt handler gpio_irq_handler().
> The work handler dereferences the driver data via container_of().
>
> struct ns2_phy_driver is allocated with devm_kzalloc() and the driver has
> no remove callback, so on unbind devres frees it after probe's resources
> are released. The GPIO interrupts are released with devm_request_irq(),

This description here is misleading. I think you should say, "The GPIO
interrupts are requested with devm_request_irq(), and so released by
devres".

> but free_irq() only stops further interrupts; it does not cancel a delaye=
d
> work that is already queued. probe() queues wq_extcon with a debounce
> delay before returning, and the GPIO interrupt can queue it too, so on
> unbind the pending work can run after ns2_phy_driver has been freed,
> dereferencing freed memory (use-after-free).
>
> Register the work with devm_delayed_work_autocancel() instead of
> INIT_DELAYED_WORK(). It is set up before the GPIO interrupts are
> requested, so on unwind devres frees the interrupts first - after which
> the work can no longer be queued - and then cancels the work while the
> driver data is still valid. extcon_work() does not re-queue itself, so a
> single cancel drains it.
>
> Found by static analysis and code review; not runtime-reproduced (needs
> Broadcom Northstar2 USB DRD PHY hardware).
>
> Fixes: 787f24543c4a ("phy: phy-bcm-ns2-usbdrd: Broadcom USB DRD PHY drive=
r for Northstar2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>  drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broa=
dcom/phy-bcm-ns2-usbdrd.c
> index 171bf09..4b8930b 100644
> --- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
> +++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
> @@ -6,6 +6,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/devm-helpers.h>

nit. but the existing include files are in alphabetical order, so
please also follow that in your change.

>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
> @@ -339,7 +340,9 @@ static int ns2_drd_phy_probe(struct platform_device *=
pdev)
>         if (ret < 0)
>                 driver->debounce_jiffies =3D msecs_to_jiffies(GPIO_DELAY)=
;
>
> -       INIT_DELAYED_WORK(&driver->wq_extcon, extcon_work);
> +       ret =3D devm_delayed_work_autocancel(dev, &driver->wq_extcon, ext=
con_work);
> +       if (ret)
> +               return ret;
>
>         driver->id_irq =3D gpiod_to_irq(driver->id_gpiod);
>         if (driver->id_irq < 0) {
> --
> 2.43.0
>

--0000000000001adb7f065fd9e821
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Kea1UXiDNimY9XcISXAUrVauS3TPqfSofCP4tOVkOfR2zFsciCJ7DPbmanfMXAR2cY6kCgkZCqxY
9Szy6beT2XZUSE9/jFymRSjXZNnLqAe30YCaVeVQUqW9X3NqlPdzO9Ce8AqKdgBlVt4isO6s3zJ5
djaWSUM3zrweXgaVpSRF3iBUxK45Nb0qOkvz0hrBYM2r+iLWR2YbF+Z7W7lw2QMvkbeT1gXn+4pC
K8f1aWKsB9e6Id7uBOkCAwEAAaOCAdgwggHUMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAA
MIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29j
c3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUD
AzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmds
b2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwHwYDVR0RBBgwFoEUcmF5Lmp1aUBi
cm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt
26AjhRiwoJIwHQYDVR0OBBYEFLfOZFpVhKW7s+LOyKdJX5PQH0f8MA0GCSqGSIb3DQEBCwUAA4IC
AQB5Y3tHNG503cqE6g1lZJG3Z1SbuQD8ZXUbYqDNZCnUAd/+zUCraK7TYIOI83X+oof/CscTxVhf
5mazzhESPjHYlC3TLkkxDHQZi06GwKbI00651REpC78vd9dOdZnKnGjpFeDiwJKNxdarSaYiZi/t
6cZD3FIvDaJwYIQ+8HvZOm7FBicC41sMoaxGWZ/tdC6yRoLFckWRvhq0e7wyaBOH2ae8l30V6NXB
RtJd4XemoNk74ybCcGMro0zyBCzQhREo2slK5r/uflroC607XCCIGjLuB6TptSxV97L/9/QSrE2U
4JteFGVwRBJw1s7k8ICf4s22debUZ+OlB0mXjI+8EUDt6vdMeregn5ilQQSsDmBMnz2GzHfV30tb
X92uoE5xui1g4Q3BWkUVwd9wVHaganr3rzc+lQDnQq5cddu1supu3SWp5FqKq36rtf3RX/3zHZ0C
P2pCAlilDHYH2NRF8CYb+gqFySS/PUxwPmFWuD897Hewokex+ux0oZscsuRe0IttCbYfjl/+tSA0
a6Rd+AmkiyASFgEHsLGl6q2OTPYU1PikjUe5RXTp0UC7bdPQXzxaORlh/KWilnz/kV2XblDdybuc
Qz3eVIGvTANnIqPpz94oImrgHX48hMGiH5gGNznLwDBoQl4ZSfvlSi01TcUsYlHJD3LRZWbsh4VG
PDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDCsjlIbQJoxUU3h/cTAN
BglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgFde63/+BVwYQ3iot45CSEU7hhjlsYHou
Hq95AnIxcAgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTA5
MTU0OTI2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEB
BQAEggEAQy3mfwBAGVZZmTdlvBL6ppAw1+qgxeM7iJZEo+e83Oz/hpmfvZeOE1K02i4qeDLMJXFC
PaAV3QNLVlm21UA21SZaPTU2Vc3M35Vg814abbHi1KZiYJG+lCVFbfcLpy5Kxl34jRXVBANaLZYa
CtQ1m9++IjTU5yghtWbjGzua5E/mEr9a+AA6ZzHci9/zxGdH1MugXfVKpqXbG9ynhQOlfngVW5E9
EjoFkDdnBbpMriIedFRpI1n1c8VifAvw7yci2QJ5rjIyjnlpg3GbrdCfpiewCSAdo3+mudBlbC8z
TLKY9um+caWCLIb6vDkEar/20mOO+VYkLTgb7HlJ+dUeoA==
--0000000000001adb7f065fd9e821--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385266;
	b=wbU32R7Mb4IShzE17IMStd7nPxoPiddlo86HEaC+efKht1nHTMlVcYKonpYT9Q813Ih4
	 bw61BVrOzdK9q69lxrFz4U83yVAYV0KJE9s+HFLQeGG4hl3OT/A2quNqS3mt8Tu0Hv1sH
	 L5XEsl/BC5G+Wrf1StpaUJPlmoCzxBT3RKekUM1jPn3wHFLQY7FKY5NGP54hEPJE7Pmzi
	 xPYU5yTSU96VvtpwBHndmHNKtIuOksQYIgJkDmS28ZkXMHHQmFVjZhrGVsLnG4SCt9rWV
	 yIN7RI4p/jlIxLLUSfzcyQ7L1BjydrMZ8AVRDxinQ0oOxhV+lggMT1NRnz4bsu2QXVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PcL13psvRZFQi+EqqGXNhdYLmJXts/aYGQ1HARjBFyI=;
	b=w2ZRLo4P3ZCkx1nBoyQmsrCvAxCWGhzkql6Kg907vfChnMVUogWf17BFbP3IegTWDVCz
	 9fQF8a2Mp9j4zcfkGM058cDhuQqmpgd8GuWqPuycy26ZvoW8crdlbTBcXLz5dEvCVVlDR
	 OhUl4RIAYnT8pRXaXKHa0Qweh2vrofWG9k3DlI9qZdgfEvD/tiJ8nWIU7smnfD+UtUHYi
	 1vTSyZcUVwnsyj5xEFw+E3643TTaueLlELK0OShT80dz390CBG0D1EJSmjps/SinfTu89
	 kP9a1PqSd4lfF/aqvDqkfg8183sWNGh5bZHbhtAmoaLOoS8CfgpliKTLXjkSeLe+sUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HMKbmwjt;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84305606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84305606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HMKbmwjt
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18062135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794385264; x=1794990064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcL13psvRZFQi+EqqGXNhdYLmJXts/aYGQ1HARjBFyI=;
        b=HMKbmwjt8iWWtwtDH7F2kftF4/aOIkaYRJ5poDCsUo7qO84bswTOFmbTXRH/wHmDEo
         zfvz5AkghTzqFutZ6UL5fNtpom9zBDv4jGjrI8fAjGN7uLuHATX61fdCc08c8LIyebLS
         xS5V9d03HTbSqYMi8IWcrhOjToAe+RzsR6LIGV3xIJr6gjWECJicqyr7oEXicv9Az7SU
         79KJ7xNB+AycnBc9l4yLsVDo0kJyRQfI66InOPI75Wg32WyB/U1DIBAfcW1lRZ2ItDdO
         uSOzRJauNW6SPwGugdKMuSHrYvIsd4Zgn5Pm4gqkPxJpOqNIhhRHtZ4iT4s4vKFgkm3f
         AUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385264; x=1794990064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcL13psvRZFQi+EqqGXNhdYLmJXts/aYGQ1HARjBFyI=;
        b=2DEpPTK0vYuXaukNYM0Wn9vOgKRLTY85+/Rb7awdBpEa567rLrOL3uRFnkpnOQqkFM
         81kODEViL+8IMmcCZBSI3/l1f9AgRMF9xAv5uX/ukmKlsZfM5V3vbmt6iD1iiSVcbyvB
         QzJriO/plVvszRGF88rdy19f0XT/J5S0dH2O2BNQFbTcHUPxv7mgjm9NOJLnQZG+XJUo
         2q5tNuZDWEqezr92g34QHjvc8Ul5JTZ/W4YqtzErkrAteAXGUUCRTjPEnDkEUvYs6gEL
         DtF/ZPwWNMrvaBe3yml17h2Z5+5xYI2wveBdhHHMcpvpboZ/AE8rPysrGHbbusU8A1u0
         ao6A==
X-Forwarded-Encrypted: i=1; AL+hErHkkdJLx2OTFloY4CZWcFtjxG5dGJ/m3SMpTNXSN3SXF3xp3wCApksnmiPs1HU3OwpfcOYG9ZqpgQ5y9qY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dN8dMPi5N147E2QjVbYBWuxxmakNx75VHMU83yJML8uhJLHVX
	oNa/44SApT47dNWlCT6GnjwIOBfbNvDZtKP1KjJ3TMvB8MrGVFehX5BFrqiLAY5C2QQ=
X-Gm-Gg: AYBFou3Zo7+X7oDBcSJGBvho4mqeVcs3azXEQQOvuPxQ6+/ndijjoGdbOXVPDvzqRNv
	RL8EXVuFQdtjT63NS7CK4TF4XfnRtQDeIKgt8dFqRrJNq0zQMubUwyxEQNYHJ29PkxUUneBVPDq
	swVYA5M9YjAjAzOedoLxk8FNz0gRqBfsMv9SOEP6H+7MI+XiJWZCjZZ33WOhjeSeTex8JlGlEuq
	zFdqfMgjGidZBOIUwH2Bw4QPKYIq2CnV5fesdK5QsUUOwK+MDmLcOVOk+TeYr//0hG0wvqW2mU2
	32tAqVDuTvmtolpe1VKYkbafDo6jtcTWKu5DDN/05cmHCOJnvvNvFknqnXxzSL4b0pTy9kI7tal
	DycdbO4witUwp27KVCx+NsdWlO4+7TT/JCqbPp+m/5UwEwyI73XGPu+kFBc+iG7xgPaJII3t2Qy
	eeLT90kA3ell0HKoQSa/YG+ZbdR6gBpcrod35LKbu+BTlOyTHQnf/CxmiObYqkzy0Qctf21bCbs
	AHTOX2WrUQFdKWA9E13p7f+DPrlJR8qbVYgrwLJL2V36TsgpogHVKZsIgmpBuHLl4LNpw3kPzTa
	TBI/43b4vENe5sFR59vgjvORgZe81AHCIElkR6vGTNSSsHZ+Oc+of9981mJUdD/l0b/KLamlrIK
	8oLq793XANwurlduWEWn5jSApHyT47prr2wA=
X-Received: by 2002:a05:600c:190a:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba0936c0d2mr28605045e9.6.1794385263638;
        Wed, 11 Nov 2026 00:21:03 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01feee1asm163617585e9.12.2026.11.11.00.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:21:02 -0800 (PST)
Date: Wed, 11 Nov 2026 09:21:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm: Drop #include <linux/mod_devicetable.h> from
 <drm/display/drm_dp_aux_bus.h>
Message-ID: <avQk9v83d-jEGTiX@monoceros>
References: <21c9390024479ec625ca7a2e7a5b959f04d85878.1786032838.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3dpgl3ksduhd24t"
Content-Disposition: inline
In-Reply-To: <21c9390024479ec625ca7a2e7a5b959f04d85878.1786032838.git.u.kleine-koenig@baylibre.com>


--y3dpgl3ksduhd24t
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] drm: Drop #include <linux/mod_devicetable.h> from
 <drm/display/drm_dp_aux_bus.h>
MIME-Version: 1.0

Hello,

On Thu, Aug 06, 2026 at 06:16:06PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Only .c files include <drm/display/drm_dp_aux_bus.h> (see
>=20
> 	git grep -l drm_dp_aux_bus\\.h
>=20
> ). From the device-id structures that <linux/mod_devicetable.h> provides
> there are:
>=20
>  - 8 files using struct auxiliary_device_id;
>  - 2 files using struct i2c_device_id; and
>  - 10 files using struct of_device_id
>=20
> (and no other usages; see
>=20
> 	git grep -l drm_dp_aux_bus\\.h | xargs grep -oh -E "\<(acpi_device_id|am=
ba_id|ap_device_id|apr_device_id|auxiliary_device_id|bcma_device_id|ccw_dev=
ice_id|cdx_device_id|coreboot_device_id|css_device_id|dfl_device_id|dmi_(de=
vice|system)_id|eisa_device_id|fsl_mc_device_id|hda_device_id|hid_device_id=
|hv_vmbus_device_id|i2c_device_id|i3c_device_id|ieee1394_device_id|input_de=
vice_id|ipack_device_id|isapnp_device_id|ishtp_device_id|mcb_device_id|mdio=
_device_id|mei_cl_device_id|mhi_device_id|mips_cdmm_device_id|of_device_id|=
parisc_device_id|pci_device_id|pci_epf_device_id|pcmcia_device_id|platform_=
device_id|pnp_(card_)?device_id|rio_device_id|rpmsg_device_id|sdio_device_i=
d|sdw_device_id|serio_device_id|slim_device_id|spi_device_id|spmi_device_id=
|ssam_device_id|ssb_device_id|tb_service_id|tee_client_device_id|typec_devi=
ce_id|ulpi_device_id|usb_device_id|vchiq_device_id|vio_device_id|virtio_dev=
ice_id|wmi_device_id|x86_(cpu|device)_id|zorro_device_id|cpu_feature)\>" | =
sort | uniq -c
>=20
> ).
>=20
> The 8 files using struct auxiliary_device_id already include
> <linux/auxiliary_bus.h>, the 2 files using struct i2c_device_id include
> <linux/i2c.h> and drm_dp_aux_bus.h itself includes <linux/device.h>
> which provide struct auxiliary_device_id, struct i2c_device_id and
> struct of_device_id respectively.
>=20
> So the include of <linux/mod_devicetable.h> can just be dropped. This
> gets one step closer to being able to remove that header.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

This is still all true, including the statistics (as of next-20261110)
and the patch still applies fine.

Can someone get convinced to apply it?

Thanks
Uwe Kleine-K=F6nig

> ---
>  include/drm/display/drm_dp_aux_bus.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/drm/display/drm_dp_aux_bus.h b/include/drm/display/d=
rm_dp_aux_bus.h
> index 8a0a486383c5..ca8db8ccc1f9 100644
> --- a/include/drm/display/drm_dp_aux_bus.h
> +++ b/include/drm/display/drm_dp_aux_bus.h
> @@ -11,7 +11,6 @@
>  #define _DP_AUX_BUS_H_
> =20
>  #include <linux/device.h>
> -#include <linux/mod_devicetable.h>
> =20
>  /**
>   * struct dp_aux_ep_device - Main dev structure for DP AUX endpoints
>=20
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> --=20
> 2.55.0.11.g153666a7d9bb
>=20

--y3dpgl3ksduhd24t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0JWoACgkQj4D7WH0S
/k61Fgf+LAbxTwzlhn7aNtdrgBrNmIEXSEuJtG7IZWCvVEN6gsNpfpR8LnF0/AUJ
F/q2IKcI3M+Yil/Q9knAmwEOqdJ/w/CBBny580BjLvupvNDD73+HzRH7RvQecYaO
yODn7MWNUTFvHUT6BjJ8d2dOI9ieTLJnKEO8hl3PiBDLqVYLnCG5uP5hEyAv8wY+
10ov9Su+j0QOdPDAyjIGOkDWhOzT8Jp44gwGrUVVfaRRw2QPvM3v/rGxATTv9zWu
D9VgNhdFhR5fk3RF4iR7x/PsvvBBNOkpeLXcoa+kU4i4TWBCZkh7vr26OKOY43pq
Bw/OGmEeE3ZOLA/lahYVsiiYPYRmaw==
=A5T+
-----END PGP SIGNATURE-----

--y3dpgl3ksduhd24t--

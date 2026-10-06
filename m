Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721933D51A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326397; cv=none; b=sB4a8Oypg/TCNnRigCckQ5Zwctvq0sXyfOL+B5Y4IHsIRfpxPbCUszPEIwjJtWjVu5KdqGMXTfShQyh5rMVeozI2WTY1bNOmCB90W6wg6wpl0F0gle7ZsZBsPUEbfuXZ2pXV31UsxAqvIu618ybZSJnNgg6X6UXCmVg8FTBLgYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326397; c=relaxed/simple;
	bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJVZsCqN+/9Is/iUrFGJnrrN/bpNfHxNq/hnpuk0Zwty8h1O0cqoxl4QMo2L3sjcvm5GeUW+znw16nMMKtROAbAq6Leb5Vj9OSKk3e+wGAmtDdKmjykBigSwKm4Xhj+/pw/c/gmNxk+sZssI53N678FGwU5L0pi1lhuOaiGij/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=n5OmXMUO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="n5OmXMUO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso30837525e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791326393; x=1791931193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
        b=n5OmXMUOpMTFQlR8q3KqD9qIFriQA1h9DTmkOzzYO7hQmcJYog+2Xz/YLh/lMD0U7I
         8JA/WkVRDtvn7j3YrkXhNXdbTuMpFWQEyC9SoP0pmw8jVM0wKZ10YoIqcN5d6WCL0VVA
         Ua4qV/9qTdMGcI9Y0t3MZzQv3sbAe4n+rifzmbMvoPNqdLAbobzkQfeQoBhUPZqBlnJ/
         lFK30J+C99o+NF5rPyGven1uzQWyNd5YNaXWGHPTzmAnVkjYqLLs1lHn7P4+/iN86eHW
         I4NmQenpYW7RRgAc0ywyKXE0dDCtvPGjjoQfJCMefpwPu1BfBDaf6tJMyAnJac3DLQ2+
         utvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326393; x=1791931193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
        b=haKz8iqG4QjJGnpjyNTZBeNFB3B93L4VuLeryik/IQFw+1QEAzFSqVuMY90zKUi891
         FVcdrfzX6DuKjKb7OuhTS7ZkF2PSz10Pzlf+JFovIj6Gp6BBrZpQoZ6JIGs/OFLYZg8s
         4c2CysPG7MpIN/YardRi5z4Ar3pXO0SEbelHq5Cg1gOOSG+VWAinlGICltKS2ODTUHfn
         SIKGMi5uvrZ37F0f632ZK7eltViWHqXShsCwoJ/J88ZGbk0H7zqzcrnCXRR57tR6Bjih
         DGqPHFELhnhPT1iTHuWSPs5kJ+SfUmkJOlNopHKyXu5YvhHw/DqSiLXlU7ev4JWJ7qyP
         uHow==
X-Forwarded-Encrypted: i=1; AKwUvBxNCBaQ44V3TMPxAKoY+81rrjy8Gx3c548jfaV9Tb2HsGpB78hxSMs46UHXg6WKrVduVCMYZxmYtnaBV4U=@vger.kernel.org
X-Gm-Message-State: AFuF++mUrw1s1YXHkxHbA5kuSCg+SXxJ9VRz1PYbxQ4XkVIie9uiK0EA
	4IpaMGgTZfxsI6S8o/HrwGO4XKKjbKWt26ulIhHdZkw94UTe7AKiZOkt1rq0261fty8=
X-Gm-Gg: AYBFou1wWlRkBh0MaedcrJ456Bch/kkiOucjzBDqTi9ISK/bzLKWc8Pc2PvLWQoqpYf
	zlE+aO/JSQDxZOKyF9938uvfISGshOnY8Y/ObA6c9Watz7QRTjyMqOPIyH67edaalIaBjzlYqzY
	00DxZ9Nu4U47HtehhbLyeANLQz3kfkAgoGaIac8tJNABcAlr5Ci6ZLfjv/BfnSRYnDWA30TRWRh
	Q1ZeZJTG1sygTrTfcFV13xR4H+HTl4r5bawKR5I1eML23v15wR2M5cKbgk7cHjVZP60/7UR6lfG
	U63PWqy+reWl6G6ZfzqKk1HfFrdsnIInPAgmLCF+ik8yqaAOnnhF6hUHxq8HUyOIiSZG/AjZmcQ
	L+7lqH+IrwlmS74zUG/aT6uGNm/mHoIxvZNrh1lw5a2D4s1u+F1T3E90E3gtcY6whhjErNOFjf1
	HH9gdCnROgpI0+duU07XWjUohESFPg8eg9RmJuP2AmtPVN6YBsWqkCVNK2reS/SENNP0VIpA==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a180660fd4mr3921435e9.27.1791326393614;
        Tue, 06 Oct 2026 15:39:53 -0700 (PDT)
Received: from localhost ([213.151.81.74])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18044c970sm4177245e9.4.2026.10.06.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:39:52 -0700 (PDT)
Date: Wed, 7 Oct 2026 00:39:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Raag Jadav <raag.jadav@intel.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>, 
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alexey Gladkov <legion@kernel.org>, Hasan Basbunar <basbunarhasan@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Armin Wolf <W_Armin@gmx.de>, WANG Xuerui <kernel@xen0n.name>, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
Message-ID: <asV4UKTFRPv4gCUx@monoceros>
References: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
 <179121379654.1159753.4410832336442519712.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7j23svchiupmb33"
Content-Disposition: inline
In-Reply-To: <179121379654.1159753.4410832336442519712.b4-review@b4>


--c7j23svchiupmb33
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
MIME-Version: 1.0

Hello Nathan,

On Mon, Oct 05, 2026 at 05:23:16PM +0200, Nathan Chancellor wrote:
> If you would like this in 7.4-rc1, I am not opposed to sticking your v2
> into -next now but I plan to finalize the Kbuild tree for 7.4 around
> October 15, so we'd only get a week or so of build coverage. If that
> feels like too little, we should defer this until after 7.4-rc1 is out.

I'll look into your build regressions and then I'm happy to get it into
next for 7.5-rc1.

Thanks
Uwe

--c7j23svchiupmb33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrFeLMACgkQj4D7WH0S
/k75zQf/Z9M3Qv+MzXCE+/ArZCIjcf7D1SB/7qYHmlMpHOhpIQCpv43i8PqY8WOv
ulcwbwStLe9f4pjnBVM0/Rm9nby9VZo3bK79LWBMwnwkZORonA2EqgQdsoZdfRp+
rAETMDcFUQ9GUGhN7DAcWMA4xZhjUtso0mWGwtF7ExTFgEpE33GWQUBdTInG2TNI
0u2gVDxfb010LE6jzbHBJLoFNE/8LEPyCVyCCWsoCz+xslpavz8+KA5j3Frpl3Iz
ier5fkw0XOws8piZfouheZOaXqDZ/HcdrhFTBW9mXVnvMLiUaiH05aCOv9h33Etu
n9pm75LVifFbz4hIGjjZonFwBzkLug==
=5U0C
-----END PGP SIGNATURE-----

--c7j23svchiupmb33--

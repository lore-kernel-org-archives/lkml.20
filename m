Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871552;
	b=o/0+VhW9yo+MUDiJOXWbTMyH23cga9VILdy+cJsYj2SOQi1FOlsYZq+B55InPDtSeyTN
	 RbQki6oUxS6cPO0GHCsPzz6LvfSmVvQ3TKCjHluAXUQUADrYbiheAPN0udaW9xsIbE8Ae
	 1GN+eerKYoExc0LKz3259TMzAjgBonfKcTMT8uQYD0wHRE2YHojlPMSXa0RzsxVidO0nY
	 vU9/zznxQIY3yGFlZaemTsiI6zKXi3anBA03oVQAo5kxwkRDUYWKKr5U5h7XNr9cxhvmC
	 2D5jg3t68Ywf/5+Rn5mjVaAF45j3zR2B49a5uTrXCA+aJ5bOZA0PkxXMdkDIv8nhIEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PN04PSX+g8QpPPJaQdcDFzVHTVuQYn9JYXSW2HDFXC4=;
	b=p8Lfx18S4rjySgQosM/2hu3o1IuqqYT/rFPwzBXuMkWcw0EDktqBccyAtyEexmIwgCuo
	 YD+X1OP9c6VzyfwS3sTZyIU6gPFBT96BCwDckBcIoeGeyLMmGIMX5BgLcLSjAi8eaf7xO
	 +dms9oZHH+jVPnGtKWgko1l6rGhirL8MA0xJ31fQ1B/JVwhaDL/lvErXSuohmAsAOtYGK
	 byPR5iOx7DWoRrZENaAH3sEVVYpIsmW69dMCCRmn64CYLwMSujXPq0zVIMjraW+zvBT9q
	 nT0n+lVUea8fPYaU2uCukkKv1gij4ghIXjHik17HlTo1PjqtzqdYj08Den7Frz1KjFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUezxy5R;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBDF606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBDF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUezxy5R
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so406835eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871551; x=1795476351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PN04PSX+g8QpPPJaQdcDFzVHTVuQYn9JYXSW2HDFXC4=;
        b=dUezxy5RwEkfWQV+1g2HSSMQSh42mSnd2b93TMl1JBombL/8VDFmQileeKIC88aX22
         2+TBIDc/ZA7XkAXhgCVVw8C4ASuKnDIHkEFT7pqqHohpSwwkPrFjAkeqCV5WtmbIIn7w
         kwKdypv4hczV+JloWQU/INyj+51yU+T8QqvO9iDBFuDDy+xZHZGnUAxGcam9Pz4rBRT6
         san0O4ykw83Yr3HlpTR+ZKLi+NMo5YyGvCtITTA6cyxYtBrjV/YR62jplUbPQeQF+tBK
         oYCXa0ibVw2AtM6ZIzWzqOkzzShx5mhfqAjZ0HKY8VCtM0fXPljf4OF+jyNll1PkwtzL
         w7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871551; x=1795476351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PN04PSX+g8QpPPJaQdcDFzVHTVuQYn9JYXSW2HDFXC4=;
        b=Gh2uuVrASI71smbCf4VZ9RNK4NvHG+unVYNv9N/F5PW1daxa6GyVkCzl2367jbnaSp
         5+C6QqHuYjdfdIgkEe1P8kxO61772SgCP8aqPPXs+I7N7u7XK3aRH3bP6v38WuN8B6Pe
         5g1bKmCi/TCDjChhlXcINH6iFChBs2PGopfJ8SyYFUdm6FD2wVTtRLIg8VoTSbM0VSX4
         1tU98cUvGVTrTAfVGsg9329Z4FVj/ukzeuiC55Gu6Z3EWuqV3b5kHCiMLSMIjINg632C
         cOlkJGPVw+BLEzq9lV9YPywuFGpqlNZQ6NLRuxoiEe0HbDLXHbo+9SAA+6GAvFu7bast
         CO+g==
X-Gm-Message-State: APuU4Z+BBkoRGAKYJRDjHPe2/xFkYPhJkQjuw0Q9m7ExOxgD6TfGm9MB
	UReFWtLNi94aX8wggw5QYTCOudMUDuXWyrJQ+2R10z3RSDQioiNJX5jS
X-Gm-Gg: AYBFou0GYJXV8mbZp5Rf6GYoJynm2qXe12m/C+sbsQoN7UMXZtwNNwrXH5zDcvv6CCe
	2cIDpDTMVDIe3Pebx/DlRFUh1FPZpRkZrpXjktMZpeehg9FONpbVADq5clfrbRciZ1AH9A0aN4L
	1+1KUFzlMyC7TKZUsgWQsQCL8qELcot4UvncTlZQgYFLQ5efs5lDtkSpxmnuCNrkQIunkxpvrVq
	M+pS2Zzz4hWWdUzMuaT7JZ5gE4Y33zPOSBkinSPJhTPuwfbwVRBnc7YJky9zNBvQwsZnLfubWcS
	lIDmnkTSoexf/lM3qAjIM7H7L3XiGMBBioUT9jAa03iqYeZLc1khWu+A3mpptwUY0xcDqvVkQg1
	e6uBK+PFPRlh6D7zBzpWv8IRWFmym6XLEs4hwGKpWdTR8/e4zHh0PCSTUYF/7XQ6HFNlXtu4/aJ
	ncpEkpPzU8GQmGMPMAPRfIE4OTevsbt2F49naWX9Qp5oR8dmqgHpdYozTBxFHvChVqWcrmGRxEs
	E0Ln1ZkcVfzu3IJzerdPZqp+jyLMFt+Z+hxHKJ0aRLRHVHYRj8S7nnVVHFIMg121yfu4mFXBVlr
	BzDoDrQdU+89rsu0v9FL+aQwtUc=
X-Received: by 2002:a05:7301:70d:b0:357:ee3a:267a with SMTP id 5a478bee46e88-3810bb5a7bemr909668eec.2.1794871550628;
        Mon, 16 Nov 2026 15:25:50 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm33489188eec.4.2026.11.16.15.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:25:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id BFE0F420B801; Tue, 17 Nov 2026 06:25:45 +0700 (WIB)
Date: Tue, 17 Nov 2026 06:25:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] power: supply: rt9467, rt9471: Escape the asterisk in
 ABI documentation
Message-ID: <avuQ9A7MJwgrx3y3@archie.me>
References: <20261116034200.14045-1-bagasdotme@gmail.com>
 <pndld6taqgi.a.out@axis.com>
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
	protocol="application/pgp-signature"; boundary="ujQ/f9H7VXVBL7vn"
Content-Disposition: inline
In-Reply-To: <pndld6taqgi.a.out@axis.com>

--ujQ/f9H7VXVBL7vn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 01:52:29PM +0100, Waqar Hameed wrote:
> On Mon, Nov 16, 2026 at 10:42 +0700 Bagas Sanjaya <bagasdotme@gmail.com> =
wrote:
>=20
> > Sphinx reports docutils warnings:
> >
> > Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline e=
mphasis start-string without end-string. [docutils]
> > Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline e=
mphasis start-string without end-string. [docutils]
> >
> > Fix them by escaping the asterisk in
> > /sys/class/power_supply/{rt9467,rt9471}/load_switch.
> >
> > Fixes: 3f21de6784a654 ("power: supply: rt9467: Use POWER_SUPPLY_PROP_LO=
AD_SWITCH")
> > Fixes: cb012fe405f0f4 ("power: supply: rt9471: Use POWER_SUPPLY_PROP_LO=
AD_SWITCH")
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>=20
> These have already been fixed :) [1]
>=20
> [1] https://lore.kernel.org/lkml/cover.1793225920.git.waqar.hameed@axis.c=
om/

OK, thanks! I'm just refreshing my patch submission skills.

--=20
An old man doll... just what I always wanted! - Clara

--ujQ/f9H7VXVBL7vn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavuQ9AAKCRD2uYlJVVFO
owDXAQDvUVBLkHe5PSdcyObK04zf646ubgT6dr3eRI0dQjDMogD+L2HRgrWp5m0F
gYXsYAilAPWl5iJ2pu5e5HtsXzXx4AA=
=P3l5
-----END PGP SIGNATURE-----

--ujQ/f9H7VXVBL7vn--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295561;
	b=r7wx/DAbSm/3DoHeZmjbxDWMFC4zHN/R/sxqRYzq+jAvVN77mcLvpYzPcqlbsagJAQIw
	 kCk9zdIlvGfeYA9QPBllWLJ2Ta8Wa0Xb6Ov8zPD3AHTrVfHrDyw9dGnUR0o0tysUmctcI
	 xQwHF0btxfnq0RoOlrvfZEUuWvY4I5hyOrvVyIpQ5WqQHw3nEi0tt5kXSdnukNx1kyoeJ
	 1txn0lQQBHqSKmOzDpFraWIpVqg27sXeZevJGZaaHN36QpbfKXd+/WzjYwW2Oa84bPEWy
	 MC+bLNkTfsn3zCxGwjbhNYhPRfyXklEmeSTyvp1H1A7wc+HTjHZjEknwotY//sutFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
	b=TQz03W4ybxCyiKPD5rChv8L3Vn2ntC8gNeRyiLdQbsFLbwSDyiZv5ujFDwM7AyYvFTjC
	 wrvIyYREBZhzS8dMbERr1hjJiw+deDbNymLMWDRr4TFMHBnl4le6aZzfsVCv8uoiGVZvF
	 afh4gY0eUlumpG+mJKLGb6dCGgla+mVuknt4+NfKZ/RDLY4l1rY+mGMbPWWhHpgCJUcWz
	 ErT1W2tscHiw08qk31BmEm6MOf7g6iKcNmGpPuB2ecXCi0o6Ofuteq/FrbSRhh9AwCvuK
	 HUh8Ujb69oABCjRVZ9N3ghu90lDNdGZq9BIQ4ouTInHZgtROnwzJAgT9BiSI7Bk01bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bsTu7zHj;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3177E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3177E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bsTu7zHj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so26995675e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793295558; x=1793900358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
        b=bsTu7zHjbgIVlcHu3NdjzeuSwabHni1qavw0nf+vr+ww9Wf0DF9C5hRTQELcgbXmh9
         feMgPO+/4tuqfM8ixO/eOgEEjtNreGPgAQFMyJwZGH31gCPA1n74OCu78wEQuUZoxPXh
         Re0mAy8xwDeFS3W/iijqPr/xJb2HHbT2yciOMm7efix+tZrfT9prkpxTd9JY7KQjvAt4
         sQg0i8d3h30HmR9+SPa/U/tlmYQ4fkxmwUYoEQ1gPwZKmsX9wyL6HwJJwbzHysHJ75CY
         FWzJFc/y7kOJL6bmMp5QnxrAGBolDX2zhVB6gPNxL7iaL1nZKqcqSRkz4lxY9EZWDZ6X
         qotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295558; x=1793900358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
        b=qBNDbRJEuwXQ+JMyECIAq5R3jOGzxG7qfXkyvjsEH66EAT0Mvc9CuT7AD9LT2UQxIt
         aF2jnaZU4jbwmKpu/0KwP2Ork5VQ1kZVNh3c13IUcvNHZNsDsHvLerzkjr4bwWEH5IQN
         m8Ql5f9Pbb1ZO4v1sOxvR3pVE12MvvuT2MpHUu0aM6u6DL3N0LvDJx0Y8YD+Tu8reebD
         l/u2qDPuD5AIMZFjGbG1OiLTrMnUko4iApW3U+i0oxSG+qfyOYps6Zp3jeoMlu2fe11Z
         6gqotAkc0+A8Q1lEndtaB8N8vvu1cvl39WENaRtcZHIOuFMEf7EKQtS4tKn0IIhQgBA3
         n2vw==
X-Forwarded-Encrypted: i=1; AKwUvBx80fk1d/EQfwKnd6XcnWe8RCQenl2G3VzZZ49AIliy/bqERJY89QKSPXpf2E2wSuCKEayO7H1jUQzxId0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYLtPL9wKbBKEAX82r2/2pXI4+Rz+/AZzGULL7mkqF2+A1Td9x
	WOK3lmVQwNRIs5P8UzJuiATMyWTQfs+OGIJudGEY/DMwuCcQgFAwFWDNwKicPHPyHEs=
X-Gm-Gg: AYBFou30NAsq7Py1KlVMQDaid16l6FMCYlZ3jJi7XZRZibjJe8rBiEvkrm5Jjrp3sFB
	oXuwxOk+Hl3LSinZ7bnAe1c3VJex1YpSYuYnhEaIob0xNwjWUALpmBuFzrCWBUGXO3XnF5wSQKL
	YImILL7McbjM1WQ08svFPkiBFoR82MtNsNivg0bNrR+71aGIZdaDnqKnjMip6zaVa2YjOs3NfqL
	tdlIIKeYbR0f2BnVZSFrGhnDRCttIp2zJ6MjevQxICqNEbX3LLwjHfBASiu1lviiH4TSw9Kv0R3
	IayWuOB/NjceX86G6VetLS0u9wF3RAeuRO2GnNlRDE1vq+4UKVHBCYCQEMfqnyg0v0d+XAaMU5H
	QNvXe+izJAualtMWqmpkGxJHDiM2JzELH+7Lv1f+W+qAF5vBIRo4LoELE+qQWVokMi1ATwL9diZ
	ic82kiwH7H046sW9B9OGkOvrkYAfMjkLqPV3biNDZcq7SM1MMT+RZNshza0RhCVAmazRcXO48MP
	yUdOUY4Rqen8BLOLwhZhFXgh9ecmhPcvMGWoZVsFn960GPKTdIJS/9N8RBFqdqKHDgPqEOfagh8
	MWlPUB+zmVc47jxtZi9PljDTNi8yUZOiH4c=
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr135986785e9.10.1793295558589;
        Thu, 29 Oct 2026 10:39:18 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e6df1e458sm627445f8f.5.2026.10.29.10.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:39:17 -0700 (PDT)
Date: Thu, 29 Oct 2026 18:39:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
Message-ID: <auODHyLrfQylISX2@monoceros>
References: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>
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
	protocol="application/pgp-signature"; boundary="l6fyrt6fnoykrkwe"
Content-Disposition: inline
In-Reply-To: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>


--l6fyrt6fnoykrkwe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 02:42:15PM +0100, Greg Kroah-Hartman wrote:
> This reverts commit fcbfaffee51a452cc8efcbaa3b88ec4595678424.
>=20
> Turns out that vfio is a crazy beast and people have been "relying" on
> the bind/unbind debugging feature as a way to handle passing through
> devices to guest instances.  Because of this (https://xkcd.com/1172/),
> let's revert the feature for now until we can figure out a more agreable
> way to handle this such that normal workflows do not taint the kernel.
>=20
> Odds are something like what Uwe proposes at:
> 	https://lore.kernel.org/lkml/cover.1790612298.git.u.kleine-koenig@baylib=
re.com/
> will be the best way forward and will be revisited after for after 7.4.
>=20
> The feature was originally intended to stem the flow of unnecessary
> fuzzing reports of "broken" drivers where random devices were being
> bound to random drivers and of course things were going wrong.  The main
> syzbot tool is now not doing this anymore, and hopefully no one else
> starts it up again (but in this madness of LLMs these days, you can't be
> sure.)
>=20
> Thanks to everyone for telling me just how wrong I was to implement
> this, I appreciated the feedback :)
>=20
> Link: https://lore.kernel.org/all/DLIL9H50MALI.3JROXYEEUM3KU@kernel.org/
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> To: Randy Dunlap <rdunlap@infradead.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Johan Hovold <johan@kernel.org>
> To: Steven Rostedt <rostedt@goodmis.org>
> To: Masami Hiramatsu <mhiramat@kernel.org>
> To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> Reported-by: Michal Pecio <michal.pecio@gmail.com>
> Reported-by: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/admin-guide/tainted-kernels.rst | 52 +++++++++++++--------=
------
>  drivers/base/bus.c                            |  3 --
>  include/linux/panic.h                         |  3 +-
>  include/trace/events/module.h                 |  3 +-
>  kernel/panic.c                                |  5 ++-
>  tools/debugging/kernel-chktaint               |  8 -----
>  6 files changed, 28 insertions(+), 46 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentatio=
n/admin-guide/tainted-kernels.rst
> index a208811ad525..3d312bc17942 100644
> --- a/Documentation/admin-guide/tainted-kernels.rst
> +++ b/Documentation/admin-guide/tainted-kernels.rst

It's not part of commit fcbfaffee51a452cc8efcbaa3b88ec4595678424, but
conceptually we need=20

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/=
admin-guide/tainted-kernels.rst
index 3d312bc17942..fcb8b9734548 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to th=
e aforementioned
 script, but if you need something quick you can use this shell command to =
check
 which bits are set::
=20
-	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i=
&1));done
+	$ for i in $(seq 0 19); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i=
&1));done
=20
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

in this change which was fixed in commit f1850e443b0e ("docs:
admin-guide: Handle TAINT_FORCED_BIND when parsing
/proc/sys/kernel/tainted"), but that commit shouldn't be reverted as it
contains a simplification that we should keep.

Best regards
Uwe

--l6fyrt6fnoykrkwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrjhMEACgkQj4D7WH0S
/k7pjQf/fZLeX4jg8q6vdwBmv7dGxKbev3ARRZTtVOacOQwftIek8l6UKQWlMwoG
/tiokVc22lkSxsHq47w6eKUKpucHydGzT8Y7OZvHNjOjZ1o9WS00lJRh6uhVTh06
MK6k0za6dBbrOWnTBeTGZuWlLCOQKpDB/6t93V1fIYYJSd0ir3GpvVZzfM16Pk0d
opyBimIxlfjCuxzRbj7DZjzv0I5PbjXdox41VKx2cx60OzFJdN0MKZifLp9yNV4s
s6Tc4Q1oK/Ih66hhbojNkTp6Xyzsy2m0lvku9N0DitT5/VXqoI/mdedlPK7tFWeh
qZAoONEgzf9TmSM0/P2g0K+1mpLkrg==
=/byF
-----END PGP SIGNATURE-----

--l6fyrt6fnoykrkwe--

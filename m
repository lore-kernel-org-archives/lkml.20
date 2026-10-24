Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827177;
	b=OYv8gvqATibCxX7dP5vrZOGALQ2fuw6OBTZaTR8QI2jFankCAFxw7utFM103P5HSpkZn
	 ntng4Lz3oJ0Rki/fdj8QiCrtccJeHgzFTZYVCHBX2i3hOJ6fEmGrP4XQn10ULGz6ZX4tV
	 gmcDBOY95OMIVp8HiVH6apgTcOHCUoVbLmP2cmubtmBNxLUg4HwGJb7ytohpZ1QbO3z5h
	 cNBDfsJF+jnZYza9airS0N6JkbfSyqcr/fVCe7FxBgb4/x7nBCuqou7Oq94swUIeyowT7
	 UDgykSDg5g+yNEPOlulQQCnDYqLvDgVWFdhMIGvvGNccwezbtrkfqdTkOR0J58lFy7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
	b=1T/ioFYBlr0S1SJh6Aopu+efxwNCqIeonT8E6t/8xrgcLypuAKQrgPDkBhIZltfjZt5s
	 waBae78PrYF+4PA5PG+Kgwl54Y0n5Ft69PMFvBIzC/XPkWEQfitLg+g0XLzOjBsjayRX5
	 TeVzwzrXbXRq09bzM/yeeb6QOVYZuKgwU2lsjO9mkDTJbEHFvi6lazbxOBHw4LgT3dNT9
	 25o0cQKjp+iXgZ3mB/JbrCU9DMuC4yv6qMN6Yjq+fCXeROxuVXBwVlrbhte4YKd4zc3ml
	 tHHe7PotHKefZCp7Jmlc3Sf0hYog8WRnK9RD6TRNWNdqBVEgRE4f8NNHTqlOz0SD0Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bIDYtbOn;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE5A606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bIDYtbOn
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b060ec084so956500f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792827174; x=1793431974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
        b=bIDYtbOnPGADlrjGilR6HlFVpF/eIp31wIxr3wVKS/McxWVagsZZJcNMwIGOaDkaGh
         jPydXHn40ca3LBrlABACC/cWWoUxiiNQ6K37TuAZ9OwdOWByTtGVMcTPttbPs/rrEPpo
         lJ60v1+90zWJIUQbjPMADewT4OKMmnJWfpxYytolFHNH7DWkKldRUsZyWrhDofT7/PhB
         hnOIsKB4wTNr035cZj+SICgnq++LdGkxL98N7LJaydych2gY8QLXItAv1k93WeYHehTv
         Ds3pnjJrMgM8GsA9BuPW6XaI9nQwpsSBGPGmFcNOQnnUl7tbCIZ3e6bA8AfUd7KMXs7D
         IkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827174; x=1793431974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
        b=RDKd4iIazb6WWL3VwMOIE4nPFv/leGUIm2M9xSc2vhBAJhymEFcBHLw8Cfkwp0Acgy
         Vh3xpiPK4zxDXEfoq1aylDSpdcZJMlqrUuoFFiWEsetANv5IVo6xYuy1ZVHSCvlWb8bC
         6scUmzRjQ3HfuX3gMDCSSTdk+xGUO97b/mGe7O0LrOU7Ko8FWj4qMl1ObXfOlf+94Mgl
         h9rztXukoj1tuUTl+RgZyV3nW1TeHm6EH3pGc04PwHiLVPzwd5cvJj4mkwR29rjMvSqV
         wNnnWu0HznFKBbK6TES8dwr/vS00AJwAAW8McztjWGjapU5tFQ2d+rD8XCUlaZQCMHhL
         OI3Q==
X-Forwarded-Encrypted: i=1; AKwUvByvozXxDfxCApfr1zFOXb3NpJSuO47ymfjNF0r6SH3FSBuEULfNzk9qSZgT5Ms1IFtdorjzXS5cGzeHw0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGU+BffU+r8l1v7VFDy0lLuZLC0a7PmO/pDt2Yi92hZbGKOd6l
	nID69NJP23YjXbFnL4P9qSayamY/LQTTj1GvH9Yxzp6L6R/ySlld0VgPvF6r6BaWYss=
X-Gm-Gg: AYBFou1OF22888y2RdNYP1fvPl65Jjv+r1zvAHOj+hjcQKgpJZm4Cl91Dz4ZAE+tO/Y
	UGot3q0Te1A6Q/Kx4O6vwO37vvDyZcxZazLtfOdXe1XmrLboHIeSzJS+Thtn/NdDZbcIyxpomSX
	qNlv2DDS+ndBtcC35sKkQOuLaY35BmHmdcaLgiuvJb9C70cKEqCBv99yzZX15hMxEeNVQWST+gu
	uck5vCJGS1kEcIMRXfAPQML02FolyasHp5cZvfnXRYEJb1rHVkF7S5zLWXPlvPCgyTecdZZ7Un5
	K8Sf0V8phMrwL0mc/mVkKjXOzpT/p1smBp3qUr+tegpiK7IUc85N2c7Wi8iNcQDhZ4yX930mnYa
	15ZZErGxrbGmhA9mf6abiw7Cv3EtefP3WD4q0V0VoUxFuqnDSWinvj/P226e2zFJ4X5vuQLo8Ce
	FxJInA1keSJvFD3NBeZvXqY5mfyvhKEjANFP1OtZyPEd3gzCz9JJp5IAoYUm5vHydDHmnRDwax/
	VZzK5Sa3+zQk5rv5cFGLy3uf+y+nJ8SiqsCaZdt68o53XUTq88F4Uimr3dxoO9Mdb3MOco5wuAp
	skCB8Qrm8/Bq5h47phOHnVXwWDhVhIWZ4xs=
X-Received: by 2002:a05:6000:40e1:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e3eb9263fmr1987532f8f.26.1792827174053;
        Sat, 24 Oct 2026 00:32:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd35c2sm2752126f8f.39.2026.10.24.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:32:53 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:32:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>, 
	David Lechner <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Thierry Reding <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <atxdQ4vfh-b6GD0B@monoceros>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
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
	protocol="application/pgp-signature"; boundary="snd5d5o342ief275"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--snd5d5o342ief275
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello Greg,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> We have real problems with random "bind/unbind" attempts that this taint
> is here to help resolve as it was creating hundreds of false-positive
> bug reports on developers all across the tree now that the fuzzers
> decided to think this was a valid action to take.  Without this taint,
> people were being forced to add hacks to all drivers for this which is
> not an acceptable solution.

Why is it false positive? IMHO unless it involves a driver_override it
is a bug to fix. So have you considered tainting on driver_override
instead of bind/unbind? You did, I'm sure because several peoplel voiced
that approach already, but unless I missed something, you didn't share
your thoughts about it yet.

https://lore.kernel.org/all/cover.1790612298.git.u.kleine-koenig@baylibre.com/
would be a suitable thread to share your opinion.

Best regards
Uwe

--snd5d5o342ief275
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrcXyAACgkQj4D7WH0S
/k6DIAf8DAU1k1OUjt0oOb7bxXYD1+h/zw0y3dtkGS8G+zRTS/qzzPPjfmqRP0h9
J5L7m6Y88ojmkEkaTuZykFHJjTD0oRB1HPOJTgCW6xGNMm2ZWeh0nTUKgD9H5GY7
w2HgqDafsFSbrwjrivGi8AGwp3WErwD0r+kOCr0MrPDA9d4RxztnKRXgDPP79VFz
52dVyEVot3hTvhqxMfO0yLVcwGhQaO5VnfAGO3zqb7oOJoL3MzMUVk3Qo8NuSz6R
zP04L1Pg9uTjUgCUKeKGGkzd/2+nMfGXjUGnId1rwsRI7WfBXP4t0r6JIOZsSNIY
RuU/lvGyyvYfTEwZjc1S5kWfcRrIdw==
=5xdK
-----END PGP SIGNATURE-----

--snd5d5o342ief275--

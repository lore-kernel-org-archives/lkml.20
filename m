Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C347472075
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799562; cv=none; b=qpqzOTRdAPNGNANVQRYWpODKsDdbM5FI3XoIjFHDOl4MuXtGRJzvfxVqXPjKtzAoohP8bRokE25M5NnknixJBJF1DHP6TB6+VuRBjEy+xQbi3Khe6wExhsl32IVcxGVSJFP6f6Xw7rdOzuxxjrdFYMrI7BPqCSYa5HYCykvj4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799562; c=relaxed/simple;
	bh=nQY+dkd2goVTCIQrl1D8DmJBUcETTbuQIxc4GvTWaic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/tBrrwUYpwzKxRGVxLUH6LWrqvp1UwUtwlSjgk47Ur1p4OYo4b8lNDbSnb0EROofQBRKoNZ3HNTup9rEf6lV3emNCMYK6Op+LrJvmRVSnLdaTdiwuqzqFwUygb+esMAOLCWKUbzwKy+RTL1YsTQATAbA6JoojMYnwE7Ie4OwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6M2O3mj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GxLDu8zH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6M2O3mj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GxLDu8zH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791799553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gM32j3c/6k1T9DJjaPNm2Usf6gwsdJf8L04anPnbMP8=;
	b=V6M2O3mjIxq8DXrYWhX/oJGgA6Mptqga2eq9jAbMgoeUJPiPuoxf82jC+8fYcoEToWYRiV
	psQ7c2jgIO4DCcqgp8GPOBc/07oU7BjEg/mVI9edqEWGUq9EzbJAVBwNf/sve93yEMhiNP
	z4dAKMx+EB8z3oJQsx7CTYeIBe/JoZU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-huaPBG3jM0qYD_XvwGtSCQ-1; Mon, 12 Oct 2026 10:05:51 +0000
X-MC-Unique: huaPBG3jM0qYD_XvwGtSCQ-1
X-Mimecast-MFC-AGG-ID: huaPBG3jM0qYD_XvwGtSCQ_1791799551
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so184361685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791799551; x=1792404351; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gM32j3c/6k1T9DJjaPNm2Usf6gwsdJf8L04anPnbMP8=;
        b=GxLDu8zHyh3eMOawTERBuoQ5zfWt+qiwuJ8OKMs58u7GPKeHKwSRQLP3NeKmvqCNCd
         O9rRDb1tQBjy67LxiwfVwON+G4MgdIePqqgRkQe9JmntZrgHpYEMYDawZdaMJrcgp+u6
         27XnfWKTjeqcRHkfb3LgP8+9GvHEBcU/mDJCmlwN7QJ2zlamZ4KaWFSsPPDtg6YaNYr0
         Y7eZUiKttKrMUqibtpsuzXeGePR/V8Qjqx3BJbRMoBaFYN1nFjEsGiRo2HhRT2NRyJlP
         +NO1AJClOk+ZYySYaT/K2CUwocBt5y5q0yhPLt0yhX35O0idUC/iEROR+ijse/DaUh3I
         o8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799551; x=1792404351;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM32j3c/6k1T9DJjaPNm2Usf6gwsdJf8L04anPnbMP8=;
        b=QxKwrosDbgxtD6yntSPDK3edAg/igj1ecTAnSRR4DLTyRQWVigYyg+Biul7xp58/QL
         fYYdfoSXIMWYFI3Vs2KokQgA6UcYAaN++nRzcqRF7uk514eDHIQheyvuGYGcEAXyXgEi
         TOrIVl/aN560WVazgZnEXNuym5CmlMFOOGl9ilIsJoP3aFaAZs13S7tIeJTPwbzTkrno
         fRAhySDaLJxpq9OQNCvPV/3Skhaljruhxmesy4/Epo2mlC7nGAjvaBdrQiqGhoLLyFML
         W+yMSilxq8j6G0Cv18byZkTB1VXOjNHUUKJpQu5LH+L2FzTlHgLayaO08oEzjuZ9V7pI
         F5jg==
X-Forwarded-Encrypted: i=1; AKwUvByNIrqIFQJUj3NBk3nZmxDWllSLzHh6CEOu1n/Jzra6hsxwo1KTTP7OmKjTAX3nyzf3lt8rMQ9Z54RjLQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBpiBIWp32+kgmSmWBSyLVskHQf3Nz3AIbbnxxUOnfJ6/sv3yq
	zwlvYxHttXE7YcQC2QldZDzApeRoO08EpFRfaRTBh4DdZTFJnC38AnO8+uLzW0cMzLNgmJ5yyQV
	vKETbGQxj2XQu+Aoxw2jcycLjKy2AQ6wrOaQgpG/3CaCL7iYfVxTSgxgKVKET9fNo7Q==
X-Gm-Gg: AYBFou1TAfR44Y6saVP0mqDHB/Az56BD3z99GL9DG3GAmYBWPC55x+InmxVZZnhgTRL
	TBVojuLRvr90QnK2gZun9n8ACApZfJq+86xIqOPiQQfoc2BEl2RF2sgk4qy1oPq3wN5EiSkgs2z
	pi40jjsIaHWlg9t+q3dF7iSyXXP9nkzdIpwfhgSWsFyPyT4eBB6wt5vwD5OEMfUIKjtft4f/GzR
	JCCFJR5T03OQDkpZtszXb1QZPPPlc6gFgbNnfl10spZKEWfTltGlkJjQzxYJFSICPnYUz1ZcsIe
	FEZOhXHrIvxLr0nNRCLxiJD1zM02YewY0egtVHmirDvEzdaRNBW7F5sVRIgHeAxjynPrKpN8QAC
	Jq7l1+N0Fsb0J+eG0y6ozSH3F8a4ZP4J2xdU=
X-Received: by 2002:a05:620a:7017:b0:93e:e651:5b95 with SMTP id af79cd13be357-93ee65167e2mr322914785a.30.1791799550725;
        Mon, 12 Oct 2026 03:05:50 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:93e:e651:5b95 with SMTP id af79cd13be357-93ee65167e2mr322908785a.30.1791799550188;
        Mon, 12 Oct 2026 03:05:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984889fsm828780685a.13.2026.10.12.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:05:49 -0700 (PDT)
Date: Mon, 12 Oct 2026 06:05:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Albert Esteve <aesteve@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
	David Gow <david@davidgow.net>, David Gstir <david@sigma-star.at>,
	Eric Biggers <ebiggers@kernel.org>,
	Eric Chanudet <echanude@redhat.com>,
	Francois Dugast <francois.dugast@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Johannes Thumshirn <morbidrsa@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vlastimil Babka <vbabka@kernel.org>, Waqar Hameed <whame@whame.dev>,
	lpcosse-keysigning@baylibre.com, users@linux.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <asyw827yeYmzQflV@redhat.com>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
 <aspYFzgcxfOvOUrZ@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DvZJssh5pd/DBY8Q"
Content-Disposition: inline
In-Reply-To: <aspYFzgcxfOvOUrZ@monoceros>
User-Agent: Mutt/2.4.2 (2026-08-30)

--DvZJssh5pd/DBY8Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 05:31:55PM +0200, Uwe Kleine-K=F6nig wrote:
> On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-K=F6nig wrote:
> > For the procedure to actually sign the certificates, see
> > https://baylibre.com/blog/pgp-keysigning-2/. A bundle of all

For anyone on Fedora, here's how I was able to get caff working.

Install the pgp-tools package (2.10-17.fc44) since there is no
signing-party package.

As for the mailer-send configuration of caff, neither example on Uwe's
blog post worked for me.

- $CONFIG{'mailer-send'} =3D [ 'msmtp', '--account=3Dyouraccount' ];
  would fail with that msmtp.pm couldn't be found.

- $CONFIG{'mailer-send'} =3D  [ 'smtp'
  would just time out trying to relay the email through kernel.org. I
  probably had something misconfigured on my end here.

In order to get email sending from caff working, I had to:

- install the msmtp package and configure my ~/.msmtprc file.
  Use the following line if you want to fetch your password from your
  password manager.

     passwordeval "pass korg-smtp-pass"

 - In my ~/.caffrc file, I set the mailer-send entry to:

    $CONFIG{'mailer-send'} =3D [ 'sendmail' ];

- Make sure that /etc/alternatives/mta-sendmail is a symlink that points
  to /usr/bin/msmtp.

Brian

--DvZJssh5pd/DBY8Q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSkbTJwWGWqPd7cKQS30t0nXX7AhwUCasyw9gAKCRC30t0nXX7A
h+INAQDnRNFUNmnjZYXHMdPylUtKHJvcIjNtms5bnsimWIou9gD8CWOausGkGX1Y
grcOFsuJVso9ddqkjJA/0CA+h6lTgQk=
=AW/1
-----END PGP SIGNATURE-----

--DvZJssh5pd/DBY8Q--


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630085;
	b=UMa98AOjtv8bqask3LGjWANRsWZlB4sLdWI3JDTlyZhaNBpl2yGWbaBFH8I7Ixyk6yC3
	 UEmlxlDgo9q28XLaQXi8z3e7c6fuEBF8KZqz9NAheiCgzLm9ZoZD6dYAiIQnNB8HvFlx9
	 I8cy9XQ6TpAkv1bHlTcVuHoCLcASqxfVQaeBOQLBTOLoqbfMqJh5Rzq/xvMuT0jm5K32o
	 mCYBR7Bep1DyDXFj7COzAS7iSPYP8s6aD9biJeRbROLmWBgOvdUOuwVh3qP0X5qWx5UbE
	 q2ue8O8k1W3eqsJSXvvM8ddqnuVGrV5nNevtFxXdEPQ4xnfD9P1Ma+q8Sg0OFExK/eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630085;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=090k3TlRajsth1XEyx/HYuI+wNDJ5fHp2My7JUfpVPk=;
	b=vCraRZMrRjaSCv8GQTmRNir1jgMuRwvITBWQ4UNl1yqHhQWlEjC7ZLugAchoSk42lSY0
	 gOyiS7lW9IuLOetCUDveGy7N0eC60H1hXEoo9NrNW92ICCyONuOrU9xl/ZqHUTiARDESq
	 L5ObhgWLaRi7J/l5qOjgIKt4g+NUdv+gnrIRG9shGwrFkm6O2dApNZztndHySL61elWxZ
	 VgUhDgxF04Eynq9f8Qu8tNUz82LWzNuatwgyMaE8p1T0RgXdFHQGFChfNHnm5yd84afG+
	 jWhjH94PYwzXTE9XF05/XlZSlIFZU6+SIZjGhsOx4Y/UNdkLT8fSWWreNmvbkda5WiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hJXjvv5Z;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B47606B929;
	Mon,  2 Nov 2026 14:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B47606B929
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hJXjvv5Z
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0B3B640917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793630078; bh=090k3TlRajsth1XEyx/HYuI+wNDJ5fHp2My7JUfpVPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hJXjvv5Z0Fo3j68sPK8zoNHPYR8ykGiw6JQe1Ut8Bhcfw1eXnHYTHu023K2762B56
	 dT/y++Xkwp9MU6GLjxbXYAepZZqGU7eLF43MQk1iaSZjs1EM7ihecJzKC7SDdw2vnb
	 vsj2qDTDtr1cJJG0KKLa9ssz0wCMA440D2gUE5XRR1yJTmGWHb0g7HKiIuSw92XT7i
	 XrErlzGx2vao+1rZnKISZLsGCnyg/wk5d0nj5SYWUD/liZOAISx5S+BQzU7+GNfEzk
	 Zplm+fCO9mVdv+H4qAtyS34IVlBEm+6OtiirTULAObxTdfOA8RO717UCFc7bw39uQe
	 sgL2eQ/+c9T/g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0B3B640917;
	Mon,  2 Nov 2026 14:34:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: David Laight <david.laight.linux@gmail.com>, Joe Perches
 <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
In-Reply-To: <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin>
 <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
Date: Mon, 02 Nov 2026 07:34:37 -0700
Message-ID: <87a4nrfgjm.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:

> So it occurred to me that it might be actually better to stop sending
> messages directly to LKML subscribers and only make it available for
> download somewhere and as a Lore archive.
>
> Is there really anyone depending on receiving all of the LKML traffic every day?

* raises hand

Some of us crazy people really do depend on it, yes.

jon

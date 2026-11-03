Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721607;
	b=JElJx8xKS3GDgccFEcknOzuOO3/FxiNCzahj8cUZyXO40H6MX+7Wn3QGU1qUcZNBMlaD
	 byjOL5RApt53DunWJKbbj/oUEVs8JXmsgFvzJJ0YdQ1mrEq/YkJ+7yV2cUC58n6vao5ru
	 Btu5s15B3+GpMTaNPJyEmmeruPMo5g+kxSirM+Zxuws7PDcmG19nJnQEEs5EY4eSimQ6h
	 Wf0vefqvHlGESYArbMAf+OzWV6PA/AYOobimf5kfqh/HbJ9K6aBrBMHNaGzd8/RCUUIls
	 ioYySbnjbTyW2vwnsPurZiV9YM+nNJhANTwlK7ZvSnmPGxHe6S1dYfORiuz+EnO/WPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721607;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Jri7ocaHb216wJJskokViOaMpERnz1undiCiovG2FZU=;
	b=ycSpjmBdeFnwxq7u7ooAyUffz8DAdcuMOCIkKT5NBwP0uJmAdwwyeCrpCA1XG0sCGZkD
	 7XlFMttV8FsS+fGkbGC8cV7+CV5Lu+hHgsXcKHhoShumwToiegsj3CW5ChUEnsAP3pVyw
	 eL+iMsxxMSDxJ9mvxK3hY5f4lm0/xItawfzWLvRBS6LSI7ub1d8esRLt65Cx2adkKupER
	 p2bZcidM9HtpgubYfQ20j/d5wpz8DhPCQbA6tYfxXcnjBCSAhntGfHBOZFxn0CbO40l2n
	 qj+Pr54IUZ8IfFWNhvNDZsKLYKMZPGQ26elXv7lmwKOMNIQW6tv6GywYlNh2YEAirtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=XMPLHTPk;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B0606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288B0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=XMPLHTPk
Date: Tue, 3 Nov 2026 16:59:59 +0100
X-Lima-ML-UUID: 7ceccec3-f643-43fe-95f3-253afcf97a51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793721603;
	bh=Jri7ocaHb216wJJskokViOaMpERnz1undiCiovG2FZU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XMPLHTPkVdFr1ax3AJlHW4CdEwXX91dx0cr2ftnrC5z0jxPMYUILEIqrznsFLsvwA
	 2n97R9q5anUrBSo+5phqlD+OZnf8dTgOA/3/eWFSsvKZBlI5rd6yU5wUA7lGQ6erOC
	 OUJmVnmODOP9k3dBc18f98Q17cSfww5+XDRaI+Jo8QYjZg1c98CiYvngUsng77OGZR
	 96311Cct9VZcxSKDdfmGlJsVrGRZqqdHmWqClJHvHSwHkYkcJIMJaybnUvxjnRU3eQ
	 71qZ7fA5BMALdaj9UZiAU5BhtVBjy901oMXr7ekTUBs0hH55fOHBCjUdxEXdGx8/EU
	 1N2+6Ncn5YogQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 ed@aicharmers.com, kenneth.feng@amd.com, linux-kernel@vger.kernel.org,
 simona@ffwll.ch
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi
 GPUs
Message-ID: <20261103165959.6e2fd6d9@kait2en-mbp15-1>
In-Reply-To: <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
References: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
	<20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com>
	<CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 10:14:12 -0500
Alex Deucher <alexdeucher@gmail.com> wrote:

> I asked around internally with the windows team about this issue and
> was told macs needed to enable UCLK DPM later, but no one was aware of
> any uclk dpm patching.
Can you please elaborate about the relation between the windows team
and Apple logicboards? The macOS kexts even set a 740mhz cap for
particular memory chip revisions.

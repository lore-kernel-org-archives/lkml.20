Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293493;
	b=bYi6wWHo+dtgVCYCxvwLvtEjjIHpoBmNR0FTiC2gjIfJNIXlhAF0B8P8+yxFQbaadTli
	 O3QI2eufUxLKC4AHiRPDpREa9UoofCAqIw/oS1xI5LMoCgkcSLeR1e8lGB982vxZLZKpL
	 g5RbEMrtlVmrdtAzFZYExz+qKjyl+muYyMK2gTgm2sJQtmhN07FEUbI7m1XPBNt7c9jrE
	 9F2iEoJCCvitW5y/l881EKXgGUQjj6nfa9O+15xsrAUU7QywlX4fNh8aCfLdrYm3/IAUP
	 ec6xtO6pqqOyglPowBKnS67IWVKwT2RV4usFAUrVgXUw6x3KiVoH+kE22FYcAvP4uCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293493;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AQk2bWnn9qEiJB55CfKKDZX/EDk/uqfS9SOxZvrUyFI=;
	b=RGbRRm7XjA2rOpIpIwpS70DfFvridrVsM4Occe8rA+tZX4lGEdtn55BXSO5BGHGV5YbG
	 /FnlGvqniOw+elNOk4UdhcN7F/j3Q+YZ5X2Sn4Jz0fuDwF0uqxw0m5t4vuxHoUhBGi+sl
	 lcf1zsjRJ+z02fEkuOW3/MwtZpvBdPh8L+bSF9iSlPqsQIN+6xlHoU8h6OHkwKna46+Vf
	 M0HnZnbE/ozudVUAkT1TednMNQkWOrzZ0gMThocLzWnfvgXR+ZYkoW7GKQ9+48vYX2AvF
	 yjZl4Y6HXfirqlcy4JfWta7hoYVqgaFe3xQFhZWVYoliyeVX09FWnDKN9NfPoLgxN5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nvcJZWW5;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326A0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nvcJZWW5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794293489; x=1794552689;
	bh=AQk2bWnn9qEiJB55CfKKDZX/EDk/uqfS9SOxZvrUyFI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nvcJZWW5UYLD+L8c0CIhmpOFLYBxA/XgI2e3MQNTIZ9dezhvbModSbSWDbNG6NMru
	 tz94klciV1ccErUrZgATbxtZlFW27+oiTkJ732ruO5TvcMhGC5AeOCGEI02FrIMH5i
	 FLYVU4tK+LY6wmYpp7V5/6aMaNIFqcHNkoo/z5kzEbDwHLDmy6zbHXwO+CFXdSGNzV
	 N075A9DOC6CW+WgzUU+/+TchZoRylwTVTFGsothmWm4tpu/pUGzLiXl4E1/21eTJWN
	 dalYu7erMAR4WGWkLZSl6WUQYN7FsKy/HgB3QHjaTRPy611vZZbueiOiigwq6k0fOA
	 IA1YK/QvGJX4Q==
Date: Tue, 10 Nov 2026 06:51:25 +0000
To: Manik Bajpai <manik.bajpai@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, Antti Laakso <antti.laakso@linux.intel.com>, German Pablo Lindo <germanpapulindez@gmail.com>, Christian Murphy <christian@themurphys.eu>, Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Message-ID: <20261110065119.20575-1-lsa.uz@pm.me>
In-Reply-To: <asaywQrMq-GSrI2r@kekkonen.localdomain>
References: <20261007183311.24637-1-lsa.uz@pm.me> <asaywQrMq-GSrI2r@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 90cce48b7b9b0d962718d9c5e3831106eccc5c1f
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Manik, Divyamani,

Sakari added you to this patch in October. Is is_snoop =3D 1 on the
capture pin right for IPU7, and for IPU 7.5, which I could not test?

Christian Murphy sent a different fix for the same rows in August,
which I missed: a clflush of each capture buffer in buf_prepare and
buf_finish, with is_snoop left at 0. If the snoop bit cannot be relied
on, his is the one to take:
https://lore.kernel.org/all/20260824224139.21256-1-christian@themurphys.eu/

With is_snoop =3D 1, frames holding rows of the buffer's previous fill
went from 301 of 698 and 684 of 697 to none, reading every frame with
the CPU, and 4224x3136 raw at about 790 MB/s still ran at 29.95 fps.
The patch applies to v7.4-rc1 unchanged.

It carries an Assisted-by tag, which 7.4-rc1 no longer accepts; Sakari,
please drop it when applying, or I will resend without it.

Sergey


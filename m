Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218605;
	b=MyMjGZQEZEMAT3g2UwiQW5LRVtXsNqZfSMHI/qw0zQ/7QN/pwRX+jcYzX24ZU7uGTFDe
	 N+pyAuuZdE86/qCSJCjR8lq6DLtospIEr94ALmU8wHU5EXGCrVl5O4w/cX30KcdwYiUpJ
	 lcNvfpqPPVJaaSf8al7kt8XabhvRcjpSzHeFzSLdC+OcD2qrpt1kROab1b3AgToEbBriB
	 rv/FD90/7DeFsm1WDDwXgXudw7MoqZX/9mVXU03XltzwCn4Crr49YROTPqdCNDHgn6OCp
	 u+L0jMiuMQ/uNMgSg2hhK+ODEG6PwBPp5e8qa1vzHaqxEk5w+vJV+WI1GoeVyDf0hLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218605;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VUWZyQ9ve/eAObcSYNBMb39AkC213KV5VaBWYN1kEHA=;
	b=VBtiNvI2Ar7lHaYbWbx4U1eRpri+TCQ/yBzcOmEawdOZ15bIZMkr/ltg3rY/GsW5JV+S
	 dwxiUM9dv3nbItaERkCzXImGsd0WgdwZLbOl/FgR1nRc2tWkI2lbGXlIkNTzL8wTp72u8
	 RNnoiHhT0xJThj5pXVboDbsIXwgIMBxDXB0c4zvcva/cKFjRQm+t1HkmZGGp+Ke957YTC
	 dze4KaeogmUCkUfDBtvLhhZpBbEOq/tniCsZQYjGboB3EvQivs08JjkRsTCLxmesjfRqc
	 Q5kMqnrW2CnD65KWRLMhORdRFGyCaCda7L/FpP7fr6T81hoC0PH07YtRYww8JKDsf5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQ2hdhMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA2D606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQ2hdhMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B1C1F008A5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218604;
	bh=VUWZyQ9ve/eAObcSYNBMb39AkC213KV5VaBWYN1kEHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FQ2hdhMZcO6AGFgMNJp/lVLguvcvHaZa3uXWT7s5DsP1SttkW9dE5QpKsoTek5aaP
	 RULhUZmZ3WDFpqr11avePvyRG9n5GwiC9E4h1PjYQwKWbnksZ9K4DiB2nuSzXdgDLR
	 AOBFdMhtPYZbd2fN57nU8B/BYh810KkOFIKcB+bg25NvYzxXUeStnBF8MoIWqzJXz1
	 UnHS3xJ1K1nKQHj7rOwBw2cKRQEzu5r0ptuj5xbLSWdTH/XWXSEy4QzHYdeTh3yQiW
	 L+q7geLr/1AMV+3vkA0t7HXQjEIoeU98uVpdN3TJtN4Hr015oWFPOy1LRA1GrMVM2f
	 Uxl8u8NUE7v3A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso404384e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:03:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGdC3BpxD3UhBfWks4+pW+H1I7SYpVE9bQX5Js+7TUiOyqVnNjcSJ+NGaj+DIVDYRP5799W/AUK8BdVxHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NbEkMMnU6TqYkCc2byg+4LdFysgQLfWefvrjcxhcPOUQ2B6lS
	FyurtHHDUQX1Go0qoPyU1vPalS1scVcVF+jR4+Wchb69JgV38xri287olFjV25f+zhDRyZtkK5Z
	0GkfZWrX1svaFsfGa9PZ3cmqRSAWVgJ4=
X-Received: by 2002:a05:6512:10c9:b0:5c1:4bbc:45cf with SMTP id
 2adb3069b0e04-5c14c025163mr1024453e87.48.1794218603167; Mon, 09 Nov 2026
 02:03:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com> <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 11:03:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQg3sj1az-+79c4uBHkphotjcEYynSR4=7+cwOWw7rKw@mail.gmail.com>
X-Gm-Features: AclHuK9wM-_UwMl9vBffN1vrF8BaWOktYDbxaBWF1nkFxTvrjySApEcGDJHKmVE
Message-ID: <CAD++jLmQg3sj1az-+79c4uBHkphotjcEYynSR4=7+cwOWw7rKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:27=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:

> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Patch applied, catenated statement to one line as requested by Andy
while applying.

Andy will deal with patch 2/2!

Yours,
Linus Walleij

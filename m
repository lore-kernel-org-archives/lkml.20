Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534486;
	b=OwOJDN9fxrgNuGYZT6N9zu84qjj8zmD5AV2P+0FbmO8EnJtb6Y6atOh17NZh83xBYpP4
	 tnow/sdvja0x47Jnkta5059t93JgJsdruOgd8h6ve4Cpff6aj+MuUnnI1/jPwhAkdCphB
	 JbjhRVSsNvDcE+4J2uKH7EpgqPo1igCuITUdmVYvNihRHCF8g5LS9Tkj9duRoxeoXe/2Q
	 qRktTDcPliI/LwTKjRIReu4QM/Kkl0+J/n4VwHco3E/eYiZKUnYjkDZZwmIg9zFUKi4tG
	 GluvPRqDs53XISz8Ipg2ea8MQGroacISZsYQXIbToaQz3DqKmkB6lO4YsCeY3B4oxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534486;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kIHGiaaw+w7x9/tbZ/OjYKBZiL9aSPInsuX+o8D0KRs=;
	b=AT4K8NoMlw/l+1oMkIKqlreL8qFrw4d+odnd08Ib456p53o26e/icVbocNIs5s7ZzTby
	 2arNvBZ4qYohas1u7J2SxBLBY0pfr5OWE0wZ+EY4Gtd/cytUr5IxHIvd475nmJ6Z9KSoI
	 oSNYF6+NDjZyVrZAQz4NsUtcqnGax6eEUcDmIOVcbk+Emt410ZOsbbcAgfg6/b93qZzjU
	 oEgmxxANVWEJo/o1yQ7xdxM5ID9n+pinEs2XRIlLnMFYZVudGN4gdSYj0OSU7tBgfNEbB
	 CQx/JfwnEdt0aOR2MR08usV0LFtkJLeUbyDwZDot5ZzQrnZQFGdZbic+ZVzXJTaMrJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSmoaRvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E89606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSmoaRvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC63F1F000C5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794534485;
	bh=kIHGiaaw+w7x9/tbZ/OjYKBZiL9aSPInsuX+o8D0KRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSmoaRvkLtnxeuqOIgX0/NZr6A8vYVT3LeeWkXHMri/grQOq7XOif4u7jGWFJ6ywl
	 u4O/GTEB9oL+ukMo13pSEMYUamyAA/ueUbH0zPN+ReMqmdG6rgQiWJBjcqAK8VptyM
	 BmjCeFSfnW/0Pc9v5t4C3E6C9yKr2WV8gV1fJqiZam9ZZjnNLEWSKTNuHN6NhS0d0L
	 8z3nEgIG8Srvki9aRGYgSLlsZZ/lI57w5uI2d/A2Wgla5a7UaFAKgmRIeswLfHsfK5
	 TdyDOv0u277WZso8V83m7uqd4w0gd8j7G1THIwOFmuI7KhRCOSMlHmtSt8rXMqAn3O
	 4BOIVS1wqC4xA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so81042866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:48:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8pXaVNstRY5WaAWzbBa3QMLyJNyhKY7I39A+Q3mxOi3mHqG8aw9CfypPggdfFTAqBrklaZZyAKq7YzOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NA6PdMZb+DuoyUvFbceGCm/IbIzaWsg4sbHXN55o+qEIW4JHP
	KS3OAczpVnbxo9q3X17rpwjAFFZf93le40tA2B2Wrcyk228v/SRvqdBSva32ZI6cqRJcU7+nugf
	sz4RF8UNwQ0OH6WUCzOOWKhv2vYyWmyo=
X-Received: by 2002:a17:907:72cb:b0:c42:fc8b:6c6a with SMTP id
 a640c23a62f3a-c50963841e5mr68070266b.14.1794534484673; Thu, 12 Nov 2026
 17:48:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
 <20261112074055.1876311-1-wahidzk0091@gmail.com>
In-Reply-To: <20261112074055.1876311-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 10:47:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8YHe4AcSM3Ch+8PseXAXxqzLvB_njNgqGCUuyVe4prOw@mail.gmail.com>
X-Gm-Features: AclHuK9nAzXNzVpFrAKkcdAMUN1l4AwVNbPKXYvvHImRlz9ZPtI6TOIlea6DG_A
Message-ID: <CAKYAXd8YHe4AcSM3Ch+8PseXAXxqzLvB_njNgqGCUuyVe4prOw@mail.gmail.com>
Subject: Re: [PATCH v8] ntfs: convert a named $DATA stream safely when making
 room in a record
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:41=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> =
wrote:
>
> Hi Namjae,
>
> -EAGAIN must not leave ntfs_resident_attr_resize(). The callers return
> it as is, so a normal blocking write() or setxattr() would get EAGAIN
> for a "would block" that never was, and index.c already uses -EAGAIN
> internally as its "redo the insert" code (ntfs_ib_insert() ->
> resplit), so a stray one from ntfs_attr_truncate() could be taken for
> that.
>
> -ENOSPC is what this function already returns when the attribute does
> not fit and cannot be made non-resident, so callers already pass it up
> as a normal error.
> It is not exactly true here, it is a short lived "busy" and not a full
> record, but there is no way to wait for folio 0 at that point without
> the deadlock (the reader holds it and waits for mrec_lock), and no
> errno fits better. I can use -EBUSY or add a comment saying so if you
> prefer.
Okay, please use it here.
Thanks.

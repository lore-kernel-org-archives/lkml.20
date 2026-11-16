Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866954;
	b=A9w4Ipk6RW0lliSrWG1+q/xeU8S7hrU3B9B+801bpr5/VPgQEFyIPY0VTetbj8DW5fXr
	 NVPJYvOhgFyZHUqSms4H3YUcYc5XRCQtggIkQ7dBeVYniO/FYmCfXxScqFwQUqkJYkr2s
	 scqSPPHlXIIgnL0HalreAhDR0xMfDhpmQbhPj49q7U71X9ce/3xqjExIaI0S+ZOLVWRcs
	 qgB59YvVlafq9DFOOW4QeCGDtTZHZ+VKf2fftscfRWaSwxGdsGM1vHpZH9NJbAcub+jjV
	 BCnSnJK3A8+QkEGYYptga9eOh2ulzTA8ogKvvjB8KOdh3Kc7J2Dpw7Oa4E2YQ5MG9Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866954;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VI/oteI2MKHGuHMppVNpHncnUh2GTN5LFZkAzdLoASQ=;
	b=FsJDMP025V/f2X55vonC8w3e1RAYrkwzps5aVtnjFxuD9Pwre+Lf/iBJTz53acVvtO9p
	 qTQTxZELjWPNDzrHPF7eCEaJRPQszVXRlW/iSpj6290SDQIPAIms7Siml4IagJrXWnKu0
	 BMiICJA05wGdnW8L8RzWpI3OMFI7d4mDApUkDMqE7NttLonZMrFpy0s3Sh4HAYKlmmV6a
	 dhmMwfMaeaR8rgVmiHsycHGfa6DVJigjA+UXUlCuypB/rEGi1P7aqqdE4nebWEuDDZnBb
	 axgIF7PIrb6OkZF8AWsInoIw2IXcgy5+2F35yiecQyzbTFeN6WHlG/O84+UClYpsgZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtVYn1gO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138C606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtVYn1gO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347391F000C5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866954;
	bh=VI/oteI2MKHGuHMppVNpHncnUh2GTN5LFZkAzdLoASQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtVYn1gOxzTtGZDv2HrZCfeuQ2FcoOVDq82Ivhow8da6dF2Uk9yo0ZmOyG6fiFhJ+
	 qG09QS/9xdA3SMr2eDvsn5mNBNrGPzpWDMBQmPdLmNkngyREX+YmGWSE/SVJevGIPF
	 pSPn8DrPxHPHTXKGPHaYaeRY39Lo5p3qXo/mYIXZspbIgLKWc9gZYgPNNfBJx3bgBp
	 xSeB8VTpsuF8oUtx91Olx/XikOJZp2ZIjAOjFHyOZd0iQAcooM+QW3VQG34F5DgNeJ
	 Ox18zQxy9N1d0LUH9gZmWbYaLiQW9VM71o29Lu38HqZeVO+OD6ABJgpVFWvSsahTYd
	 IiGwID37CC4TQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso8941965a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE9hcmL8USlaP3V1FPF1Cw3SPzwH7LPwB0++6eWgsOi0CFKWeX/MD5GroGM/g5LJ0jVbi0b42TtLXDs1lU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yl2Tra0xMWNt15vhnev7Y2smRmdAUsaJUqPZCQUa+Q15TlKuO
	gUOTI6zY0T+c8mF35lyCOsZ2SDZAPUopOvnF+k1kYA6V9b9Fggqka7VaE9HHQqGkxqY02ErGAfx
	q3TZ59MbWeApBg3cEqxXXuBr+ZCnZs00=
X-Received: by 2002:a17:907:d8c:b0:c40:560a:462 with SMTP id
 a640c23a62f3a-c5096375806mr1084937066b.32.1794866952854; Mon, 16 Nov 2026
 14:09:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116212549.2574919-1-icb@fastmail.org>
In-Reply-To: <20261116212549.2574919-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 07:09:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9pbPNz_ojKieP7uiFkb-JC8TS-VqJADjfiEm2513USEQ@mail.gmail.com>
X-Gm-Features: AclHuK9M8klvf9XpmwrIQoKGJSMhatCJ_xFEUvl9FVJhSE9baL_VkmgKd_kRVIk
Message-ID: <CAKYAXd9pbPNz_ojKieP7uiFkb-JC8TS-VqJADjfiEm2513USEQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: drop the get_write argument that every caller sets
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:26=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> Commit 020ad4a0d0ba ("ksmbd: protect SET_INFO metadata updates against
> filesystem freezing") and commit 3c463ed5bb47 ("ksmbd: protect CREATE
> metadata updates against filesystem freezing") made every server caller
> of set_info_sec() and ksmbd_vfs_set_sd_xattr() pass get_write as true.
> Only the two KUnit tests pass false, and they store on a shmem file,
> where taking write access works as well.
>
> Remove the argument from both functions. set_info_sec() now always takes
> write access around the POSIX ACL and attribute update, and
> ksmbd_vfs_set_sd_xattr() always asks ksmbd_vfs_setxattr() to take it.
> Nothing changes for clients.
>
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!

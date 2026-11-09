Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794257187;
	b=rlTLfhOJrQVNXbeawnom2v7K7AAND1+RkWbZlMZUcyDL3i/Dn1+dMC9hNO1MdqAYgnAI
	 Z+4TZEvPIyG3zsoAZz8WxchKKwrJ357SgXO7N0zHtmqfy4iahhVV+xShPjcGYEuGy9aqy
	 YPxPhlaoZm0Ta61CUqAdzzNDdsN1gNOSlBMv5J8GsO/MvEjIjc9kgI/TSHWXS1dcZQjJH
	 Kqe2gjAg3rn4eppmMc1EX0KLefkM+fbo0jB/L+wkstSBmXt2CFPxMQsS3rak6aaPbfRwf
	 wt6yavS7rcpz7dBjFzWnl6nN2cgXWdCQyahSd40g4HSEjlzDIGjYLuj6JhpwhKUIhDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
	b=VUylbVxKzOVqJN7qgQp9vmLyD2irDJNoZUBcdEO7OOunhnq4kP3ACm5TCF+MJg19idqo
	 1rE3L/SbRPkaCFHwPkIt1PUE3d3Mp6pEIu1zS0HTiMPIfobTnOTR1hGaU5uLjMpc3yK6l
	 BipdHjkRt/yiZ/waIdNOZjeN6onC3AnMLkLEyii7370e0gZgcVI3Vs1O+3WjD/KuoV/q8
	 fBRTKvkSa4Rvnhu1NqzXzPKM9kc4TeqD9XKjHUmNN5Gf5dxIiADH92dhDWGv+Coyn0dvH
	 XUZzWN1y/XUB9DH98duptwy2ii6hJvZpjNKJk+/VO5gee3zlvil02ZKCXJQ1nZZIl8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCq+Izyi;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C2606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65C2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCq+Izyi
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1873101a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257185; cv=none;
        d=google.com; s=arc-20260327;
        b=XEvgP2zgO8VzV/skWPBo8D9bMJTFh8OwGqdrhLy9TqbdZ7R3X8yITeG6jIh7CR5Pgg
         rZskaAz2wa5KQlt6iTHd7wQ7jqeGd80FtAKxHRO0ysDZ4Y6pEG9m1K9UKL+OVzw0m11X
         jVIrL44zRHmKSaH9AG3kuo3shJi9NjOA6v1CRP+lSP/XuiOzBKDTEwRvxCMX4bEzKr6q
         UPu0rotFhs71ThC788BKYY9r6LoLFfpd/pw1nje8hJ7RMSO0QmqJoZao2Lrsok3sfH1I
         HOSMeR9nNkDJ0O8p9pfX5ynn3h6hmNJfmXxH3qtvIw7PPKgtcvy7gmfGfv/QBIG9/c5N
         v1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
        fh=Ablz8gqJbZ+NOlfdv1+4Lhv/sHBoUfNrEfk+Ve6/+4M=;
        b=Txi5K62dFKvvSDpSFlclGYnvT2XsqqL06zwKmtDC7oURH5FUfbrlFoydaCdSYZzh6A
         0YsEzCOpjWc9+uL3zecZroL/ByIMstsRZgYT9vAtPt0nbY/VdknSuclWfk4Q2rJy7BGK
         aJDHpFkrFXisDtzHRg7JZJhgrt681cLqsv8N3yrnfv7+5LNalwoX64P3AWYaWa1QZfE8
         LZfvGssiwXo10bfA5cWXxWbjNVpgvPExBgqwJKTeiSUFfo3zqt/rSEdnG2vM30QgcsgK
         HQI/ttbtBn5ciG/ZXyVLqX+XC7uYeKKUTYPXNPLfQENH0Jw4UteuHbfd6oOhLd//OFNe
         9lXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257185; x=1794861985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
        b=NCq+IzyiFJIoXBvrfXgpN4m1NTtx6utKbDHhw0CDtvmkxZpIDkhkEAu17BXroc1qQ3
         Dwo2/g9HufKpEVE7+pcuHvSObjnHu2gvVQfvbqEfpf0QbDwr9WYZsiAJWIol4RENYkP6
         l9wjFAnwSfddP5bn2BpxODAComGPKHSdo/Hq5IVSJ6KLBKJi1WQXUndr3ynxhKQQnmiv
         Qqn5geCSciIz1JNiRPz0EcnEdxwU+bcDbVfxU9fBtbymrUn0sOmyrFqRFELOXUYDOKEG
         TIr4fo4nliYGOT5MEF3xuUI2aExKR5p35lcTfFPPWdN5BfOU60BLKdjrDhxK8wSsSC3A
         ZDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257185; x=1794861985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO36dFoBW7yl7SqTzC8Yly7dBYk4JKpR4W6jyTZ5PPA=;
        b=LWY//FtOr5BmlZipca1fJ3IZ3ZVVUYDvgjMjV6WCD1ThzHZ6qmyEgNJkCbIX80/UyL
         M/HG50/etNfsUX+ngWQW74+YaKhU5W47/wciUNxWQPzNGv9X+kSNrE7uyI3zGkecJMht
         oDUU6e9TZ/CNHqAYntpCCxQWBWegxhDoEg+WBB6S05Tatt0JkHt4t94xrSX4KXQakJW6
         OLe3SorLMy6sa8tBQtO1KUw6RNyT/qxFFeWS7XS2JGgcmjyzZHD9BKFUNG0HEkksL0As
         Dnz1++d2B92SDQE6qKu/8MzCF60gVz48r0u3+yPaFKP6czJOiciz4BQ3mM4rayL2s3ip
         6iYQ==
X-Forwarded-Encrypted: i=1; AL+hErEbcA8jU0hCy6LAWj6SAtB7MYPM034gBbWDH+UHba5FLTMMsM3CKk6Uu91Er4C62kX3eUIas6DpRVoTpcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ykEK5kduf3jyxII38HIgMn4y2iYhxZAGlxtRL8P689i/23ib6
	Cs/H3dvNrQRH+jKz78Md4dSRol4d1ugPz7K3ayAEWHFHb87vSD/U9ZdQuon7ATH2tfvo+C4sPds
	py0QK5nFlG5WTFNCGLbBmnhDaZHfUA+ZVHg==
X-Gm-Gg: AYBFou161/K9bM55cPHeOOTUHfjO7Wp1qBENGZgM463CWK2VjuG6gd9Ry1NJDIp/L1i
	QJYzdlGVjKDJsLrzLGIfiUwpeSYZcf0L3I0tkIxXACVwEzMHnp51f8ZOFrIy0pFe671GJW5+yz6
	yYtxK6M6vLc33NQa1pDfrYCfgoS2hsdhKosgu9PX4kndDgQW6y0MeNRBEO0P3VGwy8Xzdpn5YIK
	0NUE0mzZDM+sjP5X+21bu9et6oWJxpEstgss9j19WYTEqrBN5GKmkjw5GeGQ77S23zZcBgMO+wB
	dOZ+oapgIDZ8GoF2vWyXx0igHnKsrMB/7Qm8InI22GcAGG4Kbx7gKB2i9QF1QN7Em6n3ymI9Iuc
	zgImpsQycVnsTOSpCWWmXQg4NxFQ65GqS7GhChMSofaIvi+7tTDlVujZVrZLRmqpO84Cz1M/o0w
	EkvbUOWev720wXNR2nc06XrKy9WOG2sdqAiFHQHKzMSY+HOyFA57jG4VvWBdRsYf6u3fBO0TLtd
	c0chK5TCehKSIOCEI7PQr5TpxhOHzMsEVTdodpetAGxN6b+FA==
X-Received: by 2002:a05:6402:13ca:b0:6b7:164a:7228 with SMTP id
 4fb4d7f45d1cf-6b756b0fab9mr580476a12.41.1794257185052; Mon, 09 Nov 2026
 12:46:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104215959.24035-1-rosenp@gmail.com> <20261104215959.24035-6-rosenp@gmail.com>
 <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4> <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
In-Reply-To: <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Nov 2026 12:46:13 -0800
X-Gm-Features: AclHuK8yAS4r-QfhKzcFNAvzQn_YgnIQjLvWa2Szkx8dOWqMjuJua69E1x63B8k
Message-ID: <CAKxU2N-oA_EQ-nC4y6E+Y1XCaai_QNmicobvJZ03mRRDikZ5RA@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:30=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@kern=
el.org> wrote:
>
> Hello Bart,
>
> On 2026-11-09 10:01, Bartosz Golaszewski wrote:
> >>  static const struct of_device_id ppc44x_gpio_match[] =3D {
> >> -    {
> >> -            .compatible =3D "ibm,ppc4xx-gpio",
> >> -    },
> >> +    { .compatible =3D "ibm,ppc4xx-gpio" },
> >>      {},
> >
> > Uwe: is this in line with your recent cleanups?
> The change is fine, I'd appreciate to also do
>
> -       {},
> +       { }
>
> at the same time.
{} was done by clang-format IIRC.
>
> Best regards
> Uwe

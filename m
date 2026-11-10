Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318656;
	b=cUrEXp6ab0k2iXPItHFWdq9YeU77mbxbZ7KA0Bj3/bbv27NbrxpaXDc2vuYWMG/1y34O
	 NhUpr4BmkVNQwyBzT0LvGQSE8U3pnp6LciXeuT3X8ZOnlXzkcCLkEnBVOe9EQK441rHCa
	 AEGqWbimEm0GuUdFC2BOr0AKLJdfYmKuOtwlCDMZECU2Q8otivI525h95SKsmo81VH4cq
	 XDLihDUh6k/+uniHaR+Txdut9yWVrDm0InVvph9Eu44wgGXPM6WaxSQZ2b0e1N1UcOe93
	 sUSfdjc71fJzMw6S4SHl/TwWOPosC0HZhhI9lKHF7oWnAJVpB37ZCQzqfeeyvboc9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
	b=jQuhW06qIE6yujJovJ0kp+hWoTlMkBjktP8bbySB9wVSUvizdL3zpJmIWkPutoJxLCRz
	 nRncu3BrCI/QRzb9g2tRMTUTJk1/VJ6WmB3rkmzsbbixxUTbH0WKGLiF8hZdEYOvtGBjO
	 k1cGiI5+NSHqX2ZVCewzXi6xrFw8Y5kfsk3v3j0RBl1A75Zb5w06fUHO4hbWwpAVGa5gH
	 BuTSMtj7P9sMes/VSnqkdwXrmsOXlz2k03txrf/Bk288vVlCnDlkw6oecfpiolJaYrEHW
	 S7ORGzEy2O/x8lpyo+tgBA0hhpoP/0az/MhM28N78NQ0AixWN8jDoVJe5P/iTe7NOVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgZQ2PXP;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BDD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgZQ2PXP
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675617e81f9so1856179d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318655; x=1794923455; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
        b=rgZQ2PXPVrNCfsW0OegwCsJKX6gwPzauztRbfGffPyiPzuH9sgNOFZHbjQ2TPU7xHd
         HXnhXa/CInh3orIlh1j5T3FgG2yaY7i98dX3Z7aMte6sQntvLmkfWSYp2NqcP0OyOr6R
         TU9q1AQwcelJn8HWOdT4V7fFrlBU6HOe+3Wxd2xifEaQvyl9uPYjW/6QJ104kynOpVAC
         MuaW1ze5Xm7AU8GcgMXlK03ajGzPmnmXwZFSm0LBLQ856DiezSuINQxgnr8z8jbwnzHo
         t36Yv0MGurTmPRlXEZZ1A1ASMmOLgWgTxPCgLHQi8kg2IO5j2qJUw7XFZhm7N4s8aVtb
         kYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318655; x=1794923455;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NYWU2IFMFcOZ4Xu65TWye0KHFmImuRiCo78dAp2MRY=;
        b=uib81cnxyp1L3fDs0Tg7GQclcBt5xfdwMNeda9rRtZYltgtzjpuMK821zM50fb3Fi0
         Sfn+BNnIrrjytDnXhI8GhUdyXYGmVzrbUdP6Zz0oPxV3XhIuOdxx2uKsIYSJg4gdly9O
         ZlrNFgQhTM23jXgCvL/SDTcxfxqIz3bS5oIc7yq/j3wXue3bvwF2YxrIHpyJRoslcmLc
         oE/h5YutoSU0YhJqZBiWBaNKebJfmO27Si5bshp40/EPqu7RI1skRUUN/kz//9EEtLw3
         Qc5r0jHPJp3HF7wMsy8Kfr2qg6wlmW7+IhSwShXc55x4B2VirFS7D0pOjWWD1FbqTn6Y
         ij3A==
X-Forwarded-Encrypted: i=1; AL+hErFxj6T479L7J01jrOwxEDl3+wB0UDdy9QokiJCUW+XuWkUYnRTgVo32vSWt4xTplF4K5LN7aHsYM1Qvp3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xXnMLVsdJUINImXvWKY41gOcW8FlEbJC3tpYqfqXZW1lGvW5m
	070R/TjdNYBtiGKPgZsiOKl/ueaMSzuNRj3F/u9rM1pYHcHH1jba+KY=
X-Gm-Gg: AYBFou1EXvxBahUHuGVfheuDi5rM4mfZLXsdW2iZUJ/jogZbFdhWMgnEug9h5sKN6GF
	iovpnbH7RjSHU5hO0WFGYsBGIyEaZaicArjqRtcG8kY2b0i2tAvqjE3ybwFFonZ69UzGKZiZDn3
	L6XQTTdiAxa+ZhXIzs5EHJ9d4Wbq2vd2rSq2iJYWd5kDBoEhNJFKGfO5TKtKfvlUAamHFC3XhUI
	x8dClCTBEnJPGUOAgITv6jOMuwLrDBzwTM2D2PdLcuRZ+ogbdT5aiJbHuAv8Eo5Qxb0YnI451gi
	FKkJjJTDQEO+IufSta0t6ugbuGCrhdE+xuspeW/phH53uuLukgBNftqvkeaYPwhybSz/3S8s1qz
	lLMbpmmKesTmdG3Td3RWqYT4tkPGHkwhzoUUy3VqqpAstjc+eVnb2DvhDk9RmjwfYz/95hkFkDr
	KN5qcv82+wCY0ajr630JfJ5FTOKzD2hGK5ZiiRrhTnGPE09lMURlJyXZxtcsRErpaBa5S0WsQWp
	9QNufoztX3iKMgDoDFwvDe5Q605yibkG011pffODRx5RbvyZPH0kIuPWVfPmHf71PcQASPsBB7o
	10hqOIqvaw1wiRyHngIDfR+vVf5WJaZGX81osAvL1S851Zpio3/t0joB5uyfJtDi
X-Received: by 2002:a05:690e:1306:b0:67c:332f:3fd8 with SMTP id 956f58d0204a3-67c565f716cmr1597436d50.5.1794318655428;
        Tue, 10 Nov 2026 05:50:55 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bf84sm19649867b3.3.2026.11.10.05.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:50:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 10:50:49 -0300
Message-Id: <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
 <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
In-Reply-To: <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>

On Sun Nov 8, 2026 at 4:59 PM -03, Miguel Ojeda wrote:
> On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Rela=
y
> <devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>>
>> -    #[test]
>>      #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
>> +    #[test]
>
> Is this one done to match the other? If so, please mention it in the
> commit message, and consider whether the last test in the file should
> also be changed then.

Yes! it was to match the other one. Since there are more tests the other
way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
have also the #[test] attributes on top where a #[cfg(..)] is present).

>
> (We could do it in a separate, previous commit, but that is nit :)
>
>>          let mut b =3D BitmapVec::new(128, GFP_KERNEL)?;
>> -
>>          b.set_bit(2048);
>
> Spurious change?

It was on purpose, I thought it looked tidier separating it (but it is
just personal taste :P, gonna revert this in the v3)

>
>> +    #[should_panic]
>
> It is great to have this, thanks! :)
>
> Cheers,
> Miguel


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794165255;
	b=2G/lOwfPENPpuD9vMjunXRNYd08GY30j8t87G3/4vjXOluAn4+0XT9hsz/KTfMDzsMta
	 QLRkZ9kcYw00IAJ65lHqnTZditZ9YegeEN93MekxPjwQy3PvCaInkYxSMC34EX5hqCoSe
	 Vmo83cWOAJ5gOyzR6Ikut0UoRPoIs1FcKBzlK8N8Vejwtm1/TyOpO9QxqgMfG9BpP2LPU
	 jAMNivwRMnuJS16k65myLBguPfAOtkEbTC0Vw2pXj8eBa3TzA2OakvCXDjTCryRM7sQ1b
	 /ng65Pteoa8DPUPWKmjGqtVc8HAdM5JaT4ZaUURpT6AdX9VhLSF/uI8wCGphvjwdX6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
	b=mLQtyhI7CgAhNs3BJBSm/jBf/kuL1mJ1rCOa59y1BblSDB0LUOxww4HsCGQGJp13VoK/
	 cHUqwZ7TRN7jQj4vyqLLP+2b4XS4NaWnlw67SBmv2/lfAntXD3VbwuSQH1zqFUpWJ2HUV
	 Xnu7tYugbeSFGdN/IbBu+yVSgoW9lGPdWzBKLrx5HO2Akobm7wSKWKA2hS1R1MNP86l8L
	 IW+kj4d6XDaP6o2sKQ13MEYObH9MWyOAfWt0T3qJPiYmhiiNk+ondpTTbev/6qj65+lwA
	 wEvnsKoQuK1/U59fUN7N2kB3vkIIS2YEtKbrHGsk5S2Hi/iBUJ7eop8DW4kYECktkEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rllbRpEg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12B606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B12B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rllbRpEg
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so574044eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794165254; cv=none;
        d=google.com; s=arc-20260327;
        b=bYq4czz29q8are0bsZ5nnfNztcLipf6Ws5+9xjkT+cY0yYO5uAZhmexJzRW6Dmsfo4
         ClsohHnSfGCiKEBd3pHsDRM4GFjrw8kploYPnyTKsM4/bKz8fnOJe43VOy+Ix/mhvpU3
         kwDQll8/QnTk2nGN/nQ9HRzQJOwQFX+bSvBlizPu833NKafoww8dQX7WU7L8HxWpmC7D
         if+l5kWztMT3TxODNQctVSIElU6hIGTNVbEiCMAcfDKtxavAJ4iiBo8RQKC5TJIUpvR/
         KqkOwX6KO0F+nq1eN5lgHBQP+KNTC9CciNH13VOI/X6ml/XU55f8HsUpKy5Zi2/JUKGv
         P43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        fh=YfYo/RUeEYvrSt1C0TAxuI764OqKVyNFe/YXkIt1WDw=;
        b=Hvqi+OADu3BsRJAnV3iy7pD6i2dqfg104JjV3XzeJLp6XzHF6J7qzoggvNUs/c6e5y
         WGI9fpeG6A2prncN+ISU5vEA83SrPT+3x93CZ+dgmoIKizm7fiWMUs9Bmv6HbNVARZXz
         9YmB9XW+w2RHneCsooUiIkON/YRX2DjjlVlcfGAZnh6DXHPci/0mAmZ9E0+49DFy+uxd
         +/u92xY6Uk9umCjT5Lc8h4r5GgRopxSQz0OU668gX4woaTDJeE+toVh8xOn2SZaHXIJy
         QU4X0hvodqCfHglgnSpgE/a3GQBD5tLZmkM2IkpbWn88mPMg439ZDHjO+yu/lv5dSFfm
         dHqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165254; x=1794770054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        b=rllbRpEgiw5AIuoQnqAOapTJtURQPajg1YXAwpRhZlWjt7K+ZzeDGOMzFSAzbSqle8
         RZSht2rfco69yYb8DEwj2en5KGT41k/56aT8gFqQnYZbnRoU0I4+FoIQPMMpYyMQr1tR
         uhD/S0OsBEBHi1wcCfsbCoe2fmWPlMGpvlttpmmuONqFrunvkEbxIVNU548gxCpkJp/H
         Cp3e/CrOl9QoehwxzPoS8HzOv1MqoWlgKxSSr1+7axyaM2JhbW82FxzdcAhYpfeuaWsq
         Fr2lWuGq1Mqt6zthCm79fbucEi+tySKeWtrJ+OpVVr7ZEFfBUNeHjQm/YgJYmfsTksLV
         2cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165254; x=1794770054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        b=0et4tJQL0ZnzJJV9EcFj5t3n40uIcV3/CkQloi5wCtycNSXhYafpKyXLFnff7OHRMr
         A760+Rn9CPmormk8uDzgVykq2sJ1Khrp3AlMBuigdc9x1fsuAXA76g5TIoQUw4PcMmAU
         1RKoKaCKKEkKeg0XYksztv97wigbuSRkUe3u7u4QLTVLCD6VKPdRAOh1BitXtLlpIIZJ
         DZSOhgsoqccsi5EXpKVkr9wL+B0pYfx+YgAEsvPYDaKqeZ0qgWIcyyF6UcOoeOJcd5hi
         ZjSETvC4Y77g9Ihyn3MjDVMO1/GyxfXM4NiC4xn1Hu13ARYRV7Dz38D97cukWmtwoNzS
         h5Wg==
X-Forwarded-Encrypted: i=1; AL+hErGLWGgTaJbfWceybGHnOQMlLXXY4dMEEhaD7qPq6ilv8fGyl5PjokrWAhTnwqGEKoSX6ecRg9NBfuebeek=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uAtH2oLBDjqIjSfYXMyKLBWP/p5YRMc/FP1R3KMYHgKtPa80n
	JsXPhOSXyzbj+s0/xNFzTaxrGbzbAtzPVHOG3HvcaSPj/30q1bVapxGY2cTevE+x+agW8iJYxvZ
	y3u25EwOSYbtpzRk7FjwdPDo2QXhHL9U=
X-Gm-Gg: AYBFou0AwxvrZqtoP5RA9PWCh7i0L5SpTYuwD4z240MO1uLqVsRWJmB0vG0l8OMYES5
	OKGjcg7t4WP37Us2ZR4agK5PM+35p3tDkyQDpyT52/Ih0Y3qrIFvW/aoDIDQmuV3HNxOxMBHeuq
	thfQZcjg27qrJSV4hqVmI5T9KdzGorabcQ1NUF9XljoFdEnrfW907BH//WmS68uCVlLjcpsUZnf
	pwA/1mbJvjL3LPkR+mZ1Q+XZjpFWNEEHoRWuyActhjIrB1hBFNhO1XXiNmyRASRKkxIr3++bkua
	CqAEnVMPfotOrtaHaw0r0LhXZgQeQwlJgUslaDhz6hU3DCw/zuByDw6MuG/ka4LVyB81oioU4Ry
	zoibG5SIvJjeVdXrmgmBYBR9EuhQuMRyw2CYuCIVngfOIB9YsmS+MBlxXguJJ87Ht9dOKnogWj0
	ZAyKD91dtUli/vXptbYYySd3rpovLsav6FCW1Edg6Qd5NEMmdl5fvAph43g7fvk4gBXEWXwAAcX
	cNOK3E=
X-Received: by 2002:a05:7301:7004:b0:372:eab:d700 with SMTP id
 5a478bee46e88-37252e3a967mr4833895eec.1.1794165254303; Sun, 08 Nov 2026
 11:14:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com> <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sun, 8 Nov 2026 20:14:02 +0100
X-Gm-Features: AclHuK8Zqm3SYvO-6lPeY5_gCtAhcGYV6kboEDJv7680m_CzRJR-fiUMmy4_9do
Message-ID: <CABwQupNhiTRmbA+1Ps96tAe_vrUehAR=ZqmPustz8M4k47X6vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Rae Moar <raemoar63@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
> test so it can be run when CONFIG_RUST_BITMAP_HARDENED=3Dy.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
Reviewed-by: Burak Emir <burak.emir@gmail.com>

Thank you for implementing this TODO, Nicolas!
Testing panic behavior is useful, not just for ensuring that it meets
the specification but also ensuring that changes preserve the
behavior.

cheers,
Burak

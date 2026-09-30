Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC63155747
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775073; cv=pass; b=HCcr2KrhD96PIs0o2GZr0OykbwFrZJZfJO+WmhVgCf9kwPBAd82KBD6XYP7u+x9pMhv//KiG8bO0huCi9GmPiENsInXRIPQai9K0FeFCVP12/6y3StbnOfldydG94VPJHcWmHFa/udUa85aMbb5KgOEvsOfMtsJbBNxfKMxgQ9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775073; c=relaxed/simple;
	bh=nt3S2LhYlCFMC7FO6bjhb5V3DB3fOhRHMafhyzm/7Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+sH9KumrlDWYd5dqh3Da6oEU/crXQ6lEiSBxgbJ0UoItmcZ+WtSVGtlQNQbJGGlQ+jzTgM8aaAN90vlhK/jm9eyxAhUFR1Ijem4C3TmCCNruqt9zrQ8315f73CWdnJwgWMJuoJ291rqow2dvb+GlLF/P8nODL8Wt490T9Z1UFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WelMeTuc; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WelMeTuc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so3204693f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775059; cv=none;
        d=google.com; s=arc-20260327;
        b=sN0hDb6USdW6bdqv6Rcx9aXr0FTp4rBsCK9VWkmMEkDtTwMD5wGIiYetH6zCQn8PIr
         GpLE2XVjVSoAllepA1O923EmIHW4cxTSH9XsM8KaJCLOhPgso4AC4SpX0+08LPevwEPU
         WhvBGWLcwJZEdVoGA2lXmsczNYWrW/BA81trz0W96MhRb2ImzA9VKoZ7kaFtz2w4Gfbx
         TSkZSAdveVJUPDfWS3sdMC5dvYqHw7H82imBpYVWsYgEuKygCqZnKkZFYFND7Y8ZXA+A
         UH67ARVyoQ3EUSNU6+Jaxu7JaqIbsszunhHz2PWPLeOzc+gQcaW3RJf9yNBG+sq2oJzm
         3prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruJ2755xF9slnBF+H5hrh9UtiC9Erto4r25eLucJDT8=;
        fh=6ro5W7LI8o85ZBgQQQSziL0reBU8xbNDszja2NRS0+8=;
        b=Y2M+fTDArY3Kv6GO4V8y1Xee7trtKQ4lR72I5nnea3Q8OsOs7JGzABG4RbMeoSVzNX
         bezZwfzMMCjywNC8EriIFXtp4gg8md3k/WFOACBz4yYBSEqyitDNCT3WqzYlPDAVrcGq
         DBWhQt2r+gwapIJ9YBJSZW3N0HoCx/V7J54BXOH1zj0xU31r3bolC4vX/7LtL7pPRTJ6
         Mu4ZMzwpERbRZNFkgJ2LB4wTqjwD5UdrCtxfR2M2AbaEts/Q7Sb2vD8SvR1vL6krT7+t
         Ztx/zuRNMoMmhl4UPW/l+gzTsbmva9UXz/CqUupi/yjpCm2oXnoZGeDfumydJfHzC6K9
         8bHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790775059; x=1791379859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruJ2755xF9slnBF+H5hrh9UtiC9Erto4r25eLucJDT8=;
        b=WelMeTucpRQMLw9A3UnvMC9AkZKGZsvDZox5zP56ueLYAJcQytNt/hqcom55Ucp+bM
         7zEGioMoSXolKtNsd48g6rJkxHU/+sMW5X10HC0ybh2QTlgLf9rKEcZjqD9OdpWNAGFO
         zE4KA3q8UNeoCw8+f1I0cH/JvgCIC03kerpjhbHwJw7IkDdYP5bEhNd/MJzFe1R/qmPI
         MdPwL6XrSTjnMdpXUzkqGaIHPprHlzm5vdRFvtK8IU8lyf1xaakAPPlMoXLF8XOWKlcw
         pXyWLjA9e9tSMgc4U7YEBD/f7yx/dwUVt3wIB51MlqQ+dFyy/LVH3Mwxwi7nJiMixsx7
         vzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775059; x=1791379859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruJ2755xF9slnBF+H5hrh9UtiC9Erto4r25eLucJDT8=;
        b=be/KyCv7Cqs6MuYO3uZb5pmDyt8Yj2eL7Mm86cbgKB+ee4cdYb4gqvh/xIXzL+m628
         mE5iTsKdvCf1HRxjZNpifj+w5PogY0XZlVrBpOSc91VaPvKaZXcbA0CNVBJXT5bu5uW3
         4ye0aExMUmIpE2p/q/isFnpz0emdQkJkJb6Cfei0B0DH7T2TiURay48PuigmJJbFLEuC
         tDemBOqSfeJF2w5YboViRfbhRCMlbQU25IVVZgMqMe9Gfq4bJzEMgy6XB91CtanhZ3Cb
         v2KHNO93WfpUs7E4GzC2RjgrbvV1avn9FbXkWbIe49gHnmtkYaXx/hX3noPkIuVISDUB
         lTtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqLi4od/79K3XNXXIqSLGY2qPwReRAMyeZOOnL9TVI5utD8tkwpiCkxjiVh8DrzYmuzp/lBDL1vsnorUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwqGew+lgBd9oTq5eVZV9G+NO37yAQQFj1AbKDivBuWPolsBiN
	bId5s5H1dn7MpzosCSGEQQQz2c6bunmGPtG0M4WCvfkyPJjULzw0wyFmZ8msv6MNRQ1n8OaDqdQ
	DZXelWdya/s5rnZcV3ZIn5SQNBIdmuYWSXjhkflhC
X-Gm-Gg: AYBFou3udO+KCZin6d+W0pw3YX/pOe5i9nZOiMaY/9PiQdGmlyjY1VVVi8b3IhKJcnI
	RxhY5cBZK/XXFGlABDkd+446ablCKzR2qfX7Db7GGGMDsVjGtORZBnM9BZuoSYQC0t6upZovmZN
	Gcg5MMJi/c19A8J+5ZWQRUa1KaRxvwHScpNG8NQc60FIs9ZwyYOmGwmglK5dUqdUxSHQo9uU7NN
	SZo555UZlvsLC/KoD1N420iWiDWyQ7NV8/SSvBLzk1BWanqG0UNWuGIFP+I2Br4Dt5LIAonrPF3
	7OJ1XgV/J3TNpfHfWgLyW4qYyN+Z7RRvJodXPDJ8tzShDwBzPOokgOqcRK+xqC/SkercFCV4WAc
	PWGNigjlf741DUYPt37QUuxx0A4/0+sBnMQf+qVz8hR21+fJytzpfKbojIxnobL0=
X-Received: by 2002:a05:6000:4212:b0:488:7a33:9930 with SMTP id
 ffacd0b85a97d-48b024f1b08mr2852100f8f.21.1790775058645; Wed, 30 Sep 2026
 06:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
In-Reply-To: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Sep 2026 15:30:45 +0200
X-Gm-Features: AclHuK8eMRJufnTTazPmzDKVR-CCLP7X7RaSkvqFBM2VLG7N3-iwji-l-8OT5eY
Message-ID: <CAH5fLggF7hcLHGp0aOcebygWPiRJzxsCs7Xhb19vbqz8hUA1_A@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust_binder: error line numbers and failed_transaction_log
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:48=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When diagnosing Binder issues, it's useful to know what the most recent
> failed transactionas are, so include a transaction log with this content
> matching the C Binder transaction log.
>
> While we're at it, improve the line number information emitted by Rust
> Binder using #[track_caller].
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Alice Ryhl (3):
>       rust_binder: start debug_id at 1
>       rust_binder: track caller location in BinderError
>       rust_binder: add transaction_log and failed_transaction_log
>
>  drivers/android/binder/context.rs             |   8 +-
>  drivers/android/binder/error.rs               |  39 ++++++
>  drivers/android/binder/process.rs             |   5 +-
>  drivers/android/binder/rust_binder_internal.h |   1 +
>  drivers/android/binder/rust_binder_main.rs    |  26 +++-
>  drivers/android/binder/rust_binderfs.c        |  19 +++
>  drivers/android/binder/thread.rs              |  12 +-
>  drivers/android/binder/transaction.rs         | 193 ++++++++++++++++++++=
+++++-
>  8 files changed, 293 insertions(+), 10 deletions(-)

I'm going to send a v2 addressing the sashiko review right away.

Alice

Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438AE46C821
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353371; cv=pass; b=s66m5knVaGIwz2HA+W0NpLnPKONt4oQq6YsQntZN0Oc7Zb3mW+HpGKM/4EF2C0MdnHQFh/tgoS1Wk3soXJT1dMTwMJgSg2M4952DtS4cadU+gU7wehKTXUatzgVoH8JCWW+84jlu+LN/5Qu+Ix8VVFkHtDiBTxHvV1VVgu3u4nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353371; c=relaxed/simple;
	bh=rsoW3X76HTtoLNHsJ97uKw51igWW8KQkOgOnpYBVO9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEw+Iu7tZt9b4M1OwADsUIm90XJDtjls3Kmqz6VtrEgbX+syWnZ/Xm0Yf6GoHHiZvHoDv4ub6//xK3swEWit24EtgvSrfdKNUeNmoouNHyTTHn34zpCgSI9GQJqPhW/zv18pTfyLXLaLGmMeOJk9pCWDfFq3+fvF1f6cLyXBbbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=SorqoUXC; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="SorqoUXC"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836ce6cbe1eso10984477b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788353369; cv=none;
        d=google.com; s=arc-20260327;
        b=kCLzez1OsPsmtg08n8PQOAUPIwyEYYbPW7NX+6uEd+5XDvo5MyramL944SEtFAV7AB
         6UbpKc1AXNjKR4rOyudg3X+H/wOJjvpHhTrQA37Q44r9khmfveGT6QCwM+YCHS4SXAGI
         hOr89bwW4jf//CGuhmIx5lBzBDpwzG5td85Nm4ttu/cDAnpAre9KcK0gjX3mAqDga8aX
         6mSn11bng4DxrX3A8E2SFG67XG/IYKTOpY8ppF8G7uAZlpJZxcAUsmLCEW4BC6Znm1WE
         GnsjTlJi3aZ00kqxGhvE7ZkBTDVOnh85VL7BrJfv705SxSV2ELZaKcXXkEJUrz0mWeq0
         v00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ch2p+1ygk+wnRbKJXKKgzdmKdBItYnqirGmE6Tp7Np4=;
        fh=B1hO/i/sgpU9u7PvX7YPDYkGKdy67WU9qEBPIKs53As=;
        b=kmsWO0dJcYwzE4/4t46UlWI3AL+0Rth4nVDU7fQ80dtsMhY+gTjH/DhD1u4McWnCyl
         1lmaglfEV3aJKo8fik2Y7Hgn7je0Zb7zqw2crX8puAqIFK2TJa9GrNma+e4qqhTSf2mH
         WQgSzLBqezf17xTX4u0WyvFXICLN2LCHiC+WVsciwCkTkqkb5ewy1rf2shQPttzVP7Sq
         gmow5lSEGR1kwSZ/HKOLsugVOcUqB83m/4r6v0oHSiNE2HXuthvqcp8BontQ0soRAFY6
         YLgHmAdcjpLJ09xdD373aILNmg5geg9aZzHzhb6QGRZ5zclUACabnqGW89GaaH7kpXKk
         9saQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788353369; x=1788958169; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ch2p+1ygk+wnRbKJXKKgzdmKdBItYnqirGmE6Tp7Np4=;
        b=SorqoUXCCN3ZqsjJ67mgDjGHciXx+CHsCd7qV3ePmWxhXH+0pV1kR+6jaBzDp9LBl6
         /YgGi2UXzUpJ8+3Np9qqmQbSA0/koCB6evmfga5c3YrBXwHyUr5nfAIvIlH7UxrMDEQz
         FlKonWXeHski95s8/U6FJzNnz8U8OKwVsaSZNiuH99RlDhgJiYQXMMMpvLED7KrywClp
         vAqkEPw85ox2n74HhSlDywHNid5q+7K7Up2OXAlIS89c48oOjLHEvP4KJV2SROhP3D3/
         ncrVUXq1MzbYv261jnPgjaDWYy3wSxTwzyD2K6gPkj9Yt+d0x+R0bb7li+kLa9N/cCWe
         5hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353369; x=1788958169;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ch2p+1ygk+wnRbKJXKKgzdmKdBItYnqirGmE6Tp7Np4=;
        b=SRX9yAZpZg9QfvhywAfBMMInEMj7ikilFLv6Q3Bs+TOmQ+jRMFqhTW4o+yTu9fqgrO
         i5FRgtnfgQGLrN58/SLoA6mkaWk1aBmrddje4/GRCCqFxCAw7sjwsPw0wv674oM8LXSg
         ai6KnhlXbOn5gfexOFCsmguvxa1Uhj6PWiNBksEhdWSzbWj9i9NrzqzeIXw1Fhg+Z1ej
         YGk2TMtP+o6DMb3kqA6WONnx8/sVGBYBhbzDLIZ1aoNYR2zClgj72+BGywdXbAHemUlz
         FjQgujQ9Z/Z9tH5L2uVOpzImO/pJOn2Y6rLUHVVjlZEdt0MJyw7GarYuFR2VahOLCGLu
         8K9g==
X-Forwarded-Encrypted: i=1; AKwUvByRn374Aj1jnKNTPwgSxhG+sAo9SS17+UhfhY9lW9DsP9Pe0X3ANVbS/yjh3tUDp/prW5W5ToGyiyP4Vn4=@vger.kernel.org
X-Gm-Message-State: AFuF++l4ZeSl6dGPzqHZG8dxm94/EirMYQu6rhjAOasSCsxjNeNEXBET
	D77r+XbQZdi2mVj/0Er3K/3T8O4sYSZ7RKKDdYkMbPeVb3N9OjFYkOLZzuLZVNNvv+NOkBR4EPx
	Bju3ElMJRqGIDPcQYMYBJidNgwuj26lK4bW5PYzyW
X-Gm-Gg: AYBFou2fideAQAtWMgAssPgGciYJts/k7zagVebCnR8JyYK4ZxvZPvR1cWKSP/s2m99
	aKWH/kuApRwoe9yoGU/wJzvdOdWZDiLcu+nM73S2AVYPkQLp220F7PzSzZLHvjqUfsv68Rh0fyT
	Eac/AelN7KjZ1xerhXB0wgPJZFAGUc2FZKbJ7kD/9pI0f3aNo2u/rWKoqEVaSOXpqA3OdyvTKw5
	3JA1k65nPhMAcroyslbr9XqpikK9tXKz2ycfNp8QemIVeCBto3+ufdkEf8ppORD27lDS54PmpqH
	rXQVTHcMl3RVfuDJ8M60BQ7t4HHZBeoJSInQqea/W9tm32fdxBEk4b4R7DIo2X0UvS/PDhXAop4
	t9NlBPcQY0MGbdmIgU21fAuqYjkrBMlSHyGU=
X-Received: by 2002:a05:690e:4183:b0:66e:641b:f977 with SMTP id
 956f58d0204a3-66f9bd432c7mr1311760d50.43.1788353369031; Wed, 02 Sep 2026
 05:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826162851.2497-1-mike@fireburn.co.uk> <PTgvpjjPiVHpV5cb5AFpiGEjRsWtsYwuSeJJ8jwp3nn0KknPmUp9oGo1V-8erfbr4OQrH0c_RPZYYJWi6yV9FA==@protonmail.internalid>
 <20260826162851.2497-3-mike@fireburn.co.uk> <87cxv31yns.fsf@kernel.org>
 <3-IkUMhanJhClxwXLNvuF1-ncsHt6uM6GRmW78t81tKgo_5IO80fRJ9HZROE5RwlmxZhufdPXswcExj5j65ejw==@protonmail.internalid>
 <CAHbf0-F-KNQu5NrFcUw1JOwaVQJq5hS+d9OHTmV3J2Pi+hfOqA@mail.gmail.com> <87ik4qxmbe.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ik4qxmbe.fsf@t14s.mail-host-address-is-not-set>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 2 Sep 2026 13:49:16 +0100
X-Gm-Features: AcwNN1UMeKIwYlojNsoDIGEbdPCP3y4LKI8D7SqcrgpBy0NLocWYKVa4ZgbLPrA
Message-ID: <CAHbf0-GfEjax+n0H5FdCdsOUBRWhqpn=SvTL1BtNysDhvgZdSw@mail.gmail.com>
Subject: Re: [PATCH 2/9] rust: hrtimer: add ArcHrTimerHandle::restart
To: a.hindborg@kernel.org, rust-for-linux@vger.kernel.org
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, I take that back - it does have a caller, I grepped for
".restart()", vino calls it in enable_vblank:

    h.restart(Delta::from_nanos(interval));

I'd like to keep it for v4 or does expires-v2 change it? If the
concurrent-start race is fixed there I'd rather rebase onto that than
carry something that races


Mike

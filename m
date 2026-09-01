Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AC33938B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222492; cv=pass; b=SpMv68DTpPEXOo1aVm2+swPS5q0qJ0xb7zIJrqPwwEh4qI547GRLlp5qe69K9ePo9OQKnrBE8+S7yGlguHWXN3KgG2pkVENbuHWijWkPIERZVk3GaZofdeBeIoZ5yDuh+6c6YYFvOX5HjAXfB3SkFjQlSWSKvQRsyjjRSuhap04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222492; c=relaxed/simple;
	bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfksbOwDWUntv5wDl88zXNe6rfR0pbonrDInish2DZt7tew7NiKG5S6Fa6KmI6Q/jvGcS/kv207d0xGVlYdY5+3IOOfx2nLIZBcFz1DZ6voJRgG9s+VItSxJhYEq5Xhu0T1DvjoOTAQ9pzcY4eol6Jb/RnPIenEIxh4i0GMZ5d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOPIGbSC; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOPIGbSC"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d30c22b1eeso4495385ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788222490; cv=none;
        d=google.com; s=arc-20260327;
        b=PgylrYISBrko31RMP9j3O5y1EdQG+XwrtmIecgx7F2oKZPUjrKLbLLYInCRNerq7jR
         ZpkmqzHNrwvolRWkrGqMvdupEPMlGRHFa8A/OT8dibYNJ6/Ajt9AMJ89Kjio3PuZFtPc
         QKR12UKqswEdJsVz0vAWW9ZsAWMdVgdfvOmGd/Kd+mTUWaPSlDH/YitpbtTvRAo3dgk1
         2gJ5K1RBCNZOMKY84/o6ekzKH+2Rn4r9Mzo7wKTp1uGG0N3EJDrW71SpIML8Cbi1YiBy
         UCZQiNnGtJuOixnWpbUY17wF3taYpkBUdyIqpaLaUFgX4SQcm1uH8oq0LoQvIW/F9IUc
         GlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
        fh=Gi2CDDkRoUK/4nFABpcSu6WRB2nDqmYWtJlFlPwQkUk=;
        b=UZfP0Pqs8PQ+x7kbKx10wMWHxaI32IezpRn2Pvsryuqg9YRJpoVLvavn0iGAFXfXay
         xXVesjx3/K+Rq8CUbRS0oReZ2APC1xSEnUbmoeLsvTEyQNKZdnshwRjt/IkuG3MQYwnd
         1odaRa+b6VpQ2zHF0NSCf+o5VXQRCrCuP00LfQwNujMxS/+lrtOKMjAGUIYjXwMD9ixi
         xXG9BWdv76SfQKDt9Kpehy3Y83nnauYXXoHtAHvQx3fGK6sn7oVlHbL9SSSnIp/x3YSo
         1NcFkyS04Ol5fC+rmZoSCSReuJO/hK9aBx1B3weTWkJ3+tAQR6OV5CEme2IAJ/C60Y2Z
         v4hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788222490; x=1788827290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
        b=kOPIGbSC7KgT8zsvL2HyhT5OjI9GqbjLif6SUh2zVruCFpAbIn3UgHqPmNEZ6PJ6Eu
         OQK6A96KUTha1C+uclae67niYdOTY5U23j9cVNuv4kUT04tzO1BPG0pE0FqQVa1/NiBL
         sA3xEFtTAlhivVLeuZFuKeqvn1wOzXHVyOMMQNLj0wnWlUEGDjrIR2OeBdmVPax1be7W
         M9t8+8j7oto3WNzBsQ+4UOiNyy3DY3EwsiSzltmOEpmP7a+YmE5SZgRXBxtwugV70Qul
         K/WkxxD6XRVAH9cmwgmPXWnYYVpvBOEKQlGeio19lcA1kprtlV+S76aOHlldo6ZRRuYu
         bOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788222490; x=1788827290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
        b=ADdG4r/hlzng/NC2SP4eePNJ+dIcbXF8kzMKuXC/iLbrlOiiCfZGZroTFddGuB7Fav
         W8uX6WhYX2n47kwE1pepF3GaxcePtNIg806a4T8WIF5K1lvuB7oOcehxGaSaT2l02s8r
         ERfTrChXfG2BBMdsujXLxm3O+A5IsDe6AOcyAE+mWz1z343lM2Wsx7KKpwQi3OgCqn8/
         dLTZmTmwIGUgJ5Kl0hoOuObOOIuBP22Qp/RcdHuYMrc64XG+vRFu4EMauUjAX4cQOH5p
         w7Vw87mEpWujyiTfGYtyf5KF6aqPkDRuWMzjw8anvGS3MqxtDv42Emxp+FpuHx1wJYY0
         ji6w==
X-Forwarded-Encrypted: i=1; AKwUvBwGefjsBymNNDH/+LGDKz7HZlHkkFYNtK4kGD3VzQKBciAOqBYy8dvzFUQkNn1yPVPjq5jEXvKLVYmNm+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l9446GP0jlbpuoYpxd88s4YTRPEXAemhFP8kUpHIFKO4gpkD4+
	yn8xGkj96HEOYQQ9G65eRFzyToXefjhMnKPJWdkbs6rLc1jLy7J3Nyjr4atfwOOBJwmGpC2W+uB
	J2DTFCTWTfMd4nevWW60S3mnXsxpVA6s=
X-Gm-Gg: AYBFou26FBs3ozHs7U/tgBGfXzRHXPhDkm03PHF7UUBm4NZd90YPa1sGBw/tQ5s2kK6
	hyZQmnHEi3bdiWKeJh6ZDI3XzcgR/YgDgjHpgHD/fyi4m66MnKOwT5JAoJaFMvGIWP1PzJkMxRM
	FyS4t59eSyBBLqJos4IZJymPPhWeVjszRef4CjfMUNAiWsI9CfCwahHonDHlmE9zRNvDaiK9Z+b
	JIRqWCcZbzU4uLz8s2uBKfaKJlP6pRcs1Auc207Ntmg9yswaBQx4yMiUruu8mpMNZE+rTFwuy3Q
	tHas8zPSdu+rxut8D+phXA6sK61xDv/7+5XC/Hyw+1W/GYZDuzzdnuKw62RKHQ/klhkML0y4AFh
	DkV5qDqO4etzisJdHPi4HufbYvHGhfRtCiCeORIp69mEpH+zqdY8VDcNaBf6D
X-Received: by 2002:a17:903:2350:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d74df5ef31mr261774915ad.3.1788222490059; Mon, 31 Aug 2026
 17:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155033.2101924-1-gary@kernel.org> <CANiq72nKwM5n5vKWAmSiMEtUpsL=rAKpwuSa7bxM-CSVT7+N+w@mail.gmail.com>
 <DL3JU9MZGA18.3FU1H09HEPS99@garyguo.net>
In-Reply-To: <DL3JU9MZGA18.3FU1H09HEPS99@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 02:27:56 +0200
X-Gm-Features: AcwNN1V9DhjpMSG1N0V8G4wyJ1Bogge1P2e95CZaGW7MBQZWfFtCeU6dtolAmWo
Message-ID: <CANiq72krYryNZAEy3mN-tkpwg_jLg5G=jO8yW9OxcLGLpQAUZQ@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mohamad Alsadhan <mo@sdhn.cc>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:22=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> We can probably just allow `unreachable_code`?

Yeah, that works.

Cheers,
Miguel

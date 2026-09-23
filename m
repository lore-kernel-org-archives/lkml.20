Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E153A3AE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177960; cv=pass; b=SJcWQYiZE9S41HhPgBRHPGhR+jDbAoYUnJ2/o0mX1wjPho6trRt0x7iJga5FnGsn7+Lv9zPtdXEJuZBC3Dlo/013aNjfNdCcR6OhwzUQOcjelognxrj6akhk5WwuDQfXH+I24ZCjbfJysSeVt7tJhcfiI3zYKFxAFcodkLx7EmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177960; c=relaxed/simple;
	bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEcCBExNVn2puM3ujZx1S6MXm3sqUUrZKaK616VPn7KEP73YyqA5LyKZcUZKxSmzVB/PUPO2BzFwHH282UhKcdgJMQ2lkWPSOcg6YCFB7t/gA7Ha7hPG6K+Etnk2J+qRmUvANOVlDGQkI+/p4djk1QNZu5LZVvcmgLG4A0T1qw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NupUiLUv; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NupUiLUv"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b18f29e9f7so105788eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177957; cv=none;
        d=google.com; s=arc-20260327;
        b=Cx4v+KHG2Gb1KEzR7R58a0fzc1AafL6jc/oUydHAaUQjx5wdIQH2G69ko7Ajch9wxK
         kvez6fK8YCKZJm6IwmJ9dawVEnnFdgDZUZgZGxJZagOD3mU6glNrTDwlqUz9Dpg9MIcB
         rCvyGNa9ctOnvo/MYaW24Irp7EukyLONGOCtGSw7rdEn7xVkJlZs+JM4/n+cTXsZZDrT
         bDXiz+HlYitYsOVj7tUvrqNy5SfpK1kuBEkH30cVD69feCC4bGlIORyuGtndcsCY27sJ
         m5Q+qtyzLucFZy6meDVzy00TWzfDKp0R2KwJn6/oRrp/Y7QaiequYtV9yz4llgicjjjh
         v9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        fh=+CcCGMnRcHxFKpVBQEMf29wfy2Ml6AhB/JdycKeyyAQ=;
        b=hEZaXx8hJYaMYP7Azc6NcmanPz01/I607RXj67CTbse4xCmqjbscOk1CIPkI09oETN
         HqgwCYtNSZ1Mk3tECf98xM74fuV8anzWI2ufj2bQsGHMRrLIqO7ywxT6rWdIHLsykLaw
         dZ6dPNfPr6/hELmC2wL5e1vIos4u7CIsk2DWmLIALqcMvZYLmYiA0iHJZq4L6DgVQklv
         M5jv+5qjE98gN5oQavQVdhaZvivWgd/of6pOwl1v7Saj88c/huIbxc4ngwSr2jBNp+Xp
         Y9BuSd+J95OEqPWOnlrMuixraVBiby73FoxzqJO4yl6RXuwViXZj1epUhUfH8WSIpT52
         niYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177957; x=1790782757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        b=NupUiLUvsu7Z/KU+xCkZqtmp0YGwaKf2vFfzWTI3psJf+nZDndqj7oKzKwel6Oa+zn
         UJnv7kzrnHUMDBFcZSybsFOqNIFZbuPULSud2P3bNbP/TALLyXdEQxCjhi8JbJgP8k+2
         YC5fk/IwAQBmq+SFsJudjKD33Kg50M9NDqoEDaU30/Vpdd4gB0U0DccQIwLc1o8fw+t9
         jN/Ap6YtFAWbLyHE+zKF1cJV0/uempDWumF/e3nc0NkOXXjaZ4vXjFpMKXr3trUQPMxK
         DLGghUoUHdjiq0G4j3EItTz2pEWVSX0f9eijA75om7V7I09HT7QJ2c/+eHUEFrsWxwRE
         rq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177957; x=1790782757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0naHPaOnpDg2ShJmNsHR0YYIzm7VxWMF7m7wt3/EMw=;
        b=rR+6O/nBPibZW3SpHSO5OQ8O6RR1XDtaoWmU4VTm2owG4Z6WskHUH+1sDI9reIel46
         KaJU5uikD0H7LaquwstKyf4Esctfc9o/cE5yV8jN88A8JiiD6iJQMSxcY1mYE4sz/dL5
         qtw1WfrKi8oszIROwAWVPTYCw/V+O0qidA/spJbDggg5FaPCmvGimePtH7WEvixM7CEi
         Z+nfN3hKtX59nY/3a0eImoH4KpqQ4GBhwrFkNmCG9LqGiyM+KmytYs7e2aNhlugMyFju
         6m+cjzzxaM9e63pkr5yOYZ3mPK14q3hTz/2XIjOyyyM9AwiiOoZVTy2icEQKvUKslg0E
         NOUQ==
X-Forwarded-Encrypted: i=1; AKwUvBybUbezDiypUOwKRMevPtyuyWLyaHygu4qvNMJKcRwcm87/rhLN/jg2usKG8deTjTTveYkzMW4Mybi4ncY=@vger.kernel.org
X-Gm-Message-State: AFuF++kHYtWSyP+KoPqjHsRqyixa98CZDC49D/9Tai5w7AnIaysWXuQi
	NCuquQLpzUNwVGCCdT9xYdumOME4S5Tgz4XmhV4gUW5xL1sfdhd3HYNpt7KHFQR4pb7f7AMes0E
	UTZOcytKcSC9t+EQnPCzKPCgLbpvlIoY=
X-Gm-Gg: AYBFou2KygiJGKW2VLvIDNfM5JjBkd5duBY50z5qQ/6//ukXt8X//Nc1RctymIciAtY
	lbR4DdCrSOA4h06e8qGqXzwYb3JUTDhiSdhZXsZGxRfjdE5FfhZxHqN2BiqDKxAQzyk5IhkyWyX
	Sk/5nIwgH4L4j6foB4AH7SQMpAhQ2HBec91w37hz/X++8+BNQ539CnNJ/9jXduV9K0I+qzbjyH5
	6LMIwoq5K0alt4lSUrbiP7WAOC3VZ3drQidCHuCMsl0FoPdgBka2f+eiOk5h2iATjkLTlXaV9a4
	5D6DqmEKnz0c4CjBWhSV9qA7rLnK0UutxqIdw5xfmWd2rUzqZn3MY/AW/GN3y1+uEgOt/k0=
X-Received: by 2002:a05:6808:1582:b0:4c5:6b14:a2d2 with SMTP id
 5614622812f47-4d5b89c0affmr3913291b6e.3.1790177956718; Wed, 23 Sep 2026
 08:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:39:05 +0100
X-Gm-Features: AclHuK-QgcIqftUxh16QhJeV_h-FMaPzu0_1xOVp5f_OWxqLY_Kv1c8tOFDe05M
Message-ID: <CAGSyskW1M6ZMrSK6hTOinHOZkHH1H15Niq2-GU13EdL2BtELGg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/5] netconsole: allow configuring the rate
 limit interval through configfs
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> The per-target token bucket has no interface, so every target is still
> unlimited.
>
> Expose the interval as ratelimit_interval_ms through configfs. It
> defaults to zero, so a target stays unlimited until an administrator
> sets one.
>
> The write restarts the interval instead of only publishing the new
> value. A target is configured while it floods, by which point the
> bucket is empty, and ___ratelimit() only refills it once the interval
> it was set with has elapsed.
>
> Reject more than INT_MAX milliseconds. msecs_to_jiffies() saturates at
> MAX_JIFFY_OFFSET, which is below INT_MAX on 32-bit, so checking only
> the jiffies value would take a write there that a 64-bit kernel turns
> down.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>

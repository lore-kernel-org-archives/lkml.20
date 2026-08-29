Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCEE3F1070
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001321; cv=pass; b=o2V0d9FxDOEjw3ZqxkC22iiM4d9PsfTmlcMvl2zWpUQkmJde4ymwCFgkMl7U/yV9heKW0x/Np1Qzgjy88Ft2x/taD7c/muvIH1Z14sDx+1W/ggFOjtnGWSng5YQ0+I6AJ0/8jbyI4z7FQghfdB6t+6vgWYJwSmRoIU2IsrWnlbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001321; c=relaxed/simple;
	bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMX2SPxYanrjGXDsonUOzuakh1j4rCYPMr6FyrMkpDUuJMq2BZ4HscLAJohqsWd4JttKHXbTYcxVQMe9gxcIoY12vhyIqzrsA4bqg6rHdtPQZwWCVDWwDoBJBVlCAmGVDu9eUsUNNYHwKmwhOVbWl94bJdc68B4oXUzrnkJmZnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULY/4yEK; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULY/4yEK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d5862bc921so4451775ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001319; cv=none;
        d=google.com; s=arc-20260327;
        b=pyje2zF/5aMLxu79gIaBYSKrpB8n7OuOMZrlSHsCKLq1aJSgqa5vg998q/KjcM17KS
         jUaenR2ePuDxQvsQIybwOvjDPVNZk0Ay9KES/DXrvP21NHow8n5OOjPBxUwApQT0TKZO
         lZWPvHMLMZJOMcw9TQ4VJnoPbIkF5HQwtkdCjyJLUruW6iZuWZAAwGmfZBSaTqDOSmms
         g1SWRUSXKXxfJDcoSl+l+vzhK0suGhGDig36TH7EnZmhHLWDZObqNrKtvfmFkhyq7VgC
         c/PuUy1r3YxnV2XHES1ZdLtoq7ag6BENArDWsxdwDBF4cLON69pLzaCArozxXOksev80
         7dTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        fh=ET0DhiHRUAobuCDqxtvx8XmAych7Spkgy2a2rGKN0BY=;
        b=mKBO68rXdOMjmSs6RyDBWX0bFG6Iwli1UKxWpWHqH5WuZ4U3Mo6YNad6c/0psNfOCE
         TzK8xP7bHEA3jXtNCA5IydCfCb21WqNIQJcJPL21IV0l/0xK43XKCXAw88nKFjmpKXZ/
         nOteMxUH8aGu5X0hS8NvVc1THSWrbTSTIc66Bwndohg37IM2pw2VNKzNrQKpYQdUfjkb
         8atT66+WPKGXBDwkA2goh3rS8dK8RzAQnWhA2cmP5yY3sOn0dBdtvFlQvNVdk/GQvqds
         Hv3tAhhFBbvnwrY4bf1I14pBADGa38lOVfbDAgPBLknWS0cChTUpqz2RN/sg3MCh62Rp
         gfaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001319; x=1788606119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=ULY/4yEK/OIiEqWn0gINn/0zr+jhfFt2Hmb7UdU5PhDYhCKiZ/XEyFVW0fzWgR83FF
         rgDVvp6gNTgymqikWmL5xLfNdE0/GAmAfWcf0zBKSqfcyg+GbtCPgseRu4mbTV+eeDw7
         w6hM1fMEVUUD1g2NgAyU5A6LX/1rUtFHxVssN8iciKkldDjtCRyqdaZMgu8ZI2nrZBli
         MfjO9Bg6za2Xqlz8j6liqXDJ38WDtIl/NRRwJnPJw9oy+7tu4Ayjl6u9I4M8HdMzhjgq
         Fbu9QZ/RcF+77fA0G120L64raDnchxzfwejLB6GqZTN/4PT3ElQWrlPHzAoHIe1fXhcQ
         j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001319; x=1788606119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=cDTHmKYPWJi9DApJ69L+sXL5ynmaP9+OS3ulJ4FGJO5TQ/smGHzGBRwrIT4uqNYtJf
         mH0yw1uV+ZBe+XzbdQVQ45csqqTCfBwEv5nMAcl2FvsuAdHdnsOxEksoGRcZrDYD6MRj
         lgUzQoaemwRyyY9IXkWNiksxJVw5nrkeXuNe8sXCQHaxWplzJ4Tm4pCegUVaPsjEhNzM
         PYROO4UgsXnTSC5BldCeUrUJ9kqXo0+SeqOX5CuBmszZrBLQ3KcjvLpXxU49TqyLOW63
         gFd64bADZl1BHxYiZoxsg6vwEQIQ60q87HDxwuyHRaeQsZguxm72+p2gkZ4yTSfaMdkr
         2FTg==
X-Forwarded-Encrypted: i=1; AKwUvBwdZtNxqfM9KkkG9CqI5vuNN0j3kYRbz6XBlHeU9RpxR1xQPYg6EF/59i7EQCf8gZ8yxzK6zZ+t0sq+aDI=@vger.kernel.org
X-Gm-Message-State: AFuF++l50rNE2rBo+GMOMCB4fR5QSjkfZMRu6weGPZx+m8+UZIDV1wsU
	kytYkNiFDE6YHWhOkklC8HE045o0/aJEDJBZx0fH9ATViPTmOL4HLPV04epTFDs+OTjLNWma+Yg
	L4gUVDmW+oG9pur2VXkndGpSpzBpFGNA=
X-Gm-Gg: AYBFou3UJFdBve7Dyv0pT4C9z+l5xU3bncqMUaUo4OpNU4za5Pl2GYAwz6Q+j1HhsgO
	UV4Oo5e1HrtjVWuxPGQlsFvGEU/PO2ZfgFhOVx/KP5wlKFYcJ+TCtHuGLRiyxmRv8cXArLoMmzc
	puvnbj1IYrW53PLMMtRDYSOlH83Vsfl1eDpNi8Y+YR1PdOzELcI61EB3TjFnkCADFu1Km9uWleD
	1RTsra3BCrx3Wl4UoTGz9eGyCXkQTe8TH1GNlIfGZNgQPC4DV35kCXwdDHGk8yme7G3FPLsCdt7
	FH1n9iGrq2uS0fl1fMFB1Ug3mPjdRaj578DHWsXISjzW3Z5l7byNk0k2ZO/lKi4+tC9moOOou1L
	cz/KiRlWn1R/NwMYIHYLjb656Y+XDg9FaZxpZGjzF7I9Rj0B5k9stnl+9IQHa
X-Received: by 2002:a17:90b:5546:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-398bacc54eemr1390032a91.4.1788001318956; Sat, 29 Aug 2026
 04:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
In-Reply-To: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 13:01:45 +0200
X-Gm-Features: AcwNN1XslLuUNYYS77elbKGG8v398s8YpVlpDc2SDM6GYH7rCRkfYicjHiuXC00
Message-ID: <CANiq72mmxxrm3-a-sN7G=t6CEqHkG3MVvkfRMqe7NyNR+C7C7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:56=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> In
> principle newer, version should be backwards compatible so if we just
> bumped the minimum to v3.13 older scripts that were written for v3.9
> should still work - but it'd be nice to have a way to test that.

If they don't work today with e.g. v3.13, then that is something we
would need to fix regardless of the minimum.

Since some distributions offer the latest versions all the time, then
it is likely things generally work (or they are niche enough that
nobody notices).

But, yeah, it would be very nice to have tests on most scripts and
thus be able to run those with every version etc.

Cheers,
Miguel

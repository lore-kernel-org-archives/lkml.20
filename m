Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE71627280A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431264; cv=pass; b=oEb/gQcQZ/uHP99kSI4G/uEA++ztBk6JiQm7IqDzQ8ZX8uJd4EomhxW3hB825Jwy0CLYpjACZLSfLs11eLlR7q6pGkETEgyqw3zB5sDPxrRi9U61+jpa0tEA3Rxg75MYq1XPg47u02EX7bVrNDkbfIBEO/aFUryq7f80crv7gYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431264; c=relaxed/simple;
	bh=hmIaX9g2UY3IiA9iMw57vnMPvXkBT/g6WD/ssMJVrbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQzfsfuhmulu0FnsNOfK8ZLXu6JDjdEsGEa9mvy3Mj1+O5b5CTLwpOVKD8DXGrG4Lon6UIo8xdTUhecMU4TAPYk/Z+wQ4wD+cvyLGmSaPUvkwwklA3iy9CVKfXUUDVedVBF+PnDtmggd1PG9+bCajuj2WnqVfpeqvOIbZxwc4Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErE7IQi+; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErE7IQi+"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso4215a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791431261; cv=none;
        d=google.com; s=arc-20260327;
        b=hChawVssmkSTlkmTu/Y5whWfTA07wB9oMIrRePBxdICFSoxAHMANTjIi0t8bCquVyp
         wXfnS41Dt16/BySrpcxbJRqBQJRHqeQyBtWHwT7crSzr2MIpWpGF6on+TR881UzTsraZ
         i4CLwfbDwvLrdB+oQoNLzVWSeXCNRsFk4GbFWZmjCjZKUDiwWtOJU8FMr7+FibU4XuWg
         Yb1u4n2QIuvP+vx3gsQkiloVAdu9s7Mhl10jxKEjYP3urfQAmMEW7PuY/sf+6sS6XC0Y
         h55GHqBpRYUnEC65IC9guS2ATEf1kM9wgmDFptbiEOxpi2nkea7UZhlg6eXk1XT8T7Kj
         J9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o+i3IdPj88TN4eYMrOi2MDJvpLqv8ut+DCtbOvdTzLM=;
        fh=FiKfaty3cHarHyDacqPBgeITaAYw2jzJ3YL62holkhs=;
        b=m3fZbKmHXEqybBiXY0bqW1Wf805Jnhmze4PEC4rv/StRU6X0rnhEF7EJ3c3JJCOIyt
         Ynh8Osfcdm8dqTGPBErJnzrIcP3KWudhsPRfzfpnxuOppddVSD+N4uANAXiywmPxa7YJ
         9+L3YIvNwOJ++IJaghUp/D8F8zlBhsVvFG0a1YgPDk16E+LcsAdPq8J+Y/W5ik+1tVn3
         Dns0eITSZ5gLPTjv9nZk3L6Dp+pxEe793MQywogzjcc10R8uGWzDG3L98CCJWf7LnOKS
         tGAtYsEvNovOSI9nMl6OHZvi/Pd7bSTjh06NkrtVFyB5I4qVpr2LeGuTs3kNLNf11pmI
         1W4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791431261; x=1792036061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+i3IdPj88TN4eYMrOi2MDJvpLqv8ut+DCtbOvdTzLM=;
        b=ErE7IQi+X0+OxrOo7cjvN9T7mYmo+FWMGCwT42VmOU5QlhEGV0w7CwHfzR3Jiyb0/m
         P9QXKS2UTlRvqwYsNWI/VEPX5H6tvf9g9O53SNRq6fvA6TJn0+5g2L2H1huKW0jXTn7B
         WTlqQ6JdYCh9aZYWROT/Fb3QT8F9AG524wewQsh4Vf2Xv+2NOjYk8mcxAXWlYQYhzfui
         wD5/kEvHXIikNTlu2n+oDIGpu+34kZdDiv4H5Xmnxdj6HHe9B11SCSv2Q0PwidWxooIJ
         grWzsZgA7sCwrGTZqSTd7YdJnFLUnI2apsQ8HxN9RSeepWzzp1e2BFoiXZj7YaV+qvul
         qWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431261; x=1792036061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+i3IdPj88TN4eYMrOi2MDJvpLqv8ut+DCtbOvdTzLM=;
        b=I97OAhNIZE7TT2cbQAZYB4NxSumrFM+ASEpwxvT4AZxD5/1fNoErZQSFI+C7iGqsIv
         SxKe1mJgjOZdVfoqM/H67D/ObTEhbYVs8JOUucS5tg2PF5dCyuXMpC8KfZqugY8Rcy9f
         3KIHGjqYnS77jr7iR06YlZWESYpHWJ3pWhXr9jjCBWX7uHHMXBFAmmLzz3KurZYSsk17
         dAROBzwn0ZisbSmPZC5e+Pmyrf5/TlSrEQpT3xHis5AGv/kqVdfTRszbAfutad3ksaaj
         h2aTI5hkyTsu/Dq70ogKgQxzFl4BI2BLQSeAyGXFy7Wm1188y1PNI6sGKI68yguSxgNk
         WC2w==
X-Forwarded-Encrypted: i=1; AKwUvBwmXZS6HFnPe4Daq0ABytrhDcX3SquOx5EPb/UnzmDvh9a1x8suQcqKRaKS27SzlFTPnX63NYQNZ3atwDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2bcqqHz8u2tNf9bpsV9Nhzpl0RRcOwtEJi/N76cIIiHVrWlly
	bFT1CbmTw9vFku7uM7qsmdHdfEWgUqO3qyRp3gwEMiZCwixFUyvB8S1aOUDHm4jRoQLgC+eTO3c
	ih57EYUAuQ5/UlenoDdNN928JX0lYdnw40PMDP/KN
X-Gm-Gg: AYBFou2jJtowyimNe1Uk4L5z28R/3tpa/JIxZ9hkEkh0DA5JpV6k6CVuTH27R/fGf/A
	foCqSPOIFvE+Zw1pR1Owr4eFAtF6Wu+UnXf+gz6bpjt89PyKoIySctjpBcLs9OCYSJ16Mx0XGsv
	J831GPfxnjMoyF5nvi5q0ApVP8IO+q8V0n+nBpNr1/Hq+W4hxkBY/0bWZSDwizSBkQSDA7OUx3V
	dRtgtdj8VqDTV+cV2dhwa7r3EEK7YBZkxYXt1FkFUXFLx+xAf4cGAF39rKYuNTIt5pWbbH6NS2e
	QS4CS4Ju44M1dmq5xWvJYWXMKM5T4kE4Sy7lJNeJbvAU3ByZvUvUcg==
X-Received: by 2002:a05:6402:3041:10b0:6aa:babf:adeb with SMTP id
 4fb4d7f45d1cf-6b011817377mr26565a12.4.1791431260743; Wed, 07 Oct 2026
 20:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008033952.1399670-1-almasrymina@google.com> <179143111228.2527009.8261160290330374252@kernel.org>
In-Reply-To: <179143111228.2527009.8261160290330374252@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 7 Oct 2026 20:47:28 -0700
X-Gm-Features: AclHuK9sz06UkGmr5iDRvSbOq56U94lHz2lSbMyrmJMCxUT9MaMD_pYjvGf9Hok
Message-ID: <CAHS8izOxMs=OAnGk4WOqtgiS9s2YXDOqt8cpvhOhtoviRVJcXQ@mail.gmail.com>
Subject: Re: [PATCH net v1] net: devmem: prevent mixing fragments from
 different bindings
To: netdev-bot+sinfo@kernel.org
Cc: Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Ralf Lici <ralf@mandelbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 8:45=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Sorry for the double post!

The LLM discovered the issue while I was working on something
adjacent. Manual code inspection by me confirmed the issue is real.

The issue is not actually triggered. It is theoratical.

--=20
Thanks,
Mina

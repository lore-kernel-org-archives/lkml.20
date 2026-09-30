Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EEC43DEB5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798133; cv=pass; b=M4eJ/5PiRAZJnEa1Qsj1X1YanTD2b3oCU9FZ2RLS4nLrikD5UHl7q+WToSeQKG4eQMAOcR3Z+3uHnYLCp98IHGvU+Fkx9dZ64d6V0RHOWuQ53MbBNmSvzBJRHGk3DtUrmTv4DFgXL3q2EDVaGc9qiz/0NXP02zs19vls7V531HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798133; c=relaxed/simple;
	bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j00V7mB6SmJMIPj0PHNB/zkyQp2MaLvkpWGBiRnXKQp7qFAoeEwCrd1yKnLwJxo3jPRP8fgrEoiBUQUtXBVhBzVS4qfpIopXKSfDRLy3/o6FE3fSO4j2GMWyVrnBrhpyuD7GZmZxvQVy9V66kZySsJsu+RpHHdqXNL4mEvhERH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a/s5g6cM; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a/s5g6cM"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so756294f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790798130; cv=none;
        d=google.com; s=arc-20260327;
        b=WF4McDkX59dcChyDmupyYdNE2yqVUIQg2T27JY/cjMBNkHOLTVm20HtOhBUDKypjYc
         OS6OU1d67O+wiZap22/3q/EH9RMOzer1zh4nr4O4kmdUxSy5tDpg5Pb6njumSCMUPhvv
         8VhVIs5mcREjNsekOsxePbIvRZyoCvqZCLz3UcyUHARVLI0oIvcdJoonQ3uHLpj4BTa5
         xbcCn5QCdv5XiqEHus4n3hiM6ny21rH6dh2NZb+A76Y5j7YEvwryY76tdHNVrpFayYCg
         vYjGh/Q2/nE65zfbEPJ66ELvqiaj6ncQaO87FMejNnLwZWXYm8sh+gppNNCYY9dML2RC
         r7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
        fh=1wkoVl+d0AdtyzacoOtr80k9sjlRyzSni7gtwna9VeM=;
        b=q68BFSGgC3k6pC4TuFxeM9GQMdl/W9jH4TtpQqTc+w/7m++wNLnPd0C79sl9aegJLP
         8U0P/tjH+ANoPVwJji/uV81dgH1Hg2Z3PKOjY6vfIZbkGNp/zm42SDpo1/iZEsMquPtB
         WPi1TFs8DwFFBgGFCyycGYikubGlfHSRjrzpJAuZ7FYNQ4WuktQ2TO2gkHJk9sLmZAhK
         7toa7iEcMZ2BgaLtRPgYzxOqAWh70mX4H9jDzkxvVlFE/O6j/nbmu4+C1sba44zb1xEf
         vB0Qnin/9J6kV3jKMXlwTWsF8Gtm3zJUHAakh+21oPoVWrpy4x6d0tfbiLdv3Q6A1Fuc
         KHzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798130; x=1791402930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
        b=a/s5g6cMGFXCH40K+StRpvQWbMFyg0bGpDHtbKuiwyyNwJNDI7WUfRS7O45caQdD0r
         LurAmHCRrsG6irFvVBrfIE8e7V4plfIV89WXhfVz5lSL4tCk7jF0zK5OuA93xexaOeC6
         K5G20AhN2d55G2Rk+SioTlmWtP+3Mjw3AJP+wCwIp0lcdIbOK+jdjToZs50f03vqACf1
         0jd51FMfxogQBFhz5p17AlMCXJWYd3Pl9/E10vmdluFL7cLQ+SWglulPf07cNAQq3bF3
         Q26rj91rDPPQDp2ouVCsyyI61eU+phMHX7vaQkG7zxLzGc6BIA8Xxc/bHih6rKeI1src
         42OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798130; x=1791402930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMUdy7tDiX2awRwToea1X/vv/AICGI82qmsgusMQ2+w=;
        b=xlVxDnnbo+MtfZ8nuMm6+h2yzSsz28r1xMgvnT5h1i0wywp8udBmt8uQrIdi0XcGsi
         70fQ1XWNhd7rI0Gu600MpFs7q4zobYbltgBe5SoC4EWM98T3588mZwiTYg/RXw3nH+ku
         GyypPXeBheXfE/LtkqAcY0HBSnz1yLF6PhwZkQRmJV9C3l3mm6OueB2CQyM1vRdxfJUH
         Bzo+Jl0wevqytPZm0mdmpC2X1yCT1ez4wJvLIVwuv9yW7OudZT6vRV7KBnlKLUufFoWJ
         PD3WezFHg0wDUgncH0Hg8QkeWc7FK+WXusYoMpmk8sX9QcC0uq1X+CnmZWVW1ZgUJZ4O
         jbEw==
X-Forwarded-Encrypted: i=1; AKwUvBwHiD3lJBRklASYiqIqMNaVjIA1irZeD30+pxAjbQfy+57FOPSiZ+yyyEdbrpRgDe6IP82zLRSo8kAI/uM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Veg3haL+O1j1XoxAnSobTXNsgbL8bd0s/AVqEP18m7EqISC7
	1Bny+8gQliFhXgouK9+dPJPEpFbrq7pg+HavH9u1V+xsBcvPkDJDkNoXdoBa19u5SE0sPRNMIAH
	BNRsrEP1a/mFVzZtX3gtFaxRzOTGGQEzt1+mhm4gg
X-Gm-Gg: AYBFou1CSs8+6fU3lUQkgV8Gw2N94MYe1uUvIbcyygFJwgn7/WVBTukJQrRFV4sBDPq
	JHjgjWpxovHfqLhHeIFldbNH7f8q6YfbZts+eQpZjQGvqNA6osHGTU2FecomgOCgQRUEjHhz6T5
	XSwVWRKu0w2Iq73YJyj/lljxG15pPUt3Oy4HWp9N/PuZCRehQ+Cn+hgIV5JnW7L5MZ0ZD38emxK
	0/kfa6dWA8OOxi5vsf9mD9JTvmVjao18spEprZV4kZBo/NFJEZXGaG26/WvMxGiwgfwmZq+mchp
	U8tk3E3bs4uNPwCQN5eDHFaXq7HQ3N/jfNMjGS2LTh7XK1oIhfMOYb3YuRJ/EEcRy+wmm3lvh6S
	3W4ys2XMFWjSk8cpvxLEafNjoocOHp74=
X-Received: by 2002:a5d:588a:0:b0:48a:fc9d:fbba with SMTP id
 ffacd0b85a97d-48b02457162mr5782247f8f.1.1790798129262; Wed, 30 Sep 2026
 12:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
In-Reply-To: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Sep 2026 21:55:16 +0200
X-Gm-Features: AclHuK_sfXYw15I6fJGf7REWaiGXo9FpiV5-U-o9glg31QFqn2PhckzyCf-vAyA
Message-ID: <CAH5fLgim+vLu-92B2vCi28cd7xOkwAPTVtuGqDHF=cj5VmpknA@mail.gmail.com>
Subject: Re: [PATCH] rust: block: implement `Send` and `Sync` for `TagSet`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Thorsten Leemhuis <linux@leemhuis.info>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:44=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> `TagSet` never implemented `Send` or `Sync`. This did not matter until
> commit "rust: block: fix `Send` bound for `GenDisk`" made `GenDisk: Send`
> depend on `Arc<TagSet<T>>: Send`, which in turn requires `TagSet<T>: Send=
 +
> Sync`. With that bound unsatisfiable, `GenDisk` is never `Send`, and the
> rnull driver fails to build once configfs requires `GroupOperations::Chil=
d:
> Send`.
>
> `TagSet` owns no data typed by `T`. It only wraps the C `struct
> blk_mq_tag_set`, which can be dropped from any thread by calling
> `blk_mq_free_tag_set`. Thus, implement `Send` and `Sync` for `TagSet`
> unconditionally.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/r/d1381ed8-eab8-4fd7-8b15-1e94876d7099@le=
emhuis.info
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698362;
	b=Tf0Z/2XkLSF+IuY+Xd52Fas6wbirIbneqFzOkqbRzJOmiWa7p0pg5GvPIEvTmSYA1Hp6
	 lIJ2Rc9YwHDh2uCSGNDL41Fa6X/cJDMGm7f3eVybP67pY8TRFMFzkYVh6rBSpM0HnovxJ
	 FZfJumy/X9U6wtIWbiW9YgrL8sOEVCBlIyvhBewr4lhFegyGUdgWqUOoXuotx2GMIevof
	 5blKY/BOhu/7O/sIiYW1oR07v7pFSgWejpW3pA0lVkq9o+c+7lzX4MFQCVlr7E/13r9aV
	 tAEegL8dS9jcokukFvNtfW0/9bOOb1VneQ0mTL+UTuYAdPnVtXKgOoA5oB9GvC0VjLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
	b=5t6ErhVOwXqiUUIUJvr9SvYwk7lANHv11B5KNMQE8wlPjVPbPs78jrrUu/LZs1g5MBbe
	 eMkJspHWRyUkrhbozoGMCI+/CLPTmkLrn90v7v1sf96jIctFyVaJr+kpTdWPsTqkVtVA7
	 ow24/gRXFNCuXxYkKZYKn+NS3jXoqglhJ+LdqkmE/QaT3q8exnW3128xQgWl51oky+bL6
	 HEpUCvrtjsK8tPj7FalFMUOBlABWo+8YXaVp52iYcglYcEZyxUpKfqkNJI3ygy/mfUy6O
	 NjLXlpApCylc8r7Ne+Mc4SpyffiJimaAyKo9cSXhgT36aoQ4htqqpe+SYUl/aPnYR7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsYpiUGG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E916606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E916606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsYpiUGG
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cdc606b47so275351966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698361; cv=none;
        d=google.com; s=arc-20260327;
        b=KiqF83ozSWQkUHVw/Y85uJn84w4GLAI+IQ7MWgCfzbDKsvVd4riSbgQ52KACWAqfE4
         U8ZQCk+j+dWvzM8LR4/PUxUYMyAN/1Q8YUbPpsjNVNxBbtcd6MzqDprwEWMihrgwueYa
         pjwxDvmvuixA8kucU7QBmkOrBf3cw8tSj9uHo3s4NxaB0IbKYfG4ayoQbtkTDEjmFcpp
         LKZM4mEIwSWcIZKDwKs5Dqq9egqM+eUHpBmoM28MHO25SfKKkKxgfQyzgX+ZFV0Qe2dk
         wdWs+sdEyawViOXGE0nNybC5uDgBxGelLqpNN6BY4ds0DRN2AMT/0B0A/Nhnb212TwxE
         sWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
        fh=3Lspwh9ctcaM2YfTwCH0l+FtQmEnveAAu/oKFXPd5rc=;
        b=RyWAwU7S8k4v94lA+DF37vzG54Sp8v4qqMR1qB967QkGu2Is9PSZh47qiJtkjWCUM2
         mZnwQgECdzmeqR5rx9Dw8Aob+u8811OwGLN/hHYNMvmkjahzMX646xVioE6arZNoSroe
         BFf0g7n1zSPCnwmmS58gP5cS1nbVwg83FV0AhqY00Zu7bnsyln+asVarwPhpBkjCWATl
         8lTLEBdqE8/CK41EBwEuMAvSpv3ZXO8EQ4UCtRNBhUMvFdNLF2IqR4JQDN52nX6FkJD6
         H3s8eEYC99j5L2ZCbpCpskwRP1/zeKdDld77JAb3oets5dvSBRZVdTkgwGGtM/fR/mU+
         ovKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698361; x=1794303161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
        b=qsYpiUGG7sAYQAMVPIwk/BTChPa2IzLmTOB+8Vc1AmXWsJfqQXGg1oXZlD1rNH/ypN
         4Hz9uuhKvGZbWqm2TAvP0v6+Yv+/8GkU6dlGQLouBQ+Gi7KmT86cqYEHCLZDLMR1b1qa
         6IjjPMtJELYwp5w9v/NVleUxEGHBk1PeKk6em3yh/vi8XVPPLt1kaJaT/1vDgKjAZb1A
         oMXM2TS2rjdTRhKIonzIlzZm+B1EFmRZEAQkNMztWeAf0N/0voJ4/M+NsvKTxTlhUFWm
         mF1RK+AqSK3SylbtVtPRNnaFFXcv28tPXV/DIZ8KELRx7i7N4IaET5KtwNychwkRrWOL
         48HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698361; x=1794303161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
        b=fKBHqbCJu1Cb2xNz1QgGb7fo30ytA3tytNkrmyZFbS7SAJ8ZjuA0zlrGEi/tcPYvfu
         H2pGv0uRtsGBREprUAnUyfOsHDoa2Yml6KS9ht6dZEYa49nvGgCIsvH51s/UR32prIv5
         /75hWoqqqbwb/T1CAIrdiy3fY37wZGVUfipYskG7XlQnpjpyyhqYM1Fj5P5xltSpd/FK
         4+PakH8L3vddXHvV5U9KTNUypk0kol58PGOa2hCeEhZsYRto2WEbYEknEXi9mPjEAH3S
         SNNXyjWZGfk2N6w76Rbfb5mN/8aiYVqok1+gR1PMUtTlhxMNa1sgSYSYa6WfJ4k8D2rX
         j6sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl4gUOFLba4oHWXCpmw/QRjlUJmEWiEiekdFh7xxOp1CezqbS1oIa3dVli/E+ChNIREG2OPwb6KrgGp8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SgK1zkfQaPJumileMJPDyArxZfUFlKU9dDsnVPO2RylqFQgV4
	NzM6usWcROhrlqPawGasG13p/vA5h1Bs6o/fngQC9ynlz2GT0iMzajNPIqUiiT8DGW31V9bYEF6
	LNP66NWZqdv1vmU3k4Bes3UmwQ1cF/vA=
X-Gm-Gg: AYBFou0ieAw/0bv7/0yedwEyonYmvH9bFRbvzqQcbHaWA+yhuWECh94JlvXu5HJb4ge
	KrE8FaHZGg53eS0mYuOO68xRjJBPqUTz8j0a8fPePCl9ncRrPczvNGWLTT5RqyT0TNBCbdje5iP
	q1nyuyER0tt7Ow/w1cZ1L83KSr+SGVvAP2nZ7De4qfw7cSdkO0zqeeewRoxnq5AHtS5cTFdIWKf
	ey+Phm6QIU6Mc7WvUIVkkV53xq2/O5x2mtBsApLMM4GCT0l9aXejIvhHpelK3KEDK8rnKbEzZzY
	wKnoNfPJ5lj9h6V4IzBoGQHAPzgkRI1IGxy9iDHCifnOUt8Q7wS7x4S2iDbRSm0w5wRpuvA40uk
	P9VIyuRQt/KrqzSUlJA7iRDoNn7hsGT5oe8jZ7rqk6IBt354lNSsSHg58YVr0S5MHthzItNqLgx
	cV0RlqT465tb1sgzfC3U9P9rSpt/tZfaG7PXLt1DZgcGQGdp9p++ScXuJEK+G0l/a+qFk69EX/d
	kq41P1281eHPUNBh6yyoyYVMw==
X-Received: by 2002:a17:907:6eaa:b0:c40:bbd2:62f6 with SMTP id
 a640c23a62f3a-c4ca7a730acmr1005018566b.19.1793698360533; Tue, 03 Nov 2026
 01:32:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101184915.33899-1-amittibi123@gmail.com>
In-Reply-To: <20261101184915.33899-1-amittibi123@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2026 11:32:02 +0200
X-Gm-Features: AclHuK-RtmLK_Q39u8fbW3hnbONKklVvIvh3AUZDr2AgWSlxsUma7DTEWb_oDSM
Message-ID: <CAHp75VcnkufMDT-NV75jzR6qKH48KbPnUgFHUNrHMATZ9NQrMw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unused ssbuf member
To: amit <amittibi123@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 8:49=E2=80=AFPM amit <amittibi123@gmail.com> wrote:
>
> The ssbuf member is documented as unused and has no
> users in the FBTFT driver. Remove the unused member
> and its kerneldoc entry.

> Assisted-by: LLM

Drop this tag (it's outdated now), instead use comment block, after
'---' line to describe how you used AI.

> Signed-off-by: amit <amittibi123@gmail.com>
> ---

...

The problem is that Greg KH won't accept AI work against drivers/staging/.

--=20
With Best Regards,
Andy Shevchenko

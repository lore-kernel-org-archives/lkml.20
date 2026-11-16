Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794835058;
	b=b5mY4WW1lFnNOjRUURYdugTLEF6n+v6x6sMC9dniMhUPSOPP2PhRYcbOhcs/jM/vs4lY
	 hIZDkd9tK3G6t8PMEFnsi1AdQrdwcW6Xd14yMcJvw7FFmHa+gl1BcSnMs+HNdMt6C3rTU
	 clx4RyuH4GPbSQJFTup2mYEm3/j8/OPFD2vRhNxAtDeEYhDI+Y+BxgpMIvaLPQz2YfdZn
	 thyX8NaEQw13xErlE1cUr4aUNi7Ai6MPgI+InYcZg5ZGEZuDkoiPL0e1n3ln4Kht4aOG2
	 V6chy7Ahpl4qocmjk7RqlB769qIA5+61bAPQVwMhnymJDb2d1wOI/MavLiTWMnVs/0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
	b=Rt5l6qUe8I1IiLEv1h8GTh0AVbrZiH52Lv9nh3BszdgrzPF67LEvgVxwY6vQ7eMPteKs
	 zkfQs6CUxJRMPmOycK2E/P/DUci23ceJyFHXWyX3ahMTJnPiax1Dp8M/nwAgY08K0NZBv
	 HhJYeVF0NbJXjk6prNnSFHuTGtOzanaMR7zCZwr0w9n/PrAHop51qFdXPdkf1SBZMN2m+
	 mhwLtTGoYLjzKKJdEZYE99JwxHY9oOAYLNi/ffT6rqiEyXMgXXoDRltResRluf7aEXMG6
	 qt0ATgvFY6JvnvG3gNJohUfKgVMQbkhzKOyMOJz36MK59JhCXB8f+4iWnQazpSdV07w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdeHwEXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC3606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEC3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdeHwEXL
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4adaa0f72abso4179773fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794835057; cv=none;
        d=google.com; s=arc-20260327;
        b=nloXI3OzOVyaTZUK5jUR8fxG/h6VFXzdCLp/iKD5Qi4gTUhAcM/jP7PEtoeHc8+VkK
         Exu7Ioo5fRCLEMi4y/tkGZm9UypalxSh2D+WSHhbhPfOt2pvkPjcbDxVzTGrrg90zAtv
         mRvW4W4JowsEvA13xhSA65qQj/UNwU7Y/SH2yaUakpzJ/cZ0PCULtle6dyjObg2RnWCW
         T8FPMiF12qlV38gV2a1Q7ql/zMCKNVNHn8gjdfovknImQrpm/iP/cNq1f8OgneQjJq2N
         Ky0KpXDIhwtCQoSbOwOJaRox0gwZT9c3zrtR/JpaWIbSIuM3peVBKZ3yHf80YLMPr7gm
         YBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        fh=KgU5H0la9UnAcGYXMOCPLPhtK4Ind0kLeH0lMg6zUZ8=;
        b=isqKXTTGrYoEJfiefh36Y8z5hU3HbKVxKZL7bpEewzAIap3lQM0Rx5lKckKPIxEUfa
         DDkFsIApoXAam4JuW1zib8EIsalKf0bOV1Ia397FGYn1LAEOCoabKMjqph86Sfi7SEJj
         tSj5wmuy8oPdPAWtsyWu4t1Br6G3Wx5lZMKRIY3jVaEn0s83zQ5JEfjaFx/Sc9Ullr6v
         3ytdR74xgJCojuekbh3C0uS2cDIrRhn1BPmeyOF9oTdh92aouA5qElrf79qOjAfroAgq
         fhAZnQVU9vEK83SE0331vTgR4sI8p2e7uHh7+esZ11QzGpLehxvJoV6zz8fG6djBCFku
         ciaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835057; x=1795439857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        b=VdeHwEXLxTQ5wqSxntNGvc9Ws38HB2eJrHvik4aokKDtjy0XuYwT0HmNIXQkAvE3FI
         oO0WG9M/cs+ZkDGSQ2qAD8FahJH1JxbX205leePGzXfIq40RpvwyWBBa7cK1kjeiHoJO
         adVyZ6kBjdwSJbPGckd6m9d8Wpeba28HJmhc8UI4rgFcxKSInSYHr+lgMydjFrDIj7E2
         Ioi/sCbpL/FjcAcl6H5XjiyeV4uEXkf2RtXo1m08PhyHynVM3NDJJelJE9wDafX+lfOm
         fexyWP4kBMyhpxjtolVoEZVEJd7whEkLSpsECAJoP4cdKmL9uNNO1aQAfiLYSkfbDLec
         QLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835057; x=1795439857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        b=uQPGCVqCQoz4CMzm+4jo/5QrQUmlbzOn25WrQkcb5inJAhRiPxN6Ioj8pvnaVSxZOt
         gadfcVe9mL03lJ7P01WC5kDeIHjQ3eGBJ4dJqNF3r6YoJ0oSJhAPyyWzFfqUA6FhbDRi
         iqUx2WGAmm4Dggk5DpKZUSqMsEClh9n6mKToFeeuxtEZRK5nIgJeDu0lmaJuS+2i3QFo
         Km+GGngEOo3tvAh5zpbVXf5+PEwI9v7s9hjEqUdcHHLuqupFM8q+PaAaM2zumtnAAyG3
         v2fPwt2mqdvjZ525qv6IZxpltP9s7YUMJnmCYGy3AVCZlknQwZTqcWSMCdeiayK8LZNP
         bgjg==
X-Forwarded-Encrypted: i=1; AL+hErHW/lRt6zCnogQkKgHrF8B5rAubBvIKMBUwBraKl+9Cg6sG5KLwlJarbs6StV9ZI26rVdSZLfnPOdIVars=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uPwqgMbeJ9FVdy/ilIrQd9Pj9rC4Ukh+a7tAq/7UxHIFSe/dC
	LpKmH7irK8DTSFCNOMd2HW3xPJgORM7c8/qfwYn2OHO0YuDenAxy+kRtd6nKRrM0fq1iFuEexnj
	7CjYKz1lGNoXoT2yp9/vLSz0mrXPJ1CE=
X-Gm-Gg: AYBFou0cRh92T77eW2FvFAh1JHJTuKVlgfETJ18tyHgQhzSH0VwlNczFh1oJi+j9F/r
	8IwChW10S8y2F9GXh04LOvLHxbx1zBeEYtR3BFYYYBqUwg9OJGkj61+U4w5MBas4arywVuTCriu
	mSE1dtwEbdyZBGVTTqziagFljXOvdEW0ShfrMA2fqJtX1ENaCyw86Q2nlTY8h5LbUou6V0/9bWR
	ZkTzW92wSTh/SdSvtpd8f7eapE3ERqQQhwnUu+unjtQq3zWxacgIaskT+VJ8zmd+Z1yF98PvmbK
	/SUumcGu8xyZsEbdps0dO3bQ+lhwiwqPU5aLYpHHw88TJS2zJat/CdEQ6UokXQEK72K9FJmowl9
	h4W344/ZEGKtXA9hZal5JgMu7R8f/pwgTEGKKA8Q/woeY5sNYLpdLBgyl3x3gPzmXWEiDt+M9r9
	A3Tvgy9h+xn910znvobSrW2dLU/dmgntgTa11Q3ShLw6W0EsTrZ41RQonk
X-Received: by 2002:a05:6820:2911:b0:71a:dc2c:ae3b with SMTP id
 006d021491bc7-71adc2cd460mr3609748eaf.16.1794835057100; Mon, 16 Nov 2026
 05:17:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-exp-phy-rs-maybelocked-v2-2-8fa7897a0352@gmail.com> <179481441244.3136.17001607410238147789@kernel.org>
In-Reply-To: <179481441244.3136.17001607410238147789@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 16 Nov 2026 22:17:26 +0900
X-Gm-Features: Aa3M54okYT4QHq5C_H4ZZaGZh80n2pqronqCTMY0U8ewYc3mFcR6BO0CjcHXiwg
Message-ID: <CAGAB665suSc88922+wdYBJrmMsZvtx8KtwQmo72KZGm1oGN8Zw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v2 2/3] rust: net: phy: make Device
 generic over a lock context
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 4:33 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: Medium]
> Does PHYLIB really guarantee exclusive access for Driver::suspend?
[...]
> [Severity: Low]
> Is Driver::resume actually called without the lock?

Until v2, I had left suspend and resume out of the context analysis
because the existing comments already said the lock might not be held.
Running it now, resume is always called with the lock held, while suspend
is not.

v3 will give suspend the MaybeLocked context, list resume with the locked
callbacks, and fix both SAFETY comments. I'll also move dev.genphy_suspend()
into MaybeLocked context (while it holds MDIO bus lock by itself)

> [Severity: Medium]
> Does a shared reference give match_phy_device any protection here?

No. I had kept match_phy_device for API compatibility, but like read_mmd
and write_mmd it has no Rust user, so v3 will drop it.


> [Severity: Low]
> The commit message says:
>
>     Update the documentation and SAFETY comments to match.
>
> The from_raw() callers in Adapter<T> weren't updated, though. None of
> them says which context it is in or why; they all get Ctx = Locked by
> inference.

I'll try to compose better SAFETY comments on v3.

Best regards,
SeungJong

pw-bot: cr

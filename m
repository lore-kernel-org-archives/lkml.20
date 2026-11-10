Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319294;
	b=w2jIDbBnTEnECWdbdyWuzeqqv3M/0tWbl27WkvWxhb6iphmr3wWy1pnxGcNnU2gsvtnW
	 GfeW5NUvM8sTvCQA6vVj8X5feATvgGCMWKnRnq+xqL+xjSKcwz01bahE1mC+L7tiMNPzv
	 rQzchHtEB7es/sajTBn3oMBwrcrofFKwgP2x55EGztGwz00tssQU7xqgQKXtENSZkVtaM
	 os5qqPWBZo/f5xLhOjp/VeQvYfekWHi5Dn7N2ao/Hax3/uCRttCvWS80CPoXcxeLOLBSh
	 4r93KPgEiAeb6Gt0EXB/FcD8out1M0rlwBETM7N7q2XQTevCFlAZ9+DHVUsyPEjbrlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
	b=pDlzfV1qp+tR2KpD8CsEqdnY7ltXY8HWRkqEvYnjJ5tKCX6JKjK0B6g8PDugkNiAswwv
	 Z7v9jrzw+wA30rFmXhDHXsQ04Ee0Gy7/gRTIkYHne7vdTREBBC7J/fhcEEjudpnoieDV2
	 GH+/TM4n2lJPP9DlJHS4Xgh1wxmsTYfLIJEfJepRmkjKoC6s2odgvA++THbjwsTXvu+ds
	 vn2jTvZmf0r4l8pc6pZwNC7Wrhgo3nWFzndKVcCBQluVRSMokkiR92O9Y6IuabpDjrSQ6
	 bv974u+HOCmcxm/9zJqluKndnDo2xcrEMENBgeuoncXhnPpGrdp2/r2+J7HMEKGag+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQJdOmE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B96606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B96606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQJdOmE
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso1709961fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319292; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGWcqqpJPfEIGre4IrKheSCjcCxOfcBnCvKbAL10lqAMscYakYEn2J3F4QqeW4aeSZ
         oMJqrbKscs1hmKYZd/iq4aj4noqL3xlnnNcyp98+fZ+YWvGAzzfgcAd5jCTcKxFYZyV+
         tBkDGHX61ysJhYKAMEXlL0RXU5eI3Ey9oZZzvElHXK4Qrng2l5eho9rxgGY7e4v2r6kF
         BSrTsghhpmXt6C7mAHxyoau5aTlCG9bKpM1aEB/iUxicUzhQB1dw3YqRw2mLkfKWH4aJ
         HDwGQf9H+ZFs6VYO8yH2JCecn+EhxFredi6NZFo2c/PFsSQCnQteePF1di5RYvQmJ8Su
         VoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        fh=0OG5JLd26J/8bV1gIr4en0InzNgYXhRpLqX1f9IyLU4=;
        b=OYx5pprnYuaGc2GL0NsaUi+2E6Q8WsrqbSjN6H/0mkOsx6UE8dpMi16lHXX7udhp4W
         y4mwqP+V6idzocIYEJ/8+uFy3f6/MuANFaivH++G98DA3unPfokCpq+LpvRWSN7HsW3B
         IoSfDfy87jiFyLI6Wn6bPQ7G/K891UEsHVUBN83PxSUo3mVCihj+RolS9YzHVgfCmIva
         qC2ClZSC5BSiiPaEhI1FilRpoYR241dgserNN5FLrGKJcB+6j+lt4Nc2WfqpFfcyrwnZ
         WpqARh+s2fNhbqU4gbwmlFVE37gJWYBefJLc+4qthENqOYSiAnbT8jNBl3j7N6yLTv75
         EIiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319292; x=1794924092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        b=vHQJdOmE7N99ngc9GoHAnY4XLWpwuSZ3cwrSpmt3XwmdlNzQ8CClhnSQh9zqWG3jcL
         xgJHBB5aq2uFX76Xwmk96UBQ4Y+NplELrVa4n5Bg7U0AdHFWC5CHBoLvv30ucyjs5X+F
         FhF/WYR5H/qiu97lauKnvnWkN8YYGTpEHdR4y0Ur+5RC9dRUG4yT6SUdOjj1u92/8M9L
         aDpD3LHIap323RzSXqWy3uJ+56pURPRZAx6NkY2Rem0bPOqhgpW1d7cTHbmpT1GluNvy
         7k9bwHjSyZpAUWyQ6sZRsNmV4b6iqlXR7+N3LOk2OJWXrXYViUWXzT4Phdj//LTK1iws
         1CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319292; x=1794924092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        b=KhoJQMxXOSaPxX0T1xxjMqlON6zFp+sE0U6ayiiVhjREdQgNiNaGpH543CTCVU8Uv6
         f34spkHKf7Z65yYiDWKknyOWX2sETUk7R+e72wHUQ7UrxwKh974Ubq/DERo6Kh1Nt/lV
         OQPfxV3aIObjK3gVMlA4Re0itw7Sd1lAVzTTmdfYIR74TBLBL3j8+LBjtveZpIoE5Kb3
         YaQZBq0ljAwcYK+aB/bKF468HoIIWUn8omeR1dB2xGoaUbn627EyDL+fYkYPilyUg1OL
         pf0IETRVIa9kXhIKNSckE7GYuOFOKvRYf94Vvsf8H4tFB24rU3xlO7CSfuxjCxjI8S3Z
         uUXQ==
X-Forwarded-Encrypted: i=1; AL+hErFDgWmxuEIPFilz+aXRzQYz4yE0dpuI8WABMEpN7iTjThEWP1+TuUadFTuvAcmwhoAhCVJNRJ2rLrya9R0=@vger.kernel.org
X-Gm-Message-State: APuU4Z93TBmMZZcI+H/+YdK7jK43QymSFO2kgLacY7oBzVkCAHb6V4ob
	K8Zmmc72+15W7TkpDj0hXPe2OWkJb5FMiIlSeRcc58IQVGPSPaPa7hHjo3ASzATNguPT5rEQBeP
	DhvTXUyotrYhh8Eieq5WoQLKThbK06rs=
X-Gm-Gg: AYBFou1sIm/BIAqQ68tdxiAFlyfL3554IXi2mRZ2/1uCwaIwmspeHnVZjF2zRTjTfoR
	DCpkjNQhLFvVe9YNQAZV0llvFSJQLdT4oQD8/sQv7WqTSW8lB7c6jW0jjP6LkDETrlodRxCzxxM
	vBdx2RlkS/iOI8gLqQkL7QOvHUy6OX0uhaGfUCi5GkxJPdzTixPCXCb68q1Tcp+l1fQ9mMtFXYB
	ucHvr+/ZAU1qtZsIgCYql587KCtFbu73EHQ4Prtc1cQ1+M1JlQnPHG1rX8AnKxmEyKWQegdTtax
	NKaBP1nchHTnqibFvYnIgJtBDZgSJ4pedRxNlfOtxvO7tv/86WqEf4+PAiDtLQS+A1yTkMXm4PY
	EliFeP95GTkcOX2d+Stbb3xArEHkSZz5XKXBVAqIFvfi686Kpu1X40n0wYavfuTifFDfMb+r3zt
	7S00TmGEvwgRl6sQswHJZhozS2zHfW9Sefxtid+4PjVd4thQJdbqtKies4ycxoW9VeaDEWlZo5F
	8+Idv3OeKYaKmdv7XjZeXlZLYMPt5qqwz8=
X-Received: by 2002:a05:6512:8348:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c1570347a1mr743203e87.6.1794319291749; Tue, 10 Nov 2026
 06:01:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com> <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
 <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
In-Reply-To: <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 15:01:16 +0100
X-Gm-Features: AclHuK-FOwKiNXD6KSO1bPkfXxfGEuimosgCwy8tkCUl0DXr5tJYqmZdtl8uISc
Message-ID: <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:50=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> Yes! it was to match the other one. Since there are more tests the other
> way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
> have also the #[test] attributes on top where a #[cfg(..)] is present).

Yeah, then let's use the existing convention -- that other change can
be done in a separate patch if someone wants to do it.

> It was on purpose, I thought it looked tidier separating it (but it is
> just personal taste :P, gonna revert this in the v3)

So we generally try to avoid those unrelated changes, though sometimes
it is just easier to do in the same patch.

However, I was asking because that removed the line (and you say here
"separating") while later you instead keep it in
`owned_bitmap_out_of_bounds`, so I assumed it was an unexpected
change.

Either way, yeah, it is best to not include unrelated changes to avoid
confusion.

Thanks!

Cheers,
Miguel

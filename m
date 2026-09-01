Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1B476CC7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254621; cv=pass; b=LqDO7KW9xOC65tmD8MCqrfeENCIPamXacpnOaK64/68BmYYFeZMmSRH9aBZZB0uobSsXdNl6eEZppSgRzQ29fMmhzV26tmI9STq/oUslkGNEoghLOsx1jsrZtSruX5u9Zp4PrClhCXSQWdL5+4sSSNuBMcpAI5WzRLvHLeZMk9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254621; c=relaxed/simple;
	bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJdmqqueI02B4f0J6rXOOTEjqlC2eVttUKCSEYBC+UKMhGeOWCSepvcz2r/ItZVIVrqhaOaEijdpqcneSojS+MBcOCCh6OzHC+/z0bzo5p9aosG5MzQsy3Gm/MshIyDerrKMN8PQNCNZyHXUlNJxMByMfRRc+OUMDRMztRWEXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=senALdi9; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="senALdi9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf110997efso5765805ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788254618; cv=none;
        d=google.com; s=arc-20260327;
        b=IrzSKSDPdLE5JJkvrwwPAWBqyXIaBOSoyF/m219yL8NOwlzLJW0IkXroOFAgfjmtRP
         4+YejnLEJzRqWxo4Nec6kZEbY/5dpKU/KOhZlRY1Z7Fh+5WnyOx/aU6Wt5ORBasv4dlK
         Zti98DuwQ214Gi2FxWHGWId7l8uRB1E1uDI/UR7Hkr3Fr/1ngJOsZapvYmwLnkT82Fxe
         qU/Jqq2lJdP3ztat4mk1BDllCbBeDbIkS+M9aW3Em/5zD+pxJe1OtsKnVonn0rqMu3nk
         //RFSTT429l6W67NCu0sIEsdA5DVzPEQ/dhBXlLM9WrD/ARcoBAfoXCtDP8y4hAUuvqZ
         l8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        fh=7xDhkH8MV0aZ6ufc/1nw5DOBL+JBxRVy0briffu3AhM=;
        b=O1eRZlzd76nMFIHp+dpBn/798deHtREN/TZ+A65I8ZZ97dBL4XgSjD4sS1nJJvmGSH
         FnduWWaE3FhRoesYOdL29ez4QVtAvYRS0TS2yFORZWC/dArkZRFR5cYBdiQDXIHqKFSQ
         zksneoIJXi4/7iCQeDp8TXwiQfiib/3e7i+WH5sVpsMaULthIoIsZflLAuE94sOoZYKi
         O0Yl+7kUn4XT82y7zaLfKWzq3dqVSzkua+QNvRL8n48BTbuarMGAG1X9K9UYaMDL1LDl
         /l0pVps/NfN2oM2Wqv0KzW89/PIY5dd58W+IgD5my4+6aeArOuZDcjwmh9m02yTjEPGo
         QiaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254618; x=1788859418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        b=senALdi9UDiZ7KHDcZ5OeDSz+2y25j4HCX1m1YaJgn1RrfDCOR5G3jzqvQUWDQSqgK
         HctasnLiDhC8+WMbjV8JdfLzaNXRPNFMqfCheHiIR6LeDucxaYWqXZzL/UHzi/+ZliJ5
         fyXiOlKHA0ZVV/kO09gGzNjG3mbBSrWgA4H6Gcm+TaTtFIDKx6kz1gelLPWkFIi9/7lJ
         T13p8aRf1VtP8WRximdeXpH9zFE+HZfmaRRX4wdvggD6mVXBAMAuoFpwAILTojvoqUY+
         /pyXVXDdgYtopq4sUoZN98ZbXnBDaNF/lo5bgwt8xWZnp7nuioUwJmnsnCDiskoz8qbJ
         NJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254618; x=1788859418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        b=YbVJoiXzgEkE6joSqslrqW8y/rCuFg3sX4yxQxaiyXuhINcKjwOM3mM49uZkbKnLTt
         jC0OgxEJVLX9sECYu2meVAL/l3nmlN74w4MBxtBIUCSglVP+6gXr+T7B5mWbHNk2g7yk
         t2V6FSeRFGdfbOHY4BWS8+AAGEcBCBjU/VT3BDIaeh4VoWgMMTpoOj2XT0Oyf1i9GFvW
         zzvm+AFDIReu0Ik2eZiUTkOfHJnuH7oY5z4clOdpSqTbLSlDCkoOpa1FIFerYgz8YKLK
         j0HTfkEh2bwH61/bHCLuQ60PYHINE01YMz3ztvNPszgEBUp/2IJUebi9BLdiVajPgkZR
         to/Q==
X-Forwarded-Encrypted: i=1; AHgh+RohwZaiegJLF4GAqdR9DnAe75GtFVSKzHzpcb9eFgsENi/fy0FPcwSmxQjxxLYXvB+2Tzkbi+sNDwx++Cg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOremYDZ7wXQiCCyfiHV0+lsuLcLx88ozL/JWt/8ZxQgpmEAbx
	25jU13l0Vrg2ye5Vz35PW9wLTYa6gmq2/4V/FhQbSgqtidxMJP9anRYZrSM/tQ6Es2sfeMK66ie
	zOSn73k23PX065WxaWCk/mwHiwCNjHOQ=
X-Gm-Gg: AR+sD13+1twXd1DD5axrifJi7WyVBqCekwvM3P5fQ8I3B4W7KE92sftdmTnC9f+mELk
	0EAgbmpzY4AKHfx1ZpUWPxfCslsUyblhX11AKpp7RWweKPKClqXK1sFOExJGcH2naVOwpx5MYIH
	LeC0ghSnAmx7ls7TeiHIyZ/a6HX8AY2sPDLo4CtEjwWo71bwI34KzIhPC5h/1D3ZNhlrL6Cd1HH
	F4ZhClAeWhY6EAH/PZ/euaxq14o9F09dzQkyRvN0KmLpKprkvSJXYnal6zovH0W+uQvabezVblb
	mSbPSYhLH3PbuXOIjdPD/pjL46msCGz/qCZ0wAUle1L4Qe7Uhzd5yd/b2KfhAQ8ylfl3rDWri6x
	1lGy2UEWGAuWoqMjkIMmC16DaHqzQK4NAMU56SdadG8v8G5P5DL0+2M4aMNfh
X-Received: by 2002:a17:902:ec82:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d74def63efmr287603465ad.2.1788254618249; Tue, 01 Sep 2026
 02:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831222857.1402608-1-nico.antinori.7@gmail.com> <apaDisOTtL5r5a3I@google.com>
In-Reply-To: <apaDisOTtL5r5a3I@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:23:25 +0200
X-Gm-Features: AcwNN1Wu5eB_orv1F9sI6JCQIgW-VSYn5Wsv7lEuNcyDT35EUe2cbQX4qrZM2lA
Message-ID: <CANiq72kZ7+fhEY3f-j-OkoYQexeBYpnNsrkDtFuovkPgBpn9zA@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: simplify Result<()> uses
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Brigham Campbell <me@brighamcampbell.com>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> I don't really think this matters, but shrug.

It is the style we have used since 2021, so it is for consistency, and
it preemptively cleans the `useless_default_generic_parameters` lint
Benno requested:

Link: https://github.com/rust-lang/rust-clippy/issues/14848
Link: https://github.com/rust-lang/rust-clippy/pull/16123

Most of the cases are in Binder at the moment, so this one cleans a
good % of them.

I hope that clarifies.

Cheers,
Miguel

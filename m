Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792939020;
	b=H+U0/yGmGM6Q6CrOQawXhPdWGdhp9HESFSJKR7U1KG8R9pfbi2cXUQm70IxsX9M/X1XD
	 MV6avjg6/lI627o9Ln17K/4wOzh98UNHS7HvguJlpiyjhSZUPKxFzqyRk9WpZBDMCmf5Y
	 0vag6C6BhN9AyiZpECXvVGfKM9+804Mso/j9cRzusiQrhCrIuFVYXU8fRcYpFHU8FpKh7
	 OO+HW9qwiR+AhFT4gjaTzPzf0fhtu+Gb+xd74r4NOEZoroLmqkvtPcWyJH2hXgN3e95lH
	 808Vk5Y044BO6BwqyFK/LRIVIAwTI40tzcgb6h/4yZgK5k+Xs4N/+uebK22heDXaeDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
	b=Jzi3F21VJHMdFV0csCux4AKoQk6F0MDcwsAswNopl3WjmFj4Q1xaOo6CTqc7hD/09ci6
	 5OCkPN1cdLgJSFkRdnbx/6B/rRRmVLavXXFu6pWe+nSg/4qagOsr5pPMIxNPlECkmHSnV
	 juHKTe4IJh5pCGQSbUDTSQhEMKONw6xSIGKMa/VE/lPvaHG/B+QoCtsKQE3exOKrE/my3
	 Qi1ayPvgxxbhaaATRMbatjEiczHqZvZTgMG5Cz83uCqZDTe0dlgWk+Ta/DSFbn9TMPbdS
	 OofjSqtX18nOXfmP7Cj9BL+nTzf9H+aNlgK2PgZW3BTAIVdp6HhX8mHyVVDpQYAtriw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCyPtJde;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50ED606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50ED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCyPtJde
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3584f70a5aaso372932eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792939019; cv=none;
        d=google.com; s=arc-20260327;
        b=VhEciqW8aeC4QiqXUZfCwY8afST7ny7CY1IcVq8OWvorcqm/wSEBoqTyQY/fLOhXBJ
         veGk3i4tdnti3vopc/DKJxdcyyl9Kd5l4P+mPYomUf2FMxpF0WpNQ8vgoawr2ZbkdL6K
         MugX/WvO+FriS5bCqUdPuygsekrXQod6csDaPHJuhlYwNfEROO7lHtjJt+C2aL/pHG3M
         0gJdHZtS6LUResyrjImnjpxIrZ9ykGyWhdltYUryoyuMGtZj2dKkLr0UT6X+oNljkiml
         drXzB6exTGyQDLHWkP0LT1IuOi4FKuAq4rc9sDeMMgVB6sSrDZLYp0ISYlcyLrhK1OTh
         dR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
        fh=Wvp+fakHI+wfOQ2V4yVnYyVqxPDX1nYVdUH5m8yXPOY=;
        b=UT7mqYXtKfBf0E3u6gC3l9knnibo6ONnQJTLZiDV1mueq+pw3205kJeIU5wTqXup/C
         Nx4mbpkJdkhaGbpX7b11gb4bAf5TfC8cb1/kTlOSFqUOEebpZhG0XO8moPAHumsYHKAF
         mU+hm7DJyudQY1U3IRs2UeVFU8720rOL9BdzApaq9kiJNJq8H+MDNzujbOHtDuD5B7i8
         WVhAVlneZVAUDHW3FmviUH0szC9uapvWSGmDA3r7AfbYbZl441KUdDXmHcI+vSOMLfsz
         LKJJOiQoqBhi1Wo/NXBJg/Jv6aNlHyU3c6udDXVEkNU217uY0a9hwMGqcjEEDYXb/dXn
         AUuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792939019; x=1793543819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
        b=KCyPtJdeW6FFq/pYmI8qmk4pj0VceGk0r3sATQ3CcnpAtkjG8ITVjusSlrvBV4VqES
         IM1+qSXj+dHI6V1jDYppDud6J/VcAd+uAoH7I9I6BBoM2so7x1O98hO4JhdVdu/qBCS8
         wfV37nOpNvshZGcc/wZzNsn8JQC0LDZodzWH1BDrFBbNWGYTis5D8P79Bet7dJ8IRzLA
         vB1Iklms0Ov6IsB1ZlIiz7955IA3B9Vsbfh/ZASCowJCJ97G9Jl8QisCLuSLhOS0ltkv
         W5Vylk2TW8Y7KBqJxkQ2yid6iLmnqxMCFMiw8n3sOJIX7JbNPmxiaNW3EJcX0rXvi4Rl
         9jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792939019; x=1793543819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7t8wKfK1o19+DWGwoFNHE4Tp8X9jgaWEQ6IOGtgFgAo=;
        b=iQF98LCNNm0Lum8csnal3pa2JNjOAOHANQitMMBlN4FRZDuuMx82cUZ+CEw4NRA7/J
         lI1+rLVRX52SfRBzfJGCO+7hvL/T4Jn6FIx416K2+tzqAt992E/iUeEsJ0XWmS2i7d8l
         8R+4dP804xDu+IcRZRHSYOVKsRLAmKe/bmxcT12ZDHnBZKdFW6T/quHPGOlB4wx8WsOH
         knbp6Bnpgt0SLiFJtLACgONR2HAtIzWThkX7XYK5mDl2NHfFKw44DBeAIqdwJ5min6/7
         7yAYXqCBw2nejCOaIoW/Fkm9zk9kiySVtAHtVzAmr/GJwisQWk+6wKI8Jr3081w/GqaP
         e36g==
X-Forwarded-Encrypted: i=1; AKwUvBwwkIVa5b0KQFQNjy5183zGIduhNE2MAxGBbVPjMiLCqYncVuiz/aoqUS6rAty6dIFxgjGjIcnGWE25L28=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs92IuUaCGEfz47F1WJUMCiNJKy8NJfvWjxY+e5/y9EdmB1EgA
	4wghSWNs/fyP8JT0zH11qFlFXna2/KpV0hhYOWj1G2x1gwQYFdSilmnZc1D+TV/vn/r/PBI/yqI
	s+lxq+d0kWEQ+O9J4E7pxy2XDreFikPE=
X-Gm-Gg: AYBFou03YpP9/IHoi6eRC3lBg+Vjy7wycpN5h9lO6MxZEo0htE0yP6eX/okvGv0KWbU
	R2UfWp2HHxb5SytKKrlVpQcb3v5THXL7wsLFKLFQfepSwA2h4DyStST51ERXvHyD/w4/G67ByYR
	BtJKQ9uaxHmxKN0FqS6h9ttX8DVjASYD4KYyvL3vuU+qR+XOynT1oq9afRndbwe6rRAr4xko4GX
	GlZ5/K6SpcN6+nSemH+vzX491hewKECn5gWPWbTUSu7XtPOghYbFF6JvZdZgVhR2h5+dtlrKIDH
	Z9UrK0wPYmQ1CvK6akxGf2R6hjaBemLroABPUzrmQDHJPOCOgCa/xebCDmwF7RBP3mdMjnrumEF
	8j7EPWYS/2tTk6r72OOSphzN0iAu7rCj/a4FRIwR6TSBtdtCJMY6LAV3Ri7/bGc4J7zshuOnfJO
	v6fYRQCSKd7weEunTRkFrp8r915UminIaPkHwCDSrwqnxz3AKo2YSJzNgACJQf3OqXe9L69ljSW
	QH9CI2tSV+UltWdq5wC28MZeRxXm/rog833
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id
 5a478bee46e88-369e821311amr10193874eec.0.1792939018761; Sun, 25 Oct 2026
 07:36:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025114304.16730-1-sagartaunk@proton.me>
In-Reply-To: <20261025114304.16730-1-sagartaunk@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Oct 2026 15:36:46 +0100
X-Gm-Features: AclHuK_uTRohvpAYfcxxJcFSohBs9I7tNrP1XAzPP9scTKatqkb4tVmZ6FhHCQ4
Message-ID: <CANiq72kC=+EKHXgH2V1mCw2JYP-9DYGt9ohQ+0q-5_dzB-h77Q@mail.gmail.com>
Subject: Re: [PATCH v3] rust: workqueue: fix SAFETY comment incorrectly
 referencing `Arc`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Tejun Heo <tj@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:43=E2=80=AFPM Sagar Taunk <sagartaunk@proton.me>=
 wrote:
>
> I originally sent this patch in April but it was not merged because I mes=
sed up on
> the tags. I remembered that I failed to follow up on this while trying to=
 read this module.

I don't think it was because of that, no worries :)

I guess we can take it via `rust-next` unless workqueue wants to apply it.

Thanks for sending v3!

Cheers,
Miguel

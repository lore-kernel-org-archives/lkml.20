Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518348F84E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050049; cv=pass; b=W4k/xP4lf4ZDP27VoFXG3N9Sk1UCGqBVgByKuWcK5HfyLQ9Tkx3E9IMNzURRG23jGJ3CwgLvL1+hiC2dcbcAzZK2RDqke/ORWHzjA9Ir77iwWTfgZrOH8h6EqcHbWSO9XXowIc9LKeLxgyo5oJ1eyhghCa+YkAvPWMLQa/kONrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050049; c=relaxed/simple;
	bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4eBcHZno9TNTxYoHVLFCLIq9sB7dwwf4AKGnaSQexxj+rU0BuR3Nkb5JCQvAW/1un4er5t6KtUGxXysCccc6D3aWzYmPTKpeNetNN8YYWH9xwDt4aKxyCzyY9IoSIZzKNdVrWtA92AB5MEqaOEc0TwQHT4qtjwYX2CjrA+t7Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OKWZu9ym; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OKWZu9ym"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbee846deecso1083607a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050047; cv=none;
        d=google.com; s=arc-20260327;
        b=UE+V562vIId8hodmEV0ALqfRvUof1KEbXDs8KWueAPgSWGaExKZWcykg5/nsCjTIS0
         47s4Z2U6JnDfg6wa1500KdMICPoC6OAdbyohD7mgHLmTlUqJrN3RtlaxNoEw7Hm4dv38
         KrjaClYESTzEfUNZX9eJVsTHPrcj1Z3QstFINEY65nwekXk4asZuEFNfdUr7keWm5qTs
         swbGUNJ1uo3IB/UZ2Cwc8fNicbqvHr0DmTcaWIYO4u8koKZ6K1AydS3qD745TqwxW3SN
         +CW3rMmpa6z+erXMlklqtMUsSGoSVCVlGBT77ryvhvE9Prnurv1MPFIprF5fEgrp7N+Q
         LqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
        fh=mA1NIQfK86laVubFF6r9YT7Q/f1lmUrQaoGGb8y1XBY=;
        b=paae+wo1CUtseDEOnKRZoqYa71JB6PiKYsAzJRj4WZCL675glV4XxZ6UUTvGpKORQp
         BGvfbNpe4toklxb5DtFcZrRajdoYv67fjTNbP/+3OZWSHZ74NvFPC8ugUwfVs/mCttFJ
         0dv/SqfcFP/ydxW7UvBne5nY1yArS9E4dx1dIkynZKKzdMmg3hWeIsMkqu+Ha/R+3iHz
         94E+23D/ke+KhYOprxhye9hcCMpE99Co5LHlE4YzlixIwec3jbP7X9IA7/5HGQwGffrA
         hLfhWchlnHcNI0ICIRIf2jB2MEyWRD64F3Rmz8z+lkclWJaSNZ3naw3Cs75kA2QjdjO/
         Vang==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789050047; x=1789654847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
        b=OKWZu9ymn5Qz7S+ShDmSTTthKUZeP3gaCnqLBGMgefhkXxhD86vbg55xU5i7guRuxH
         tuDOseuQNTmzNudvxG3q5VkH1w2N0jYOGYgb3C7m2bcAmX96MarVNxVJQyjgJ/n5Wg6X
         0ZXRHJSjkOVBvbAtSamErddfmjFNwTAqakZtpabCWTOmZQGPLn95ElLpQWmAZhYadGEV
         4dpNNSQcP//3YP+SWt6AdzRg/HEM87YA/YcPSnAu9lmq/6n97OlSNFdaigmILrfcPKZe
         2spGQGnYs7umBRplsH2Q0tXWQi9R6ACdBiqN3aERgdw4OnWeR2mm3hh62At83dx/WOhl
         KbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050047; x=1789654847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHC7Ae2Tl3n/mBGFrKAMMqnaWcYKFzJ/lmrhtoGI6qk=;
        b=gNGp/uaynYEALwdc1lNXkL4Pg58gxj26doAx+BbuO7UgYoCdNjsLqUJCJoOdCfNd7l
         ovudQ0Xlf3OfZFq+MFBKA/2r6oPXUu2Oy0dqGAJqCKOjVvRF7yE2WCPV7/SS2mavstvh
         VCdEVQwGyeAOSTjreKQIjNufaiZe8gFEiTm7QdRqUHhFZWL2LKr8cb8xyMKrtAeXASEN
         6+EyNLQmZK7bLfkUBp6ioCYWLGyDdjQ71vgOS3kLlY2aBtld0IdQoHKXDNLpE/Ty8stk
         dfylSHazJaT26DoEUY5EGnxNd+KP3v6I5M+aptOfsjAH1Wg0Ek7Rtc0SGEbZmDhpwpvX
         5XVg==
X-Forwarded-Encrypted: i=1; AKwUvBygkGdpsgqosGgudPGNUzlmZAC0bIVMGKI1DXlOqhtKvpEJtjadhSYeqdBdDyWJKbeJO42bIICiU2cRgq4=@vger.kernel.org
X-Gm-Message-State: AFuF++l/WaARFEIU52JKChy4pn0E8pzoMC8Qf9qKpu+Du/DkmvA5AD5B
	QNdnMGBcx/KCL0n5/WwUFPw6S1fHTG2R4kFyPQ3X6+Nw/4jXTS7JHjU9sH6PYgXpTEZh4LoKhjF
	QNUIyg7byxMcINQ6lvrO8OOsR0MnncTgHuYTfz4j5
X-Gm-Gg: AYBFou3HZNi16Y0HDO3yuZGBXsab0thRgqD26L4/gxP2e5u8i+cghVfTci6Xx9rbGEE
	wo5IiyHA6JkLFJ/VyETZL2lqehQktOosf/bj8gQ6aMf5HDhRkf+9TKu0k+/NX4jZpMmvRhhB2bv
	yq6nA1iRguNDpMDNuGnJ0FRqRcPYYzTDMM2RD+K5tXy8t1vNHphFd90d0Lc1Al7YCCiO3HtKsnt
	DPCyIHTT3LyS8l57bOIjJW4ypy0Y2WcIAI9Og7jd/RVcAUUJDf0uCFYmujifjJ/wI6mLgZO7q9B
	u8WReEvy4r0mSwA+u5OFd2L7syB9TUm2jTK6eLVkgBAaRuob4Z891yMFSJN9mUVjAen3YUDbat7
	GMCT63C/4URw=
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id
 98e67ed59e1d1-39b260de667mr62254361a91.4.1789050047048; Thu, 10 Sep 2026
 07:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
 <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com> <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com>
In-Reply-To: <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Sep 2026 10:20:34 -0400
X-Gm-Features: AcwNN1XQpJke8Xbxx6RwTk63Zpj7bDWuOMMs7moVd1l9uyfsDlmCNzMgiT1n-QI
Message-ID: <CAHC9VhRjjJpv95AgF6cnOdh4g3gC4zViRoiHVehMLx-Fv9b1vw@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 6:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Sep 9, 2026 at 11:51=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > Looks fine to me, I'm assuming the Rust folks would prefer to take this=
 patch?
>
> Up to you! If usually patches go through your tree, then that is fine;
> otherwise, I am happy to take it of course (ideally with an Acked-by).

I'm not sure we have a "usually" yet with the Rust LSM glue code, but
I'm happy to take this patch :)

Since you've already reviewed it, can I add your Reviewed-by tag?

--=20
paul-moore.com

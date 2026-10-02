Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E657633A9E9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924798; cv=pass; b=qVtiyCixTdYvg+wLgFmQIsi+uZ8lQmLspr9sDq/CnhZtjd00NdZ5uV6qGWBiN6YykY8db/byB9jvresDHyfXaO50IZIZ4FNf2OoBnD7xu8nWqHaSOZA2pWER3XyLpHAApWBoxeel1sclqg390jMkikqkLdNsItBpZqe9s0UAqto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924798; c=relaxed/simple;
	bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWysgrUMH6QFzzalrpTeGI+FiJAdsA1ShWTWpzvdqpwSidQIJTC9SkyAV00Z0b7c6vCqwE40xD6/PgWWWK2xH6u6GV3Lwq2uwXNydsDmrHc7kAELxtXdEnCTpB8LYz6dy2Bq66RbOng90GmY62liTGBH1nlfRtLkUzucb+9/CcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfCbAi8G; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfCbAi8G"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c99260bd9so307591eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924795; cv=none;
        d=google.com; s=arc-20260327;
        b=aq0Z5MX0gn6E05ARz0k7/vHic3wqRV75xZRZZHRIJe2PsGWAMZ1uWwv+xg3lfW2X04
         wc2dQrNobUup6sVqAHSexHc/3c3Ub46XF2hKVWpfP+B+3AKDUdt+8VI/SEFogbrDfdhF
         T905iE6WWhlOe2Aw8qXCrwYsQ2OK6VhKOTsXBYwZ9Bcp+84i6IagNXMVU8lzF99UTYuE
         EyYgvISnKWQebKRVP7pZq2BqqiqNJ9/4THdp86GDSlixz7sLZI++o9G6kBFGzsPFt/ct
         kq64sAqjIQejaL3qJaGMsen4hmOQmJ2l0nvNinnaeZSNG+6R2lpgK4Bv7udUvvja54iH
         BOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
        fh=ZTjoLVVX68AXv5QNqxnKTpx4i9kzLAzt/n+tSWuT7Ts=;
        b=m2UqqUi0yvNiouJZfOyoFyAs7M9pQsNDQf8B21XPz7r2LQ1IG1z9TFc6RG6rs2O+cx
         AlfJqpqyDx+YxtCdo97DWiKNW2QKjfcpbKrj1KeNvFGx9NftdvFKGPxgbG34zvNgJV94
         W32/O7AJm50kXqcuUDtKF99VTbk/jjull2fADIsU1UZ0IxB5o2MPpOn6GwEKc5c1/2kJ
         fkBxXODDShLlJNFXtStmNemPlmNLcj1TNf3dT/qtvzIp5neJoqZFZOm7VA7OcEoaCb4a
         gmjtHsP8YGeFq8LUgnQU9I+yzccDEK86vWMqKIj7zJcCigg9+NNQYvC569v4cfUBJ+lS
         cpFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924795; x=1791529595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
        b=DfCbAi8G4hznGrFWoblcSqWRCssxNIT46MMEbrJ5S3UutsGsLkvze3DaVQ/O8j2fi+
         0B/NSFJykr+lMUIsHAh3x0EKXpMSQykxwm5LtWnVZP23YXhJYeyEwXbcC97oXQKMmI71
         8YRJde+nZu8M/u8Qb2ikM0Q1YeLmu0QV253CjcAG8AcbIX69TAn8bVZ7YxjiJzNB4rNp
         TFyX9VSmuV+zcbdul1Q12k9UNyypiyqY7VsQe14RP4ISvnAy0f0iZ0gc86FWVekS3ZVS
         k+9YM+3F8thpHkd3TzGv6izWCD0S1mKsbA3YN0x6BiCC7CkB4Am/CCwX5A4lbQZ3qS+c
         MqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924795; x=1791529595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
        b=gLHMM7MyatjUGM+61Jox4vWZEXHhEQn3+ewYyiae4Iwz7jI91IsY4Kopry/UY1Co+b
         pOsDgO2WSgFEoDvrehB+0vruNBUukXz+39lDJJzrCCJ7Druxlht2xiRwyypbCNhJwVxQ
         KXNkZl7pJx3p5wstDJeK9sI6jYEPK+8+NFtLV2E035I8SbjZQDneFVf2ngvGA1k5FyEP
         UZr3TJfjHXXmh/22CIA/i3Ocmard9Qqwz6016xRLgNOqLCPhb1CU/8sD2owBISm8a7XE
         iFfR+RdhYh65jhIIRqQNMJN0l4yxP8yqtpeAM30mnfoYsXfOrPOVkQbnCGrB+shny8zP
         zR1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2+SNmGUwhaEzrhBXpF0J7mDUIh9nGJnR7t+HotHNPBqbXjV3qWf0GuM4DbZs3TCNcyMPaqYUTS4/rC5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzzJz20FfIB0PQbsks0REytuziW7c4ZGyY5ppwDQA44SG1lmGU
	3XbSHZ7cSLmTiKMoC5Vz2jvl1yGHgKY9Nh1NCjk/1WbldxRbDgy1OQ72Lg0bzGHNAvnPRsMe/cF
	s13inTkcYx7yMCuKxoCpO5CGxuE9bKwc=
X-Gm-Gg: AYBFou0ad0XQUD+WQwCZK2/t+E9cZNUV48zgDmOY2FeWb1cI11g7gySXian8LkGUMaE
	7JBoSrICneecn+fJJ7LjiJuDP5FR7Xt7dbfBizrG9VEsFzKZTS3pVHwQUsrINunrif+LUdWB1Wi
	/2l2BBVkFFlfEbu3F6lHZg1QFBrgcS7DjEik8g3Jpc/u1avfAUDi6NQtY/uwkVsNu3WMuKMbvKe
	khQwtQayWR3skhiW8/coyfL5+RDm7dg03BVdgQOYiU6jYb1jW5f624czXh00jH0zwmCzDW4V798
	FLDf8vcl0hnnecZEYDjF9sx2jAHS4pIMez7uTQ6a4Jsclm8Q01vwZQU9qjGt1nltkjwR9WNeiR4
	0tJzJnVbR8kFCz6bsoxZHRyJ2J8PMpa27S9N9r2i3m4qAqOO0QA0Y6J9KfeCWmx8pDhmygJ63BZ
	I/9XswDJzwnPSOD8jHS0/8hQYCXiYO3CNvWvMyg6HnCYrImAbz81rcuVWBvZFXIw==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr3462444eec.1.1790924794805; Fri, 02 Oct 2026
 00:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com>
In-Reply-To: <20260917051147.98775-1-tweek@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:06:21 +0200
X-Gm-Features: AclHuK8lJ9lWMbMYvuPCA4PNhehiCTluRjGb1PR9k0qMsRR1b7vJrjMUZYoSk6M
Message-ID: <CANiq72=SX8xxCAzf6tcQb1CUoa_f8Y9fxVSqEBsSwqUtfsxn6g@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:11=E2=80=AFAM Thi=C3=A9baud Weksteen <tweek@googl=
e.com> wrote:
>
> Module authors may have non-ASCII characters in their names. In C,
> `MODULE_AUTHOR` allows arbitrary string literals which are emitted as
> raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
> modules use non-ASCII author names.
>
> Originally, the single `author` field permitted arbitrary string literals
> including non-ASCII characters. When support for multiple authors was
> introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
> key"), it reused the `expect_string_array` helper that had originally bee=
n
> added for module aliases. Because that helper enforced an ASCII check,
> `authors` inadvertently became restricted to ASCII-only string literals.
> Later, when the macro parsing was rewritten to use `syn` in commit
> c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
> restriction was carried over by using AsciiLitStr in `authors` type.
>
> Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
> to `LitStr` so that UTF-8 author names are permitted.
>
> Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>

Applied to `rust-next` -- thanks!

Cheers,
Miguel

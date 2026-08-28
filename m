Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D937F331
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897732; cv=pass; b=YVPPeQpye4XZY+qS80DfKUfnwBwAviAW3ydZUsSwIdk2bgZ9L6gwO6D0a/sc7uvAV/vJ5mBU2/19tSST9JR1JpbA02Qrcwqfd+uK9weFTUfueQOQ3f5wzQSqG1EZhuWjTcidn0l5PuVhUJRVYDuQf4TCPrOY07OYJXde2lidmVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897732; c=relaxed/simple;
	bh=NBZacTtQ58xQanJcHP5YImLJ1HDsw24G+l20TodKtZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAdLxfUSbMUDMTmcnGVQl9mfJYwG2kOrhrtYopbsLHExPg1LLErvG4/uONgzUTzt6eRSLUFnWCqPeoRAuUGA0aoqPl8iIipdemK3YddukjvA6uIIyu0pIAFUjE8l7JkIgvEplWmgE3ceQkwmjKzK1t2r5vaHigDLN+XHAS7z6wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6w6R75G; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6w6R75G"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fec3c1adso473815ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897731; cv=none;
        d=google.com; s=arc-20260327;
        b=Dz7ORYvCnJ6fdL6z4NCn9hNGjXggoxAvdg6kURR70++Gsvgl9CPAN2qNxqrtMgsFcl
         rc0peHumBNBm8SdLtiDHCytQ/nU6GjjTuCOYWkf7urw78O/lKqEydsaRHpfyK2qSgGTv
         C1s0db9A8PKe9ySDVb6FD5kIvS6AWJo345jTfqg27ALLKwTx9MQz/ZlamHoRleyC2us9
         deKPQcNfi/eKRxac2wHPgtIlz0cmAuE9qt2oW4cCzYBtQxszpIZ/jAjuBnfif8UUZKSD
         JyDjU4VSLnwU6mec2/zyFJIgaOf3EdqoKNn0Bvr5hFU3SlTWFeRHhMGi1nyrJBoYDttp
         cNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8bSCuSKVP7ct/hSX/j5E/Yvqr5/ozCcz1SLrVvhOooI=;
        fh=TPV3J5lfgh8k0mZCd0l8dUp2/CxEj/VnqQoVyaqO05Q=;
        b=iAAVodmf/h8CW46Xna/C5wF9ilrFwf5wbu771wZxzRbyyQ5Qbq8r0CR5PiEyooZ/t3
         g5pqIIDJOOkUqHCRw9DwBZ0gIPdtzGfAGkP22GA8WJLC/mdyRO+jDwAeffJX4FYYHdnO
         4nnYgrNOYbNQfmvBMqwcYSjzRPvz4Mev0DY8T3pELKSqhU9aUak6q38US53mv7wYeEG5
         4poJJB3tYUcJHz6v6fvpf7AWGspC+gB3CIOzUtViP1NoFiYYIfKe1R2nxcwPkHybaVV6
         aemaWAT22w+iCadAzPBXxKj9DqbkuT6lRGIi+DQzliV+fcuk0dRtiB2fhbk8Sq9QZDxG
         jdLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897731; x=1788502531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bSCuSKVP7ct/hSX/j5E/Yvqr5/ozCcz1SLrVvhOooI=;
        b=F6w6R75GHFcTT0O2xGWj+jHg4od4Y+q7exP7zbgi27PugNyK0eOd8RA/SuuIkqYD14
         8tzenDgzadAUyujO76iyaVubcAJOZwHYEl87r2SSpT+n0SdzcXa3vuVR1G+3yHD4hVT7
         G/We1125q9dt4AiHMM7SI5jJ2SbVwUDbMuTcdjaZq0URLRdye9ttKtAVYm3i7Igipvy+
         2njMmsbcqkLnAot4S0bXcxvfrRyIvTHGgoF+v0e/sPW6ObMkNwN1WFHJiQoshztBN45A
         6p5RTedYXL8jGruT11+9Mx4hXW8pwpDkVby9pi3hi086gO7nFxjKQiHkf7fa8ZKWO1rd
         ylVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897731; x=1788502531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bSCuSKVP7ct/hSX/j5E/Yvqr5/ozCcz1SLrVvhOooI=;
        b=TN03cetf50kHQYGoaQe1H1xOYxyRazFuFvamLUfXazRqCG1B+Ipu0i4y7LHRNvR4CQ
         A97lrGtD0iEK08ugjiLw2yjVN/LPfXA0U7yPbU7csI7Vde1p6DFUZpV3PpPIZkh3MpVQ
         3PhgHzXp9BWjkmrxJol1Ldb5PvP2P0gr9aWuDc3iQWOijs7MFtNubZul5t3SM8iXJgz7
         w+RqAEZe37EOR0cjgebZTwsYu2irlS+oqF+K0VpNCZxyJYB+3fljDuTailLOVziROSyX
         03yQEd4hB2QuOqxfAcKGQDyBaEIUbLQAaMC79PzFuefhSe6O/T6gI6nIbkAjnpbktRfz
         YUew==
X-Forwarded-Encrypted: i=1; AHgh+Rqi5jWhndcPCJdMkjUiRm+mONGeyad+9VXAtNELBOmsQ8QWI2FN8xd6AEYwUL+cjh81dRlL4Jda4dLlKQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mNjflY18L+t64W3qoNLazsyf4i5peOu2fRsmSejGTuz3IBFJk1
	Pb2njCV7ZHkfeIYqCPMCALSDnvQ4KU3SzntPHGufLfwZPaTqmHG9QTK9OuViLKjiJ5TXSIGSyGV
	+53qzqdQJEh+qmEc+0VTIb+4p+q1CzLg=
X-Gm-Gg: AR+sD108CTmVGawVdoYeDjw2A+2Nkw7HlB57mt5NKk3jLifEATGh/C9gCBEpK1Zt91x
	Ay+ivk7hDSNGOWXkz8awfij6iRknX3Frxjt+MLaHkYsp/7p6yd1DxNHWrBgLoCNlWWufOI0Znv4
	FFIFFLocuT5+jCYR0FAAeOd0RPTmEvwlCU43FTqoDkfrD/8AN49G4z0GakmWa/KY3LkrvJKNdAe
	7Tv8hb+4r7DuQ/89QDPsnyJydrzB57wD4EhGHQWIWRj25tpty0epxsPm3Phl79fzy/N/QL4bqiD
	31wHxMJrt69JqxofeLXTCLbRhvaxj65O9JW/63LGgwnUmlDMDGRmbne4mjgpKyieAw6Q+Zi27Ld
	JYNt47PrjNiqiGkdK5YbS+sX4JjT8yrymHqTA51ijL/QRhSyhwDj70c9Vvohh
X-Received: by 2002:a17:903:1106:b0:2d6:f09a:da1f with SMTP id
 d9443c01a7336-2d74e0bab6emr40520405ad.4.1787897731122; Thu, 27 Aug 2026
 23:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me>
In-Reply-To: <20260828024335.946-1-nils.lehnen@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:15:16 +0200
X-Gm-Features: AcwNN1X9Qb8a-HibMc9LvFugng1gZNWxbI0emyln9fJfRyuIE5Vx-Vzi6R0arPM
Message-ID: <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
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

On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> Two equivalent one-off patches were posted earlier [3][4]; Miguel asked
> in [5] for a resend that keeps Benno's authorship, which this is.
> Cc'ing the LSM list per Paul's request on the original thread.

Looks good, thanks!

Nit: nowadays we typically use a:

  Link: https://patch.msgid.link/...

to refer to a patch that was picked from the mailing list (usually
written on top of your Signed-off-by) -- `b4` can do it for you
automatically.

But no need to resend just for that, of course (and Paul/I/we can/may
change it when it gets applied :)

Cheers,
Miguel

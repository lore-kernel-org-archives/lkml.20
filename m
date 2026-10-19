Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C489D4E06C3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412914; cv=pass; b=f05dyK1g256QrWEnakQldY4+davwCKeX0PGsIQ7HtcnNuEU39x7n4TqhjCqW5vHFleA7Ea/DbYj+8fkhT/1xwU7SmkJA9cl9lDdEXuxphfdl5emOjfmCWbZXO3CaECwTtvYXt0xoaE8ejgVC8gVUpapgnEUQ5tjfKXJCb4YbfFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412914; c=relaxed/simple;
	bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwBFCNOf2ogcQem5tOxlVpLqcbYtqPVF1ShSm9g5kvOhw//3lOtMpT3pfHHWDCTfXYin+ZWkmXP/uYNt97+dJkKQZCavJxC8zriM5iXhgDLrqJO1UNt654nnYm4lS+s6PiLnyAerUZkJtqrO/EdizlpJj0tITDWjsqxGeJX9ab4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNZs5CpF; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNZs5CpF"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35e8253292cso130637eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412906; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0iZk30t5DRnwUOdlAXBpAtwKlZiJ/pYZ9G/VdUb7s9aFaN6DPGfKO4sGkSDm7mp/U
         2A08OQwclEN/7T3U1EhdPmhPeGCGgO7TJoYoeBg+366PriAZlpLxUXMHXkF48AjzvZl1
         Bi5jyQRDBt7TlyMbbFc/X/jZP8hwYTv/yzLY2mAJkYgCWkzWdEpwYUnLGH+GpSsBVam9
         otOBp93hl28DD3d9G6hI8BJni7RDpJylJq0hk8Rycj04ylqtwLngFUM/KhMw5cCQg5Pn
         +fIoelfVyHsSPrPAuyA3rFmZqxuZW0duR9sWe1OYB1H3YA5XXIxJDZiNBXERGsA0/WJ4
         knLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        fh=Z8labWfQR3CWHO5A9lgvkPr/j3ov5OyhC4TFmLn9txg=;
        b=YwWPq7CqQK0h5ebBSwO+y58h6KznOH6fKsxqT/1T1jBTkr7JAJoxhp2a8DiQmcXTRw
         KJEPdyW2UhaTo2P1qGDsoiLk2eq2CIR4Uwrwxx5/PvOUWU3DdgHI1PKq9+LoPB25ne5m
         imMU+TJB5Qc5pfz76IMR3J2xUSzzebD8SyKYjRYkx71/vEv5wcgPTkwDFAdNhSMJofaD
         8w6Bv8S4XawdYtC5nGVbjJQiEf7FftoPrH9gLXV8EP+VG3/tFjBK61H+srFMeaWOnLwS
         S9Z/MWS89lhkdMWPcFYt+RRprfbhTD1IQVB0orRWMNGLsmFBfQiFEvtYKswjKVr/FBov
         F+CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412906; x=1793017706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        b=kNZs5CpFk3vX3oFVIWFX9GONdsns+IJu+gIV0vwvz0xWDGpCF2RG4Gypwa4r56Ympa
         30KHUZUSfehrZESyKhEYDHQaapDtManDmIuDnE0/lbXGM3DPpX6GdtIKOTIHTatkeLjb
         OuMKdkgDP2T6e/tjMhJQezLpdEDk61DqgTSpjpfm5ZB/UfzAKl+zpgxr4YdYkAzLTWK3
         YMc0OGS8IOwIQvJCVpKc4IjFYzGb2Sr/2Cbw1A++CrdgTHRQOXtS5S8mkXeYn5ed/r+G
         cvfVpxEhZ3AQoZ5jsN9NGRzSi3qKCKPvVdcOoxBY/sUNKRvj6dhkt5krBO+yF/fcSljd
         NFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412906; x=1793017706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        b=1Fn81dZmhzy46jhm712dPzvhobnDaUUoHb5oIY/r5VRDYpO9V7RAsFqFt6sCnzX/MF
         xyCzwW+tWHT8rz5BDPumbnZS0XimGsNpgnbuAFa5aQqFMyXT4duclynkuTiTYTGMJrBr
         cLA65YuE1m2AJ+Pun48BHm/BHnYfqUtBYLxtVrk6gS4ljZVNWaN7H68s7HUyrXDom/vF
         YM0qXmDAgWFETAFnG1x77nocyh137uTJdzRRRdwrv5fYfBwyrQmRMmwYka15c3zUFEep
         WSFqsYNKafhzDivw8LF1FXA78jlDVfLo/XAxrZUEp+VYba5YX/vk9ujcgOwRuq07pD59
         R+qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAvFQoQR6VVXs//22vY7VTDo/2aUlTeYz6kOfQqfc37dK7ZBy1SQVZalGCrJZ3rAWJkc8sawfdxJyNEJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1qeuGXX/SEoB3mRSPbXPBuYwl3BnxUn/dyJtnl5Jl7X4etuID
	Hkenw43bvOyQ850/ji5qNv44n2CU4IPVbuEpXcVTt3AxSNTC6wz7s2oAP6WhM00VrNJH5dXwvgB
	BkxfWezpchrnGOQ8qOTH9ar0/E4Y5cIE=
X-Gm-Gg: AYBFou06YdKRwW1J4jPTOFQ8A1u32kNn4UVRcyfFAdX0e6IGRM1MxbDKkUg5hCBe5yZ
	lyS/jigvFbp/7mESwBxxc641oK+7Ic+Z+4M0fT3UKvoI3Di5uO8drtvDrMl6zoPD8315ETdfUkV
	yR17ZMRJoKfDt3FLxRQO/s9l18ldB4zEINZ4CFfkkS4MEF5M1bEB1i93UQEebqA6+EccHTFd4QB
	gibdL3HHJ23qRVMhEQTBbx42XHTOgNF3aAygmh1cSQG7K7D39VobYJ0JiITIBbyVdRJ0RL/ojIc
	8BGzsnAGaHnml5e0VCf0f7b9QMnxBxQrM8GtIRe7c8ZXMmR29C5hNVt5UlhNwC+RFbIbJrwDtFr
	BFQODUW6aO8lD9YDDzDnk2TfRbPHfdcWBbqxJ5KSap07iGod0FMp7l+xg6VUWoQnsUkLg2RywVO
	kLVj9oNTwjE7dYWE4KnDHGb9M19uykhFuvvZ4Q1nEaLPE8jSLqK1s=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr16547289eec.2.1792412905593; Mon, 19 Oct 2026
 05:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019114811.1105192-1-gary@kernel.org>
In-Reply-To: <20261019114811.1105192-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Oct 2026 14:28:10 +0200
X-Gm-Features: AclHuK9vRqGefEm-YOizNzCmm-q741mpOyzFUsHDlEPJyQMscn_rCkwuXTkP7bk
Message-ID: <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
To: Gary Guo <gary@garyguo.net>, Guillaume Gomez <contact@guillaume-gomez.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> `Io` trait is the primary way of interacting with a bunch of types, e.g.
> `Mmio` and `Coherent`. It is hidden in "blanket impl" section which is no=
t
> very discoverable.
>
> Use nightly feature to mark `Io` as a notable trait, so it is highlighted
> at the top of the rustdoc page.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

The attribute has been there under that name since 1.53, so it should
be fine, and we can always rename it or remove it.

Having said that, let's mention it in this week's call with upstream
Rust. Cc'ing Guillaume so that he is aware too.

Unless they say they really want us to not use it at all:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576006;
	b=ikNi7/Glm0ppuL1CUj/AvVTqOpbDsmdsTC2DOqm5QlP5krtGnXTqpeaaorkvg9GTYQ78
	 8ocPPJRs8Xhp2fXACWb5cxUlhmNPUP0e7EQLXfhlYXz8b5q3/7g+Akw/KAOTZCrPG6ax2
	 zTpgQx3d6AKemOGL0Cj8ZlRELSaoADbpu3SQMq6NoFJ91Xxl0bmzQWtEJvJfmoSqqhjG/
	 X1i6g8JX0uTF19PKz3gUfUE34QRtcAIcHjsLg4OCr24AD/7IS5ITNLB2R5aYVmIaKkYZ/
	 il7atqQlRQwlCLv9t4TAXIoLP3orCp6KdHMHrb9XSjjoFSsZTeiVtmA4GsNrQ5w4Zrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=UZHr8KaXPzKePXeT1gi88PdV3hmG6tA9tT4jti5k8hg=;
	b=BJ8MpUGx6UAGNUhGqAjUf6ZrZor1Enrq++ktAeaKHanwikY2aODlZ8BryZvM5RgcaSJ6
	 m+uTMQxNwkkxkF+KhrzaIYVedsnBwmrcqgyEvxtcUQ7NU4NET2R0rVKO7//kcVvyoeYTm
	 rnoE8JZm/w256ClOKBfc9Uf8Txz7sc9s/ivgJMGvY0KFk+ZV3HEqalKBbB1EG0d1v6wvX
	 Y4g1QOUSl6JZMr8Sbo9WjJMX0FhEOhjeKkgUCDm6eRd5BW4khM5IEtPdQLdOxjK5TKTwm
	 awK7hWLG9YI3uJdMuFFNX+cGi576yv26HjpoVQucsOxYOD9ZP/TtQIOXIMDDfT906Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=d16DGRW6;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC2606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=d16DGRW6
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so4986825e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792576004; x=1793180804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UZHr8KaXPzKePXeT1gi88PdV3hmG6tA9tT4jti5k8hg=;
        b=d16DGRW6ofJsB2xWwhvic/Qso6qUGR65IA/IDsPThfIfCF5cITHxyxge3y/nfQRkQp
         lpMwZJXWC4Cikck8FY8O07l8VhExksbpZW1R6OihHG9nl3YMAAz7S3XYgrITcqKoF/WG
         JEvrlofHxtO+vWfPWHnd6H3srHTWclVwKOdWRw2cVn3ZQpGp+xm5iseggMc0QNtwlWpY
         YmONLuj7aagKZCqLsiowTuzkO8kr9v5yqqsVc45ZgzYhqIIwyI+DKy+DmBPXVfu6NUDE
         XI0st7dYDC91ivBQbhs8nLe3B8eb7vmKLFSdJxLkImAf6k24jOPP7nSg/jPaTtZG3+ao
         64kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576004; x=1793180804;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZHr8KaXPzKePXeT1gi88PdV3hmG6tA9tT4jti5k8hg=;
        b=mFENC/OFc+94RvCtHwzFCa4n5tS95d3GSQU7PTNsMCSySaBfwyh6HfhMRpSFHyKToX
         SIVE58ciW7wtHK8iOVd91hRoYgf+rUiCaM46UhDyvOhNCS5mAm0VZp3fluvuXMKFY8N5
         +2gkCwZGklEnD8npSTG1G0jUCQjITnqPiy0h6PmX6B93evS+QeQD7unr2QoTi71ElwrV
         6ejsqm4OSHm6HrXGPsv0pQolUMhtQAiH2LoKwTxLCDo9QMfEuY5aSERfMWBDdsoHIsD1
         FQFdiXHhKmgbWpivfS/FWn7ITKhegSa7aj3icFazDWBdUDIoIdKedc0FqiN1FPGa7An6
         vMKg==
X-Forwarded-Encrypted: i=1; AKwUvBwXXPgB9Dxg4Jfb82K0vgVkaB6aEpxqnSNAhqijeBKGCiH9A1sZOzliRC2LYM+rMiwAdGGUvmT8vifguMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhE3il8dQF80e+iMjEmUNSU1+sTspfd2kdrMhLxSlfc1cvshpN
	SiqtE7fOeOhtB3bxldYDIs8oCX9lP+yZc14JMbAYKfhNV5MQ7pAzS9/cdmYgeR2wwTslpFEUFP0
	sotGtILEp5rPgBF7PMQ==
X-Received: from wmik21.prod.google.com ([2002:a7b:c415:0:b0:4a1:e474:4213])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a1fdd39eddmr23675595e9.32.1792576003837;
 Wed, 21 Oct 2026 02:46:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:46:42 +0000
In-Reply-To: <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
 <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
Message-ID: <atiKAh5e4BjYgHSu@google.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:37:26AM +0200, Miguel Ojeda wrote:
> On Wed, Oct 21, 2026 at 5:33=E2=80=AFAM Carlos Llamas <cmllamas@google.co=
m> wrote:
> >
> > v2: open-code the %p behavior in MaybeHashed: No "0x" prefix.
>=20
> Thanks! I think we may want to have an easier way to do this non-`0x`
> formatting later, centrally, even if not as the default (which I am
> ambivalent about -- I didn't hear more opinions on your other patch).

The version that open codes it is probably what we will cherry-pick to
Android's kernel branches for now, but we can definitely look into how
to best support non-0x prefixes in a better way.

Alice

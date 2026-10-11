Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8430456DE8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726821; cv=pass; b=b0IHcfoinu1Uj/8OKKQnLwgmZU0ejfwAJut+X5amfosyHf84VANovnClIg2ueuTAhH17KUGoe3tq9h2WGKz0IeNIITLpwAUim0Zx7wQPCaIlRfik1rk87NCpJuOE+T89X04TYV1amEWnO0hvZmfoyWR24Ngd3WKKrNntPphOF+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726821; c=relaxed/simple;
	bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oa4venUfIlAZnHNcLhgBl5uBIM8RmGEnDDEcxMRdrt5jX9DDwMiin69bgzSxZDqc7PA007QUiNFmR3S9edSmAoTN46mCPn8TKSVSye8feWpKwiJraOVk+wRLIuU6+DfYCQHXAfECa+DgdREvdpav1BkTjFQlqUXY0vNyohpbWQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH+Pe/aU; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH+Pe/aU"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-355724d032fso124205eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726819; cv=none;
        d=google.com; s=arc-20260327;
        b=fUc5XUcHS63cLe5fQvQZSnxO2LKQbfP/ATAHRAMJqo2UIVO97Or0Pc5TfmVK0hVq11
         Gf98BL9e7vmTeUIUzEIXecY2opyEBO177SN+5cKNduenE8G7WZ/RqJLa82d2AtR7zjJM
         h0QAv3lN7gwrhZR2MjLrW183EdpDtBRDWcB+pgW1q7oC+FXJyxCUR2B8lFdlVt6ZnlMM
         owklXGKefOFo+CkLTKmdOPtvB69TON7zJsQ2XgpdEn/6tPcDT2EEkQFd/k2/E2nOiZ3O
         EfMTEiGq4ZNv6ch5TE7aJWE/UadzwLq/qNTGbK82n3MXu8dqUJzT0qve4vJtiO6dif2r
         IyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        fh=2dhEgcXo7WA4jtOH8+QKODbW1jpNyJT7ep2mFohl8ho=;
        b=oqy3N0eF0e9vvAQNnssy1Fo54uGzyl/sawqxzuKzBa5d1YsPn8nLwr3MtT6cf2QXYk
         E6ZzCmpstw6TIc4V9lANPm9tRsF8BwwbQmPDjHpK2GUhqklcEVJva7IK6154r5pa9jYI
         vkCEMeCUDY1ZSPVgpiwwZnnrVHN/1jTwSlZ4KFjs8lVEsE+FI7pHnekN58S77MnuDyZt
         bR8GVUMvg3h3ngPNqpep2L6dCtLFitiB5qzn5TtPOtRWPfka6iR62JOQADe64WQ4k/iG
         49oQhB//74gjaXMLtpEjQqLN7tBNqSWLiMbSKRATVvplhq72Y+67cyQmImHl9IoJG9Z8
         it2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726819; x=1792331619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=SH+Pe/aUfQCWst3dbXchKKtAUo9gEOwW1iCr+xG8aALurikgr0hIyAaO+toqveQtob
         xytSX0OdTcb6mm7t2vOTFboCoP5Io5tf1mM0lE0rnMDveRdaoG9Geimn1U4SKM0dhxUz
         ftD/e8eSiUHkd+H5U3au9qwox2T3/5IvJjuKCN04VIkqF/UKV3zbV4x80To2IfeJNt4n
         98YH05Lv7WFKC9kaufq3kUo1uIemXxhFf+8WdJO1jZqlUkFfD+chaCs7fAQon2I0ABVZ
         Mop2GTVl4Grx0MaLllfGhqMT8QFmCgaMWsAAZA/qDd7wgU8KHDzoVEdsaP3Kj8UFXVDq
         1kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726819; x=1792331619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=MDIdYjA8StEeAwE8qNT5ylohdle4fIT9kW77lMBzrYeWHmHlEOI9FgYDNzdwJ+udi6
         w43wt9j5+2UwznKPpZ4mnqrtZUC+yE6ECzDpDr9K2mBuv/ZdN7+b1lMuU5RViqjAUYX3
         DtZRp0krKsn/i1hqwAFvtgxCEXR7PV7gQJDXQDXph6zAWos8pCxphc4ihpklLvikE4Ui
         N8ncgflPyw+GcxKb76jNeKhjx2pYQgXIeUHBYgZun34Vif3IuvY4E90pmfyKlHQ+ysl7
         w4+4noaYNHi2cXeTReEXCLj5/ZpZRTV24si0Ii5QnaxX1kKJKwV0PDwUaeG+aEvAI+PW
         hsUw==
X-Forwarded-Encrypted: i=1; AKwUvBz3mjdoyP9vPJaeFfypGts1t0WMuUrEe3F9rBiFBbKDA5SqCf1bjO1Az7QI/0cDeg8PS3/ULJL5/mvL7Wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF2PRGs32y2aKaMpcQvVuRzz4Rumtdjro67BfaBqkWw3Zyr8EU
	4w0Hdd5M9S7O/+o3OIynekaihx2KKSAwTWkbpA+r9RX+g3UJpYpskqf6z8mfb+tsgLIp/bGsjP9
	mO+E/kt7tT9c5m/qH50jWgMyRCFHagNU=
X-Gm-Gg: AYBFou1t9KdQhNiCa+Xp2Ck00BZ+t++yP1jynKKVG4zP4rEiWbgaAEE1HTHVVQcrdtu
	Hp20KYipxlWW0XNJvNevH79WNpM/r5rW5Z00RzZoZtwSf/1yxGyN7VQvplnk5pxJMu5Eza5vlD3
	/QP6KDziBA1+3ZEokWjF5V6Iux3R4IiAT+6prfTJdQjJyWv4be5Qy3DeoVraw+8t1sJQOsWxGGQ
	OwVvFmHtLFPE3EvQW43vZyE+qvYgikl+7dYhO5SX+l171nT1i+6ReG/YssTMNG1nPUGG6TakbMJ
	y92UoW011WeB7Y+LKQTHb5ymz0eWv3njLuM0ihPiTMBhF8YZutSVDnh3Qbx9zDwy9t3VP7fao7q
	uscKy4hMM0bubZlILout1SeSq4zohfq+LnzhxRFJVdJnO8P2WGK5F+eT6G/cf4WBZZQsDAVY/J0
	wKXMq8kt338IDARolaRI4E79ZitGYU51tVYANPTaF+7U8D58aY0xo=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr15242775eec.0.1791726818852; Sun, 11 Oct 2026
 06:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-rust-dyndbg-v1-0-832e4039b71f@weissschuh.net> <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
In-Reply-To: <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:53:26 +0200
X-Gm-Features: AclHuK8cVNPlyOorjrRhhdDkOJWkbQbDeGyNyJbJMfzEHu0iyDdJ7u6MM6NTRQ4
Message-ID: <CANiq72nN-X6pZJ8NhUOyLtXNPJWgh7oA7-kU9KaVnvjv-u1gOA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/11] samples: rust_print: add debug messages
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lyude Paul <lyude@redhat.com>, Yury Norov <yury.norov@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:53=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> To make sure they are actually printed, enable debug assertions.

Hmm... why do we want to make sure of that? i.e. users can configure
the debug assertions, and the sample may show them if they are
enabled, just like any other code, no?

I guess you may want this for e.g. a CI, but in that CI one ideally
would test both cases, and assert that the messages both appear and
not appear depending on the case.

Cheers,
Miguel

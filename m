Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CA748C412
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781867; cv=pass; b=NXredLAJ3OIny+enHOnTeeorLNNvzg2VVGBI+UU3WJKUDiEMZeTLMeXefpcJJ98CO7RClySmOaFotWDlHFmraa5rGM/SZ4SnMNZINgPslvER+o0hhG2alaXfGs8I68oRkC1jv5uZNVsRFw7Y8y14ZxSMig7sQ+K567Atj/Zk2Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781867; c=relaxed/simple;
	bh=h6jhuvTWqLaqruIgi1i5TAYcvTriQCGzhZebRCsuWN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9R+ByRpld40j/DJGLSk7mx9Tp1CVWXNX/ZkICtyTwaRiJC90PYki2twD5pZK64g//avkv8HrlptzNdawfk2PPh1/RJHdxJD5R9WXsyYn754AgK6LIyNtWup6kIUnyFeSbo7OUdSLyVAwzisW9gSe4H3RTIsxSyru6++cyoUEhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TLRC/vGx; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TLRC/vGx"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-783fffcfb96so399426137.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787781865; cv=none;
        d=google.com; s=arc-20260327;
        b=nW8zaz/lkJuXqwrs7bD2Riv9+HB/qQGn4BP8ByrX+cmF6g9Ywtw8PD4b88ZUVLRVv2
         pQobdwNzGL/tN1qNxkIia0kAinV+E941Zi0cwO6rCNazKXDv5dZOuJ07sJtPGxzIiDCn
         3JQ87Km0Ck66SHhZW15/YDYZu4c1NONE01oi9SPv98TNpH8Oe5WIBBA/lV5HnNVUPh25
         i65CiYr/tuu1zoYO8KBEuPv6OFH79kSs0iIyvGMAN+gJq0aJVI090LIK6zc7/j0J78XR
         7L8IZnHYYphlqJluOQPXlxTP0glt0aHFvHccaROjpE8Sawg7KU72ZaeTTly+SM8e3kbJ
         hREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KE+jiRIP75MXtXBIyBa6Bn84xQJeL42gUj2ODi3jyzY=;
        fh=k56hfJxDUhSwrKNd7L2+9DVQFwLrRMBq79vXM9vhPVQ=;
        b=AfiL1Gvb1nTGg7XluaS4Ch7EvcNG6+BohcKwCtsNOrAg5Tn9sh2aEk5lRfTyEqAMhr
         6OrSAASfs8YXSSnpp+RPVjOgZT8CBT6gO/fJgtsY2aq+eEeZKCtSUdjLyppW8NmJrYil
         XxHUTqiYLw8ucSWpWKW3MpZG3q2gyHhISJD8iQwEo2/37KO5dL4pv4GTDER6YdydrMbZ
         C51S2gL30XgPGeN4mOZ22ns4lkH45lXM0ZXEEf+xN1mIL1u1C7MeYRFqmQEaW7wqON3D
         6o8JNTBxk8eSwraIEiLCH7/XMULT16Cv0Q8gl6e0w1woI2A5moG9MWAMC/eVIqbDxNwM
         +0cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787781865; x=1788386665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KE+jiRIP75MXtXBIyBa6Bn84xQJeL42gUj2ODi3jyzY=;
        b=TLRC/vGx2LdmDMCJVSkYG9kCh7k2ds+4ihbXXihqTsbaVXiYxPHfOCZJpldPxv9lDv
         YjjTf0N0n6pG3ZYOomnkD1wRkVB6M5uGZSb9H4YHLBNMOtrcMqc0q+sRMmv8I8p8x5El
         assEvJhr7bYBMdL2vrS3ApD2qOVj6qX4HOYOgcgGxQhaBowqJSUrfkKznyZqAeuzBOl2
         XTpNftoI1V+IO3O5f4pOrRamly2eg5rfpBiEhf0T/jp4L5zH/HOA+irDSlC3+mBiZZ9R
         RRCIwz6ojhByxTtDcyFcefjY5CL5r0NI2StEEXk60f9Qu698wfbQrNcw4+J9urIh0q3b
         xo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781865; x=1788386665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KE+jiRIP75MXtXBIyBa6Bn84xQJeL42gUj2ODi3jyzY=;
        b=nZdrBEFVTPbkWF8H60jGa7DN79RpjNkavs1cEAWTaPMnjlFwwRNvNHGJOqcDvdfDnZ
         lFI0VQQhsE6hnmkfY8o36Q4U9srIxDUo0e09yhkSQoJ8FQN2NXqb6Es4bY4E9SUHp3gc
         a+5Y9rHT8zMlctml0Dv9+9SatHeKATWZDAdmAC2ZmpDQMCu/t6lbbslCWCqbx3AXFjqB
         14o9vXOjsBffC3RYdz5Awv0CTnTqzoGGsd5wC5LfDOa8aWINSwPXEta28uatpaLZQ4VP
         zdXBMP5uyOv6lqZR63ZkVTUtnFoCwkRM0er0sZPIzIjClweIc0F4TXNqHgmLUhIKzDhv
         f5dg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5bOJ+95B6JObgSdFwY6M2XAKVMDWCR3wqm0mLCw5GlyPHR0lZ5vA3FvCagkga83PTwWvPr+G2BlOcgTE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCI5umhLQ/8HzMo3GF4q448dr07WMBl3HYwt6HiaXGB5PQUiTI
	3Iog8egyC7CZ6rfqmKcuK6NWwYPA+t3La/woyv9m+o5s5Cgi/6gu11/4PCk8HzhCB17U2kC+oGo
	zzlydDDvZxpXiB9Lyfx0e0PioBtwXXf3MgdGJn9A=
X-Gm-Gg: AR+sD10SCV94VJrv09j9VoDoIfqmqeTYb1Ak6xheI5xiIva58EuJmnTSTE/1y+MzFYS
	YA45WdTjfq3CSkolx/BJD1iL6nB6EWqf5YzU5plK0xCaJshxhAE8g5eg+6RruApvPx/yO3X78QX
	m4zF7kicbz7PkTNjbv3pMGAIYfqZPwPFqPGEmRfdIuvFgTUciORzuD0h/3IROGumJWeHaFcAAQi
	VqjiSCLTmaq01zbdNBVmlQXXNgGHNvs9AWM8faS6zOgVSKDtc/icVj6p4r6SfqyOdw1t+W+uNRK
	MlsFCEiHFujZC6hgMudIfjNms3PSuwCHai2f5fy/f7dTfAd2yezbkIPrPHzqhtTldFtxNuCUKUS
	a3iib3WDjUsPMsYIY/jzg9vu3KVHfCA5Fj948HCH62Q==
X-Received: by 2002:a05:6102:162a:b0:77b:28c1:210e with SMTP id
 ada2fe7eead31-782bf9bca7cmr4121526137.1.1787781864359; Wed, 26 Aug 2026
 15:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125348.1138649-1-morbo@google.com> <20260826204323.3974187-1-morbo@google.com>
 <E9656951-4A60-43BB-BCCD-4249F70BE10D@mainlining.org>
In-Reply-To: <E9656951-4A60-43BB-BCCD-4249F70BE10D@mainlining.org>
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Aug 2026 15:04:08 -0700
X-Gm-Features: AcwNN1XZAcHYyOacS71CcIqgQvcI1d_XlJVHYav1sZyJBbPppwjsV6YVzHnhu5A
Message-ID: <CAGG=3QWoRk8AVkuir4Ooa7ghZX9QpCU42M15F2J4SYN+zENouA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] userns: Add KUnit test suite for uid_gid_map
To: Bradley Morgan <brads@mainlining.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 2:21=E2=80=AFPM Bradley Morgan <brads@mainlining.or=
g> wrote:
>
> > + /* Insert more than UID_GID_MAP_MAX_BASE_EXTENTS (e.g., 10) elements =
*/
> > + for (i =3D 0; i < 10; i++) {
> > +   extent.first =3D i * 10;
> > +   extent.lower_first =3D i * 100;
>
> Both .first and .lower_first increase monotonically with i. So
> forward[] is already sorted by .first and reverse[] is already sorted
> by .lower_first before sort_idmaps() runs. The sort is a no op on
> this input.
>
> > + /* Verify sorting is correct */
> > + for (i =3D 0; i < map.nr_extents; i++) {
> > +   KUNIT_EXPECT_EQ(test, map.forward[i].first, i * 10);
> > +   KUNIT_EXPECT_EQ(test, map.reverse[i].lower_first, i * 100);
>
> This passes even if sort_idmaps() did nothing. The test cannot tell
> a working sort from a broken one.
>
> To actually verify sorting, insert the extents out of order so that
> sort_idmaps() has to rearrange them. For example:
>
>     extent.first =3D (9 - i) * 10;
>     extent.lower_first =3D (9 - i) * 100;
>
> Then after sort_idmaps(), forward[0].first should be 0, forward[1]
> should be 10, etc. That proves the sort moved things.
>
> Nits:
>
> > + KUNIT_ASSERT_NOT_ERR_OR_NULL(test, map.forward);
>
> Redundant. insert_extent() just allocated it on the 6th call, and
> the previous KUNIT_EXPECT_EQ(test, ret, 0) already confirmed success.
> If you want to keep it, at least put it after the loop where it
> protects the sort, not inside the insertion loop where it tests
> something that just succeeded.
>
> > + KUNIT_EXPECT_EQ(test, ret, 0);
>
> Should be KUNIT_ASSERT_EQ. If insert_extent() fails the test
> continues and the next assertions run on uninitialized data. Same
> for the base test.
>
Billionth times the charm!

I hope I've addressed everyone's concerns. Obviously let me know if I
didn't. :-)

> No tag yet, fix the test data and I'll tag v4.

I added your "Reviewed-by" on "PATCH 1/2", but not this one.

-bw

>
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.ne=
t/

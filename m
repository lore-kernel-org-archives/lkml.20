Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793519134;
	b=1E+NOBAZ86EY+6B6Fa127VjBqbGEWkZu9YyhR6POaQc1vxL5TiOhD5eO0u9uMgJ1qVbZ
	 90AKYm6kHksXxktvYAEcyHQlNEMVPp8hwSBBmvnuIJbbF8hlIVhGCRLWWD2ULQEP+Ia29
	 O5fYgpDidfNfMC9qTbMnqg5DFwthkLi2Hs/g2QRzZ6g/+P5Q6C7G2jC4AY/PDjycQKXpD
	 ZxzhDheb+kphpe3S4pGLg2Bm0PM9IEezhKx6G/CeRhiVrItA402e8h/Pl9ZsXK+iAKfp7
	 2E3Gyd+MX0z91tM+Bdf1+nUk0adCsL+BwsNoq0nuIh+9aAzFePrXDEoghcD9/IHcbiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793519134;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e4EP3Ad5hH7nvwH91+4TgVRsVIVbhxkn0SnVRiywnP0=;
	b=kNpODCNd5qTafphkE+jLCK35Iv7uiTk/gO4GGqU3SM00IlIU8LyvvN2OFQ5pffGCB1vm
	 DlK3Amk9kgxyPjZGr/A2mHOmxXHJ/RyKoCFbj/pJKbDPDerpXds8lnmWMx8vQF5nxqfko
	 OWIq+35CzHw5Gu71w0VQtraHtms2NX0eH4r4sHyqzIqsWMliDiJ9KvnnDu4tQ+4PyfqqQ
	 Tcd08VqZ9gGPmhbJ+uCbSUTwq/EKGD4zOgCSfD0XfjvOlwXlDnjIzPeF/gbj0XwqKJ4nK
	 J5dhAMXNSNKX386Rm768ehqJdJV3+H0VKHftJPnu475wgZqGvQVfbq8yaDAftoAGfnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tafwcz4N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CEA606A329;
	Sun,  1 Nov 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tafwcz4N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF82C1F000C1;
	Sun,  1 Nov 2026 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793519133;
	bh=e4EP3Ad5hH7nvwH91+4TgVRsVIVbhxkn0SnVRiywnP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Tafwcz4Nm5xU9CsfeAB+gjvHKCA8kBV5O9Gjw3J3LVYEWJQrxk/3bR6DshKjYM/AA
	 KZvnH3/1G6K7B776p2auRGeo3ALNX3MYn8JS9s+XiOQPBmMLZ8ZU67fQ1ebeMx6itg
	 Yj7oqFwzK1IHy/5o75DuiqWkFu6GW9Gq/Ke/hVqpkXqLFGsj0jFDj/mnFxgm6r5EAD
	 CJGgV6LBzsb+SLIQrPgbIeWjRxV6g4dSnjccB54Yc450kRI/erqZD/zHGbTjAW214o
	 jODeYooJumvIJxAWvb8KCrB6zRt5p6Ax7CU4jC1+AZZcCu1+NpspFXVIYxTLGVbQRm
	 8BHBubGuRIdwg==
Date: Sun, 1 Nov 2026 08:45:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Ricardo Ribalda <ribalda@google.com>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <20261101084528.53a1e83e@foz.lan>
In-Reply-To: <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
References: <20261024185058.20410953@foz.lan>
	<CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
	<CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
	<CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, 31 Oct 2026 14:14:37 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 31 Oct 2026 at 00:47, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > And if people are playing games with commit dates, they need to stop
> > doing that. NOW. Because I'm not pulling the media tree until this is
> > dealt with. =20
>=20
> Note that this is more than "don't lie" (although that's the biggest
> issue to me personally - I don't want to see people lying about what
> is going on).
>=20
> It actually broke git this merge window. See
>=20
>    https://lore.kernel.org/all/20261031065525.19883-2-torvalds@kernel.org/
>=20
> for a patch I sent to the git mailing list to make git-describe show
> the right commit counts.
>=20
> Git doesn't depend on commit dates for _correctness_, but they are
> used for a few heuristics for quick history traversal.
>=20
> So if you lie about commit times, or are committing on a broken
> machine with dates completely off, the resulting repository data is
> actively worse.

As Sasha mentioned:

On Sat, 31 Oct 2026 22:25:23 -0400
Sasha Levin <sashal@kernel.org> wrote:

> GitLab shows the same pattern for all the commits you found: the copy each
> committer pushed sits on an older parent with the same committer date, an=
d the
> rebased branch that landed was pushed by marge-bot. For your example, Sak=
ari
> pushed the alvium fix on top of
>=20
>   b38d06ad1e13 ("media: ipu6: Fix up missing IWYU issue")
>=20
> His MR with
>=20
>   63c578491cb4 ("media: sun6i-csi: bridge: Use V4L2 subdev active state")
>=20
> merged at 22:10 UTC on Sep 16, and at 22:11 marge-bot pushed the alvium
> MR rebased on top of it, still dated Sep 15.
>=20
> So in both cases it's the tooling being funny.

Those are caused by the way we merge patches from different sources.
Currently, we use gitlab mainly because we want its actions to run
media CI.

The way it works is that multiple committers can send merge requests
to it, each starting CI pipelines to do several checks, including
compilation with different configs, checkpatch, sparse, smatch
(there is ~10 checks it runs).

Then, either Hans or myself merge the pull request, preserving the
original committer and timestamp. The goal of preserving it is to
preserve who generated the merge request. This is done using a
tool calling margebot.

We opted to do that instead of using merges, as sometimes we're
picking very small merge requests with just one patch or two.
So, if we don't do that:

- a media pull request during the merge window will end with
  dozens of merge requests on it;
- a media fixes PR will have several merge requests
  as each fix will have its own PR.

So, this is due to our attempt to not pollute upstream with
those internal pull requests.

Now, there two ways to avoid that:

1. a one-line change at marge-bot, applying a patch that Ricardo=20
   prepared yesterday:

	https://gitlab.com/marge-org/marge-bot/-/merge_requests/676

   This will keep preserving the committer, but will change the timestamp
   for it to be monotonically increased, losing the original timestamp
   representing when the committer merged the patch.

   We use this procedure to allow us to have multiple merge requests
   to run at CI at the same time, as CI usually takes 30m to 1h per
   merge request. By using this procedure, maintainers can apply
   multiple merge requests at the same time, letting CI to
   automatically test each of them, only actually completing the
   merge after it completes successfully without any errors or
   warnings.=20

   As test time varis from series to series, it means that merges
   will be done asynchronously, not preserving the MR order.

2. switch to one merge per each committer merge.

   With that, every media merge request will have its own merge at the
   media history, which would reflect on upstream merges.

   So, for instance, merges during release candidates will have those merge=
s=20
   inside it:

	https://gitlab.freedesktop.org/linux-media/media-committers/-/merge_reques=
ts/?sort=3Dcreated_date&state=3Dmerged&target_branches%5B%5D=3Dfixes&first_=
page_size=3D20

   So, for instance this PR:
	https://lore.kernel.org/linux-media/20261028014050.3614d83a@foz.lan/

   with a single fix would have instead two patches(*):

	Sakari Ailus (1):
	      Revert "media: Don't hide I=C2=B2C or SPI drivers by default"
	Mauro Carvalho Chehab (1):
	      Merge tag 'mr-426' of https://gitlab.freedesktop.org/linux-media/med=
ia-committers into next

   which is probably not what you want.

   Also, we would need to ensure at gitlab that each merge will=20
   generate its own tag.

   (*) we could minimize it to only do a merge if the parent is
       different, but still when we have more than one media fix PR,
       we'll end with media internal merge requests at the history.

   The ones inside the merge window will also reflect the media
   merge requests:
	https://gitlab.freedesktop.org/linux-media/media-committers/-/merge_reques=
ts/?sort=3Dcreated_date&state=3Dmerged&target_branches%5B%5D=3Dnext&first_p=
age_size%3D20

   So, you would see dozens of merges on media PRs during the merge
   window.

   the advantage of this approach would be to keep preserving the=20
   exact timestamps from the committer.

Based on past discussions with regards to avoiding to send internal
merges to the upstream tree, I think (1) fits better.

Either way, either (1) or (2) should probably avoid the issues you
mentioned with git describe.

Thanks,
Mauro

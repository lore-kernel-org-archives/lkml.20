Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE6265620
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377987; cv=none; b=YOGCUjrt0aCAYqmI4wD0tcWNho7iIVocfKrGPBOUrQe7gjcZUrg1I0XnWsD1XeYbt9RLYgH6IL53jC6TNvtmBuHfFqVwS5G5f//9i06Kdc7BsP1umf/qfsYXV/ZrFh3kc6LUOiwTQRtbdmYI6jzWD5kgWaiZ6XcxmRPv5YiTGPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377987; c=relaxed/simple;
	bh=7KT/WGQF6Xo8jF6l+kHuBuDgwW4DUz6Hjn6foeSO28s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZQnEMvkVRy2bAH/x15mBmID6urtLNG17tGsnBd4dmuoX5HLZZqqScaM6Ijz2rIdxmv3T2kMGY+ARe8pzqO2SAYoRK1poEk4+b6kHEeu3nPy3Ku+05Xdt9olNudNA/vTIe4G8Bddw+ZIAs1GVTO0LWJk9fQmsc7pv87KCtDUlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j29ORYVN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j29ORYVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DD01F008A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377983;
	bh=7nr8zTPRJR4XCNAzMSPXRD1SAJbdWdrTlMg9PBTC1Fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j29ORYVNgYfPyoi1mUmgmGMXRptKlY2PArjQNYQKeL9SIIYLNoHlrhq3OlOTn2I1y
	 rHGz+U3aCycNndYevETtnc9I1aR0YqmXhqgUSCRNzVB3Ey18ksVreDiajzRLr96vbb
	 6akXDHwObu5CBEP/Yp0dOSp1q6taxQ4S9zWtC/PxTNdwyEdXb5hTURVeoAH3VyCS/y
	 FcDIoY9rpBNa/bjjIjISj23IyEpFWEjw+9CrTcgvxAZ991X/zXaVhYMH05vQeaLN5r
	 zP7zXeUU4VlA75UqBvXemetxOldkiQnJ/By/Vh3i0jesmX/olKXyGlLax2DnKAoBav
	 lo7b7/Nb7njVA==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a0fb2f9efso83805985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbfrW5+Xgm9mLlJG+z/eHEzVVnMdQ2admrglthC9QBbQvllkHcguZ6Es/AR6quCeLLCuZ1BP65Z4JeAPs=@vger.kernel.org
X-Gm-Message-State: AFuF++mezpxgt0JMqcrmathMBHtmtLVtHZMpCOj6P/7MiSz9O/Qd/13t
	28GdpgSvN3JU7pw6ssEdRK91Jmd0x0mXz9LtWmJHyAdNzL1aUMtJozOSzvgxjPCp3p7rk2upGNk
	3L6YOLW+SrPqBnVkHSYcHA82b1+ttqBU=
X-Received: by 2002:a05:620a:2708:b0:93a:133a:310b with SMTP id
 af79cd13be357-93a1870eb4amr541774985a.26.1789377982735; Mon, 14 Sep 2026
 02:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
 <CAMgjq7DdF_fi_MserE_P_AbKR23mrqPLZ-VD71eXH6iv1ncdzQ@mail.gmail.com>
 <b5263014-23b7-4e8c-9bd9-18198409d0f1@linux.alibaba.com> <CAMgjq7CcPfOnAjh1EVRu8-YtCaWjCfx=07Q4RLxF1yV-bj2NPg@mail.gmail.com>
In-Reply-To: <CAMgjq7CcPfOnAjh1EVRu8-YtCaWjCfx=07Q4RLxF1yV-bj2NPg@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 14 Sep 2026 17:26:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zLdOmwsOum8waP8MGSZX=MbuJfjXmR-NRoUOmND5+Zhg@mail.gmail.com>
X-Gm-Features: AcwNN1VghK2xzQNbqn1Q95Fi6KZsPMwLyabikwvKm465uZ60Jog_NueleFhaFLk
Message-ID: <CAGsJ_4zLdOmwsOum8waP8MGSZX=MbuJfjXmR-NRoUOmND5+Zhg@mail.gmail.com>
Subject: Re: [PATCH mm-new v2] mm: mglru: clear the reference counter for
 rejected folios
To: Kairui Song <ryncsn@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, ljs@kernel.org, 
	ridong.chen@linux.dev, baoquan.he@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:51=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
[...]
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index c2eb8fa9d5e5..a1ead7c61054 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -5071,10 +5071,13 @@ static int evict_folios(unsigned long
> > nr_to_scan, struct lruvec *lruvec,
> >                          continue;
> >                  }
> >
> > -               /* See the comments on LRU_REFS_FLAGS */
> > +               /*
> > +                * See the comments on LRU_REFS_FLAGS.
> > +                *
> > +                * The rejected folios are never added to the oldest
> > generation,
> > +                * so this effectively promotes them by at least one
> > generation.
> > +                */
>
> It looks good to me, thanks!

+1, with the above change,

Reviewed-by: Barry Song <baohua@kernel.org>

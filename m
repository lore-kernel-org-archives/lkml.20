Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E25352017
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817742; cv=none; b=Wm104KzIGMZ471iVuCJ6IE/ZaLj9uLSl8kUxvJs/cWxMQxLAtFh+QgPgLEm4KTAsJdRFMSTMRqcWknfeWsMwvFQ4ih2sDzCTIxdvq3oiGwGo7rTWWZFlQYHG85hQGO9ILrawAvvSK5UWqgTZFW5vV5uvRFISJqJY+Nuh19sWBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817742; c=relaxed/simple;
	bh=aWUTCJCREI39E+aOOjzAotyeoOPH2eDIrrDPoZKoBu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+E2VfcbyKQxk/voNvfKlSw8cxDv3WbRLWBAGETSjNNWHDn0W7AQyIwt13cjF8ynM9J1KIjk6qu4aEqsQ7SgC1xhxRX2CvFMQ2tkMHdRk5FXm8kGH+f/48tKHr1S6ZppWFdaF7l4gc+7Tzv2sA7nheRNZz5HKk5PYHbSgoJgeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu84CkOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu84CkOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAF61F008A5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791817741;
	bh=aWUTCJCREI39E+aOOjzAotyeoOPH2eDIrrDPoZKoBu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eu84CkOmwXFvMRBks6U2hSG/qU6Oa7OELN7uWkx9qsNlcq1FrAo3oASGeD5VO3WfI
	 KdV+hD8axKez7OeVzfU9Gsg/lft/D2RMBGY/V1zsGzG8zkb5/Luk/0keI3C+ZVjtvj
	 +t8qmN74NptmUQr9nlEHfPar12/eFDKiGywqftNP+vCHoh/QbKBx31a9SeVI72cAXX
	 SPuL9eMmjnQH/kzTbX97R0GQxaGZZ4qClq6VS86GlXJ0L2vYPzrnu/7LVlRe72QAMy
	 y0c9Lw4B11ktrTwZvaH0QnB95SGQNcWy9J0AOBjRNjHiQeYBajHVzq+gOon1TJlzRl
	 b1MtXYTh+/SjA==
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso306313137.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:09:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNobl529WgOGmAR90eTCFX6rHyDaBgmATHxnXitFQ74OuJ8pu9JaFietaOtMZQ/YwsdTNh7i0Ivwxbyqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj87eB72zFA8NN/zq3XEpNCnq8geNk24n33hnRsVhHiZ1Sbxgk
	FSK/msEHJe1g9VJ9eYXuMMMzJ8z6rVLAbL47TG67fSpj09mn/Pvz1UOpFO+OFxo/+h6krr/CT+g
	oOQ/TlvNPaKPQMvWStgme0xlk88ZaPkU=
X-Received: by 2002:a05:6102:5114:b0:7a7:195a:1b29 with SMTP id
 ada2fe7eead31-7cb375057ebmr2198065137.35.1791817740701; Mon, 12 Oct 2026
 08:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
 <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com>
 <CAEmasaXa2pB_Jm_VgBZAWQwu1p75yUSY2=dr0Opt5okLgWk-YQ@mail.gmail.com>
 <CAGsJ_4xw+CLzrazOFxnvJCbvG0qoauEuFGR6OdtT3x78ef95pA@mail.gmail.com> <CAKEwX=NrMD1jpU=Kfh367mGArw_ju_8ku=Rh_v8TiLumx3+S3g@mail.gmail.com>
In-Reply-To: <CAKEwX=NrMD1jpU=Kfh367mGArw_ju_8ku=Rh_v8TiLumx3+S3g@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 12 Oct 2026 23:08:47 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zg-PuThnKMgN53dV-VbC6Zxo-s6WKoN=x92Aa2=9pu8A@mail.gmail.com>
X-Gm-Features: AclHuK-DxxppJUvPEq3sn3XyNg_m0af3-igDf9H7UZjpJzGKzM_B88Cpkp_3Ugw
Message-ID: <CAGsJ_4zg-PuThnKMgN53dV-VbC6Zxo-s6WKoN=x92Aa2=9pu8A@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alexghiti@meta.com>, Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, kasong@tencent.com, 
	ryncsn@gmail.com, chrisl@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Mon, Oct 12, 2026 at 1:01=E2=80=AFAM Barry Song <baohua@kernel.org> wr=
ote:
> >
> >
> > Thanks! This seems to be a strong indication that setting
> > `page-cluster =3D 0` can also resolve your problem, even without your
> > patch. :-)
>
> If every tenants use zswap, yes. But we have tenants with different
> kinds of swap backend in the same host (some using compressed
> synchronous swap backend, some async IO swap backend).
>

Yep, I have no objection to this patch. As I replied to
Alexandre, I was just curious about what would happen if we
set `page-cluster` to 0.

I think Alexandre's autotuning patch looks good overall. We
just have a lot of corner cases to consider. For example, we
might miss zswap and trigger readahead, even though some
folios in the readahead window are actually in zswap. The
opposite could also happen.

However, I don't think we need to handle all this complexity
at this point.

Best Regards
Barry

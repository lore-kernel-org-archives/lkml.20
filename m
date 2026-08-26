Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8813F7867
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780638; cv=none; b=bq7BvQN4IkP2fjJmC1QkraEMWuL32TTLz8quX42KCyt1mBKuhip75xsK2tlM6V4oyO6YbiF/UhO/rw/xRssXvVIdCTP8f/hm1P7jpQTuURbsfrcVmKNb7J68R/gRdS7TO+outQJh+ks5whzaoKCCCWI7Kch4FUO7wYvDlt+OlI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780638; c=relaxed/simple;
	bh=/TAa+RnwwziTNpbtJqoZnNQP9qDPbPPmreJwAQHZM3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KN/tJoyCjWTS+5Zb/b/7rdqRXL7Z1T6IppJpvmr7RhwoVb7Dh1UsnUt2j+yt0NI6u4t5goveT6wMkQ3mRQc4O9+L+CMYtyOfBSLN/SduAszwIxaI9E7l6dPEJN5dogYIi2VF/BcU6S0h/qaLOuxh9NKlWd4SZd9HoGemVlQag4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=or2rPFmW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="or2rPFmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73671F0155E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787780637;
	bh=2roDRA2Ocj9k8psJYEvUg6GITDjk4l3VJCYd3f7li1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=or2rPFmWUworOzOd0pxbnRMZfNe9k4jfeGb1aD3IjVSuKPlG1lHPQJItjRDwVeaYV
	 VVhBTG8BYODz4KjJnOFsUMPxUnCWSTNbC1pgwiKJuYCGECGE6pna0jwrS5joo+BU6C
	 VyZULLEtJhIy+rGIiq0vwkVW1NwH5AxRl842FRFmnGYIujs6nGBXZVqR93wFqggpEk
	 3s1rB/+AwlxalZjrWeLwP7BDNs1UAq7eZo13FmMWJthdAZS0HhSDJrjAXVFwQKa+lg
	 eKtq4Np76Efi8A+zdhDE4tDWjAITguCqLT8ukGi12ryYBhrPPid2hRAL8O3imGgLDK
	 BEZnPim2KiXmQ==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93695893ac1so4940185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:43:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqkudZVNEW+w5d4hWY5fegXVbZwGszQr27AuQCfcqaVzGhP/pdcl6cMFHvFD8/l64dSiWGEAk2uwSTkba4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPa6mfD5WkLj+K9wbVNV/rjuduPEN3dIUpwT5iXeqiXCC6u9yg
	1ENQjkvOLGpKzwW8uy0YEEFTjlhAMUZ6fH9f6e8fTUUDq9lqPl6L7eYyIqx+IpEqK3ay2EpBu8p
	GQar/Vv2VmkJd41AlvGJRVVvYh/le7w8=
X-Received: by 2002:a05:620a:46a0:b0:939:3c0:7520 with SMTP id
 af79cd13be357-93903c077a9mr41198885a.18.1787780636906; Wed, 26 Aug 2026
 14:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-4-baohua@kernel.org>
 <ao6qTTtk2xkkeKob@fedora>
In-Reply-To: <ao6qTTtk2xkkeKob@fedora>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 05:43:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
X-Gm-Features: AcwNN1U1hcI0Vzy6pZR5m6oVpQepLjO3IAPExcgcrEvv2QP6yu7Rc87cN4jKPoQ
Message-ID: <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
To: Baoquan He <baoquan.he@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:56=E2=80=AFPM Baoquan He <baoquan.he@linux.dev> w=
rote:
>
> On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > During aging, a folio's generation may already have been updated by
> > folio_update_gen(), even though it has not yet been moved to the
> > corresponding generation list. Such folios are hotter than those
> > already in that generation.
> >
> > It makes sense for inc_min_seq() to increment the generation of
> > folios that were never promoted during aging and move them to the
> > tail of the new oldest generation. However, folios that were already
> > promoted should instead be moved to the head of their updated
> > generation, just as sort_folio() does in scan_folios().
>
> While sort_folio() move protected folio to the head of next gen too.
> It only moves ineligible folios to the tail of next gen.
>

Hi Baoquan,

Thanks for the review! I=E2=80=99m not quite sure I understand what you mea=
n :-)
Could you please clarify what you=E2=80=99re suggesting?

I can explain the design in more detail.

Yes. For both promoted and protected folios, `sort_folio()` moves them
to the head of the corresponding generation.

Here, `inc_min_seq()` is a bit different. We are overlapping `max_seq`
and `min_seq`, so the `min_seq` generation should be moved to the
second-oldest generation. Therefore, I think non-promoted folios should
be placed at the tail.
They are genuinely not promoted, so they shouldn't be at the head.

For example, suppose we have the following folios:

Second-oldest gen: f1, f2, f3, f4

Oldest gen:        f5 (promoted), f6 (not promoted),
f7 (promoted), f8 (not promoted)

Without my patchset, the result is:

Second-oldest:

f1, f2, f3, f4, f8 (promoted), f7 (not promoted),
f6 (not promoted), f5 (promoted)

So you can see that both promoted and non-promoted folios are at the tail
of the second-oldest generation?

With my patchset, the result is:

Second-oldest:

f5 (promoted), f8 (promoted), f1, f2, f3, f4,
f7 (not promoted), f6 (not promoted)

Best Regards
Barry

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100802;
	b=R7hi++NTe22uaS8MBiTuVXBeuxx9Ot+5sjkSlnuNr+UptnvTOn/hueJBWjuX0wVRNMtf
	 klpY7OLJfLz7K/29QSTMz14fbcpKZhJYcRgaeFHmGcbobu0ICZwRpRWYxgx5721/9VKqQ
	 hsyojQ46ZiJImU7rposzS2vjtKDvHegQZHmD+CBrMHHV9k6KY6BaK6v7bWUD5xP+8ysvY
	 kMwatAmFF5qZkGwxcEIvBlhceUehMaDN2dTBPMH5ly/JE5iM+Hx2fcrU8FMaJPQbO36LR
	 c3s7/xR3E0FQzvHPqzwX06WUnUfXG00XEKPmm/3CRx3MKLqYe0NFJJTXx72EUczykDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100802;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJ4KhwrLt3mSjQzIDeyl2KzSTIVdhJovj7+98ElkoQw=;
	b=zkzvhE6WuTm7xye1EaP1sN+hFWOXwpFp1v15yxCkrzeIDA3dSO9N7a0k7X3mQFOwHshC
	 8SqJw/nVqRqvMED72srzIOSia+eqqc1E8Tc4mPxD3w/oo6pAxppDCeFKrp7H/qwUHidSf
	 h4NB+u13O5+FvSmTGTO6Y+4Rqg8e4ddXAcijRMl8hCAkVtqMZYZqGl+H+M8F38EItsCQ9
	 vwnbQgKfG/NeHj87VzENOzlLS0pQloQrFAmySGuPX40AQQ8o9vI23XOk7oLx7aqHKphyK
	 9lqJ2b22WxUW4XoqoDvk6XhU1hicbaMPshl88CtqWMQZQYdPG7Pjl9kpPW33MfOrzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/6Wo8In";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681EC606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/6Wo8In
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC731F013C2
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100801;
	bh=YJ4KhwrLt3mSjQzIDeyl2KzSTIVdhJovj7+98ElkoQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c/6Wo8In+boLLDqakrzUyFmlACTCliA3iOZiTLnxHU4QwL5dnqhQhynNDY6DYzgu8
	 U+FhNhk497xOqOa5k8g2NmnzpoWtbKuI2T68/ccOUMf68+cFm1Sjo52QOjTfNK3C0M
	 4Okz7ybXwovG3T/qC3YfNflP8GShDh/JDqRO8QaNRBrD7buOHfhUU9XhVF6FlPE2Tu
	 FoLeW1UvaBoZ4pg6aX+Dr9pVBzSul9sSWV6bicdLb4ZVsaAF0bBxUAoQ2s7GiFEGL6
	 0OKDgpl06/U8IsOidKkyXsUorbhdHTIjdHXcZJhcIuXUGUSrSXDgQRwpBqASPxcrTk
	 8WwOI8qupiS1w==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f1ca4132bso339313085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:33:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypw+Wn4aVxVHoUjhuKOa0s26HbTFy58xd0bHZnP7v8x1Wr8EFtP4786LqFLcJVj5BjiJMvXoO+xneU/jI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlY9VR/ow91abpV89QQcHObkdWxQScNtB0ywGHux498JnfHOfP
	ivBpeGGq430luYBJF7AmFCPwm4dm3wvdL6eTb9bMluLJ4mU+JFfHV6r5Jr9Y7DSrlNvvptBmb0Y
	gD+7ri9sWVmX7wW9sgFw5KeAcY5Spac8=
X-Received: by 2002:a05:620a:4543:b0:93e:c12c:9dd3 with SMTP id
 af79cd13be357-940ef9efaecmr1359298785a.83.1793100801302; Tue, 27 Oct 2026
 04:33:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026084035.535989-1-hui.zhu@linux.dev> <CAGsJ_4z46o6fs16T0ctLcTXiinL1+0CXpvueDN1rVc2-rLT6NQ@mail.gmail.com>
 <c42ec8e1-6be4-4faa-8175-174fd2f11218@linux.dev>
In-Reply-To: <c42ec8e1-6be4-4faa-8175-174fd2f11218@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Tue, 27 Oct 2026 19:33:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xsc6CZL3YLBQcXCOxL=xwTdZpWsRiSrZFwuHzti1RC7A@mail.gmail.com>
X-Gm-Features: AclHuK-61WBlBg98b5PE6LnRMMAHlWD0i0f-CRpjM6_4wkBHIJZA5jcGM8k9Gts
Message-ID: <CAGsJ_4xsc6CZL3YLBQcXCOxL=xwTdZpWsRiSrZFwuHzti1RC7A@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Yu Zhao <yuzhao@google.com>, Kairui Song <kasong@tencent.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:25=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
[...]
> >> +       lru_gen_clear_refs(folio);
> > The only thing I'm not sure about is whether we need
> > if (lru_gen_enabled()) here to keep the semantics consistent
> > with other places where we use it.
> >
> > ...
> >     2    676  mm/folio.c <<deactivate_file_folio>>
> >               if (lru_gen_enabled() && lru_gen_clear_refs(folio))
> >     3    695  mm/folio.c <<folio_deactivate>>
> >               if (lru_gen_enabled() ? lru_gen_clear_refs(folio) :
> > !folio_test_active(folio))
> >
> > So maybe we still need
> >
> > + if (lru_gen_enabled())
> >          lru_gen_clear_refs(folio);
>
> I think we maybe don't need it here.  The other two sites consume the
> return value, and that is what the check disambiguates:
>

You=E2=80=99re right. Thanks for the thorough investigation.

Reviewed-by: Barry Song <baohua@kernel.org>

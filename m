Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450757;
	b=kLiebu/lJP8J22SzmvDLFU2rXEp+/Wn84doFb2ahwEz1ux3lcYUKdH+ZH35sAL8cCWdw
	 Hch2Q+3nCbJetUY3eYpHK9qJA1kFeMATh2uVB6pP6Z1Z5TU07nfeng90m8RJE84jGrAew
	 xQZ8G5nBU8QvS2yvXJd8fTpJuZL6rkKqgi27irvVvjFNTIQL/hg0UJUgAABbPYkrgOBMM
	 OTSWk0tVO/6KajKDmgwAbsKfA+w3LGYEcxNF4IhRSTA497McbYxqRfgyfWSL+vYtlyZHZ
	 CKGFFzVDa/czi+gRW5EyawwY/2QfG6HMrvTNNBaqD4K9jfRlMI2rZ3W4AVfJZa9RFUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450757;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NP+3b+jU6Pt4iOuSZnbpymTlb8HWqG2TQ0sFosc2A5w=;
	b=v8WilKu2/SWJKj6zX10tnwXiMCxDgINY0KgtGkgCYlkkrJo4NFSYviDpXAEJMZuX6Wqm
	 a2qV/kzBZL8hWyTqKiIznG+Rek/zbKTykLJgDrfQ+IBqKty/pr6HtzBlV29dFlrPTTQmp
	 zVSWCaJa2MEIETls+rJfu6wLaBfNMXnNKDMkByqlPmWzIKB7iAb8bde/Z2RzSv0NhuRBF
	 NfcmzrHXjHlldjB2cUW7UlckwyIBS0USYkFDdk+2QSq0poiSxlgvxeKfN8BODqrSo6mXz
	 fK320kt48NLyMglE27z/ntZn+dBXypFAsZ7tKCvU5ZtbgUso83jMCVLhsPVmAYRZXVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNJjoBHi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNJjoBHi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E451F000C5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792450756;
	bh=NP+3b+jU6Pt4iOuSZnbpymTlb8HWqG2TQ0sFosc2A5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MNJjoBHimcx20jKOW/IMI37c/TKoKlswb79hTiw2MdNfLWw6RtMo/Kc7JRdCJTzqB
	 fJn7w1UREkj6XcT6297vv9bdYz1XAvGUVOu3ymMNNlSBkpwuxCASqvPE4CmpZ4Ydki
	 JaaE9aHmuOJo4O5tB5sjJ6sngJ5LvXvu/sM42xnsg44Z65+npkpPPU6h888UegA+0F
	 mnzt5c7t+N00nhn0meFBWPa1fsL0tgUwc5EzK4+/HihprhMZDkpxamkTI5ARZH3Z4K
	 CZasiwVMSXAiHBSUhU4g6OCC9lk4I9O5tP12zDOiI1swu0nwgZojFeyx3NOMkNgHR6
	 dY8pL3gyiQFpw==
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-918f75a68f0so37699136d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:59:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypiUvbFCCsnYtoQt68bJDBE2tL2lD7lVMeFEIICN5nKMcj8QRDfo8Cw2Tc3jcrogKVdOTqDWow9PBbuEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa5ilaq6cqbZApLMIT67B3t3G1ot3G9rWDZH/kZA6cNYWGIV6J
	O/uX7Ye+eXB5CmyP/xvTJRsJWhZdfmZBSk2gJ1slS/6b1VHe37PWqnEbfzLwixIUVsED9k9gK1+
	2DpeUWqREcNsHEvn3Jlk5HG10LKKpaQA=
X-Received: by 2002:a05:620a:40d2:b0:93c:6507:a6e2 with SMTP id
 af79cd13be357-93f29dcbfc2mr1496702685a.65.1792450755627; Mon, 19 Oct 2026
 15:59:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017050928.128582-1-sidchintamaneni@gmail.com>
 <CAGsJ_4whqGRQ4JY5rLLJZU=f8u5T75qHkJYQFDoqZSx5c6EBHQ@mail.gmail.com> <CAE5sdEgR3C30xMayXJkWOECQTfADHgNE8Qf9=wjB5eGimjwLYg@mail.gmail.com>
In-Reply-To: <CAE5sdEgR3C30xMayXJkWOECQTfADHgNE8Qf9=wjB5eGimjwLYg@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 20 Oct 2026 06:59:04 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w2ZSe+jot17v1SUqeWsFaj+DJmckZA=js3FQhUt66Fjw@mail.gmail.com>
X-Gm-Features: AclHuK84pjR_fzDL7jQ8QK-VnmwljGUwwh_bnpTXVDshBNZKrTLHqRnrEMTBSJY
Message-ID: <CAGsJ_4w2ZSe+jot17v1SUqeWsFaj+DJmckZA=js3FQhUt66Fjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref
 with memcg disabled on cmdline
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, stable@vger.kernel.org, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:37=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
[...]
> >
> > So this happens before any folios are added to the LRU and before
> > the userspace init process starts?
> >
>
> Yes!
>

Thanks for confirming.

> > > Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists=
")
> > > Cc: stable@vger.kernel.org # 6.3+
> > > Assisted-by: LLM
> > > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > > ---
> > >  mm/vmscan.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index f11491ee9ed5..0c57e4f1eb15 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -5253,7 +5253,7 @@ static void lru_gen_shrink_node(struct pglist_d=
ata *pgdat, struct scan_control *
> > >                 sc->nr_reclaimed =3D 0;
> > >
> > >         if (mem_cgroup_disabled())
> > > -               shrink_one(&pgdat->__lruvec, sc);
> > > +               shrink_one(mem_cgroup_lruvec(NULL, pgdat), sc);
> >
> > What's a bit weird is that even if we fix this here, with an empty
> > lruvec, we still won't be able to reclaim a single page. But it's
> > hard to see where we could break out early, right?
> >
>
> I am not really sure about simple bailout logic. Please let me know if
> anyone have any thoughts.

No idea. I also feel it might not be worth doing, as this
only affects very uncommon scenarios. Some unnecessary
reclaiming is unlikely to hurt real-world workloads, so
there's no need to escalate this into a fix.

For the patch,

Reviewed-by: Barry Song <baohua@kernel.org>

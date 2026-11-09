Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216847;
	b=GwOnMqv017aPk67rvD6HX6plGFJt4JBRCJO3i2Al6Ba+sTXg9BBdRoUsOOZQ9Ic23zTw
	 I8GaDAzRXYKjyKBGx3bfy6hK9Fb9GzrpCvIYS90SeBhZZeGK+YHIkOxmALGi8b5UPTnE/
	 MzSE3SZV7wZfy5uRUUTQcJRSLqrRVoIq+ZQew5oD98o5pGv0IDCqlac1UwTJ8HPegwCGV
	 Rou/T0Uef6aneGgfR6Z/3acuL+zrN1rDesebX55ZQ5uOpEGjcRhh3nsf3maEfDjZ4kP8g
	 8VjGMGJs2Jo5/mkVrXmwIQQRqB99GDdkqprMGq9tZHSrUd0fp2oGagNrSu6XetoQdsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mu/oofPDsfg+LaVc2a1HnbHK3ydvC97UTzMxPHDp3UE=;
	b=mw3GJPH9pmb4AwiNVcnb0M+ZIaErfHh8eGfFJNXClfKMRwXffopxEUL74HNATmeAUpM7
	 /BqOHOEsfSbfNJNKw/RGc2HgI0dVg43HUznhnsHgjyQ4qbHQ5kLuifo3m3XOCR54vtxqB
	 iIl4Sv880m6cB7zeIwMInuBrzeEKb/bZcJt3H9l/0Ov792S5mL6MatKlTUJjrnAT8Wemn
	 92Vc/vinVMRj4is/bSAxK6xsAxzr+0KjXo3lLJHxypXV/RGRwvTjCT65IDwvAcXzVaaTI
	 +9Uq8eYV/5O9M4hKhSheJTcx/zr48lAjDR2Dsai+WEQ8XlrSkDkJFsl5e43IdavJBaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnaUT61X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43311606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43311606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnaUT61X
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40e30c26a4so99012366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794216846; cv=none;
        d=google.com; s=arc-20260327;
        b=FIORM+zve+qtI77GApOmlW/SWiAEIQaiB77IbyCEkKNs6Om8EDZ/ZPPLDYrS5FJzbK
         52thzjVzOhGx++FkKUqW055N2zi7/DYYID9TFFa1nRaAkQRsjiD2DWNQvx/BzRr3AInO
         Gd+HVRvJDPqCIcHWpGJJ8o5m5i8BGs57n/utEMPvo+XAkz9bwcOc3eYI5C3EnZUebFQy
         splKYar1J34Q/RrvJmLgAVuk9TVdWobVLrWRK2aOEl48efRJMwvB1fwhwK6UzTvat+qZ
         w8oLY5zXX3AbdRehXyUx7WFtCvTN5JQf/cBIh2b3ofwDGYjDfm0OibMnqg5Oi1AlgZPy
         ebtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mu/oofPDsfg+LaVc2a1HnbHK3ydvC97UTzMxPHDp3UE=;
        fh=Sw91PpOaX9q4EEgRZ5D7QbAFS3akcNYOQrj6fs9DTUk=;
        b=oI5GHQJg/NTyVt6mKrUCQBB935yYdrbsG+MONA6pg+DRYhB4TsZ0BFsVId+ueV7HU4
         w/EHJeCVs31wFs46n7L2gv89PVB07AF1+kmTKDKCTpBu8HTnqwJZY+yBXuxcVsi/DSZM
         P7pnaA+WggEXJyRPZYqns9L1BFpp8TcD6OZ2WbrPI/oX0xDs6SSTQvwK3/Mw0Ybfv+N+
         QRxG6xG/vUvjw5h1R3323JADKLfy7yZXFYiM1Y3Rm9uw6hiXPoA200dJCcQ/hROmrci3
         R9C/RUmuIE/m4Ogs5VFwbLW+Fyw4nVuRng87zgjphfGowKlUJ3wryIbEhKe1txlydNgl
         YJxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216846; x=1794821646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mu/oofPDsfg+LaVc2a1HnbHK3ydvC97UTzMxPHDp3UE=;
        b=MnaUT61XbjmMlTUe2HIZqIdcwCgZdIt7+gn5d1HjnEI+O0sowDyPF+utpv6VNZwPFL
         TdZfQAXyxVDRBx9LyDDRBbyUIum5Z+7OIimjqyvotw5qjO4R1B9MjYG7PwjpdA6Z4YfF
         JRzRKd1WZEaYL+QvZSZQA0tJALA0spXVjEsx8oLkTdFpoVP6YyGiA3mBbZQQRMvPFzpi
         XtVs/XQ1kbBAjUpFDaIHJgKAmY61NbVs1yKCerV68ebWxyzag4j2hMzjMQH6+0jusscg
         AMke0mTaYSLp5cPKc3tL26EK0sIUkXGT4xLhaxLzuL0yOUIrmn8+xkgb6do3YS70Bt6e
         kDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216846; x=1794821646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mu/oofPDsfg+LaVc2a1HnbHK3ydvC97UTzMxPHDp3UE=;
        b=Y3r2Gm12ZzenvNS4dY9GRPtSjXsypPNS8V1aSsWfSlNxuDTUdAWmNzg2hx2DaDwEgF
         aKn8iGoZcU0JeOyTZjh5RuthpOIYBFA/3MnHTXO5yyHmKlwvJ9XQ8CgDHxroOjV83Q9z
         O/GQFJ4W4uHQZCaeE4ymMXP9UZCW9jr2imPUrZS6t7FCgGmDlSCxUPoIwq+n0vzbMx/U
         RfCZKgYydSKSjD4NzrKZUQH9ofhdWEvADdEIpC9ifOQBBvfER00mt0oKuXq0tAb6MhHJ
         //VPmxOhl55ti5Ea5EkJGWfobDJ6VSGv2cRTP9Sl1GoeydY+ukKWVvN4Y3X692RRS+/a
         H1dQ==
X-Forwarded-Encrypted: i=1; AL+hErGdHvIvH3N7/0/gbd5xHE1qVoTr76Zzv7ESvss3Rdae7msVvTD0PkMP+/c36npRBs5NGWeCfd8hvQIx+38=@vger.kernel.org
X-Gm-Message-State: APuU4Z83SWuymsNjECswmYJagtoy7Jcs06hMoKZrf7Aey2W4YVGvtVOA
	9jBP0YUAM6t4gLTzTjyx4WUCQAMfsh9+VAww1pN2Cg8CzMMmC6Su1p54VN0lC5ic5QKXKQkMW33
	kH9YtLa1kEJHVZauFYSzJtoOQEwhh76o=
X-Gm-Gg: AYBFou2XHJNNdTJSuMUVkDIJxEIBD+2oVbzLEW0sS7zGkesUd2UreXW7KMospZQS0ue
	6hyQougoXt15H1+SSEqkpxL58wPy+FYrAT+quqbY0BY2uqMpbmP3sYfbutxSjlI5mVJdqdijzO6
	P+UlirLO0Pf/VzPpmfucSEMonfHgfTmeZirW0BvBJlpG/ZANZ5ZzC0U7fK1XKLGZtz6zvrMh3DK
	1wb0KJrEJfYrbmRP9YM+oDVlUKjjdkiKPqRAhxQc1YTzB/m6AeRKFF9qYseNz5fJJWx6hOvnqtQ
	T9iTVwMsFZyjNWhTWJToJPsIblNDg6JcJMRQh333nbAt/OC5W8SHeiupscr09tw6UwhPxQk7ZCU
	f9uF4MSYqyuLDX6iWNjaNG63l4r4JpSAP7884hdLFOJs8pfa9p9p5LWTn9esRpmHng9Z8
X-Received: by 2002:a17:907:1609:b0:c46:78af:6150 with SMTP id
 a640c23a62f3a-c4d523bbb99mr398017966b.2.1794216845494; Mon, 09 Nov 2026
 01:34:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com>
 <20261016-mglru-fg-v4-6-2106750c0bfa@tencent.com> <CAGsJ_4zQh0TnAxifWPo2+DcyFFOtpXM+2QW91A07oumfyrqVYg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zQh0TnAxifWPo2+DcyFFOtpXM+2QW91A07oumfyrqVYg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Nov 2026 17:33:28 +0800
X-Gm-Features: AclHuK8oJGBgOQDKpdCDCogHbVwnPnC6cKJNTKD1XErUqqMirF8-gtHajt-txqQ
Message-ID: <CAMgjq7DeC23zak6Xur=E29qo7JPNvQUMtbbO34Y62jrQjQgStA@mail.gmail.com>
Subject: Re: [PATCH v4 06/17] mm/mglru: move add/del LRU size accounting out
 of lru_gen_update_size()
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 4:48=E2=80=AFAM Barry Song <baohua@kernel.org> wrote=
:
>
> On Fri, Oct 16, 2026 at 2:15=E2=80=AFAM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > Pure code shuffle, no behavior change.  lru_gen_update_size() now only
> > updates the per-generation counters plus the promotion move; the
> > addition and deletion active/inactive accounting move to
> > lru_gen_add_folio() and lru_gen_del_folio(), which know the generation
> > and can apply the active-window test directly.
> >
> > The unevictable case is untouched: unevictable folios never enter
> > lru_gen_add_folio() and keep being accounted by lruvec_add_folio() as
> > before.
> >
> > Tested-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
>
> The patch looks good to me.
>
> Meanwhile, I've been struggling with the names of
> __update_lru_size() and lru_gen_update_size() for a long
> time.
>
> Given that lru_gen_update_size() now only updates
> nr_pages:
> static inline void lru_gen_update_size(struct lruvec *lruvec, int type,
>                 struct folio *folio, int old_gen, int new_gen)
> {
>        ...
>
>         if (old_gen >=3D 0)
>                 atomic_long_sub(delta, &lrugen->nr_pages[old_gen][type][z=
one]);
>         if (new_gen >=3D 0)
>                 atomic_long_add(delta, &lrugen->nr_pages[new_gen][type][z=
one]);
> }
>
> while __update_lru_size() only handles
> active/inactive accounting, could we rename them to make
> their roles clearer? For example:
>
> lru_gen_update_nr_pages()
> lru_gen_update_active_inactive_size()

Hmm but __update_lru_size is also used by CLRU, so it's not a
"lru_gen" specific helper. If we can merge CLRU/MGLRU, then maybe we
can rename them?

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794048013;
	b=aYzNKo2ONGe/Ampzriapb9eEuqh0FC2x2SzEF1hd8yfEhVVkq8XotwLtb95IPD1cYsPw
	 GLjF7nhqBA9GAfNXC8qNc+FaZCAG3PfLpJblnHQSBeGqpW3Gda80fzWVBbTEA7m+PsBgd
	 jkVHOnrGj8CrmLNSincWefAYfyP2YGsXM2WXj0mEKbY+EMktwB49JRTMi/Qr137mA41wg
	 UCF6Wm6bTAk0wdIyzZNHYoRjs+YsEI64hMMYEGgw6Fz5Boc2KZdr1cZ5y6YJUiRyrFWJV
	 KOnrplljXe/GIkinnZ9BpssG5F3mFMH6wl/gDDRKM9KZruMKiEK9+lfFWmMmAKhFnSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brZ9xHfj/WnFeD7kt3B9B589ugJ0PwWi/dKZ88IZvOE=;
	b=RUc9fZk2LpocPbNOYhcmRQCQswFSKSufGryzuLbs8aV9pF/iUtysg53AFOZ5qV6iBSeW
	 EO+z02sCTMWLsDvu68H8joMiUp3owk/lJPl/gmlYAN8uVB9M3mTXXQTQFlmKxznOc5qik
	 vIr8OCJ4cMLqb8QcGHysNapTDDhqWOSaLmSd2op7exypOsj89Tw13dNIPVmqP8S6fEFMK
	 Vvy2wYNHRdVwNsGQdsF4jPzmSfgFQTTl8jv9jWk0WPeRb1gEIxgHnfX73799nCLGzt6uA
	 pvhLMiPP5lLQPcyVH7tWDyowB6HGZJA1SgGg32khReg6ROQPjA92P5VQCh3W5ce9AcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRzL3A4C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C2606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48C2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRzL3A4C
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1725909a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794048011; cv=none;
        d=google.com; s=arc-20260327;
        b=CB6jitbNNOufJtyYP4Ngoh8m2fhLK0bIEYXTkKAzYrbBRJLwOFfRVqnrT26ArMFBxs
         0H/xgXPZUo5/Bzq3m6zbHObHuHlmvreoUFzJ3QovREzHatpoo/tgeT/6RUW/oMynnSys
         zPNBxrFcQxbFZzdkFYIIlsX4HaDSCczMZcnQI3IoEyDWheZNrcFP+bpRvaf+Y+GK9IBc
         qRUTktecH7psC7y1RN/fMoc0F9FORcI3kHwBCUO36rwALBD/rO9LfI0kVe0PEgtoWRFn
         NImsoEsSjB5xiu0ir1PRd/L1K6mtTMLN9NYRmqWynrrN8/LmOS18USkEOiQzKKEmQ/xl
         6Ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brZ9xHfj/WnFeD7kt3B9B589ugJ0PwWi/dKZ88IZvOE=;
        fh=6OaUlKVuE66spwCDkkv77PH9x3OAHY7dD5q9S1mmEr0=;
        b=i127YuXPvQG8pX/m8Y0lPl1zR5wjyLLiQFdC01P1NmtaCfCW2mxeGH14qY6HjwvAM8
         pbLoWjAkIiEFiwa6CFRTbYu8ZQ/vtco4yiPWl5pWpiA/8jqkWo+9SnnUCTkKsNKYkYJc
         3PWPKPhCdDZukKzBCc3Jy6P5S2tDYqVYPMv+/3wW6MKWRyu+VLap+9JxgWnjbc0srWEL
         XN8jti3ZCuoF9dptt9SFoBkt23UojdcINeSsiaL1bcjz20VlGoxS0zWW2gf1rlt9Pe5F
         fj89lzkO2Kos/orJ+cp9NoaS+oXZ2yfTmeoNTwdFEFVG9VTC5YfwviSTGxvghNn6pNen
         s/kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048011; x=1794652811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brZ9xHfj/WnFeD7kt3B9B589ugJ0PwWi/dKZ88IZvOE=;
        b=nRzL3A4CSFh5CyGAIvf8WxmiRFugH7SIWT8NpqlKmJ4nH6eS30KKcyDcYNyKZhE0A6
         ZOGq+PJM6CkEtg+B/qI2br4fKgKDIi6Het5eL0NlC2cIoHu4cOK7fGB2FcEiAKAK+gO6
         Rb+sKg9bCGmlZ6y3J3zvA4JVBd3jB9Jq2xCRNHLAIRrCwyxOEo6m3zBykvTJWBiACDUl
         RFGWjn2hQ51wWrpIFqW3ZPj/jE432OaO5gXuWoCAA8dZGaO/1cPMsb+O0iHMcbxZgmDZ
         rgbk9RpuDUDUKFLaSJqB2R8dcnaERFAOP0+SpME/lb/Kw0waow6cViTr82ulG/TiHbrH
         pi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048011; x=1794652811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brZ9xHfj/WnFeD7kt3B9B589ugJ0PwWi/dKZ88IZvOE=;
        b=i+tlZhhUUk8lXdwmBCq32M/h/e3tGn6FJWwgBsHaUr+DB8mSOA119037RcSfAk1r1Z
         4jLPHimPw+Y/1UOuleUlpQ3Q3yu9dWBsWco7mmSwoPhItlNtlRWLGWjyZ3XUMRSM9E4w
         vddJK31G5hnEiJ1EDbMWPGLC/yzG19jZhhnAeust7Y0YP9JpVbr6HFCCpr+aEk2L+ZKb
         0g+Hk/SB00JrlkTMBq1aU9hFFy57xq4WGW9LKfDl0vpYu6My+4FGEA0UnzfPa5nU7XkG
         YJ09ewGShQjP6749XFeuFpH60IQMSd+2IMh6g7XQ8O+dYuOzCOdD5VrmXm/FskmX/oLP
         9H4Q==
X-Forwarded-Encrypted: i=1; AL+hErEXQqTcJtTSeqI0l3o70Kuwy8E5hY8Te3AevI75FWQYo3cVj+yER2aJmEx2v4ZEJSKP+Uh9fY3bn2vr4cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KKnxfRDnBUTEtv5DC9ChI05mDAOCYwYHmFSMqqCQJUfCKOkSt
	VUiaK/9lGOvsVJsTZPaJ4MBPThgahXw/JpzigtXwN3YGc973iENCmxSJsFILFdkXGk8GNCrokOv
	/zgJJpCVBlMlPQI/cjARbmXy8gV6pAi4=
X-Gm-Gg: AYBFou3sMa+XioqiiVZzTwOiWoLgmVblmx1O8A+kAdGTo4QFVtBkHdHwrHqOKh0Fq8Y
	0oJMyu/Wq6wrvsV3KO3snW5tmFNopkQAMBpzm5p9ZnMmtlHoHRdZZ61hUbvrhKyu/RIas6oOrrJ
	QdpEZpnWGGAhb3J/mC2mzvFWG2j/j72hMNQZCRWQ05fAJdFzfXJC2TCnc07MuOotsbnGdZUnDZa
	gSiwstseXS2M1rfsnJOMYintmkRg9E2dgImO0ARucxeXXySw79kNow+JhYcaarQcGHu13x2pXhI
	FBQ+kpE7EpwTV7GceENrSnpv7WQagwG3ZM1DXJjY5B7cmQ1Ezc72Kize1dfaYcFkp8DJ5Cm+heY
	NdRuBctEmDsurDipWcYbfxa+gsP2Y9AvOUrTHfIKvdVWMnoGMwER/6oIOZ+vR4yo4fOVk
X-Received: by 2002:a05:6402:910:b0:6b6:e808:9701 with SMTP id
 4fb4d7f45d1cf-6b6e8089a74mr2855241a12.1.1794048010791; Sat, 07 Nov 2026
 02:40:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105132220.2233677-1-ridong.chen@linux.dev>
 <20261105132220.2233677-3-ridong.chen@linux.dev> <CAMgjq7DtU+tSOgQWgTaV0obLwkkUwQqgvtTXjG2qf8L+iPXbiQ@mail.gmail.com>
 <57d2a4ca-8edc-4291-a919-8a74abda94a5@linux.dev>
In-Reply-To: <57d2a4ca-8edc-4291-a919-8a74abda94a5@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 7 Nov 2026 18:39:34 +0800
X-Gm-Features: AclHuK-eKiLIC8UvuvG9I4P71PxI9aEIqz8ViP6dfYBZPO6ABCQvdCkjdD8McnM
Message-ID: <CAMgjq7BtS6KKqdq1oVrvrO9FcTEkE4HNJe02dA87n6Zm7FFrww@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] mm/mglru: skip the flags cmpxchg when nothing changes
To: Ridong Chen <ridong.chen@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:44=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev> =
wrote:
>
> On 11/6/2026 12:21 AM, Kairui Song wrote:
> > On Thu, Nov 5, 2026 at 10:11=E2=80=AFPM Ridong Chen <ridong.chen@linux.=
dev> wrote:
> >>
> >> From: Ridong Chen <chenridong@xiaomi.com>
> >>
> >> folio_update_gen() and folio_set_lru_refs() always end with a
> >> try_cmpxchg() on folio->flags, even when the new value equals the old
> >> one. The locked instruction still takes the struct page cacheline in
> >> exclusive state.
> >>
> >> That is common in practice: a folio mapped by many processes is visite=
d
> >> once per mm during a page table walk, and after the first visit it is
> >> already in the youngest generation with refs cleared and PG_workingset
> >> set. isolate_folio() and the eviction paths also call
> >> folio_set_lru_refs(folio, 0) on folios whose refs are already zero.
> >>
> >> Break out of the loop when the flags would not change. The result is
> >> the same as a successful no-op cmpxchg. The only difference is that th=
e
> >> full barrier implied by the locked instruction is gone on that path.
> >> No caller relies on it: the eviction and isolation callers run under
> >> the LRU lock, and the others (page table walks, folio_mark_accessed(),
> >> lru_gen_clear_refs()) only care about the resulting flags value, which
> >> is already in place. Note that lru_gen_inc_refs() already returns
> >> without any atomic when refs is at LRU_REFS_MAX and the folio is in
> >> the workingset.
> >>
> >> Tested on an i7-13700HX with turbo disabled and the performance
> >> governor. N processes map the same 2GiB tmpfs file (huge=3Dnever) and
> >> read every page, then one aging pass is triggered on their memcg
> >> through /sys/kernel/debug/lru_gen ("+ <memcg_id> 0 <max_seq> 200 1").
> >> Time per aging pass in ms, median of 5 runs of 10 passes each, average=
d
> >> over 2 boots of each kernel:
> >>
> >>    processes    base   patched
> >>            1    32.9      31.7   -3.5%
> >>            8   195.1     160.2  -17.9%
> >>           32   755.8     592.2  -21.7%
> >>           64  1597.2    1260.6  -21.1%
> >>
> >> With one process, every visit changes the generation, so there is
> >> nothing to skip. Before the patch, perf annotate attributes 53-58% of
> >> the walk_update_folio() samples to the lock cmpxchg in the inlined
> >> folio_update_gen() in this test.
> >>
> >> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> >> ---
> >>   include/linux/mm_inline.h | 2 ++
> >>   mm/vmscan.c               | 2 ++
> >>   2 files changed, 4 insertions(+)
> >>
> >> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> >> index b3d85fe91385..4ba9079f4dc8 100644
> >> --- a/include/linux/mm_inline.h
> >> +++ b/include/linux/mm_inline.h
> >> @@ -244,6 +244,8 @@ static inline void folio_set_lru_refs(struct folio=
 *folio, unsigned int refs)
> >>          do {
> >>                  new_flags =3D old_flags;
> >>                  lru_set_refs_flags(&new_flags, refs);
> >> +               if (new_flags =3D=3D old_flags)
> >> +                       break;
> >>          } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_=
flags));
> >>   }
> >>
> >> diff --git a/mm/vmscan.c b/mm/vmscan.c
> >> index 50c352e9ffef..3fa76715382d 100644
> >> --- a/mm/vmscan.c
> >> +++ b/mm/vmscan.c
> >> @@ -3398,6 +3398,8 @@ static int folio_update_gen(struct folio *folio,=
 int new_gen, int *type,
> >>                  lru_set_gen_flags(&new_flags, new_gen);
> >>                  lru_set_refs_flags(&new_flags, 0);
> >>                  new_flags |=3D BIT(PG_workingset);
> >> +               if (new_flags =3D=3D old_flags)
> >> +                       break;
> >>          } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_=
flags));
> >
> > Hi Ridong,
> >
> > I had the same idea in V4 of MGLRU-FG which is posted a few weeks ago,
> > with the same code:
> > https://lore.kernel.org/linux-mm/20261016-mglru-fg-v4-4-2106750c0bfa@te=
ncent.com/
> >
> > + if (new_flags =3D=3D old_flags)
> > + break;
> >
>
> Hi Kairui,
>
> Oh. Sorry about that. I read the series a few weeks ago, but as it is lar=
ge
> I missed this change. I should have checked it again before sending.
>
> > I didn't have time to benchmark that one function but the e2e test
> > showed very trivial improvement, it's a good improvement though. Feel
> > free to add:
> >
> > Reviewed-by: Kairui Song <kasong@tencent.com>
> >
>
> Thanks for the Reviewed-by. If you don't mind, I'd suggest merging it as
> a separate patch, as the test shows the benefit of this small change,
> which makes the code easier to trace. I will also mention in the commit
> message that it is a small part of your series. Does that sound OK to
> you?

Sounds good to me! No need to mention that, though; I believe you came
up with this idea by yourself. And that will make the change more
traceable indeed.

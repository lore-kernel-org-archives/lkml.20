Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE397332EA2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372259; cv=fail; b=WYJhWFDn+5DKcVlUWTnxtKrDCZtGYYU1Lx1O4U29P5OoGfpg/uHXN/XAF3swUtQJZPxAJxMudgMjePQjl2pDGMgsQEZEif4wlP2uZbX2BiUJS5ngldRK3zNp5cCpTU49tb4UHBiKfVFGtbkDCmNLKnSZ+Bt/X6hv6YOLAfdKKFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372259; c=relaxed/simple;
	bh=ja06hZRWozrjKmrBxPlahys/wkv+PRDbW4qJDRTZi8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfdCkHQb7BFOFsUQe802rKxp4uvTG6VQG1PH9Ktj9iL1lKutFsaLt7E9l66A2hKiPfBOGSPApELF0CR+mboQCzIdlfYbzXZ1mx7QjDCn6sXe2wYiVjYUk3MWwA5KzvFa1izxOuZIqxuDgoJJpu3iUFMEjxHV+zQq/QLYts3r4jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=WCFguKN3; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="WCFguKN3"
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iEUw800276
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:50:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=NDOIHgRCA92fBXr4xcQP2Sz2dW6sDDwTFYVMg
	oMYlcs=; b=WCFguKN3aEEwflv8ror5uZKo6cmU7rFOYUyrhkHaXhwbfgu/10bre
	/RIqLx6XQ+UfkHiamM4+KrEiC1lluU6TZHEe2VjYHcoaHewvVPaqDqon4tUihXRf
	DzKB4y/+twXTjzgrGKbAihp11yQ2bDHSASDcjU/v4pNk2XUQz8a1R5jkXJzefoeD
	7/DL8aTU7Uqc4PO15WwNgw72HZVFuBGWWDBixr6v6R0NIADx0h4A00KlL4dZEoR6
	PtDTyRr/V+9mKFbdX687c2fMWBJWhVVmg+yiQXPlJrpXIfi9KxmKWFqu0FP6N3of
	7J3S/+7uEydaQ6N+VnHXGaFVFF0Hc2/Sg==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gn48br1c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:50:56 -0700 (PDT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25edb54d22so57852466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789372255; cv=none;
        d=google.com; s=arc-20260327;
        b=rnDrkCEunNR2avntl5UiNoyySnwEshOKbjRWQGfEWm3sZX7KHn+MgRy2+9hpBqfwNp
         ip5cZqCclraAPXGKfx/eBIzLKsAjbssISOwoVGA2mJs/3quNw7C16On53hxuS7Kdog2h
         qvFvNubAXn2MjoD3V3NOyJitQmnXP24lgSPHX1B1o8oXgOw/zf7Otcegd0ZT4Lb3b7+a
         wB26t48eG7iut27tciMA0ZBMTDy95ZoArWAjZqjS2Xbx31bOGXGxsRkVKrIq/2OTDiWw
         nKhg5B0May6Feci7Ik4/HR2MHVZG7hepMNZ6SQlOKbF6+Bh7UgvJSdOF6NeQLtO/t/ht
         X54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=b5IHm3fbXcJn7XNfv0FO+D+UbV/ZMp7hfv/7cooIizg=;
        fh=qirJlND8u9MQXVNUYZn7zYkYaOlMQKezEhHb1Bs0rqs=;
        b=aEG2EJXF0QtxjoJ1XG2Dv6LfOTwVb2XSz1txNOaX01Sg7PnacnyfBFB8f5LuE5Xa7j
         IybCqyPKeJYZNrl3oVfwxSbjr//WedYf3mNqDgur/83Xp8PTmqfpOoIbFZ3694aaco6I
         64k3CEiNrWDDhNE7ORI7vU0NLNmXUzntWX46lNJKbqTVwfjolLoTnL9jSGgzMkCNG6AG
         r2HoBRG8RLX9EFo4KtjY1j/Ry4vA5g82JzyEK+kpWk9iUbnLElbAEvqck77mOTnIoxcI
         mNiJn3L41XvD1073/BajEJs/728/BM8goLPYBJ72qFFghxTW18hadV5jCS9DlhdbsRmo
         IKSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372255; x=1789977055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5IHm3fbXcJn7XNfv0FO+D+UbV/ZMp7hfv/7cooIizg=;
        b=BgM8JlS6wnmqCjePkfaoDTORRZjnuRglVtyzlVH1ijvYdxDHPztRg7Xfau/tZy7Yvd
         Ry7ibSnng+peOie18KRbKZiHYFEY8/leCeHUP4ZUsNOt+tynUBbgmolNFrYMoOee9/eL
         mN5S+VenTZ5Qe6V7gBicYsYaVTpxuq3QfuUB+E7nowqWnauA4jhxQMRrOt2vR0Y+O9j5
         VGOAQMrM3Cs1h8HhzoLP4ETksS9ZX/ANqxewm/J/8gERJT0MKhL4P/mxbH9VCRRuFi4I
         vttf8DTPCVdiCRzXyH6awy2XLfFehT6gtWVcUHHAUKfzRXqVY2UATHiqnxCWD5cXh1G9
         gBPg==
X-Forwarded-Encrypted: i=1; AKwUvBwiYPfb88CztJQ0zOgJH4hZ00hGm4NKVZsNVhGIoiK+iI8bpfhTIZ5e3bJt4ZnwYaEQTAajD7dKuaj0QYg=@vger.kernel.org
X-Gm-Message-State: AFuF++nkqswHNitDV3IrZBS9xerLaoc74AhkKc5yZCRZrXU0fYmg19Iy
	+WRKP1yC1Qmfqv7jvdJiBl/tQhiVl2VOkLwV3Dw7DDcoPa5hukgcupQaUyY/bysXoB6heiJTSYY
	u/UNAuXE8h5wpLBa3VOZ99vcHjWSeLGt5Hv0Z2/ReQCF94Fktic5ovOTo+XO5y9K+ePnqBATvV6
	qAOFFneOFaF46Xwj24sYi+hZxM+YRfs0V9N3B8rTw=
X-Gm-Gg: AYBFou3sB4+c8hIoAQgcEnQOSkWf/P4TtqaFof0HVIKBO6Ke282szNicj5GHIC5joic
	uFAt6ob7EiCzKQ+bn1VDh2yv5VylUGQ+peJMvqm6f9Higritl1vLcULonRQH40l1eewTH6izo3V
	kjx7Gcm6hRmJGsc+QZVdaCbjlZOof8v2tiFBIt+IR2GyGMrvP9AZMBLMGr4JpbVuoMPf4Fr6y2j
	4POts+5DLyQ5pmrnQ==
X-Received: by 2002:a17:907:c18:b0:c25:8e53:45ca with SMTP id a640c23a62f3a-c29b87655b6mr140823766b.21.1789372255326;
        Mon, 14 Sep 2026 00:50:55 -0700 (PDT)
X-Received: by 2002:a17:907:c18:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c29b87655b6mr140819366b.21.1789372254932; Mon, 14 Sep 2026
 00:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911121341.178028-1-alex@ghiti.fr> <20260911121341.178028-3-alex@ghiti.fr>
 <CAGsJ_4z3bSfMTKvkXsKAz=+dzhmdGOerSfL33t2RkN0CXZV-hw@mail.gmail.com>
In-Reply-To: <CAGsJ_4z3bSfMTKvkXsKAz=+dzhmdGOerSfL33t2RkN0CXZV-hw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 14 Sep 2026 09:50:43 +0200
X-Gm-Features: AcwNN1U5dS5EtcARkFGKnblzleHf1kNpbwhWpFFrqeypIiGrF-7Hdyx4M88AHOc
Message-ID: <CAEmasaX64UPFX=OTQ6pC_XqjMqiuj+fD76-7TFWBaZFE+LODew@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mm: swap: drop dropbehind swap cache folios on
 writeback completion
To: Barry Song <baohua@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kairui Song <ryncsn@gmail.com>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jan Kara <jack@suse.cz>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Youngjun Park <youngjun.park@lge.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        Michal Hocko <mhocko@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Wei Xu <weixugc@google.com>, Yuanchu Xie <yuanchu@google.com>,
        Kunwu Chan <kunwu.chan@gmail.com>, Tal Zussman <tz2294@columbia.edu>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JMCuIMKb c=1 sm=1 tr=0 ts=6aa7a760 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ufHFDILaAAAA:8 a=TYz18Bk7nizorY65d84A:9
 a=QEXdDO2ut3YA:10 a=PsfoTyiJ_72bb7xyA04f:22 a=ZmIg1sZ3JBWsdXgziEIF:22
X-Proofpoint-GUID: _Y3LFU0RRBAtpmfukGgKa_ZhogSCc_-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX/baODt+z7ahb
 1t0fmtP+Wy0erXFiL/2DxdCHcggZBIf2eJ3Zg6rykCkvXVYNxqBgD31iogrOgKIjMGA1hqvBlLY
 LTi6eDRYXtXta5W1LPeG7n/IgNQNjlE=
X-Proofpoint-ORIG-GUID: _Y3LFU0RRBAtpmfukGgKa_ZhogSCc_-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfXy8glQ9Wc/hJY
 /oBc6kH5vhdzbSrFPntME7dsaZK1iNaZ6HMcMfKVw+541mVc0kCGEfWIgXfC0xQxVtR6dlJOFnq
 1kxhe5DFmpDh1fxZ7VJ704Y7as7k9J2Qlxj9KDy+DFaet2+TQlGpo5UExjqxuoraVtorZ7+/M5f
 KrHOGY76nXeY7Qu26EHJMi91tI2F7MJCoILGFi+FpH7eOGOqIBLSeJeTeZSEF32DFE+NQ0ixnup
 nRAmh3ObyzN5aPv5KQ8eYhu0IS9Catz4gc2G+T5g5tdDHwqdFe602kBnZEY3tVQQJjcea1Mhlc2
 g6Q8EGYE7tkIPSAI5D/KwQJ73W7m59OPYHOfqXcj4Wmz9SYINONkp60tqOVTDtOALLLySjXE6GU
 t+q7aneetDcWIDVXfk3XVW5feHBgwDSJGniCNdjAeVu1K7CRjcA/XhWzuuLo4V7lmeT7ew5g1Z7
 0xKmwS6oqpQUMJTTd+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01

Hi Barry,

On Mon, Sep 14, 2026 at 1:01=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> >
> On Fri, Sep 11, 2026 at 8:16=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > A PG_dropbehind folio is dropped from its cache once writeback completes
> > rather than left for reclaim to find later; this is implemented for file
> > folios in folio_end_dropbehind(). Extend it to swap cache folios.
> >
> > The drop takes the folio and swap cluster locks and may sleep, so it
> > cannot run in interrupt context. Set BIO_COMPLETE_IN_TASK on the write,
> > as the file dropbehind paths do, and drop the folio directly from
> > folio_end_writeback().
> >
> > Suggested-by: Yosry Ahmed <yosry@kernel.org>
> > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> [...]
>
> > diff --git a/mm/page_io.c b/mm/page_io.c
> > index 88962571cb93..52eae99de6e3 100644
> > --- a/mm/page_io.c
> > +++ b/mm/page_io.c
> > @@ -602,6 +602,15 @@ static void swap_bdev_submit_write(struct swap_io_=
ctx *ctx)
> >                 submit_bio_wait(bio);
> >                 end_swap_bio_write(bio);
> >         } else {
> > +               int p;
> > +
> > +               for (p =3D 0; p < sio->nr_bvecs; p++) {
> > +                       if (folio_test_dropbehind(bvec_folio(&sio->bvec=
s[p]))) {
> > +                               bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
>
> Thanks very much, Alexandre. I find the code is really much,
> much better, but I=E2=80=99m still struggling to understand why we need a
> sleepable context after Wenjian=E2=80=99s commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=3D=
848d2ce2fce15fbdc083fbf9691bfa72911033c4
>
> With this question:
>
> https://lore.kernel.org/linux-mm/CAGsJ_4wj6XvPB+QF+_X1BJ_8Y2sZEEFAw6RaJJz=
-cHaDWLkxaQ@mail.gmail.com/T/#u
>
> In short, it still feels a little strange to me that we need a
> sleepable context, especially now that we no longer call
> `folio_unmap_invalidate()` for unmapped folios.

The thing is the zswap writeback folios are not on lru: that's because
if we put them on lru at allocation, the perpcu lru cache holds a
reference and it prevents remove_mapping() from freeing the folio (I
measured that with on-lru folios, the freed rate collapses from 99.9%
to ~3%).

So if we use the folio_trylock() approach, we'd need to put the folio
back on lru otherwise it would be "lost". But I don't think we can do
that while someone else holds the folio lock.

That's why I use folio_lock() which can sleep and then needs the
sleepable context.

What do you think?

Thanks,

Alex

>
> Best Regards
> Barry
>
